//
// COPYRIGHT © 2024 ESRI
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

// AUTO GENERATED FILE, DO NOT EDIT.

// ignore_for_file: unused_element, unused_field

part of '../../../../arcgis_maps.dart';

/// An abstract class for reducing and summarizing point geoelements such as
/// graphics or features.
final class FeatureReduction implements ffi.Finalizable {
  final RT_FeatureReductionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureReduction_destroy.cast());

  static FeatureReduction? _fromHandle(RT_FeatureReductionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureReduction._withHandle(handle);
  }

  _FeatureReductionType get _objectType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureReduction_getObjectType(
          _handle, errorHandler);
    });
    return _FeatureReductionType._fromCoreValue(coreValue);
  }

  FeatureReduction._withHandle(RT_FeatureReductionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureReduction_created(_handle);
    }
  }

  /// True to enable feature reduction, false to show individual geoelements.
  ///
  /// The default value is true. Changing this property from false to true may
  /// cause data to be re-calculated.
  bool get enabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureReduction_getEnabled(_handle, errorHandler);
    });
  }

  set enabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureReduction_setEnabled(_handle, value, errorHandler);
    });
  }
}

/// The list of feature reduction types.
enum _FeatureReductionType {
  /// Clustering feature reduction.
  clusteringFeatureReduction;

  factory _FeatureReductionType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return clusteringFeatureReduction;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case clusteringFeatureReduction:
        return 1;
    }
  }
}
