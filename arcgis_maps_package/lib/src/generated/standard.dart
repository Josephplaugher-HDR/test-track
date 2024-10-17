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

part of '../../arcgis_maps.dart';

/// A color object.
///
/// It represents an instance of a color. You cannot directly access color
/// properties.
final class _ArcGISColor implements ffi.Finalizable {
  final RT_ColorHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Color_destroy.cast());

  static _ArcGISColor? _fromHandle(RT_ColorHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (_ArcGISColor._objectTypeOf(handle)) {
      case _ColorType.rgbColor:
        return _RgbColor._withHandle(handle);
      case _ColorType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _ColorType _objectTypeOf(RT_ColorHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Color_getObjectType(handle, errorHandler);
    });
    return _ColorType._fromCoreValue(coreValue);
  }

  _ColorType get _objectType => _ArcGISColor._objectTypeOf(_handle);

  _ArcGISColor._withHandle(RT_ColorHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Color_created(_handle);
    }
  }
}

/// An object that represents a date time.
final class _ArcGISDateTime implements ffi.Finalizable {
  final RT_DateTimeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DateTime_destroy.cast());

  static _ArcGISDateTime? _fromHandle(RT_DateTimeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ArcGISDateTime._withHandle(handle);
  }

  _ArcGISDateTime._withHandle(RT_DateTimeHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DateTime_created(_handle);
    }
  }

  /// Creates a new date time object.
  factory _ArcGISDateTime() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_create(errorHandler);
    });
    return _ArcGISDateTime._withHandle(handle);
  }

  /// Increments a datetime object by the given number of milliseconds.
  ///
  /// Parameters:
  /// - `milliseconds` — The milliseconds.
  ///
  /// Return Value: true if it succeeds, false if it fails.
  bool add({required int milliseconds}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_add(_handle, milliseconds, errorHandler);
    });
  }

  /// Creates a new date time object with the given time value.
  ///
  /// Parameters:
  /// - `time` — The time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime fromFileTime(int time) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_fromFileTime(time, errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Creates a new date time object with the given time value.
  ///
  /// Parameters:
  /// - `time` — The time.
  ///
  /// The value represents the number of days from midnight 30th December 1899.
  /// The fractional part represents the time on that day. See
  /// ref-external@[Microsoft
  /// documentation](https://msdn.microsoft.com/en-us/library/system.datetime.tooadate(v=vs.110).aspx#Anchor_2)
  /// for details.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime fromOle(double time) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_fromOLE(time, errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Creates a new date time object with the given time value.
  ///
  /// Parameters:
  /// - `time` — The time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime? fromString(String time) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTime = _CString(time);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_fromString(coreTime.bytes, errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle);
  }

  /// Creates a new date time object with the given time value.
  ///
  /// Parameters:
  /// - `time` — The time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime fromUnixMilliseconds(int time) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_fromUnixMilliseconds(time, errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Greater than relational test for date time objects.
  ///
  /// Parameters:
  /// - `right` — The right date time object.
  ///
  /// Return Value: true if the left date time object is greater than the right
  /// date time object, false otherwise.
  bool greaterThan({required _ArcGISDateTime right}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_greaterThan(
          _handle, right._handle, errorHandler);
    });
  }

  /// Greater than or equal to relational test for date time objects.
  ///
  /// Parameters:
  /// - `right` — The right date time object.
  ///
  /// Return Value: true if the left date time object is greater than or equal
  /// to the right date time object, false otherwise.
  bool greaterThanOrEqual({required _ArcGISDateTime right}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_greaterThanOrEqual(
          _handle, right._handle, errorHandler);
    });
  }

  /// Less than relational test for date time objects.
  ///
  /// Parameters:
  /// - `right` — The right date time object.
  ///
  /// Return Value: true if the left date time object is less than the right
  /// date time object, false otherwise.
  bool lessThan({required _ArcGISDateTime right}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_lessThan(
          _handle, right._handle, errorHandler);
    });
  }

  /// Less than or equal relational test for date time objects.
  ///
  /// Parameters:
  /// - `right` — The right date time object.
  ///
  /// Return Value: true if the left date time object is less than or equal to
  /// the right date time object, false otherwise.
  bool lessThanOrEqual({required _ArcGISDateTime right}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_lessThanOrEqual(
          _handle, right._handle, errorHandler);
    });
  }

  /// Creates a new date time object with the maximum value of a date time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime max() {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_max(errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Creates a new date time object with the minimum value of a date time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime min() {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_min(errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Creates a new date time object with the current date time.
  ///
  /// Return Value: A [DateTime].
  static _ArcGISDateTime now() {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_now(errorHandler);
    });
    return _ArcGISDateTime._fromHandle(objectHandle)!;
  }

  /// Decrements a datetime object by the given number of milliseconds.
  ///
  /// Parameters:
  /// - `milliseconds` — The milliseconds.
  ///
  /// Return Value: true if it succeeds, false if it fails.
  bool subtract({required int milliseconds}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_subtract(
          _handle, milliseconds, errorHandler);
    });
  }

  /// Returns the value of this date time as a file time.
  ///
  /// Return Value: An int64_t.
  int toFileTime() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_toFileTime(_handle, errorHandler);
    });
  }

  /// Returns the value of this date time as a file time.
  ///
  /// Return Value: A float64.
  ///
  /// The value represents the number of days from midnight 30th December 1899.
  /// The fractional part represents the time on that day. See
  /// ref-external@[Microsoft
  /// documentation](https://msdn.microsoft.com/en-us/library/system.datetime.tooadate(v=vs.110).aspx#Anchor_2)
  /// for details.
  double toOle() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_toOLE(_handle, errorHandler);
    });
  }

  /// Returns a string containing the value of this date time.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns the value of this date time as unix milliseconds.
  ///
  /// Return Value: An int64_t.
  int toUnixMilliseconds() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateTime_toUnixMilliseconds(_handle, errorHandler);
    });
  }
}

/// The domain of where the error occurred.
///
/// Each of the different types of domain the error can come from. Can get the
/// type by calling [_Error.domain].
enum _ArcGISExceptionDomain {
  /// An unknown domain was encountered.
  unknown,

  /// The error originated from within the ArcGIS Maps API.
  arcGISRuntime,

  /// The error originated from an ArcGIS server.
  arcGISServer;

  factory _ArcGISExceptionDomain._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return arcGISRuntime;
      case 1:
        return arcGISServer;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case arcGISRuntime:
        return 0;
      case arcGISServer:
        return 1;
    }
  }
}

/// The list of possible generic errors.
///
/// This is used in the `ArcGISRuntimeEnvironmentErrorEvent` error handler
/// function.
enum ArcGISExceptionType {
  /// Unknown error.
  ///
  /// The catch-all for unknown errors.
  unknown,

  /// Success.
  ///
  /// Indicates success, not an error.
  success,

  /// A null pointer.
  commonNullPtr,

  /// Invalid argument.
  commonInvalidArgument,

  /// Not implemented.
  commonNotImplemented,

  /// Out of range.
  commonOutOfRange,

  /// Invalid access.
  commonInvalidAccess,

  /// Illegal state.
  commonIllegalState,

  /// Not found.
  commonNotFound,

  /// Entity exists.
  commonExists,

  /// Timeout.
  commonTimeout,

  /// Regular expression error.
  commonRegularExpression,

  /// Property not supported.
  commonPropertyNotSupported,

  /// No permission.
  commonNoPermission,

  /// File error.
  commonFile,

  /// File not found.
  commonFileNotFound,

  /// Invalid call.
  commonInvalidCall,

  /// IO error.
  commonIo,

  /// User canceled.
  commonUserCanceled,

  /// Internal error.
  commonInternalError,

  /// Conversion failed.
  commonConversionFailed,

  /// No data.
  commonNoData,

  /// Invalid JSON.
  commonInvalidJson,

  /// Propagated error.
  commonUserDefinedFailure,

  /// Invalid XML.
  commonBadXml,

  /// Object is already owned.
  commonObjectAlreadyOwned,

  /// The resource is past its expiry date.
  commonExpired,

  /// Nullability violation.
  ///
  /// A null was returned from a property or method which is expected to be
  /// non-nullable.
  commonNullabilityViolation,

  /// Invalid property.
  ///
  /// The value of a property is invalid.
  commonInvalidProperty,

  /// SQLite error.
  sqliteError,

  /// SQLite internal error.
  sqliteInternal,

  /// SQLite permission.
  sqlitePerm,

  /// SQLite operation aborted.
  sqliteAbort,

  /// SQLite database busy.
  sqliteBusy,

  /// SQLite database locked.
  sqliteLocked,

  /// SQLite out of memory.
  sqliteNoMem,

  /// SQLite read only.
  sqliteReadonly,

  /// SQLite operation interrupted.
  sqliteInterrupt,

  /// SQLite IO error.
  sqliteIoErr,

  /// SQLite corrupt database.
  sqliteCorrupt,

  /// SQLite not found.
  sqliteNotFound,

  /// SQLite disk full.
  sqliteFull,

  /// SQLite cannot open.
  sqliteCantOpen,

  /// SQLite file locking protocol.
  sqliteProtocol,

  /// SQLite empty error.
  ///
  /// This code is not currently used.
  sqliteEmpty,

  /// SQLite schema changed.
  sqliteSchema,

  /// SQLite string or data blob too large.
  sqliteTooBig,

  /// SQLite constraint violation.
  sqliteConstraint,

  /// SQLite data type mismatch.
  sqliteMismatch,

  /// SQLite interface misuse.
  sqliteMisuse,

  /// SQLite no large file support.
  sqliteNolfs,

  /// SQLite statement not authorized.
  sqliteAuth,

  /// SQLite format error.
  ///
  /// This code is not currently used.
  sqliteFormat,

  /// SQLite out of range.
  sqliteRange,

  /// Not an SQLite database.
  sqliteNotADatabase,

  /// SQLite unusual operation notice.
  sqliteNotice,

  /// SQLite unusual operation warning.
  sqliteWarning,

  /// SQLite row is available.
  sqliteRow,

  /// SQLite operation is complete.
  sqliteDone,

  /// Unknown geometry error.
  geometryUnknownError,

  /// Corrupt geometry.
  geometryCorruptedGeometry,

  /// Empty geometry.
  geometryEmptyGeometry,

  /// Math singularity.
  geometryMathSingularity,

  /// Geometry buffer too small.
  geometryBufferIsTooSmall,

  /// Geometry invalid shape type.
  geometryInvalidShapeType,

  /// Geometry projection out of supported range.
  geometryProjectionOutOfSupportedRange,

  /// Non simple geometry.
  geometryNonSimpleGeometry,

  /// Cannot calculate geodesic.
  geometryCannotCalculateGeodesic,

  /// Geometry notation conversion.
  geometryNotationConversion,

  /// Missing grid file.
  geometryMissingGridFile,

  /// Geodatabase value out of range.
  geodatabaseValueOutOfRange,

  /// Geodatabase data type mismatch.
  geodatabaseDataTypeMismatch,

  /// Geodatabase invalid XML.
  geodatabaseBadXml,

  /// Database already exists.
  geodatabaseDatabaseAlreadyExists,

  /// Database does not exist.
  geodatabaseDatabaseDoesNotExist,

  /// Geodatabase name longer than 128 characters.
  geodatabaseNameLongerThan128Characters,

  /// Geodatabase invalid shape type.
  geodatabaseInvalidShapeType,

  /// Geodatabase raster not supported.
  geodatabaseRasterNotSupported,

  /// Geodatabase relationship class one to one.
  geodatabaseRelationshipClassOneToOne,

  /// Geodatabase item not found.
  geodatabaseItemNotFound,

  /// Geodatabase duplicate code.
  geodatabaseDuplicateCode,

  /// Geodatabase missing code.
  geodatabaseMissingCode,

  /// Geodatabase wrong item type.
  geodatabaseWrongItemType,

  /// Geodatabase Id field not nullable.
  geodatabaseIdFieldNotNullable,

  /// Geodatabase default value not supported.
  geodatabaseDefaultValueNotSupported,

  /// Geodatabase table not editable.
  geodatabaseTableNotEditable,

  /// Geodatabase field not found.
  geodatabaseFieldNotFound,

  /// Geodatabase field exists.
  geodatabaseFieldExists,

  /// Geodatabase cannot alter field type.
  geodatabaseCannotAlterFieldType,

  /// Geodatabase cannot alter field width.
  geodatabaseCannotAlterFieldWidth,

  /// Geodatabase cannot alter field to nullable.
  geodatabaseCannotAlterFieldToNullable,

  /// Geodatabase cannot alter field to editable.
  geodatabaseCannotAlterFieldToEditable,

  /// Geodatabase cannot alter field to deletable.
  geodatabaseCannotAlterFieldToDeletable,

  /// Geodatabase cannot alter geometry properties.
  geodatabaseCannotAlterGeometryProperties,

  /// Geodatabase unnamed table.
  geodatabaseUnnamedTable,

  /// Geodatabase invalid type for domain.
  geodatabaseInvalidTypeForDomain,

  /// Geodatabase min max reversed.
  geodatabaseMinMaxReversed,

  /// Geodatabase field not supported on relationship class.
  geodatabaseFieldNotSupportedOnRelationshipClass,

  /// Geodatabase relationship class key.
  geodatabaseRelationshipClassKey,

  /// Geodatabase value is null.
  geodatabaseValueIsNull,

  /// Geodatabase multiple SQL statements.
  geodatabaseMultipleSqlStatements,

  /// Geodatabase no SQL statements.
  geodatabaseNoSqlStatements,

  /// Geodatabase geometry field missing.
  geodatabaseGeometryFieldMissing,

  /// Geodatabase transaction started.
  geodatabaseTransactionStarted,

  /// Geodatabase transaction not started.
  geodatabaseTransactionNotStarted,

  /// Geodatabase shape requires z.
  geodatabaseShapeRequiresZ,

  /// Geodatabase shape requires m.
  geodatabaseShapeRequiresM,

  /// Geodatabase shape no z.
  geodatabaseShapeNoZ,

  /// Geodatabase shape no m.
  geodatabaseShapeNoM,

  /// Geodatabase shape wrong type.
  geodatabaseShapeWrongType,

  /// Geodatabase cannot update field type.
  geodatabaseCannotUpdateFieldType,

  /// Geodatabase no rows affected.
  geodatabaseNoRowsAffected,

  /// Geodatabase subtype invalid.
  geodatabaseSubtypeInvalid,

  /// Geodatabase subtype must be integer.
  geodatabaseSubtypeMustBeInteger,

  /// Geodatabase subtypes not enabled.
  geodatabaseSubtypesNotEnabled,

  /// Geodatabase subtype exists.
  geodatabaseSubtypeExists,

  /// Geodatabase duplicate field not allowed.
  geodatabaseDuplicateFieldNotAllowed,

  /// Geodatabase cannot delete field.
  geodatabaseCannotDeleteField,

  /// Geodatabase index exists.
  geodatabaseIndexExists,

  /// Geodatabase index not found.
  geodatabaseIndexNotFound,

  /// Geodatabase cursor not on row.
  geodatabaseCursorNotOnRow,

  /// Geodatabase internal error.
  geodatabaseInternalError,

  /// Geodatabase cannot write geodatabase managed fields.
  geodatabaseCannotWriteGeodatabaseManagedFields,

  /// Geodatabase item already exists.
  geodatabaseItemAlreadyExists,

  /// Geodatabase invalid spatial index name.
  geodatabaseInvalidSpatialIndexName,

  /// Geodatabase requires spatial index.
  geodatabaseRequiresSpatialIndex,

  /// Geodatabase reserved name.
  geodatabaseReservedName,

  /// Geodatabase cannot update schema if change tracking.
  geodatabaseCannotUpdateSchemaIfChangeTracking,

  /// Geodatabase invalid date.
  geodatabaseInvalidDate,

  /// Geodatabase database does not have changes.
  geodatabaseDatabaseDoesNotHaveChanges,

  /// Geodatabase replica does not exist.
  geodatabaseReplicaDoesNotExist,

  /// Geodatabase storage type not supported.
  geodatabaseStorageTypeNotSupported,

  /// Geodatabase replica model error.
  geodatabaseReplicaModelError,

  /// Geodatabase replica client generation error.
  geodatabaseReplicaClientGenError,

  /// Geodatabase replica no upload to acknowledge.
  geodatabaseReplicaNoUploadToAcknowledge,

  /// Geodatabase last write time in the future.
  geodatabaseLastWriteTimeInTheFuture,

  /// Geodatabase invalid argument.
  geodatabaseInvalidArgument,

  /// Geodatabase transportation network corrupt.
  geodatabaseTransportationNetworkCorrupt,

  /// Geodatabase transportation network file IO error.
  geodatabaseTransportationNetworkFileIo,

  /// Geodatabase feature has pending edits.
  geodatabaseFeatureHasPendingEdits,

  /// Geodatabase change tracking not enabled.
  geodatabaseChangeTrackingNotEnabled,

  /// Geodatabase transportation network file open.
  geodatabaseTransportationNetworkFileOpen,

  /// Geodatabase transportation network unsupported.
  geodatabaseTransportationNetworkUnsupported,

  /// Geodatabase cannot sync copy.
  geodatabaseCannotSyncCopy,

  /// Geodatabase access control denied.
  geodatabaseAccessControlDenied,

  /// Geodatabase geometry outside replica extent.
  geodatabaseGeometryOutsideReplicaExtent,

  /// Geodatabase upload already in progress.
  geodatabaseUploadAlreadyInProgress,

  /// Geodatabase is closed.
  geodatabaseDatabaseClosed,

  /// Domain exists.
  geodatabaseDomainAlreadyExists,

  /// Geodatabase geometry type not supported.
  geodatabaseGeometryTypeNotSupported,

  /// ArcGISFeatureTable requires a global Id field to support adding bulk
  /// attachments.
  geodatabaseAttachmentsRequireGlobalIds,

  /// Violated attribute constraint rule.
  geodatabaseConstraintRuleViolation,

  /// The evaluation of attribute rules is cyclic or exceeds maximum cascading
  /// level.
  geodatabaseMaxRuleEvaluationLevelExceeded,

  /// The client version required by the geodatabase is not yet supported.
  geodatabaseUnsupportedVersion,

  /// Network attribute evaluator is not supported.
  geodatabaseTransportationNetworkUnsupportedEvaluator,

  /// Data changes cannot safely be committed due to mismatch of global ID
  /// support.
  geodatabaseGlobalIdSupportMismatch,

  /// Feature service does not support branch version reconciliation during
  /// sync.
  geodatabaseReconcileBranchVersionUnsupported,

  /// Geocode unsupported file format.
  geocodeUnsupportedFileFormat,

  /// Geocode unsupported spatial reference.
  geocodeUnsupportedSpatialReference,

  /// Geocode unsupported projection transformation.
  geocodeUnsupportedProjectionTransformation,

  /// Geocoder creation error.
  geocodeGeocoderCreation,

  /// Geocode intersections not supported.
  geocodeIntersectionsNotSupported,

  /// Uninitialized geocode task.
  geocodeUninitializedGeocodeTask,

  /// Invalid geocode locator properties.
  geocodeInvalidLocatorProperties,

  /// Geocode required field missing.
  geocodeRequiredFieldMissing,

  /// Geocode cannot read address.
  geocodeCannotReadAddress,

  /// Geocoding not supported.
  geocodeReverseGeocodingNotSupported,

  /// Geocode geometry type not supported.
  geocodeGeometryTypeNotSupported,

  /// Geocode suggest address not supported.
  geocodeSuggestAddressNotSupported,

  /// Geocode suggest result corrupt.
  geocodeSuggestResultCorrupted,

  /// Network analyst invalid route settings.
  networkAnalystInvalidRouteSettings,

  /// Network analyst no solution.
  networkAnalystNoSolution,

  /// Network analyst task canceled.
  networkAnalystTaskCanceled,

  /// Network analyst invalid network.
  networkAnalystInvalidNetwork,

  /// Network analyst directions error.
  networkAnalystDirectionsError,

  /// Network analyst insufficient number of stops.
  networkAnalystInsufficientNumberOfStops,

  /// Network analyst stop unlocated.
  networkAnalystStopUnlocated,

  /// Network analyst stop located on non traversable element.
  networkAnalystStopLocatedOnNonTraversableElement,

  /// Network analyst point barrier invalid added cost attribute name.
  networkAnalystPointBarrierInvalidAddedCostAttributeName,

  /// Network analyst line barrier invalid scaled cost attribute name.
  networkAnalystLineBarrierInvalidScaledCostAttributeName,

  /// Network analyst polygon barrier invalid scaled cost attribute name.
  networkAnalystPolygonBarrierInvalidScaledCostAttributeName,

  /// Network analyst polygon barrier invalid scaled cost attribute value.
  networkAnalystPolygonBarrierInvalidScaledCostAttributeValue,

  /// Network analyst polyline barrier invalid scaled cost attribute value.
  networkAnalystPolylineBarrierInvalidScaledCostAttributeValue,

  /// Network analyst invalid impedance attribute.
  networkAnalystInvalidImpedanceAttribute,

  /// Network analyst invalid restriction attribute.
  networkAnalystInvalidRestrictionAttribute,

  /// Network analyst invalid accumulate attribute.
  networkAnalystInvalidAccumulateAttribute,

  /// Network analyst invalid directions time attribute.
  networkAnalystInvalidDirectionsTimeAttribute,

  /// Network analyst invalid directions distance attribute.
  networkAnalystInvalidDirectionsDistanceAttribute,

  /// Network analyst invalid attribute parameters attribute name.
  networkAnalystInvalidAttributeParametersAttributeName,

  /// Network analyst invalid attributes parameters parameter name.
  networkAnalystInvalidAttributeParametersParameterName,

  /// Network analyst invalid attribute parameters restriction usage value.
  networkAnalystInvalidAttributeParametersRestrictionUsageValue,

  /// Network analyst network has no hierarchy attribute.
  networkAnalystNetworkHasNoHierarchyAttribute,

  /// Network analyst no path found between stops.
  networkAnalystNoPathFoundBetweenStops,

  /// Network analyst undefined output spatial reference.
  networkAnalystUndefinedOutputSpatialReference,

  /// Network analyst directions time and impedance attribute mismatch.
  networkAnalystDirectionsTimeAndImpedanceAttributeMismatch,

  /// Network analyst invalid directions road class attribute.
  networkAnalystInvalidDirectionsRoadClassAttribute,

  /// Network analyst stop cannot be reached.
  networkAnalystStopIsUnreachable,

  /// Network analyst stop time window starts before unix epoch.
  networkAnalystStopTimeWindowStartsBeforeUnixEpoch,

  /// Network analyst stop time window is inverted.
  networkAnalystStopTimeWindowIsInverted,

  /// Walking mode route too large.
  networkAnalystWalkingModeRouteTooLarge,

  /// Stop has null geometry.
  networkAnalystStopHasNullGeometry,

  /// Point barrier has null geometry.
  networkAnalystPointBarrierHasNullGeometry,

  /// Polyline barrier has null geometry.
  networkAnalystPolylineBarrierHasNullGeometry,

  /// Polygon barrier has null geometry.
  networkAnalystPolygonBarrierHasNullGeometry,

  /// Online route task does not support search_where_clause condition.
  networkAnalystUnsupportedSearchWhereClause,

  /// Network analyst insufficient number of facilities.
  networkAnalystInsufficientNumberOfFacilities,

  /// Network analyst facility has null geometry.
  networkAnalystFacilityHasNullGeometry,

  /// Network analyst facility has invalid added cost attribute name.
  networkAnalystFacilityHasInvalidAddedCostAttributeName,

  /// Network analyst facility has negative added cost attribute.
  networkAnalystFacilityHasNegativeAddedCostAttribute,

  /// Network analyst facility has invalid impedance cutoff.
  networkAnalystFacilityHasInvalidImpedanceCutoff,

  /// Network analyst insufficient number of incidents.
  networkAnalystInsufficientNumberOfIncidents,

  /// Network analyst incident has null geometry.
  networkAnalystIncidentHasNullGeometry,

  /// Network analyst incident has invalid added cost attribute name.
  networkAnalystIncidentHasInvalidAddedCostAttributeName,

  /// Network analyst incident has negative added cost attribute.
  networkAnalystIncidentHasNegativeAddedCostAttribute,

  /// Network analyst invalid target facility count.
  networkAnalystInvalidTargetFacilityCount,

  /// Network analyst incident has invalid impedance cutoff.
  networkAnalystIncidentHasInvalidImpedanceCutoff,

  /// Network analyst start time is before Unix epoch.
  networkAnalystStartTimeIsBeforeUnixEpoch,

  /// Network analyst invalid default impedance cutoff.
  networkAnalystInvalidDefaultImpedanceCutoff,

  /// Network analyst invalid default target facility count.
  networkAnalystInvalidDefaultTargetFacilityCount,

  /// Network analyst invalid polygon buffer distance.
  networkAnalystInvalidPolygonBufferDistance,

  /// Network analyst polylines cannot be returned.
  networkAnalystPolylinesCannotBeReturned,

  /// Network analyst solving non time impedance, but time windows applied.
  networkAnalystTimeWindowsWithNonTimeImpedance,

  /// One or more stops have unsupported type.
  networkAnalystUnsupportedStopType,

  /// Network analyst route starts or ends on a waypoint.
  networkAnalystRouteStartsOrEndsOnWaypoint,

  /// Network analyst reordering stops (Traveling Salesman Problem) is not
  /// supported when the collection of stops contains waypoints or rest breaks.
  networkAnalystWaypointsAndRestBreaksForbiddenReordering,

  /// Network analyst waypoint contains time windows.
  networkAnalystWaypointHasTimeWindows,

  /// Network analyst waypoint contains added cost attribute.
  networkAnalystWaypointHasAddedCostAttribute,

  /// Network analyst stop has unknown curb approach.
  networkAnalystStopHasInvalidCurbApproach,

  /// Network analyst point barrier has unknown curb approach.
  networkAnalystPointBarrierHasInvalidCurbApproach,

  /// Network analyst facility has unknown curb approach.
  networkAnalystFacilityHasInvalidCurbApproach,

  /// Network analyst incident has unknown curb approach.
  networkAnalystIncidentHasInvalidCurbApproach,

  /// Network dataset has no directions attributes.
  networkAnalystNetworkDoesNotSupportDirections,

  /// Desired direction language not supported by platform.
  networkAnalystDirectionsLanguageNotFound,

  /// Route result requires re-solving with current route task.
  _networkAnalystRouteResultCannotBeUpdated,

  /// Input route result does not have directions.
  _networkAnalystNoDirections,

  /// Input route result does not have stops.
  _networkAnalystNoStops,

  /// Input route result doesn't have the route with passed route index.
  _networkAnalystInvalidRouteIndex,

  /// Input remaining destinations count doesn't match with input routes stops
  /// collection.
  _networkAnalystInvalidRemainingDestinationsCount,

  /// JSON parser invalid token.
  jsonParserInvalidToken,

  /// JSON parser invalid character.
  jsonParserInvalidCharacter,

  /// JSON parser invalid unicode.
  jsonParserInvalidUnicode,

  /// JSON parser invalid start of JSON.
  jsonParserInvalidJsonStart,

  /// JSON parser invalid end of pair.
  jsonParserInvalidEndOfPair,

  /// JSON parser invalid end of element.
  jsonParserInvalidEndOfElement,

  /// JSON parser invalid escape sequence.
  jsonParserInvalidEscapeSequence,

  /// JSON parser invalid end of field name.
  jsonParserInvalidEndOfFieldName,

  /// JSON parser invalid start of field name.
  jsonParserInvalidStartOfFieldName,

  /// JSON parser invalid start of comment.
  jsonParserInvalidStartOfComment,

  /// JSON parser invalid decimal digit.
  jsonParserInvalidDecDigit,

  /// JSON parser invalid hex digit.
  jsonParserInvalidHexDigit,

  /// JSON parser expecting null.
  jsonParserExpectingNull,

  /// JSON parser expecting true.
  jsonParserExpectingTrue,

  /// JSON parser expecting false.
  jsonParserExpectingFalse,

  /// JSON parser expecting closing quote.
  jsonParserExpectingClosingQuote,

  /// JSON parser expecting not a number.
  jsonParserExpectingNan,

  /// JSON parser expecting end of comment.
  jsonParserExpectingEndOfComment,

  /// JSON parser unexpected end of data.
  jsonParserUnexpectedEndOfData,

  /// JSON object expecting start object.
  jsonObjectExpectingStartObject,

  /// JSON object expecting start array.
  jsonObjectExpectingStartArray,

  /// JSON object expecting value object.
  jsonObjectExpectingValueObject,

  /// JSON object expecting value array.
  jsonObjectExpectingValueArray,

  /// JSON object expecting value int32.
  jsonObjectExpectingValueInt32,

  /// JSON object expecting integer type.
  jsonObjectExpectingIntegerType,

  /// JSON object expecting number type.
  jsonObjectExpectingNumberType,

  /// JSON object expecting value string.
  jsonObjectExpectingValueString,

  /// JSON object expecting value bool.
  jsonObjectExpectingValueBool,

  /// JSON object iterator not started.
  jsonObjectIteratorNotStarted,

  /// JSON object iterator is finished.
  jsonObjectIteratorIsFinished,

  /// JSON object key not found.
  jsonObjectKeyNotFound,

  /// JSON object index out of range.
  jsonObjectIndexOutOfRange,

  /// JSON string writer JSON is complete.
  jsonStringWriterJsonIsComplete,

  /// JSON string writer invalid JSON input.
  jsonStringWriterInvalidJsonInput,

  /// JSON string writer expecting container.
  jsonStringWriterExpectingContainer,

  /// JSON string writer expecting key or end object.
  jsonStringWriterExpectingKeyOrEndObject,

  /// JSON string writer expecting value or end array.
  jsonStringWriterExpectingValueOrEndArray,

  /// JSON string writer expecting value.
  jsonStringWriterExpectingValue,

  /// Spatial reference is missing.
  mappingMissingSpatialReference,

  /// Initial viewpoint is missing.
  mappingMissingInitialViewpoint,

  /// Invalid request response.
  mappingInvalidResponse,

  /// Bing maps key is missing.
  mappingMissingBingMapsKey,

  /// Layer type is not supported.
  mappingUnsupportedLayerType,

  /// Sync not enabled.
  mappingSyncNotEnabled,

  /// Tile export is not enabled.
  mappingTileExportNotEnabled,

  /// Required item property is missing.
  mappingMissingItemProperty,

  /// Web map version is not supported.
  mappingWebmapNotSupported,

  /// Spatial reference invalid or incompatible.
  mappingSpatialReferenceInvalid,

  /// Package needs to be unpacked before it can be used.
  mappingPackageUnpackRequired,

  /// Elevation source data format is not supported.
  mappingUnsupportedElevationFormat,

  /// Web scene version or viewing mode is not supported.
  mappingWebsceneNotSupported,

  /// Loadable object is not loaded when it is expected to be loaded.
  mappingNotLoaded,

  /// Update packages for an offline map area are not supported.
  mappingScheduledUpdatesNotSupported,

  /// Trace operation failed.
  mappingUtilityNetworkTraceFailed,

  /// Arcade expression is invalid.
  mappingInvalidArcadeExpression,

  /// Requested extent contains too many associations.
  mappingUtilityNetworkTooManyAssociations,

  /// A layer has requested more features than the service maximum feature
  /// count.
  mappingMaxFeatureCountExceeded,

  /// Feature service does not support branch versioning.
  mappingBranchVersioningNotSupportedByService,

  /// Packaging of data for the offline map area is not complete and it is not
  /// ready for download.
  mappingPackagingNotComplete,

  /// An upload sync direction is not supported.
  mappingSyncDirectionUploadNotSupported,

  /// Tile export in .tpkx format is not supported.
  mappingTileCacheCompactV2ExportNotEnabled,

  /// The specified layer does not intersect the area of interest.
  mappingLayerDoesNotIntersectAreaOfInterest,

  /// Local edits must be sent to a service (using a sync direction of upload)
  /// before update packages can download a replacement geodatabase.
  mappingScheduledUpdateUploadRequired,

  /// Unlicensed feature.
  licensingUnlicensedFeature,

  /// License level fixed.
  licensingLicenseLevelFixed,

  /// License level is already set.
  licensingLicenseLevelAlreadySet,

  /// Main license is not set.
  licensingMainLicenseNotSet,

  /// Unlicensed extension.
  licensingUnlicensedExtension,

  /// Portal user with no license.
  licensingPortalUserWithNoLicense,

  /// IO error.
  stdIosBaseFailure,

  /// Invalid array length.
  stdBadArrayNewLength,

  /// Arithmetic underflow.
  stdUnderflowError,

  /// System error.
  stdSystemError,

  /// Range error.
  stdRangeError,

  /// Arithmetic overflow.
  stdOverflowError,

  /// Out of range.
  stdOutOfRange,

  /// Length error.
  stdLengthError,

  /// Invalid argument.
  stdInvalidArgument,

  /// Asynchronous error.
  stdFutureError,

  /// Math domain error.
  stdDomainError,

  /// Unknown error.
  stdRuntimeError,

  /// Logic error.
  stdLogicError,

  /// Invalid weak reference.
  stdBadWeakPtr,

  /// Invalid type Id.
  stdBadTypeId,

  /// Invalid function call.
  stdBadFunctionCall,

  /// Invalid error management.
  stdBadException,

  /// Invalid cast.
  stdBadCast,

  /// Out of memory.
  stdBadAlloc,

  /// Unknown error.
  stdException,

  /// Service doesn't support rerouting.
  navigationReroutingNotSupportedByService,

  /// A problem was encountered with a `GeotriggerFeed`.
  ///
  /// An invalid `GeotriggerFeed` indicates that a `GeotriggerMonitor` is unable
  /// to perform checks. No `GeotriggerNotificationInfo` events will be sent.
  geotriggersFeedError,

