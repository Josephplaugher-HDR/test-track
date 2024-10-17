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

/// A class that contains value of attribute's parameter.
///
/// Class holding a single attribute parameter value for an NA tasks.
final class AttributeParameterValue implements ffi.Finalizable {
  final RT_AttributeParameterValueHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.AttributeParameterValue_destroy.cast());

  static AttributeParameterValue? _fromHandle(
      RT_AttributeParameterValueHandle handle) {
    if (handle == ffi.nullptr) return null;
    return AttributeParameterValue._withHandle(handle);
  }

  AttributeParameterValue._withHandle(RT_AttributeParameterValueHandle handle)
      : _parameterValue = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_AttributeParameterValue_getParameterValue(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }, setter: (value) {
          final coreValue =
              value != null ? _ElementExtension.fromDartValue(value) : null;
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_AttributeParameterValue_setParameterValue(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.AttributeParameterValue_created(_handle);
    }
  }

  /// Creates an attribute parameter instance.
  ///
  /// Creates an attribute parameter value.
  factory AttributeParameterValue() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AttributeParameterValue_create(errorHandler);
    });
    return AttributeParameterValue._withHandle(handle);
  }

  /// Attribute's name.
  String get attributeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AttributeParameterValue_getAttributeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set attributeName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_AttributeParameterValue_setAttributeName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Parameter's name.
  String get parameterName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AttributeParameterValue_getParameterName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set parameterName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_AttributeParameterValue_setParameterName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Parameter's value.
  dynamic get parameterValue => _parameterValue.value;

  set parameterValue(dynamic value) => _parameterValue.value = value;

  final Memoized<dynamic> _parameterValue;
}

/// Types of unit for network attributes.
enum AttributeUnit {
  /// An unknown unit.
  unknown,

  /// An inches attribute unit.
  inches,

  /// A feet attribute unit.
  feet,

  /// A yards attribute unit.
  yards,

  /// A miles attribute unit.
  miles,

  /// A millimeters attribute unit.
  millimeters,

  /// A centimeters attribute unit.
  centimeters,

  /// A decimeters attribute unit.
  decimeters,

  /// A meters attribute unit.
  meters,

  /// A kilometers attribute unit.
  kilometers,

  /// A nautical miles attribute unit.
  nauticalMiles,

  /// A decimal degrees attribute unit.
  decimalDegrees,

  /// A seconds attribute unit.
  seconds,

  /// A minutes attribute unit.
  minutes,

  /// An hours attribute unit.
  hours,

  /// A days attribute unit.
  days;

  factory AttributeUnit._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return unknown;
      case 1:
        return inches;
      case 2:
        return feet;
      case 3:
        return yards;
      case 4:
        return miles;
      case 5:
        return millimeters;
      case 6:
        return centimeters;
      case 7:
        return decimeters;
      case 8:
        return meters;
      case 9:
        return kilometers;
      case 10:
        return nauticalMiles;
      case 11:
        return decimalDegrees;
      case 12:
        return seconds;
      case 13:
        return minutes;
      case 14:
        return hours;
      case 15:
        return days;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return 0;
      case inches:
        return 1;
      case feet:
        return 2;
      case yards:
        return 3;
      case miles:
        return 4;
      case millimeters:
        return 5;
      case centimeters:
        return 6;
      case decimeters:
        return 7;
      case meters:
        return 8;
      case kilometers:
        return 9;
      case nauticalMiles:
        return 10;
      case decimalDegrees:
        return 11;
      case seconds:
        return 12;
      case minutes:
        return 13;
      case hours:
        return 14;
      case days:
        return 15;
    }
  }
}

/// Intended-usage types for barriers.
enum BarrierType {
  /// A restriction barrier type.
  restriction,

  /// A cost adjustment barrier type.
  costAdjustment;

  factory BarrierType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return restriction;
      case 1:
        return costAdjustment;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case restriction:
        return 0;
      case costAdjustment:
        return 1;
    }
  }
}

/// A class that contains settings that are used when solving a
/// [ClosestFacilityTask].
///
/// The [ClosestFacilityParameters] class contains all inputs for the
/// [ClosestFacilityTask], as well as settings such as the impedance attribute,
/// accumulate and restriction attributes, backtrack (u-turn) policy, etc.
final class ClosestFacilityParameters implements ffi.Finalizable {
  final RT_ClosestFacilityParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ClosestFacilityParameters_destroy.cast());

  static ClosestFacilityParameters? _fromHandle(
      RT_ClosestFacilityParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClosestFacilityParameters._withHandle(handle);
  }

  ClosestFacilityParameters._withHandle(
      RT_ClosestFacilityParametersHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityParameters_getAccumulateAttributeNames(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityParameters_getOutputSpatialReference(
                    handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClosestFacilityParameters_setOutputSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityParameters_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClosestFacilityParameters_setStartTime(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _travelMode = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityParameters_getTravelMode(
                handle, errorHandler);
          });
          return TravelMode._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClosestFacilityParameters_setTravelMode(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClosestFacilityParameters_created(_handle);
    }
  }

  /// Accumulate attribute names.
  ///
  /// The accumulate attribute names e.g. "Minutes", "Miles", etc. Accumulate
  /// attributes are useful when more information other than the default
  /// impedance attribute is required.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _accumulateAttributeNames;

  /// The default cutoff value to stop traversing.
  double get defaultImpedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getDefaultImpedanceCutoff(
          _handle, errorHandler);
    });
  }

  set defaultImpedanceCutoff(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setDefaultImpedanceCutoff(
          _handle, value, errorHandler);
    });
  }

  /// The default number of target facilities to find.
  int get defaultTargetFacilityCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ClosestFacilityParameters_getDefaultTargetFacilityCount(
              _handle, errorHandler);
    });
  }

  set defaultTargetFacilityCount(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setDefaultTargetFacilityCount(
          _handle, value, errorHandler);
    });
  }

  /// Directions distance units.
  ///
  /// Describes the unit of measurement for the length of directions. Default
  /// value [UnitSystem.metric] will be returned on error.
  UnitSystem get directionsDistanceUnits {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ClosestFacilityParameters_getDirectionsDistanceUnits(
              _handle, errorHandler);
    });
    return UnitSystem._fromCoreValue(coreValue);
  }

  set directionsDistanceUnits(UnitSystem value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setDirectionsDistanceUnits(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Directions language e.g. "en-US".
  ///
  /// The ISO language code of the directions language to be set. If an
  /// unsupported language is set, an exception will occur at solve time in
  /// [ClosestFacilityTask.solveClosestFacility] method.
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set directionsLanguage(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setDirectionsLanguage(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Directions style.
  ///
  /// The directions setting to generate directions designed for different kind
  /// of applications. Default value [DirectionsStyle.desktop] will be returned
  /// on error.
  DirectionsStyle get directionsStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getDirectionsStyle(
          _handle, errorHandler);
    });
    return DirectionsStyle._fromCoreValue(coreValue);
  }

  set directionsStyle(DirectionsStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setDirectionsStyle(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Output spatial reference.
  ///
  /// All route's geometries will be returned in this spatial reference in the
  /// even of a successful solve.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  set outputSpatialReference(SpatialReference? value) =>
      _outputSpatialReference.value = value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Whether or not turn-by-turn directions for the closest facility routes are
  /// to be returned.
  bool get returnDirections {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getReturnDirections(
          _handle, errorHandler);
    });
  }

  set returnDirections(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setReturnDirections(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not to return the point barriers used in the closest facility
  /// task.
  bool get returnPointBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getReturnPointBarriers(
          _handle, errorHandler);
    });
  }

  set returnPointBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setReturnPointBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not to return the polygon barriers used in the closest facility
  /// task.
  bool get returnPolygonBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getReturnPolygonBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolygonBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setReturnPolygonBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not to return the polyline barriers used in the closest
  /// facility task.
  bool get returnPolylineBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getReturnPolylineBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolylineBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setReturnPolylineBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not return routes are to be returned.
  ///
  /// Enabled by default. Can be returned in the event of a successful solve.
  bool get returnRoutes {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getReturnRoutes(
          _handle, errorHandler);
    });
  }

  set returnRoutes(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setReturnRoutes(
          _handle, value, errorHandler);
    });
  }

  /// Route shape type.
  ///
  /// The enumeration value for the output shape type e.g. straight line shape,
  /// true shape, or no shape. Default value [RouteShapeType.none] will be
  /// returned on error.
  RouteShapeType get routeShapeType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getRouteShapeType(
          _handle, errorHandler);
    });
    return RouteShapeType._fromCoreValue(coreValue);
  }

  set routeShapeType(RouteShapeType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setRouteShapeType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Start time.
  ///
  /// Expects time in the time zone of first [Stop].
  DateTime? get startTime => _startTime.value;

  set startTime(DateTime? value) => _startTime.value = value;

  final Memoized<DateTime?> _startTime;

  /// Start time usage.
  ///
  /// Default value [StartTimeUsage.departureTime] will be returned on error.
  StartTimeUsage get startTimeUsage {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getStartTimeUsage(
          _handle, errorHandler);
    });
    return StartTimeUsage._fromCoreValue(coreValue);
  }

  set startTimeUsage(StartTimeUsage value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setStartTimeUsage(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The travel direction for the closest facility computation (to or from
  /// facility).
  ///
  /// Default value [TravelDirection.fromFacility] will be returned on error.
  TravelDirection get travelDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getTravelDirection(
          _handle, errorHandler);
    });
    return TravelDirection._fromCoreValue(coreValue);
  }

  set travelDirection(TravelDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setTravelDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Travel mode.
  ///
  /// Travel mode that will be used for closest facility's solving. List of
  /// supported travel modes can be obtained from
  /// [ClosestFacilityTaskInfo.travelModes] method.
  TravelMode? get travelMode => _travelMode.value;

  set travelMode(TravelMode? value) => _travelMode.value = value;

  final Memoized<TravelMode?> _travelMode;

  /// Clears facilities.
  ///
  /// Clears facilities that were set by
  /// [ClosestFacilityParameters.setFacilities] or
  /// [ClosestFacilityParameters.setFacilitiesWithFeatureTable].
  void clearFacilities() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_clearFacilities(
          _handle, errorHandler);
    });
  }

  /// Clears incidents.
  ///
  /// Clears incidents that were set by [ClosestFacilityParameters.setIncidents]
  /// or [ClosestFacilityParameters.setIncidentsWithFeatureTable].
  void clearIncidents() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_clearIncidents(
          _handle, errorHandler);
    });
  }

  /// Clears point barriers.
  ///
  /// Clears point barriers that were set by
  /// [ClosestFacilityParameters.setPointBarriers] or
  /// [ClosestFacilityParameters.setPointBarriersWithFeatureTable].
  void clearPointBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_clearPointBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears polygon barriers.
  ///
  /// Clears polygon barriers that were set by
  /// [ClosestFacilityParameters.setPolygonBarriers] or
  /// [ClosestFacilityParameters.setPolygonBarriersWithFeatureTable].
  void clearPolygonBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_clearPolygonBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears polyline barriers.
  ///
  /// Clears polyline barriers that were set by
  /// [ClosestFacilityParameters.setPolylineBarriers] or
  /// [ClosestFacilityParameters.setPolylineBarriersWithFeatureTable].
  void clearPolylineBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_clearPolylineBarriers(
          _handle, errorHandler);
    });
  }

  /// Clones the [ClosestFacilityParameters].
  ///
  /// Return Value: A new [ClosestFacilityParameters] with the same values as
  /// the current [ClosestFacilityParameters].
  ClosestFacilityParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_clone(
          _handle, errorHandler);
    });
    return ClosestFacilityParameters._fromHandle(objectHandle)!;
  }

  /// Gets the search where clause from the specified network dataset's source
  /// feature class.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class to
  /// retrieve the where clause from.
  ///
  /// Return Value: A [String] where clause.
  String getSearchWhereClause({required String sourceName}) {
    final coreSourceName = _CString(sourceName);
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityParameters_getSearchWhereClause(
          _handle, coreSourceName.bytes, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Sets facilities.
  ///
  /// The set of facilities loaded as network locations during analysis.
  ///
  /// Parameters:
  /// - `facilities` — A [List] of [Facility] instances. Contents of the [List]
  /// are copied.
  void setFacilities(List<Facility> facilities) {
    final coreFacilities =
        facilities.toMutableArray(valueType: _ElementType.facility);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setFacilities(
          _handle, coreFacilities._handle, errorHandler);
    });
  }

  /// Sets the facilities from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the facilities objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets facilities by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setFacilitiesWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setFacilitiesWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets incidents.
  ///
  /// The set of incidents loaded as network locations during analysis.
  ///
  /// Parameters:
  /// - `incidents` — A [List] of [Incident] instances. Contents of the [List]
  /// are copied.
  void setIncidents(List<Incident> incidents) {
    final coreIncidents =
        incidents.toMutableArray(valueType: _ElementType.incident);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setIncidents(
          _handle, coreIncidents._handle, errorHandler);
    });
  }

  /// Sets the incidents from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the incidents objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets incidents by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setIncidentsWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setIncidentsWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets point barriers.
  ///
  /// Parameters:
  /// - `pointBarriers` — A [List] of [PointBarrier] instances. Contents of the
  /// [List] are copied.
  void setPointBarriers(List<PointBarrier> pointBarriers) {
    final corePointBarriers =
        pointBarriers.toMutableArray(valueType: _ElementType.pointBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setPointBarriers(
          _handle, corePointBarriers._handle, errorHandler);
    });
  }

  /// Sets the point barriers from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets point barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPointBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setPointBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets polygon barriers.
  ///
  /// Parameters:
  /// - `polygonBarriers` — A [List] of [PolygonBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolygonBarriers(List<PolygonBarrier> polygonBarriers) {
    final corePolygonBarriers =
        polygonBarriers.toMutableArray(valueType: _ElementType.polygonBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setPolygonBarriers(
          _handle, corePolygonBarriers._handle, errorHandler);
    });
  }

  /// Sets the polygon barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polygon. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets polygon barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolygonBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_ClosestFacilityParameters_setPolygonBarriersWithFeatureTable(
              _handle,
              featureTable._handle,
              queryParameters._handle,
              errorHandler);
    });
  }

  /// Sets polyline barriers.
  ///
  /// Parameters:
  /// - `lineBarriers` — A [List] of [PolylineBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolylineBarriers({required List<PolylineBarrier> lineBarriers}) {
    final coreLineBarriers =
        lineBarriers.toMutableArray(valueType: _ElementType.polylineBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setPolylineBarriers(
          _handle, coreLineBarriers._handle, errorHandler);
    });
  }

  /// Sets the polyline barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polyline. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets polyline barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolylineBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_ClosestFacilityParameters_setPolylineBarriersWithFeatureTable(
              _handle,
              featureTable._handle,
              queryParameters._handle,
              errorHandler);
    });
  }

  /// Sets a search where clause on the specified network dataset's source
  /// feature class. Only features satisfying the where clause for the specified
  /// feature class will be used to locate facilities or incidents on the
  /// network during the solve operation. If a where clause is not set all
  /// network features are used.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class
  /// the where clause will be applied to.
  /// - `searchWhereClause` — The search where clause.
  void setSearchWhereClause(
      {required String sourceName, required String searchWhereClause}) {
    final coreSourceName = _CString(sourceName);
    final coreSearchWhereClause = _CString(searchWhereClause);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityParameters_setSearchWhereClause(_handle,
          coreSourceName.bytes, coreSearchWhereClause.bytes, errorHandler);
    });
  }
}

