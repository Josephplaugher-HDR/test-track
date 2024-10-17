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

import 'ffi/arcgis_maps_bindings_generated.dart';
import 'ffi/arcgis_maps_ffi.dart';

final class HandleTracker {
  static bool _trackingEnabled = false;

  static bool get trackingEnabled => _trackingEnabled;

  static set trackingEnabled(bool enabled) {
    bindings.setTrackingEnabled(enabled);
    _trackingEnabled = enabled;
  }

  static int trackedCount(int trackedHandleType) {
    return bindings.trackedCount(trackedHandleType);
  }

  /// Shows a list all handle types that have at least one instance, and the
  /// number of handles of each type.
  static List<MapEntry<int, int>> allTrackedCount() {
    final List<MapEntry<int, int>> trackedEntries = [];
    // Since TrackedHandleType is not an enum, we use numbers
    for (int i = 0; i < TrackedHandleType.NumTrackedHandleTypes; ++i) {
      final trackedCount = HandleTracker.trackedCount(i);
      if (trackedCount > 0) trackedEntries.add(MapEntry(i, trackedCount));
    }

    return trackedEntries;
  }
}
