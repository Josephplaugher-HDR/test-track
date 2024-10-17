//
// COPYRIGHT © 2023 Esri
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// This material is licensed for use under the Esri Master
// Agreement (MA) and is bound by the terms and conditions
// of that agreement.
//
// You may redistribute and use this code without modification,
// provided you adhere to the terms and conditions of the MA
// and include this copyright notice.
//
// See use restrictions at http://www.esri.com/legal/pdfs/mla_e204_e300/english
//
// For additional information, contact:
// Environmental Systems Research Institute, Inc.
// Attn: Contracts and Legal Department
// 380 New York Street
// Redlands, California 92373
// USA
//
// email: legal@esri.com
//

package com.esri.arcgis_maps

import android.graphics.SurfaceTexture
import android.opengl.EGL14
import android.opengl.EGLConfig
import android.opengl.EGLContext
import android.opengl.EGLDisplay
import android.opengl.EGLSurface
import android.opengl.GLES20
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Choreographer
import android.view.TextureView

import java.util.concurrent.atomic.AtomicBoolean

/**
 * The class creates the OpenGLES context, renders the view, and handles view lifecycle changes,
 * including resizing and disposing of the view, etc.
 */
internal class MapViewRenderer(
    private val mapView: MapView
): TextureView.SurfaceTextureListener, Choreographer.FrameCallback {

    private var surfaceTexture: SurfaceTexture? = null
    private var surfaceWidth: Int = 0
    private var surfaceHeight: Int = 0
    private var eglSurface: EGLSurface? = null
    private var eglDisplay: EGLDisplay = EGL14.EGL_NO_DISPLAY
    private var eglContext: EGLContext? = null

    // all the interaction with EGL and OpenGL should be happening on the same thread
    // which the context was created.
    private val handler: Handler = Handler(Looper.getMainLooper())

    private val isDisposed = AtomicBoolean(false)
    private val isEglInitialized = AtomicBoolean(false)
    private val isInitializationComplete = AtomicBoolean(false)

    // Atomic value is used for the paused by user flag since it is set and got on various threads.
    // Mainly UI thread and the rendering thread
    private val isPausedByUser = AtomicBoolean(false)

    // Atomic value is used for a flag to indicate the pulse is running. Will be accessed from various
    // threads - mainly UI thread and the rendering thread
    private val isPulsing = AtomicBoolean(false)
    private val configs = arrayOfNulls<EGLConfig>(1)

    /**
     * Determines if the necessary conditions exist to allow a pulse e.g. not manual rendering, not
     * paused or disposed etc.
     *
     * @return true if it is ok to pulse
     */
    private val isOkToPulse: Boolean
        get() = !isDisposed.get() && isPulsing.get() && !isPausedByUser.get()

    fun getSurfaceWidth(): Int {
        return surfaceWidth
    }

    fun getSurfaceHeight(): Int {
        return surfaceHeight
    }

    /**
     * Draws the view and then swaps the buffers so that the image appears on the screen.
     */
    fun draw() {
        EGL14.eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext)
        mapView.draw()
        EGL14.eglSwapBuffers(eglDisplay, eglSurface)
    }

    /**
     * Disposed the view. Disposing must run on the rendering thread which is accomplished by posting
     * quiting the looper and then the clean up code runs in [.run].
     */
    fun dispose() {
        if (isDisposed.compareAndSet(false, true)) {
            stopPulse()
            disposeEgl()
        }
    }

    /**
     * Dispose the EGL objects.
     */
     private fun disposeEgl() {
        if (isInitializationComplete.get()) {
            // Android is unusual in that it uses a reference-counted EGLDisplay. So for
            // every eglInitialize() we need an eglTerminate().
            EGL14.eglMakeCurrent(
                eglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE,
                EGL14.EGL_NO_CONTEXT
            )
            EGL14.eglDestroyContext(eglDisplay, eglContext)
            EGL14.eglReleaseThread()
            EGL14.eglTerminate(eglDisplay)
            EGL14.eglDestroySurface(eglDisplay, eglSurface)
            eglSurface = EGL14.EGL_NO_SURFACE

            eglDisplay = EGL14.EGL_NO_DISPLAY
            eglContext = EGL14.EGL_NO_CONTEXT
            Log.i(TAG, "Egl objects disposed")
        }
    }

    /**
     * Pauses rendering by stopping pulsing the view.
     */
    fun pause() {
        if (isPausedByUser.compareAndSet(false, true)) {
            handler.post {
                mapView.pause(MapView.GraphicsHardwareResources.Save)
                stopPulse()
            }
        }
    }

    /**
     * Resumes rendering by starting to pulse the view as long as there is a valid texture view. If
     * the texture view is not valid we're assuming that it is being recreated and will subsequently
     * become valid at which point rendering can begin again.
     *
     * @param textureView the texture view that rendering should happen on
     */
    fun resume(textureView: TextureView) {
        if (isPausedByUser.compareAndSet(true, false)) {
            Log.i(TAG, "Resumed by user. Texture view available: " + textureView.isAvailable)
            handler.post {
                mapView.resume()
                // Resume pulsing only if there is a surface available. If the surface is
                // not yet available rendering will begin once the surface is ready.
                if (textureView.isAvailable) {
                    startPulse()
                }
            }
        }
    }

    override fun onSurfaceTextureAvailable(
        surfaceTexture: SurfaceTexture,
        width: Int,
        height: Int
    ) {
        this.surfaceTexture = surfaceTexture
        surfaceWidth = width
        surfaceHeight = height
        handler.post {
            val surfaceAttribs = intArrayOf(
                EGL14.EGL_NONE
            )
            // since the surface could be destroyed and recreated by the system make sure the
            // initialization that doesn't rely on the surface is done only once e.g. context creation
            // and library loading
            if (!isEglInitialized.getAndSet(true)) {
                // create context
                eglDisplay = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY)
                check(eglDisplay !== EGL14.EGL_NO_DISPLAY) { "unable to get EGL14 display" }
                val version = IntArray(2)
                if (!EGL14.eglInitialize(eglDisplay, version, 0, version, 1)) {
                    eglDisplay = EGL14.EGL_NO_DISPLAY
                    throw IllegalStateException("unable to initialize EGL14")
                }

                // Required OpenGLES attributes are based on the C API's rendering requirements.
                val attribList = intArrayOf(
                    EGL14.EGL_RED_SIZE, 8,
                    EGL14.EGL_GREEN_SIZE, 8,
                    EGL14.EGL_BLUE_SIZE, 8,
                    EGL14.EGL_ALPHA_SIZE, 8,
                    EGL14.EGL_DEPTH_SIZE, 24,
                    EGL14.EGL_STENCIL_SIZE, 8,
                    EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
                    EGL14.EGL_NONE
                )
                var glesVersion = 2
                val numConfigs = IntArray(1)
                val attributeListVersion2 = intArrayOf(
                    EGL14.EGL_CONTEXT_CLIENT_VERSION, 2,
                    EGL14.EGL_NONE
                )
                if (EGL14.eglChooseConfig(
                        eglDisplay,
                        attribList,
                        0,
                        configs,
                        0,
                        configs.size,
                        numConfigs,
                        0
                    )
                ) {
                    eglContext = EGL14.eglCreateContext(
                        eglDisplay, configs[0], EGL14.EGL_NO_CONTEXT,
                        attributeListVersion2, 0
                    )
                    if (eglContext === EGL14.EGL_NO_CONTEXT) {
                        throw IllegalStateException("Unable to create context: " +
                                "eglCreateContext failed for OpenGLES version 2")
                    }

                    eglSurface = EGL14.eglCreateWindowSurface(
                        eglDisplay,
                        configs[0],
                        surfaceTexture,
                        surfaceAttribs,
                        0
                    )
                    EGL14.eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext)
                    val openGlVersion = GLES20.glGetString(GLES20.GL_VERSION)
                    EGL14.eglMakeCurrent(
                        eglDisplay,
                        EGL14.EGL_NO_SURFACE,
                        EGL14.EGL_NO_SURFACE,
                        EGL14.EGL_NO_CONTEXT
                    )
                    if (openGlVersion.startsWith("OpenGL ES 3")) {
                        // destroy the OpenGL 2.0 context
                        EGL14.eglDestroyContext(eglDisplay, eglContext)

                        // create an OpenGL ES 3 context
                        val attributeListVersion3 = intArrayOf(
                            EGL14.EGL_CONTEXT_CLIENT_VERSION, 3,
                            EGL14.EGL_NONE
                        )
                        eglContext = EGL14.eglCreateContext(
                            eglDisplay, configs[0], EGL14.EGL_NO_CONTEXT,
                            attributeListVersion3, 0
                        )
                        if (eglContext === EGL14.EGL_NO_CONTEXT) {
                            throw IllegalStateException("Unable to create context: " +
                                    "eglCreateContext failed for OpenGLES version 3")
                        }
                        glesVersion = 3
                    }
                } else {
                    throw IllegalStateException("eglChooseConfig failed to return a config")
                }

                mapView.eglReady(glesVersion)
            } else {
                // We created a window surface when creating the context but every time a surface becomes
                // available (e.g. possible when the app is brought from the background) a new window
                // surface has to be created but it uses the same context and display as was created for
                // the first surface.
                eglSurface = EGL14.eglCreateWindowSurface(
                    eglDisplay,
                    configs[0],
                    surfaceTexture,
                    surfaceAttribs,
                    0
                )
            }
            if (!isPausedByUser.get()) {
                startPulse()
            }
            isInitializationComplete.set(true)
        }
    }

    override fun onSurfaceTextureSizeChanged(
        surfaceTexture: SurfaceTexture,
        width: Int,
        height: Int
    ) {
        surfaceWidth = width
        surfaceHeight = height

        // when the width or height of the surface is zero we need to stop pulsing the core
        // until the size becomes valid again
        if (width <= 0 || height <= 0) {
            stopPulse()
        } else {
            mapView.resize(width, height)
            mapView.resume()
            startPulse()
            // When the surface is resized, we force the core drawing immediately to update the view.
            if (isOkToPulse) {
                handler.post { draw() }
            }
        }
    }

    override fun onSurfaceTextureDestroyed(surfaceTexture: SurfaceTexture): Boolean {
        if (!isDisposed.get()) {
            // surface is being destroyed but we aren't disposing the view
            // so we need to stop pulsing to avoid any further drawing calls
            stopPulse()
        }

        // Returning true means that the surface texture can be released immediately. We assume that
        // no rendering can happen inside this surface texture after this method returns.
        return true
    }

    override fun onSurfaceTextureUpdated(surfaceTexture: SurfaceTexture) {}

    override fun doFrame(l: Long) {
        if (isOkToPulse) {
            Choreographer.getInstance().postFrameCallback(this)
            mapView.pulse()
        }
    }

    /**
     * Starts pulsing the RTC by adding a frame callback.
     * This method doesn't check that surface is available to draw to so only call this method if
     * you know the surface is ready e.g. at the end of a successful
     * [.onSurfaceTextureAvailable] or a call to
     * [.resume] where an available texture is indicated. Pulsing will only
     * start if [.isOkToPulse] is true.
     */
    private fun startPulse() {
        if (isPulsing.compareAndSet(false, true)) {
            handler.post {
                if (isOkToPulse) {
                    Log.i(TAG, "Starting pulse")
                    Choreographer.getInstance().postFrameCallback(this@MapViewRenderer)
                }
            }
        }
    }

    /**
     * Stops pulsing the RTC by removing the frame callback. Since this method posts to the rendering
     * thread it is assumed that removing the callback and adding a new callback (see
     * [.doFrame]) cannot be interleaved since they all run on the render thread so it
     * shouldn't be possible for a callback to be re-added until [.startPulse] is called.
     */
    private fun stopPulse() {
        if (isPulsing.compareAndSet(true, false)) {
            handler.post {
                Log.i(TAG, "Stopping pulse")
                Choreographer.getInstance().removeFrameCallback(this@MapViewRenderer)
            }
        }
    }

    companion object {
        const val TAG = "MapViewRenderer"
    }
}