  /// A problem was encountered with the `FenceParameters` for a
  /// `FenceGeotrigger`.
  ///
  /// An invalid `FenceParameters` indicates that a `GeotriggerMonitor` is
  /// unable to perform checks. No `GeotriggerNotificationInfo` events will be
  /// sent.
  geotriggersFenceParametersError,

  /// A problem was encountered with the fence data for a `Geotrigger`.
  ///
  /// There is a problem with some of the fence data and these will not be
  /// checked by a `GeotriggerMonitor`. However, other data is valid and so
  /// `GeotriggerNotificationInfo` events can be sent.
  geotriggersFenceDataWarning,

  /// Device doesn't support accelerometer.
  motionSensorAccelerometerNotSupported,

  /// Device doesn't support gyroscope.
  motionSensorGyroscopeNotSupported,

  /// Device doesn't support magnetometer.
  motionSensorMagnetometerNotSupported,

  /// Invalid credentials, unable to generate token.
  authenticationInvalidCredentials,

  /// Unable to determine generate token URL.
  authenticationUnableToDetermineTokenUrl,

  /// Token has expired.
  authenticationTokenExpired,

  /// A token or API key is required.
  authenticationTokenRequired,

  /// Invalid API key.
  authenticationInvalidApiKey,

  /// Invalid token.
  authenticationInvalidToken,

  /// You do not have permission to access the resource.
  authenticationForbidden,

  /// Secure socket layer required.
  authenticationSslRequired,

  /// The credential cannot be shared with the request URL.
  authenticationCredentialCannotBeShared,

  /// The authorization end point responded with a failure.
  authenticationOAuthFailure,

  /// The authentication challenge was canceled.
  authenticationChallengeCanceled,

  /// Symbol dictionary not supported.
  symbolDictionaryNotSupported,

  /// Missing symbol dictionary configuration.
  symbolDictionaryMissingConfiguration,

  /// Missing symbol dictionary script.
  symbolDictionaryMissingScript,

  /// Missing symbol dictionary display name.
  symbolDictionaryMissingDisplayName,

  /// Error parsing the symbol dictionary configuration.
  symbolDictionaryConfigurationParsingError,

  /// Error parsing the symbol dictionary script.
  symbolDictionaryArcadeParsingError,

  /// Error evaluating the symbol dictionary script.
  symbolDictionaryArcadeEvaluationError,

  /// Error establishing connection with the stylx file for symbol dictionary.
  symbolDictionaryStylxConnectionError,

  /// Error converting ordered anchor points to geometry for symbol dictionary.
  symbolDictionaryOrderedAnchorPointToGeometryError,

  /// Error converting geometry to ordered anchor points for symbol dictionary.
  symbolDictionaryGeometryToOrderedAnchorPointError,

  /// The Field is not nullable and cannot be set to null.
  featureFormNullNotAllowedError,

  /// Field value exceeds the value of `DateTimePickerFormInput.max`.
  featureFormExceedsMaximumDateTimeError,

  /// Field value is less than the value of `DateTimePickerFormInput.min`.
  featureFormLessThanMinimumDateTimeError,

  /// Field value exceeds the maximum allowed length specified by the
  /// `FormInput`.
  featureFormExceedsMaximumLengthError,

  /// Field value is less than the minimum allowed length specified by the
  /// `FormInput`.
  featureFormLessThanMinimumLengthError,

  /// Field value exceeds the allowed numeric maximum specified by
  /// `FieldFormElement.domain`.
  featureFormExceedsNumericMaximumError,

  /// Field value is less than the allowed numeric minimum specified by
  /// `FieldFormElement.domain`.
  featureFormLessThanNumericMinimumError,

  /// Field value is not present in the coded value domain.
  featureFormNotInCodedValueDomainError,

  /// Field value is required and the `FieldFormElement.value` is null or empty.
  featureFormFieldIsRequiredError,

  /// The type of the `FieldFormElement.value` does not match the type of the
  /// field.
  featureFormIncorrectValueTypeError;

  factory ArcGISExceptionType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return success;
      case 1:
        return commonNullPtr;
      case 2:
        return commonInvalidArgument;
      case 3:
        return commonNotImplemented;
      case 4:
        return commonOutOfRange;
      case 5:
        return commonInvalidAccess;
      case 6:
        return commonIllegalState;
      case 7:
        return commonNotFound;
      case 8:
        return commonExists;
      case 9:
        return commonTimeout;
      case 10:
        return commonRegularExpression;
      case 11:
        return commonPropertyNotSupported;
      case 12:
        return commonNoPermission;
      case 13:
        return commonFile;
      case 14:
        return commonFileNotFound;
      case 15:
        return commonInvalidCall;
      case 16:
        return commonIo;
      case 17:
        return commonUserCanceled;
      case 18:
        return commonInternalError;
      case 19:
        return commonConversionFailed;
      case 20:
        return commonNoData;
      case 21:
        return commonInvalidJson;
      case 22:
        return commonUserDefinedFailure;
      case 23:
        return commonBadXml;
      case 24:
        return commonObjectAlreadyOwned;
      case 26:
        return commonExpired;
      case 27:
        return commonNullabilityViolation;
      case 28:
        return commonInvalidProperty;
      case 1001:
        return sqliteError;
      case 1002:
        return sqliteInternal;
      case 1003:
        return sqlitePerm;
      case 1004:
        return sqliteAbort;
      case 1005:
        return sqliteBusy;
      case 1006:
        return sqliteLocked;
      case 1007:
        return sqliteNoMem;
      case 1008:
        return sqliteReadonly;
      case 1009:
        return sqliteInterrupt;
      case 1010:
        return sqliteIoErr;
      case 1011:
        return sqliteCorrupt;
      case 1012:
        return sqliteNotFound;
      case 1013:
        return sqliteFull;
      case 1014:
        return sqliteCantOpen;
      case 1015:
        return sqliteProtocol;
      case 1016:
        return sqliteEmpty;
      case 1017:
        return sqliteSchema;
      case 1018:
        return sqliteTooBig;
      case 1019:
        return sqliteConstraint;
      case 1020:
        return sqliteMismatch;
      case 1021:
        return sqliteMisuse;
      case 1022:
        return sqliteNolfs;
      case 1023:
        return sqliteAuth;
      case 1024:
        return sqliteFormat;
      case 1025:
        return sqliteRange;
      case 1026:
        return sqliteNotADatabase;
      case 1027:
        return sqliteNotice;
      case 1028:
        return sqliteWarning;
      case 1029:
        return sqliteRow;
      case 1030:
        return sqliteDone;
      case 2000:
        return geometryUnknownError;
      case 2001:
        return geometryCorruptedGeometry;
      case 2002:
        return geometryEmptyGeometry;
      case 2003:
        return geometryMathSingularity;
      case 2004:
        return geometryBufferIsTooSmall;
      case 2005:
        return geometryInvalidShapeType;
      case 2006:
        return geometryProjectionOutOfSupportedRange;
      case 2007:
        return geometryNonSimpleGeometry;
      case 2008:
        return geometryCannotCalculateGeodesic;
      case 2009:
        return geometryNotationConversion;
      case 2010:
        return geometryMissingGridFile;
      case 3001:
        return geodatabaseValueOutOfRange;
      case 3002:
        return geodatabaseDataTypeMismatch;
      case 3003:
        return geodatabaseBadXml;
      case 3004:
        return geodatabaseDatabaseAlreadyExists;
      case 3005:
        return geodatabaseDatabaseDoesNotExist;
      case 3006:
        return geodatabaseNameLongerThan128Characters;
      case 3007:
        return geodatabaseInvalidShapeType;
      case 3008:
        return geodatabaseRasterNotSupported;
      case 3009:
        return geodatabaseRelationshipClassOneToOne;
      case 3010:
        return geodatabaseItemNotFound;
      case 3011:
        return geodatabaseDuplicateCode;
      case 3012:
        return geodatabaseMissingCode;
      case 3013:
        return geodatabaseWrongItemType;
      case 3014:
        return geodatabaseIdFieldNotNullable;
      case 3015:
        return geodatabaseDefaultValueNotSupported;
      case 3016:
        return geodatabaseTableNotEditable;
      case 3017:
        return geodatabaseFieldNotFound;
      case 3018:
        return geodatabaseFieldExists;
      case 3019:
        return geodatabaseCannotAlterFieldType;
      case 3020:
        return geodatabaseCannotAlterFieldWidth;
      case 3021:
        return geodatabaseCannotAlterFieldToNullable;
      case 3022:
        return geodatabaseCannotAlterFieldToEditable;
      case 3023:
        return geodatabaseCannotAlterFieldToDeletable;
      case 3024:
        return geodatabaseCannotAlterGeometryProperties;
      case 3025:
        return geodatabaseUnnamedTable;
      case 3026:
        return geodatabaseInvalidTypeForDomain;
      case 3027:
        return geodatabaseMinMaxReversed;
      case 3028:
        return geodatabaseFieldNotSupportedOnRelationshipClass;
      case 3029:
        return geodatabaseRelationshipClassKey;
      case 3030:
        return geodatabaseValueIsNull;
      case 3031:
        return geodatabaseMultipleSqlStatements;
      case 3032:
        return geodatabaseNoSqlStatements;
      case 3033:
        return geodatabaseGeometryFieldMissing;
      case 3034:
        return geodatabaseTransactionStarted;
      case 3035:
        return geodatabaseTransactionNotStarted;
      case 3036:
        return geodatabaseShapeRequiresZ;
      case 3037:
        return geodatabaseShapeRequiresM;
      case 3038:
        return geodatabaseShapeNoZ;
      case 3039:
        return geodatabaseShapeNoM;
      case 3040:
        return geodatabaseShapeWrongType;
      case 3041:
        return geodatabaseCannotUpdateFieldType;
      case 3042:
        return geodatabaseNoRowsAffected;
      case 3043:
        return geodatabaseSubtypeInvalid;
      case 3044:
        return geodatabaseSubtypeMustBeInteger;
      case 3045:
        return geodatabaseSubtypesNotEnabled;
      case 3046:
        return geodatabaseSubtypeExists;
      case 3047:
        return geodatabaseDuplicateFieldNotAllowed;
      case 3048:
        return geodatabaseCannotDeleteField;
      case 3049:
        return geodatabaseIndexExists;
      case 3050:
        return geodatabaseIndexNotFound;
      case 3051:
        return geodatabaseCursorNotOnRow;
      case 3052:
        return geodatabaseInternalError;
      case 3053:
        return geodatabaseCannotWriteGeodatabaseManagedFields;
      case 3054:
        return geodatabaseItemAlreadyExists;
      case 3055:
        return geodatabaseInvalidSpatialIndexName;
      case 3056:
        return geodatabaseRequiresSpatialIndex;
      case 3057:
        return geodatabaseReservedName;
      case 3058:
        return geodatabaseCannotUpdateSchemaIfChangeTracking;
      case 3059:
        return geodatabaseInvalidDate;
      case 3060:
        return geodatabaseDatabaseDoesNotHaveChanges;
      case 3061:
        return geodatabaseReplicaDoesNotExist;
      case 3062:
        return geodatabaseStorageTypeNotSupported;
      case 3063:
        return geodatabaseReplicaModelError;
      case 3064:
        return geodatabaseReplicaClientGenError;
      case 3065:
        return geodatabaseReplicaNoUploadToAcknowledge;
      case 3066:
        return geodatabaseLastWriteTimeInTheFuture;
      case 3067:
        return geodatabaseInvalidArgument;
      case 3068:
        return geodatabaseTransportationNetworkCorrupt;
      case 3069:
        return geodatabaseTransportationNetworkFileIo;
      case 3070:
        return geodatabaseFeatureHasPendingEdits;
      case 3071:
        return geodatabaseChangeTrackingNotEnabled;
      case 3072:
        return geodatabaseTransportationNetworkFileOpen;
      case 3073:
        return geodatabaseTransportationNetworkUnsupported;
      case 3074:
        return geodatabaseCannotSyncCopy;
      case 3075:
        return geodatabaseAccessControlDenied;
      case 3076:
        return geodatabaseGeometryOutsideReplicaExtent;
      case 3077:
        return geodatabaseUploadAlreadyInProgress;
      case 3078:
        return geodatabaseDatabaseClosed;
      case 3079:
        return geodatabaseDomainAlreadyExists;
      case 3080:
        return geodatabaseGeometryTypeNotSupported;
      case 3081:
        return geodatabaseAttachmentsRequireGlobalIds;
      case 3082:
        return geodatabaseConstraintRuleViolation;
      case 3083:
        return geodatabaseMaxRuleEvaluationLevelExceeded;
      case 3084:
        return geodatabaseUnsupportedVersion;
      case 3085:
        return geodatabaseTransportationNetworkUnsupportedEvaluator;
      case 3086:
        return geodatabaseGlobalIdSupportMismatch;
      case 3087:
        return geodatabaseReconcileBranchVersionUnsupported;
      case 4001:
        return geocodeUnsupportedFileFormat;
      case 4002:
        return geocodeUnsupportedSpatialReference;
      case 4003:
        return geocodeUnsupportedProjectionTransformation;
      case 4004:
        return geocodeGeocoderCreation;
      case 4005:
        return geocodeIntersectionsNotSupported;
      case 4006:
        return geocodeUninitializedGeocodeTask;
      case 4007:
        return geocodeInvalidLocatorProperties;
      case 4008:
        return geocodeRequiredFieldMissing;
      case 4009:
        return geocodeCannotReadAddress;
      case 4010:
        return geocodeReverseGeocodingNotSupported;
      case 4011:
        return geocodeGeometryTypeNotSupported;
      case 4012:
        return geocodeSuggestAddressNotSupported;
      case 4013:
        return geocodeSuggestResultCorrupted;
      case 5001:
        return networkAnalystInvalidRouteSettings;
      case 5002:
        return networkAnalystNoSolution;
      case 5003:
        return networkAnalystTaskCanceled;
      case 5004:
        return networkAnalystInvalidNetwork;
      case 5005:
        return networkAnalystDirectionsError;
      case 5006:
        return networkAnalystInsufficientNumberOfStops;
      case 5007:
        return networkAnalystStopUnlocated;
      case 5008:
        return networkAnalystStopLocatedOnNonTraversableElement;
      case 5009:
        return networkAnalystPointBarrierInvalidAddedCostAttributeName;
      case 5010:
        return networkAnalystLineBarrierInvalidScaledCostAttributeName;
      case 5011:
        return networkAnalystPolygonBarrierInvalidScaledCostAttributeName;
      case 5012:
        return networkAnalystPolygonBarrierInvalidScaledCostAttributeValue;
      case 5013:
        return networkAnalystPolylineBarrierInvalidScaledCostAttributeValue;
      case 5014:
        return networkAnalystInvalidImpedanceAttribute;
      case 5015:
        return networkAnalystInvalidRestrictionAttribute;
      case 5016:
        return networkAnalystInvalidAccumulateAttribute;
      case 5017:
        return networkAnalystInvalidDirectionsTimeAttribute;
      case 5018:
        return networkAnalystInvalidDirectionsDistanceAttribute;
      case 5019:
        return networkAnalystInvalidAttributeParametersAttributeName;
      case 5020:
        return networkAnalystInvalidAttributeParametersParameterName;
      case 5022:
        return networkAnalystInvalidAttributeParametersRestrictionUsageValue;
      case 5023:
        return networkAnalystNetworkHasNoHierarchyAttribute;
      case 5024:
        return networkAnalystNoPathFoundBetweenStops;
      case 5026:
        return networkAnalystUndefinedOutputSpatialReference;
      case 5029:
        return networkAnalystDirectionsTimeAndImpedanceAttributeMismatch;
      case 5030:
        return networkAnalystInvalidDirectionsRoadClassAttribute;
      case 5031:
        return networkAnalystStopIsUnreachable;
      case 5032:
        return networkAnalystStopTimeWindowStartsBeforeUnixEpoch;
      case 5033:
        return networkAnalystStopTimeWindowIsInverted;
      case 5034:
        return networkAnalystWalkingModeRouteTooLarge;
      case 5035:
        return networkAnalystStopHasNullGeometry;
      case 5036:
        return networkAnalystPointBarrierHasNullGeometry;
      case 5037:
        return networkAnalystPolylineBarrierHasNullGeometry;
      case 5038:
        return networkAnalystPolygonBarrierHasNullGeometry;
      case 5039:
        return networkAnalystUnsupportedSearchWhereClause;
      case 5040:
        return networkAnalystInsufficientNumberOfFacilities;
      case 5041:
        return networkAnalystFacilityHasNullGeometry;
      case 5042:
        return networkAnalystFacilityHasInvalidAddedCostAttributeName;
      case 5043:
        return networkAnalystFacilityHasNegativeAddedCostAttribute;
      case 5044:
        return networkAnalystFacilityHasInvalidImpedanceCutoff;
      case 5045:
        return networkAnalystInsufficientNumberOfIncidents;
      case 5046:
        return networkAnalystIncidentHasNullGeometry;
      case 5047:
        return networkAnalystIncidentHasInvalidAddedCostAttributeName;
      case 5048:
        return networkAnalystIncidentHasNegativeAddedCostAttribute;
      case 5049:
        return networkAnalystInvalidTargetFacilityCount;
      case 5050:
        return networkAnalystIncidentHasInvalidImpedanceCutoff;
      case 5051:
        return networkAnalystStartTimeIsBeforeUnixEpoch;
      case 5052:
        return networkAnalystInvalidDefaultImpedanceCutoff;
      case 5053:
        return networkAnalystInvalidDefaultTargetFacilityCount;
      case 5054:
        return networkAnalystInvalidPolygonBufferDistance;
      case 5055:
        return networkAnalystPolylinesCannotBeReturned;
      case 5056:
        return networkAnalystTimeWindowsWithNonTimeImpedance;
      case 5057:
        return networkAnalystUnsupportedStopType;
      case 5058:
        return networkAnalystRouteStartsOrEndsOnWaypoint;
      case 5059:
        return networkAnalystWaypointsAndRestBreaksForbiddenReordering;
      case 5060:
        return networkAnalystWaypointHasTimeWindows;
      case 5061:
        return networkAnalystWaypointHasAddedCostAttribute;
      case 5062:
        return networkAnalystStopHasInvalidCurbApproach;
      case 5063:
        return networkAnalystPointBarrierHasInvalidCurbApproach;
      case 5064:
        return networkAnalystFacilityHasInvalidCurbApproach;
      case 5065:
        return networkAnalystIncidentHasInvalidCurbApproach;
      case 5066:
        return networkAnalystNetworkDoesNotSupportDirections;
      case 5067:
        return networkAnalystDirectionsLanguageNotFound;
      case 5068:
        return _networkAnalystRouteResultCannotBeUpdated;
      case 5069:
        return _networkAnalystNoDirections;
      case 5070:
        return _networkAnalystNoStops;
      case 5071:
        return _networkAnalystInvalidRouteIndex;
      case 5072:
        return _networkAnalystInvalidRemainingDestinationsCount;
      case 6001:
        return jsonParserInvalidToken;
      case 6002:
        return jsonParserInvalidCharacter;
      case 6003:
        return jsonParserInvalidUnicode;
      case 6004:
        return jsonParserInvalidJsonStart;
      case 6005:
        return jsonParserInvalidEndOfPair;
      case 6006:
        return jsonParserInvalidEndOfElement;
      case 6007:
        return jsonParserInvalidEscapeSequence;
      case 6008:
        return jsonParserInvalidEndOfFieldName;
      case 6009:
        return jsonParserInvalidStartOfFieldName;
      case 6010:
        return jsonParserInvalidStartOfComment;
      case 6011:
        return jsonParserInvalidDecDigit;
      case 6012:
        return jsonParserInvalidHexDigit;
      case 6013:
        return jsonParserExpectingNull;
      case 6014:
        return jsonParserExpectingTrue;
      case 6015:
        return jsonParserExpectingFalse;
      case 6016:
        return jsonParserExpectingClosingQuote;
      case 6017:
        return jsonParserExpectingNan;
      case 6018:
        return jsonParserExpectingEndOfComment;
      case 6019:
        return jsonParserUnexpectedEndOfData;
      case 6020:
        return jsonObjectExpectingStartObject;
      case 6021:
        return jsonObjectExpectingStartArray;
      case 6022:
        return jsonObjectExpectingValueObject;
      case 6023:
        return jsonObjectExpectingValueArray;
      case 6024:
        return jsonObjectExpectingValueInt32;
      case 6025:
        return jsonObjectExpectingIntegerType;
      case 6026:
        return jsonObjectExpectingNumberType;
      case 6027:
        return jsonObjectExpectingValueString;
      case 6028:
        return jsonObjectExpectingValueBool;
      case 6029:
        return jsonObjectIteratorNotStarted;
      case 6030:
        return jsonObjectIteratorIsFinished;
      case 6031:
        return jsonObjectKeyNotFound;
      case 6032:
        return jsonObjectIndexOutOfRange;
      case 6033:
        return jsonStringWriterJsonIsComplete;
      case 6034:
        return jsonStringWriterInvalidJsonInput;
      case 6035:
        return jsonStringWriterExpectingContainer;
      case 6036:
        return jsonStringWriterExpectingKeyOrEndObject;
      case 6037:
        return jsonStringWriterExpectingValueOrEndArray;
      case 6038:
        return jsonStringWriterExpectingValue;
      case 7001:
        return mappingMissingSpatialReference;
      case 7002:
        return mappingMissingInitialViewpoint;
      case 7003:
        return mappingInvalidResponse;
      case 7004:
        return mappingMissingBingMapsKey;
      case 7005:
        return mappingUnsupportedLayerType;
      case 7006:
        return mappingSyncNotEnabled;
      case 7007:
        return mappingTileExportNotEnabled;
      case 7008:
        return mappingMissingItemProperty;
      case 7009:
        return mappingWebmapNotSupported;
      case 7011:
        return mappingSpatialReferenceInvalid;
      case 7012:
        return mappingPackageUnpackRequired;
      case 7013:
        return mappingUnsupportedElevationFormat;
      case 7014:
        return mappingWebsceneNotSupported;
      case 7015:
        return mappingNotLoaded;
      case 7016:
        return mappingScheduledUpdatesNotSupported;
      case 7017:
        return mappingUtilityNetworkTraceFailed;
      case 7018:
        return mappingInvalidArcadeExpression;
      case 7019:
        return mappingUtilityNetworkTooManyAssociations;
      case 7020:
        return mappingMaxFeatureCountExceeded;
      case 7021:
        return mappingBranchVersioningNotSupportedByService;
      case 7022:
        return mappingPackagingNotComplete;
      case 7023:
        return mappingSyncDirectionUploadNotSupported;
      case 7024:
        return mappingTileCacheCompactV2ExportNotEnabled;
      case 7025:
        return mappingLayerDoesNotIntersectAreaOfInterest;
      case 7026:
        return mappingScheduledUpdateUploadRequired;
      case 8001:
        return licensingUnlicensedFeature;
      case 8002:
        return licensingLicenseLevelFixed;
      case 8003:
        return licensingLicenseLevelAlreadySet;
      case 8004:
        return licensingMainLicenseNotSet;
      case 8005:
        return licensingUnlicensedExtension;
      case 8006:
        return licensingPortalUserWithNoLicense;
      case 10001:
        return stdIosBaseFailure;
      case 10002:
        return stdBadArrayNewLength;
      case 10003:
        return stdUnderflowError;
      case 10004:
        return stdSystemError;
      case 10005:
        return stdRangeError;
      case 10006:
        return stdOverflowError;
      case 10007:
        return stdOutOfRange;
      case 10008:
        return stdLengthError;
      case 10009:
        return stdInvalidArgument;
      case 10010:
        return stdFutureError;
      case 10011:
        return stdDomainError;
      case 10012:
        return stdRuntimeError;
      case 10013:
        return stdLogicError;
      case 10014:
        return stdBadWeakPtr;
      case 10015:
        return stdBadTypeId;
      case 10016:
        return stdBadFunctionCall;
      case 10017:
        return stdBadException;
      case 10018:
        return stdBadCast;
      case 10019:
        return stdBadAlloc;
      case 10020:
        return stdException;
      case 13001:
        return navigationReroutingNotSupportedByService;
      case 16001:
        return geotriggersFeedError;
      case 16002:
        return geotriggersFenceParametersError;
      case 16003:
        return geotriggersFenceDataWarning;
      case 17000:
        return motionSensorAccelerometerNotSupported;
      case 17001:
        return motionSensorGyroscopeNotSupported;
      case 17002:
        return motionSensorMagnetometerNotSupported;
      case 18001:
        return authenticationInvalidCredentials;
      case 18002:
        return authenticationUnableToDetermineTokenUrl;
      case 18003:
        return authenticationTokenExpired;
      case 18004:
        return authenticationTokenRequired;
      case 18005:
        return authenticationInvalidApiKey;
      case 18006:
        return authenticationInvalidToken;
      case 18007:
        return authenticationForbidden;
      case 18008:
        return authenticationSslRequired;
      case 18009:
        return authenticationCredentialCannotBeShared;
      case 18010:
        return authenticationOAuthFailure;
      case 18011:
        return authenticationChallengeCanceled;
      case 19000:
        return symbolDictionaryNotSupported;
      case 19001:
        return symbolDictionaryMissingConfiguration;
      case 19002:
        return symbolDictionaryMissingScript;
      case 19003:
        return symbolDictionaryMissingDisplayName;
      case 19004:
        return symbolDictionaryConfigurationParsingError;
      case 19005:
        return symbolDictionaryArcadeParsingError;
      case 19006:
        return symbolDictionaryArcadeEvaluationError;
      case 19007:
        return symbolDictionaryStylxConnectionError;
      case 19008:
        return symbolDictionaryOrderedAnchorPointToGeometryError;
      case 19009:
        return symbolDictionaryGeometryToOrderedAnchorPointError;
      case 20000:
        return featureFormNullNotAllowedError;
      case 20001:
        return featureFormExceedsMaximumDateTimeError;
      case 20002:
        return featureFormLessThanMinimumDateTimeError;
      case 20003:
        return featureFormExceedsMaximumLengthError;
      case 20004:
        return featureFormLessThanMinimumLengthError;
      case 20005:
        return featureFormExceedsNumericMaximumError;
      case 20006:
        return featureFormLessThanNumericMinimumError;
      case 20007:
        return featureFormNotInCodedValueDomainError;
      case 20008:
        return featureFormFieldIsRequiredError;
      case 20009:
        return featureFormIncorrectValueTypeError;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case success:
        return 0;
      case commonNullPtr:
        return 1;
      case commonInvalidArgument:
        return 2;
      case commonNotImplemented:
        return 3;
      case commonOutOfRange:
        return 4;
      case commonInvalidAccess:
        return 5;
      case commonIllegalState:
        return 6;
      case commonNotFound:
        return 7;
      case commonExists:
        return 8;
      case commonTimeout:
        return 9;
      case commonRegularExpression:
        return 10;
      case commonPropertyNotSupported:
        return 11;
      case commonNoPermission:
        return 12;
      case commonFile:
        return 13;
      case commonFileNotFound:
        return 14;
      case commonInvalidCall:
        return 15;
      case commonIo:
        return 16;
      case commonUserCanceled:
        return 17;
      case commonInternalError:
        return 18;
      case commonConversionFailed:
        return 19;
      case commonNoData:
        return 20;
      case commonInvalidJson:
        return 21;
      case commonUserDefinedFailure:
        return 22;
      case commonBadXml:
        return 23;
      case commonObjectAlreadyOwned:
        return 24;
      case commonExpired:
        return 26;
      case commonNullabilityViolation:
        return 27;
      case commonInvalidProperty:
        return 28;
      case sqliteError:
        return 1001;
      case sqliteInternal:
        return 1002;
      case sqlitePerm:
        return 1003;
      case sqliteAbort:
        return 1004;
      case sqliteBusy:
        return 1005;
      case sqliteLocked:
        return 1006;
      case sqliteNoMem:
        return 1007;
      case sqliteReadonly:
        return 1008;
      case sqliteInterrupt:
        return 1009;
      case sqliteIoErr:
        return 1010;
      case sqliteCorrupt:
        return 1011;
      case sqliteNotFound:
        return 1012;
      case sqliteFull:
        return 1013;
      case sqliteCantOpen:
        return 1014;
      case sqliteProtocol:
        return 1015;
      case sqliteEmpty:
        return 1016;
      case sqliteSchema:
        return 1017;
      case sqliteTooBig:
        return 1018;
      case sqliteConstraint:
        return 1019;
      case sqliteMismatch:
        return 1020;
      case sqliteMisuse:
        return 1021;
      case sqliteNolfs:
        return 1022;
      case sqliteAuth:
        return 1023;
      case sqliteFormat:
        return 1024;
      case sqliteRange:
        return 1025;
      case sqliteNotADatabase:
        return 1026;
      case sqliteNotice:
        return 1027;
      case sqliteWarning:
        return 1028;
      case sqliteRow:
        return 1029;
      case sqliteDone:
        return 1030;
      case geometryUnknownError:
        return 2000;
      case geometryCorruptedGeometry:
        return 2001;
      case geometryEmptyGeometry:
        return 2002;
      case geometryMathSingularity:
        return 2003;
      case geometryBufferIsTooSmall:
        return 2004;
      case geometryInvalidShapeType:
        return 2005;
      case geometryProjectionOutOfSupportedRange:
        return 2006;
      case geometryNonSimpleGeometry:
        return 2007;
      case geometryCannotCalculateGeodesic:
        return 2008;
      case geometryNotationConversion:
        return 2009;
      case geometryMissingGridFile:
        return 2010;
      case geodatabaseValueOutOfRange:
        return 3001;
      case geodatabaseDataTypeMismatch:
        return 3002;
      case geodatabaseBadXml:
        return 3003;
      case geodatabaseDatabaseAlreadyExists:
        return 3004;
      case geodatabaseDatabaseDoesNotExist:
        return 3005;
      case geodatabaseNameLongerThan128Characters:
        return 3006;
      case geodatabaseInvalidShapeType:
        return 3007;
      case geodatabaseRasterNotSupported:
        return 3008;
      case geodatabaseRelationshipClassOneToOne:
        return 3009;
      case geodatabaseItemNotFound:
        return 3010;
      case geodatabaseDuplicateCode:
        return 3011;
      case geodatabaseMissingCode:
        return 3012;
      case geodatabaseWrongItemType:
        return 3013;
      case geodatabaseIdFieldNotNullable:
        return 3014;
      case geodatabaseDefaultValueNotSupported:
        return 3015;
      case geodatabaseTableNotEditable:
        return 3016;
      case geodatabaseFieldNotFound:
        return 3017;
      case geodatabaseFieldExists:
        return 3018;
      case geodatabaseCannotAlterFieldType:
        return 3019;
      case geodatabaseCannotAlterFieldWidth:
        return 3020;
      case geodatabaseCannotAlterFieldToNullable:
        return 3021;
      case geodatabaseCannotAlterFieldToEditable:
        return 3022;
      case geodatabaseCannotAlterFieldToDeletable:
        return 3023;
      case geodatabaseCannotAlterGeometryProperties:
        return 3024;
      case geodatabaseUnnamedTable:
        return 3025;
      case geodatabaseInvalidTypeForDomain:
        return 3026;
      case geodatabaseMinMaxReversed:
        return 3027;
      case geodatabaseFieldNotSupportedOnRelationshipClass:
        return 3028;
      case geodatabaseRelationshipClassKey:
        return 3029;
      case geodatabaseValueIsNull:
        return 3030;
      case geodatabaseMultipleSqlStatements:
        return 3031;
      case geodatabaseNoSqlStatements:
        return 3032;
      case geodatabaseGeometryFieldMissing:
        return 3033;
      case geodatabaseTransactionStarted:
        return 3034;
      case geodatabaseTransactionNotStarted:
        return 3035;
      case geodatabaseShapeRequiresZ:
        return 3036;
      case geodatabaseShapeRequiresM:
        return 3037;
      case geodatabaseShapeNoZ:
        return 3038;
      case geodatabaseShapeNoM:
        return 3039;
      case geodatabaseShapeWrongType:
        return 3040;
      case geodatabaseCannotUpdateFieldType:
        return 3041;
      case geodatabaseNoRowsAffected:
        return 3042;
      case geodatabaseSubtypeInvalid:
        return 3043;
      case geodatabaseSubtypeMustBeInteger:
        return 3044;
      case geodatabaseSubtypesNotEnabled:
        return 3045;
      case geodatabaseSubtypeExists:
        return 3046;
      case geodatabaseDuplicateFieldNotAllowed:
        return 3047;
      case geodatabaseCannotDeleteField:
        return 3048;
      case geodatabaseIndexExists:
        return 3049;
      case geodatabaseIndexNotFound:
        return 3050;
      case geodatabaseCursorNotOnRow:
        return 3051;
      case geodatabaseInternalError:
        return 3052;
      case geodatabaseCannotWriteGeodatabaseManagedFields:
        return 3053;
      case geodatabaseItemAlreadyExists:
        return 3054;
      case geodatabaseInvalidSpatialIndexName:
        return 3055;
      case geodatabaseRequiresSpatialIndex:
        return 3056;
      case geodatabaseReservedName:
        return 3057;
      case geodatabaseCannotUpdateSchemaIfChangeTracking:
        return 3058;
      case geodatabaseInvalidDate:
        return 3059;
      case geodatabaseDatabaseDoesNotHaveChanges:
        return 3060;
      case geodatabaseReplicaDoesNotExist:
        return 3061;
      case geodatabaseStorageTypeNotSupported:
        return 3062;
      case geodatabaseReplicaModelError:
        return 3063;
      case geodatabaseReplicaClientGenError:
        return 3064;
      case geodatabaseReplicaNoUploadToAcknowledge:
        return 3065;
      case geodatabaseLastWriteTimeInTheFuture:
        return 3066;
      case geodatabaseInvalidArgument:
        return 3067;
      case geodatabaseTransportationNetworkCorrupt:
        return 3068;
      case geodatabaseTransportationNetworkFileIo:
        return 3069;
      case geodatabaseFeatureHasPendingEdits:
        return 3070;
      case geodatabaseChangeTrackingNotEnabled:
        return 3071;
      case geodatabaseTransportationNetworkFileOpen:
        return 3072;
      case geodatabaseTransportationNetworkUnsupported:
        return 3073;
      case geodatabaseCannotSyncCopy:
        return 3074;
      case geodatabaseAccessControlDenied:
        return 3075;
      case geodatabaseGeometryOutsideReplicaExtent:
        return 3076;
      case geodatabaseUploadAlreadyInProgress:
        return 3077;
      case geodatabaseDatabaseClosed:
        return 3078;
      case geodatabaseDomainAlreadyExists:
        return 3079;
      case geodatabaseGeometryTypeNotSupported:
        return 3080;
      case geodatabaseAttachmentsRequireGlobalIds:
        return 3081;
      case geodatabaseConstraintRuleViolation:
        return 3082;
      case geodatabaseMaxRuleEvaluationLevelExceeded:
        return 3083;
      case geodatabaseUnsupportedVersion:
        return 3084;
      case geodatabaseTransportationNetworkUnsupportedEvaluator:
        return 3085;
      case geodatabaseGlobalIdSupportMismatch:
        return 3086;
      case geodatabaseReconcileBranchVersionUnsupported:
        return 3087;
      case geocodeUnsupportedFileFormat:
        return 4001;
      case geocodeUnsupportedSpatialReference:
        return 4002;
      case geocodeUnsupportedProjectionTransformation:
        return 4003;
      case geocodeGeocoderCreation:
        return 4004;
      case geocodeIntersectionsNotSupported:
        return 4005;
      case geocodeUninitializedGeocodeTask:
        return 4006;
      case geocodeInvalidLocatorProperties:
        return 4007;
      case geocodeRequiredFieldMissing:
        return 4008;
      case geocodeCannotReadAddress:
        return 4009;
      case geocodeReverseGeocodingNotSupported:
        return 4010;
      case geocodeGeometryTypeNotSupported:
        return 4011;
      case geocodeSuggestAddressNotSupported:
        return 4012;
      case geocodeSuggestResultCorrupted:
        return 4013;
      case networkAnalystInvalidRouteSettings:
        return 5001;
      case networkAnalystNoSolution:
        return 5002;
      case networkAnalystTaskCanceled:
        return 5003;
      case networkAnalystInvalidNetwork:
        return 5004;
      case networkAnalystDirectionsError:
        return 5005;
      case networkAnalystInsufficientNumberOfStops:
        return 5006;
      case networkAnalystStopUnlocated:
        return 5007;
      case networkAnalystStopLocatedOnNonTraversableElement:
        return 5008;
      case networkAnalystPointBarrierInvalidAddedCostAttributeName:
        return 5009;
      case networkAnalystLineBarrierInvalidScaledCostAttributeName:
        return 5010;
      case networkAnalystPolygonBarrierInvalidScaledCostAttributeName:
        return 5011;
      case networkAnalystPolygonBarrierInvalidScaledCostAttributeValue:
        return 5012;
      case networkAnalystPolylineBarrierInvalidScaledCostAttributeValue:
        return 5013;
      case networkAnalystInvalidImpedanceAttribute:
        return 5014;
      case networkAnalystInvalidRestrictionAttribute:
        return 5015;
      case networkAnalystInvalidAccumulateAttribute:
        return 5016;
      case networkAnalystInvalidDirectionsTimeAttribute:
        return 5017;
      case networkAnalystInvalidDirectionsDistanceAttribute:
        return 5018;
      case networkAnalystInvalidAttributeParametersAttributeName:
        return 5019;
      case networkAnalystInvalidAttributeParametersParameterName:
        return 5020;
      case networkAnalystInvalidAttributeParametersRestrictionUsageValue:
        return 5022;
      case networkAnalystNetworkHasNoHierarchyAttribute:
        return 5023;
      case networkAnalystNoPathFoundBetweenStops:
        return 5024;
      case networkAnalystUndefinedOutputSpatialReference:
        return 5026;
      case networkAnalystDirectionsTimeAndImpedanceAttributeMismatch:
        return 5029;
      case networkAnalystInvalidDirectionsRoadClassAttribute:
        return 5030;
      case networkAnalystStopIsUnreachable:
        return 5031;
      case networkAnalystStopTimeWindowStartsBeforeUnixEpoch:
        return 5032;
      case networkAnalystStopTimeWindowIsInverted:
        return 5033;
      case networkAnalystWalkingModeRouteTooLarge:
        return 5034;
      case networkAnalystStopHasNullGeometry:
        return 5035;
      case networkAnalystPointBarrierHasNullGeometry:
        return 5036;
      case networkAnalystPolylineBarrierHasNullGeometry:
        return 5037;
      case networkAnalystPolygonBarrierHasNullGeometry:
        return 5038;
      case networkAnalystUnsupportedSearchWhereClause:
        return 5039;
      case networkAnalystInsufficientNumberOfFacilities:
        return 5040;
      case networkAnalystFacilityHasNullGeometry:
        return 5041;
      case networkAnalystFacilityHasInvalidAddedCostAttributeName:
        return 5042;
      case networkAnalystFacilityHasNegativeAddedCostAttribute:
        return 5043;
      case networkAnalystFacilityHasInvalidImpedanceCutoff:
        return 5044;
      case networkAnalystInsufficientNumberOfIncidents:
        return 5045;
      case networkAnalystIncidentHasNullGeometry:
        return 5046;
      case networkAnalystIncidentHasInvalidAddedCostAttributeName:
        return 5047;
      case networkAnalystIncidentHasNegativeAddedCostAttribute:
        return 5048;
      case networkAnalystInvalidTargetFacilityCount:
        return 5049;
      case networkAnalystIncidentHasInvalidImpedanceCutoff:
        return 5050;
      case networkAnalystStartTimeIsBeforeUnixEpoch:
        return 5051;
      case networkAnalystInvalidDefaultImpedanceCutoff:
        return 5052;
      case networkAnalystInvalidDefaultTargetFacilityCount:
        return 5053;
      case networkAnalystInvalidPolygonBufferDistance:
        return 5054;
      case networkAnalystPolylinesCannotBeReturned:
        return 5055;
      case networkAnalystTimeWindowsWithNonTimeImpedance:
        return 5056;
      case networkAnalystUnsupportedStopType:
        return 5057;
      case networkAnalystRouteStartsOrEndsOnWaypoint:
        return 5058;
      case networkAnalystWaypointsAndRestBreaksForbiddenReordering:
        return 5059;
      case networkAnalystWaypointHasTimeWindows:
        return 5060;
      case networkAnalystWaypointHasAddedCostAttribute:
        return 5061;
      case networkAnalystStopHasInvalidCurbApproach:
        return 5062;
      case networkAnalystPointBarrierHasInvalidCurbApproach:
        return 5063;
      case networkAnalystFacilityHasInvalidCurbApproach:
        return 5064;
      case networkAnalystIncidentHasInvalidCurbApproach:
        return 5065;
      case networkAnalystNetworkDoesNotSupportDirections:
        return 5066;
      case networkAnalystDirectionsLanguageNotFound:
        return 5067;
      case _networkAnalystRouteResultCannotBeUpdated:
        return 5068;
      case _networkAnalystNoDirections:
        return 5069;
      case _networkAnalystNoStops:
        return 5070;
      case _networkAnalystInvalidRouteIndex:
        return 5071;
      case _networkAnalystInvalidRemainingDestinationsCount:
        return 5072;
      case jsonParserInvalidToken:
        return 6001;
      case jsonParserInvalidCharacter:
        return 6002;
      case jsonParserInvalidUnicode:
        return 6003;
      case jsonParserInvalidJsonStart:
        return 6004;
      case jsonParserInvalidEndOfPair:
        return 6005;
      case jsonParserInvalidEndOfElement:
        return 6006;
      case jsonParserInvalidEscapeSequence:
        return 6007;
      case jsonParserInvalidEndOfFieldName:
        return 6008;
      case jsonParserInvalidStartOfFieldName:
        return 6009;
      case jsonParserInvalidStartOfComment:
        return 6010;
      case jsonParserInvalidDecDigit:
        return 6011;
      case jsonParserInvalidHexDigit:
        return 6012;
      case jsonParserExpectingNull:
        return 6013;
      case jsonParserExpectingTrue:
        return 6014;
      case jsonParserExpectingFalse:
        return 6015;
      case jsonParserExpectingClosingQuote:
        return 6016;
      case jsonParserExpectingNan:
        return 6017;
      case jsonParserExpectingEndOfComment:
        return 6018;
      case jsonParserUnexpectedEndOfData:
        return 6019;
      case jsonObjectExpectingStartObject:
        return 6020;
      case jsonObjectExpectingStartArray:
        return 6021;
      case jsonObjectExpectingValueObject:
        return 6022;
      case jsonObjectExpectingValueArray:
        return 6023;
      case jsonObjectExpectingValueInt32:
        return 6024;
      case jsonObjectExpectingIntegerType:
        return 6025;
      case jsonObjectExpectingNumberType:
        return 6026;
      case jsonObjectExpectingValueString:
        return 6027;
      case jsonObjectExpectingValueBool:
        return 6028;
      case jsonObjectIteratorNotStarted:
        return 6029;
      case jsonObjectIteratorIsFinished:
        return 6030;
      case jsonObjectKeyNotFound:
        return 6031;
      case jsonObjectIndexOutOfRange:
        return 6032;
      case jsonStringWriterJsonIsComplete:
        return 6033;
      case jsonStringWriterInvalidJsonInput:
        return 6034;
      case jsonStringWriterExpectingContainer:
        return 6035;
      case jsonStringWriterExpectingKeyOrEndObject:
        return 6036;
      case jsonStringWriterExpectingValueOrEndArray:
        return 6037;
      case jsonStringWriterExpectingValue:
        return 6038;
      case mappingMissingSpatialReference:
        return 7001;
      case mappingMissingInitialViewpoint:
        return 7002;
      case mappingInvalidResponse:
        return 7003;
      case mappingMissingBingMapsKey:
        return 7004;
      case mappingUnsupportedLayerType:
        return 7005;
      case mappingSyncNotEnabled:
        return 7006;
      case mappingTileExportNotEnabled:
        return 7007;
      case mappingMissingItemProperty:
        return 7008;
      case mappingWebmapNotSupported:
        return 7009;
      case mappingSpatialReferenceInvalid:
        return 7011;
      case mappingPackageUnpackRequired:
        return 7012;
      case mappingUnsupportedElevationFormat:
        return 7013;
      case mappingWebsceneNotSupported:
        return 7014;
      case mappingNotLoaded:
        return 7015;
      case mappingScheduledUpdatesNotSupported:
        return 7016;
      case mappingUtilityNetworkTraceFailed:
        return 7017;
      case mappingInvalidArcadeExpression:
        return 7018;
      case mappingUtilityNetworkTooManyAssociations:
        return 7019;
      case mappingMaxFeatureCountExceeded:
        return 7020;
      case mappingBranchVersioningNotSupportedByService:
        return 7021;
      case mappingPackagingNotComplete:
        return 7022;
      case mappingSyncDirectionUploadNotSupported:
        return 7023;
      case mappingTileCacheCompactV2ExportNotEnabled:
        return 7024;
      case mappingLayerDoesNotIntersectAreaOfInterest:
        return 7025;
      case mappingScheduledUpdateUploadRequired:
        return 7026;
      case licensingUnlicensedFeature:
        return 8001;
      case licensingLicenseLevelFixed:
        return 8002;
      case licensingLicenseLevelAlreadySet:
        return 8003;
      case licensingMainLicenseNotSet:
        return 8004;
      case licensingUnlicensedExtension:
        return 8005;
      case licensingPortalUserWithNoLicense:
        return 8006;
      case stdIosBaseFailure:
        return 10001;
      case stdBadArrayNewLength:
        return 10002;
      case stdUnderflowError:
        return 10003;
      case stdSystemError:
        return 10004;
      case stdRangeError:
        return 10005;
      case stdOverflowError:
        return 10006;
      case stdOutOfRange:
        return 10007;
      case stdLengthError:
        return 10008;
      case stdInvalidArgument:
        return 10009;
      case stdFutureError:
        return 10010;
      case stdDomainError:
        return 10011;
      case stdRuntimeError:
        return 10012;
      case stdLogicError:
        return 10013;
      case stdBadWeakPtr:
        return 10014;
      case stdBadTypeId:
        return 10015;
      case stdBadFunctionCall:
        return 10016;
      case stdBadException:
        return 10017;
      case stdBadCast:
        return 10018;
      case stdBadAlloc:
        return 10019;
      case stdException:
        return 10020;
      case navigationReroutingNotSupportedByService:
        return 13001;
      case geotriggersFeedError:
        return 16001;
      case geotriggersFenceParametersError:
        return 16002;
      case geotriggersFenceDataWarning:
        return 16003;
      case motionSensorAccelerometerNotSupported:
        return 17000;
      case motionSensorGyroscopeNotSupported:
        return 17001;
      case motionSensorMagnetometerNotSupported:
        return 17002;
      case authenticationInvalidCredentials:
        return 18001;
      case authenticationUnableToDetermineTokenUrl:
        return 18002;
      case authenticationTokenExpired:
        return 18003;
      case authenticationTokenRequired:
        return 18004;
      case authenticationInvalidApiKey:
        return 18005;
      case authenticationInvalidToken:
        return 18006;
      case authenticationForbidden:
        return 18007;
      case authenticationSslRequired:
        return 18008;
      case authenticationCredentialCannotBeShared:
        return 18009;
      case authenticationOAuthFailure:
        return 18010;
      case authenticationChallengeCanceled:
        return 18011;
      case symbolDictionaryNotSupported:
        return 19000;
      case symbolDictionaryMissingConfiguration:
        return 19001;
      case symbolDictionaryMissingScript:
        return 19002;
      case symbolDictionaryMissingDisplayName:
        return 19003;
      case symbolDictionaryConfigurationParsingError:
        return 19004;
      case symbolDictionaryArcadeParsingError:
        return 19005;
      case symbolDictionaryArcadeEvaluationError:
        return 19006;
      case symbolDictionaryStylxConnectionError:
        return 19007;
      case symbolDictionaryOrderedAnchorPointToGeometryError:
        return 19008;
      case symbolDictionaryGeometryToOrderedAnchorPointError:
        return 19009;
      case featureFormNullNotAllowedError:
        return 20000;
      case featureFormExceedsMaximumDateTimeError:
        return 20001;
      case featureFormLessThanMinimumDateTimeError:
        return 20002;
      case featureFormExceedsMaximumLengthError:
        return 20003;
      case featureFormLessThanMinimumLengthError:
        return 20004;
      case featureFormExceedsNumericMaximumError:
        return 20005;
      case featureFormLessThanNumericMinimumError:
        return 20006;
      case featureFormNotInCodedValueDomainError:
        return 20007;
      case featureFormFieldIsRequiredError:
        return 20008;
      case featureFormIncorrectValueTypeError:
        return 20009;
    }
  }
}