/// A class that contains the output results from a [ClosestFacilityTask].
///
/// The closest facility result contains all necessary output from a
/// successfully- completed [ClosestFacilityTask.solveClosestFacility]. This
/// includes collection of routes, barriers and messages.
final class ClosestFacilityResult implements ffi.Finalizable {
  final RT_ClosestFacilityResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ClosestFacilityResult_destroy.cast());

  static ClosestFacilityResult? _fromHandle(
      RT_ClosestFacilityResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClosestFacilityResult._withHandle(handle);
  }

  ClosestFacilityResult._withHandle(RT_ClosestFacilityResultHandle handle)
      : _facilities = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getFacilities(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _incidents = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getIncidents(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _messages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getMessages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _pointBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getPointBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polygonBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getPolygonBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polylineBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityResult_getPolylineBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClosestFacilityResult_created(_handle);
    }
  }

  /// Directions language.
  ///
  /// The language used to generate driving directions text instructions.
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityResult_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Array of the facilities used to calculate the closest facility.
  List<Facility> get facilities => _facilities.value;

  final Memoized<_ArrayList<Facility>> _facilities;

  /// Array of the incidents from which to calculate the closest facility.
  List<Incident> get incidents => _incidents.value;

  final Memoized<_ArrayList<Incident>> _incidents;

  /// Messages.
  ///
  /// Messages received when solve is completed. If a route cannot be solved,
  /// the message returned by the server identifies the route that could not be
  /// solved.
  List<String> get messages => _messages.value;

  final Memoized<_ArrayList<String>> _messages;

  /// Array of the point barriers.
  ///
  /// Barriers are only returned if the returnPointBarriers property of
  /// [ClosestFacilityParameters] is true.
  List<PointBarrier> get pointBarriers => _pointBarriers.value;

  final Memoized<_ArrayList<PointBarrier>> _pointBarriers;

  /// Array of the polygon barriers.
  ///
  /// Barriers are only returned if the returnPolygonBarriers property of
  /// [ClosestFacilityParameters] is true.
  List<PolygonBarrier> get polygonBarriers => _polygonBarriers.value;

  final Memoized<_ArrayList<PolygonBarrier>> _polygonBarriers;

  /// Array of the polyline barriers.
  ///
  /// Barriers are only returned if the returnPolylineBarriers property of
  /// [ClosestFacilityParameters] is true.
  List<PolylineBarrier> get polylineBarriers => _polylineBarriers.value;

  final Memoized<_ArrayList<PolylineBarrier>> _polylineBarriers;

  /// Gets facility costs.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `facilityIndex` — The index of facility.
  ///
  /// Return Value: A [List] of double.
  List<double> getFacilityCosts(
      {required String attributeName, required int facilityIndex}) {
    final coreAttributeName = _CString(attributeName);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityResult_getFacilityCosts(
          _handle, coreAttributeName.bytes, facilityIndex, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Gets an ordered list of facility indexes for a given incident index.
  ///
  /// The first element in the list is the index of the closest facility, the
  /// second element is the next closest, etc. Multiple properties can effect
  /// the number of facilities returned for each incident.
  ///
  /// Parameters:
  /// - `incidentIndex` — The index of incident.
  ///
  /// Return Value: A [List] of int32
  List<int> getRankedFacilityIndexes({required int incidentIndex}) {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityResult_getRankedFacilityIndexes(
          _handle, incidentIndex, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Gets route.
  ///
  /// Parameters:
  /// - `facilityIndex` — The index of facility.
  /// - `incidentIndex` — The index of incident.
  ///
  /// Return Value: A [ClosestFacilityRoute] between specified facility and
  /// incident.
  ClosestFacilityRoute? getRoute(
      {required int facilityIndex, required int incidentIndex}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityResult_getRoute(
          _handle, facilityIndex, incidentIndex, errorHandler);
    });
    return ClosestFacilityRoute._fromHandle(objectHandle);
  }
}

/// A class that contains the output from a solving closest task for a single
/// result.
///
/// The solving closest route contains all necessary output from a successfully-
/// completed [ClosestFacilityTask.solveClosestFacility]. This includes the
/// cost, geometry, and additional metadata specific to the resulting route
/// solution (e.g., route directions, local start/end time, etc.).
final class ClosestFacilityRoute implements ffi.Finalizable {
  final RT_ClosestFacilityRouteHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ClosestFacilityRoute_destroy.cast());

  static ClosestFacilityRoute? _fromHandle(
      RT_ClosestFacilityRouteHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClosestFacilityRoute._withHandle(handle);
  }

  ClosestFacilityRoute._withHandle(RT_ClosestFacilityRouteHandle handle)
      : _directionManeuvers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityRoute_getDirectionManeuvers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _endTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityRoute_getEndTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityRoute_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClosestFacilityRoute_created(_handle);
    }
  }

  /// Arrival curb approach.
  ///
  /// Default value [CurbApproach.eitherSide] will be returned on error.
  CurbApproach get arrivalCurbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getArrivalCurbApproach(
          _handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  /// Departure curb approach.
  CurbApproach get departureCurbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getDepartureCurbApproach(
          _handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  /// Direction maneuver.
  ///
  /// The list of turn-by-turn directions for this route. Can be empty array in
  /// case if [ClosestFacilityParameters.returnDirections] is false.
  List<DirectionManeuver> get directionManeuvers => _directionManeuvers.value;

  final Memoized<_ArrayList<DirectionManeuver>> _directionManeuvers;

  /// End time.
  ///
  /// A null if departure/arrival time was not specified in
  /// [ClosestFacilityParameters].
  DateTime? get endTime => _endTime.value;

  final Memoized<DateTime?> _endTime;

  /// Time zone shift for end time, in minutes.
  ///
  /// Value of the time zone shift for end time, in minutes.
  double get endTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getEndTimeShift(
          _handle, errorHandler);
    });
  }

  /// Route's geometry.
  ///
  /// The geometry for the full route (polyline) in case if
  /// [ClosestFacilityParameters.returnRoutes] is true.
  Polyline? get routeGeometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getRouteGeometry(
          _handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle);
  }

  /// Start time.
  ///
  /// A null if departure/arrival time was not specified in
  /// [ClosestFacilityParameters].
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;

  /// Time zone shift for start time in minutes.
  ///
  /// Value of the time zone shift for start time, in minutes.
  double get startTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getStartTimeShift(
          _handle, errorHandler);
    });
  }

  /// Total length in meters.
  ///
  /// The total length of a closest facility route (meters).
  double get totalLength {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getTotalLength(
          _handle, errorHandler);
    });
  }

  /// Total time in minutes.
  ///
  /// The total time in minutes calculated for the route. In order to get this
  /// value, time attribute should be set in as impedance or accumulate
  /// attribute in parameters object.
  double get totalTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getTotalTime(
          _handle, errorHandler);
    });
  }

  /// Travel time in minutes.
  ///
  /// Travel time is total amount of travel time exclude added minutes from
  /// incident/facility added costs(if specified).
  double get travelTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getTravelTime(
          _handle, errorHandler);
    });
  }

  /// Gets cost.
  ///
  /// Returns the associated cost for this attribute name.
  ///
  /// Parameters:
  /// - `attributeName` — The name of the attribute name e.g. "Minutes" or
  /// "TravelTime".
  ///
  /// Return Value: A value of cost.
  double getCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityRoute_getCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }
}

/// A class that implements the closest facility task.
///
/// The closest facility task class uses a transportation network to measure the
/// cost of traveling between incidents and facilities and determines which are
/// nearest to one other. When finding closest facilities, you can specify how
/// many to find and whether the direction of travel is toward or away from
/// them.
final class ClosestFacilityTask
    with Loadable
    implements
        ApiKeyResource,
        _CallbackReceiver,
        _Resourceable,
        ffi.Finalizable {
  final RT_ClosestFacilityTaskHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ClosestFacilityTask_destroy.cast());

  static ClosestFacilityTask? _fromHandle(RT_ClosestFacilityTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClosestFacilityTask._withHandle(handle);
  }

  ClosestFacilityTask._withHandle(RT_ClosestFacilityTaskHandle handle)
      : _closestFacilityTaskInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTask_getClosestFacilityTaskInfo(
                    handle, errorHandler);
          });
          return ClosestFacilityTaskInfo._fromHandle(objectHandle);
        }),
        _transportationNetworkDataset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTask_getTransportationNetworkDataset(
                    handle, errorHandler);
          });
          return TransportationNetworkDataset._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityTask_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClosestFacilityTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ClosestFacilityTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ClosestFacilityTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ClosestFacilityTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ClosestFacilityTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );

    _setResourceProvider(_resourceProvider);
  }

  /// Creates a closest facility task with transportation network dataset.
  ///
  /// Parameters:
  /// - `dataset` — A transportation network dataset.
  factory ClosestFacilityTask.withDataset(
      TransportationNetworkDataset dataset) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_createWithDataset(
          dataset._handle, errorHandler);
    });
    return ClosestFacilityTask._withHandle(handle);
  }

  /// Creates a closest facility task with path to geodatabase.
  ///
  /// Parameters:
  /// - `databaseFileUri` — A path to geodatabase.
  /// - `networkName` — A network name.
  factory ClosestFacilityTask.withGeodatabase(
      {required Uri databaseFileUri, required String networkName}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDatabaseFileUri = _CString(databaseFileUri.toFilePath());
    final coreNetworkName = _CString(networkName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_createWithGeodatabase(
          coreDatabaseFileUri.bytes, coreNetworkName.bytes, errorHandler);
    });
    return ClosestFacilityTask._withHandle(handle);
  }

  /// Creates a closest facility task with URL.
  ///
  /// Creates a closest facility task.
  ///
  /// Parameters:
  /// - `uri` — An URL to online routing services.
  factory ClosestFacilityTask.withUrl(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return ClosestFacilityTask._withHandle(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Closest facility task info.
  ///
  /// Information about this closest facility task. For a closest facility task
  /// using an online service, this will involve a network call.
  ClosestFacilityTaskInfo? get closestFacilityTaskInfo =>
      _closestFacilityTaskInfo.value;

  final Memoized<ClosestFacilityTaskInfo?> _closestFacilityTaskInfo;

  /// Transportation network dataset.
  TransportationNetworkDataset? get transportationNetworkDataset =>
      _transportationNetworkDataset.value;

  final Memoized<TransportationNetworkDataset?> _transportationNetworkDataset;

  /// The URL of online service.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Creates default parameters.
  ///
  /// Retrieves the default parameters as defined by the service.
  ///
  /// Return Value: A [Future] that returns a [ClosestFacilityParameters] type.
  Future<ClosestFacilityParameters> createDefaultParameters() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsClosestFacilityParameters()!);
  }

  /// Cancelable version of [createDefaultParameters]. See that method for more
  /// information.
  CancelableOperation<ClosestFacilityParameters>
      createDefaultParametersCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsClosestFacilityParameters()!);
  }

  @override
  void _setResourceProvider(_ResourceProvider? resourceProvider) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityTask_setResourceProvider(
          _handle, resourceProvider?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Solves a closest facility passing in a parameters object.
  ///
  /// Executes the [ClosestFacilityParameters] defined for this
  /// [ClosestFacilityTask] and returns a [ClosestFacilityResult] containing the
  /// results.
  ///
  /// Parameters:
  /// - `closestFacilityParameters` — The closest facility parameters.
  ///
  /// Return Value: A [Future] that returns a [ClosestFacilityResult] type.
  Future<ClosestFacilityResult> solveClosestFacility(
      {required ClosestFacilityParameters closestFacilityParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_solveClosestFacilityAsync(
          _handle, closestFacilityParameters._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsClosestFacilityResult()!);
  }

  /// Cancelable version of [solveClosestFacility]. See that method for more
  /// information.
  CancelableOperation<ClosestFacilityResult> solveClosestFacilityCancelable(
      {required ClosestFacilityParameters closestFacilityParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_solveClosestFacilityAsync(
          _handle, closestFacilityParameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsClosestFacilityResult()!);
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClosestFacilityTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _closestFacilityTaskInfo.invalidateCache();
    _transportationNetworkDataset.invalidateCache();
    _uri.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLoadableDoneLoadingEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _doneLoadingStreamController.add(event);
      case AsyncType.asyncTypeLoadableLoadStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LoadStatus._fromCoreValue(coreValue);
        }();
        _loadStatusChangedStreamController.add(event);
      default:
        logger.f('ClosestFacilityTask unhandled asyncType $asyncType');
    }
  }
}

/// A class that describes the transportation network that a closest facility
/// task is bound to.
///
/// It describes information about [ClosestFacilityTask].
final class ClosestFacilityTaskInfo implements ffi.Finalizable {
  final RT_ClosestFacilityTaskInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ClosestFacilityTaskInfo_destroy.cast());

  static ClosestFacilityTaskInfo? _fromHandle(
      RT_ClosestFacilityTaskInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClosestFacilityTaskInfo._withHandle(handle);
  }

  ClosestFacilityTaskInfo._withHandle(RT_ClosestFacilityTaskInfoHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTaskInfo_getAccumulateAttributeNames(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _costAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityTaskInfo_getCostAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTaskInfo_getOutputSpatialReference(
                    handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _restrictionAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTaskInfo_getRestrictionAttributes(
                    handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityTaskInfo_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _supportedLanguages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityTaskInfo_getSupportedLanguages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _supportedRestrictionUsageParameterValues = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ClosestFacilityTaskInfo_getSupportedRestrictionUsageParameterValues(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _travelModes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClosestFacilityTaskInfo_getTravelModes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClosestFacilityTaskInfo_created(_handle);
    }
  }

  /// Accumulate attribute names.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_ArrayList<String>> _accumulateAttributeNames;

  /// Cost attributes.
  Map<String, CostAttribute> get costAttributes => _costAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, CostAttribute>>
      _costAttributes;

  /// Default impedance cutoff.
  ///
  /// An impedance cutoff is a value for the impedance beyond which facilities
  /// should not be found.
  double get defaultImpedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDefaultImpedanceCutoff(
          _handle, errorHandler);
    });
  }

  /// Default target facility count.
  int get defaultTargetFacilityCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ClosestFacilityTaskInfo_getDefaultTargetFacilityCount(
              _handle, errorHandler);
    });
  }

  /// Default travel mode's name.
  String get defaultTravelModeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDefaultTravelModeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Directions distance text units.
  ///
  /// Default value [UnitSystem.metric] will be returned on error.
  UnitSystem get directionsDistanceUnits {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDirectionsDistanceUnits(
          _handle, errorHandler);
    });
    return UnitSystem._fromCoreValue(coreValue);
  }

  /// Directions language.
  ///
  /// The language of the output directions e.g. "en-US".
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Directions style.
  ///
  /// The directions setting to generate directions designed for different kind
  /// of applications. Default value [DirectionsStyle.desktop] will be returned
  /// on error.
  DirectionsStyle get directionsStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDirectionsStyle(
          _handle, errorHandler);
    });
    return DirectionsStyle._fromCoreValue(coreValue);
  }

  /// Whether the underlying network dataset supports the returning of
  /// directions.
  ///
  /// For services prior to ArcGIS 10.8, this value will be
  /// [NetworkDirectionsSupport.unknown].
  NetworkDirectionsSupport get directionsSupport {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getDirectionsSupport(
          _handle, errorHandler);
    });
    return NetworkDirectionsSupport._fromCoreValue(coreValue);
  }

  /// Maximum locating distance is the furthest distance in meters that Network
  /// Analyst searches when locating or relocating a point onto the network.
  ///
  /// The search looks for suitable edges or junctions and snaps the point to
  /// the nearest one. If a suitable location isn't found within the maximum
  /// locating distance, the object is marked as unlocated.
  double get maxLocatingDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getMaxLocatingDistance(
          _handle, errorHandler);
    });
  }

  /// Network name.
  String get networkName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getNetworkName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Output spatial reference.
  ///
  /// The spatial reference that will be used for output geometry during closest
  /// facility solving.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Restriction attributes.
  ///
  /// The names of set restriction attributes e.g. "Oneway".
  Map<String, RestrictionAttribute> get restrictionAttributes =>
      _restrictionAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, RestrictionAttribute>>
      _restrictionAttributes;

  /// Route shape type.
  ///
  /// The enumeration value for the output shape type e.g.straight line shape,
  /// true shape, or no shape. Default value [RouteShapeType.none] will be
  /// returned on error.
  RouteShapeType get routeShapeType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getRouteShapeType(
          _handle, errorHandler);
    });
    return RouteShapeType._fromCoreValue(coreValue);
  }

  /// Start time.
  ///
  /// A null if a start time was not set.
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;

  /// Start time usage.
  ///
  /// Default value [StartTimeUsage.departureTime] will be returned on error.
  StartTimeUsage get startTimeUsage {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getStartTimeUsage(
          _handle, errorHandler);
    });
    return StartTimeUsage._fromCoreValue(coreValue);
  }

  /// Array of supported languages.
  ///
  /// Supported languages of the output directions.
  List<String> get supportedLanguages => _supportedLanguages.value;

  final Memoized<_ArrayList<String>> _supportedLanguages;

  /// Array of supported restriction usage parameter values.
  ///
  /// Array of special string values for restriction usage, such as Avoid_High.
  List<String> get supportedRestrictionUsageParameterValues =>
      _supportedRestrictionUsageParameterValues.value;

  final Memoized<_ArrayList<String>> _supportedRestrictionUsageParameterValues;

  /// Travel direction.
  ///
  /// Default value [TravelDirection.fromFacility] will be returned on error.
  TravelDirection get travelDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClosestFacilityTaskInfo_getTravelDirection(
          _handle, errorHandler);
    });
    return TravelDirection._fromCoreValue(coreValue);
  }

  /// Array of travel modes.
  List<TravelMode> get travelModes => _travelModes.value;

  final Memoized<_ArrayList<TravelMode>> _travelModes;
}

/// A structure that describes a transportation network cost attribute.
final class CostAttribute implements ffi.Finalizable {
  final RT_CostAttributeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.CostAttribute_destroy.cast());

  static CostAttribute? _fromHandle(RT_CostAttributeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CostAttribute._withHandle(handle);
  }

  CostAttribute._withHandle(RT_CostAttributeHandle handle)
      : _parameterValues = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CostAttribute_getParameterValues(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.CostAttribute_created(_handle);
    }
  }

  /// Parameters.
  ///
  /// Cost attribute's parameters.
  Map<String, dynamic> get parameterValues => _parameterValues.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>> _parameterValues;

  /// Unit.
  ///
  /// Cost attribute's unit.
  AttributeUnit get unit {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CostAttribute_getUnit(_handle, errorHandler);
    });
    return AttributeUnit._fromCoreValue(coreValue);
  }
}

/// The curb approach type.
enum CurbApproach {
  /// An either side curb approach.
  eitherSide,

  /// A left side curb approach.
  leftSide,

  /// A right side curb approach.
  rightSide,

  /// A no U-Turn curb approach.
  noUTurn,

  /// An unknown type, used when approach is not determined.
  unknown;

  factory CurbApproach._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return eitherSide;
      case 1:
        return leftSide;
      case 2:
        return rightSide;
      case 3:
        return noUTurn;
      case 4:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case eitherSide:
        return 0;
      case leftSide:
        return 1;
      case rightSide:
        return 2;
      case noUTurn:
        return 3;
      case unknown:
        return 4;
    }
  }
}

/// A class that contains description of directions event.
final class DirectionEvent implements ffi.Finalizable {
  final RT_DirectionEventHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DirectionEvent_destroy.cast());

  static DirectionEvent? _fromHandle(RT_DirectionEventHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DirectionEvent._withHandle(handle);
  }

  DirectionEvent._withHandle(RT_DirectionEventHandle handle)
      : _estimatedArrivalTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DirectionEvent_getEstimatedArrivalTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _eventMessages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DirectionEvent_getEventMessages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DirectionEvent_created(_handle);
    }
  }

  /// Estimated arrival time.
  ///
  /// The estimated arrival time for this segment of the route.
  DateTime? get estimatedArrivalTime => _estimatedArrivalTime.value;

  final Memoized<DateTime?> _estimatedArrivalTime;

  /// Time zone shift for estimated arrival time, in minutes.
  ///
  /// The time zone shift of estimated arrival time for this segment of the
  /// route, in minutes.
  double get estimatedArrivalTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionEvent_getEstimatedArrivalTimeShift(
          _handle, errorHandler);
    });
  }

  /// Event messages.
  ///
  /// The detailed direction info passed back from a route solving operation.
  List<String> get eventMessages => _eventMessages.value;

  final Memoized<_ArrayList<String>> _eventMessages;

  /// Event text.
  String get eventText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionEvent_getEventText(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Event's geometry.
  ///
  /// The geometry for the route direction.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionEvent_getGeometry(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }
}

