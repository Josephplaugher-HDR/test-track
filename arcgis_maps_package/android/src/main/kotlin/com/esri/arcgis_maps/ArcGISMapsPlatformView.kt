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
import android.view.View
import android.widget.FrameLayout
import androidx.lifecycle.LifecycleOwner
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

/**
 * A handle to an Android view to be embedded in the Flutter hierarchy.
 */
internal class ArcGISMapsPlatformView(
    context: Context,
    messenger: BinaryMessenger,
    id: Int,
    val lifecycleOwner: LifecycleOwner,
    creationParams: Map<String?, Any?>?
) : PlatformView {
    private var mapView: MapView? = null

    override fun getView(): View {
        return mapView!!
    }

    // The method is called by Flutter when the platform view
    // is removed from the Flutter hierarchy. This signals that the view
    // no longer needed and its resources should be released.
    override fun dispose() {
        lifecycleOwner.lifecycle.removeObserver(mapView!!)
        mapView?.dispose()
        mapView = null
    }

    init {
        mapView = MapView(context, id, messenger)
        lifecycleOwner.lifecycle.addObserver(mapView!!)
        mapView?.layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
    }
}