/// A [Future] represents work that can be completed asynchronously and
/// concurrently with other work.
///
/// A [Future] can be either executing or complete as indicated by
/// [_ArcGISFuture.isDone]. Notification of completion is available through the
/// callback `FutureCompletedEvent`.
///
/// When complete, the [Future] will have either completed successfully or
/// failed with an error during its execution. A successfully completed [Future]
/// returns null from [_ArcGISFuture.getError] and the result can be obtained
/// from [_ArcGISFuture.get]. Whereas a failed [Future] returns an
/// [ArcGISException], including if the [Future] was canceled.
///
/// Successfully completed [Future] instances may return a result to the caller.
/// The result is accessed by calling [_ArcGISFuture.get]. If there is no result
/// an empty [_Element] is returned.
///
/// If the [Future] is executing and [_ArcGISFuture.get] or [_ArcGISFuture.wait]
/// is called the thread will be blocked until the completion of the [Future].
/// Once the [Future] is complete subsequent calls will no longer block. If the
/// [Future] fails, but not canceled, both [_ArcGISFuture.get] or
/// [_ArcGISFuture.wait] will result in an error. A cancelled [Future] will
/// return a null from [_ArcGISFuture.get] and [_ArcGISFutureStatus.canceled]
/// from [_ArcGISFuture.wait]. To avoid blocking calling threads with either
/// [_ArcGISFuture.get] or [_ArcGISFuture.wait], it is recommended to use the
/// `FutureCompletedEvent` to receive a completion notification before checking
/// [_ArcGISFuture.getError] for errors and then calling [_ArcGISFuture.get] to
/// access the return value.
///
/// An executing [Future] can be requested to cancel by calling
/// [_ArcGISFuture.cancel]. If the cancellation is observed by the executing
/// code, then the [Future] returns an [ArcGISException] from
/// [_ArcGISFuture.getError].
final class _ArcGISFuture<T extends Object>
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_TaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Task_destroyInstance.cast());

  static _ArcGISFuture<T>? _fromHandle<T extends Object>(RT_TaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ArcGISFuture._instanceCache.instanceWith(handle);
  }

  _ArcGISFuture._withHandle(RT_TaskHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Task_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _taskCompletedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Task_setTaskCompletedCallback(
              _handle,
              bindings.addresses.asyncFutureCompletedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Task_setTaskCompletedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void> _taskCompletedStreamController;

  /// Sets the function that will be called when the [Future] is completed.
  ///
  /// When the [Future] completes then [_ArcGISFuture.isDone] is true and this
  /// callback will be called.
  ///
  /// Setting this callback after [Future] has completed will immediately call
  /// the callback.
  ///
  /// Setting the callback to null after it has already been set will stop the
  /// function from being called.
  Stream<void> get onTaskCompleted => _taskCompletedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _ArcGISFutureFactory(), kind: 'Task');

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_getInstanceId(_handle, errorHandler);
    });
  }

  /// Request cancellation of the [Future].
  ///
  /// Cancellation is a cooperative mechanism. Cancel can be called on the
  /// [Future], but the executing code must also periodically check for
  /// cancellation and terminate. It is possible that a canceled [Future] could
  /// still complete successfully, if cancel was called after the executing code
  /// checked for cancellation. Once cancel is called,
  /// [_ArcGISFuture.isCanceled] will return true. If the executing code
  /// observed the cancellation, the following will apply:
  /// * [_ArcGISFuture.getError] returns an error indicating cancellation
  /// * [_ArcGISFuture.get] returns null
  /// * [_ArcGISFuture.wait] returns [_ArcGISFutureStatus.canceled]
  ///
  /// Return Value: true if the [Future] was requested to cancel, false if the
  /// [Future] had already been requested to cancel. Returns false if an error
  /// occurs.
  bool cancel() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_cancel(_handle, errorHandler);
    });
  }

  /// Returns the result of the [Future].
  ///
  /// If the [Future] is successful then [_ArcGISFuture.get] will return the
  /// result. For a [Future] which is successful but has no result then an empty
  /// [_Element] is returned.
  ///
  /// If the [Future] has failed during execution, the call to
  /// [_ArcGISFuture.get] will result in an error.
  ///
  /// If the [Future] is not complete, a call to [_ArcGISFuture.get] will block
  /// the calling thread until the [Future] completes execution.
  ///
  /// Return Value: The result of the [Future] or null if the [Future] was
  /// canceled.
  T? get() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_get(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// If the [Future] is executing, or has completed successfully, a null is
  /// returned. If the [Future] has failed returns the error.
  ///
  /// If the [Future] is executing, or completed successfully null is returned.
  /// For a completed but failed [Future] the failure is returned in an
  /// [ArcGISException].
  ///
  /// If the [Future] terminated due to a cancellation request, this is also a
  /// failure and returns an error.
  ///
  /// Return Value: Returns the [ArcGISException] instance or null.
  ArcGISException? getError() {
    final errorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_getError(_handle, errorHandler);
    });
    return errorHandle.toArcGISException();
  }

  /// Indicates if the [Future] has been requested to cancel.
  ///
  /// Return Value: true if the [Future] has been requested to cancel or false
  /// otherwise.
  bool isCanceled() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_isCanceled(_handle, errorHandler);
    });
  }

  /// Indicates if the [Future] has completed execution.
  ///
  /// Return Value: true if the [Future] has completed, false otherwise.
  bool isDone() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_isDone(_handle, errorHandler);
    });
  }

  /// Waits for the [Future] to complete.
  ///
  /// If the [Future] is successful or canceled then [_ArcGISFuture.wait] will
  /// return the [_ArcGISFutureStatus].
  ///
  /// If the [Future] has failed during execution, the call to
  /// [_ArcGISFuture.wait] will result in an error.
  ///
  /// If the [Future] is not complete, a call to [_ArcGISFuture.wait] will block
  /// the calling thread until the [Future] completes execution.
  ///
  /// Return Value: The [_ArcGISFutureStatus]. Returns
  /// [_ArcGISFutureStatus.unknown] if an error occurs.
  _ArcGISFutureStatus wait() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_wait(_handle, errorHandler);
    });
    return _ArcGISFutureStatus._fromCoreValue(coreValue);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeFutureCompletedEvent:
        _taskCompletedStreamController.add(null);
      default:
        logger.f('_ArcGISFuture unhandled asyncType $asyncType');
    }
  }
}

final class _ArcGISFutureFactory
    implements _InstanceFactory<_ArcGISFuture, RT_TaskHandle> {
  @override
  _ArcGISFuture createInstance({required RT_TaskHandle handle}) {
    return _ArcGISFuture._withHandle(handle);
  }

  @override
  void destroyHandle(RT_TaskHandle handle) {
    bindings.Task_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_TaskHandle handle) {
    return runtimecore.RT_Task_getInstanceId(handle, ffi.nullptr);
  }
}

/// The different states for [Future].
///
/// Each of the different states for a [Future] instance.
enum _ArcGISFutureStatus {
  /// The [Future] has completed.
  completed,

  /// The [Future] was canceled.
  canceled,

  /// The [Future] has not completed and is not canceled.
  notComplete,

  /// The [Future] status is unknown. Used for error conditions.
  unknown;

  factory _ArcGISFutureStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return completed;
      case 1:
        return canceled;
      case 2:
        return notComplete;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case completed:
        return 0;
      case canceled:
        return 1;
      case notComplete:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// The Image object.
final class ArcGISImage implements ffi.Finalizable {
  final RT_ImageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Image_destroy.cast());

  static ArcGISImage? _fromHandle(RT_ImageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISImage._withHandle(handle);
  }

  ArcGISImage._withHandle(RT_ImageHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Image_created(_handle);
    }
  }

  /// Creates a new image object.
  ///
  /// Parameters:
  /// - `height` — The height of the image.
  /// - `width` — The width of the image.
  /// - `data` — The byte array containing the data for the image.
  factory ArcGISImage(
      {required int height, required int width, required Uint8List data}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreData = data.toByteArrayWrapper();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_create(
          height, width, coreData.ref, errorHandler);
    });
    return ArcGISImage._withHandle(handle);
  }

  /// Creates a new image object from a file.
  ///
  /// Will open PNG and JPEG images.
  ///
  /// Parameters:
  /// - `fileUri` — The location of the image.
  static ArcGISImage? fromFile(Uri fileUri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_createFromFile(
          coreFileUri.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return ArcGISImage._withHandle(handle);
  }

  /// Creates a new image object from a buffer.
  ///
  /// Will open PNG and JPEG images.
  ///
  /// Parameters:
  /// - `data` — The bytes to the image.
  static ArcGISImage? withBuffer(Uint8List data) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreData = data.toByteArrayWrapper();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_createWithBuffer(coreData.ref, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return ArcGISImage._withHandle(handle);
  }

  /// Height of image.
  ///
  /// The height of the image, or 0 if an error occurs.
  int get height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_getHeight(_handle, errorHandler);
    });
  }

  /// Width of image.
  ///
  /// The width of the image, or 0 if an error occurs.
  int get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_getWidth(_handle, errorHandler);
    });
  }

  /// Returns image data in RGBA.
  ///
  /// The byte array that is returned cannot be used after the [ArcGISImage] has
  /// been destroyed. The memory is deleted.
  ///
  /// Return Value: The image data. An empty byte array if an error occurs.
  Uint8List getBuffer() {
    final byteArray = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_getBuffer(_handle, errorHandler);
    });
    return byteArray.toDartList();
  }

  /// Returns image data in the same format that it was created.
  ///
  /// The byte array that is returned cannot be used after the [ArcGISImage] has
  /// been destroyed. The memory is deleted.
  ///
  /// Return Value: The image data.
  Uint8List getEncodedBuffer() {
    final byteArrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_getEncodedBuffer(_handle, errorHandler);
    });
    return _ByteArray._fromHandle(byteArrayHandle)!.toDartList();
  }

  /// Creates an [ArcGISImage] parsed from a raw data buffer in JPG or PNG format.
  static ArcGISImage fromBytes(Uint8List bytes) {
    _initializeArcGISEnvironmentIfNeeded();
    final byteArray = ByteArrayBuffer(bytes);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_createWithBuffer(byteArray.ref, errorHandler);
    });
    return ArcGISImage._withHandle(handle);
  }

  /// Creates an [ArcGISImage] parsed from a raw data buffer in JPG or PNG format.
  static ArcGISImage fromByteData(ByteData byteData) {
    return fromBytes(byteData.buffer.asUint8List());
  }

  /// Converts a [ui.Image] to an [ArcGISImage].
  static Future<ArcGISImage> fromImage(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return fromByteData(byteData!);
  }

  /// Retrieves an [ArcGISImage] from the [rootBundle] under the key [assetKey].
  static Future<ArcGISImage> fromAsset(String assetKey) async {
    final byteData = await rootBundle.load(assetKey);
    return fromByteData(byteData);
  }

  /// For use with resolution-aware image assets, retrieves an [ArcGISImage] from the [rootBundle] under the key [assetKey], matching the [devicePixelScale].
  static Future<ArcGISImage> fromScaledAsset(String assetKey,
      {double devicePixelScale = 1.0}) async {
    const scales = [1.0, 1.5, 2.0, 3.0, 4.0];

    // Set to largest scale for if devicePixelScale is greater than highest scale.
    var imgScale = scales.last;

    for (final scale in scales) {
      if (devicePixelScale <= scale) {
        imgScale = scale;
        break;
      }
    }

    // Modify the asset key string to include the scale
    var scaledAssetKey = assetKey;
    if (imgScale != 1.0) {
      final assetKeyComponents = assetKey.split('/');
      assetKeyComponents.insert(assetKeyComponents.length - 1, '${imgScale}x');
      scaledAssetKey = assetKeyComponents.join('/');
    }

    return fromAsset(scaledAssetKey);
  }

  /// Converts this image to a [ui.Image]. The caller is responsible for calling [ui.Image.dispose()] on the returned image.
  Future<ui.Image> toImage() async {
    final rtByteArray = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Image_getBuffer(_handle, errorHandler);
    });

    // fromUint8List creates a copy
    final buffer = await ImmutableBuffer.fromUint8List(
        rtByteArray.data.asTypedList(rtByteArray.size));

    final imageDescriptor = ui.ImageDescriptor.raw(buffer,
        width: width, height: height, pixelFormat: ui.PixelFormat.rgba8888);
    final codec = await imageDescriptor.instantiateCodec();
    final frameInfo = await codec.getNextFrame();
    final uiImage = frameInfo.image.clone();
    frameInfo.image.dispose();

    buffer.dispose();

    return uiImage;
  }
}

/// Defines an iterable type.
final class _ArcGISIterator<T extends Object> implements ffi.Finalizable {
  final RT_IteratorHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Iterator_destroy.cast());

  static _ArcGISIterator<T>? _fromHandle<T extends Object>(
      RT_IteratorHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ArcGISIterator._withHandle(handle);
  }

  _ArcGISIterator._withHandle(RT_IteratorHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Iterator_created(_handle);
    }
  }

  /// Tests if the iterator has an element to move on to.
  ///
  /// Return Value: true if it succeeds, false if it fails.
  bool hasNext() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Iterator_hasNext(_handle, errorHandler);
    });
  }

  /// Returns the next element in the iterator.
  ///
  /// Return Value: An [_Element].
  T? next() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Iterator_next(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Resets the iterator back to its initial state.
  ///
  /// Not all iterators can be reset. If it can't then an exception should be
  /// thrown.
  void reset() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Iterator_reset(_handle, errorHandler);
    });
  }
}

/// Defines an immutable dynamic array.
///
/// The array holds [_Element] objects. Use [_Array.valueType] to determine what
/// type of [_Element] objects are being stored in the array. An [_Element] that
/// has been retrieved from the array can be converted to its underlying type by
/// calling (for example) int32_t int_value =
/// RT_Element_getValueAsInt32(element_handle, error_handler);
final class _Array<T extends Object> implements ffi.Finalizable {
  final RT_ArrayHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Array_destroy.cast());

  static _Array<T>? _fromHandle<T extends Object>(RT_ArrayHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Array._withHandle(handle);
  }

  _ArrayType get _objectType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_getObjectType(_handle, errorHandler);
    });
    return _ArrayType._fromCoreValue(coreValue);
  }

  _Array._withHandle(RT_ArrayHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Array_created(_handle);
    }
  }

  /// Determines the number of values in the array.
  ///
  /// The number of values in the array. If an error occurs a 0 will be
  /// returned.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_getSize(_handle, errorHandler);
    });
  }

  /// The type of the values this array holds.
  _ElementType get valueType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_getValueType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  /// Get a value at a specific position.
  ///
  /// Retrieves the value at the specified position.
  ///
  /// Parameters:
  /// - `position` — The position which you want to get the value.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? at({required int position}) {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_at(_handle, position, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Does the array contain the given value.
  ///
  /// Does the array contain a specific value.
  ///
  /// Parameters:
  /// - `value` — The value you want to find.
  ///
  /// Return Value: True if the value is in the array otherwise false.
  bool contains({required T value}) {
    final coreValue = _ElementExtension.fromDartValue(value);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_contains(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Creates an [_ArrayBuilder].
  ///
  /// Parameters:
  /// - `valueType` — The type of the values the returned [_ArrayBuilder] holds.
  ///
  /// Return Value: An [_ArrayBuilder]
  static _ArrayBuilder<T> createBuilder<T extends Object>(
      {required _ElementType valueType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_createBuilder(
          valueType.coreValue, errorHandler);
    });
    return _ArrayBuilder._fromHandle(objectHandle)!;
  }

  /// Get the first value in the array.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? first() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_first(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Retrieves the position of the given value in the array.
  ///
  /// Parameters:
  /// - `value` — The value you want to find.
  ///
  /// Return Value: The position of the value in the array, or the max value of
  /// size_t otherwise.
  int indexOf({required T value}) {
    final coreValue = _ElementExtension.fromDartValue(value);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_indexOf(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Determines if there are any values in the array.
  ///
  /// Check if the array object has any values in it.
  ///
  /// Return Value: true if the array object contains no values otherwise false.
  /// Will return true if an error occurs.
  bool isEmpty() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_isEmpty(_handle, errorHandler);
    });
  }

  /// Get the last value in the array.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? last() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Array_last(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }
}

/// Use to create and populate [List] collections.
///
/// The [_ArrayBuilder] provides a mechanism for creating and populating [List]
/// objects. Because [List] objects cannot be created or populate directly (they
/// are immutable objects) the [_ArrayBuilder] provides an efficient means to
/// overcome this.
///
/// Use [_Array.createBuilder] to create an [_ArrayBuilder].
///
/// There are a couple of performance optimizations to consider when adding
/// values to an [_ArrayBuilder]:
/// 1. A single instance of an [_Element] object can be reused by setting its
/// value prior to each call to [_ArrayBuilder.add].
/// 2. If the overhead of creating these [_Element] is too much for a specific
/// value type, consider subclassing the [_ArrayBuilder] and provide
/// "overloaded" methods that would accept that value type directly. This would
/// eliminate the overhead of instantiating these [_Element] objects.
final class _ArrayBuilder<T extends Object> implements ffi.Finalizable {
  final RT_ArrayBuilderHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ArrayBuilder_destroy.cast());

  static _ArrayBuilder<T>? _fromHandle<T extends Object>(
      RT_ArrayBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ArrayBuilder._withHandle(handle);
  }

  _ArrayBuilder._withHandle(RT_ArrayBuilderHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArrayBuilder_created(_handle);
    }
  }

  /// The type of the values this [_ArrayBuilder] holds.
  _ElementType get valueType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArrayBuilder_getValueType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  /// Add a value to the [_ArrayBuilder].
  ///
  /// Parameters:
  /// - `value` — The value that is to be added.
  void add({required T value}) {
    final coreValue = _ElementExtension.fromDartValue(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArrayBuilder_add(_handle, coreValue._handle, errorHandler);
    });
  }

  /// Creates a [List] containing the values added to this [_ArrayBuilder].
  ///
  /// The order of the values in the returned [List] matches the order in which
  /// the values were added to this [_ArrayBuilder].
  ///
  /// This call empties this [_ArrayBuilder] of values, but leaves it in a valid
  /// (re-usable) state.
  ///
  /// Return Value: A [List] containing the values added to this
  /// [_ArrayBuilder].
  _Array<T> moveToArray() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArrayBuilder_moveToArray(_handle, errorHandler);
    });
    return _Array._fromHandle(objectHandle)!;
  }
}

/// The different types of array.
///
/// Each of the different supported array types. Can get the type by calling
/// [_Array.objectType].
enum _ArrayType {
  /// The default array type.
  array,

  /// The observable array type.
  arrayObservable;

  factory _ArrayType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return array;
      case 1:
        return arrayObservable;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case array:
        return 0;
      case arrayObservable:
        return 1;
    }
  }
}

/// The byte array object.
///
/// You need to pass this object to all byte array functions.
final class _ByteArray implements ffi.Finalizable {
  final RT_ByteArrayHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ByteArray_destroy.cast());

  static _ByteArray? _fromHandle(RT_ByteArrayHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ByteArray._withHandle(handle);
  }

  _ByteArray._withHandle(RT_ByteArrayHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ByteArray_created(_handle);
    }
  }

  /// The number of bytes in the byte array.
  ///
  /// Will return zero if an error occurs.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ByteArray_getSize(_handle, errorHandler);
    });
  }

  /// Returns underlying byte array.
  ///
  /// The byte array that is returned cannot be used after [Uint8List] has been
  /// destroyed. The memory is deleted.
  ///
  /// Return Value: A byte array. An empty byte array if an error occurs.
  Uint8List getBytes() {
    final byteArray = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ByteArray_getByteArray(_handle, errorHandler);
    });
    return byteArray.toDartList();
  }
}

