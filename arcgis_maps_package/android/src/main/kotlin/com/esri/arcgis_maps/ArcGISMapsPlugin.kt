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

import android.app.Activity
import android.app.Application
import android.os.Bundle
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.LifecycleRegistry

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/**
 * An ActivityAware ArcGISMaps Plugin provides callback hooks that expose access to an associated
 * Activity and its Lifecycle for the Platform MapView component.
 */
class ArcGISMapsPlugin: FlutterPlugin, ActivityAware {
  private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

  override fun onAttachedToEngine(
    flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    this.flutterPluginBinding = flutterPluginBinding
    this.setApkPath()
  }

  override fun onDetachedFromEngine(
    binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    flutterPluginBinding
      .platformViewRegistry
      .registerViewFactory(
        GeoViewTypeId,
        ArcGISMapsFactory(
          flutterPluginBinding.binaryMessenger, ProxyLifecycleProvider(binding.activity)
        )
      )
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

  companion object {
    const val GeoViewTypeId = "com.esri.GeoView"
    init {
      System.loadLibrary("arcgis_maps")
    }
  }

  private fun setApkPath() {
    val context = this.flutterPluginBinding.applicationContext
    val apkPath = context.applicationInfo.sourceDir
    RT_ArcGISRuntimeEnvironment_setAndroidAPKPath(apkPath)
  }
}

class ProxyLifecycleProvider(
  private val trackedActivity: Activity
): Application.ActivityLifecycleCallbacks, LifecycleOwner {
  private val registrarActivityHashCode: Int = trackedActivity.hashCode()
  override val lifecycle = LifecycleRegistry(this)

  init {
    trackedActivity.application.registerActivityLifecycleCallbacks(this)
  }

  override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
    handleLifeCycleChange(activity, Lifecycle.Event.ON_CREATE)
  }

  override fun onActivityStarted(activity: Activity) {
    handleLifeCycleChange(activity, Lifecycle.Event.ON_START)
  }

  override fun onActivityResumed(activity: Activity) {
    handleLifeCycleChange(activity, Lifecycle.Event.ON_RESUME)
  }

  override fun onActivityPaused(activity: Activity) {
    handleLifeCycleChange(activity, Lifecycle.Event.ON_PAUSE)
  }

  override fun onActivityStopped(activity: Activity) {
    handleLifeCycleChange(activity, Lifecycle.Event.ON_STOP)
  }

  override fun onActivitySaveInstanceState(activity: Activity, bundle: Bundle) {
  }

  override fun onActivityDestroyed(activity: Activity) {
    handleLifeCycleChange(activity, null) {
      activity.application.unregisterActivityLifecycleCallbacks(this)
      lifecycle.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    }
  }

  private fun handleLifeCycleChange(activity: Activity, event: Lifecycle.Event? = null, update: (() -> Unit)? = null) {
    if (activity.hashCode() != registrarActivityHashCode) {
      return
    }
    if (event != null) {
      lifecycle.handleLifecycleEvent(event)
    } else {
      if (update != null) {
        update()
      }
    }
  }
}

external fun RT_ArcGISRuntimeEnvironment_setAndroidAPKPath(apkPath: String)
