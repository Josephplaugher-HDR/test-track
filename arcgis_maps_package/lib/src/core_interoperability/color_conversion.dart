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

part of '../../../arcgis_maps.dart';

extension on RT_ColorHandle {
  /// Returns a [Color] instance from this handle.
  Color? toColor() {
    if (this == ffi.nullptr) return null;

    final arcGISColor = _ArcGISColor._fromHandle(this);

    if (arcGISColor is! _RgbColor) return null;

    return arcGISColor.toColor();
  }
}

extension on Color {
  /// Returns a [_ArcGISColor] instance equivalent to this color.
  _ArcGISColor toArcGIS() =>
      _RgbColor.fromValues(red: red, green: green, blue: blue, alpha: alpha);
}

extension on _RgbColor {
  /// Returns a [Color] instance equivalent to this color.
  Color? toColor() => Color.fromARGB(alpha, red, green, blue);
}