/// An array of bytes.
///
/// Use this to pass an array of bytes.
final class _ByteArrayStruct implements ffi.Finalizable {
  final _struct = malloc<RT_ByteArray>();

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.nativeFree.cast());

  _ByteArrayStruct({required ffi.Pointer<ffi.Uint8> data, required int size}) {
    _nativeFinalizer.attach(this, _struct.cast());
    _struct.ref.data = data;
    _struct.ref.size = size;
  }

  /// Creates an instance with zero bytes.
  factory _ByteArrayStruct.empty() {
    return _ByteArrayStruct(data: ffi.nullptr, size: 0);
  }

  RT_ByteArray get ref => _struct.ref;
}

/// The client reference object.
///
/// A reference to data owned by the client SDK or extension, but whose lifetime
/// is managed by RTC.
///
/// Prior to constructing an instance of [_ClientReference], the client SDK or
/// extension must use [ArcGISEnvironment._onClientReferenceRelease] or
/// ArcGISRuntimeEnvironment.registerClientReferenceReleaseHandler(ClientReferenceReleaseHandler,
/// cpointer<void>) (respectively) to register a callback which RTC invokes to
/// indicate the client SDK or extension can release data referenced by a
/// [_ClientReference] it created.
final class _ClientReference implements ffi.Finalizable {
  final RT_ClientReferenceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ClientReference_destroy.cast());

  static _ClientReference? _fromHandle(RT_ClientReferenceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ClientReference._withHandle(handle);
  }

  _ClientReference._withHandle(RT_ClientReferenceHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClientReference_created(_handle);
    }
  }

  /// Reference to data owned by the client SDK or extension.
  ffi.Pointer<ffi.Void> get data {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientReference_getData(_handle, errorHandler);
    });
  }

  /// Create a [_ClientReference] that references data owned by the client SDK.
  ///
  /// This is equivalent to calling
  /// ClientReference.fromClientDataAndId(cpointer<void>, cpointer<void>) with a
  /// client ID of null.
  ///
  /// Parameters:
  /// - `clientData` — Reference to data owned by the client SDK.
  ///
  /// Return Value: A [_ClientReference].
  static _ClientReference fromClientData(ffi.Pointer<ffi.Void> clientData) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientReference_fromClientData(
          clientData, errorHandler);
    });
    return _ClientReference._fromHandle(objectHandle)!;
  }
}

/// The different types of colors.
///
/// Each of different supported color types. Can get the type by calling
/// [_ColorType].
enum _ColorType {
  /// RGBA color.
  rgbColor,

  /// An empty color.
  unknown;

  factory _ColorType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return rgbColor;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case rgbColor:
        return 0;
      case unknown:
        return -1;
    }
  }
}

/// An object that represents a date without the time component.
final class DateOnly implements ffi.Finalizable {
  final RT_DateOnlyHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DateOnly_destroy.cast());

  static DateOnly? _fromHandle(RT_DateOnlyHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DateOnly._withHandle(handle);
  }

  DateOnly._withHandle(RT_DateOnlyHandle handle)
      : __dateTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DateOnly_getDateTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DateOnly_created(_handle);
    }
  }

  /// Creates a new date-only object with the given date string.
  ///
  /// The provided date string must conform to the
  /// [ISO 8601 date and time format](https://www.iso.org/iso-8601-date-and-time-format.html).
  ///
  /// Parameters:
  /// - `dateString` — The ISO 8601 date string.
  factory DateOnly.withString(String dateString) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDateString = _CString(dateString);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_createWithString(
          coreDateString.bytes, errorHandler);
    });
    return DateOnly._withHandle(handle);
  }

  /// Creates a new date-only object from the provided year, month, and day.
  ///
  /// Year must be at least 1 AD, month must be a value between 1-12
  /// (inclusive), day must be a value between 1-31 (inclusive).
  ///
  /// Parameters:
  /// - `year` — The year.
  /// - `month` — The month.
  /// - `day` — The day.
  factory DateOnly.withYearMonthDay(
      {required int year, required int month, required int day}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_createWithYearMonthDay(
          year, month, day, errorHandler);
    });
    return DateOnly._withHandle(handle);
  }

  /// Gets the underlying [DateTime] representing the date (at 00:00:00).
  DateTime get _dateTime => __dateTime.value;

  final Memoized<DateTime> __dateTime;

  /// Gets the day component of the date represented by this instance.
  int get day {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_getDay(_handle, errorHandler);
    });
  }

  /// Gets the month component of the date represented by this instance.
  int get month {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_getMonth(_handle, errorHandler);
    });
  }

  /// Gets the year component of the date represented by this instance.
  int get year {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_getYear(_handle, errorHandler);
    });
  }

  /// Returns a string representing the date in ISO 8601 format, YYYY-MM-DD.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DateOnly) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_DateOnly_hash(_handle, errorHandler);
    });
  }
}

/// Defines a dictionary object.
///
/// There are a couple of performance optimizations to consider with the generic
/// collection type:
/// 1. The [_Element] object can be reused for multiple calls while
/// adding/inserting/updating values within the collection. So you can
/// instantiate one [_Element] and iteratively change its value and call
/// add/update/insert on the collection to modify the values of the collection.
/// 2. If the overhead of creating these [_Element] does become too much for a
/// specific value type, then consider subclassing the collection type and
/// provide "overloaded" methods that would accept that value type directly.
/// This would eliminate the overhead of instantiating these [_Element] objects.
final class _Dictionary<Key extends Object, Value> implements ffi.Finalizable {
  final RT_DictionaryHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Dictionary_destroy.cast());

  static _Dictionary<Key, Value>? _fromHandle<Key extends Object, Value>(
      RT_DictionaryHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Dictionary._withHandle(handle);
  }

  _Dictionary._withHandle(RT_DictionaryHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Dictionary_created(_handle);
    }
  }

  /// Creates a dictionary. This allocates memory that must be deleted.
  ///
  /// Parameters:
  /// - `keyType` — The type of the dictionary's key.
  /// - `valueType` — The type of the dictionary's value.
  factory _Dictionary(
      {required _ElementType keyType, required _ElementType valueType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_create(
          keyType.coreValue, valueType.coreValue, errorHandler);
    });
    return _Dictionary._withHandle(handle);
  }

  /// The type of the keys this dictionary holds.
  _ElementType get keyType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_getKeyType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  /// An array containing all the keys in the dictionary.
  List<Key> get keys {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_getKeys(_handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Determines the number of values in the dictionary.
  ///
  /// The number of values in the dictionary. If an error occurs a 0 will be
  /// returned.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_getSize(_handle, errorHandler);
    });
  }

  /// The type of the values this dictionary holds.
  _ElementType get valueType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_getValueType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  /// Get a value for a specific key.
  ///
  /// Retrieves the value for the specified key.
  ///
  /// Parameters:
  /// - `key` — The key which you want to get the value.
  ///
  /// Return Value: The value for the key requested. A null if an error occurs
  /// or the key doesn't exist.
  Value? at({required Key key}) {
    final coreKey = _ElementExtension.fromDartValue(key);
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_at(
          _handle, coreKey._handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Does the dictionary contain a key.
  ///
  /// Does the dictionary contain a specific key.
  ///
  /// Parameters:
  /// - `key` — The key you want to find.
  ///
  /// Return Value: True if the key is in the dictionary otherwise false.
  bool contains({required Key key}) {
    final coreKey = _ElementExtension.fromDartValue(key);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_contains(
          _handle, coreKey._handle, errorHandler);
    });
  }

  /// Insert a value for a given key in the dictionary.
  ///
  /// Insert a value at a specified key position to the dictionary.
  ///
  /// Parameters:
  /// - `key` — The key position which you want to insert the value.
  /// - `value` — The value that is to be added.
  void insert({required Key key, required Value value}) {
    final keyElement = _ElementExtension.fromDartValue(key);
    final valueElement =
        _ElementExtension.fromDartValue(value, expectedType: typeFor(key));
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Dictionary_insert(
          _handle, keyElement._handle, valueElement._handle, errorHandler);
    });
  }

  /// Determines if there are any values in the dictionary.
  ///
  /// Check if the dictionary object has any values in it.
  ///
  /// Return Value: true if the dictionary object contains no values otherwise
  /// false. Will return true if an error occurs.
  bool isEmpty() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_isEmpty(_handle, errorHandler);
    });
  }

  /// Remove a value at a specific key position in the dictionary.
  ///
  /// Remove a value at a specific position in the dictionary.
  ///
  /// Parameters:
  /// - `key` — The key position which you want to remove the value.
  void remove({required Key key}) {
    final coreKey = _ElementExtension.fromDartValue(key);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Dictionary_remove(_handle, coreKey._handle, errorHandler);
    });
  }

  /// Remove all values from the dictionary.
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Dictionary_removeAll(_handle, errorHandler);
    });
  }

  /// Replace a value at a specific key position in the dictionary.
  ///
  /// Parameters:
  /// - `key` — The key position which you want to replace the value.
  /// - `newValue` — The new value.
  void replace({required Key key, required Value newValue}) {
    final coreKey = _ElementExtension.fromDartValue(key);
    final coreNewValue = _ElementExtension.fromDartValue(newValue);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Dictionary_replace(
          _handle, coreKey._handle, coreNewValue._handle, errorHandler);
    });
  }

  /// Returns the type that the value of a given key should be, if the
  /// dictionary instance supports it. Otherwise, [dynamic] will be returned.
  ///
  /// Parameters:
  /// - `key` — The key you want to now the value type for.
  ///
  /// Return Value: An [_ElementType] value, or [dynamic] if an error occurs or
  /// the dictionary does not support the type lookup.
  _ElementType typeFor(Key key) {
    final coreKey = _ElementExtension.fromDartValue(key);
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Dictionary_getTypeForKey(
          _handle, coreKey._handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }
}

