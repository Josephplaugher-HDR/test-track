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

/// Options for configuring interaction behavior.
class InteractionOptions with ChangeNotifier {
  /// Whether interactions are enabled.
  bool get enabled => _enabled;
  set enabled(bool value) {
    if (value == _enabled) return;

    _enabled = value;
    notifyListeners();
  }

  /// Whether flinging is enabled.
  bool get flingEnabled => _flingEnabled;
  set flingEnabled(bool value) {
    if (value == _flingEnabled) return;

    _flingEnabled = value;
    notifyListeners();
  }

  /// Whether panning is enabled.
  bool get panEnabled => _panEnabled;
  set panEnabled(bool value) {
    if (value == _panEnabled) return;

    _panEnabled = value;
    notifyListeners();
  }

  /// Whether rotating is enabled.
  bool get rotateEnabled => _rotateEnabled;
  set rotateEnabled(bool value) {
    if (value == _rotateEnabled) return;

    _rotateEnabled = value;
    notifyListeners();
  }

  /// Whether zooming is enabled.
  bool get zoomEnabled => _zoomEnabled;
  set zoomEnabled(bool value) {
    if (value == _zoomEnabled) return;

    _zoomEnabled = value;
    notifyListeners();
  }

  /// Multiplier by which the view is zoomed. Must be at least 1.0.
  double get zoomFactor => _zoomFactor;
  set zoomFactor(double value) {
    if (value < 1.0) {
      throw ArgumentError.value(value, 'zoomFactor', 'Must be at least 1.0');
    }

    if (value == _zoomFactor) return;

    _zoomFactor = value;
    notifyListeners();
  }

  bool _enabled = true;
  bool _flingEnabled = true;
  bool _panEnabled = true;
  bool _rotateEnabled = true;
  bool _zoomEnabled = true;
  double _zoomFactor = 2.0;
}