/// A class that contains properties of directions maneuver.
final class DirectionManeuver implements ffi.Finalizable {
  final RT_DirectionManeuverHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DirectionManeuver_destroy.cast());

  static DirectionManeuver? _fromHandle(RT_DirectionManeuverHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DirectionManeuver._withHandle(handle);
  }

  DirectionManeuver._withHandle(RT_DirectionManeuverHandle handle)
      : _directionEvents = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DirectionManeuver_getDirectionEvents(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _estimatedArrivalTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DirectionManeuver_getEstimatedArrivalTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _maneuverMessages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DirectionManeuver_getManeuverMessages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DirectionManeuver_created(_handle);
    }
  }

  /// Direction events.
  ///
  /// The directions events i.e. passing state boundaries, etc. from the solve
  /// operation.
  List<DirectionEvent> get directionEvents => _directionEvents.value;

  final Memoized<_ArrayList<DirectionEvent>> _directionEvents;

  /// Direction text.
  ///
  /// The textual representation of the direction (e.g. Turn right on Main
  /// Street).
  String get directionText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getDirectionText(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Duration in minutes.
  ///
  /// The time this segment of the route will take to traverse.
  double get duration {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getDuration(
          _handle, errorHandler);
    });
  }

  /// Estimated arrive time.
  ///
  /// The estimated arrival time for this segment of the route.
  DateTime? get estimatedArrivalTime => _estimatedArrivalTime.value;

  final Memoized<DateTime?> _estimatedArrivalTime;

  /// Time zone shift for estimated arrive time, in minutes.
  ///
  /// The time zone shift of estimated arrival time for this segment of the
  /// route, in minutes.
  double get estimatedArrivalTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getEstimatedArrivalTimeShift(
          _handle, errorHandler);
    });
  }

  /// The logical level at the start of the maneuver.
  ///
  /// For maneuvers that go up or down levels, such as going from floor 1 to
  /// floor 2 in a building's stairwell, the from-level value signifies the
  /// start level of the maneuver. For example, to go from floor 1 to floor 2,
  /// the from-level would be 1 and the to-level would be 2. If these values are
  /// in the source data, the directions engine can give a descriptive
  /// instruction for the maneuver, such as "go up the stairs." If the values
  /// are not provided, a -1 value is used, signifying that no levels are
  /// defined for maneuvers.
  int get fromLevel {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getFromLevel(
          _handle, errorHandler);
    });
  }

  /// A geometry that represents the maneuver type in directions, such as a left
  /// turn or traveling in a straight line.
  ///
  /// The geometry for the route direction.
  Geometry? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getGeometry(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  /// Length in meters.
  ///
  /// The length of this segment of the route.
  double get length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getLength(_handle, errorHandler);
    });
  }

  /// Maneuver messages.
  ///
  /// The detailed direction info passed back from a route solving operation.
  List<DirectionMessage> get maneuverMessages => _maneuverMessages.value;

  final Memoized<_ArrayList<DirectionMessage>> _maneuverMessages;

  /// Maneuver type.
  ///
  /// The maneuver used to perform this direction (E.g. Depart, Go Straight,
  /// etc).
  DirectionManeuverType get maneuverType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getManeuverType(
          _handle, errorHandler);
    });
    return DirectionManeuverType._fromCoreValue(coreValue);
  }

  /// The logical level at the end of the maneuver.
  ///
  /// For maneuvers that go up or down levels, such as going from floor 1 to
  /// floor 2 in a building's stairwell, the to-level value signifies the ending
  /// level of the maneuver. For example, to go from floor 1 to floor 2, the
  /// from-level would be 1 and the to-level would be 2. If these values are in
  /// the source data, the directions engine can give a descriptive instruction
  /// for the maneuver, such as "go up the stairs." If the values are not
  /// provided, a -1 value is used, signifying that no levels are defined for
  /// maneuvers.
  int get toLevel {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionManeuver_getToLevel(_handle, errorHandler);
    });
  }
}

/// Type of direction maneuver.
enum DirectionManeuverType {
  /// An unknown maneuver type.
  unknown,

  /// A stop maneuver.
  stop,

  /// A moving straight.
  straight,

  /// A bear left.
  bearLeft,

  /// A bear right.
  bearRight,

  /// A turn left.
  turnLeft,

  /// A turn right.
  turnRight,

  /// A sharp turn left.
  sharpLeft,

  /// A sharp turn right.
  sharpRight,

  /// An u-turn.
  uTurn,

  /// A maneuver connected with a ferry.
  ferry,

  /// A maneuver via roundabout.
  roundabout,

  /// A merge of several highways.
  highwayMerge,

  /// An exit from highway.
  highwayExit,

  /// A change of highway.
  highwayChange,

  /// A straight at fork.
  forkCenter,

  /// A maneuver to the left at fork.
  forkLeft,

  /// A maneuver to the right at fork.
  forkRight,

  /// A departure.
  depart,

  /// A connected with trip planning.
  tripItem,

  /// An end of ferry transfer.
  endOfFerry,

  /// A maneuver to the right on ramp.
  rampRight,

  /// A maneuver to the left on ramp.
  rampLeft,

  /// A complex maneuver: turn left, then right.
  turnLeftRight,

  /// A complex maneuver: turn right, then left.
  turnRightLeft,

  /// A complex maneuver: turn right, then right.
  turnRightRight,

  /// A complex maneuver: turn left, then left.
  turnLeftLeft,

  /// A maneuver via pedestrian ramp.
  pedestrianRamp,

  /// A maneuver using elevator.
  elevator,

  /// A maneuver using escalator.
  escalator,

  /// A maneuver using stairs.
  stairs,

  /// A passing through a door.
  doorPassage;

  factory DirectionManeuverType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return unknown;
      case 1:
        return stop;
      case 2:
        return straight;
      case 3:
        return bearLeft;
      case 4:
        return bearRight;
      case 5:
        return turnLeft;
      case 6:
        return turnRight;
      case 7:
        return sharpLeft;
      case 8:
        return sharpRight;
      case 9:
        return uTurn;
      case 10:
        return ferry;
      case 11:
        return roundabout;
      case 12:
        return highwayMerge;
      case 13:
        return highwayExit;
      case 14:
        return highwayChange;
      case 15:
        return forkCenter;
      case 16:
        return forkLeft;
      case 17:
        return forkRight;
      case 18:
        return depart;
      case 19:
        return tripItem;
      case 20:
        return endOfFerry;
      case 21:
        return rampRight;
      case 22:
        return rampLeft;
      case 23:
        return turnLeftRight;
      case 24:
        return turnRightLeft;
      case 25:
        return turnRightRight;
      case 26:
        return turnLeftLeft;
      case 27:
        return pedestrianRamp;
      case 28:
        return elevator;
      case 29:
        return escalator;
      case 30:
        return stairs;
      case 31:
        return doorPassage;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return 0;
      case stop:
        return 1;
      case straight:
        return 2;
      case bearLeft:
        return 3;
      case bearRight:
        return 4;
      case turnLeft:
        return 5;
      case turnRight:
        return 6;
      case sharpLeft:
        return 7;
      case sharpRight:
        return 8;
      case uTurn:
        return 9;
      case ferry:
        return 10;
      case roundabout:
        return 11;
      case highwayMerge:
        return 12;
      case highwayExit:
        return 13;
      case highwayChange:
        return 14;
      case forkCenter:
        return 15;
      case forkLeft:
        return 16;
      case forkRight:
        return 17;
      case depart:
        return 18;
      case tripItem:
        return 19;
      case endOfFerry:
        return 20;
      case rampRight:
        return 21;
      case rampLeft:
        return 22;
      case turnLeftRight:
        return 23;
      case turnRightLeft:
        return 24;
      case turnRightRight:
        return 25;
      case turnLeftLeft:
        return 26;
      case pedestrianRamp:
        return 27;
      case elevator:
        return 28;
      case escalator:
        return 29;
      case stairs:
        return 30;
      case doorPassage:
        return 31;
    }
  }
}

/// A directions string.
final class DirectionMessage implements ffi.Finalizable {
  final RT_DirectionMessageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DirectionMessage_destroy.cast());

  static DirectionMessage? _fromHandle(RT_DirectionMessageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DirectionMessage._withHandle(handle);
  }

  DirectionMessage._withHandle(RT_DirectionMessageHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DirectionMessage_created(_handle);
    }
  }

  /// Direction string text.
  ///
  /// The text for directions.
  String get text {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionMessage_getText(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Direction string type.
  ///
  /// The type of the direction string.
  DirectionMessageType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DirectionMessage_getType(_handle, errorHandler);
    });
    return DirectionMessageType._fromCoreValue(coreValue);
  }
}

/// Type of direction string.
enum DirectionMessageType {
  /// A street name.
  streetName,

  /// An alternative street name.
  alternativeName,

  /// A signpost branch.
  branch,

  /// A signpost toward.
  toward,

  /// An intersected street name.
  crossStreet,

  /// A signpost exit.
  exit;

  factory DirectionMessageType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 9:
        return streetName;
      case 10:
        return alternativeName;
      case 11:
        return branch;
      case 12:
        return toward;
      case 13:
        return crossStreet;
      case 14:
        return exit;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case streetName:
        return 9;
      case alternativeName:
        return 10;
      case branch:
        return 11;
      case toward:
        return 12;
      case crossStreet:
        return 13;
      case exit:
        return 14;
    }
  }
}

/// The network directions output type.
enum DirectionsStyle {
  /// The driving directions generated by this style are good for
  /// desktop/printing apps.
  desktop,

  /// The driving directions generated by this style are good for navigation
  /// applications.
  navigation,

  /// The driving directions generated by this style are good for campus
  /// routing.
  campus;

  factory DirectionsStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return desktop;
      case 1:
        return navigation;
      case 2:
        return campus;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case desktop:
        return 0;
      case navigation:
        return 1;
      case campus:
        return 2;
    }
  }
}

/// A class that represents a facility.
///
/// Facilities represent locations that can serve as the starting point or
/// ending point of a closest facility analysis, for example, a fire station or
/// a hospital. The [Facility] class contains one of location inputs for the
/// [ClosestFacilityTask]. The [ClosestFacilityTask] will create a route between
/// facilities and incidents.
final class Facility implements ffi.Finalizable {
  final RT_FacilityHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Facility_destroy.cast());

  static Facility? _fromHandle(RT_FacilityHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Facility._withHandle(handle);
  }

  Facility._withHandle(RT_FacilityHandle handle)
      : _networkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Facility_getNetworkLocation(
                handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Facility_setNetworkLocation(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Facility_created(_handle);
    }
  }

  /// Creates a facility instance with point.
  ///
  /// Creates a facility.
  ///
  /// Parameters:
  /// - `point` — A point.
  factory Facility({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_createWithPoint(
          point._handle, errorHandler);
    });
    return Facility._withHandle(handle);
  }

  /// Curb approach.
  ///
  /// Default value [CurbApproach.eitherSide] will be returned on error.
  CurbApproach get curbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getCurbApproach(_handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  set curbApproach(CurbApproach value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setCurbApproach(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Current bearing in degrees.
  ///
  /// Current bearing in degrees, measured clockwise from true north. Typical
  /// values are 0 to 360 or NaN, negative values will be subtracted from 360
  /// (e.g. -15 => 345), values greater than 360 will be have 360 subtracted
  /// from them (e.g. 385 => 25). For this property to be used the bearing
  /// tolerance also has to be set.
  double get currentBearing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getCurrentBearing(_handle, errorHandler);
    });
  }

  set currentBearing(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setCurrentBearing(_handle, value, errorHandler);
    });
  }

  /// Current bearing tolerance in degrees. Valid values are 0 to 180 or NaN.
  double get currentBearingTolerance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getCurrentBearingTolerance(
          _handle, errorHandler);
    });
  }

  set currentBearingTolerance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setCurrentBearingTolerance(
          _handle, value, errorHandler);
    });
  }

  /// Distance to network location in meters.
  ///
  /// The distance to network location in meters can be populated by closest
  /// facility task.
  double get distanceToNetworkLocation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getDistanceToNetworkLocation(
          _handle, errorHandler);
    });
  }

  /// Facility ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// facilities with input facilities.
  int get facilityId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getFacilityId(_handle, errorHandler);
    });
  }

  set facilityId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setFacilityId(_handle, value, errorHandler);
    });
  }

  /// The geometry of a facility.
  ///
  /// Gets facility's location using geographical point.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getGeometry(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Impedance cutoff.
  ///
  /// It's a value for the impedance beyond which facilities should not be
  /// found.
  double get impedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getImpedanceCutoff(_handle, errorHandler);
    });
  }

  set impedanceCutoff(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setImpedanceCutoff(_handle, value, errorHandler);
    });
  }

  /// Location status.
  ///
  /// Facility location's status can be populated by closest facility task.
  /// Default value [LocationStatus.notLocated] will be returned on error.
  LocationStatus get locationStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getLocationStatus(_handle, errorHandler);
    });
    return LocationStatus._fromCoreValue(coreValue);
  }

  /// Facility's name.
  ///
  /// Facility's name to be reported in driving directions.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Navigation latency in seconds.
  double get navigationLatency {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getNavigationLatency(
          _handle, errorHandler);
    });
  }

  set navigationLatency(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setNavigationLatency(
          _handle, value, errorHandler);
    });
  }

  /// Navigation speed in meters per second.
  double get navigationSpeed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getNavigationSpeed(_handle, errorHandler);
    });
  }

  set navigationSpeed(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setNavigationSpeed(_handle, value, errorHandler);
    });
  }

  /// Network location.
  ///
  /// The facility's location on the network that can be populated by closest
  /// facility task. Set to null for resetting a network location.
  NetworkLocation? get networkLocation => _networkLocation.value;

  set networkLocation(NetworkLocation? value) => _networkLocation.value = value;

  final Memoized<NetworkLocation?> _networkLocation;

  /// Clones the [Facility].
  ///
  /// Return Value: A new [Facility] with the same values as the current
  /// [Facility].
  Facility clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_clone(_handle, errorHandler);
    });
    return Facility._fromHandle(objectHandle)!;
  }

  /// Gets added cost.
  ///
  /// Returns added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: The value of added cost.
  double getAddedCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Facility_getAddedCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets added cost.
  ///
  /// Sets added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `addedCost` — The added cost.
  void setAddedCost(
      {required String attributeName, required double addedCost}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Facility_setAddedCost(
          _handle, coreAttributeName.bytes, addedCost, errorHandler);
    });
  }
}

/// A class that represents an incident.
///
/// Incidents also represent locations that can serve as the starting point or
/// ending point of a closest facility analysis, for example, a fire or a
/// traffic accident. The [Incident] class contains one of location inputs for
/// the [ClosestFacilityTask]. The [ClosestFacilityTask] will create a route
/// between facilities and incidents.
final class Incident implements ffi.Finalizable {
  final RT_IncidentHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Incident_destroy.cast());

  static Incident? _fromHandle(RT_IncidentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Incident._withHandle(handle);
  }

  Incident._withHandle(RT_IncidentHandle handle)
      : _networkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Incident_getNetworkLocation(
                handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Incident_setNetworkLocation(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Incident_created(_handle);
    }
  }

  /// Creates an incident instance with point.
  ///
  /// Creates an incident.
  ///
  /// Parameters:
  /// - `point` — A point.
  factory Incident({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_createWithPoint(
          point._handle, errorHandler);
    });
    return Incident._withHandle(handle);
  }

  /// Curb approach.
  ///
  /// Default value [CurbApproach.eitherSide] will be returned on error.
  CurbApproach get curbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getCurbApproach(_handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  set curbApproach(CurbApproach value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setCurbApproach(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Current bearing in degrees.
  ///
  /// Current bearing in degrees, measured clockwise from true north. Typical
  /// values are 0 to 360 or NaN, negative values will be subtracted from 360
  /// (e.g. -15 => 345), values greater than 360 will be have 360 subtracted
  /// from them (e.g. 385 => 25). For this property to be used the bearing
  /// tolerance also has to be set.
  double get currentBearing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getCurrentBearing(_handle, errorHandler);
    });
  }

  set currentBearing(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setCurrentBearing(_handle, value, errorHandler);
    });
  }

  /// Current bearing tolerance in degrees. Valid values are 0 to 180 or NaN.
  double get currentBearingTolerance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getCurrentBearingTolerance(
          _handle, errorHandler);
    });
  }

  set currentBearingTolerance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setCurrentBearingTolerance(
          _handle, value, errorHandler);
    });
  }

  /// Distance to network location in meters.
  ///
  /// The distance to network location in meters that can be populated by
  /// closest facility task.
  double get distanceToNetworkLocation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getDistanceToNetworkLocation(
          _handle, errorHandler);
    });
  }

  /// Incident's point geometry.
  ///
  /// Incident's location using geographical point.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getGeometry(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Impedance cutoff.
  ///
  /// It's a value for the impedance beyond which facilities should not be
  /// found.
  double get impedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getImpedanceCutoff(_handle, errorHandler);
    });
  }

  set impedanceCutoff(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setImpedanceCutoff(_handle, value, errorHandler);
    });
  }

  /// Incident ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// incidents with input incidents.
  int get incidentId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getIncidentId(_handle, errorHandler);
    });
  }

  set incidentId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setIncidentId(_handle, value, errorHandler);
    });
  }

  /// Location status.
  ///
  /// Incident location's status that can be populated by closest facility task.
  /// Default value [LocationStatus.notLocated] will be returned on error.
  LocationStatus get locationStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getLocationStatus(_handle, errorHandler);
    });
    return LocationStatus._fromCoreValue(coreValue);
  }

  /// Incident's name.
  ///
  /// Incident's name to be reported in driving directions.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Navigation latency in seconds.
  double get navigationLatency {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getNavigationLatency(
          _handle, errorHandler);
    });
  }

  set navigationLatency(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setNavigationLatency(
          _handle, value, errorHandler);
    });
  }

  /// Navigation speed in meters per second.
  double get navigationSpeed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getNavigationSpeed(_handle, errorHandler);
    });
  }

  set navigationSpeed(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setNavigationSpeed(_handle, value, errorHandler);
    });
  }

  /// Network location.
  ///
  /// The incident's location on the network that can be populated by closest
  /// facility task. Set to null for resetting a network location.
  NetworkLocation? get networkLocation => _networkLocation.value;

  set networkLocation(NetworkLocation? value) => _networkLocation.value = value;

  final Memoized<NetworkLocation?> _networkLocation;

  /// Target facility count.
  ///
  /// The -1 value means target facility count property is not considered, but
  /// default is used instead. Default value can be obtained from
  /// [ClosestFacilityTaskInfo.defaultTargetFacilityCount] method.
  int get targetFacilityCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getTargetFacilityCount(
          _handle, errorHandler);
    });
  }

  set targetFacilityCount(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setTargetFacilityCount(
          _handle, value, errorHandler);
    });
  }

  /// Clones the [Incident].
  ///
  /// Return Value: A new [Incident] with the same values as the current
  /// [Incident].
  Incident clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_clone(_handle, errorHandler);
    });
    return Incident._fromHandle(objectHandle)!;
  }

  /// Gets added cost attribute value.
  ///
  /// Returns added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: The value of added cost.
  double getAddedCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Incident_getAddedCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets added cost.
  ///
  /// Sets added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `addedCost` — The added cost.
  void setAddedCost(
      {required String attributeName, required double addedCost}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Incident_setAddedCost(
          _handle, coreAttributeName.bytes, addedCost, errorHandler);
    });
  }
}

/// Status regarding the network location associated with a stop.
enum LocationStatus {
  /// A not located status.
  notLocated,

  /// Located on closest network element.
  onClosest,

  /// Located on closest network element which is not restricted.
  onClosestNotRestricted,

  /// The network location can't be arrived at by the solver.
  notReached;

