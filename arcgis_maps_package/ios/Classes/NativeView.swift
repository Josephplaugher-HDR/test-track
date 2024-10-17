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

import Flutter
import MetalKit
import UIKit

final class NativeView: NSObject, FlutterPlatformView {
    private let mtkView: MetalView
    private let methodChannel: FlutterMethodChannel
    private var commandQueue: MTLCommandQueue?
    
    private var geoViewHandle: UnsafeMutableRawPointer!
    private var deviceHandle: UnsafeMutableRawPointer!
    private var hasValidSize = false
    
    typealias ProxyCallback = () -> Void

    private let callbackContext = CallbackContext<ProxyCallback>()
    
    func view() -> UIView {
        return mtkView
    }
    
    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger) {
        mtkView = MetalView(frame: frame)
        mtkView.depthStencilPixelFormat = .depth32Float_stencil8
        mtkView.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
        // The metal view's content is composited onto the background color.
        // Setting the background color to clear allows what's behind the metal
        // view (such as the background of the parent view) to show through when
        // the metal view has transparent content.
        mtkView.backgroundColor = .clear
        
        methodChannel = FlutterMethodChannel(
            name: "com.esri.GeoView/\(viewId)",
            binaryMessenger: messenger,
            codec: FlutterStandardMethodCodec.sharedInstance()
        )
        
        super.init()
        
        mtkView.delegate = self
        mtkView.onDisplayScaleChanged = { [methodChannel] displayScale in
            methodChannel.invokeMethod(
                "screenScaleChanged",
                arguments: Double(displayScale)
            )
        }

        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIScene.willEnterForegroundNotification, object: nil)

        methodChannel.setMethodCallHandler(onMethodCall)
    }
    
    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case "ping":
            result("pong")
        case "initializeGeoView":
            if let rawGeoView = call.arguments as? Int {
                initializeDevice()
                initializeGeoView(rawGeoView: rawGeoView)
            }
            result(true)
        case "geoViewDestroyed":
            deinitializeGeoView()
            deinitializeDevice()
            result(true)
        case "magnifierEnabledChanged":
            if let enabled = call.arguments as? Bool {
                // Toggling framebufferOnly is necessary to draw the magnifier, but comes at a
                // performance cost. Therefore we only set it when the magnifier is enabled.
                mtkView.framebufferOnly = !enabled
            }
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func initializeDevice() {
        if let device = MTLCreateSystemDefaultDevice(),
           let commandQueue = device.makeCommandQueue() {
            mtkView.device = device
            self.commandQueue = commandQueue
            deviceHandle = RT_Device_createMetal(
                Unmanaged.passUnretained(device).toOpaque(),
                Unmanaged.passUnretained(commandQueue).toOpaque(),
                Unmanaged.passUnretained(mtkView).toOpaque(),
                nil);
        }
    }
    
    func deinitializeDevice() {
        RT_Device_destroy(deviceHandle, nil)
        deviceHandle = nil
    }
    
    func initializeGeoView(rawGeoView: Int) {
        geoViewHandle = .init(bitPattern: rawGeoView)
        
        initializeGeoViewDestroyed()
        initializeDrawRequested()
    }
    
    func deinitializeGeoView() {
        deinitializeGeoViewDestroyed()
        deinitializeDrawRequested()
        
        geoViewHandle = nil
    }
    
    func initializeGeoViewDestroyed() {
        // Hot Restart bypasses dispose() but still calls NativeFinalizers. If we get a GeoViewDestroyed
        // callback, we need to shut down directly and not wait for a message from the methodChannel.
        let callback: @convention(c) (UnsafeMutableRawPointer?) -> Void = { context in
            guard let context else { return }
            let selfContext = Unmanaged<NativeView>.fromOpaque(context).takeUnretainedValue()
            DispatchQueue.main.sync {
                selfContext.deinitializeGeoView()
                selfContext.deinitializeDevice()
            }
        }
        let context = Unmanaged.passUnretained(self).toOpaque()
        setGeoViewDestroyedCallback(geoViewHandle, callback, context)
    }
    
    func deinitializeGeoViewDestroyed() {
        setGeoViewDestroyedCallback(geoViewHandle, nil, nil)
    }
    
    func initializeDrawRequested() {
        let callback: @convention(c) (UnsafeMutableRawPointer?) -> Void = { context in
            guard let context else { return }
            let callbackContext = Unmanaged<CallbackContext<ProxyCallback>>.fromOpaque(context).takeUnretainedValue()
            callbackContext.proxy?()
        }
        callbackContext.proxy = { [weak self] in
            guard let self else { return }
            self.onDrawRequested()
        }
        let context = Unmanaged.passUnretained(callbackContext).toOpaque()
        RT_GeoView_setDrawRequestedCallback(geoViewHandle, callback, context, nil)
        runtimeResume()
    }
    
    func deinitializeDrawRequested() {
        runtimePause(resources: .recycle);
        RT_GeoView_setDrawRequestedCallback(geoViewHandle, nil, nil, nil)
        callbackContext.proxy = nil
    }
    
    @objc func didEnterBackground() {
        runtimePause(resources: .save);
    }
    
    @objc func willEnterForeground() {
        runtimeResume();
    }
    
    func onDrawRequested() {
        runtimeDraw()
        if let commandBuffer = commandQueue?.makeCommandBuffer(),
           let drawable = mtkView.currentDrawable {
            commandBuffer.present(drawable)
            commandBuffer.commit()
        }
    }
    
    func runtimeDraw() {
        guard let geoViewHandle,
              let deviceHandle else {
            return
        }
        RT_GeoView_draw(geoViewHandle, deviceHandle, nil)
    }
    
    func runtimePause(resources: RT_GraphicsHardwareResources) {
        guard let geoViewHandle,
              let deviceHandle else {
            return
        }
        RT_GeoView_pause(geoViewHandle, deviceHandle, resources, nil)
    }
    
    func runtimePulse() {
        guard hasValidSize,
              let geoViewHandle else {
            return
        }
        RT_GeoView_pulse(geoViewHandle, nil)
    }
    
    func runtimeResize(width: Int32, height: Int32) {
        guard let geoViewHandle else { return }
        RT_GeoView_resize(geoViewHandle, width, height, nil)
    }
    
    func runtimeResume() {
        guard let geoViewHandle,
              let deviceHandle else {
            return
        }
        RT_GeoView_resume(geoViewHandle, deviceHandle, nil)
    }
    
    func runtimeHasValidSize() {
        guard !hasValidSize,
              let geoViewHandle else {
            return
        }
        hasValidSize = true
        RT_GeoView_hasValidSize(geoViewHandle, nil)
    }
}

extension NativeView: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        let width = Int32(exactly: size.width.rounded(.up)) ?? 0
        let height = Int32(exactly: size.height.rounded(.up)) ?? 0
        guard width > 0 && height > 0 else { return }

        runtimeResize(width: width, height: height)
        runtimeHasValidSize()
    }
    
    func draw(in view: MTKView) {
        runtimePulse()
    }
}
