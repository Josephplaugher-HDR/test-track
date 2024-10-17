//
// COPYRIGHT © 2024 Esri
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

part of '../arcgis_maps.dart';

/// Options for configuring the interaction behavior of an [ArcGISMapView].
class ArcGISMapViewInteractionOptions extends InteractionOptions {
  /// Degrees above or below zero, within which the MapView's orientation will be set
  /// to exactly 0. Must be between 0 and 180 (inclusive).
  double get snapToNorthThreshold => _snapToNorthThreshold;
  set snapToNorthThreshold(double value) {
    if (value < 0.0 || value > 180.0) {
      throw ArgumentError.value(
          value, 'snapToNorthThreshold', 'Must be between 0.0 and 180.0');
    }

    if (value == _snapToNorthThreshold) return;

    _snapToNorthThreshold = value;
    notifyListeners();
  }

  double _snapToNorthThreshold = 7.5;
}