  factory LocationStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return notLocated;
      case 1:
        return onClosest;
      case 2:
        return onClosestNotRestricted;
      case 3:
        return notReached;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case notLocated:
        return 0;
      case onClosest:
        return 1;
      case onClosestNotRestricted:
        return 2;
      case notReached:
        return 3;
    }
  }
}

/// An enumeration of the various types of [RouteTaskInfo.directionsSupport]
/// values.
enum NetworkDirectionsSupport {
  /// Directions support is unknown.
  unknown,

  /// Directions are unsupported.
  unsupported,

  /// Directions are supported.
  supported;

  factory NetworkDirectionsSupport._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return unsupported;
      case 1:
        return supported;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case unsupported:
        return 0;
      case supported:
        return 1;
    }
  }
}

/// References a specific location/position along a transportation network
/// source feature.
final class NetworkLocation implements ffi.Finalizable {
  final RT_NetworkLocationHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.NetworkLocation_destroy.cast());

  static NetworkLocation? _fromHandle(RT_NetworkLocationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return NetworkLocation._withHandle(handle);
  }

  NetworkLocation._withHandle(RT_NetworkLocationHandle handle)
      : _sourceObjectPosition = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_NetworkLocation_getSourceObjectPosition(
                handle, errorHandler);
          });
          return SourceObjectPosition._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_NetworkLocation_setSourceObjectPosition(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.NetworkLocation_created(_handle);
    }
  }

  /// Creates a network location instance.
  ///
  /// Creates a network location  object.
  factory NetworkLocation() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_NetworkLocation_create(errorHandler);
    });
    return NetworkLocation._withHandle(handle);
  }

  /// On right side of source.
  ///
  /// True if network element on right side of network source, false -
  /// otherwise.
  bool get onRightSideOfSource {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_NetworkLocation_getOnRightSideOfSource(
          _handle, errorHandler);
    });
  }

  set onRightSideOfSource(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_NetworkLocation_setOnRightSideOfSource(
          _handle, value, errorHandler);
    });
  }

  /// Name of the network source.
  String get sourceName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_NetworkLocation_getSourceName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set sourceName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_NetworkLocation_setSourceName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Source object position.
  ///
  /// The position of network element on network source.
  SourceObjectPosition? get sourceObjectPosition => _sourceObjectPosition.value;

  set sourceObjectPosition(SourceObjectPosition? value) =>
      _sourceObjectPosition.value = value;

  final Memoized<SourceObjectPosition?> _sourceObjectPosition;
}

/// A point barrier object is used to restrict route solving.
///
/// A class that represents a point location to be avoided (or penalized) by a
/// route. A point barrier may represent a restricted location to be avoided by
/// a route (e.g., a car accident) or a location at which some additional delay
/// occurs if visited along a route (e.g., a railroad crossing).
///
/// The point barrier class is derived from the graphic class.
final class PointBarrier implements ffi.Finalizable {
  final RT_PointBarrierHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.PointBarrier_destroy.cast());

  static PointBarrier? _fromHandle(RT_PointBarrierHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PointBarrier._withHandle(handle);
  }

  PointBarrier._withHandle(RT_PointBarrierHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PointBarrier_created(_handle);
    }
  }

  /// Creates a point barrier instance.
  ///
  /// Creates a point barrier.
  ///
  /// Parameters:
  /// - `point` — A point.
  factory PointBarrier({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_createWithPoint(
          point._handle, errorHandler);
    });
    return PointBarrier._withHandle(handle);
  }

  /// Point barrier ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// point barriers with input point barriers.
  int get barrierId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getBarrierId(_handle, errorHandler);
    });
  }

  set barrierId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setBarrierId(_handle, value, errorHandler);
    });
  }

  /// Point barrier's curb approach.
  ///
  /// The curb approach.
  CurbApproach get curbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getCurbApproach(_handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  set curbApproach(CurbApproach value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setCurbApproach(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The geometry of a point barrier.
  ///
  /// The point geometry of Point barrier.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getGeometry(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set geometry(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Location status.
  ///
  /// A location status of the point barrier.
  LocationStatus get locationStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getLocationStatus(
          _handle, errorHandler);
    });
    return LocationStatus._fromCoreValue(coreValue);
  }

  /// The name of a point barrier.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Point barrier's type.
  ///
  /// The type of point barrier.
  BarrierType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getType(_handle, errorHandler);
    });
    return BarrierType._fromCoreValue(coreValue);
  }

  set type(BarrierType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [PointBarrier].
  ///
  /// Return Value: A new [PointBarrier] with the same values as the current
  /// [PointBarrier].
  PointBarrier clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_clone(_handle, errorHandler);
    });
    return PointBarrier._fromHandle(objectHandle)!;
  }

  /// Gets added cost.
  ///
  /// Get the amount of additional cost that has been added for a particular
  /// attribute on this Stop. If no cost has been added, or an incorrect name is
  /// specified, a value of zero will be returned.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: A value of added cost.
  double getAddedCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBarrier_getAddedCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets added cost.
  ///
  /// Set the amount of additional cost for an attribute by name. Any additional
  /// cost, e.g. Minutes, TravelTime, Kilometers, can be modified with this
  /// method.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `addedCost` — The added cost.
  void setAddedCost(
      {required String attributeName, required double addedCost}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBarrier_setAddedCost(
          _handle, coreAttributeName.bytes, addedCost, errorHandler);
    });
  }
}

/// A polygon barrier object is used to restrict route solving.
///
/// A class that represents a polygon feature to be avoided (or penalized) by a
/// route. A polygon barrier may represent a regional area of interest within
/// the network to be avoided (i.e., not entered) by a route (e.g., a flood
/// zone) or to penalize/delay a route within any portions of the area traversed
/// by the route (e.g., a busy downtown area or a bad neighborhood).
///
/// The polygon barrier class is derived from the graphic class.
final class PolygonBarrier implements ffi.Finalizable {
  final RT_PolygonBarrierHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.PolygonBarrier_destroy.cast());

  static PolygonBarrier? _fromHandle(RT_PolygonBarrierHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PolygonBarrier._withHandle(handle);
  }

  PolygonBarrier._withHandle(RT_PolygonBarrierHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PolygonBarrier_created(_handle);
    }
  }

  /// Creates a polygon barrier instance.
  ///
  /// Parameters:
  /// - `polygon` — A polygon.
  factory PolygonBarrier({required Polygon polygon}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_createWithPolygon(
          polygon._handle, errorHandler);
    });
    return PolygonBarrier._withHandle(handle);
  }

  /// Polygon barrier ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// polygon barriers with input polygon barriers.
  int get barrierId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_getBarrierId(_handle, errorHandler);
    });
  }

  set barrierId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolygonBarrier_setBarrierId(_handle, value, errorHandler);
    });
  }

  /// Polygon barrier's geometry.
  ///
  /// The polygon geometry of a Polygon barrier.
  Polygon? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_getGeometry(_handle, errorHandler);
    });
    return Polygon._fromHandle(objectHandle);
  }

  set geometry(Polygon? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolygonBarrier_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The name of a polygon barrier.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolygonBarrier_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Polygon barrier's type.
  BarrierType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_getType(_handle, errorHandler);
    });
    return BarrierType._fromCoreValue(coreValue);
  }

  set type(BarrierType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolygonBarrier_setType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [PolygonBarrier].
  ///
  /// Return Value: A new [PolygonBarrier] with the same values as the current
  /// [PolygonBarrier].
  PolygonBarrier clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_clone(_handle, errorHandler);
    });
    return PolygonBarrier._fromHandle(objectHandle)!;
  }

  /// Gets scale factor for cost.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: A value of scale factor for cost.
  double getScaleFactorForCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBarrier_getScaleFactorForCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets scale factor for cost.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `scaleFactor` — The scale factor for cost.
  void setScaleFactorForCost(
      {required String attributeName, required double scaleFactor}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolygonBarrier_setScaleFactorForCost(
          _handle, coreAttributeName.bytes, scaleFactor, errorHandler);
    });
  }
}

/// A polyline barrier is used to restrict route solving.
///
/// A class that represents a linear feature to be avoided (or penalized) by a
/// route. A polyline barrier may represent a linear feature (e.g., a subpath in
/// the network) to be avoided (i.e., not crossed or followed) by a route or to
/// penalize/delay a route along any portions of the feature traversed by the
/// route (e.g., a stretch of interstate with temporarily reduced speed limits
/// due to local construction along an adjacent lane).
///
/// The polyline barrier class is derived from the graphic class.
final class PolylineBarrier implements ffi.Finalizable {
  final RT_PolylineBarrierHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.PolylineBarrier_destroy.cast());

  static PolylineBarrier? _fromHandle(RT_PolylineBarrierHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PolylineBarrier._withHandle(handle);
  }

  PolylineBarrier._withHandle(RT_PolylineBarrierHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PolylineBarrier_created(_handle);
    }
  }

  /// Creates a polyline barrier instance.
  ///
  /// Creates a polyline barrier.
  ///
  /// Parameters:
  /// - `polyline` — A polyline.
  factory PolylineBarrier({required Polyline polyline}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_createWithPolyline(
          polyline._handle, errorHandler);
    });
    return PolylineBarrier._withHandle(handle);
  }

  /// Polyline barrier ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// polyline barriers with input polyline barriers.
  int get barrierId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_getBarrierId(_handle, errorHandler);
    });
  }

  set barrierId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolylineBarrier_setBarrierId(_handle, value, errorHandler);
    });
  }

  /// The geometry of a polyline barrier.
  ///
  /// The polyline geometry of a Polyline barrier.
  Polyline? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_getGeometry(_handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle);
  }

  set geometry(Polyline? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolylineBarrier_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The name of a polyline barrier.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolylineBarrier_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Polyline barrier's type.
  ///
  /// A type of polyline barrier.
  BarrierType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_getType(_handle, errorHandler);
    });
    return BarrierType._fromCoreValue(coreValue);
  }

  set type(BarrierType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolylineBarrier_setType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [PolylineBarrier].
  ///
  /// Return Value: A new [PolylineBarrier] with the same values as the current
  /// [PolylineBarrier].
  PolylineBarrier clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_clone(_handle, errorHandler);
    });
    return PolylineBarrier._fromHandle(objectHandle)!;
  }

  /// Gets scale factor for cost.
  ///
  /// Returns scale factor for cost.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: A value of scale factor for cost.
  double getScaleFactorForCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBarrier_getScaleFactorForCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets scale factor for cost.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `scaleFactor` — The scale factor for cost.
  void setScaleFactorForCost(
      {required String attributeName, required double scaleFactor}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PolylineBarrier_setScaleFactorForCost(
          _handle, coreAttributeName.bytes, scaleFactor, errorHandler);
    });
  }
}

/// A structure that describes a transportation network restriction attribute.
final class RestrictionAttribute implements ffi.Finalizable {
  final RT_RestrictionAttributeHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.RestrictionAttribute_destroy.cast());

  static RestrictionAttribute? _fromHandle(
      RT_RestrictionAttributeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RestrictionAttribute._withHandle(handle);
  }

  RestrictionAttribute._withHandle(RT_RestrictionAttributeHandle handle)
      : _parameterValues = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RestrictionAttribute_getParameterValues(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RestrictionAttribute_created(_handle);
    }
  }

  /// Parameter values.
  ///
  /// Restriction attribute's parameter values.
  Map<String, dynamic> get parameterValues => _parameterValues.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>> _parameterValues;

  /// Restriction usage parameter name.
  String get restrictionUsageParameterName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_RestrictionAttribute_getRestrictionUsageParameterName(
              _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// A route object contains information about single route.
///
/// A class that contains the output from a route task for a single route. The
/// route contains all necessary output from a successfully- completed route
/// task solve. This includes the cost, shape, and additional metadata specific
/// to the resulting route solution (e.g., route directions, local start/end
/// time, etc.).
final class Route implements ffi.Finalizable {
  final RT_RouteHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Route_destroy.cast());

  static Route? _fromHandle(RT_RouteHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Route._withHandle(handle);
  }

  Route._withHandle(RT_RouteHandle handle)
      : _directionManeuvers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Route_getDirectionManeuvers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _endTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Route_getEndTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Route_getStartTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _stops = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Route_getStops(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Route_created(_handle);
    }
  }

  /// Direction maneuver.
  ///
  /// The list of turn-by-turn directions for this route.
  List<DirectionManeuver> get directionManeuvers => _directionManeuvers.value;

  final Memoized<_ArrayList<DirectionManeuver>> _directionManeuvers;

  /// End time.
  ///
  /// Value of the end time.
  DateTime? get endTime => _endTime.value;

  final Memoized<DateTime?> _endTime;

  /// Time zone shift for end time, in minutes.
  ///
  /// Value of time zone shift for end time, in minutes.
  double get endTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getEndTimeShift(_handle, errorHandler);
    });
  }

  /// Route's geometry.
  ///
  /// The geometry for the full route (polyline).
  Polyline? get routeGeometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getRouteGeometry(_handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle);
  }

  /// Route's name.
  ///
  /// The name of the route.
  String get routeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getRouteName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Start time.
  ///
  /// Value of the start time.
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;

  /// Time zone shift for start time in minutes.
  ///
  /// Value of time zone shift for start time, in minutes.
  double get startTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getStartTimeShift(_handle, errorHandler);
    });
  }

  /// Stops.
  ///
  /// Collection of output stops.
  List<Stop> get stops => _stops.value;

  final Memoized<_ArrayList<Stop>> _stops;

  /// Total length in meters.
  ///
  /// The total length of the route (meters).
  double get totalLength {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getTotalLength(_handle, errorHandler);
    });
  }

  /// Total time in minutes.
  ///
  /// This includes any travel time, time spent waiting at stops (arriving
  /// before the start of a time window), and service time at stops.
  double get totalTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getTotalTime(_handle, errorHandler);
    });
  }

  /// Travel time in minutes.
  ///
  /// This includes only time of the travel.
  double get travelTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getTravelTime(_handle, errorHandler);
    });
  }

  /// Violation time in minutes.
  ///
  /// The total amount of additional time incurred due to time window
  /// violations.
  double get violationTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getViolationTime(_handle, errorHandler);
    });
  }

  /// Wait time in minutes.
  ///
  /// The total amount of additional time incurred due to waiting at time
  /// windows.
  double get waitTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getWaitTime(_handle, errorHandler);
    });
  }

  /// Gets cost.
  ///
  /// Returns the associated cost for this attribute name.
  ///
  /// Parameters:
  /// - `attributeName` — The name of the attribute name e.g. "Minutes" or
  /// "TravelTime".
  ///
  /// Return Value: A value of cost.
  double getCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Route_getCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }
}

/// A route parameters object contains parameters for route calculation.
///
/// A class that contains settings that are used when solving a Route_task. The
/// Route_parameters class contains all inputs for the Route_task, as well as
/// settings such as the impedance attribute, accumulate and restriction
/// attributes, backtrack (u-turn) policy, etc.
final class RouteParameters implements ffi.Finalizable {
  final RT_RouteParametersHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RouteParameters_destroy.cast());

  static RouteParameters? _fromHandle(RT_RouteParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RouteParameters._withHandle(handle);
  }

  RouteParameters._withHandle(RT_RouteParametersHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteParameters_getAccumulateAttributeNames(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteParameters_getOutputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_RouteParameters_setOutputSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteParameters_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_RouteParameters_setStartTime(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _travelMode = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteParameters_getTravelMode(
                handle, errorHandler);
          });
          return TravelMode._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_RouteParameters_setTravelMode(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RouteParameters_created(_handle);
    }
  }

  /// Creates a route parameters.
  ///
  /// Creates a route parameters object.
  factory RouteParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_create(errorHandler);
    });
    return RouteParameters._withHandle(handle);
  }

  /// Accumulate attribute names.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _accumulateAttributeNames;

  /// Directions distance text units.
  ///
  /// A directions distance text units. Describes the unit of measurement for
  /// the length of directions.
  UnitSystem get directionsDistanceUnits {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getDirectionsDistanceUnits(
          _handle, errorHandler);
    });
    return UnitSystem._fromCoreValue(coreValue);
  }

  set directionsDistanceUnits(UnitSystem value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setDirectionsDistanceUnits(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Directions language.
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set directionsLanguage(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setDirectionsLanguage(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Directions style.
  ///
  /// A directions style. The directions setting to generate directions designed
  /// for different kind of applications.
  DirectionsStyle get directionsStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getDirectionsStyle(
          _handle, errorHandler);
    });
    return DirectionsStyle._fromCoreValue(coreValue);
  }

  set directionsStyle(DirectionsStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setDirectionsStyle(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Find best sequence.
  bool get findBestSequence {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getFindBestSequence(
          _handle, errorHandler);
    });
  }

  set findBestSequence(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setFindBestSequence(
          _handle, value, errorHandler);
    });
  }

  /// Output spatial reference.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  set outputSpatialReference(SpatialReference? value) =>
      _outputSpatialReference.value = value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Preserve first stop.
  bool get preserveFirstStop {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getPreserveFirstStop(
          _handle, errorHandler);
    });
  }

  set preserveFirstStop(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPreserveFirstStop(
          _handle, value, errorHandler);
    });
  }

  /// Preserve last stop.
  bool get preserveLastStop {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getPreserveLastStop(
          _handle, errorHandler);
    });
  }

  set preserveLastStop(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPreserveLastStop(
          _handle, value, errorHandler);
    });
  }

  /// Return directions status.
  bool get returnDirections {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnDirections(
          _handle, errorHandler);
    });
  }

  set returnDirections(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnDirections(
          _handle, value, errorHandler);
    });
  }

  /// Return point barriers.
  bool get returnPointBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnPointBarriers(
          _handle, errorHandler);
    });
  }

  set returnPointBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnPointBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Return polygon barriers.
  bool get returnPolygonBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnPolygonBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolygonBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnPolygonBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Return polyline barriers.
  bool get returnPolylineBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnPolylineBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolylineBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnPolylineBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Return routes.
  bool get returnRoutes {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnRoutes(
          _handle, errorHandler);
    });
  }

  set returnRoutes(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnRoutes(
          _handle, value, errorHandler);
    });
  }

  /// Return stops.
  bool get returnStops {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getReturnStops(
          _handle, errorHandler);
    });
  }

  set returnStops(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setReturnStops(
          _handle, value, errorHandler);
    });
  }

  /// Route shape type.
  RouteShapeType get routeShapeType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getRouteShapeType(
          _handle, errorHandler);
    });
    return RouteShapeType._fromCoreValue(coreValue);
  }

  set routeShapeType(RouteShapeType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setRouteShapeType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Start time.
  DateTime? get startTime => _startTime.value;

  set startTime(DateTime? value) => _startTime.value = value;

  final Memoized<DateTime?> _startTime;

  /// Travel mode.
  ///
  /// Travel mode instance for route parameters.
  TravelMode? get travelMode => _travelMode.value;

  set travelMode(TravelMode? value) => _travelMode.value = value;

  final Memoized<TravelMode?> _travelMode;

  /// Clears point barriers.
  void clearPointBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_clearPointBarriers(_handle, errorHandler);
    });
  }

  /// Clears polygon barriers.
  void clearPolygonBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_clearPolygonBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears polyline barriers.
  void clearPolylineBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_clearPolylineBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears stops.
  void clearStops() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_clearStops(_handle, errorHandler);
    });
  }

  /// Clones the [RouteParameters].
  ///
  /// Return Value: A new [RouteParameters] with the same values as the current
  /// [RouteParameters].
  RouteParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_clone(_handle, errorHandler);
    });
    return RouteParameters._fromHandle(objectHandle)!;
  }

  /// Gets the search where clause from the specified network dataset's source
  /// feature class.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class to
  /// retrieve the where clause from.
  ///
  /// Return Value: A [String].
  String getSearchWhereClause({required String sourceName}) {
    final coreSourceName = _CString(sourceName);
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteParameters_getSearchWhereClause(
          _handle, coreSourceName.bytes, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Sets point barriers.
  ///
  /// Parameters:
  /// - `pointBarriers` — A [List] of [PointBarrier] instances. Contents of the
  /// [List] are copied.
  void setPointBarriers(List<PointBarrier> pointBarriers) {
    final corePointBarriers =
        pointBarriers.toMutableArray(valueType: _ElementType.pointBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPointBarriers(
          _handle, corePointBarriers._handle, errorHandler);
    });
  }

  /// Sets the point barriers from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPointBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPointBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets polygon barriers.
  ///
  /// Parameters:
  /// - `polygonBarriers` — A [List] of [PolygonBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolygonBarriers(List<PolygonBarrier> polygonBarriers) {
    final corePolygonBarriers =
        polygonBarriers.toMutableArray(valueType: _ElementType.polygonBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPolygonBarriers(
          _handle, corePolygonBarriers._handle, errorHandler);
    });
  }

  /// Sets the polygon barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polygon. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolygonBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPolygonBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets polyline barriers.
  ///
  /// Parameters:
  /// - `lineBarriers` — A [List] of [PolylineBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolylineBarriers({required List<PolylineBarrier> lineBarriers}) {
    final coreLineBarriers =
        lineBarriers.toMutableArray(valueType: _ElementType.polylineBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPolylineBarriers(
          _handle, coreLineBarriers._handle, errorHandler);
    });
  }

  /// Sets the polyline barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polyline. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolylineBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setPolylineBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets a search where clause on the specified network dataset's source
  /// feature class. Only features satisfying the where clause for the specified
  /// feature class will be used to locate stops on the network during the solve
  /// operation. If a where clause is not set all network features are used.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class
  /// the where clause will be applied to.
  /// - `searchWhereClause` — The search where clause.
  void setSearchWhereClause(
      {required String sourceName, required String searchWhereClause}) {
    final coreSourceName = _CString(sourceName);
    final coreSearchWhereClause = _CString(searchWhereClause);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setSearchWhereClause(_handle,
          coreSourceName.bytes, coreSearchWhereClause.bytes, errorHandler);
    });
  }

  /// Sets stops.
  ///
  /// Parameters:
  /// - `stops` — A [List] of [Stop] instances. Contents of the [List] are
  /// copied.
  void setStops(List<Stop> stops) {
    final coreStops = stops.toMutableArray(valueType: _ElementType.stop);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setStops(
          _handle, coreStops._handle, errorHandler);
    });
  }

  /// Sets the stops from the features in specified feature table. The feature
  /// table can be either local or online. The feature table must be of geometry
  /// type point. Attributes from the feature table are mapped to the properties
  /// on the stops objects generated from the specified feature table. The where
  /// clause set in the query parameters will be applied to the feature table.
  /// If an online feature table is specified the features will not be queried
  /// until Solve is called.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setStopsWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteParameters_setStopsWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }
}