/// Defines an element that can be added to a container object.
final class _Element implements ffi.Finalizable {
  final RT_ElementHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Element_destroy.cast());

  static _Element? _fromHandle(RT_ElementHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Element._withHandle(handle);
  }

  _ElementType get _objectType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getObjectType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  _Element._withHandle(RT_ElementHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Element_created(_handle);
    }
  }

  /// Creates an empty, unknown element type.
  factory _Element() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_create(errorHandler);
    });
    return _Element._withHandle(handle);
  }

  /// Removes the value from the element and sets the type to
  /// [_ElementType.none].
  void clear() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_clear(_handle, errorHandler);
    });
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromArcGISMap(ArcGISMap value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromMap(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an ArcGIS credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromArcGisCredential(ArcGISCredential value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromArcGISCredential(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an arcgis feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromArcGisFeatureTable(ArcGISFeatureTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromArcGISFeatureTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an ArcGIS sublayer.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromArcGisSublayer(ArcGISSublayer value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromArcGISSublayer(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an ArcGIS token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromArcGisTokenInfo(_ArcGISTokenInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromArcGISTokenInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an array value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromArray(List<Object> value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = value.toArray(valueType: _ElementType.variant);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromArray(coreValue._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a geodatabase attachment.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromAttachment(Attachment value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromAttachment(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an attribute parameter value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromAttributeParameterValue(AttributeParameterValue value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromAttributeParameterValue(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a [BasemapStyleLanguageStrategy].
  ///
  /// Parameters:
  /// - `value` — The value
  ///
  /// Return Value: An [_Element].
  static _Element fromBasemapStyleLanguageStrategy(
      BasemapStyleLanguageStrategy value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromBasemapStyleLanguageStrategy(
          value.coreValue, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a bookmark.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromBookmark(Bookmark value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromBookmark(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an boolean value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromBool(bool value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromBool(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a memory buffer.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromBuffer(Uint8List value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = value.toByteArrayWrapper();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromBuffer(coreValue.ref, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a class break.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClassBreak(ClassBreak value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClassBreak(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a client reference.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClientReference(_ClientReference value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClientReference(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a client response.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClientResponse(_ClientResponse value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClientResponse(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a closest facility parameters.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClosestFacilityParameters(
      ClosestFacilityParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClosestFacilityParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a closest facility result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClosestFacilityResult(ClosestFacilityResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClosestFacilityResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a closest facility route.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromClosestFacilityRoute(ClosestFacilityRoute value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromClosestFacilityRoute(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromCodedValue(CodedValue value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromCodedValue(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromCodedValueDescription(CodedValueDescription value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromCodedValueDescription(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a color value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromColor(Color value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = value.toArcGIS();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromColor(coreValue._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a polygon barrier.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromCostAttribute(CostAttribute value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromCostAttribute(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a date only value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDateOnly(DateOnly value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDateOnly(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a date time value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDateTime(DateTime value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = value.toArcGIS();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDateTime(
          coreValue._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [DatumTransformation] instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  ///
  /// Return Value: An [_Element].
  static _Element fromDatumTransformation(DatumTransformation value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDatumTransformation(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a dictionary value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDictionary(Map<dynamic, dynamic> value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = value.toDictionary(
        keyType: _ElementType.variant, valueType: _ElementType.variant);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDictionary(
          coreValue._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a direction event.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDirectionEvent(DirectionEvent value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDirectionEvent(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a direction maneuver.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDirectionManeuver(DirectionManeuver value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDirectionManeuver(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a direction string.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDirectionMessage(DirectionMessage value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDirectionMessage(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a display filter.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDisplayFilter(DisplayFilter value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDisplayFilter(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDomain(Domain value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDomain(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [DownloadPreplannedOfflineMapParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromDownloadPreplannedOfflineMapParameters(
      DownloadPreplannedOfflineMapParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromDownloadPreplannedOfflineMapParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an edit result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromEditResult(EditResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromEditResult(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an error.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromError(ArcGISException value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromError(
          value._error?._handle ?? ffi.nullptr, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromEstimateTileCacheSizeResult(
      EstimateTileCacheSizeResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromEstimateTileCacheSizeResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromExportTileCacheParameters(
      ExportTileCacheParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromExportTileCacheParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromExportVectorTilesParameters(
      ExportVectorTilesParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromExportVectorTilesParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an extension license value.
  ///
  /// Parameters:
  /// - `value` — The extension license value.
  ///
  /// Return Value: An [_Element]
  static _Element fromExtensionLicense(ExtensionLicense value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromExtensionLicense(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a closest facility.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFacility(Facility value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFacility(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a feature.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeature(Feature value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeature(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a feature collection table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureCollectionTable(FeatureCollectionTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureCollectionTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an feature edit result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureEditResult(FeatureEditResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureEditResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a feature query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureQueryResult(FeatureQueryResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureQueryResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureSubtype(FeatureSubtype value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureSubtype(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureTable(FeatureTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureTemplate(FeatureTemplate value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureTemplate(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFeatureType(FeatureType value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFeatureType(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromField(Field value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromField(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element with the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFieldDescription(FieldDescription value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFieldDescription(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a float32 value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFloat32(double value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFloat32(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a float64 value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromFloat64(double value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromFloat64(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [GenerateGeodatabaseParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element] containing a [GenerateGeodatabaseParameters].
  static _Element fromGenerateGeodatabaseParameters(
      GenerateGeodatabaseParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGenerateGeodatabaseParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a generate layer option.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGenerateLayerOption(GenerateLayerOption value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGenerateLayerOption(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [GenerateOfflineMapParameterOverrides].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGenerateOfflineMapParameterOverrides(
      GenerateOfflineMapParameterOverrides value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGenerateOfflineMapParameterOverrides(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [GenerateOfflineMapParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGenerateOfflineMapParameters(
      GenerateOfflineMapParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGenerateOfflineMapParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a GeoPackage feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeoPackageFeatureTable(GeoPackageFeatureTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeoPackageFeatureTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a geocode result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeocodeResult(GeocodeResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeocodeResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a geodatabase.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeodatabase(Geodatabase value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeodatabase(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a geodatabase delta info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeodatabaseDeltaInfo(GeodatabaseDeltaInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeodatabaseDeltaInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a geodatabase feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeodatabaseFeatureTable(GeodatabaseFeatureTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeodatabaseFeatureTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [GeographicTransformationStep] instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  ///
  /// Return Value: An [_Element].
  static _Element fromGeographicTransformationStep(
      GeographicTransformationStep value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeographicTransformationStep(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a geometry value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromGeometry(Geometry value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGeometry(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a graphic.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGraphic(Graphic value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGraphic(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a graphics overlay.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromGraphicsOverlay(GraphicsOverlay value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGraphicsOverlay(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a GUID value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromGuid(Guid value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromGUID(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [HorizontalVerticalTransformationStep] instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  ///
  /// Return Value: An [_Element].
  static _Element fromHorizontalVerticalTransformationStep(
      HorizontalVerticalTransformationStep value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromHorizontalVerticalTransformationStep(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an [IdInfo].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromIdInfo(IdInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromIdInfo(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an identify result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromIdentifyGraphicsOverlayResult(
      IdentifyGraphicsOverlayResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromIdentifyGraphicsOverlayResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an identify result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromIdentifyLayerResult(IdentifyLayerResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromIdentifyLayerResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an image object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromImage(ArcGISImage value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromImage(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an incident.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromIncident(Incident value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromIncident(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an int16_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromInt16(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromInt16(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an int32_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromInt32(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromInt32(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an int64_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromInt64(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromInt64(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an int8_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromInt8(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromInt8(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromItemResourceCache(ItemResourceCache value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromItemResourceCache(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a job message value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromJobMessage(JobMessage value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromJobMessage(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a layer.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLayer(Layer value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLayer(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a legend info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLegendInfo(LegendInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLegendInfo(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a level of detail.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLevelOfDetail(LevelOfDetail value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLevelOfDetail(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a [LicenseInfo].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLicenseInfo(LicenseInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLicenseInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a local feature edit.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLocalFeatureEdit(LocalFeatureEdit value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLocalFeatureEdit(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an [_Element] from an [ArcGISLocation].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLocation(ArcGISLocation value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLocation(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a locator attribute.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromLocatorAttribute(LocatorAttribute value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromLocatorAttribute(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromMapServiceImageFormat(MapServiceImageFormat value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromMapServiceImageFormat(
          value.coreValue, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an OAuth application credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOAuthApplicationCredential(
      OAuthApplicationCredential value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOAuthApplicationCredential(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an OAuth application token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOAuthApplicationTokenInfo(
      OAuthApplicationTokenInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOAuthApplicationTokenInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an OAuth user credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOAuthUserCredential(OAuthUserCredential value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOAuthUserCredential(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from an OAuth user token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOAuthUserTokenInfo(OAuthUserTokenInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOAuthUserTokenInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineCapability].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineCapability(OfflineCapability value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineCapability(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineMapCapabilities].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineMapCapabilities(OfflineMapCapabilities value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineMapCapabilities(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineMapParametersKey].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineMapParametersKey(OfflineMapParametersKey value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineMapParametersKey(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineMapSyncLayerResult].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineMapSyncLayerResult(
      OfflineMapSyncLayerResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineMapSyncLayerResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineMapSyncParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineMapSyncParameters(OfflineMapSyncParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineMapSyncParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OfflineMapUpdatesInfo].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOfflineMapUpdatesInfo(OfflineMapUpdatesInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOfflineMapUpdatesInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an [OrderBy].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromOrderBy(OrderBy value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromOrderBy(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a point barrier.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPointBarrier(PointBarrier value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPointBarrier(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a polygon barrier.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPolygonBarrier(PolygonBarrier value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPolygonBarrier(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a polyline barrier.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPolylineBarrier(PolylineBarrier value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPolylineBarrier(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [Portal].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPortal(Portal value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPortal(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [PortalItem].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPortalItem(PortalItem value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPortalItem(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [PreplannedMapArea].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromPreplannedMapArea(PreplannedMapArea value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromPreplannedMapArea(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [QueryParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element] containing a [QueryParameters].
  static _Element fromQueryParameters(QueryParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromQueryParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a related feature query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRelatedFeatureQueryResult(
      RelatedFeatureQueryResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRelatedFeatureQueryResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a relationship constraint violation value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRelationshipConstraintViolation(
      RelationshipConstraintViolationType value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRelationshipConstraintViolation(
          value.coreValue, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromRelationshipInfo(RelationshipInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRelationshipInfo(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a request attachment.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRequestAttachment(_RequestAttachment value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRequestAttachment(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a polygon barrier.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRestrictionAttribute(RestrictionAttribute value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRestrictionAttribute(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a route.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRoute(Route value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRoute(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a route parameters.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRouteParameters(RouteParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRouteParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a route result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromRouteResult(RouteResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromRouteResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a scale range display filter.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromScaleRangeDisplayFilter(ScaleRangeDisplayFilter value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromScaleRangeDisplayFilter(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a service area facility.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceAreaFacility(ServiceAreaFacility value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceAreaFacility(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a service area parameters.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceAreaParameters(ServiceAreaParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceAreaParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a service area polygon.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceAreaPolygon(ServiceAreaPolygon value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceAreaPolygon(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a service area polyline.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceAreaPolyline(ServiceAreaPolyline value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceAreaPolyline(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a service area result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceAreaResult(ServiceAreaResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceAreaResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from an service feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromServiceFeatureTable(ServiceFeatureTable value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromServiceFeatureTable(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromSpatialReference(SpatialReference value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSpatialReference(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [StatisticDefinition].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromStatisticDefinition(StatisticDefinition value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromStatisticDefinition(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a statistic record value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromStatisticRecord(StatisticRecord value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromStatisticRecord(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [StatisticsQueryParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element] containing a [QueryParameters].
  static _Element fromStatisticsQueryParameters(
      StatisticsQueryParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromStatisticsQueryParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a statistics query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromStatisticsQueryResult(StatisticsQueryResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromStatisticsQueryResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a stop.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromStop(Stop value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromStop(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a string value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromString(String value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = _CString(value);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromString(coreValue.bytes, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a suggest result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromSuggestResult(SuggestResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSuggestResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a symbol.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromSymbol(ArcGISSymbol value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSymbol(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a [SyncGeodatabaseParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element] containing a [SyncGeodatabaseParameters].
  static _Element fromSyncGeodatabaseParameters(
      SyncGeodatabaseParameters value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSyncGeodatabaseParameters(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a sync layer option.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromSyncLayerOption(SyncLayerOption value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSyncLayerOption(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a sync layer result.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromSyncLayerResult(SyncLayerResult value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromSyncLayerResult(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromTileCache(TileCache value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTileCache(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromTileImageFormat(TileImageFormat value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTileImageFormat(
          value.coreValue, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a time only value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTimeOnly(TimeOnly value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTimeOnly(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a timestamp offset value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTimestampOffset(TimestampOffset value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTimestampOffset(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a token credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTokenCredential(TokenCredential value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTokenCredential(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTokenInfo(TokenInfo value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTokenInfo(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a transportation network dataset.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTransportationNetworkDataset(
      TransportationNetworkDataset value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTransportationNetworkDataset(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a travel mode.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromTravelMode(TravelMode value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromTravelMode(value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a uint16_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromUInt16(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromUInt16(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a uint32_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromUInt32(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromUInt32(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a uint64_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromUInt64(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromUInt64(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element from a uint8_t value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element]
  static _Element fromUInt8(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromUInt8(value, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element object from a unique value.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: An [_Element].
  static _Element fromUniqueValue(UniqueValue value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromUniqueValue(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Creates an element containing the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  ///
  /// Return Value: element The element.
  static _Element fromVectorTileCache(VectorTileCache value) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_fromVectorTileCache(
          value._handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Returns the element's value as an ArcGIS credential.
  ///
  /// Return Value: An [ArcGISCredential].
  ArcGISCredential? getValueAsArcGISCredential() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArcGISCredential(
          _handle, errorHandler);
    });
    return ArcGISCredential._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [ArcGISException].
  ArcGISException? getValueAsArcGISException() {
    final errorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsError(_handle, errorHandler);
    });
    return errorHandle.toArcGISException();
  }

  /// Gets the value of an element as an arcgis feature.
  ///
  /// Return Value: An [ArcGISFeature].
  ArcGISFeature? getValueAsArcGISFeature() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArcGISFeature(
          _handle, errorHandler);
    });
    return ArcGISFeature._fromHandle(objectHandle);
  }

  /// Gets the value of an element as an arcgis feature table.
  ///
  /// Return Value: An [ArcGISFeatureTable].
  ArcGISFeatureTable? getValueAsArcGISFeatureTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArcGISFeatureTable(
          _handle, errorHandler);
    });
    return ArcGISFeatureTable._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An image object.
  ArcGISImage? getValueAsArcGISImage() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsImage(_handle, errorHandler);
    });
    return ArcGISImage._fromHandle(objectHandle);
  }

  /// Gets the element's value as an [ArcGISLocation].
  ///
  /// Return Value: An [ArcGISLocation].
  ArcGISLocation? getValueAsArcGISLocation() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLocation(_handle, errorHandler);
    });
    return ArcGISLocation._fromHandle(objectHandle);
  }

  /// Returns the element's value as a map.
  ///
  /// Return Value: An [ArcGISMap].
  ArcGISMap? getValueAsArcGISMap() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsMap(_handle, errorHandler);
    });
    return ArcGISMap._fromHandle(objectHandle);
  }

  /// Returns the element's value as a sublayer.
  ///
  /// Return Value: An [ArcGISSublayer].
  ArcGISSublayer? getValueAsArcGISSublayer() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArcGISSublayer(
          _handle, errorHandler);
    });
    return ArcGISSublayer._fromHandle(objectHandle);
  }

  /// Returns the element's value as a symbol.
  ///
  /// Return Value: An [ArcGISSymbol].
  ArcGISSymbol? getValueAsArcGISSymbol() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSymbol(_handle, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle);
  }

  /// Returns the element's value as an ArcGIS token info.
  ///
  /// Return Value: An [_ArcGISTokenInfo].
  _ArcGISTokenInfo? getValueAsArcGISTokenInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArcGISTokenInfo(
          _handle, errorHandler);
    });
    return _ArcGISTokenInfo._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [Attachment].
  Attachment? getValueAsAttachment() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsAttachment(_handle, errorHandler);
    });
    return Attachment._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [AttributeParameterValue].
  AttributeParameterValue? getValueAsAttributeParameterValue() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsAttributeParameterValue(
          _handle, errorHandler);
    });
    return AttributeParameterValue._fromHandle(objectHandle);
  }

  /// Returns the elements value as a BasemapStyleLanguageStrategy.
  ///
  /// Return Value: a [BasemapStyleLanguageStrategy].
  BasemapStyleLanguageStrategy? getValueAsBasemapStyleLanguageStrategy() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsBasemapStyleLanguageStrategy(
          _handle, errorHandler);
    });
    return BasemapStyleLanguageStrategy._fromCoreValue(coreValue);
  }

  /// Returns the element's value as a bookmark.
  ///
  /// Return Value: A [Bookmark].
  Bookmark? getValueAsBookmark() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsBookmark(_handle, errorHandler);
    });
    return Bookmark._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An boolean. Returns false if an error occurs.
  bool? getValueAsBool() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsBool(_handle, errorHandler);
    });
  }

  /// Returns the element's value as a class break.
  ///
  /// Return Value: A [ClassBreak].
  ClassBreak? getValueAsClassBreak() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClassBreak(_handle, errorHandler);
    });
    return ClassBreak._fromHandle(objectHandle);
  }

  /// Returns the element's value as a client reference.
  ///
  /// Return Value: A [_ClientReference].
  _ClientReference? getValueAsClientReference() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClientReference(
          _handle, errorHandler);
    });
    return _ClientReference._fromHandle(objectHandle);
  }

  /// Returns the element's value as a client response.
  ///
  /// Return Value: A [_ClientResponse].
  _ClientResponse? getValueAsClientResponse() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClientResponse(
          _handle, errorHandler);
    });
    return _ClientResponse._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [ClosestFacilityParameters].
  ClosestFacilityParameters? getValueAsClosestFacilityParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClosestFacilityParameters(
          _handle, errorHandler);
    });
    return ClosestFacilityParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [ClosestFacilityResult].
  ClosestFacilityResult? getValueAsClosestFacilityResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClosestFacilityResult(
          _handle, errorHandler);
    });
    return ClosestFacilityResult._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [ClosestFacilityRoute].
  ClosestFacilityRoute? getValueAsClosestFacilityRoute() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsClosestFacilityRoute(
          _handle, errorHandler);
    });
    return ClosestFacilityRoute._fromHandle(objectHandle);
  }

  /// Returns the element as a coded value.
  ///
  /// If the value stored in the element is not a coded value, an exception will
  /// be thrown.
  ///
  /// Return Value: A [CodedValue].
  CodedValue? getValueAsCodedValue() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsCodedValue(_handle, errorHandler);
    });
    return CodedValue._fromHandle(objectHandle);
  }

  /// Returns the element as a coded value description.
  ///
  /// If the value stored in the element is not a coded value description, an
  /// exception will be thrown.
  ///
  /// Return Value: A [CodedValueDescription].
  CodedValueDescription? getValueAsCodedValueDescription() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsCodedValueDescription(
          _handle, errorHandler);
    });
    return CodedValueDescription._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Color].
  Color? getValueAsColor() {
    final colorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsColor(_handle, errorHandler);
    });
    return colorHandle.toColor();
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [CostAttribute].
  CostAttribute? getValueAsCostAttribute() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsCostAttribute(
          _handle, errorHandler);
    });
    return CostAttribute._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DateOnly].
  DateOnly? getValueAsDateOnly() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDateOnly(_handle, errorHandler);
    });
    return DateOnly._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DateTime].
  DateTime? getValueAsDateTime() {
    final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDateTime(_handle, errorHandler);
    });
    return dateTimeHandle.toDateTime();
  }

  /// Gets the value of the element as a [DatumTransformation].
  ///
  /// Return Value: A [DatumTransformation].
  DatumTransformation? getValueAsDatumTransformation() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDatumTransformation(
          _handle, errorHandler);
    });
    return DatumTransformation._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DirectionEvent].
  DirectionEvent? getValueAsDirectionEvent() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDirectionEvent(
          _handle, errorHandler);
    });
    return DirectionEvent._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DirectionManeuver].
  DirectionManeuver? getValueAsDirectionManeuver() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDirectionManeuver(
          _handle, errorHandler);
    });
    return DirectionManeuver._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DirectionMessage].
  DirectionMessage? getValueAsDirectionMessage() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDirectionMessage(
          _handle, errorHandler);
    });
    return DirectionMessage._fromHandle(objectHandle);
  }

  /// Returns the element's value as an display filter.
  ///
  /// Return Value: A [DisplayFilter]
  DisplayFilter? getValueAsDisplayFilter() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDisplayFilter(
          _handle, errorHandler);
    });
    return DisplayFilter._fromHandle(objectHandle);
  }

  /// Returns the element as a domain.
  ///
  /// If the value stored in the element is not a domain type, an exception will
  /// be thrown.
  ///
  /// Return Value: A [Domain].
  Domain? getValueAsDomain() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDomain(_handle, errorHandler);
    });
    return Domain._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [DownloadPreplannedOfflineMapParameters].
  DownloadPreplannedOfflineMapParameters?
      getValueAsDownloadPreplannedOfflineMapParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_Element_getValueAsDownloadPreplannedOfflineMapParameters(
              _handle, errorHandler);
    });
    return DownloadPreplannedOfflineMapParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [EditResult].
  EditResult? getValueAsEditResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsEditResult(_handle, errorHandler);
    });
    return EditResult._fromHandle(objectHandle);
  }

  /// Returns the element as an export tile cache size estimate.
  ///
  /// If the value stored in the element is not an export tile cache size
  /// estimate, an exception will be thrown.
  ///
  /// Return Value: An [EstimateTileCacheSizeResult].
  EstimateTileCacheSizeResult? getValueAsEstimateTileCacheSizeResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsEstimateTileCacheSizeResult(
          _handle, errorHandler);
    });
    return EstimateTileCacheSizeResult._fromHandle(objectHandle);
  }

  /// Returns the element as an [ExportTileCacheParameters].
  ///
  /// If the value stored in the element is not an [ExportTileCacheParameters],
  /// an exception will be thrown.
  ///
  /// Return Value: An [ExportTileCacheParameters].
  ExportTileCacheParameters? getValueAsExportTileCacheParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsExportTileCacheParameters(
          _handle, errorHandler);
    });
    return ExportTileCacheParameters._fromHandle(objectHandle);
  }

  /// Returns the element as an [ExportVectorTilesParameters].
  ///
  /// If the value stored in the element is not an [ExportTileCacheParameters],
  /// an exception will be thrown.
  ///
  /// Return Value: the parameters object.
  ExportVectorTilesParameters? getValueAsExportVectorTilesParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsExportVectorTilesParameters(
          _handle, errorHandler);
    });
    return ExportVectorTilesParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [ExtensionLicense].
  ExtensionLicense? getValueAsExtensionLicense() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsExtensionLicense(
          _handle, errorHandler);
    });
    return ExtensionLicense._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Facility].
  Facility? getValueAsFacility() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFacility(_handle, errorHandler);
    });
    return Facility._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a feature.
  ///
  /// Return Value: A [Feature].
  Feature? getValueAsFeature() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeature(_handle, errorHandler);
    });
    return Feature._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a feature collection table.
  ///
  /// Return Value: A [FeatureCollectionTable].
  FeatureCollectionTable? getValueAsFeatureCollectionTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureCollectionTable(
          _handle, errorHandler);
    });
    return FeatureCollectionTable._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [FeatureEditResult].
  FeatureEditResult? getValueAsFeatureEditResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureEditResult(
          _handle, errorHandler);
    });
    return FeatureEditResult._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a feature query result.
  ///
  /// Return Value: A [FeatureQueryResult].
  FeatureQueryResult? getValueAsFeatureQueryResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureQueryResult(
          _handle, errorHandler);
    });
    return FeatureQueryResult._fromHandle(objectHandle);
  }

  /// Returns the element as a feature subtype.
  ///
  /// If the value stored in the element is not a feature subtype, an exception
  /// will be thrown.
  ///
  /// Return Value: A [FeatureSubtype].
  FeatureSubtype? getValueAsFeatureSubtype() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureSubtype(
          _handle, errorHandler);
    });
    return FeatureSubtype._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a feature table.
  ///
  /// Return Value: A [FeatureTable].
  FeatureTable? getValueAsFeatureTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureTable(
          _handle, errorHandler);
    });
    return FeatureTable._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [FeatureTableEditResult].
  FeatureTableEditResult? getValueAsFeatureTableEditResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureTableEditResult(
          _handle, errorHandler);
    });
    return FeatureTableEditResult._fromHandle(objectHandle);
  }

  /// Returns the element as a feature template.
  ///
  /// If the value stored in the element is not a feature template, an exception
  /// will be thrown.
  ///
  /// Return Value: A [FeatureTemplate].
  FeatureTemplate? getValueAsFeatureTemplate() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureTemplate(
          _handle, errorHandler);
    });
    return FeatureTemplate._fromHandle(objectHandle);
  }

  /// Returns the element as a feature type.
  ///
  /// If the value stored in the element is not a feature type, an exception
  /// will be thrown.
  ///
  /// Return Value: A [FeatureType].
  FeatureType? getValueAsFeatureType() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFeatureType(
          _handle, errorHandler);
    });
    return FeatureType._fromHandle(objectHandle);
  }

  /// Returns the element as a field.
  ///
  /// If the value stored in the element is not a field, an exception will be
  /// thrown.
  ///
  /// Return Value: A [Field].
  Field? getValueAsField() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsField(_handle, errorHandler);
    });
    return Field._fromHandle(objectHandle);
  }

  /// Returns the element as a field description.
  ///
  /// If the value stored in the element is not a field description, an
  /// exception will be thrown.
  ///
  /// Return Value: A [FieldDescription].
  FieldDescription? getValueAsFieldDescription() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFieldDescription(
          _handle, errorHandler);
    });
    return FieldDescription._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An float32.
  double? getValueAsFloat32() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFloat32(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An float64.
  double? getValueAsFloat64() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsFloat64(_handle, errorHandler);
    });
  }

  /// Gets the value of an element as a [GenerateGeodatabaseParameters].
  ///
  /// Return Value: A [GenerateGeodatabaseParameters].
  GenerateGeodatabaseParameters? getValueAsGenerateGeodatabaseParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGenerateGeodatabaseParameters(
          _handle, errorHandler);
    });
    return GenerateGeodatabaseParameters._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a generate layer option.
  ///
  /// Return Value: A [GenerateLayerOption].
  GenerateLayerOption? getValueAsGenerateLayerOption() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGenerateLayerOption(
          _handle, errorHandler);
    });
    return GenerateLayerOption._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [GenerateOfflineMapParameterOverrides].
  GenerateOfflineMapParameterOverrides?
      getValueAsGenerateOfflineMapParameterOverrides() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_Element_getValueAsGenerateOfflineMapParameterOverrides(
              _handle, errorHandler);
    });
    return GenerateOfflineMapParameterOverrides._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [GenerateOfflineMapParameters].
  GenerateOfflineMapParameters? getValueAsGenerateOfflineMapParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGenerateOfflineMapParameters(
          _handle, errorHandler);
    });
    return GenerateOfflineMapParameters._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a GeoPackage feature table.
  ///
  /// Return Value: A [GeoPackageFeatureTable].
  GeoPackageFeatureTable? getValueAsGeoPackageFeatureTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeoPackageFeatureTable(
          _handle, errorHandler);
    });
    return GeoPackageFeatureTable._fromHandle(objectHandle);
  }

  /// Returns the element's value as a geocode result.
  ///
  /// Return Value: A [GeocodeResult].
  GeocodeResult? getValueAsGeocodeResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeocodeResult(
          _handle, errorHandler);
    });
    return GeocodeResult._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a geodatabase.
  ///
  /// Return Value: A [Geodatabase].
  Geodatabase? getValueAsGeodatabase() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeodatabase(
          _handle, errorHandler);
    });
    return Geodatabase._fromHandle(objectHandle);
  }

  /// Returns the element's value as a geodatabase delta info.
  ///
  /// Return Value: A [GeodatabaseDeltaInfo].
  GeodatabaseDeltaInfo? getValueAsGeodatabaseDeltaInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeodatabaseDeltaInfo(
          _handle, errorHandler);
    });
    return GeodatabaseDeltaInfo._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a geodatabase feature table.
  ///
  /// Return Value: A [GeodatabaseFeatureTable].
  GeodatabaseFeatureTable? getValueAsGeodatabaseFeatureTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeodatabaseFeatureTable(
          _handle, errorHandler);
    });
    return GeodatabaseFeatureTable._fromHandle(objectHandle);
  }

  /// Gets the value of the element as a [GeographicTransformationStep].
  ///
  /// Return Value: A [GeographicTransformationStep].
  GeographicTransformationStep? getValueAsGeographicTransformationStep() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeographicTransformationStep(
          _handle, errorHandler);
    });
    return GeographicTransformationStep._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Geometry].
  Geometry? getValueAsGeometry() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  /// Returns the element's value as a graphic.
  ///
  /// Return Value: A [Bookmark].
  Graphic? getValueAsGraphic() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGraphic(_handle, errorHandler);
    });
    return Graphic._fromHandle(objectHandle);
  }

  /// Returns the element's value as a graphics overlay.
  ///
  /// Return Value: A [GraphicsOverlay].
  GraphicsOverlay? getValueAsGraphicsOverlay() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGraphicsOverlay(
          _handle, errorHandler);
    });
    return GraphicsOverlay._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Guid].
  Guid? getValueAsGuid() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsGUID(_handle, errorHandler);
    });
    return Guid._fromHandle(objectHandle);
  }

  /// Gets the value of the element as a [HorizontalVerticalTransformationStep].
  ///
  /// Return Value: A [HorizontalVerticalTransformationStep].
  HorizontalVerticalTransformationStep?
      getValueAsHorizontalVerticalTransformationStep() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_Element_getValueAsHorizontalVerticalTransformationStep(
              _handle, errorHandler);
    });
    return HorizontalVerticalTransformationStep._fromHandle(objectHandle);
  }

  /// Returns the element as an id info.
  ///
  /// If the value stored in the element is not an id info, an exception will be
  /// thrown.
  ///
  /// Return Value: An [IdInfo].
  IdInfo? getValueAsIdInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsIdInfo(_handle, errorHandler);
    });
    return IdInfo._fromHandle(objectHandle);
  }

  /// Returns the element's value as an identify result.
  ///
  /// Return Value: An [IdentifyGraphicsOverlayResult].
  IdentifyGraphicsOverlayResult? getValueAsIdentifyGraphicsOverlayResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsIdentifyGraphicsOverlayResult(
          _handle, errorHandler);
    });
    return IdentifyGraphicsOverlayResult._fromHandle(objectHandle);
  }

  /// Returns the element's value as an identify result.
  ///
  /// Return Value: An [IdentifyLayerResult].
  IdentifyLayerResult? getValueAsIdentifyLayerResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsIdentifyLayerResult(
          _handle, errorHandler);
    });
    return IdentifyLayerResult._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [Incident].
  Incident? getValueAsIncident() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsIncident(_handle, errorHandler);
    });
    return Incident._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An int16_t.
  int? getValueAsInt16() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsInt16(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An int32_t.
  int? getValueAsInt32() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsInt32(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An int64_t.
  int? getValueAsInt64() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsInt64(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An int8_t.
  int? getValueAsInt8() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsInt8(_handle, errorHandler);
    });
  }

  /// Returns the element's value as an item resource cache.
  ///
  /// Return Value: An [ItemResourceCache].
  ItemResourceCache? getValueAsItemResourceCache() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsItemResourceCache(
          _handle, errorHandler);
    });
    return ItemResourceCache._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Job].
  Job<T>? getValueAsJob<T>() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsJob(_handle, errorHandler);
    });
    return Job._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [JobMessage].
  JobMessage? getValueAsJobMessage() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsJobMessage(_handle, errorHandler);
    });
    return JobMessage._fromHandle(objectHandle);
  }

  /// Returns the element's value as a layer.
  ///
  /// Return Value: A [Layer].
  Layer? getValueAsLayer() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLayer(_handle, errorHandler);
    });
    return Layer._fromHandle(objectHandle);
  }

  /// Returns the element as a legend info.
  ///
  /// If the value stored in the element is not a legend info, an exception will
  /// be thrown.
  ///
  /// Return Value: A [LegendInfo].
  LegendInfo? getValueAsLegendInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLegendInfo(_handle, errorHandler);
    });
    return LegendInfo._fromHandle(objectHandle);
  }

  /// Returns the element as a level of detail.
  ///
  /// If the value stored in the element is not a level of detail, an exception
  /// will be thrown.
  ///
  /// Return Value: A [LevelOfDetail].
  LevelOfDetail? getValueAsLevelOfDetail() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLevelOfDetail(
          _handle, errorHandler);
    });
    return LevelOfDetail._fromHandle(objectHandle);
  }

  /// Returns the element as a [LicenseInfo].
  ///
  /// If the value stored in the element is not a [LicenseInfo], an exception
  /// will be thrown.
  ///
  /// Return Value: A [LicenseInfo].
  LicenseInfo? getValueAsLicenseInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLicenseInfo(
          _handle, errorHandler);
    });
    return LicenseInfo._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [LicenseStatus].
  LicenseStatus? getValueAsLicenseStatus() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLicenseStatus(
          _handle, errorHandler);
    });
    return LicenseStatus._fromCoreValue(coreValue);
  }

  /// Gets the element value as an array.
  ///
  /// Return Value: A [List].
  List<T>? getValueAsList<T extends Object>() {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsArray(_handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [LocalFeatureEdit].
  LocalFeatureEdit? getValueAsLocalFeatureEdit() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLocalFeatureEdit(
          _handle, errorHandler);
    });
    return LocalFeatureEdit._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [LocalFeatureEditsResult].
  LocalFeatureEditsResult? getValueAsLocalFeatureEditsResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLocalFeatureEditsResult(
          _handle, errorHandler);
    });
    return LocalFeatureEditsResult._fromHandle(objectHandle);
  }

  /// Returns the element's value as a locator attribute.
  ///
  /// Return Value: A [LocatorAttribute].
  LocatorAttribute? getValueAsLocatorAttribute() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsLocatorAttribute(
          _handle, errorHandler);
    });
    return LocatorAttribute._fromHandle(objectHandle);
  }

  /// Gets the element value as a dictionary.
  ///
  /// Return Value: A [Map].
  Map<K, V>? getValueAsMap<K extends Object, V>() {
    final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsDictionary(_handle, errorHandler);
    });
    return dictionaryHandle.toUnmodifiableMap();
  }

  /// Returns a map service image format.
  ///
  /// Return Value: A [MapServiceImageFormat].
  MapServiceImageFormat? getValueAsMapServiceImageFormat() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsMapServiceImageFormat(
          _handle, errorHandler);
    });
    return MapServiceImageFormat._fromCoreValue(coreValue);
  }

  /// Returns the element's value as an OAuth application credential.
  ///
  /// Return Value: An [OAuthApplicationCredential].
  OAuthApplicationCredential? getValueAsOAuthApplicationCredential() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOAuthApplicationCredential(
          _handle, errorHandler);
    });
    return OAuthApplicationCredential._fromHandle(objectHandle);
  }

  /// Returns the element's value as OAuth application token info.
  ///
  /// Return Value: An [OAuthApplicationTokenInfo].
  OAuthApplicationTokenInfo? getValueAsOAuthApplicationTokenInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOAuthApplicationTokenInfo(
          _handle, errorHandler);
    });
    return OAuthApplicationTokenInfo._fromHandle(objectHandle);
  }

  /// Returns the element's value as an OAuth user credential.
  ///
  /// Return Value: An [OAuthUserCredential].
  OAuthUserCredential? getValueAsOAuthUserCredential() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOAuthUserCredential(
          _handle, errorHandler);
    });
    return OAuthUserCredential._fromHandle(objectHandle);
  }

  /// Returns the element's value as an OAuth user credential.
  ///
  /// Return Value: An [OAuthUserTokenInfo].
  OAuthUserTokenInfo? getValueAsOAuthUserTokenInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOAuthUserTokenInfo(
          _handle, errorHandler);
    });
    return OAuthUserTokenInfo._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineCapability].
  OfflineCapability? getValueAsOfflineCapability() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineCapability(
          _handle, errorHandler);
    });
    return OfflineCapability._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineCapability].
  OfflineMapCapabilities? getValueAsOfflineMapCapabilities() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineMapCapabilities(
          _handle, errorHandler);
    });
    return OfflineMapCapabilities._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineMapParametersKey].
  OfflineMapParametersKey? getValueAsOfflineMapParametersKey() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineMapParametersKey(
          _handle, errorHandler);
    });
    return OfflineMapParametersKey._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineMapSyncLayerResult].
  OfflineMapSyncLayerResult? getValueAsOfflineMapSyncLayerResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineMapSyncLayerResult(
          _handle, errorHandler);
    });
    return OfflineMapSyncLayerResult._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineMapSyncParameters].
  OfflineMapSyncParameters? getValueAsOfflineMapSyncParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineMapSyncParameters(
          _handle, errorHandler);
    });
    return OfflineMapSyncParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [OfflineMapUpdatesInfo].
  OfflineMapUpdatesInfo? getValueAsOfflineMapUpdatesInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOfflineMapUpdatesInfo(
          _handle, errorHandler);
    });
    return OfflineMapUpdatesInfo._fromHandle(objectHandle);
  }

  /// Gets the value of an element as an [OrderBy].
  ///
  /// Return Value: An [OrderBy].
  OrderBy? getValueAsOrderBy() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsOrderBy(_handle, errorHandler);
    });
    return OrderBy._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [PointBarrier].
  PointBarrier? getValueAsPointBarrier() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPointBarrier(
          _handle, errorHandler);
    });
    return PointBarrier._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [PolygonBarrier].
  PolygonBarrier? getValueAsPolygonBarrier() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPolygonBarrier(
          _handle, errorHandler);
    });
    return PolygonBarrier._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [PolylineBarrier].
  PolylineBarrier? getValueAsPolylineBarrier() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPolylineBarrier(
          _handle, errorHandler);
    });
    return PolylineBarrier._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Portal].
  Portal? getValueAsPortal() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPortal(_handle, errorHandler);
    });
    return Portal._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [PortalItem].
  PortalItem? getValueAsPortalItem() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPortalItem(_handle, errorHandler);
    });
    return PortalItem._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [PreplannedMapArea].
  PreplannedMapArea? getValueAsPreplannedMapArea() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsPreplannedMapArea(
          _handle, errorHandler);
    });
    return PreplannedMapArea._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a [QueryParameters].
  ///
  /// Return Value: A [QueryParameters].
  QueryParameters? getValueAsQueryParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsQueryParameters(
          _handle, errorHandler);
    });
    return QueryParameters._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a related feature query result.
  ///
  /// Return Value: A [RelatedFeatureQueryResult].
  RelatedFeatureQueryResult? getValueAsRelatedFeatureQueryResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRelatedFeatureQueryResult(
          _handle, errorHandler);
    });
    return RelatedFeatureQueryResult._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [FeatureEditResult].
  RelationshipConstraintViolationType?
      getValueAsRelationshipConstraintViolationType() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRelationshipConstraintViolation(
          _handle, errorHandler);
    });
    return RelationshipConstraintViolationType._fromCoreValue(coreValue);
  }

  /// Returns the element as a relationship info.
  ///
  /// If the value stored in the element is not a relationship info type, an
  /// exception will be thrown.
  ///
  /// Return Value: A [RelationshipInfo]
  RelationshipInfo? getValueAsRelationshipInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRelationshipInfo(
          _handle, errorHandler);
    });
    return RelationshipInfo._fromHandle(objectHandle);
  }

  /// Returns the element's value as a request attachment.
  ///
  /// Return Value: A [_RequestAttachment].
  _RequestAttachment? getValueAsRequestAttachment() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRequestAttachment(
          _handle, errorHandler);
    });
    return _RequestAttachment._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [RestrictionAttribute].
  RestrictionAttribute? getValueAsRestrictionAttribute() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRestrictionAttribute(
          _handle, errorHandler);
    });
    return RestrictionAttribute._fromHandle(objectHandle);
  }

  /// Gets the value of the element for route.
  ///
  /// Return Value: A [Route].
  Route? getValueAsRoute() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRoute(_handle, errorHandler);
    });
    return Route._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [RouteParameters].
  RouteParameters? getValueAsRouteParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRouteParameters(
          _handle, errorHandler);
    });
    return RouteParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [RouteResult].
  RouteResult? getValueAsRouteResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsRouteResult(
          _handle, errorHandler);
    });
    return RouteResult._fromHandle(objectHandle);
  }

  /// Returns the element's value as an scale range display filter.
  ///
  /// Return Value: A [ScaleRangeDisplayFilter]
  ScaleRangeDisplayFilter? getValueAsScaleRangeDisplayFilter() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsScaleRangeDisplayFilter(
          _handle, errorHandler);
    });
    return ScaleRangeDisplayFilter._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Facility].
  ServiceAreaFacility? getValueAsServiceAreaFacility() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceAreaFacility(
          _handle, errorHandler);
    });
    return ServiceAreaFacility._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Facility].
  ServiceAreaParameters? getValueAsServiceAreaParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceAreaParameters(
          _handle, errorHandler);
    });
    return ServiceAreaParameters._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Facility].
  ServiceAreaPolygon? getValueAsServiceAreaPolygon() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceAreaPolygon(
          _handle, errorHandler);
    });
    return ServiceAreaPolygon._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [ServiceAreaPolyline].
  ServiceAreaPolyline? getValueAsServiceAreaPolyline() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceAreaPolyline(
          _handle, errorHandler);
    });
    return ServiceAreaPolyline._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [Facility].
  ServiceAreaResult? getValueAsServiceAreaResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceAreaResult(
          _handle, errorHandler);
    });
    return ServiceAreaResult._fromHandle(objectHandle);
  }

  /// Gets the value of an element as an service feature table.
  ///
  /// Return Value: A [ServiceFeatureTable].
  ServiceFeatureTable? getValueAsServiceFeatureTable() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsServiceFeatureTable(
          _handle, errorHandler);
    });
    return ServiceFeatureTable._fromHandle(objectHandle);
  }

  /// Returns the element as a [SpatialReference].
  ///
  /// If the value stored in the element is not a [SpatialReference], an
  /// exception will be thrown.
  ///
  /// Return Value: the parameters object.
  SpatialReference? getValueAsSpatialReference() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSpatialReference(
          _handle, errorHandler);
    });
    return SpatialReference._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a [StatisticDefinition].
  ///
  /// Return Value: A [StatisticDefinition].
  StatisticDefinition? getValueAsStatisticDefinition() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsStatisticDefinition(
          _handle, errorHandler);
    });
    return StatisticDefinition._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a statistic record value.
  ///
  /// Return Value: A [StatisticRecord].
  StatisticRecord? getValueAsStatisticRecord() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsStatisticRecord(
          _handle, errorHandler);
    });
    return StatisticRecord._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a [StatisticsQueryParameters].
  ///
  /// Return Value: A [QueryParameters].
  StatisticsQueryParameters? getValueAsStatisticsQueryParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsStatisticsQueryParameters(
          _handle, errorHandler);
    });
    return StatisticsQueryParameters._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a statistics query result.
  ///
  /// Return Value: A [StatisticsQueryResult].
  StatisticsQueryResult? getValueAsStatisticsQueryResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsStatisticsQueryResult(
          _handle, errorHandler);
    });
    return StatisticsQueryResult._fromHandle(objectHandle);
  }

  /// Gets the value of the element for stop.
  ///
  /// Return Value: A [Stop].
  Stop? getValueAsStop() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsStop(_handle, errorHandler);
    });
    return Stop._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [String].
  String? getValueAsString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns the element's value as a suggest result.
  ///
  /// Return Value: A [SuggestResult].
  SuggestResult? getValueAsSuggestResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSuggestResult(
          _handle, errorHandler);
    });
    return SuggestResult._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a [SyncGeodatabaseParameters].
  ///
  /// Return Value: A [SyncGeodatabaseParameters].
  SyncGeodatabaseParameters? getValueAsSyncGeodatabaseParameters() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSyncGeodatabaseParameters(
          _handle, errorHandler);
    });
    return SyncGeodatabaseParameters._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a sync layer option.
  ///
  /// Return Value: A [SyncLayerOption].
  SyncLayerOption? getValueAsSyncLayerOption() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSyncLayerOption(
          _handle, errorHandler);
    });
    return SyncLayerOption._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a sync layer result.
  ///
  /// Return Value: A [SyncLayerResult].
  SyncLayerResult? getValueAsSyncLayerResult() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsSyncLayerResult(
          _handle, errorHandler);
    });
    return SyncLayerResult._fromHandle(objectHandle);
  }

  /// Returns the element's value as a tile cache.
  ///
  /// Return Value: A [TileCache].
  TileCache? getValueAsTileCache() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTileCache(_handle, errorHandler);
    });
    return TileCache._fromHandle(objectHandle);
  }

  /// Returns a tile image format.
  ///
  /// Return Value: A [TileImageFormat].
  TileImageFormat? getValueAsTileImageFormat() {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTileImageFormat(
          _handle, errorHandler);
    });
    return TileImageFormat._fromCoreValue(coreValue);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [TimeOnly].
  TimeOnly? getValueAsTimeOnly() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTimeOnly(_handle, errorHandler);
    });
    return TimeOnly._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [TimestampOffset].
  TimestampOffset? getValueAsTimestampOffset() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTimestampOffset(
          _handle, errorHandler);
    });
    return TimestampOffset._fromHandle(objectHandle);
  }

  /// Returns the element's value as a token credential.
  ///
  /// Return Value: A [TokenCredential].
  TokenCredential? getValueAsTokenCredential() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTokenCredential(
          _handle, errorHandler);
    });
    return TokenCredential._fromHandle(objectHandle);
  }

  /// Returns the element's value as a token info.
  ///
  /// Return Value: A [TokenInfo].
  TokenInfo? getValueAsTokenInfo() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTokenInfo(_handle, errorHandler);
    });
    return TokenInfo._fromHandle(objectHandle);
  }

  /// Gets the value of an element as a transportation network dataset.
  ///
  /// Return Value: A [TransportationNetworkDataset].
  TransportationNetworkDataset? getValueAsTransportationNetworkDataset() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTransportationNetworkDataset(
          _handle, errorHandler);
    });
    return TransportationNetworkDataset._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: A [TravelMode].
  TravelMode? getValueAsTravelMode() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsTravelMode(_handle, errorHandler);
    });
    return TravelMode._fromHandle(objectHandle);
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An uint16_t.
  int? getValueAsUInt16() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsUInt16(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An uint32_t.
  int? getValueAsUInt32() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsUInt32(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An uint64_t.
  int? getValueAsUInt64() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsUInt64(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An uint8_t.
  int? getValueAsUInt8() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsUInt8(_handle, errorHandler);
    });
  }

  /// Gets the value of the element.
  ///
  /// Return Value: An [Uint8List].
  Uint8List? getValueAsUint8List() {
    final byteArray = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsBuffer(_handle, errorHandler);
    });
    return byteArray.toDartList();
  }

  /// Returns the element's value as a unique value.
  ///
  /// Return Value: An [UniqueValue].
  UniqueValue? getValueAsUniqueValue() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsUniqueValue(
          _handle, errorHandler);
    });
    return UniqueValue._fromHandle(objectHandle);
  }

  /// Gets the element value as a vector.
  ///
  /// Return Value: A [List].
  List<Object>? getValueAsVector() {
    final vectorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsVector(_handle, errorHandler);
    });
    return vectorHandle.toList();
  }

  /// Returns the element's value as a vector tile cache.
  ///
  /// Return Value: A [VectorTileCache].
  VectorTileCache? getValueAsVectorTileCache() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_getValueAsVectorTileCache(
          _handle, errorHandler);
    });
    return VectorTileCache._fromHandle(objectHandle);
  }

  /// Returns true if the element doesn't have a value.
  ///
  /// Return Value: true if the element doesn't have a value, false otherwise.
  bool isEmpty() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Element_isEmpty(_handle, errorHandler);
    });
  }

  /// Sets the value of the element from a map.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArcGISMap({required ArcGISMap value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromMap(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an ArcGIS credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArcGisCredential({required ArcGISCredential value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromArcGISCredential(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to an ArcGIS feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArcGisFeatureTable({required ArcGISFeatureTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromArcGISFeatureTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a sublayer.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArcGisSublayer({required ArcGISSublayer value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromArcGISSublayer(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an ArcGIS token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArcGisTokenInfo({required _ArcGISTokenInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromArcGISTokenInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of this element to be an array.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromArray({required List<Object> value}) {
    final coreValue = value.toArray(valueType: _ElementType.variant);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromArray(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromAttachment({required Attachment value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromAttachment(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromAttributeParameterValue(
      {required AttributeParameterValue value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromAttributeParameterValue(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a [BasemapStyleLanguageStrategy].
  ///
  /// Parameters:
  /// - `value` — the value
  void setValueFromBasemapStyleLanguageStrategy(
      {required BasemapStyleLanguageStrategy value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromBasemapStyleLanguageStrategy(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Sets the value of the element from a bookmark.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromBookmark({required Bookmark value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromBookmark(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromBool({required bool value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromBool(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromBuffer({required Uint8List value}) {
    final coreValue = value.toByteArrayWrapper();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromBuffer(
          _handle, coreValue.ref, errorHandler);
    });
  }

  /// Sets the value of the element from a class break.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClassBreak({required ClassBreak value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClassBreak(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a client reference.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClientReference({required _ClientReference value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClientReference(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a client response.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClientResponse({required _ClientResponse value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClientResponse(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClosestFacilityParameters(
      {required ClosestFacilityParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClosestFacilityParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClosestFacilityResult(
      {required ClosestFacilityResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClosestFacilityResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromClosestFacilityRoute({required ClosestFacilityRoute value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromClosestFacilityRoute(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromCodedValue({required CodedValue value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromCodedValue(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromCodedValueDescription(
      {required CodedValueDescription value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromCodedValueDescription(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromColor({required Color value}) {
    final coreValue = value.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromColor(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromCostAttribute({required CostAttribute value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromCostAttribute(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDateOnly({required DateOnly value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDateOnly(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDateTime({required DateTime value}) {
    final coreValue = value.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDateTime(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Sets the value of the element to a [DatumTransformation] instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  void setValueFromDatumTransformation({required DatumTransformation value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDatumTransformation(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of this element to be a dictionary.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDictionary({required Map<dynamic, dynamic> value}) {
    final coreValue = value.toDictionary(
        keyType: _ElementType.variant, valueType: _ElementType.variant);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDictionary(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDirectionEvent({required DirectionEvent value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDirectionEvent(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDirectionManeuver({required DirectionManeuver value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDirectionManeuver(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDirectionMessage({required DirectionMessage value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDirectionMessage(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a display filter.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDisplayFilter({required DisplayFilter value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDisplayFilter(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDomain({required Domain value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDomain(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromDownloadPreplannedOfflineMapParameters(
      {required DownloadPreplannedOfflineMapParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromDownloadPreplannedOfflineMapParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromEditResult({required EditResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromEditResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromError({required ArcGISException value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromError(
          _handle, value._error?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromEstimateTileCacheSizeResult(
      {required EstimateTileCacheSizeResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromEstimateTileCacheSizeResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromExportTileCacheParameters(
      {required ExportTileCacheParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromExportTileCacheParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromExportVectorTilesParameters(
      {required ExportVectorTilesParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromExportVectorTilesParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromExtensionLicense({required ExtensionLicense value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromExtensionLicense(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFacility({required Facility value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFacility(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a feature.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeature({required Feature value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeature(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a feature collection table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureCollectionTable(
      {required FeatureCollectionTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureCollectionTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureEditResult({required FeatureEditResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureEditResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a feature query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureQueryResult({required FeatureQueryResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureQueryResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureSubtype({required FeatureSubtype value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureSubtype(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureTable({required FeatureTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureTemplate({required FeatureTemplate value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureTemplate(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFeatureType({required FeatureType value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFeatureType(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromField({required Field value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromField(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFieldDescription({required FieldDescription value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFieldDescription(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFloat32({required double value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFloat32(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromFloat64({required double value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromFloat64(_handle, value, errorHandler);
    });
  }

  /// Sets the value of an element to a [GenerateGeodatabaseParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGenerateGeodatabaseParameters(
      {required GenerateGeodatabaseParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGenerateGeodatabaseParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a generate layer option.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGenerateLayerOption({required GenerateLayerOption value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGenerateLayerOption(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGenerateOfflineMapParameterOverrides(
      {required GenerateOfflineMapParameterOverrides value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGenerateOfflineMapParameterOverrides(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGenerateOfflineMapParameters(
      {required GenerateOfflineMapParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGenerateOfflineMapParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a GeoPackage feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeoPackageFeatureTable(
      {required GeoPackageFeatureTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeoPackageFeatureTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a geocode result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeocodeResult({required GeocodeResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeocodeResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a geodatabase.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeodatabase({required Geodatabase value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeodatabase(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a [GeodatabaseDeltaInfo].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeodatabaseDeltaInfo({required GeodatabaseDeltaInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeodatabaseDeltaInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a geodatabase feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeodatabaseFeatureTable(
      {required GeodatabaseFeatureTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeodatabaseFeatureTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to a [GeographicTransformationStep]
  /// instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  void setValueFromGeographicTransformationStep(
      {required GeographicTransformationStep value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeographicTransformationStep(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGeometry({required Geometry value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGeometry(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a graphic.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGraphic({required Graphic value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGraphic(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a graphics overlay.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGraphicsOverlay({required GraphicsOverlay value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGraphicsOverlay(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromGuid({required Guid value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromGUID(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to a [HorizontalVerticalTransformationStep]
  /// instance.
  ///
  /// Parameters:
  /// - `value` — The instance.
  void setValueFromHorizontalVerticalTransformationStep(
      {required HorizontalVerticalTransformationStep value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromHorizontalVerticalTransformationStep(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromIdInfo({required IdInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromIdInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an identify result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromIdentifyGraphicsOverlayResult(
      {required IdentifyGraphicsOverlayResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromIdentifyGraphicsOverlayResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an identify result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromIdentifyLayerResult({required IdentifyLayerResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromIdentifyLayerResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of this element to be an image.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromImage({required ArcGISImage value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromImage(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromIncident({required Incident value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromIncident(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromInt16({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromInt16(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromInt32({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromInt32(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromInt64({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromInt64(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromInt8({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromInt8(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element from an item resource cache.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromItemResourceCache({required ItemResourceCache value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromItemResourceCache(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromJobMessage({required JobMessage value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromJobMessage(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a layer.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLayer({required Layer value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLayer(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLegendInfo({required LegendInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLegendInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLevelOfDetail({required LevelOfDetail value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLevelOfDetail(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLicenseInfo({required LicenseInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLicenseInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an [ArcGISLocation].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLocation({required ArcGISLocation value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLocation(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a locator attribute.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromLocatorAttribute({required LocatorAttribute value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromLocatorAttribute(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromMapServiceImageFormat(
      {required MapServiceImageFormat value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromMapServiceImageFormat(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Sets the value of the element from an OAuth application credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOAuthApplicationCredential(
      {required OAuthApplicationCredential value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOAuthApplicationCredential(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an OAuth application token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOAuthApplicationTokenInfo(
      {required OAuthApplicationTokenInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOAuthApplicationTokenInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an OAuth user credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOAuthUserCredential({required OAuthUserCredential value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOAuthUserCredential(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from an OAuth user token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOAuthUserTokenInfo({required OAuthUserTokenInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOAuthUserTokenInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineCapability({required OfflineCapability value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineCapability(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineMapCapabilities(
      {required OfflineMapCapabilities value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineMapCapabilities(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineMapParametersKey(
      {required OfflineMapParametersKey value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineMapParametersKey(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineMapSyncLayerResult(
      {required OfflineMapSyncLayerResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineMapSyncLayerResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineMapSyncParameters(
      {required OfflineMapSyncParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineMapSyncParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOfflineMapUpdatesInfo(
      {required OfflineMapUpdatesInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOfflineMapUpdatesInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to an [OrderBy].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromOrderBy({required OrderBy value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromOrderBy(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPointBarrier({required PointBarrier value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPointBarrier(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPolygonBarrier({required PolygonBarrier value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPolygonBarrier(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPolylineBarrier({required PolylineBarrier value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPolylineBarrier(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPortal({required Portal value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPortal(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPortalItem({required PortalItem value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPortalItem(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromPreplannedMapArea({required PreplannedMapArea value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromPreplannedMapArea(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a [QueryParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromQueryParameters({required QueryParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromQueryParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a related feature query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRelatedFeatureQueryResult(
      {required RelatedFeatureQueryResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRelatedFeatureQueryResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRelationshipConstraintViolation(
      {required RelationshipConstraintViolationType value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRelationshipConstraintViolation(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRelationshipInfo({required RelationshipInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRelationshipInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a request attachment.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRequestAttachment({required _RequestAttachment value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRequestAttachment(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRestrictionAttribute({required RestrictionAttribute value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRestrictionAttribute(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element for route.
  ///
  /// Parameters:
  /// - `value` — The route's value.
  void setValueFromRoute({required Route value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRoute(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRouteParameters({required RouteParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRouteParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromRouteResult({required RouteResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromRouteResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a scale range display filter.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromScaleRangeDisplayFilter(
      {required ScaleRangeDisplayFilter value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromScaleRangeDisplayFilter(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceAreaFacility({required ServiceAreaFacility value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceAreaFacility(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceAreaParameters(
      {required ServiceAreaParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceAreaParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceAreaPolygon({required ServiceAreaPolygon value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceAreaPolygon(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceAreaPolyline({required ServiceAreaPolyline value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceAreaPolyline(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceAreaResult({required ServiceAreaResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceAreaResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a service feature table.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromServiceFeatureTable({required ServiceFeatureTable value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromServiceFeatureTable(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a [StatisticDefinition].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromStatisticDefinition({required StatisticDefinition value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromStatisticDefinition(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a statistic record value.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromStatisticRecord({required StatisticRecord value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromStatisticRecord(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a [QueryParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromStatisticsQueryParameters(
      {required StatisticsQueryParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromStatisticsQueryParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a statistics query result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromStatisticsQueryResult(
      {required StatisticsQueryResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromStatisticsQueryResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element for stop.
  ///
  /// Parameters:
  /// - `value` — The stop's value.
  void setValueFromStop({required Stop value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromStop(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromString({required String value}) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromString(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Sets the value of the element from a suggest result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromSuggestResult({required SuggestResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromSuggestResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromSymbol({required ArcGISSymbol value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromSymbol(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a [SyncGeodatabaseParameters].
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromSyncGeodatabaseParameters(
      {required SyncGeodatabaseParameters value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromSyncGeodatabaseParameters(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a sync layer option.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromSyncLayerOption({required SyncLayerOption value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromSyncLayerOption(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a sync layer result.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromSyncLayerResult({required SyncLayerResult value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromSyncLayerResult(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a tile cache.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTileCache({required TileCache value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTileCache(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element to the given object.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTileImageFormat({required TileImageFormat value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTileImageFormat(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTimeOnly({required TimeOnly value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTimeOnly(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTimestampOffset({required TimestampOffset value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTimestampOffset(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a token credential.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTokenCredential({required TokenCredential value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTokenCredential(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a token info.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTokenInfo({required TokenInfo value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTokenInfo(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of an element to a transportation network dataset.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTransportationNetworkDataset(
      {required TransportationNetworkDataset value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTransportationNetworkDataset(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromTravelMode({required TravelMode value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromTravelMode(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromUInt16({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromUInt16(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromUInt32({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromUInt32(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromUInt64({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromUInt64(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromUInt8({required int value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromUInt8(_handle, value, errorHandler);
    });
  }

  /// Sets the value of the element from a unique value.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromUniqueValue({required UniqueValue value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromUniqueValue(
          _handle, value._handle, errorHandler);
    });
  }

  /// Sets the value of this element to be a vector.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromVector({required List<Object> value}) {
    final coreValue = value.toMutableArray(valueType: _ElementType.variant);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromVector(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Sets the value of the element from a vector tile cache.
  ///
  /// Parameters:
  /// - `value` — The value.
  void setValueFromVectorTileCache({required VectorTileCache value}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Element_setValueFromVectorTileCache(
          _handle, value._handle, errorHandler);
    });
  }
}

extension _ElementExtension on _Element {
  static _Element fromDartValue(dynamic dartValue,
      {_ElementType? expectedType}) {
    if (dartValue is ArcGISCredential) {
      return _Element.fromArcGisCredential(dartValue);
    } else if (dartValue is ArcGISException) {
      return _Element.fromError(dartValue);
    } else if (dartValue is ArcGISFeatureTable) {
      return _Element.fromArcGisFeatureTable(dartValue);
    } else if (dartValue is ArcGISImage) {
      return _Element.fromImage(dartValue);
    } else if (dartValue is ArcGISLocation) {
      return _Element.fromLocation(dartValue);
    } else if (dartValue is ArcGISMap) {
      return _Element.fromArcGISMap(dartValue);
    } else if (dartValue is ArcGISSublayer) {
      return _Element.fromArcGisSublayer(dartValue);
    } else if (dartValue is ArcGISSymbol) {
      return _Element.fromSymbol(dartValue);
    } else if (dartValue is Attachment) {
      return _Element.fromAttachment(dartValue);
    } else if (dartValue is AttributeParameterValue) {
      return _Element.fromAttributeParameterValue(dartValue);
    } else if (dartValue is BasemapStyleLanguageStrategy) {
      return _Element.fromBasemapStyleLanguageStrategy(dartValue);
    } else if (dartValue is Bookmark) {
      return _Element.fromBookmark(dartValue);
    } else if (dartValue is ClassBreak) {
      return _Element.fromClassBreak(dartValue);
    } else if (dartValue is ClosestFacilityParameters) {
      return _Element.fromClosestFacilityParameters(dartValue);
    } else if (dartValue is ClosestFacilityResult) {
      return _Element.fromClosestFacilityResult(dartValue);
    } else if (dartValue is ClosestFacilityRoute) {
      return _Element.fromClosestFacilityRoute(dartValue);
    } else if (dartValue is CodedValue) {
      return _Element.fromCodedValue(dartValue);
    } else if (dartValue is CodedValueDescription) {
      return _Element.fromCodedValueDescription(dartValue);
    } else if (dartValue is Color) {
      return _Element.fromColor(dartValue);
    } else if (dartValue is CostAttribute) {
      return _Element.fromCostAttribute(dartValue);
    } else if (dartValue is DateOnly) {
      return _Element.fromDateOnly(dartValue);
    } else if (dartValue is DateTime) {
      return _Element.fromDateTime(dartValue);
    } else if (dartValue is DatumTransformation) {
      return _Element.fromDatumTransformation(dartValue);
    } else if (dartValue is DirectionEvent) {
      return _Element.fromDirectionEvent(dartValue);
    } else if (dartValue is DirectionManeuver) {
      return _Element.fromDirectionManeuver(dartValue);
    } else if (dartValue is DirectionMessage) {
      return _Element.fromDirectionMessage(dartValue);
    } else if (dartValue is DisplayFilter) {
      return _Element.fromDisplayFilter(dartValue);
    } else if (dartValue is Domain) {
      return _Element.fromDomain(dartValue);
    } else if (dartValue is DownloadPreplannedOfflineMapParameters) {
      return _Element.fromDownloadPreplannedOfflineMapParameters(dartValue);
    } else if (dartValue is EditResult) {
      return _Element.fromEditResult(dartValue);
    } else if (dartValue is EstimateTileCacheSizeResult) {
      return _Element.fromEstimateTileCacheSizeResult(dartValue);
    } else if (dartValue is ExportTileCacheParameters) {
      return _Element.fromExportTileCacheParameters(dartValue);
    } else if (dartValue is ExportVectorTilesParameters) {
      return _Element.fromExportVectorTilesParameters(dartValue);
    } else if (dartValue is ExtensionLicense) {
      return _Element.fromExtensionLicense(dartValue);
    } else if (dartValue is Facility) {
      return _Element.fromFacility(dartValue);
    } else if (dartValue is Feature) {
      return _Element.fromFeature(dartValue);
    } else if (dartValue is FeatureCollectionTable) {
      return _Element.fromFeatureCollectionTable(dartValue);
    } else if (dartValue is FeatureEditResult) {
      return _Element.fromFeatureEditResult(dartValue);
    } else if (dartValue is FeatureQueryResult) {
      return _Element.fromFeatureQueryResult(dartValue);
    } else if (dartValue is FeatureSubtype) {
      return _Element.fromFeatureSubtype(dartValue);
    } else if (dartValue is FeatureTable) {
      return _Element.fromFeatureTable(dartValue);
    } else if (dartValue is FeatureTemplate) {
      return _Element.fromFeatureTemplate(dartValue);
    } else if (dartValue is FeatureType) {
      return _Element.fromFeatureType(dartValue);
    } else if (dartValue is Field) {
      return _Element.fromField(dartValue);
    } else if (dartValue is FieldDescription) {
      return _Element.fromFieldDescription(dartValue);
    } else if (dartValue is GenerateGeodatabaseParameters) {
      return _Element.fromGenerateGeodatabaseParameters(dartValue);
    } else if (dartValue is GenerateLayerOption) {
      return _Element.fromGenerateLayerOption(dartValue);
    } else if (dartValue is GenerateOfflineMapParameterOverrides) {
      return _Element.fromGenerateOfflineMapParameterOverrides(dartValue);
    } else if (dartValue is GenerateOfflineMapParameters) {
      return _Element.fromGenerateOfflineMapParameters(dartValue);
    } else if (dartValue is GeoPackageFeatureTable) {
      return _Element.fromGeoPackageFeatureTable(dartValue);
    } else if (dartValue is GeocodeResult) {
      return _Element.fromGeocodeResult(dartValue);
    } else if (dartValue is Geodatabase) {
      return _Element.fromGeodatabase(dartValue);
    } else if (dartValue is GeodatabaseDeltaInfo) {
      return _Element.fromGeodatabaseDeltaInfo(dartValue);
    } else if (dartValue is GeodatabaseFeatureTable) {
      return _Element.fromGeodatabaseFeatureTable(dartValue);
    } else if (dartValue is GeographicTransformationStep) {
      return _Element.fromGeographicTransformationStep(dartValue);
    } else if (dartValue is Geometry) {
      return _Element.fromGeometry(dartValue);
    } else if (dartValue is Graphic) {
      return _Element.fromGraphic(dartValue);
    } else if (dartValue is GraphicsOverlay) {
      return _Element.fromGraphicsOverlay(dartValue);
    } else if (dartValue is Guid) {
      return _Element.fromGuid(dartValue);
    } else if (dartValue is HorizontalVerticalTransformationStep) {
      return _Element.fromHorizontalVerticalTransformationStep(dartValue);
    } else if (dartValue is IdInfo) {
      return _Element.fromIdInfo(dartValue);
    } else if (dartValue is IdentifyGraphicsOverlayResult) {
      return _Element.fromIdentifyGraphicsOverlayResult(dartValue);
    } else if (dartValue is IdentifyLayerResult) {
      return _Element.fromIdentifyLayerResult(dartValue);
    } else if (dartValue is Incident) {
      return _Element.fromIncident(dartValue);
    } else if (dartValue is ItemResourceCache) {
      return _Element.fromItemResourceCache(dartValue);
    } else if (dartValue is JobMessage) {
      return _Element.fromJobMessage(dartValue);
    } else if (dartValue is Layer) {
      return _Element.fromLayer(dartValue);
    } else if (dartValue is LegendInfo) {
      return _Element.fromLegendInfo(dartValue);
    } else if (dartValue is LevelOfDetail) {
      return _Element.fromLevelOfDetail(dartValue);
    } else if (dartValue is LicenseInfo) {
      return _Element.fromLicenseInfo(dartValue);
    } else if (dartValue is List<Object>) {
      return _Element.fromArray(dartValue);
    } else if (dartValue is LocalFeatureEdit) {
      return _Element.fromLocalFeatureEdit(dartValue);
    } else if (dartValue is LocatorAttribute) {
      return _Element.fromLocatorAttribute(dartValue);
    } else if (dartValue is Map) {
      return _Element.fromDictionary(dartValue);
    } else if (dartValue is MapServiceImageFormat) {
      return _Element.fromMapServiceImageFormat(dartValue);
    } else if (dartValue is OAuthApplicationCredential) {
      return _Element.fromOAuthApplicationCredential(dartValue);
    } else if (dartValue is OAuthApplicationTokenInfo) {
      return _Element.fromOAuthApplicationTokenInfo(dartValue);
    } else if (dartValue is OAuthUserCredential) {
      return _Element.fromOAuthUserCredential(dartValue);
    } else if (dartValue is OAuthUserTokenInfo) {
      return _Element.fromOAuthUserTokenInfo(dartValue);
    } else if (dartValue is OfflineCapability) {
      return _Element.fromOfflineCapability(dartValue);
    } else if (dartValue is OfflineMapCapabilities) {
      return _Element.fromOfflineMapCapabilities(dartValue);
    } else if (dartValue is OfflineMapParametersKey) {
      return _Element.fromOfflineMapParametersKey(dartValue);
    } else if (dartValue is OfflineMapSyncLayerResult) {
      return _Element.fromOfflineMapSyncLayerResult(dartValue);
    } else if (dartValue is OfflineMapSyncParameters) {
      return _Element.fromOfflineMapSyncParameters(dartValue);
    } else if (dartValue is OfflineMapUpdatesInfo) {
      return _Element.fromOfflineMapUpdatesInfo(dartValue);
    } else if (dartValue is OrderBy) {
      return _Element.fromOrderBy(dartValue);
    } else if (dartValue is PointBarrier) {
      return _Element.fromPointBarrier(dartValue);
    } else if (dartValue is PolygonBarrier) {
      return _Element.fromPolygonBarrier(dartValue);
    } else if (dartValue is PolylineBarrier) {
      return _Element.fromPolylineBarrier(dartValue);
    } else if (dartValue is Portal) {
      return _Element.fromPortal(dartValue);
    } else if (dartValue is PortalItem) {
      return _Element.fromPortalItem(dartValue);
    } else if (dartValue is PreplannedMapArea) {
      return _Element.fromPreplannedMapArea(dartValue);
    } else if (dartValue is QueryParameters) {
      return _Element.fromQueryParameters(dartValue);
    } else if (dartValue is RelatedFeatureQueryResult) {
      return _Element.fromRelatedFeatureQueryResult(dartValue);
    } else if (dartValue is RelationshipConstraintViolationType) {
      return _Element.fromRelationshipConstraintViolation(dartValue);
    } else if (dartValue is RelationshipInfo) {
      return _Element.fromRelationshipInfo(dartValue);
    } else if (dartValue is RestrictionAttribute) {
      return _Element.fromRestrictionAttribute(dartValue);
    } else if (dartValue is Route) {
      return _Element.fromRoute(dartValue);
    } else if (dartValue is RouteParameters) {
      return _Element.fromRouteParameters(dartValue);
    } else if (dartValue is RouteResult) {
      return _Element.fromRouteResult(dartValue);
    } else if (dartValue is ScaleRangeDisplayFilter) {
      return _Element.fromScaleRangeDisplayFilter(dartValue);
    } else if (dartValue is ServiceAreaFacility) {
      return _Element.fromServiceAreaFacility(dartValue);
    } else if (dartValue is ServiceAreaParameters) {
      return _Element.fromServiceAreaParameters(dartValue);
    } else if (dartValue is ServiceAreaPolygon) {
      return _Element.fromServiceAreaPolygon(dartValue);
    } else if (dartValue is ServiceAreaPolyline) {
      return _Element.fromServiceAreaPolyline(dartValue);
    } else if (dartValue is ServiceAreaResult) {
      return _Element.fromServiceAreaResult(dartValue);
    } else if (dartValue is ServiceFeatureTable) {
      return _Element.fromServiceFeatureTable(dartValue);
    } else if (dartValue is SpatialReference) {
      return _Element.fromSpatialReference(dartValue);
    } else if (dartValue is StatisticDefinition) {
      return _Element.fromStatisticDefinition(dartValue);
    } else if (dartValue is StatisticRecord) {
      return _Element.fromStatisticRecord(dartValue);
    } else if (dartValue is StatisticsQueryParameters) {
      return _Element.fromStatisticsQueryParameters(dartValue);
    } else if (dartValue is StatisticsQueryResult) {
      return _Element.fromStatisticsQueryResult(dartValue);
    } else if (dartValue is Stop) {
      return _Element.fromStop(dartValue);
    } else if (dartValue is String) {
      return _Element.fromString(dartValue);
    } else if (dartValue is SuggestResult) {
      return _Element.fromSuggestResult(dartValue);
    } else if (dartValue is SyncGeodatabaseParameters) {
      return _Element.fromSyncGeodatabaseParameters(dartValue);
    } else if (dartValue is SyncLayerOption) {
      return _Element.fromSyncLayerOption(dartValue);
    } else if (dartValue is SyncLayerResult) {
      return _Element.fromSyncLayerResult(dartValue);
    } else if (dartValue is TileCache) {
      return _Element.fromTileCache(dartValue);
    } else if (dartValue is TileImageFormat) {
      return _Element.fromTileImageFormat(dartValue);
    } else if (dartValue is TimeOnly) {
      return _Element.fromTimeOnly(dartValue);
    } else if (dartValue is TimestampOffset) {
      return _Element.fromTimestampOffset(dartValue);
    } else if (dartValue is TokenCredential) {
      return _Element.fromTokenCredential(dartValue);
    } else if (dartValue is TokenInfo) {
      return _Element.fromTokenInfo(dartValue);
    } else if (dartValue is TransportationNetworkDataset) {
      return _Element.fromTransportationNetworkDataset(dartValue);
    } else if (dartValue is TravelMode) {
      return _Element.fromTravelMode(dartValue);
    } else if (dartValue is Uint8List) {
      return _Element.fromBuffer(dartValue);
    } else if (dartValue is UniqueValue) {
      return _Element.fromUniqueValue(dartValue);
    } else if (dartValue is VectorTileCache) {
      return _Element.fromVectorTileCache(dartValue);
    } else if (dartValue is _ArcGISTokenInfo) {
      return _Element.fromArcGisTokenInfo(dartValue);
    } else if (dartValue is _ClientReference) {
      return _Element.fromClientReference(dartValue);
    } else if (dartValue is _ClientResponse) {
      return _Element.fromClientResponse(dartValue);
    } else if (dartValue is _RequestAttachment) {
      return _Element.fromRequestAttachment(dartValue);
    } else if (dartValue is bool) {
      return _Element.fromBool(dartValue);
    } else if (dartValue is double) {
      switch (expectedType) {
        case _ElementType.float32:
          return _Element.fromFloat32(dartValue);
        case _ElementType.float64:
          return _Element.fromFloat64(dartValue);
        default:
          return _Element.fromFloat64(dartValue);
      }
    } else if (dartValue is int) {
      switch (expectedType) {
        case _ElementType.int8:
          return _Element.fromInt8(dartValue);
        case _ElementType.int16:
          return _Element.fromInt16(dartValue);
        case _ElementType.int32:
          return _Element.fromInt32(dartValue);
        case _ElementType.int64:
          return _Element.fromInt64(dartValue);
        case _ElementType.uint8:
          return _Element.fromUInt8(dartValue);
        case _ElementType.uint16:
          return _Element.fromUInt16(dartValue);
        case _ElementType.uint32:
          return _Element.fromUInt32(dartValue);
        case _ElementType.uint64:
          return _Element.fromUInt64(dartValue);
        default:
          return _Element.fromInt64(dartValue);
      }
    } else {
      return _Element();
    }
  }

  dynamic getDartValue() {
    switch (_objectType) {
      case _ElementType.arcGISCredential:
        return getValueAsArcGISCredential();
      case _ElementType.arcGISFeature:
        return getValueAsArcGISFeature();
      case _ElementType.arcGISFeatureTable:
        return getValueAsArcGISFeatureTable();
      case _ElementType.arcGISMap:
        return getValueAsArcGISMap();
      case _ElementType.arcGISMapServiceImageFormat:
        return getValueAsMapServiceImageFormat();
      case _ElementType.arcGISSublayer:
        return getValueAsArcGISSublayer();
      case _ElementType.arcGISTokenInfo:
        return getValueAsArcGISTokenInfo();
      case _ElementType.array:
        return getValueAsList();
      case _ElementType.attachment:
        return getValueAsAttachment();
      case _ElementType.attributeParameterValue:
        return getValueAsAttributeParameterValue();
      case _ElementType.basemapStyleLanguageStrategy:
        return getValueAsBasemapStyleLanguageStrategy();
      case _ElementType.bookmark:
        return getValueAsBookmark();
      case _ElementType.bool:
        return getValueAsBool();
      case _ElementType.buffer:
        return getValueAsUint8List();
      case _ElementType.classBreak:
        return getValueAsClassBreak();
      case _ElementType.clientReference:
        return getValueAsClientReference();
      case _ElementType.clientResponse:
        return getValueAsClientResponse();
      case _ElementType.closestFacilityParameters:
        return getValueAsClosestFacilityParameters();
      case _ElementType.closestFacilityResult:
        return getValueAsClosestFacilityResult();
      case _ElementType.closestFacilityRoute:
        return getValueAsClosestFacilityRoute();
      case _ElementType.codedValue:
        return getValueAsCodedValue();
      case _ElementType.codedValueDescription:
        return getValueAsCodedValueDescription();
      case _ElementType.color:
        return getValueAsColor();
      case _ElementType.costAttribute:
        return getValueAsCostAttribute();
      case _ElementType.dateOnly:
        return getValueAsDateOnly();
      case _ElementType.dateTime:
        return getValueAsDateTime();
      case _ElementType.datumTransformation:
        return getValueAsDatumTransformation();
      case _ElementType.dictionary:
        return getValueAsMap();
      case _ElementType.directionEvent:
        return getValueAsDirectionEvent();
      case _ElementType.directionManeuver:
        return getValueAsDirectionManeuver();
      case _ElementType.directionMessage:
        return getValueAsDirectionMessage();
      case _ElementType.displayFilter:
        return getValueAsDisplayFilter();
      case _ElementType.domain:
        return getValueAsDomain();
      case _ElementType.downloadPreplannedOfflineMapParameters:
        return getValueAsDownloadPreplannedOfflineMapParameters();
      case _ElementType.editResult:
        return getValueAsEditResult();
      case _ElementType.error:
        return getValueAsArcGISException();
      case _ElementType.estimateTileCacheSizeResult:
        return getValueAsEstimateTileCacheSizeResult();
      case _ElementType.exportTileCacheParameters:
        return getValueAsExportTileCacheParameters();
      case _ElementType.exportVectorTilesParameters:
        return getValueAsExportVectorTilesParameters();
      case _ElementType.extensionLicense:
        return getValueAsExtensionLicense();
      case _ElementType.facility:
        return getValueAsFacility();
      case _ElementType.feature:
        return getValueAsFeature();
      case _ElementType.featureCollectionTable:
        return getValueAsFeatureCollectionTable();
      case _ElementType.featureEditResult:
        return getValueAsFeatureEditResult();
      case _ElementType.featureQueryResult:
        return getValueAsFeatureQueryResult();
      case _ElementType.featureSubtype:
        return getValueAsFeatureSubtype();
      case _ElementType.featureTable:
        return getValueAsFeatureTable();
      case _ElementType.featureTableEditResult:
        return getValueAsFeatureTableEditResult();
      case _ElementType.featureTemplate:
        return getValueAsFeatureTemplate();
      case _ElementType.featureType:
        return getValueAsFeatureType();
      case _ElementType.field:
        return getValueAsField();
      case _ElementType.fieldDescription:
        return getValueAsFieldDescription();
      case _ElementType.float32:
        return getValueAsFloat32();
      case _ElementType.float64:
        return getValueAsFloat64();
      case _ElementType.generateGeodatabaseParameters:
        return getValueAsGenerateGeodatabaseParameters();
      case _ElementType.generateLayerOption:
        return getValueAsGenerateLayerOption();
      case _ElementType.generateOfflineMapParameterOverrides:
        return getValueAsGenerateOfflineMapParameterOverrides();
      case _ElementType.generateOfflineMapParameters:
        return getValueAsGenerateOfflineMapParameters();
      case _ElementType.geocodeResult:
        return getValueAsGeocodeResult();
      case _ElementType.geodatabase:
        return getValueAsGeodatabase();
      case _ElementType.geodatabaseDeltaInfo:
        return getValueAsGeodatabaseDeltaInfo();
      case _ElementType.geodatabaseFeatureTable:
        return getValueAsGeodatabaseFeatureTable();
      case _ElementType.geographicTransformationStep:
        return getValueAsGeographicTransformationStep();
      case _ElementType.geometry:
        return getValueAsGeometry();
      case _ElementType.geopackageFeatureTable:
        return getValueAsGeoPackageFeatureTable();
      case _ElementType.graphic:
        return getValueAsGraphic();
      case _ElementType.graphicsOverlay:
        return getValueAsGraphicsOverlay();
      case _ElementType.guid:
        return getValueAsGuid();
      case _ElementType.horizontalVerticalTransformationStep:
        return getValueAsHorizontalVerticalTransformationStep();
      case _ElementType.idInfo:
        return getValueAsIdInfo();
      case _ElementType.identifyGraphicsOverlayResult:
        return getValueAsIdentifyGraphicsOverlayResult();
      case _ElementType.identifyLayerResult:
        return getValueAsIdentifyLayerResult();
      case _ElementType.image:
        return getValueAsArcGISImage();
      case _ElementType.incident:
        return getValueAsIncident();
      case _ElementType.int16:
        return getValueAsInt16();
      case _ElementType.int32:
        return getValueAsInt32();
      case _ElementType.int64:
        return getValueAsInt64();
      case _ElementType.int8:
        return getValueAsInt8();
      case _ElementType.itemResourceCache:
        return getValueAsItemResourceCache();
      case _ElementType.job:
        return getValueAsJob();
      case _ElementType.jobMessage:
        return getValueAsJobMessage();
      case _ElementType.layer:
        return getValueAsLayer();
      case _ElementType.legendInfo:
        return getValueAsLegendInfo();
      case _ElementType.levelOfDetail:
        return getValueAsLevelOfDetail();
      case _ElementType.licenseInfo:
        return getValueAsLicenseInfo();
      case _ElementType.licenseStatus:
        return getValueAsLicenseStatus();
      case _ElementType.localFeatureEdit:
        return getValueAsLocalFeatureEdit();
      case _ElementType.localFeatureEditsResult:
        return getValueAsLocalFeatureEditsResult();
      case _ElementType.location:
        return getValueAsArcGISLocation();
      case _ElementType.locatorAttribute:
        return getValueAsLocatorAttribute();
      case _ElementType.oauthApplicationCredential:
        return getValueAsOAuthApplicationCredential();
      case _ElementType.oauthApplicationTokenInfo:
        return getValueAsOAuthApplicationTokenInfo();
      case _ElementType.oauthUserCredential:
        return getValueAsOAuthUserCredential();
      case _ElementType.oauthUserTokenInfo:
        return getValueAsOAuthUserTokenInfo();
      case _ElementType.offlineCapability:
        return getValueAsOfflineCapability();
      case _ElementType.offlineMapCapabilities:
        return getValueAsOfflineMapCapabilities();
      case _ElementType.offlineMapParametersKey:
        return getValueAsOfflineMapParametersKey();
      case _ElementType.offlineMapSyncLayerResult:
        return getValueAsOfflineMapSyncLayerResult();
      case _ElementType.offlineMapSyncParameters:
        return getValueAsOfflineMapSyncParameters();
      case _ElementType.offlineMapUpdatesInfo:
        return getValueAsOfflineMapUpdatesInfo();
      case _ElementType.orderBy:
        return getValueAsOrderBy();
      case _ElementType.pointBarrier:
        return getValueAsPointBarrier();
      case _ElementType.polygonBarrier:
        return getValueAsPolygonBarrier();
      case _ElementType.polylineBarrier:
        return getValueAsPolylineBarrier();
      case _ElementType.portal:
        return getValueAsPortal();
      case _ElementType.portalItem:
        return getValueAsPortalItem();
      case _ElementType.preplannedMapArea:
        return getValueAsPreplannedMapArea();
      case _ElementType.queryParameters:
        return getValueAsQueryParameters();
      case _ElementType.relatedFeatureQueryResult:
        return getValueAsRelatedFeatureQueryResult();
      case _ElementType.relationshipConstraintViolation:
        return getValueAsRelationshipConstraintViolationType();
      case _ElementType.relationshipInfo:
        return getValueAsRelationshipInfo();
      case _ElementType.requestAttachment:
        return getValueAsRequestAttachment();
      case _ElementType.restrictionAttribute:
        return getValueAsRestrictionAttribute();
      case _ElementType.route:
        return getValueAsRoute();
      case _ElementType.routeParameters:
        return getValueAsRouteParameters();
      case _ElementType.routeResult:
        return getValueAsRouteResult();
      case _ElementType.scaleRangeDisplayFilter:
        return getValueAsScaleRangeDisplayFilter();
      case _ElementType.serviceAreaFacility:
        return getValueAsServiceAreaFacility();
      case _ElementType.serviceAreaParameters:
        return getValueAsServiceAreaParameters();
      case _ElementType.serviceAreaPolygon:
        return getValueAsServiceAreaPolygon();
      case _ElementType.serviceAreaPolyline:
        return getValueAsServiceAreaPolyline();
      case _ElementType.serviceAreaResult:
        return getValueAsServiceAreaResult();
      case _ElementType.serviceFeatureTable:
        return getValueAsServiceFeatureTable();
      case _ElementType.spatialReference:
        return getValueAsSpatialReference();
      case _ElementType.statisticDefinition:
        return getValueAsStatisticDefinition();
      case _ElementType.statisticRecord:
        return getValueAsStatisticRecord();
      case _ElementType.statisticsQueryParameters:
        return getValueAsStatisticsQueryParameters();
      case _ElementType.statisticsQueryResult:
        return getValueAsStatisticsQueryResult();
      case _ElementType.stop:
        return getValueAsStop();
      case _ElementType.string:
        return getValueAsString();
      case _ElementType.suggestResult:
        return getValueAsSuggestResult();
      case _ElementType.symbol:
        return getValueAsArcGISSymbol();
      case _ElementType.syncGeodatabaseParameters:
        return getValueAsSyncGeodatabaseParameters();
      case _ElementType.syncLayerOption:
        return getValueAsSyncLayerOption();
      case _ElementType.syncLayerResult:
        return getValueAsSyncLayerResult();
      case _ElementType.tileCache:
        return getValueAsTileCache();
      case _ElementType.tileImageFormat:
        return getValueAsTileImageFormat();
      case _ElementType.timeOnly:
        return getValueAsTimeOnly();
      case _ElementType.timestampOffset:
        return getValueAsTimestampOffset();
      case _ElementType.tokenCredential:
        return getValueAsTokenCredential();
      case _ElementType.tokenInfo:
        return getValueAsTokenInfo();
      case _ElementType.transportationNetworkDataset:
        return getValueAsTransportationNetworkDataset();
      case _ElementType.travelMode:
        return getValueAsTravelMode();
      case _ElementType.uint16:
        return getValueAsUInt16();
      case _ElementType.uint32:
        return getValueAsUInt32();
      case _ElementType.uint64:
        return getValueAsUInt64();
      case _ElementType.uint8:
        return getValueAsUInt8();
      case _ElementType.uniqueValue:
        return getValueAsUniqueValue();
      case _ElementType.vector:
        return getValueAsVector();
      case _ElementType.vectorTileCache:
        return getValueAsVectorTileCache();
      default:
        return null;
    }
  }

  int? getValueAsInt() {
    return getDartValue() as int;
  }

  ArcGISMapImageLayer? getValueAsArcGISMapImageLayer() {
    return getDartValue() as ArcGISMapImageLayer;
  }

  ArcGISMapImageSublayer? getValueAsArcGISMapImageSublayer() {
    return getDartValue() as ArcGISMapImageSublayer;
  }

  ArcGISPoint? getValueAsArcGISPoint() {
    return getDartValue() as ArcGISPoint;
  }

  ArcGISTiledLayer? getValueAsArcGISTiledLayer() {
    return getDartValue() as ArcGISTiledLayer;
  }

  ArcGISVectorTiledLayer? getValueAsArcGISVectorTiledLayer() {
    return getDartValue() as ArcGISVectorTiledLayer;
  }

  CodedValueDomain? getValueAsCodedValueDomain() {
    return getDartValue() as CodedValueDomain;
  }

  CompositeSymbol? getValueAsCompositeSymbol() {
    return getDartValue() as CompositeSymbol;
  }

  DownloadPreplannedOfflineMapJob? getValueAsDownloadPreplannedOfflineMapJob() {
    return getDartValue() as DownloadPreplannedOfflineMapJob;
  }

  Envelope? getValueAsEnvelope() {
    return getDartValue() as Envelope;
  }

  EstimateTileCacheSizeJob? getValueAsEstimateTileCacheSizeJob() {
    return getDartValue() as EstimateTileCacheSizeJob;
  }

  ExportTileCacheJob? getValueAsExportTileCacheJob() {
    return getDartValue() as ExportTileCacheJob;
  }

  ExportVectorTilesJob? getValueAsExportVectorTilesJob() {
    return getDartValue() as ExportVectorTilesJob;
  }

  FeatureCollectionLayer? getValueAsFeatureCollectionLayer() {
    return getDartValue() as FeatureCollectionLayer;
  }

  FeatureLayer? getValueAsFeatureLayer() {
    return getDartValue() as FeatureLayer;
  }

  FeatureServiceLayerIdInfo? getValueAsFeatureServiceLayerIdInfo() {
    return getDartValue() as FeatureServiceLayerIdInfo;
  }

  FillSymbol? getValueAsFillSymbol() {
    return getDartValue() as FillSymbol;
  }

  GenerateGeodatabaseJob? getValueAsGenerateGeodatabaseJob() {
    return getDartValue() as GenerateGeodatabaseJob;
  }

  GenerateOfflineMapJob? getValueAsGenerateOfflineMapJob() {
    return getDartValue() as GenerateOfflineMapJob;
  }

  GeographicTransformation? getValueAsGeographicTransformation() {
    return getDartValue() as GeographicTransformation;
  }

  HorizontalVerticalTransformation?
      getValueAsHorizontalVerticalTransformation() {
    return getDartValue() as HorizontalVerticalTransformation;
  }

  ImageAdjustmentLayer? getValueAsImageAdjustmentLayer() {
    return getDartValue() as ImageAdjustmentLayer;
  }

  ImageTiledLayer? getValueAsImageTiledLayer() {
    return getDartValue() as ImageTiledLayer;
  }

  InheritedDomain? getValueAsInheritedDomain() {
    return getDartValue() as InheritedDomain;
  }

  LineSymbol? getValueAsLineSymbol() {
    return getDartValue() as LineSymbol;
  }

  MapServiceLayerIdInfo? getValueAsMapServiceLayerIdInfo() {
    return getDartValue() as MapServiceLayerIdInfo;
  }

  MarkerSymbol? getValueAsMarkerSymbol() {
    return getDartValue() as MarkerSymbol;
  }

  Multipart? getValueAsMultipart() {
    return getDartValue() as Multipart;
  }

  Multipoint? getValueAsMultipoint() {
    return getDartValue() as Multipoint;
  }

  OfflineMapSyncJob? getValueAsOfflineMapSyncJob() {
    return getDartValue() as OfflineMapSyncJob;
  }

  PictureFillSymbol? getValueAsPictureFillSymbol() {
    return getDartValue() as PictureFillSymbol;
  }

  PictureMarkerSymbol? getValueAsPictureMarkerSymbol() {
    return getDartValue() as PictureMarkerSymbol;
  }

  Polygon? getValueAsPolygon() {
    return getDartValue() as Polygon;
  }

  Polyline? getValueAsPolyline() {
    return getDartValue() as Polyline;
  }

  PregeneratedTokenCredential? getValueAsPregeneratedTokenCredential() {
    return getDartValue() as PregeneratedTokenCredential;
  }

  RangeDomain? getValueAsRangeDomain() {
    return getDartValue() as RangeDomain;
  }

  SimpleFillSymbol? getValueAsSimpleFillSymbol() {
    return getDartValue() as SimpleFillSymbol;
  }

  SimpleLineSymbol? getValueAsSimpleLineSymbol() {
    return getDartValue() as SimpleLineSymbol;
  }

  SimpleMarkerSymbol? getValueAsSimpleMarkerSymbol() {
    return getDartValue() as SimpleMarkerSymbol;
  }

  SyncGeodatabaseJob? getValueAsSyncGeodatabaseJob() {
    return getDartValue() as SyncGeodatabaseJob;
  }

  TextSymbol? getValueAsTextSymbol() {
    return getDartValue() as TextSymbol;
  }
}

/// A class that holds a reference to an object or value.
///
/// Holds a reference to an [_Element] whose value can be read and written.
/// Should be passed as \[in,out] parameter to resources callbacks.
final class _ElementReference implements ffi.Finalizable {
  final RT_ElementReferenceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ElementReference_destroy.cast());

  static _ElementReference? _fromHandle(RT_ElementReferenceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ElementReference._withHandle(handle);
  }

  _ElementReference._withHandle(RT_ElementReferenceHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ElementReference_created(_handle);
    }
  }

  /// Gets value of the element reference.
  ///
  /// Return Value: An [_Element]
  _Element getValue() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ElementReference_getValue(_handle, errorHandler);
    });
    return _Element._fromHandle(objectHandle)!;
  }

  /// Sets value of the element reference.
  ///
  /// Parameters:
  /// - `value` — The element reference value.
  void setValue(_Element value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ElementReference_setValue(
          _handle, value._handle, errorHandler);
    });
  }
}

/// The different types that an element can hold.
///
/// Each of the different supported element types. Can get the type by calling
/// [_Element.objectType].
enum _ElementType {
  /// An [ArcGISFeature] object.
  arcGISFeature,

  /// An [ArcGISFeatureServiceInfo] object.
  arcGISFeatureServiceInfo,

  /// Deprecated. For internal use within C-API only.
  arcGISMapServiceInfo,

  /// An ArcGIS sublayer object.
  arcGISSublayer,

  /// An array.
  array,

  /// An attachment value.
  attachment,

  /// A network analyst attribute parameter value.
  attributeParameterValue,

  /// A [Basemap] object.
  basemap,

  /// A bookmark object.
  bookmark,

  /// A boolean value.
  bool,

  /// A buffer value.
  buffer,

  /// A class break object.
  classBreak,

  /// A [CodedValue] object.
  codedValue,

  /// A class closest facility parameters.
  closestFacilityParameters,

  /// A class closest facility result.
  closestFacilityResult,

  /// A class closest facility route.
  closestFacilityRoute,

  /// A class closest facility task.
  closestFacilityTask,

  /// A color object.
  color,

  /// A network analyst cost attribute.
  costAttribute,

  /// A date time value.
  dateTime,

  /// Element holds a dictionary.
  dictionary,

  /// A network analyst direction event.
  directionEvent,

  /// A network analyst direction maneuver.
  directionManeuver,

  /// A network analyst direction message.
  directionMessage,

  /// A `DistanceSymbolRange` object.
  distanceSymbolRange,

  /// A domain object.
  domain,

  /// The result of an edit to an attachment.
  editResult,

  /// An `ElevationSource` object.
  elevationSource,

  /// An [EstimateTileCacheSizeResult] object.
  estimateTileCacheSizeResult,

  /// An [ExportTileCacheTask] object.
  exportTileCacheTask,

  /// An [ExportTileCacheParameters] object.
  exportTileCacheParameters,

  /// An [ExtensionLicense] object.
  extensionLicense,

  /// A closest facility.
  facility,

  /// A feature object.
  feature,

  /// A feature collection object.
  featureCollection,

  /// A feature collection table object.
  featureCollectionTable,

  /// The result of an edit to a feature.
  featureEditResult,

  /// A feature query result object.
  featureQueryResult,

  /// A [FeatureTable] object.
  featureTable,

  /// A feature template object.
  featureTemplate,

  /// A feature type object.
  featureType,

  /// A field value.
  field,

  /// A 32 bit float value.
  float32,

  /// A 64 bit float value.
  float64,

  /// A [GenerateGeodatabaseParameters] object.
  generateGeodatabaseParameters,

  /// Options for a layer when generating a geodatabase using the sync task.
  generateLayerOption,

  /// A result of geocode operation.
  geocodeResult,

  /// A geodatabase.
  geodatabase,

  /// A geodatabase feature table.
  geodatabaseFeatureTable,

  /// A [GeodatabaseSyncTask] object.
  geodatabaseSyncTask,

  /// A geometry value.
  geometry,

  /// A `GeoprocessingFeatureSet` object.
  geoprocessingFeatureSet,

  /// A `GeoprocessingParameter` object.
  geoprocessingParameter,

  /// A graphic object.
  graphic,

  /// A graphics overlay object.
  graphicsOverlay,

  /// A GUID value.
  guid,

  /// An object containing the results of an identify on a graphics overlay.
  identifyGraphicsOverlayResult,

  /// An object containing the results of an identify on a layer.
  identifyLayerResult,

  /// An [IdInfo] object.
  idInfo,

  /// An image object.
  image,

  /// A closest facility incident.
  incident,

  /// A 16-bit integer value.
  int16,

  /// A 32-bit integer value.
  int32,

  /// A 64-bit integer value.
  int64,

  /// A 8-bit integer value.
  int8,

  /// A [Job] object.
  job,

  /// A job message.
  jobMessage,

  /// A KML node object.
  kmlNode,

  /// A KML geometry object.
  kmlGeometry,

  /// A label class object.
  labelingInfo,

  /// A layer object.
  layer,

  /// A legend info object.
  legendInfo,

  /// A tile info level of detail (LOD).
  levelOfDetail,

  /// A [LoadableImage] object. For internal use within C-API only.
  loadableImage,

  /// A [LocatorAttribute] object.
  locatorAttribute,

  /// A [LocatorTask] object.
  locatorTask,

  /// An [ArcGISMap] object.
  arcGISMap,

  /// A `MobileBasemapLayer` object.
  mobileBasemapLayer,

  /// A [MobileMapPackage] object.
  mobileMapPackage,

  /// A `ModelSceneSymbol` object.
  modelSceneSymbol,

  /// An order by enum value.
  orderBy,

  /// A [PictureMarkerSymbol] object.
  pictureMarkerSymbol,

  /// A network analyst point barrier.
  pointBarrier,

  /// A network analyst polygon barrier.
  polygonBarrier,

  /// A network analyst polyline barrier.
  polylineBarrier,

  /// A `Popup` object.
  popup,

  /// A popup field representing how a geo-element's attribute (field) should be
  /// displayed in a pop-up.
  popupField,

  /// A popup media representing the media that is displayed in a pop-up for a
  /// geo-element.
  popupMedia,

  /// A [Portal] object. For internal use within C-API only.
  portal,

  /// A [PortalItem] object. For internal use within C-API only.
  portalItem,

  /// A `Raster` object. For internal use within C-API only.
  raster,

  /// An attachment on a request object.
  requestAttachment,

  /// A network analyst restriction attribute.
  restrictionAttribute,

  /// A network analyst route.
  route,

  /// A network analyst route parameters.
  routeParameters,

  /// A network analyst route result.
  routeResult,

  /// A [RouteTask] object.
  routeTask,

  /// An `ArcGISScene` object.
  arcGISScene,

  /// A service area facility.
  serviceAreaFacility,

  /// A service area parameters.
  serviceAreaParameters,

  /// A service area polygon.
  serviceAreaPolygon,

  /// A service area polyline.
  serviceAreaPolyline,

  /// A service area result.
  serviceAreaResult,

  /// A service area task.
  serviceAreaTask,

  /// A network analyst stop.
  stop,

  /// A string value.
  string,

  /// A result of suggest operation.
  suggestResult,

  /// A `Surface` object.
  surface,

  /// A symbol object.
  symbol,

  /// A `SymbolStyle` object.
  symbolStyle,

  /// A `SymbolStyleSearchParameters` object.
  symbolStyleSearchParameters,

  /// A `SymbolStyleSearchResult` object.
  symbolStyleSearchResult,

  /// A [SyncGeodatabaseParameters] object.
  syncGeodatabaseParameters,

  /// A [SyncLayerOption] object.
  syncLayerOption,

  /// A [SyncLayerResult] object.
  syncLayerResult,

  /// A [TileCache] object.
  tileCache,

  /// A [TransportationNetworkDataset] object.
  transportationNetworkDataset,

  /// A travel mode.
  travelMode,

  /// An unsigned 16-bit integer value.
  uint16,

  /// An unsigned 32-bit integer value.
  uint32,

  /// An unsigned 64-bit integer value.
  uint64,

  /// An unsigned 8-bit integer value.
  uint8,

  /// A unique value object.
  uniqueValue,

  /// An variant type.
  variant,

  /// Element holds a vector.
  vector,

  /// A [VectorTileSourceInfo] object. For internal use within C-API only.
  vectorTileSourceInfo,

  /// A `GeoprocessingParameterInfo` object.
  geoprocessingParameterInfo,

  /// A `GeoprocessingTask` object.
  geoprocessingTask,

  /// A `GeoprocessingParameters` object.
  geoprocessingParameters,

  /// A `WmtsLayerInfo` object.
  wmtsLayerInfo,

  /// A `WmtsServiceInfo` object.
  wmtsServiceInfo,

  /// A `WmtsTileMatrix` object.
  wmtsTileMatrix,

  /// A `WmtsTileMatrixSet` object.
  wmtsTileMatrixSet,

  /// A [TileImageFormat] enum value.
  tileImageFormat,

  /// An [OfflineMapTask] object.
  offlineMapTask,

  /// An [ExportVectorTilesTask] object.
  exportVectorTilesTask,

  /// An [ExportVectorTilesParameters] object.
  exportVectorTilesParameters,

  /// An [ArcGISFeatureTable] object.
  arcGISFeatureTable,

  /// A [RelationshipInfo] object.
  relationshipInfo,

  /// A [RelatedFeatureQueryResult] object.
  relatedFeatureQueryResult,

  /// A `WmtsService` object.
  wmtsService,

  /// An [ArcGISException] object.
  error,

  /// A [ServiceFeatureTable] object.
  serviceFeatureTable,

  /// A [GenerateOfflineMapParameters] object.
  generateOfflineMapParameters,

  /// A [PictureFillSymbol] object.
  pictureFillSymbol,

  /// An [OfflineCapability] object.
  offlineCapability,

  /// An [OfflineCapability] object.
  offlineMapCapabilities,

  /// A `RenderingRuleInfo` object.
  renderingRuleInfo,

  /// A `LabelDefinition` object.
  labelDefinition,

  /// A [RelationshipConstraintViolationType] value.
  relationshipConstraintViolation,

  /// An [OfflineMapSyncTask] object.
  offlineMapSyncTask,

  /// An [OfflineMapSyncLayerResult] object.
  offlineMapSyncLayerResult,

  /// A `PopupRelatedFeaturesSortOrder` object.
  popupRelatedFeaturesSortOrder,

  /// A [StatisticDefinition] object.
  statisticDefinition,

  /// A [StatisticsQueryResult] object.
  statisticsQueryResult,

  /// A [StatisticRecord] object.
  statisticRecord,

  /// A `KmlDataset` object.
  kmlDataset,

  /// A [PreplannedMapArea] object.
  preplannedMapArea,

  /// A `WmsService` object.
  wmsService,

  /// A `WmsServiceInfo` object.
  wmsServiceInfo,

  /// A `WmsLayerInfo` object.
  wmsLayerInfo,

  /// A [MapServiceImageFormat] enum value.
  arcGISMapServiceImageFormat,

  /// A [SpatialReference] object.
  spatialReference,

  /// A [GeoPackage] object.
  geopackage,

  /// A [GeoPackageFeatureTable] object.
  geopackageFeatureTable,

  /// A `GeoPackageRaster` object.
  geopackageRaster,

  /// A `WmsSublayer` object.
  wmsSublayer,

  /// A [VectorTileCache] object.
  vectorTileCache,

  /// An `Analysis` object.
  analysis,

  /// An `AnalysisOverlay` object.
  analysisOverlay,

  /// An [ItemResourceCache] object.
  itemResourceCache,

  /// A `WmsFeature` object.
  wmsFeature,

  /// A `NmeaSatelliteInfo` object.
  nmeaSatelliteInfo,

  /// A symbol layer object.
  symbolLayer,

  /// A vector marker symbol element object.
  vectorMarkerSymbolElement,

  /// A geometric effect object.
  geometricEffect,

  /// A picture marker symbol layer object.
  pictureMarkerSymbolLayer,

  /// A picture fill symbol layer object.
  pictureFillSymbolLayer,

  /// A feature subtype object.
  featureSubtype,

  /// A `LabelStackSeparator` object.
  labelStackSeparator,

  /// A `WfsService` object.
  wfsService,

  /// A `WfsLayerInfo` object.
  wfsLayerInfo,

  /// An [OfflineMapParametersKey] object.
  offlineMapParametersKey,

  /// A [GenerateOfflineMapParameterOverrides] object.
  generateOfflineMapParameterOverrides,

  /// A [QueryParameters] object.
  queryParameters,

  /// A [StatisticsQueryParameters] object.
  statisticsQueryParameters,

  /// A `RouteTracker` object.
  routeTracker,

  /// A `WfsFeatureTable` object.
  wfsFeatureTable,

  /// A [DownloadPreplannedOfflineMapParameters] object.
  downloadPreplannedOfflineMapParameters,

  /// An `AnnotationSublayer` object.
  annotationSublayer,

  /// An [OfflineMapSyncParameters] object.
  offlineMapSyncParameters,

  /// An [OfflineMapUpdatesInfo] object.
  offlineMapUpdatesInfo,

  /// A `DictionarySymbolStyleConfiguration` object.
  dictionarySymbolStyleConfiguration,

  /// An [ArcGISLocation] object.
  location,

  /// An `ImageOverlay` object.
  imageFrame,

  /// An `ImageOverlay` object.
  imageOverlay,

  /// A [GeodatabaseDeltaInfo].
  geodatabaseDeltaInfo,

  /// A date only value.
  dateOnly,

  /// A time only value.
  timeOnly,

  /// A timestamp offset value.
  timestampOffset,

  /// A KML simple field object.
  kmlSimpleField,

  /// A KML schema object.
  kmlSchema,

  /// A KML schema data object.
  kmlSchemaData,

  /// An `OgcFeatureService` object.
  ogcFeatureService,

  /// An `OgcFeatureCollectionInfo` object.
  ogcFeatureCollectionInfo,

  /// An `OgcFeatureCollectionTable` object.
  ogcFeatureCollectionTable,

  /// A [DatumTransformation] object.
  datumTransformation,

  /// A [GeographicTransformationStep] object.
  geographicTransformationStep,

  /// A [HorizontalVerticalTransformationStep] object.
  horizontalVerticalTransformationStep,

  /// An `EncCell` object.
  encCell,

  /// An `EncDataset` object.
  encDataset,

  /// An `EncExchangeSet` object.
  encExchangeSet,

  /// An `EncFeature` object.
  encFeature,

  /// A `MobileScenePackage` object.
  mobileScenePackage,

  /// A popup expression defining an arcade expression on a popup.
  popupExpression,

  /// An `UtilityNetwork` object.
  utilityNetwork,

  /// An `UtilityAssetType` object.
  utilityAssetType,

  /// An `UtilityAssetGroup` object.
  utilityAssetGroup,

  /// An `UtilityCategory` object.
  utilityCategory,

  /// An `UtilityTerminal` object.
  utilityTerminal,

  /// An `UtilityNetworkAttribute` object.
  utilityNetworkAttribute,

  /// An `UtilityNetworkSource` object.
  utilityNetworkSource,

  /// An `UtilityElement` object.
  utilityElement,

  /// An `UtilityTraceResultType` value.
  utilityTraceResultType,

  /// A `TrackingStatus` object.
  trackingStatus,

  /// An `UtilityTraceResult` value.
  utilityTraceResult,

  /// An `UtilityDomainNetwork` object.
  utilityDomainNetwork,

  /// An `UtilityTerminalConfiguration` object.
  utilityTerminalConfiguration,

  /// An `UtilityTier` object.
  utilityTier,

  /// An `UtilityTierGroup` object.
  utilityTierGroup,

  /// An `UtilityPropagator` object.
  utilityPropagator,

  /// A `SubtypeSublayer` object.
  subtypeSublayer,

  /// An `UtilityAssociation` object.
  utilityAssociation,

  /// An `UtilityTraceFunctionBarrier` object.
  utilityTraceFunctionBarrier,

  /// A [LicenseInfo] object.
  licenseInfo,

  /// A `RasterCell` object.
  rasterCell,

  /// An `UtilityTerminalPath` object.
  utilityTerminalPath,

  /// An `UtilityTerminalConfigurationPath` object.
  utilityTerminalConfigurationPath,

  /// The element is currently not holding any value.
  none,

  /// An object that represents the result of an attempt to evaluate a popup
  /// expression.
  popupExpressionEvaluation,

  /// An `UtilityTraceFunction` object.
  utilityTraceFunction,

  /// An `UtilityFunctionTraceResult` object.
  utilityFunctionTraceResult,

  /// An `UtilityTraceFunctionOutput` object.
  utilityTraceFunctionOutput,

  /// A `ServiceVersionInfo` object.
  serviceVersionInfo,

  /// An `UtilityGeometryTraceResult` object.
  utilityGeometryTraceResult,

  /// A [FeatureTableEditResult] object.
  featureTableEditResult,

  /// An `UtilityNamedTraceConfiguration` object.
  utilityNamedTraceConfiguration,

  /// A `_WifiReading` object.
  wifiReading,

  /// A [LocalFeatureEdit] object.
  localFeatureEdit,

  /// A `FloorFacility` object.
  floorFacility,

  /// A `FloorLevel` object.
  floorLevel,

  /// A `FloorSite` object.
  floorSite,

  /// A [LocalFeatureEditsResult] object.
  localFeatureEditsResult,

  /// A `Geotrigger`.
  geotrigger,

  /// A [DisplayFilter] object.
  displayFilter,

  /// A [ScaleRangeDisplayFilter] object.
  scaleRangeDisplayFilter,

  /// A `Contingency` object.
  contingency,

  /// A `ContingencyConstraintViolation` object.
  contingencyConstraintViolation,

  /// A `ContingentValue` object.
  contingentValue,

  /// A `FieldGroup` object.
  fieldGroup,

  /// An `ArcadeEvaluationResult` object.
  arcadeEvaluationResult,

  /// A `ServiceGeodatabase` object.
  serviceGeodatabase,

  /// A `PopupElement` object.
  popupElement,

  /// A [FieldDescription] object.
  fieldDescription,

  /// A [CodedValueDescription] object.
  codedValueDescription,

  /// A `DynamicEntityObservation` object.
  dynamicEntityObservation,

  /// A `PopupAttachment` object.
  popupAttachment,

  /// A [LicenseStatus] value.
  licenseStatus,

  /// An [_ArcGISTokenInfo] object.
  arcGISTokenInfo,

  /// An [_ArcGISTokenInfo] object.
  tokenInfo,

  /// A [TokenCredential] object.
  tokenCredential,

  /// A `ChartImage` object.
  chartImage,

  /// A [_ClientResponse] object.
  clientResponse,

  /// A [_ClientReference] object.
  clientReference,

  /// An [ArcGISCredential] object.
  arcGISCredential,

  /// An [OAuthUserTokenInfo] object.
  oauthUserTokenInfo,

  /// An [OAuthUserCredential] object.
  oauthUserCredential,

  /// A `DynamicEntity` object.
  dynamicEntity,

  /// An `UtilityRule` object.
  utilityRule,

  /// An [OAuthApplicationTokenInfo] object.
  oauthApplicationTokenInfo,

  /// An [OAuthApplicationCredential] object.
  oauthApplicationCredential,

  /// An `AggregateField` object.
  aggregateField,

  /// An `AggregateGeoElement` object.
  aggregateGeoElement,

  /// A `FormElement` object.
  formElement,

  /// An `UtilityNetworkState` object.
  utilityNetworkState,

  /// An `AggregationFeatureReduction` object.
  aggregationFeatureReduction,

  /// A GEBuildingSceneLayerAttributeStatistics object.
  geBuildingSceneLayerAttributeStatistics,

  /// A `FormExpressionEvaluationError` object
  formExpressionEvaluationError,

  /// A `SnapSourceSettings` object.
  snapSourceSettings,

  /// A `Worldview` object.
  worldview,

  /// A `BasemapStyleInfo` object.
  basemapStyleInfo,

  /// A [BasemapStyleLanguageStrategy] object.
  basemapStyleLanguageStrategy,

  /// A `FormAttachment` object
  formAttachment,

  /// A `BasemapStyleLanguageInfo` object.
  basemapStyleLanguageInfo;

  factory _ElementType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISFeature;
      case 1:
        return arcGISFeatureServiceInfo;
      case 2:
        return arcGISMapServiceInfo;
      case 3:
        return arcGISSublayer;
      case 4:
        return array;
      case 5:
        return attachment;
      case 6:
        return attributeParameterValue;
      case 7:
        return basemap;
      case 8:
        return bookmark;
      case 9:
        return bool;
      case 10:
        return buffer;
      case 11:
        return classBreak;
      case 12:
        return codedValue;
      case 13:
        return closestFacilityParameters;
      case 14:
        return closestFacilityResult;
      case 15:
        return closestFacilityRoute;
      case 16:
        return closestFacilityTask;
      case 17:
        return color;
      case 18:
        return costAttribute;
      case 19:
        return dateTime;
      case 20:
        return dictionary;
      case 21:
        return directionEvent;
      case 22:
        return directionManeuver;
      case 23:
        return directionMessage;
      case 24:
        return distanceSymbolRange;
      case 25:
        return domain;
      case 26:
        return editResult;
      case 27:
        return elevationSource;
      case 28:
        return estimateTileCacheSizeResult;
      case 29:
        return exportTileCacheTask;
      case 30:
        return exportTileCacheParameters;
      case 31:
        return extensionLicense;
      case 32:
        return facility;
      case 33:
        return feature;
      case 34:
        return featureCollection;
      case 35:
        return featureCollectionTable;
      case 36:
        return featureEditResult;
      case 37:
        return featureQueryResult;
      case 38:
        return featureTable;
      case 39:
        return featureTemplate;
      case 40:
        return featureType;
      case 41:
        return field;
      case 42:
        return float32;
      case 43:
        return float64;
      case 44:
        return generateGeodatabaseParameters;
      case 45:
        return generateLayerOption;
      case 46:
        return geocodeResult;
      case 47:
        return geodatabase;
      case 48:
        return geodatabaseFeatureTable;
      case 49:
        return geodatabaseSyncTask;
      case 50:
        return geometry;
      case 51:
        return geoprocessingFeatureSet;
      case 52:
        return geoprocessingParameter;
      case 53:
        return graphic;
      case 54:
        return graphicsOverlay;
      case 55:
        return guid;
      case 56:
        return identifyGraphicsOverlayResult;
      case 57:
        return identifyLayerResult;
      case 58:
        return idInfo;
      case 59:
        return image;
      case 60:
        return incident;
      case 61:
        return int16;
      case 62:
        return int32;
      case 63:
        return int64;
      case 64:
        return int8;
      case 65:
        return job;
      case 66:
        return jobMessage;
      case 67:
        return kmlNode;
      case 68:
        return kmlGeometry;
      case 69:
        return labelingInfo;
      case 70:
        return layer;
      case 71:
        return legendInfo;
      case 72:
        return levelOfDetail;
      case 73:
        return loadableImage;
      case 74:
        return locatorAttribute;
      case 75:
        return locatorTask;
      case 76:
        return arcGISMap;
      case 77:
        return mobileBasemapLayer;
      case 78:
        return mobileMapPackage;
      case 79:
        return modelSceneSymbol;
      case 80:
        return orderBy;
      case 81:
        return pictureMarkerSymbol;
      case 82:
        return pointBarrier;
      case 83:
        return polygonBarrier;
      case 84:
        return polylineBarrier;
      case 85:
        return popup;
      case 86:
        return popupField;
      case 87:
        return popupMedia;
      case 88:
        return portal;
      case 89:
        return portalItem;
      case 90:
        return raster;
      case 91:
        return requestAttachment;
      case 92:
        return restrictionAttribute;
      case 93:
        return route;
      case 94:
        return routeParameters;
      case 95:
        return routeResult;
      case 96:
        return routeTask;
      case 97:
        return arcGISScene;
      case 98:
        return serviceAreaFacility;
      case 99:
        return serviceAreaParameters;
      case 100:
        return serviceAreaPolygon;
      case 101:
        return serviceAreaPolyline;
      case 102:
        return serviceAreaResult;
      case 103:
        return serviceAreaTask;
      case 104:
        return stop;
      case 105:
        return string;
      case 106:
        return suggestResult;
      case 107:
        return surface;
      case 108:
        return symbol;
      case 109:
        return symbolStyle;
      case 110:
        return symbolStyleSearchParameters;
      case 111:
        return symbolStyleSearchResult;
      case 112:
        return syncGeodatabaseParameters;
      case 113:
        return syncLayerOption;
      case 114:
        return syncLayerResult;
      case 115:
        return tileCache;
      case 116:
        return transportationNetworkDataset;
      case 117:
        return travelMode;
      case 118:
        return uint16;
      case 119:
        return uint32;
      case 120:
        return uint64;
      case 121:
        return uint8;
      case 122:
        return uniqueValue;
      case 123:
        return variant;
      case 124:
        return vector;
      case 125:
        return vectorTileSourceInfo;
      case 126:
        return geoprocessingParameterInfo;
      case 127:
        return geoprocessingTask;
      case 128:
        return geoprocessingParameters;
      case 129:
        return wmtsLayerInfo;
      case 130:
        return wmtsServiceInfo;
      case 131:
        return wmtsTileMatrix;
      case 132:
        return wmtsTileMatrixSet;
      case 133:
        return tileImageFormat;
      case 134:
        return offlineMapTask;
      case 135:
        return exportVectorTilesTask;
      case 136:
        return exportVectorTilesParameters;
      case 137:
        return arcGISFeatureTable;
      case 138:
        return relationshipInfo;
      case 139:
        return relatedFeatureQueryResult;
      case 140:
        return wmtsService;
      case 141:
        return error;
      case 142:
        return serviceFeatureTable;
      case 143:
        return generateOfflineMapParameters;
      case 145:
        return pictureFillSymbol;
      case 146:
        return offlineCapability;
      case 147:
        return offlineMapCapabilities;
      case 148:
        return renderingRuleInfo;
      case 149:
        return labelDefinition;
      case 150:
        return relationshipConstraintViolation;
      case 151:
        return offlineMapSyncTask;
      case 152:
        return offlineMapSyncLayerResult;
      case 153:
        return popupRelatedFeaturesSortOrder;
      case 154:
        return statisticDefinition;
      case 155:
        return statisticsQueryResult;
      case 156:
        return statisticRecord;
      case 157:
        return kmlDataset;
      case 158:
        return preplannedMapArea;
      case 159:
        return wmsService;
      case 160:
        return wmsServiceInfo;
      case 161:
        return wmsLayerInfo;
      case 162:
        return arcGISMapServiceImageFormat;
      case 163:
        return spatialReference;
      case 164:
        return geopackage;
      case 165:
        return geopackageFeatureTable;
      case 166:
        return geopackageRaster;
      case 167:
        return wmsSublayer;
      case 168:
        return vectorTileCache;
      case 169:
        return analysis;
      case 170:
        return analysisOverlay;
      case 171:
        return itemResourceCache;
      case 172:
        return wmsFeature;
      case 173:
        return nmeaSatelliteInfo;
      case 174:
        return symbolLayer;
      case 175:
        return vectorMarkerSymbolElement;
      case 176:
        return geometricEffect;
      case 177:
        return pictureMarkerSymbolLayer;
      case 178:
        return pictureFillSymbolLayer;
      case 179:
        return featureSubtype;
      case 180:
        return labelStackSeparator;
      case 181:
        return wfsService;
      case 182:
        return wfsLayerInfo;
      case 183:
        return offlineMapParametersKey;
      case 184:
        return generateOfflineMapParameterOverrides;
      case 186:
        return queryParameters;
      case 187:
        return statisticsQueryParameters;
      case 188:
        return routeTracker;
      case 189:
        return wfsFeatureTable;
      case 190:
        return downloadPreplannedOfflineMapParameters;
      case 192:
        return annotationSublayer;
      case 193:
        return offlineMapSyncParameters;
      case 194:
        return offlineMapUpdatesInfo;
      case 195:
        return dictionarySymbolStyleConfiguration;
      case 197:
        return location;
      case 198:
        return imageFrame;
      case 199:
        return imageOverlay;
      case 200:
        return geodatabaseDeltaInfo;
      case 201:
        return dateOnly;
      case 202:
        return timeOnly;
      case 203:
        return timestampOffset;
      case 204:
        return kmlSimpleField;
      case 205:
        return kmlSchema;
      case 206:
        return kmlSchemaData;
      case 300:
        return ogcFeatureService;
      case 301:
        return ogcFeatureCollectionInfo;
      case 302:
        return ogcFeatureCollectionTable;
      case 500:
        return datumTransformation;
      case 501:
        return geographicTransformationStep;
      case 502:
        return horizontalVerticalTransformationStep;
      case 1000:
        return encCell;
      case 1001:
        return encDataset;
      case 1002:
        return encExchangeSet;
      case 1003:
        return encFeature;
      case 1004:
        return mobileScenePackage;
      case 1005:
        return popupExpression;
      case 1006:
        return utilityNetwork;
      case 1007:
        return utilityAssetType;
      case 1008:
        return utilityAssetGroup;
      case 1009:
        return utilityCategory;
      case 1010:
        return utilityTerminal;
      case 1011:
        return utilityNetworkAttribute;
      case 1012:
        return utilityNetworkSource;
      case 1013:
        return utilityElement;
      case 1014:
        return utilityTraceResultType;
      case 1015:
        return trackingStatus;
      case 1016:
        return utilityTraceResult;
      case 1017:
        return utilityDomainNetwork;
      case 1018:
        return utilityTerminalConfiguration;
      case 1019:
        return utilityTier;
      case 1020:
        return utilityTierGroup;
      case 1021:
        return utilityPropagator;
      case 1022:
        return subtypeSublayer;
      case 1023:
        return utilityAssociation;
      case 1024:
        return utilityTraceFunctionBarrier;
      case 1025:
        return licenseInfo;
      case 1026:
        return rasterCell;
      case 1027:
        return utilityTerminalPath;
      case 1028:
        return utilityTerminalConfigurationPath;
      case -1:
        return none;
      case 1029:
        return popupExpressionEvaluation;
      case 1030:
        return utilityTraceFunction;
      case 1031:
        return utilityFunctionTraceResult;
      case 1032:
        return utilityTraceFunctionOutput;
      case 1033:
        return serviceVersionInfo;
      case 1034:
        return utilityGeometryTraceResult;
      case 1035:
        return featureTableEditResult;
      case 1037:
        return utilityNamedTraceConfiguration;
      case 1038:
        return wifiReading;
      case 1039:
        return localFeatureEdit;
      case 1041:
        return floorFacility;
      case 1042:
        return floorLevel;
      case 1043:
        return floorSite;
      case 1047:
        return localFeatureEditsResult;
      case 1048:
        return geotrigger;
      case 1049:
        return displayFilter;
      case 1050:
        return scaleRangeDisplayFilter;
      case 1052:
        return contingency;
      case 1053:
        return contingencyConstraintViolation;
      case 1054:
        return contingentValue;
      case 1055:
        return fieldGroup;
      case 1056:
        return arcadeEvaluationResult;
      case 1058:
        return serviceGeodatabase;
      case 1060:
        return popupElement;
      case 1061:
        return fieldDescription;
      case 1062:
        return codedValueDescription;
      case 1063:
        return dynamicEntityObservation;
      case 1064:
        return popupAttachment;
      case 1065:
        return licenseStatus;
      case 1067:
        return arcGISTokenInfo;
      case 1068:
        return tokenInfo;
      case 1069:
        return tokenCredential;
      case 1070:
        return chartImage;
      case 1071:
        return clientResponse;
      case 1072:
        return clientReference;
      case 1073:
        return arcGISCredential;
      case 1074:
        return oauthUserTokenInfo;
      case 1075:
        return oauthUserCredential;
      case 1076:
        return dynamicEntity;
      case 1077:
        return utilityRule;
      case 1080:
        return oauthApplicationTokenInfo;
      case 1081:
        return oauthApplicationCredential;
      case 1082:
        return aggregateField;
      case 1083:
        return aggregateGeoElement;
      case 1084:
        return formElement;
      case 1085:
        return utilityNetworkState;
      case 1086:
        return aggregationFeatureReduction;
      case 1087:
        return geBuildingSceneLayerAttributeStatistics;
      case 1088:
        return formExpressionEvaluationError;
      case 1091:
        return snapSourceSettings;
      case 1092:
        return worldview;
      case 1093:
        return basemapStyleInfo;
      case 1094:
        return basemapStyleLanguageStrategy;
      case 1096:
        return formAttachment;
      case 1097:
        return basemapStyleLanguageInfo;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISFeature:
        return 0;
      case arcGISFeatureServiceInfo:
        return 1;
      case arcGISMapServiceInfo:
        return 2;
      case arcGISSublayer:
        return 3;
      case array:
        return 4;
      case attachment:
        return 5;
      case attributeParameterValue:
        return 6;
      case basemap:
        return 7;
      case bookmark:
        return 8;
      case bool:
        return 9;
      case buffer:
        return 10;
      case classBreak:
        return 11;
      case codedValue:
        return 12;
      case closestFacilityParameters:
        return 13;
      case closestFacilityResult:
        return 14;
      case closestFacilityRoute:
        return 15;
      case closestFacilityTask:
        return 16;
      case color:
        return 17;
      case costAttribute:
        return 18;
      case dateTime:
        return 19;
      case dictionary:
        return 20;
      case directionEvent:
        return 21;
      case directionManeuver:
        return 22;
      case directionMessage:
        return 23;
      case distanceSymbolRange:
        return 24;
      case domain:
        return 25;
      case editResult:
        return 26;
      case elevationSource:
        return 27;
      case estimateTileCacheSizeResult:
        return 28;
      case exportTileCacheTask:
        return 29;
      case exportTileCacheParameters:
        return 30;
      case extensionLicense:
        return 31;
      case facility:
        return 32;
      case feature:
        return 33;
      case featureCollection:
        return 34;
      case featureCollectionTable:
        return 35;
      case featureEditResult:
        return 36;
      case featureQueryResult:
        return 37;
      case featureTable:
        return 38;
      case featureTemplate:
        return 39;
      case featureType:
        return 40;
      case field:
        return 41;
      case float32:
        return 42;
      case float64:
        return 43;
      case generateGeodatabaseParameters:
        return 44;
      case generateLayerOption:
        return 45;
      case geocodeResult:
        return 46;
      case geodatabase:
        return 47;
      case geodatabaseFeatureTable:
        return 48;
      case geodatabaseSyncTask:
        return 49;
      case geometry:
        return 50;
      case geoprocessingFeatureSet:
        return 51;
      case geoprocessingParameter:
        return 52;
      case graphic:
        return 53;
      case graphicsOverlay:
        return 54;
      case guid:
        return 55;
      case identifyGraphicsOverlayResult:
        return 56;
      case identifyLayerResult:
        return 57;
      case idInfo:
        return 58;
      case image:
        return 59;
      case incident:
        return 60;
      case int16:
        return 61;
      case int32:
        return 62;
      case int64:
        return 63;
      case int8:
        return 64;
      case job:
        return 65;
      case jobMessage:
        return 66;
      case kmlNode:
        return 67;
      case kmlGeometry:
        return 68;
      case labelingInfo:
        return 69;
      case layer:
        return 70;
      case legendInfo:
        return 71;
      case levelOfDetail:
        return 72;
      case loadableImage:
        return 73;
      case locatorAttribute:
        return 74;
      case locatorTask:
        return 75;
      case arcGISMap:
        return 76;
      case mobileBasemapLayer:
        return 77;
      case mobileMapPackage:
        return 78;
      case modelSceneSymbol:
        return 79;
      case orderBy:
        return 80;
      case pictureMarkerSymbol:
        return 81;
      case pointBarrier:
        return 82;
      case polygonBarrier:
        return 83;
      case polylineBarrier:
        return 84;
      case popup:
        return 85;
      case popupField:
        return 86;
      case popupMedia:
        return 87;
      case portal:
        return 88;
      case portalItem:
        return 89;
      case raster:
        return 90;
      case requestAttachment:
        return 91;
      case restrictionAttribute:
        return 92;
      case route:
        return 93;
      case routeParameters:
        return 94;
      case routeResult:
        return 95;
      case routeTask:
        return 96;
      case arcGISScene:
        return 97;
      case serviceAreaFacility:
        return 98;
      case serviceAreaParameters:
        return 99;
      case serviceAreaPolygon:
        return 100;
      case serviceAreaPolyline:
        return 101;
      case serviceAreaResult:
        return 102;
      case serviceAreaTask:
        return 103;
      case stop:
        return 104;
      case string:
        return 105;
      case suggestResult:
        return 106;
      case surface:
        return 107;
      case symbol:
        return 108;
      case symbolStyle:
        return 109;
      case symbolStyleSearchParameters:
        return 110;
      case symbolStyleSearchResult:
        return 111;
      case syncGeodatabaseParameters:
        return 112;
      case syncLayerOption:
        return 113;
      case syncLayerResult:
        return 114;
      case tileCache:
        return 115;
      case transportationNetworkDataset:
        return 116;
      case travelMode:
        return 117;
      case uint16:
        return 118;
      case uint32:
        return 119;
      case uint64:
        return 120;
      case uint8:
        return 121;
      case uniqueValue:
        return 122;
      case variant:
        return 123;
      case vector:
        return 124;
      case vectorTileSourceInfo:
        return 125;
      case geoprocessingParameterInfo:
        return 126;
      case geoprocessingTask:
        return 127;
      case geoprocessingParameters:
        return 128;
      case wmtsLayerInfo:
        return 129;
      case wmtsServiceInfo:
        return 130;
      case wmtsTileMatrix:
        return 131;
      case wmtsTileMatrixSet:
        return 132;
      case tileImageFormat:
        return 133;
      case offlineMapTask:
        return 134;
      case exportVectorTilesTask:
        return 135;
      case exportVectorTilesParameters:
        return 136;
      case arcGISFeatureTable:
        return 137;
      case relationshipInfo:
        return 138;
      case relatedFeatureQueryResult:
        return 139;
      case wmtsService:
        return 140;
      case error:
        return 141;
      case serviceFeatureTable:
        return 142;
      case generateOfflineMapParameters:
        return 143;
      case pictureFillSymbol:
        return 145;
      case offlineCapability:
        return 146;
      case offlineMapCapabilities:
        return 147;
      case renderingRuleInfo:
        return 148;
      case labelDefinition:
        return 149;
      case relationshipConstraintViolation:
        return 150;
      case offlineMapSyncTask:
        return 151;
      case offlineMapSyncLayerResult:
        return 152;
      case popupRelatedFeaturesSortOrder:
        return 153;
      case statisticDefinition:
        return 154;
      case statisticsQueryResult:
        return 155;
      case statisticRecord:
        return 156;
      case kmlDataset:
        return 157;
      case preplannedMapArea:
        return 158;
      case wmsService:
        return 159;
      case wmsServiceInfo:
        return 160;
      case wmsLayerInfo:
        return 161;
      case arcGISMapServiceImageFormat:
        return 162;
      case spatialReference:
        return 163;
      case geopackage:
        return 164;
      case geopackageFeatureTable:
        return 165;
      case geopackageRaster:
        return 166;
      case wmsSublayer:
        return 167;
      case vectorTileCache:
        return 168;
      case analysis:
        return 169;
      case analysisOverlay:
        return 170;
      case itemResourceCache:
        return 171;
      case wmsFeature:
        return 172;
      case nmeaSatelliteInfo:
        return 173;
      case symbolLayer:
        return 174;
      case vectorMarkerSymbolElement:
        return 175;
      case geometricEffect:
        return 176;
      case pictureMarkerSymbolLayer:
        return 177;
      case pictureFillSymbolLayer:
        return 178;
      case featureSubtype:
        return 179;
      case labelStackSeparator:
        return 180;
      case wfsService:
        return 181;
      case wfsLayerInfo:
        return 182;
      case offlineMapParametersKey:
        return 183;
      case generateOfflineMapParameterOverrides:
        return 184;
      case queryParameters:
        return 186;
      case statisticsQueryParameters:
        return 187;
      case routeTracker:
        return 188;
      case wfsFeatureTable:
        return 189;
      case downloadPreplannedOfflineMapParameters:
        return 190;
      case annotationSublayer:
        return 192;
      case offlineMapSyncParameters:
        return 193;
      case offlineMapUpdatesInfo:
        return 194;
      case dictionarySymbolStyleConfiguration:
        return 195;
      case location:
        return 197;
      case imageFrame:
        return 198;
      case imageOverlay:
        return 199;
      case geodatabaseDeltaInfo:
        return 200;
      case dateOnly:
        return 201;
      case timeOnly:
        return 202;
      case timestampOffset:
        return 203;
      case kmlSimpleField:
        return 204;
      case kmlSchema:
        return 205;
      case kmlSchemaData:
        return 206;
      case ogcFeatureService:
        return 300;
      case ogcFeatureCollectionInfo:
        return 301;
      case ogcFeatureCollectionTable:
        return 302;
      case datumTransformation:
        return 500;
      case geographicTransformationStep:
        return 501;
      case horizontalVerticalTransformationStep:
        return 502;
      case encCell:
        return 1000;
      case encDataset:
        return 1001;
      case encExchangeSet:
        return 1002;
      case encFeature:
        return 1003;
      case mobileScenePackage:
        return 1004;
      case popupExpression:
        return 1005;
      case utilityNetwork:
        return 1006;
      case utilityAssetType:
        return 1007;
      case utilityAssetGroup:
        return 1008;
      case utilityCategory:
        return 1009;
      case utilityTerminal:
        return 1010;
      case utilityNetworkAttribute:
        return 1011;
      case utilityNetworkSource:
        return 1012;
      case utilityElement:
        return 1013;
      case utilityTraceResultType:
        return 1014;
      case trackingStatus:
        return 1015;
      case utilityTraceResult:
        return 1016;
      case utilityDomainNetwork:
        return 1017;
      case utilityTerminalConfiguration:
        return 1018;
      case utilityTier:
        return 1019;
      case utilityTierGroup:
        return 1020;
      case utilityPropagator:
        return 1021;
      case subtypeSublayer:
        return 1022;
      case utilityAssociation:
        return 1023;
      case utilityTraceFunctionBarrier:
        return 1024;
      case licenseInfo:
        return 1025;
      case rasterCell:
        return 1026;
      case utilityTerminalPath:
        return 1027;
      case utilityTerminalConfigurationPath:
        return 1028;
      case none:
        return -1;
      case popupExpressionEvaluation:
        return 1029;
      case utilityTraceFunction:
        return 1030;
      case utilityFunctionTraceResult:
        return 1031;
      case utilityTraceFunctionOutput:
        return 1032;
      case serviceVersionInfo:
        return 1033;
      case utilityGeometryTraceResult:
        return 1034;
      case featureTableEditResult:
        return 1035;
      case utilityNamedTraceConfiguration:
        return 1037;
      case wifiReading:
        return 1038;
      case localFeatureEdit:
        return 1039;
      case floorFacility:
        return 1041;
      case floorLevel:
        return 1042;
      case floorSite:
        return 1043;
      case localFeatureEditsResult:
        return 1047;
      case geotrigger:
        return 1048;
      case displayFilter:
        return 1049;
      case scaleRangeDisplayFilter:
        return 1050;
      case contingency:
        return 1052;
      case contingencyConstraintViolation:
        return 1053;
      case contingentValue:
        return 1054;
      case fieldGroup:
        return 1055;
      case arcadeEvaluationResult:
        return 1056;
      case serviceGeodatabase:
        return 1058;
      case popupElement:
        return 1060;
      case fieldDescription:
        return 1061;
      case codedValueDescription:
        return 1062;
      case dynamicEntityObservation:
        return 1063;
      case popupAttachment:
        return 1064;
      case licenseStatus:
        return 1065;
      case arcGISTokenInfo:
        return 1067;
      case tokenInfo:
        return 1068;
      case tokenCredential:
        return 1069;
      case chartImage:
        return 1070;
      case clientResponse:
        return 1071;
      case clientReference:
        return 1072;
      case arcGISCredential:
        return 1073;
      case oauthUserTokenInfo:
        return 1074;
      case oauthUserCredential:
        return 1075;
      case dynamicEntity:
        return 1076;
      case utilityRule:
        return 1077;
      case oauthApplicationTokenInfo:
        return 1080;
      case oauthApplicationCredential:
        return 1081;
      case aggregateField:
        return 1082;
      case aggregateGeoElement:
        return 1083;
      case formElement:
        return 1084;
      case utilityNetworkState:
        return 1085;
      case aggregationFeatureReduction:
        return 1086;
      case geBuildingSceneLayerAttributeStatistics:
        return 1087;
      case formExpressionEvaluationError:
        return 1088;
      case snapSourceSettings:
        return 1091;
      case worldview:
        return 1092;
      case basemapStyleInfo:
        return 1093;
      case basemapStyleLanguageStrategy:
        return 1094;
      case formAttachment:
        return 1096;
      case basemapStyleLanguageInfo:
        return 1097;
    }
  }
}

/// An object that represents an error.
final class _Error implements ffi.Finalizable {
  final RT_ErrorHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Error_destroy.cast());

  static _Error? _fromHandle(RT_ErrorHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Error._withHandle(handle);
  }

  _Error._withHandle(RT_ErrorHandle handle)
      : _additionalInformation = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Error_getAdditionalInformation(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _underlyingError = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Error_getUnderlyingError(
                handle, errorHandler);
          });
          return _Error._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Error_created(_handle);
    }
  }

  /// A dictionary of additional information that this error may be providing.
  Map<String, String> get additionalInformation => _additionalInformation.value;

  final Memoized<_UnmodifiableDictionaryMap<String, String>>
      _additionalInformation;

  /// A string with additional information about the error.
  ///
  /// The additional message is also a part of the dictionary returned by
  /// [_Error.additionalInformation].
  String get additionalMessage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Error_getAdditionalMessage(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The error's code.
  int get code {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Error_getCode(_handle, errorHandler);
    });
  }

  /// The error's domain.
  _ArcGISExceptionDomain get domain {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Error_getDomain(_handle, errorHandler);
    });
    return _ArcGISExceptionDomain._fromCoreValue(coreValue);
  }

  /// The error's message.
  String get message {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Error_getMessage(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The error's underlying error.
  _Error? get underlyingError => _underlyingError.value;

  final Memoized<_Error?> _underlyingError;

  /// The error's user defined failure.
  ffi.Pointer<ffi.Void> get userDefinedFailure {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Error_getUserDefinedFailure(_handle, errorHandler);
    });
  }
}

/// The different types of graphics API that can be used.
///
/// Each of different supported graphics APIs. DirextX 9 and DirectX 11 are only
/// supported on Windows.
enum _GraphicApiType {
  /// Use OpenGL minimum version ?.
  ogl,

  /// Use DirectX 11.
  dx11,

  /// Use OpenGL ES.
  gles,

  /// Use Metal.
  metal,

  /// Unknown graphics API.
  unknown;

  factory _GraphicApiType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return ogl;
      case 2:
        return dx11;
      case 3:
        return gles;
      case 4:
        return metal;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case ogl:
        return 1;
      case dx11:
        return 2;
      case gles:
        return 3;
      case metal:
        return 4;
      case unknown:
        return -1;
    }
  }
}

/// Defines a GUID type.
final class Guid implements ffi.Finalizable {
  final RT_GUIDHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GUID_destroy.cast());

  static Guid? _fromHandle(RT_GUIDHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Guid._withHandle(handle);
  }

  Guid._withHandle(RT_GUIDHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GUID_created(_handle);
    }
  }

  /// Creates a new GUID object.
  factory Guid() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GUID_create(errorHandler);
    });
    return Guid._withHandle(handle);
  }

  /// Creates a GUID from a string value.
  ///
  /// Parameters:
  /// - `guidString` — Unique identifier string.
  static Guid? fromString(String guidString) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGuidString = _CString(guidString);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GUID_createFromString(
          coreGuidString.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return Guid._withHandle(handle);
  }

  /// Returns the GUID value as a string.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GUID_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Guid) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_GUID_equals(_handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_GUID_hash(_handle, errorHandler);
    });
  }
}

/// An interface for retrieving a unique identifier for an object.
///
/// This interface enables a client SDK to uniquely identify an object held
/// within RTC.
///
/// When an object surfaces through the C API as a handle, the handle address
/// does not identify the underlying RTC object: the same underlying RTC object
/// can surface twice, either at different times or from different API calls
/// with different C API handle addresses.
///
/// Use [_InstanceId._instanceId] through the C API to identify the underlying
/// RTC object.
abstract interface class _InstanceId {
  /// Unique identifier for this object.
  ///
  /// Use this property through the C API to identify an RTC object uniquely.
  ///
  /// Typically, a client SDK or extension will use this property to cache
  /// wrapped objects in the client, enabling clients to manage the lifetime of
  /// data they hold pertaining to events on an object, regardless of where or
  /// when an object surfaces from the C API.
  int get _instanceId;
}

/// Defines a dynamic array that provides callbacks when elements are added or
/// removed.
///
/// The vector holds [_Element] objects. Use [_MutableArray.valueType] to
/// determine what type of [_Element] objects are being stored in the vector. An
/// [_Element] that has been retrieved from the vector can be converted to its
/// underlying type by calling (for example) int32_t int_value =
/// RT_Element_getValueAsInt32(element_handle, error_handler);
///
/// There are a couple of performance optimizations to consider with the generic
/// collection type:
/// 1. The [_Element] object can be reused for multiple calls while
/// adding/inserting/updating values within the collection. So you can
/// instantiate one [_Element] and iteratively change its value and call
/// add/update/insert on the collection to modify the values of the collection.
/// 2. If the overhead of creating these [_Element] does become too much for a
/// specific value type, then consider subclassing the collection type and
/// provide "overloaded" methods that would accept that value type directly.
/// This would eliminate the overhead of instantiating these [_Element] objects.
final class _MutableArray<T extends Object> implements ffi.Finalizable {
  final RT_VectorHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Vector_destroy.cast());

  static _MutableArray<T>? _fromHandle<T extends Object>(
      RT_VectorHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _MutableArray._withHandle(handle);
  }

  _MutableArray._withHandle(RT_VectorHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Vector_created(_handle);
    }
  }

  /// Creates a vector. This allocates memory that must be deleted.
  ///
  /// Parameters:
  /// - `valueType` — The type of the values this vector holds.
  factory _MutableArray(_ElementType valueType) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_create(valueType.coreValue, errorHandler);
    });
    return _MutableArray._withHandle(handle);
  }

  /// Determines the number of values in the vector.
  ///
  /// The number of values in the vector. If an error occurs a 0 will be
  /// returned.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_getSize(_handle, errorHandler);
    });
  }

  /// The type of the values this vector holds.
  _ElementType get valueType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_getValueType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }

  /// Add a value to the vector.
  ///
  /// Parameters:
  /// - `value` — The value that is to be added.
  ///
  /// Return Value: The position of the value. Max value of size_t if an error
  /// occurs.
  int add(T value) {
    final valueElement =
        _ElementExtension.fromDartValue(value, expectedType: valueType);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_add(
          _handle, valueElement._handle, errorHandler);
    });
  }

  /// Appends a vector to a vector.
  ///
  /// Parameters:
  /// - `array` — A vector object that contains the values to append.
  ///
  /// Return Value: The new size of vector_1. Max value of size_t if an error
  /// occurs.
  int addArray(_MutableArray<T> array) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_addArray(
          _handle, array._handle, errorHandler);
    });
  }

  /// Get a value at a specific position.
  ///
  /// Retrieves the value at the specified position.
  ///
  /// Parameters:
  /// - `position` — The position which you want to get the value.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? at(int position) {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_at(_handle, position, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Does the vector contain the given value.
  ///
  /// Does the vector contain a specific value.
  ///
  /// Parameters:
  /// - `value` — The value you want to find.
  ///
  /// Return Value: True if the value is in the vector otherwise false.
  bool contains({required T value}) {
    final coreValue = _ElementExtension.fromDartValue(value);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_contains(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Get the first value in the vector.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? first() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_first(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Retrieves the position of the given value in the vector.
  ///
  /// Parameters:
  /// - `value` — The value you want to find.
  ///
  /// Return Value: The position of the value in the vector, Max value of size_t
  /// otherwise.
  int indexOf({required T value}) {
    final coreValue = _ElementExtension.fromDartValue(value);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_indexOf(
          _handle, coreValue._handle, errorHandler);
    });
  }

  /// Insert a value at the specified position in the vector.
  ///
  /// Insert a value at a specified position to the vector.
  ///
  /// Parameters:
  /// - `position` — The position which you want to insert the value.
  /// - `value` — The value that is to be added.
  void insert(int position, T value) {
    final valueElement =
        _ElementExtension.fromDartValue(value, expectedType: valueType);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Vector_insert(
          _handle, position, valueElement._handle, errorHandler);
    });
  }

  /// Determines if there are any values in the vector.
  ///
  /// Check if the vector object has any values in it.
  ///
  /// Return Value: true if the vector object contains no values otherwise
  /// false. Will return true if an error occurs.
  bool isEmpty() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_isEmpty(_handle, errorHandler);
    });
  }

  /// Get the last value in the vector.
  ///
  /// Return Value: The value, [_Element], at the position requested.
  T? last() {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_last(_handle, errorHandler);
    });
    return elementHandle != ffi.nullptr
        ? _Element._withHandle(elementHandle).getDartValue()
        : null;
  }

  /// Move a value from the current position to a new position in the string
  /// vector.
  ///
  /// Move a value from the current position to a new position in the vector.
  ///
  /// Parameters:
  /// - `oldPosition` — The current position of the value.
  /// - `newPosition` — The position which you want to move the value to.
  void move({required int oldPosition, required int newPosition}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Vector_move(
          _handle, oldPosition, newPosition, errorHandler);
    });
  }

  /// Returns a value indicating a bad position within the vector.
  ///
  /// Return Value: A size_t.
  static int npos<T extends Object>() {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Vector_npos(errorHandler);
    });
  }

  /// Remove a value at a specific position in the vector.
  ///
  /// Parameters:
  /// - `position` — The position which you want to remove the value.
  void remove(int position) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Vector_remove(_handle, position, errorHandler);
    });
  }

  /// Remove all values from the vector.
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Vector_removeAll(_handle, errorHandler);
    });
  }
}

/// A RGB object which is derived from a color object.
///
/// Same as a [Color]. Changing type just to make it clear you get back a
/// derived type. The RGB class is derived from the color class.
final class _RgbColor extends _ArcGISColor {
  static _RgbColor? _fromHandle(RT_RGBColorHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _RgbColor._withHandle(handle);
  }

  _RgbColor._withHandle(super.handle) : super._withHandle();

  /// Creates a RGB color from a value. This allocates memory that must be
  /// deleted.
  ///
  /// The color is made of 4 8 bit values Alpha, blue, green, red (0xAABBGGRR)
  /// between 0 - 255.
  ///
  /// Parameters:
  /// - `value` — The 32 bit RGBA color value.
  factory _RgbColor.fromRgba(int value) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_createFromRGBA(value, errorHandler);
    });
    return _RgbColor._withHandle(handle);
  }

  /// Creates a RGB color from a set of values. This allocates memory that must
  /// be deleted.
  ///
  /// Values are between 0 - 255. 0 being none and 255 being the full amount. If
  /// alpha is 255 then the color is opaque.
  ///
  /// Parameters:
  /// - `red` — The 8 bit red color value.
  /// - `green` — The 8 bit green color value.
  /// - `blue` — The 8 bit blue color value.
  /// - `alpha` — The 8 bit alpha color value.
  factory _RgbColor.fromValues(
      {required int red,
      required int green,
      required int blue,
      required int alpha}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_createFromValues(
          red, green, blue, alpha, errorHandler);
    });
    return _RgbColor._withHandle(handle);
  }

  /// The alpha value.
  ///
  /// The alpha color value from the RGB color object. The value is between 0 -
  /// 255. If alpha is 255 then the color is opaque.
  int get alpha {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_getAlpha(_handle, errorHandler);
    });
  }

  /// The blue value.
  ///
  /// The blue color value from the RGB color object. The value is between 0 -
  /// 255.
  int get blue {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_getBlue(_handle, errorHandler);
    });
  }

  /// The green value.
  ///
  /// The green color value from the RGB color object. The value is between 0 -
  /// 255.
  int get green {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_getGreen(_handle, errorHandler);
    });
  }

  /// The red value.
  ///
  /// The red color value from the RGB color object. The value is between 0 -
  /// 255.
  int get red {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_getRed(_handle, errorHandler);
    });
  }

  /// The color value.
  ///
  /// The color values as a single 32 bit value from the RGB color object. The
  /// color is made of 4 8 bit values Alpha, blue, green, red (0xAABBGGRR)
  /// between 0 - 255.
  int get rgba {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RGBColor_getRGBA(_handle, errorHandler);
    });
  }
}

enum _RuntimeClient {
  /// Unity.
  unity,

  /// Unreal Engine.
  unrealEngine,

  /// Native.
  native,

  /// ArcGISPro.
  arcGISPro,

  /// No runtime client.
  none;

  factory _RuntimeClient._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return unity;
      case 2:
        return unrealEngine;
      case 3:
        return native;
      case 4:
        return arcGISPro;
      case -1:
        return none;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unity:
        return 1;
      case unrealEngine:
        return 2;
      case native:
        return 3;
      case arcGISPro:
        return 4;
      case none:
        return -1;
    }
  }
}

/// An object that represents a time without the date component.
final class TimeOnly implements ffi.Finalizable {
  final RT_TimeOnlyHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimeOnly_destroy.cast());

  static TimeOnly? _fromHandle(RT_TimeOnlyHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimeOnly._withHandle(handle);
  }

  TimeOnly._withHandle(RT_TimeOnlyHandle handle)
      : __dateTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimeOnly_getDateTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimeOnly_created(_handle);
    }
  }

  /// Creates a new time-only object from the provided hours, minutes, and
  /// seconds.
  ///
  /// Hours must be between 0-23 (inclusive), while minutes and seconds must be
  /// between 0-59 (inclusive).
  ///
  /// Parameters:
  /// - `hours` — The hours.
  /// - `minutes` — The minutes.
  /// - `seconds` — The seconds.
  factory TimeOnly.withHourMinutesSeconds(
      {required int hours, required int minutes, required int seconds}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_createWithHourMinutesSeconds(
          hours, minutes, seconds, errorHandler);
    });
    return TimeOnly._withHandle(handle);
  }

  /// Creates a new time-only object from the ISO 8601 time value, HH:MM:SS.
  ///
  /// Milliseconds are not supported for [TimeOnly] objects.
  ///
  /// Parameters:
  /// - `timeString` — The time.
  factory TimeOnly.withString(String timeString) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTimeString = _CString(timeString);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_createWithString(
          coreTimeString.bytes, errorHandler);
    });
    return TimeOnly._withHandle(handle);
  }

  /// Gets the underlying [DateTime] representing the time (on 1970-01-01).
  DateTime get _dateTime => __dateTime.value;

  final Memoized<DateTime> __dateTime;

  /// Gets the hours component of the time represented by this instance.
  int get hours {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_getHours(_handle, errorHandler);
    });
  }

  /// Gets the minutes component of the time represented by this instance.
  int get minutes {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_getMinutes(_handle, errorHandler);
    });
  }

  /// Gets the seconds component of the time represented by this instance.
  int get seconds {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_getSeconds(_handle, errorHandler);
    });
  }

  /// Returns a string representing the time in ISO 8601 format, HH:MM:SS.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TimeOnly) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimeOnly_hash(_handle, errorHandler);
    });
  }
}

/// An object that denotes an offset from UTC.
final class TimeZoneOffset implements ffi.Finalizable {
  final RT_TimeZoneOffsetHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimeZoneOffset_destroy.cast());

  static TimeZoneOffset? _fromHandle(RT_TimeZoneOffsetHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimeZoneOffset._withHandle(handle);
  }

  TimeZoneOffset._withHandle(RT_TimeZoneOffsetHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimeZoneOffset_created(_handle);
    }
  }

  /// Creates a new time zone offset object from the provided hours and minutes.
  ///
  /// Offsets must follow ISO 8601 format and between -12:00 to +14:00
  /// (inclusive).
  ///
  /// Parameters:
  /// - `hours` — The hours.
  /// - `minutes` — The minutes.
  factory TimeZoneOffset.withHourAndMinutes(
      {required int hours, required int minutes}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_createWithHourAndMinutes(
          hours, minutes, errorHandler);
    });
    return TimeZoneOffset._withHandle(handle);
  }

  /// Creates a new time zone offset object from a string, \[+/-]HH:MM.
  ///
  /// Offsets must follow ISO 8601 format and be between -12:00 to +14:00
  /// (inclusive).
  ///
  /// Parameters:
  /// - `offset` — The amount of time ahead or behind UTC.
  factory TimeZoneOffset.withString(String offset) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreOffset = _CString(offset);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_createWithString(
          coreOffset.bytes, errorHandler);
    });
    return TimeZoneOffset._withHandle(handle);
  }

  /// Gets the hours component of the time zone offset represented by this
  /// instance.
  int get hours {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_getHours(_handle, errorHandler);
    });
  }

  /// Gets the minutes component of the time zone offset represented by this
  /// instance.
  int get minutes {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_getMinutes(_handle, errorHandler);
    });
  }

  /// Returns a string representing the amount of time ahead or behind UTC.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TimeZoneOffset) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimeZoneOffset_hash(_handle, errorHandler);
    });
  }
}

/// An object that represents a date, time, and its offset from UTC.
final class TimestampOffset implements ffi.Finalizable {
  final RT_TimestampOffsetHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimestampOffset_destroy.cast());

  static TimestampOffset? _fromHandle(RT_TimestampOffsetHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimestampOffset._withHandle(handle);
  }

  TimestampOffset._withHandle(RT_TimestampOffsetHandle handle)
      : _dateOnly = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimestampOffset_getDateOnly(
                handle, errorHandler);
          });
          return DateOnly._fromHandle(objectHandle)!;
        }),
        __dateTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimestampOffset_getDateTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _timeOnly = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimestampOffset_getTimeOnly(
                handle, errorHandler);
          });
          return TimeOnly._fromHandle(objectHandle)!;
        }),
        _timeZoneOffset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimestampOffset_getTimeZoneOffset(
                handle, errorHandler);
          });
          return TimeZoneOffset._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimestampOffset_created(_handle);
    }
  }

  /// Creates a new timestamp offset object from the provided date, time, and
  /// time zone offset.
  ///
  /// Parameters:
  /// - `dateOnly` — The date only.
  /// - `timeOnly` — The time only.
  /// - `timeZoneOffset` — The offset that indicates how far ahead or behind the
  /// local date time is relative to UTC.
  factory TimestampOffset.withDateOnlyTimeOnlyAndOffset(
      {required DateOnly dateOnly,
      required TimeOnly timeOnly,
      required TimeZoneOffset timeZoneOffset}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_createWithDateOnlyTimeOnlyAndOffset(
          dateOnly._handle,
          timeOnly._handle,
          timeZoneOffset._handle,
          errorHandler);
    });
    final TimestampOffset object = TimestampOffset._withHandle(handle);
    object._dateOnly.cache(dateOnly);
    object._timeOnly.cache(timeOnly);
    object._timeZoneOffset.cache(timeZoneOffset);
    return object;
  }

  /// Creates a new timestamp offset object with the given value.
  ///
  /// The [DateTime] is a local date and time in UTC.
  ///
  /// Parameters:
  /// - `dateTime` — The date time.
  /// - `timeZoneOffset` — The time zone offset.
  factory TimestampOffset.withDateTimeAndOffset(
      {required DateTime dateTime, required TimeZoneOffset timeZoneOffset}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDateTime = dateTime.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_createWithDateTimeAndOffset(
          coreDateTime._handle, timeZoneOffset._handle, errorHandler);
    });
    final TimestampOffset object = TimestampOffset._withHandle(handle);
    object._timeZoneOffset.cache(timeZoneOffset);
    return object;
  }

  /// Creates a new timestamp offset object with the given value.
  ///
  /// Parameters:
  /// - `timestampString` — The timestamp string in ISO 8601 format,
  /// YYYY-MM-DDTHH:MM:SS.sss\[+/-]hh:mm.
  factory TimestampOffset.withString(String timestampString) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTimestampString = _CString(timestampString);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_createWithString(
          coreTimestampString.bytes, errorHandler);
    });
    return TimestampOffset._withHandle(handle);
  }

  /// The date component of the timestamp offset.
  DateOnly get dateOnly => _dateOnly.value;

  final Memoized<DateOnly> _dateOnly;

  /// Gets the underlying [DateTime] representing the timestamp (converted to
  /// UTC).
  DateTime get _dateTime => __dateTime.value;

  final Memoized<DateTime> __dateTime;

  /// The time component of the timestamp offset.
  ///
  /// Does not contain milliseconds, even if the timestamp offset contains
  /// milliseconds.
  TimeOnly get timeOnly => _timeOnly.value;

  final Memoized<TimeOnly> _timeOnly;

  /// The amount of hours ahead or behind UTC.
  TimeZoneOffset get timeZoneOffset => _timeZoneOffset.value;

  final Memoized<TimeZoneOffset> _timeZoneOffset;

  /// Returns a string representing the timestamp in ISO8601 format,
  /// YYYY-MM-DDTHH:MM:SS.sss.
  ///
  /// Return Value: A [String].
  @override
  String toString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_toString(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TimestampOffset) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TimestampOffset_hash(_handle, errorHandler);
    });
  }
}
