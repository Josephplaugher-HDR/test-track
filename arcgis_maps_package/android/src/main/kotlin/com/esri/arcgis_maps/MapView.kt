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

import android.content.Context
import android.util.AttributeSet
import android.view.TextureView
import android.widget.FrameLayout
import androidx.annotation.Keep
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner

import com.esri.arcgis_maps.ArcGISMapsPlugin.Companion.GeoViewTypeId
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.concurrent.atomic.AtomicBoolean

/**
 * A view to render the 2D geographic content on a TextureView.
 *
 * @param context the Application Context
 * @param id the method channel unique identifier
 * @param messenger a BinaryMessenger object that facilitates communication between the view
 * and ArcGISMap Widget code.
 * @param attrs a set of attributes defined in XML that are applied to the view.
 */
class MapView(
    context: Context,
    id: Int,
    messenger: BinaryMessenger,
    attrs: AttributeSet?
): FrameLayout(context, attrs), MethodCallHandler, DefaultLifecycleObserver {

    private val methodChannel: MethodChannel
    private var textureView: TextureView
    private val mapviewRenderer: MapViewRenderer

    private var eglReady = false
    private var geoViewReady: Long = 0
    private var geoViewHandle: Long = 0
    private var deviceHandle: Long = 0
    private var handleCreated = AtomicBoolean(false)

    init {
        methodChannel = MethodChannel(messenger, "${GeoViewTypeId}/$id")
        methodChannel.setMethodCallHandler(this)
        textureView = TextureView(context)
        mapviewRenderer = MapViewRenderer(this)
        textureView.surfaceTextureListener = mapviewRenderer
        addView(textureView)
    }

    constructor(context: Context,
                id: Int,
                messenger: BinaryMessenger,
    ): this(context, id, messenger, null)

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        val count = super.getChildCount()

        for (i in 0 until count) {
            val child = getChildAt(i)
            if (child.visibility != GONE) {
                val childLeft = paddingLeft
                val childTop = paddingTop
                child.layout(
                    childLeft,
                    childTop,
                    childLeft + child.measuredWidth,
                    childTop + child.measuredHeight
                )
            }
        }
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val count = childCount
        var maxHeight = 0
        var maxWidth = 0
        for (i in 0 until count) {
            val child = getChildAt(i)
            if (child.visibility != GONE) {
                measureChild(child, widthMeasureSpec, heightMeasureSpec)
            }
        }
        maxWidth += paddingLeft + paddingRight
        maxHeight += paddingTop + paddingBottom
        setMeasuredDimension(
            resolveSize(maxWidth, widthMeasureSpec),
            resolveSize(maxHeight, heightMeasureSpec)
        )
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "ping" -> result.success("pong")
            "initializeGeoView" -> {
                val geoViewHandle = methodCall.arguments as Long? ?: 0
                geoViewReady(geoViewHandle)
                result.success(true)
            }
            "geoViewDestroyed" -> {
                // unused -- teardown handled in dispose()
                result.success(true)
            }
            "magnifierEnabledChanged" -> {
                // unused -- no special handling needed
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }

    private fun geoViewReady(geoViewHandle: Long) {
        geoViewReady = geoViewHandle
        checkInitializeGeoView()
    }

    fun eglReady(glesVersion: Int) {
        RT_ArcGISRuntimeEnvironment_setCustomOpenglLibFilename("libGLESv$glesVersion.so")
        RT_ArcGISRuntimeEnvironment_setCustomEglLibFilename("libEGL.so")
        eglReady = true
        checkInitializeGeoView()
    }

    private fun checkInitializeGeoView() {
        // geoView and egl might get initialized in either order, so we need to wait for both
        if (geoViewReady == 0L || !eglReady) {
            return
        }

        if (handleCreated.compareAndSet(false, true)) {
            geoViewHandle = geoViewReady
            deviceHandle = RT_Device_createOGL()
            setDrawRequestedCallback(geoViewHandle, this)
            resume()

            resize(mapviewRenderer.getSurfaceWidth(), mapviewRenderer.getSurfaceHeight())
            hasValidSize()
        }
    }

    @Keep // prevent this method from being removed in release builds (it is called via JNI)
    fun onDrawRequested() {
        mapviewRenderer.draw()
    }

    fun dispose() {
        if (eglReady) {
            pause(GraphicsHardwareResources.Recycle)
        }

        if (handleCreated.compareAndSet(true, false)) {
            clearDrawRequestedCallback(geoViewHandle)
            RT_Device_destroy(deviceHandle)
            deviceHandle = 0
            geoViewHandle = 0
        }
        mapviewRenderer.dispose()
    }

    override fun onCreate(owner: LifecycleOwner) {
        super.onCreate(owner)
    }

    override fun onResume(owner: LifecycleOwner) {
        mapviewRenderer.resume(textureView)
        super.onResume(owner)
    }

    override fun onPause(owner: LifecycleOwner) {
        mapviewRenderer.pause()
        super.onPause(owner)
    }

    override fun onDestroy(owner: LifecycleOwner) {
        dispose()
        super.onDestroy(owner)
    }

    internal fun draw() {
        checkAndRun {
            RT_GeoView_draw(geoViewHandle, deviceHandle)
        }
    }

    internal fun hasValidSize() {
        checkAndRun {
            RT_GeoView_hasValidSize(geoViewHandle)
        }
    }

    internal fun pause(resources: GraphicsHardwareResources) {
        checkAndRun {
            RT_GeoView_pause(geoViewHandle, deviceHandle, resources.ordinal)
        }
    }

    internal fun pulse() {
        checkAndRun {
            RT_GeoView_pulse(geoViewHandle)
        }
    }
    internal fun resize(width: Int, height: Int) {
        checkAndRun {
            RT_GeoView_resize(geoViewHandle, width, height)
        }
    }

    internal fun resume() {
        checkAndRun {
            RT_GeoView_resume(geoViewHandle, deviceHandle)
        }
    }

    private fun checkAndRun(nativeCall: () -> Unit) {
        if (handleCreated.get()) {
            nativeCall()
        }
    }

    internal enum class GraphicsHardwareResources(val resources: Int) {
        Recycle(0),
        Save(1)
    }

    companion object {
        private external fun nativeInit()

        init {
            nativeInit()
        }
    }
}

external fun RT_ArcGISRuntimeEnvironment_setCustomEglLibFilename(eglLibraryFilename: String)
external fun RT_ArcGISRuntimeEnvironment_setCustomOpenglLibFilename(openglLibraryFilename: String)

external fun RT_Device_createOGL(): Long
external fun RT_Device_destroy(deviceHandle: Long)

external fun RT_GeoView_draw(geoViewHandle: Long, deviceHandle: Long)
external fun RT_GeoView_hasValidSize(geoViewHandle: Long)
external fun RT_GeoView_pause(geoViewHandle: Long, deviceHandle: Long, graphicsHardwareResources: Int)
external fun RT_GeoView_pulse(geoViewHandle: Long)
external fun RT_GeoView_resize(geoViewHandle: Long, width: Int, height: Int)
external fun RT_GeoView_resume(geoViewHandle: Long, deviceHandle: Long)

external fun setDrawRequestedCallback(geoViewHandle: Long, mapView: MapView)
external fun clearDrawRequestedCallback(geoViewHandle: Long)