/// A route result object contains output of route task's solve.
///
/// A class that contains the output results from a route task. The route result
/// contains all necessary output from a successfully- completed route task
/// solve. This includes collection of routes, barriers and messages.
final class RouteResult implements ffi.Finalizable {
  final RT_RouteResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RouteResult_destroy.cast());

  static RouteResult? _fromHandle(RT_RouteResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RouteResult._withHandle(handle);
  }

  RouteResult._withHandle(RT_RouteResultHandle handle)
      : _messages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteResult_getMessages(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _pointBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteResult_getPointBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polygonBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteResult_getPolygonBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polylineBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteResult_getPolylineBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _routes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteResult_getRoutes(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RouteResult_created(_handle);
    }
  }

  /// Directions language.
  ///
  /// Language of directions.
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteResult_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Messages.
  ///
  /// Messages received when solve is completed. If a route cannot be solved,
  /// the message returned by the server identifies the route that could not be
  /// solved.
  List<String> get messages => _messages.value;

  final Memoized<_ArrayList<String>> _messages;

  /// Point barriers.
  ///
  /// Barriers are only returned if [RouteParameters.returnPointBarriers] is
  /// true.
  List<PointBarrier> get pointBarriers => _pointBarriers.value;

  final Memoized<_ArrayList<PointBarrier>> _pointBarriers;

  /// Polygon barriers.
  ///
  /// Barriers are only returned if [RouteParameters.returnPolygonBarriers] is
  /// true.
  List<PolygonBarrier> get polygonBarriers => _polygonBarriers.value;

  final Memoized<_ArrayList<PolygonBarrier>> _polygonBarriers;

  /// Polyline barriers.
  ///
  /// Barriers are only returned if [RouteParameters.returnPolylineBarriers] is
  /// true.
  List<PolylineBarrier> get polylineBarriers => _polylineBarriers.value;

  final Memoized<_ArrayList<PolylineBarrier>> _polylineBarriers;

  /// Routes.
  ///
  /// Each object represents a separate route with independent driving
  /// directions.
  List<Route> get routes => _routes.value;

  final Memoized<_ArrayList<Route>> _routes;
}

/// The type of shape output for a route.
enum RouteShapeType {
  /// A none shape type.
  none,

  /// A straight line shape type.
  straightLine,

  /// A true shape type with measures.
  trueShapeWithMeasures;

  factory RouteShapeType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return straightLine;
      case 2:
        return trueShapeWithMeasures;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case straightLine:
        return 1;
      case trueShapeWithMeasures:
        return 2;
    }
  }
}

/// A route task object is used for calculation route by specified parameters.
///
/// A class that implements the route task. The route task class uses a
/// transportation network to create a route between multiple stops. The route
/// generated and the results returned honor the settings provided by a route
/// settings object.
final class RouteTask
    with Loadable
    implements
        ApiKeyResource,
        _CallbackReceiver,
        _Resourceable,
        ffi.Finalizable {
  final RT_RouteTaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RouteTask_destroy.cast());

  static RouteTask? _fromHandle(RT_RouteTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RouteTask._withHandle(handle);
  }

  RouteTask._withHandle(RT_RouteTaskHandle handle)
      : _transportationNetworkDataset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTask_getTransportationNetworkDataset(
                handle, errorHandler);
          });
          return TransportationNetworkDataset._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTask_getURL(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RouteTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_RouteTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_RouteTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_RouteTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_RouteTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );

    _setResourceProvider(_resourceProvider);
  }

  /// Creates a route task with path to geodatabase.
  ///
  /// Creates a route task.
  ///
  /// Parameters:
  /// - `dataset` — A transportation network dataset.
  factory RouteTask.withDataset(TransportationNetworkDataset dataset) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createWithDataset(
          dataset._handle, errorHandler);
    });
    return RouteTask._withHandle(handle);
  }

  /// Creates a route task with path to geodatabase.
  ///
  /// Creates a route task.
  ///
  /// Parameters:
  /// - `pathToDatabase` — A path to geodatabase.
  /// - `networkName` — A network name.
  factory RouteTask.withGeodatabase(
      {required Uri pathToDatabase, required String networkName}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePathToDatabase = _CString(pathToDatabase.toFilePath());
    final coreNetworkName = _CString(networkName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createWithGeodatabase(
          corePathToDatabase.bytes, coreNetworkName.bytes, errorHandler);
    });
    return RouteTask._withHandle(handle);
  }

  /// Creates a route task with URL.
  ///
  /// Creates a route task with specified service URL.
  ///
  /// Parameters:
  /// - `uri` — An URL to online routing services.
  factory RouteTask.withUrl(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return RouteTask._withHandle(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Transportation network dataset of local route task.
  TransportationNetworkDataset? get transportationNetworkDataset =>
      _transportationNetworkDataset.value;

  final Memoized<TransportationNetworkDataset?> _transportationNetworkDataset;

  /// The URL of online service.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Creates default parameters.
  ///
  /// Generates default parameters.
  ///
  /// Return Value: A [Future] that returns a [RouteParameters].
  Future<RouteParameters> createDefaultParameters() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsRouteParameters()!);
  }

  /// Cancelable version of [createDefaultParameters]. See that method for more
  /// information.
  CancelableOperation<RouteParameters> createDefaultParametersCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsRouteParameters()!);
  }

  /// Imports route parameters from feature collection and then adjusts imported
  /// parameters to current Route task.
  ///
  /// Travel mode would be null if it could not be created from the route layer
  /// settings for the route task's network. In case if travel mode is null then
  /// client can override it by another travel mode (for example obtained from
  /// [RouteTaskInfo]). Accumulate attributes from Route Info table going to be
  /// applied only if they exist in transportation network restriction and cost
  /// attributes.
  ///
  /// Parameters:
  /// - `collection` — The feature collection object that contains stops, route
  /// info, and barriers tables. Stops table is required.
  ///
  /// Return Value: A [Future] that returns a [RouteParameters].
  Future<RouteParameters> createParameters(
      {required FeatureCollection collection}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createParametersAsync(
          _handle, collection._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsRouteParameters()!);
  }

  /// Cancelable version of [createParameters]. See that method for more
  /// information.
  CancelableOperation<RouteParameters> createParametersCancelable(
      {required FeatureCollection collection}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createParametersAsync(
          _handle, collection._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsRouteParameters()!);
  }

  /// Imports route parameters from portal item and then adjusts imported
  /// parameters to current Route task.
  ///
  /// Travel mode would be null if it could not be created from the route layer
  /// settings for the route task's network. In case if travel mode is null then
  /// client can override it by another travel mode (for example obtained from
  /// [RouteTaskInfo]). Accumulate attributes from Route Info table going to be
  /// applied only if they exist in transportation network restriction and cost
  /// attributes.
  ///
  /// Parameters:
  /// - `portalItem` — The portal item object with feature collection that
  /// contains stops, route info, and barriers tables. Stops table is required.
  ///
  /// Return Value: A [Future] that returns a [RouteParameters].
  Future<RouteParameters> createParametersWithPortalItem(
      PortalItem portalItem) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createParametersWithPortalItemAsync(
          _handle, portalItem._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsRouteParameters()!);
  }

  /// Cancelable version of [createParametersWithPortalItem]. See that method
  /// for more information.
  CancelableOperation<RouteParameters> createParametersWithPortalItemCancelable(
      PortalItem portalItem) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createParametersWithPortalItemAsync(
          _handle, portalItem._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsRouteParameters()!);
  }

  /// Imports route result from portal item.
  ///
  /// Parameters:
  /// - `portalItem` — The portal item with feature collection that contains
  /// directions, stops, route info, and barriers tables.
  ///
  /// Return Value: A [Future] that returns a [RouteResult].
  static Future<RouteResult> createRouteResult(PortalItem portalItem) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createRouteResultAsync(
          portalItem._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsRouteResult()!);
  }

  /// Cancelable version of [createRouteResult]. See that method for more
  /// information.
  static CancelableOperation<RouteResult> createRouteResultCancelable(
      PortalItem portalItem) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_createRouteResultAsync(
          portalItem._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsRouteResult()!);
  }

  /// Imports route result from feature collection.
  ///
  /// Parameters:
  /// - `collection` — The feature collection that contains directions, stops,
  /// route info, and barriers tables.
  ///
  /// Return Value: A [Future] that returns a [RouteResult].
  static Future<RouteResult> createRouteResultWithFeatureCollection(
      {required FeatureCollection collection}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_RouteTask_createRouteResultWithFeatureCollectionAsync(
              collection._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsRouteResult()!);
  }

  /// Cancelable version of [createRouteResultWithFeatureCollection]. See that
  /// method for more information.
  static CancelableOperation<RouteResult>
      createRouteResultWithFeatureCollectionCancelable(
          {required FeatureCollection collection}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_RouteTask_createRouteResultWithFeatureCollectionAsync(
              collection._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsRouteResult()!);
  }

  /// Gets route task info.
  ///
  /// Generates default parameters.
  ///
  /// Return Value: A [RouteTaskInfo].
  RouteTaskInfo getRouteTaskInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_getRouteTaskInfo(_handle, errorHandler);
    });
    return RouteTaskInfo._fromHandle(objectHandle)!;
  }

  /// Creates a new route result based on previously generated route result
  /// using a given time and location.
  ///
  /// The updated route will follow the same path as the original route (from
  /// the current location) and have updated ETAs, costs, and directions. The
  /// update route can be used to report more accurate ETAs or check for time
  /// window violations due to unexpected delays encountered while traversing
  /// the route. Only the [Route] referenced by the routeIndex will be updated,
  /// all others will be copied as is.
  ///
  /// Parameters:
  /// - `routeResult` — The [RouteResult] object.
  /// - `routeIndex` — The index (zero-based) of the [Route] in [RouteResult] to
  /// be updated.
  /// - `travelMode` — The travel mode to be used refreshing the route.
  /// - `remainingDestinationCount` — The number of unvisited stops
  /// (destinations) not including waypoints.
  /// - `locationOnRoute` — The location to be used refreshing the route.
  /// - `dateTime` — The time to be used refreshing the route.
  ///
  /// Return Value: A [Future] that returns a new [RouteResult] type with the
  /// updated result.
  Future<RouteResult> _refreshRoute(
      {required RouteResult routeResult,
      required int routeIndex,
      required TravelMode travelMode,
      required int remainingDestinationCount,
      required ArcGISLocation locationOnRoute,
      required DateTime dateTime}) {
    final coreDateTime = dateTime.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_refreshRouteAsync(
          _handle,
          routeResult._handle,
          routeIndex,
          travelMode._handle,
          remainingDestinationCount,
          locationOnRoute._handle,
          coreDateTime._handle,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsRouteResult()!);
  }

  /// Cancelable version of [_refreshRoute]. See that method for more
  /// information.
  CancelableOperation<RouteResult> _refreshRouteCancelable(
      {required RouteResult routeResult,
      required int routeIndex,
      required TravelMode travelMode,
      required int remainingDestinationCount,
      required ArcGISLocation locationOnRoute,
      required DateTime dateTime}) {
    final coreDateTime = dateTime.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_refreshRouteAsync(
          _handle,
          routeResult._handle,
          routeIndex,
          travelMode._handle,
          remainingDestinationCount,
          locationOnRoute._handle,
          coreDateTime._handle,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsRouteResult()!);
  }

  @override
  void _setResourceProvider(_ResourceProvider? resourceProvider) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteTask_setResourceProvider(
          _handle, resourceProvider?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Solves a route passing in a parameters object.
  ///
  /// Parameters:
  /// - `routeParameters` — The route parameters.
  ///
  /// Return Value: A [Future] that returns a [RouteResult] type.
  Future<RouteResult> solveRoute({required RouteParameters routeParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_solveRouteAsync(
          _handle, routeParameters._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsRouteResult()!);
  }

  /// Cancelable version of [solveRoute]. See that method for more information.
  CancelableOperation<RouteResult> solveRouteCancelable(
      {required RouteParameters routeParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_solveRouteAsync(
          _handle, routeParameters._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsRouteResult()!);
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTask_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RouteTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _transportationNetworkDataset.invalidateCache();
    _uri.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLoadableDoneLoadingEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _doneLoadingStreamController.add(event);
      case AsyncType.asyncTypeLoadableLoadStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LoadStatus._fromCoreValue(coreValue);
        }();
        _loadStatusChangedStreamController.add(event);
      default:
        logger.f('RouteTask unhandled asyncType $asyncType');
    }
  }
}

/// A class that describes the transportation network that a route task is bound
/// to.
final class RouteTaskInfo implements ffi.Finalizable {
  final RT_RouteTaskInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RouteTaskInfo_destroy.cast());

  static RouteTaskInfo? _fromHandle(RT_RouteTaskInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RouteTaskInfo._withHandle(handle);
  }

  RouteTaskInfo._withHandle(RT_RouteTaskInfoHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getAccumulateAttributeNames(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _costAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getCostAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getOutputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _restrictionAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getRestrictionAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _supportedLanguages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getSupportedLanguages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _supportedRestrictionUsageParameterValues = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_RouteTaskInfo_getSupportedRestrictionUsageParameterValues(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _travelModes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RouteTaskInfo_getTravelModes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RouteTaskInfo_created(_handle);
    }
  }

  /// Accumulate attribute names.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_ArrayList<String>> _accumulateAttributeNames;

  /// Cost attributes.
  Map<String, CostAttribute> get costAttributes => _costAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, CostAttribute>>
      _costAttributes;

  /// Default travel mode's name.
  String get defaultTravelModeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getDefaultTravelModeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Directions distance text units.
  UnitSystem get directionsDistanceUnits {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getDirectionsDistanceUnits(
          _handle, errorHandler);
    });
    return UnitSystem._fromCoreValue(coreValue);
  }

  /// Directions language.
  String get directionsLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getDirectionsLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Directions style.
  ///
  /// A directions style. The directions setting to generate directions designed
  /// for different kind of applications.
  DirectionsStyle get directionsStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getDirectionsStyle(
          _handle, errorHandler);
    });
    return DirectionsStyle._fromCoreValue(coreValue);
  }

  /// Whether the underlying network dataset supports the returning of
  /// directions.
  ///
  /// For services prior to ArcGIS 10.8, this value will be
  /// [NetworkDirectionsSupport.unknown].
  NetworkDirectionsSupport get directionsSupport {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getDirectionsSupport(
          _handle, errorHandler);
    });
    return NetworkDirectionsSupport._fromCoreValue(coreValue);
  }

  /// Find best sequence.
  bool get findBestSequence {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getFindBestSequence(
          _handle, errorHandler);
    });
  }

  /// Maximum locating distance is the furthest distance in meters that Network
  /// Analyst searches when locating or relocating a point onto the network.
  ///
  /// The search looks for suitable edges or junctions and snaps the point to
  /// the nearest one. If a suitable location isn't found within the maximum
  /// locating distance, the object is marked as unlocated.
  double get maxLocatingDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getMaxLocatingDistance(
          _handle, errorHandler);
    });
  }

  /// Network name.
  String get networkName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getNetworkName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Output spatial reference.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Preserve first stop.
  bool get preserveFirstStop {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getPreserveFirstStop(
          _handle, errorHandler);
    });
  }

  /// Preserve last stop.
  bool get preserveLastStop {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getPreserveLastStop(
          _handle, errorHandler);
    });
  }

  /// Restriction attributes.
  Map<String, RestrictionAttribute> get restrictionAttributes =>
      _restrictionAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, RestrictionAttribute>>
      _restrictionAttributes;

  /// Route shape type.
  RouteShapeType get routeShapeType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getRouteShapeType(
          _handle, errorHandler);
    });
    return RouteShapeType._fromCoreValue(coreValue);
  }

  /// Start time.
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;

  /// Array of supported languages.
  List<String> get supportedLanguages => _supportedLanguages.value;

  final Memoized<_ArrayList<String>> _supportedLanguages;

  /// Array of supported restriction usage parameter values.
  List<String> get supportedRestrictionUsageParameterValues =>
      _supportedRestrictionUsageParameterValues.value;

  final Memoized<_ArrayList<String>> _supportedRestrictionUsageParameterValues;

  /// Value of service property "Supports Rerouting"
  ///
  /// If property doesn't exist on service value will be false. For local data
  /// value will be true.
  bool get supportsRerouting {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RouteTaskInfo_getSupportsRerouting(
          _handle, errorHandler);
    });
  }

  /// Array of travel modes.
  List<TravelMode> get travelModes => _travelModes.value;

  final Memoized<_ArrayList<TravelMode>> _travelModes;
}

/// A class that describes service area facility.
///
/// Facilities represent locations from which service areas need to be
/// calculated. For example, a fire station can be set as a facility to find
/// which areas it can serve within a 10 minute service area. A hospital can be
/// set as the facility to find what proportion of the population is within a 2
/// mile driving distance.
final class ServiceAreaFacility implements ffi.Finalizable {
  final RT_ServiceAreaFacilityHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ServiceAreaFacility_destroy.cast());

  static ServiceAreaFacility? _fromHandle(RT_ServiceAreaFacilityHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaFacility._withHandle(handle);
  }

  ServiceAreaFacility._withHandle(RT_ServiceAreaFacilityHandle handle)
      : _impedanceCutoffs = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaFacility_getImpedanceCutoffs(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _networkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaFacility_getNetworkLocation(
                handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ServiceAreaFacility_setNetworkLocation(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaFacility_created(_handle);
    }
  }

  /// Creates a service area facility instance with point.
  ///
  /// Creates a facility.
  ///
  /// Parameters:
  /// - `point` — A point.
  factory ServiceAreaFacility({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_createWithPoint(
          point._handle, errorHandler);
    });
    return ServiceAreaFacility._withHandle(handle);
  }

  /// Curb approach.
  ///
  /// Default value [CurbApproach.eitherSide] will be returned on error.
  CurbApproach get curbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getCurbApproach(
          _handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  set curbApproach(CurbApproach value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setCurbApproach(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Current bearing in degrees.
  ///
  /// Current bearing in degrees, measured clockwise from true north. Typical
  /// values are 0 to 360 or NaN, negative values will be subtracted from 360
  /// (e.g. -15 => 345), values greater than 360 will be have 360 subtracted
  /// from them (e.g. 385 => 25). For this property to be used the bearing
  /// tolerance also has to be set.
  double get currentBearing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getCurrentBearing(
          _handle, errorHandler);
    });
  }

  set currentBearing(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setCurrentBearing(
          _handle, value, errorHandler);
    });
  }

  /// Current bearing tolerance in degrees. Valid values are 0 to 180 or NaN.
  double get currentBearingTolerance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getCurrentBearingTolerance(
          _handle, errorHandler);
    });
  }

  set currentBearingTolerance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setCurrentBearingTolerance(
          _handle, value, errorHandler);
    });
  }

  /// Distance to network location in meters.
  ///
  /// The distance to network location in meters can be populated by service
  /// area task.
  double get distanceToNetworkLocation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getDistanceToNetworkLocation(
          _handle, errorHandler);
    });
  }

  /// Service area facility ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// facilities with input facilities.
  int get facilityId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getFacilityId(
          _handle, errorHandler);
    });
  }

  set facilityId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setFacilityId(
          _handle, value, errorHandler);
    });
  }

  /// The geometry of a service area facility.
  ///
  /// Gets service area facility's location using geographical point.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getGeometry(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// The impedance cutoffs value.
  ///
  /// Cutoffs specify the quantity of the impedance to apply. They constrain the
  /// extent of the service area to be calculated. For example, if you apply
  /// breaks of 5, 10, and 15 when the impedance is set to Time, the service
  /// area will include those streets that can be reached within 5, 10, and 15
  /// minutes. The value specified in the impedance cutoffs property overrides
  /// the Default Cutoffs analysis setting. If no value for the impedance
  /// cutoffs property is specified, service area are generated for the facility
  /// based on the Default Cutoffs setting.
  List<double> get impedanceCutoffs => _impedanceCutoffs.value;

  final Memoized<_MutableArrayList<double>> _impedanceCutoffs;

  /// Location status.
  ///
  /// Facility location's status can be populated by service area task. Default
  /// value [LocationStatus.notLocated] will be returned on error.
  LocationStatus get locationStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getLocationStatus(
          _handle, errorHandler);
    });
    return LocationStatus._fromCoreValue(coreValue);
  }

  /// Service area facility's name.
  ///
  /// Service area facility's name to be reported.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Navigation latency in seconds.
  double get navigationLatency {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getNavigationLatency(
          _handle, errorHandler);
    });
  }

  set navigationLatency(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setNavigationLatency(
          _handle, value, errorHandler);
    });
  }

  /// Navigation speed in meters per second.
  double get navigationSpeed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getNavigationSpeed(
          _handle, errorHandler);
    });
  }

  set navigationSpeed(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setNavigationSpeed(
          _handle, value, errorHandler);
    });
  }

  /// Network location.
  ///
  /// The service area facility's location on the network that can be populated
  /// by service area task. Set to null for resetting a network location.
  NetworkLocation? get networkLocation => _networkLocation.value;

  set networkLocation(NetworkLocation? value) => _networkLocation.value = value;

  final Memoized<NetworkLocation?> _networkLocation;

  /// Clones the [ServiceAreaFacility].
  ///
  /// Return Value: A new [ServiceAreaFacility] with the same values as the
  /// current [ServiceAreaFacility].
  ServiceAreaFacility clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_clone(_handle, errorHandler);
    });
    return ServiceAreaFacility._fromHandle(objectHandle)!;
  }

  /// Gets added cost.
  ///
  /// Returns added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: The value of added cost.
  double getAddedCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaFacility_getAddedCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets added cost.
  ///
  /// Sets added cost value for given impedance or accumulate attribute.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  /// - `addedCost` — The added cost.
  void setAddedCost(
      {required String attributeName, required double addedCost}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaFacility_setAddedCost(
          _handle, coreAttributeName.bytes, addedCost, errorHandler);
    });
  }
}

/// Service area overlap geometry.
///
/// Specifies the behavior of service-area output from multiple facilities in
/// relation to one another.
enum ServiceAreaOverlapGeometry {
  /// Creates individual polygons or sets of lines for each facility. The
  /// polygons or lines can overlap each other.
  overlap,

  /// Joins the polygons of multiple facilities that have the same cutoff value
  /// into a single polygon. Lines will not overlap each other.
  dissolve,

  /// Area is assigned to the closest facility so polygons or lines do not
  /// overlap each other.
  split;

  factory ServiceAreaOverlapGeometry._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return overlap;
      case 1:
        return dissolve;
      case 2:
        return split;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case overlap:
        return 0;
      case dissolve:
        return 1;
      case split:
        return 2;
    }
  }
}

/// A class that describes the service area parameters.
///
/// Class holding the parameters of a service area to be solved by
/// [ServiceAreaTask]. The default parameters for a [ServiceAreaTask] can be
/// retrieved by calling [ServiceAreaTask.createDefaultParameters] method.
final class ServiceAreaParameters implements ffi.Finalizable {
  final RT_ServiceAreaParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ServiceAreaParameters_destroy.cast());

  static ServiceAreaParameters? _fromHandle(
      RT_ServiceAreaParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaParameters._withHandle(handle);
  }

  ServiceAreaParameters._withHandle(RT_ServiceAreaParametersHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaParameters_getAccumulateAttributeNames(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _defaultImpedanceCutoffs = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaParameters_getDefaultImpedanceCutoffs(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaParameters_getOutputSpatialReference(
                    handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ServiceAreaParameters_setOutputSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaParameters_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ServiceAreaParameters_setStartTime(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _travelMode = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaParameters_getTravelMode(
                handle, errorHandler);
          });
          return TravelMode._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ServiceAreaParameters_setTravelMode(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaParameters_created(_handle);
    }
  }

  /// Accumulate attribute names.
  ///
  /// The accumulate attribute names e.g. "Minutes", "Miles", etc. Accumulate
  /// attributes are useful when more information other than the default
  /// impedance attribute is required.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _accumulateAttributeNames;

  /// The default cutoffs value.
  ///
  /// Cutoffs specify the quantity of the impedance to apply. They constrain the
  /// extent of the service area to be calculated. For example, if you apply
  /// breaks of 5, 10, and 15 when the impedance is set to Time, the service
  /// area will include those streets that can be reached within 5, 10, and 15
  /// minutes. The cutoffs you specify in the defaultBreaks property are applied
  /// to all facilities that don't contain their own cutoffs.
  List<double> get defaultImpedanceCutoffs => _defaultImpedanceCutoffs.value;

  final Memoized<_MutableArrayList<double>> _defaultImpedanceCutoffs;

  /// Geometry at cutoff.
  ///
  /// Specifies the behavior of service area output for a single facility when
  /// multiple cutoff values are specified. This parameter does not apply to
  /// line output. Default value [ServiceAreaPolygonCutoffGeometry.rings] will
  /// be returned on error.
  ServiceAreaPolygonCutoffGeometry get geometryAtCutoff {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getGeometryAtCutoff(
          _handle, errorHandler);
    });
    return ServiceAreaPolygonCutoffGeometry._fromCoreValue(coreValue);
  }

  set geometryAtCutoff(ServiceAreaPolygonCutoffGeometry value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setGeometryAtCutoff(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Geometry at overlap.
  ///
  /// Specifies the behavior of service-area output from multiple facilities in
  /// relation to one another. Default value
  /// [ServiceAreaOverlapGeometry.overlap] will be returned on error.
  ServiceAreaOverlapGeometry get geometryAtOverlap {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getGeometryAtOverlap(
          _handle, errorHandler);
    });
    return ServiceAreaOverlapGeometry._fromCoreValue(coreValue);
  }

  set geometryAtOverlap(ServiceAreaOverlapGeometry value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setGeometryAtOverlap(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Output spatial reference.
  ///
  /// All route's geometries will be returned in this spatial reference in the
  /// even of a successful solve.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  set outputSpatialReference(SpatialReference? value) =>
      _outputSpatialReference.value = value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Polygon buffer distance.
  ///
  /// The polygon buffer refers to the distance from the road the service area
  /// polygon should extend when no other reachable roads are nearby, similar to
  /// a line buffer size. This is useful if the network is very sparse and you
  /// don't want the service area to cover large areas where there are no
  /// features.
  double get polygonBufferDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getPolygonBufferDistance(
          _handle, errorHandler);
    });
  }

  set polygonBufferDistance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolygonBufferDistance(
          _handle, value, errorHandler);
    });
  }

  /// Polygon detail.
  ///
  /// Specifies the level of detail of the output polygons. If your analysis
  /// covers an urban area with a grid-like street network, the difference
  /// between generalized and standard polygons will be minimal. However, for
  /// mountain and rural roads, the standard and detailed polygons may present
  /// significantly more accurate results than generalized polygons. Default
  /// value [ServiceAreaPolygonDetail.standard] will be returned on error.
  ServiceAreaPolygonDetail get polygonDetail {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getPolygonDetail(
          _handle, errorHandler);
    });
    return ServiceAreaPolygonDetail._fromCoreValue(coreValue);
  }

  set polygonDetail(ServiceAreaPolygonDetail value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolygonDetail(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Whether or not to return the point barriers used in the service area task.
  bool get returnPointBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getReturnPointBarriers(
          _handle, errorHandler);
    });
  }

  set returnPointBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setReturnPointBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not to return the polygon barriers used in the service area
  /// task.
  bool get returnPolygonBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getReturnPolygonBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolygonBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setReturnPolygonBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not return service area polygons are to be returned.
  ///
  /// Enabled by default. Can be returned in the [ServiceAreaResult] of a
  /// successful solve.
  bool get returnPolygons {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getReturnPolygons(
          _handle, errorHandler);
    });
  }

  set returnPolygons(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setReturnPolygons(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not to return the polyline barriers used in the service area
  /// task.
  bool get returnPolylineBarriers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getReturnPolylineBarriers(
          _handle, errorHandler);
    });
  }

  set returnPolylineBarriers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setReturnPolylineBarriers(
          _handle, value, errorHandler);
    });
  }

  /// Whether or not return service area polylines are to be returned.
  ///
  /// Disabled by default. Can be returned in the [ServiceAreaResult] of a
  /// successful solve.
  bool get returnPolylines {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getReturnPolylines(
          _handle, errorHandler);
    });
  }

  set returnPolylines(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setReturnPolylines(
          _handle, value, errorHandler);
    });
  }

  /// Start time.
  ///
  /// Start time in the UTC time zone. Returns null if start time was not
  /// specified.
  DateTime? get startTime => _startTime.value;

  set startTime(DateTime? value) => _startTime.value = value;

  final Memoized<DateTime?> _startTime;

  /// The travel direction for the service area computation (to or from
  /// facility).
  ///
  /// Default value [TravelDirection.fromFacility] will be returned on error.
  TravelDirection get travelDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getTravelDirection(
          _handle, errorHandler);
    });
    return TravelDirection._fromCoreValue(coreValue);
  }

  set travelDirection(TravelDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setTravelDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Travel mode.
  ///
  /// Travel mode that will be used for service area's solving. List of
  /// supported travel modes can be obtained from
  /// [ServiceAreaTaskInfo.travelModes] method.
  TravelMode? get travelMode => _travelMode.value;

  set travelMode(TravelMode? value) => _travelMode.value = value;

  final Memoized<TravelMode?> _travelMode;

  /// Clears facilities.
  ///
  /// Clears facilities that were set by
  /// [ServiceAreaParameters.setFacilitiesWithFeatureTable].
  void clearFacilities() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_clearFacilities(
          _handle, errorHandler);
    });
  }

  /// Clears point barriers.
  ///
  /// Clears point barriers that were set by
  /// [ServiceAreaParameters.setPointBarriers] or
  /// [ServiceAreaParameters.setPointBarriersWithFeatureTable].
  void clearPointBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_clearPointBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears polygon barriers.
  ///
  /// Clears polygon barriers that were set by
  /// [ServiceAreaParameters.setPolygonBarriers] or
  /// [ServiceAreaParameters.setPolygonBarriersWithFeatureTable].
  void clearPolygonBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_clearPolygonBarriers(
          _handle, errorHandler);
    });
  }

  /// Clears polyline barriers.
  ///
  /// Clears polyline barriers that were set by
  /// [ServiceAreaParameters.setPolylineBarriers] or
  /// [ServiceAreaParameters.setPolylineBarriersWithFeatureTable].
  void clearPolylineBarriers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_clearPolylineBarriers(
          _handle, errorHandler);
    });
  }

  /// Clones the [ServiceAreaParameters].
  ///
  /// Return Value: A new [ServiceAreaParameters] with the same values as the
  /// current [ServiceAreaParameters].
  ServiceAreaParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_clone(_handle, errorHandler);
    });
    return ServiceAreaParameters._fromHandle(objectHandle)!;
  }

  /// Gets the search where clause from the specified network dataset's source
  /// feature class.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class to
  /// retrieve the where clause from.
  ///
  /// Return Value: A [String].
  String getSearchWhereClause({required String sourceName}) {
    final coreSourceName = _CString(sourceName);
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaParameters_getSearchWhereClause(
          _handle, coreSourceName.bytes, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Sets facilities.
  ///
  /// The set of service area facilities loaded as network locations during
  /// analysis. You need to specify at least one facility to successfully
  /// [ServiceAreaTask.solveServiceArea].
  ///
  /// Parameters:
  /// - `facilities` — A [List] of [ServiceAreaFacility] instances. Contents of
  /// the [List] are copied.
  void setFacilities(List<ServiceAreaFacility> facilities) {
    final coreFacilities =
        facilities.toMutableArray(valueType: _ElementType.serviceAreaFacility);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setFacilities(
          _handle, coreFacilities._handle, errorHandler);
    });
  }

  /// Sets the facilities from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the facilities objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets facilities by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setFacilitiesWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setFacilitiesWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets point barriers.
  ///
  /// Parameters:
  /// - `pointBarriers` — A [List] of [PointBarrier] instances. Contents of the
  /// [List] are copied.
  void setPointBarriers(List<PointBarrier> pointBarriers) {
    final corePointBarriers =
        pointBarriers.toMutableArray(valueType: _ElementType.pointBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPointBarriers(
          _handle, corePointBarriers._handle, errorHandler);
    });
  }

  /// Sets the point barriers from the features in specified feature table. The
  /// feature table can be either local or online. The feature table must be of
  /// geometry type point. Attributes from the feature table are mapped to the
  /// properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets point barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPointBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPointBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets polygon barriers.
  ///
  /// Parameters:
  /// - `polygonBarriers` — A [List] of [PolygonBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolygonBarriers(List<PolygonBarrier> polygonBarriers) {
    final corePolygonBarriers =
        polygonBarriers.toMutableArray(valueType: _ElementType.polygonBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolygonBarriers(
          _handle, corePolygonBarriers._handle, errorHandler);
    });
  }

  /// Sets the polygon barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polygon. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets polygon barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolygonBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolygonBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets polyline barriers.
  ///
  /// Parameters:
  /// - `lineBarriers` — A [List] of [PolylineBarrier] instances. Contents of
  /// the [List] are copied.
  void setPolylineBarriers({required List<PolylineBarrier> lineBarriers}) {
    final coreLineBarriers =
        lineBarriers.toMutableArray(valueType: _ElementType.polylineBarrier);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolylineBarriers(
          _handle, coreLineBarriers._handle, errorHandler);
    });
  }

  /// Sets the polyline barriers from the features in specified feature table.
  /// The feature table can be either local or online. The feature table must be
  /// of geometry type polyline. Attributes from the feature table are mapped to
  /// the properties on the barrier objects generated from the specified feature
  /// table. The where clause set in the query parameters will be applied to the
  /// feature table. If an online feature table is specified the table will not
  /// be queried for features until Solve is called.
  ///
  /// Sets polyline barriers by importing them from local or remote table.
  ///
  /// Parameters:
  /// - `featureTable` — The feature table.
  /// - `queryParameters` — The query parameters.
  void setPolylineBarriersWithFeatureTable(
      {required ArcGISFeatureTable featureTable,
      required QueryParameters queryParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setPolylineBarriersWithFeatureTable(
          _handle, featureTable._handle, queryParameters._handle, errorHandler);
    });
  }

  /// Sets a search where clause on the specified network dataset's source
  /// feature class. Only features satisfying the where clause for the specified
  /// feature class will be used to locate facilities on the network during the
  /// solve operation. If a where clause is not set all network features are
  /// used.
  ///
  /// Parameters:
  /// - `sourceName` — The name of the network dataset's source feature class
  /// the where clause will be applied to.
  /// - `searchWhereClause` — The search where clause.
  void setSearchWhereClause(
      {required String sourceName, required String searchWhereClause}) {
    final coreSourceName = _CString(sourceName);
    final coreSearchWhereClause = _CString(searchWhereClause);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaParameters_setSearchWhereClause(_handle,
          coreSourceName.bytes, coreSearchWhereClause.bytes, errorHandler);
    });
  }
}

/// A class that describes the single service area polygon.
///
/// The service area polygon stores the resultant service area polygon, which
/// cover the area of the network that can be reached within the given time,
/// distance, or other travel-cost cutoff.
final class ServiceAreaPolygon implements ffi.Finalizable {
  final RT_ServiceAreaPolygonHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ServiceAreaPolygon_destroy.cast());

  static ServiceAreaPolygon? _fromHandle(RT_ServiceAreaPolygonHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaPolygon._withHandle(handle);
  }

  ServiceAreaPolygon._withHandle(RT_ServiceAreaPolygonHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaPolygon_created(_handle);
    }
  }

  /// From impedance cutoff.
  ///
  /// A service area polygon's minimal impedance value. For example, a time
  /// impedance value of "5 10 15" specifies service areas of 5, 10, and 15
  /// minutes intervals. You can get polygon which covers area from 5 to 10
  /// minutes interval.
  double get fromImpedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolygon_getFromImpedanceCutoff(
          _handle, errorHandler);
    });
  }

  /// Service area polygon's geometry.
  ///
  /// The geometry for the polygon in case if
  /// [ServiceAreaParameters.returnPolygons] is true.
  Polygon get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolygon_getGeometry(
          _handle, errorHandler);
    });
    return Polygon._fromHandle(objectHandle)!;
  }

  /// To impedance cutoff.
  ///
  /// A service area polygon's maximal impedance value. For example, a time
  /// impedance value of "5 10 15" specifies service areas of 5, 10, and 15
  /// minutes intervals. You can get polygon which covers area from 5 to 10
  /// minutes interval.
  double get toImpedanceCutoff {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolygon_getToImpedanceCutoff(
          _handle, errorHandler);
    });
  }
}

/// Service area polygon cutoff geometry.
///
/// Specifies the behavior of service area output for a single facility when
/// multiple cutoff values are specified. This parameter does not apply to line
/// output.
enum ServiceAreaPolygonCutoffGeometry {
  /// Each polygon includes only the area between consecutive cutoff values. It
  /// does not include the area between the facility and any smaller cutoffs.
  /// For instance, If you create 5- and 10-minute service areas, then the
  /// 5-minute service area polygon will include the area reachable in 0-5
  /// minutes, and the 10-minute service area polygon will include the area
  /// reachable between 5 and 10 minutes.
  rings,

  /// Each polygon includes the area reachable from the facility up to the
  /// cutoff value, including the area reachable within smaller cutoff values.
  /// For instance, If you create 5- and 10-minute service areas, then the
  /// 10-minute service area polygon will include the area under the 5-minute
  /// service area polygon.
  disks;

  factory ServiceAreaPolygonCutoffGeometry._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return rings;
      case 1:
        return disks;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case rings:
        return 0;
      case disks:
        return 1;
    }
  }
}

/// Service area polygon detail.
///
/// Specifies the level of detail of the output polygons. If your analysis
/// covers an urban area with a grid-like street network, the difference between
/// generalized and standard polygons will be minimal. However, for mountain and
/// rural roads, the standard and detailed polygons may present significantly
/// more accurate results than generalized polygons.
enum ServiceAreaPolygonDetail {
  /// Creates generalized polygons using the hierarchy present in the network
  /// data source in order to produce results quickly.
  generalized,

  /// Creates polygons with a standard level of detail. This is the default.
  standard,

  /// Creates polygons with a higher level of detail for applications in which
  /// very precise results are important.
  high;

  factory ServiceAreaPolygonDetail._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return generalized;
      case 1:
        return standard;
      case 2:
        return high;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case generalized:
        return 0;
      case standard:
        return 1;
      case high:
        return 2;
    }
  }
}

/// A class that describes the single service area polyline.
///
/// The service area polyline stores the resultant service area polyline, which
/// the represents the network edges that can be reached within the given
/// impedance.
final class ServiceAreaPolyline implements ffi.Finalizable {
  final RT_ServiceAreaPolylineHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ServiceAreaPolyline_destroy.cast());

  static ServiceAreaPolyline? _fromHandle(RT_ServiceAreaPolylineHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaPolyline._withHandle(handle);
  }

  ServiceAreaPolyline._withHandle(RT_ServiceAreaPolylineHandle handle)
      : _fromNetworkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaPolyline_getFromNetworkLocation(
                handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }),
        _toNetworkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaPolyline_getToNetworkLocation(
                handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaPolyline_created(_handle);
    }
  }

  /// Network location where the polyline begins.
  ///
  /// The location on the network where the service area polyline begins.
  NetworkLocation? get fromNetworkLocation => _fromNetworkLocation.value;

  final Memoized<NetworkLocation?> _fromNetworkLocation;

  /// Service area polyline's geometry.
  ///
  /// The geometry for the polyline in case if
  /// [ServiceAreaParameters.returnPolylines] is true.
  Polyline get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolyline_getGeometry(
          _handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle)!;
  }

  /// Network location where the polyline ends.
  ///
  /// The location on the network where the service area polyline ends.
  NetworkLocation? get toNetworkLocation => _toNetworkLocation.value;

  final Memoized<NetworkLocation?> _toNetworkLocation;

  /// Gets the cumulative cost for the beginning of polyline.
  ///
  /// Returns the cumulative cost value of the path from the facility to the
  /// beginning of this polyline.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: A value of cumulative cost.
  double getFromCumulativeCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolyline_getFromCumulativeCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Gets the cumulative cost for the end of polyline.
  ///
  /// Returns the cumulative cost value of the path from the facility to the end
  /// of this polyline.
  ///
  /// Parameters:
  /// - `attributeName` — The name of attribute.
  ///
  /// Return Value: A value of cumulative cost.
  double getToCumulativeCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaPolyline_getToCumulativeCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }
}

/// A class that describes the service area result.
///
/// The result from [ServiceAreaTask.solveServiceArea] operation. A Service area
/// result object represents the results of the operation. It can contains the
/// following (if you enabled returning corresponding property on parameters):
/// An array of polygons and/or lines representing the service areas. An array
/// of graphics representing the facilities used in the analysis. An arrays of
/// barriers (point, polyline, polygon)
final class ServiceAreaResult implements ffi.Finalizable {
  final RT_ServiceAreaResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ServiceAreaResult_destroy.cast());

  static ServiceAreaResult? _fromHandle(RT_ServiceAreaResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaResult._withHandle(handle);
  }

  ServiceAreaResult._withHandle(RT_ServiceAreaResultHandle handle)
      : _facilities = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaResult_getFacilities(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _messages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaResult_getMessages(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _pointBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaResult_getPointBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polygonBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaResult_getPolygonBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _polylineBarriers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaResult_getPolylineBarriers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaResult_created(_handle);
    }
  }

  /// Array of the facilities used to calculate the service are.
  List<ServiceAreaFacility> get facilities => _facilities.value;

  final Memoized<_ArrayList<ServiceAreaFacility>> _facilities;

  /// Messages.
  ///
  /// Messages received when solve is completed. If a route cannot be solved,
  /// the message returned by the server identifies the route that could not be
  /// solved.
  List<String> get messages => _messages.value;

  final Memoized<_ArrayList<String>> _messages;

  /// Array of the point barriers.
  ///
  /// Barriers are only returned if the returnPointBarriers property of
  /// [ServiceAreaParameters] is true.
  List<PointBarrier> get pointBarriers => _pointBarriers.value;

  final Memoized<_ArrayList<PointBarrier>> _pointBarriers;

  /// Array of the polygon barriers.
  ///
  /// Barriers are only returned if the returnPolygonBarriers property of
  /// [ServiceAreaParameters] is true.
  List<PolygonBarrier> get polygonBarriers => _polygonBarriers.value;

  final Memoized<_ArrayList<PolygonBarrier>> _polygonBarriers;

  /// Array of the polyline barriers.
  ///
  /// Barriers are only returned if the returnPolylineBarriers property of
  /// [ServiceAreaParameters] is true.
  List<PolylineBarrier> get polylineBarriers => _polylineBarriers.value;

  final Memoized<_ArrayList<PolylineBarrier>> _polylineBarriers;

  /// Gets array of the result polygons.
  ///
  /// Result polygons are only returned if the returnPolygons property of
  /// [ServiceAreaParameters] is true.
  ///
  /// Parameters:
  /// - `facilityIndex` — The index of facility.
  ///
  /// Return Value: A [List] of [ServiceAreaPolygon]
  List<ServiceAreaPolygon> getResultPolygons({required int facilityIndex}) {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaResult_getResultPolygons(
          _handle, facilityIndex, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Gets array of the result polylines.
  ///
  /// Result polylines are only returned if the returnPolylines property of
  /// [ServiceAreaParameters] is true.
  ///
  /// Parameters:
  /// - `facilityIndex` — The index of facility.
  ///
  /// Return Value: A [List] of [ServiceAreaPolyline]
  List<ServiceAreaPolyline> getResultPolylines({required int facilityIndex}) {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaResult_getResultPolylines(
          _handle, facilityIndex, errorHandler);
    });
    return arrayHandle.toList();
  }
}

/// Instances of this class represent tasks that can compute service areas.
///
/// A Service Area task allows you to calculate areas that can be serviced
/// (reached) from a given location. A service area is a region that encompasses
/// all accessible streets, that is, streets that lie within a specified
/// impedance. For instance, the 10-minute service area for a facility includes
/// all the streets that can be reached within 10 minutes from that facility.
final class ServiceAreaTask
    with Loadable
    implements
        ApiKeyResource,
        _CallbackReceiver,
        _Resourceable,
        ffi.Finalizable {
  final RT_ServiceAreaTaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ServiceAreaTask_destroy.cast());

  static ServiceAreaTask? _fromHandle(RT_ServiceAreaTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaTask._withHandle(handle);
  }

  ServiceAreaTask._withHandle(RT_ServiceAreaTaskHandle handle)
      : _serviceAreaTaskInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTask_getServiceAreaTaskInfo(
                handle, errorHandler);
          });
          return ServiceAreaTaskInfo._fromHandle(objectHandle);
        }),
        _transportationNetworkDataset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaTask_getTransportationNetworkDataset(
                    handle, errorHandler);
          });
          return TransportationNetworkDataset._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTask_getURL(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ServiceAreaTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ServiceAreaTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ServiceAreaTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ServiceAreaTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );

    _setResourceProvider(_resourceProvider);
  }

  /// Creates a service area task with transportation network dataset.
  ///
  /// Parameters:
  /// - `dataset` — A transportation network dataset.
  factory ServiceAreaTask.withDataset(TransportationNetworkDataset dataset) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_createWithDataset(
          dataset._handle, errorHandler);
    });
    return ServiceAreaTask._withHandle(handle);
  }

  /// Creates a service area task with path to geodatabase.
  ///
  /// Parameters:
  /// - `databasefileUri` — A path to geodatabase.
  /// - `networkName` — A network name.
  factory ServiceAreaTask.withGeodatabase(
      {required Uri databasefileUri, required String networkName}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDatabasefileUri = _CString(databasefileUri.toFilePath());
    final coreNetworkName = _CString(networkName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_createWithGeodatabase(
          coreDatabasefileUri.bytes, coreNetworkName.bytes, errorHandler);
    });
    return ServiceAreaTask._withHandle(handle);
  }

  /// Creates a service area task with URL.
  ///
  /// Creates a service area task.
  ///
  /// Parameters:
  /// - `uri` — An URL to online routing services.
  factory ServiceAreaTask.withUrl(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return ServiceAreaTask._withHandle(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Service area task info.
  ///
  /// Information about this service area task. For a service area task using an
  /// online service, this will involve a network call.
  ServiceAreaTaskInfo? get serviceAreaTaskInfo => _serviceAreaTaskInfo.value;

  final Memoized<ServiceAreaTaskInfo?> _serviceAreaTaskInfo;

  /// Transportation network dataset.
  TransportationNetworkDataset? get transportationNetworkDataset =>
      _transportationNetworkDataset.value;

  final Memoized<TransportationNetworkDataset?> _transportationNetworkDataset;

  /// The URL of online service.
  ///
  /// The URL that will be used when the service area task is loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Creates default parameters.
  ///
  /// Retrieves the default parameters as defined by the service.
  ///
  /// Return Value: A [Future] that returns a [ServiceAreaParameters] type.
  Future<ServiceAreaParameters> createDefaultParameters() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsServiceAreaParameters()!);
  }

  /// Cancelable version of [createDefaultParameters]. See that method for more
  /// information.
  CancelableOperation<ServiceAreaParameters>
      createDefaultParametersCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_createDefaultParametersAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsServiceAreaParameters()!);
  }

  @override
  void _setResourceProvider(_ResourceProvider? resourceProvider) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaTask_setResourceProvider(
          _handle, resourceProvider?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Solve a service area passing in a parameters object.
  ///
  /// Executes the [ServiceAreaParameters] defined for this [ServiceAreaTask]
  /// and returns a [ServiceAreaResult] containing the results.
  ///
  /// Parameters:
  /// - `serviceAreaParameters` — The service area parameters.
  ///
  /// Return Value: A [Future] that returns a [ServiceAreaResult] type.
  Future<ServiceAreaResult> solveServiceArea(
      {required ServiceAreaParameters serviceAreaParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_solveServiceAreaAsync(
          _handle, serviceAreaParameters._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsServiceAreaResult()!);
  }

  /// Cancelable version of [solveServiceArea]. See that method for more
  /// information.
  CancelableOperation<ServiceAreaResult> solveServiceAreaCancelable(
      {required ServiceAreaParameters serviceAreaParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_solveServiceAreaAsync(
          _handle, serviceAreaParameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsServiceAreaResult()!);
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceAreaTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _serviceAreaTaskInfo.invalidateCache();
    _transportationNetworkDataset.invalidateCache();
    _uri.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLoadableDoneLoadingEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _doneLoadingStreamController.add(event);
      case AsyncType.asyncTypeLoadableLoadStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LoadStatus._fromCoreValue(coreValue);
        }();
        _loadStatusChangedStreamController.add(event);
      default:
        logger.f('ServiceAreaTask unhandled asyncType $asyncType');
    }
  }
}

/// A class that describes the service area task info.
///
/// This represents an instance of a service area task info that described
/// information about [ServiceAreaTask].
final class ServiceAreaTaskInfo implements ffi.Finalizable {
  final RT_ServiceAreaTaskInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ServiceAreaTaskInfo_destroy.cast());

  static ServiceAreaTaskInfo? _fromHandle(RT_ServiceAreaTaskInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceAreaTaskInfo._withHandle(handle);
  }

  ServiceAreaTaskInfo._withHandle(RT_ServiceAreaTaskInfoHandle handle)
      : _accumulateAttributeNames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaTaskInfo_getAccumulateAttributeNames(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _costAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTaskInfo_getCostAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _defaultImpedanceCutoffs = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaTaskInfo_getDefaultImpedanceCutoffs(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTaskInfo_getOutputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _restrictionAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTaskInfo_getRestrictionAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTaskInfo_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _supportedRestrictionUsageParameterValues = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ServiceAreaTaskInfo_getSupportedRestrictionUsageParameterValues(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _travelModes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceAreaTaskInfo_getTravelModes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceAreaTaskInfo_created(_handle);
    }
  }

  /// Accumulate attribute names.
  List<String> get accumulateAttributeNames => _accumulateAttributeNames.value;

  final Memoized<_ArrayList<String>> _accumulateAttributeNames;

  /// Cost attributes.
  ///
  /// Key in the result dictionary is name of cost attribute.
  Map<String, CostAttribute> get costAttributes => _costAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, CostAttribute>>
      _costAttributes;

  /// Default impedance cutoffs.
  ///
  /// Cutoffs specify the quantity of the impedance to apply. They constrain the
  /// extent of the service area to be calculated. For example, if you apply
  /// breaks of 5, 10, and 15 when the impedance is set to Time, the service
  /// area will include those streets that can be reached within 5, 10, and 15
  /// minutes.
  List<double> get defaultImpedanceCutoffs => _defaultImpedanceCutoffs.value;

  final Memoized<_ArrayList<double>> _defaultImpedanceCutoffs;

  /// Default travel mode's name.
  String get defaultTravelModeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getDefaultTravelModeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Geometry at cutoff.
  ///
  /// Specifies the behavior of service area output for a single facility when
  /// multiple cutoff values are specified. This parameter does not apply to
  /// line output. Default value [ServiceAreaPolygonCutoffGeometry.rings] will
  /// be returned on error.
  ServiceAreaPolygonCutoffGeometry get geometryAtCutoff {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getGeometryAtCutoff(
          _handle, errorHandler);
    });
    return ServiceAreaPolygonCutoffGeometry._fromCoreValue(coreValue);
  }

  /// Geometry at overlap.
  ///
  /// Specifies the behavior of service-area output from multiple facilities in
  /// relation to one another. Default value
  /// [ServiceAreaOverlapGeometry.overlap] will be returned on error.
  ServiceAreaOverlapGeometry get geometryAtOverlap {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getGeometryAtOverlap(
          _handle, errorHandler);
    });
    return ServiceAreaOverlapGeometry._fromCoreValue(coreValue);
  }

  /// Maximum locating distance is the furthest distance in meters that Network
  /// Analyst searches when locating or relocating a point onto the network.
  ///
  /// The search looks for suitable edges or junctions and snaps the point to
  /// the nearest one. If a suitable location isn't found within the maximum
  /// locating distance, the object is marked as unlocated.
  double get maxLocatingDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getMaxLocatingDistance(
          _handle, errorHandler);
    });
  }

  /// Network name.
  String get networkName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getNetworkName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Output spatial reference.
  ///
  /// The spatial reference that will be used for output geometry during service
  /// area solving.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Polygon buffer distance.
  ///
  /// The polygon buffer refers to the distance from the road the service area
  /// polygon should extend when no other reachable roads are nearby, similar to
  /// a line buffer size. This is useful if the network is very sparse and you
  /// don't want the service area to cover large areas where there are no
  /// features.
  double get polygonBufferDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getPolygonBufferDistance(
          _handle, errorHandler);
    });
  }

  /// Polygon detail.
  ///
  /// Specifies the level of detail of the output polygons. If your analysis
  /// covers an urban area with a grid-like street network, the difference
  /// between generalized and standard polygons will be minimal. However, for
  /// mountain and rural roads, the standard and detailed polygons may present
  /// significantly more accurate results than generalized polygons. Default
  /// value [ServiceAreaPolygonDetail.standard] will be returned on error.
  ServiceAreaPolygonDetail get polygonDetail {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getPolygonDetail(
          _handle, errorHandler);
    });
    return ServiceAreaPolygonDetail._fromCoreValue(coreValue);
  }

  /// Restriction attributes.
  ///
  /// The names of set restriction attributes e.g. "Oneway". Key in the result
  /// dictionary is name of restriction attribute.
  Map<String, RestrictionAttribute> get restrictionAttributes =>
      _restrictionAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, RestrictionAttribute>>
      _restrictionAttributes;

  /// Return polygons.
  ///
  /// Specifies the type of output to be generated. Service area output will
  /// contain polygon features encompassing reachable area(s).
  bool get returnPolygons {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getReturnPolygons(
          _handle, errorHandler);
    });
  }

  /// Return polylines.
  ///
  /// Specifies the type of output to be generated. Service area output will
  /// contain line features representing the roads reachable before the cutoffs
  /// are exceeded.
  bool get returnPolylines {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getReturnPolylines(
          _handle, errorHandler);
    });
  }

  /// Start time.
  ///
  /// A null if a start time was not set.
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;

  /// Array of supported restriction usage parameter values.
  ///
  /// Array of special string values for restriction usage, such as Avoid_High.
  List<String> get supportedRestrictionUsageParameterValues =>
      _supportedRestrictionUsageParameterValues.value;

  final Memoized<_ArrayList<String>> _supportedRestrictionUsageParameterValues;

  /// Travel direction.
  ///
  /// Default value [TravelDirection.fromFacility] will be returned on error.
  TravelDirection get travelDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceAreaTaskInfo_getTravelDirection(
          _handle, errorHandler);
    });
    return TravelDirection._fromCoreValue(coreValue);
  }

  /// Array of supported travel modes.
  List<TravelMode> get travelModes => _travelModes.value;

  final Memoized<_ArrayList<TravelMode>> _travelModes;
}

/// A structure that describes a source object position.
///
/// Class presents position of network element on network source.
final class SourceObjectPosition implements ffi.Finalizable {
  final RT_SourceObjectPositionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.SourceObjectPosition_destroy.cast());

  static SourceObjectPosition? _fromHandle(
      RT_SourceObjectPositionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SourceObjectPosition._withHandle(handle);
  }

  SourceObjectPosition._withHandle(RT_SourceObjectPositionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SourceObjectPosition_created(_handle);
    }
  }

  /// Creates a source object position instance.
  ///
  /// Creates a source object position.
  ///
  /// Parameters:
  /// - `sourceIndex` — A source instance.
  /// - `sourceOid` — A source OID.
  /// - `position` — A position.
  factory SourceObjectPosition.withPosition(
      {required int sourceIndex,
      required int sourceOid,
      required double position}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SourceObjectPosition_createWithPosition(
          sourceIndex, sourceOid, position, errorHandler);
    });
    return SourceObjectPosition._withHandle(handle);
  }

  /// Position.
  ///
  /// Source object's position.
  double get position {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SourceObjectPosition_getPosition(
          _handle, errorHandler);
    });
  }

  set position(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SourceObjectPosition_setPosition(
          _handle, value, errorHandler);
    });
  }

  /// Source index.
  ///
  /// Index of the source.
  int get sourceIndex {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SourceObjectPosition_getSourceIndex(
          _handle, errorHandler);
    });
  }

  set sourceIndex(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SourceObjectPosition_setSourceIndex(
          _handle, value, errorHandler);
    });
  }

  /// Source object ID.
  int get sourceObjectId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SourceObjectPosition_getSourceObjectId(
          _handle, errorHandler);
    });
  }

  set sourceObjectId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SourceObjectPosition_setSourceObjectId(
          _handle, value, errorHandler);
    });
  }
}

/// A start time usage type. Allows to choose how to enter a time value.
enum StartTimeUsage {
  /// Use departure time.
  departureTime,

  /// Use arrival time.
  arrivalTime;

  factory StartTimeUsage._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return departureTime;
      case 1:
        return arrivalTime;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case departureTime:
        return 0;
      case arrivalTime:
        return 1;
    }
  }
}

/// A class that represents a location to be visited along a route.
///
/// The Stop class contains location inputs for the Route_task. The Route_task
/// will create a route between two or more Stops. A Stop object is not an
/// arbitrary bag of properties, but contains only the properties needed for
/// routing (for example, a Stop object does not have address information). Stop
/// objects are collected into a [List] by value, and passed as an input to
/// [RouteTask].
///
/// The stop class is derived from the graphic class.
final class Stop implements ffi.Finalizable {
  final RT_StopHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Stop_destroy.cast());

  static Stop? _fromHandle(RT_StopHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Stop._withHandle(handle);
  }

  Stop._withHandle(RT_StopHandle handle)
      : _arrivalTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Stop_getArrivalTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _departureTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Stop_getDepartureTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _networkLocation = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Stop_getNetworkLocation(handle, errorHandler);
          });
          return NetworkLocation._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Stop_setNetworkLocation(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _timeWindowEnd = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Stop_getTimeWindowEnd(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Stop_setTimeWindowEnd(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _timeWindowStart = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Stop_getTimeWindowStart(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Stop_setTimeWindowStart(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Stop_created(_handle);
    }
  }

  /// Creates a stop instance with point.
  ///
  /// Creates a stop.
  ///
  /// Parameters:
  /// - `point` — A point.
  factory Stop({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_createWithPoint(point._handle, errorHandler);
    });
    return Stop._withHandle(handle);
  }

  /// Arrival curb approach.
  CurbApproach get arrivalCurbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getArrivalCurbApproach(_handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  /// Arrival time.
  DateTime? get arrivalTime => _arrivalTime.value;

  final Memoized<DateTime?> _arrivalTime;

  /// Time zone shift for arrival time, in minutes.
  double get arrivalTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getArrivalTimeShift(_handle, errorHandler);
    });
  }

  /// Curb approach.
  CurbApproach get curbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getCurbApproach(_handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  set curbApproach(CurbApproach value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setCurbApproach(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Current bearing in degrees.
  ///
  /// Current bearing in degrees, measured clockwise from true north. Typical
  /// values are 0 to 360 or NaN, negative values will be subtracted from 360
  /// (e.g. -15 => 345), values greater than 360 will be have 360 subtracted
  /// from them (e.g. 385 => 25). For this property to be used the bearing
  /// tolerance also has to be set.
  double get currentBearing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getCurrentBearing(_handle, errorHandler);
    });
  }

  set currentBearing(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setCurrentBearing(_handle, value, errorHandler);
    });
  }

  /// Current bearing tolerance in degrees. Valid values are 0 to 180 or NaN.
  double get currentBearingTolerance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getCurrentBearingTolerance(
          _handle, errorHandler);
    });
  }

  set currentBearingTolerance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setCurrentBearingTolerance(
          _handle, value, errorHandler);
    });
  }

  /// Departure curb approach.
  CurbApproach get departureCurbApproach {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getDepartureCurbApproach(
          _handle, errorHandler);
    });
    return CurbApproach._fromCoreValue(coreValue);
  }

  /// Departure time.
  DateTime? get departureTime => _departureTime.value;

  final Memoized<DateTime?> _departureTime;

  /// Time zone shift for departure time, in minutes.
  double get departureTimeShift {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getDepartureTimeShift(_handle, errorHandler);
    });
  }

  /// Distance to network location in meters.
  double get distanceToNetworkLocation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getDistanceToNetworkLocation(
          _handle, errorHandler);
    });
  }

  /// The geometry of a stop.
  ///
  /// The point geometry of Stop.
  ArcGISPoint? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getGeometry(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set geometry(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Location status.
  LocationStatus get locationStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getLocationStatus(_handle, errorHandler);
    });
    return LocationStatus._fromCoreValue(coreValue);
  }

  /// Stop's name.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Navigation latency in seconds.
  double get navigationLatency {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getNavigationLatency(_handle, errorHandler);
    });
  }

  set navigationLatency(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setNavigationLatency(_handle, value, errorHandler);
    });
  }

  /// Navigation speed in meters per second.
  double get navigationSpeed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getNavigationSpeed(_handle, errorHandler);
    });
  }

  set navigationSpeed(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setNavigationSpeed(_handle, value, errorHandler);
    });
  }

  /// Network location.
  ///
  /// A null for resetting a network location.
  NetworkLocation? get networkLocation => _networkLocation.value;

  set networkLocation(NetworkLocation? value) => _networkLocation.value = value;

  final Memoized<NetworkLocation?> _networkLocation;

  /// Route's name.
  String get routeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getRouteName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set routeName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setRouteName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Sequence.
  int get sequence {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getSequence(_handle, errorHandler);
    });
  }

  /// Stop ID.
  ///
  /// This is a caller supplied foreign key that can be used to associate output
  /// stops with input stops.
  int get stopId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getStopId(_handle, errorHandler);
    });
  }

  set stopId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setStopId(_handle, value, errorHandler);
    });
  }

  /// Stop's type.
  ///
  /// Default value that will be returned on error is [StopType.stop].
  StopType get stopType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getStopType(_handle, errorHandler);
    });
    return StopType._fromCoreValue(coreValue);
  }

  set stopType(StopType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setStopType(_handle, value.coreValue, errorHandler);
    });
  }

  /// Time window end.
  DateTime? get timeWindowEnd => _timeWindowEnd.value;

  set timeWindowEnd(DateTime? value) => _timeWindowEnd.value = value;

  final Memoized<DateTime?> _timeWindowEnd;

  /// Time window start.
  DateTime? get timeWindowStart => _timeWindowStart.value;

  set timeWindowStart(DateTime? value) => _timeWindowStart.value = value;

  final Memoized<DateTime?> _timeWindowStart;

  /// Violation time in minutes.
  double get violationTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getViolationTime(_handle, errorHandler);
    });
  }

  /// Wait time in minutes.
  double get waitTime {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getWaitTime(_handle, errorHandler);
    });
  }

  /// Clones the [Stop].
  ///
  /// Return Value: A new [Stop] with the same values as the current [Stop].
  Stop clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_clone(_handle, errorHandler);
    });
    return Stop._fromHandle(objectHandle)!;
  }

  /// Gets added cost attribute value.
  ///
  /// In case when attribute's name can not be found 0.0 will be returned.
  ///
  /// Parameters:
  /// - `attributeName` — The name of the cost attribute.
  ///
  /// Return Value: The value of added cost.
  double getAddedCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getAddedCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Gets cumulative cost attribute value.
  ///
  /// In case when attribute's name can not be found 0.0 will be returned.
  ///
  /// Parameters:
  /// - `attributeName` — The name of cumulative attribute.
  ///
  /// Return Value: The value of cumulative cost.
  double getCumulativeCost({required String attributeName}) {
    final coreAttributeName = _CString(attributeName);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Stop_getCumulativeCost(
          _handle, coreAttributeName.bytes, errorHandler);
    });
  }

  /// Sets added cost.
  ///
  /// Parameters:
  /// - `attributeName` — The attribute name.
  /// - `addedCost` — The added cost.
  void setAddedCost(
      {required String attributeName, required double addedCost}) {
    final coreAttributeName = _CString(attributeName);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Stop_setAddedCost(
          _handle, coreAttributeName.bytes, addedCost, errorHandler);
    });
  }
}

/// A stop's type. Specifies the type of a route stop.
enum StopType {
  /// Stop. A location where a vehicle would arrive and/or depart.
  stop,

  /// Waypoint. A location between stops that a route must pass through.
  waypoint,

  /// Rest break. A location where a route pauses e.g. for a required lunch
  /// break.
  restBreak;

  factory StopType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return stop;
      case 1:
        return waypoint;
      case 2:
        return restBreak;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case stop:
        return 0;
      case waypoint:
        return 1;
      case restBreak:
        return 2;
    }
  }
}

/// A travel direction type. Options for traveling to or from the facility. The
/// default is defined in the network layer.
enum TravelDirection {
  /// Travel from facility.
  fromFacility,

  /// Travel to facility.
  toFacility;

  factory TravelDirection._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return fromFacility;
      case 1:
        return toFacility;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case fromFacility:
        return 0;
      case toFacility:
        return 1;
    }
  }
}

/// An object that represents a travel mode.
///
/// Travel modes on a network dataset define how a pedestrian, car, truck, or
/// other medium of transportation moves through the network. A travel mode
/// consists of a collection of network dataset settings that define actions
/// that are allowed on the network and how the actions can be performed.
/// Selecting a predefined travel mode allows you to efficiently and
/// consistently set a number of properties that are appropriate for the mode of
/// travel you intend to model. Since a travel mode is a collection of
/// properties that work together it is recommended to have a full understanding
/// of how these properties interact before altering them on the fly for a
/// particular analysis. A best practice would be to create a new travel mode in
/// the network dataset in ArcGIS Desktop or ArcGIS Pro that is fully tested to
/// ensure that is returns the required solution.
final class TravelMode implements ffi.Finalizable {
  final RT_TravelModeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TravelMode_destroy.cast());

  static TravelMode? _fromHandle(RT_TravelModeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TravelMode._withHandle(handle);
  }

  TravelMode._withHandle(RT_TravelModeHandle handle)
      : _attributeParameterValues = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TravelMode_getAttributeParameterValues(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _restrictionAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TravelMode_getRestrictionAttributeNames(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TravelMode_created(_handle);
    }
  }

  /// Creates a travel mode.
  ///
  /// Creates a travel mode object.
  factory TravelMode() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_create(errorHandler);
    });
    return TravelMode._withHandle(handle);
  }

  /// Attribute parameter values.
  ///
  /// The attribute parameter values e.g. Vehicle Weight, Vehicle Height, etc.
  /// Attribute parameter values are useful for customizing individual
  /// restrictions ("Don't travel on a roads weight limits below 6 tons").
  List<AttributeParameterValue> get attributeParameterValues =>
      _attributeParameterValues.value;

  final Memoized<_MutableArrayList<AttributeParameterValue>>
      _attributeParameterValues;

  /// Travel mode's description.
  ///
  /// A short text description of the travel mode.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Distance attribute name.
  ///
  /// Specifies the distance-based cost attribute for reporting directions,
  /// total length.
  String get distanceAttributeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getDistanceAttributeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set distanceAttributeName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setDistanceAttributeName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Impedance attribute name.
  ///
  /// The impedance attribute (i.e. the cost attribute to be minimized on
  /// solve). For example: "TravelTime" or "Distance".
  String get impedanceAttributeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getImpedanceAttributeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set impedanceAttributeName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setImpedanceAttributeName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Travel mode's name.
  ///
  /// The unique name of the travel mode.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Output geometry precision in meters.
  ///
  /// Precision is useful for reducing the response size while sacrificing route
  /// shape or directions geometry quality. This parameter makes sense only for
  /// online services and doesn't affect local tasks.
  double get outputGeometryPrecision {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getOutputGeometryPrecision(
          _handle, errorHandler);
    });
  }

  set outputGeometryPrecision(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setOutputGeometryPrecision(
          _handle, value, errorHandler);
    });
  }

  /// Restriction attribute names.
  ///
  /// Indicates the restriction attributes that are respected during solve.
  List<String> get restrictionAttributeNames =>
      _restrictionAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _restrictionAttributeNames;

  /// Time attribute name.
  ///
  /// Specifies the time-based cost attribute for reporting directions, total
  /// time, travel time and wait or late times.
  String get timeAttributeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getTimeAttributeName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set timeAttributeName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setTimeAttributeName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Travel mode's type.
  ///
  /// Indicates the category of travel or vehicle represented by the travel
  /// mode.
  String get type {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getType(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set type(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setType(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Uturn policy.
  ///
  /// Indicates where the travel mode is allowed to make U-turns. Returns the
  /// enumeration value for the u-turn policy e.g. no u-turns, u-turns at stops,
  /// etc.
  UTurnPolicy get uTurnPolicy {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getUTurnPolicy(_handle, errorHandler);
    });
    return UTurnPolicy._fromCoreValue(coreValue);
  }

  set uTurnPolicy(UTurnPolicy value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setUTurnPolicy(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Use hierarchy.
  ///
  /// Indicates whether the travel mode uses the network hierarchy in an
  /// analysis. Sets whether or not to solve using a hierarchy. A hierarchical
  /// solve tends to prefer higher-order streets such a freeways.
  bool get useHierarchy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TravelMode_getUseHierarchy(_handle, errorHandler);
    });
  }

  set useHierarchy(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TravelMode_setUseHierarchy(_handle, value, errorHandler);
    });
  }
}

/// Type of backtracking allowed when querying for adjacencies in a network
/// view.
enum UTurnPolicy {
  /// Not allow backtracking.
  notAllowed,

  /// Allow backtracking at dead ends.
  allowedAtDeadEnds,

  /// Allow backtracking at intersections.
  allowedAtIntersections,

  /// Allow backtracking ad dead ends and intersections.
  allowedAtDeadEndsAndIntersections;

  factory UTurnPolicy._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return notAllowed;
      case 1:
        return allowedAtDeadEnds;
      case 2:
        return allowedAtIntersections;
      case 3:
        return allowedAtDeadEndsAndIntersections;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case notAllowed:
        return 0;
      case allowedAtDeadEnds:
        return 1;
      case allowedAtIntersections:
        return 2;
      case allowedAtDeadEndsAndIntersections:
        return 3;
    }
  }
}

/// Supported units of distance.
enum UnitSystem {
  /// Used for imperial units, e.g. miles.
  imperial,

  /// Used for metric units, e.g. kilometers.
  metric;

  factory UnitSystem._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return imperial;
      case 1:
        return metric;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case imperial:
        return 0;
      case metric:
        return 1;
    }
  }
}
