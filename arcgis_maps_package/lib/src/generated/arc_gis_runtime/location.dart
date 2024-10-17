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

part of '../../../arcgis_maps.dart';

/// A location data object.
///
/// This object contains a location data, including its position point,
/// velocity, accuracy, course etc.
final class ArcGISLocation implements ffi.Finalizable {
  final RT_LocationHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Location_destroy.cast());

  static ArcGISLocation? _fromHandle(RT_LocationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISLocation._withHandle(handle);
  }

  _LocationType get _objectType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getObjectType(_handle, errorHandler);
    });
    return _LocationType._fromCoreValue(coreValue);
  }

  ArcGISLocation._withHandle(RT_LocationHandle handle)
      : _additionalSourceProperties = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Location_getAdditionalSourceProperties(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _timestamp = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Location_getTimestamp(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Location_created(_handle);
    }
  }

  /// Creates a location object with timestamp and additional source properties.
  ///
  /// An [ArcGISLocation] can be created from a variety of sources and using
  /// different technologies. By supplying
  /// [ArcGISLocation.additionalSourceProperties] you can allow users of this
  /// [ArcGISLocation] to find out how the data was captured.
  ///
  /// Information should be provided as a set of key-value pairs, where the
  /// [String] key describes the type of data held in the [dynamic] value.
  /// Values must be basic data types such as string, floating point, integer,
  /// boolean or date. You can use any string for the key - but this API
  /// recognizes a number of well known keys which should be used if available.
  /// See `LocationSourcePropertiesKeys`:
  /// * "floor" (an integer value). The floor number of the [ArcGISLocation]
  /// when in a building. Use `LocationSourcePropertiesKeys.floor` to reference
  /// this key.
  /// * "satelliteCount" (an integer value). The number of satellites used to
  /// fix the [ArcGISLocation]. Use
  /// `LocationSourcePropertiesKeys.satelliteCount` to reference this key.
  /// * "transmitterCount" (an integer value). The number of transmitters used
  /// to create an indoor positioning system (IPS) position. Use
  /// `LocationSourcePropertiesKeys.transmitterCount` to reference this key.
  /// * "positionSource" (a string value). This key can be used to indicate the
  /// position source: GNSS, AppleIPS, BLE, WIFI, CELL, IP. GNSS indicates
  /// global navigation satellite system and AppleIPS is Apple’s indoor
  /// positioning technology. It is possible to have multiple position sources.
  /// In that case positionSource is a list with comma-separated values.
  /// * "floorLevelId" (a string value). Unique ID of the feature stored in the
  /// levels [ArcGISFeatureTable] in accordance with the ArcGIS Indoors
  /// Information Model. Use `LocationSourcePropertiesKeys.floorLevelId` to
  /// reference this key. Keys are case-sensitive.
  ///
  /// Parameters:
  /// - `timestamp` — A timestamp when location was received.
  /// - `position` — A point geometry object.
  /// - `horizontalAccuracy` — The horizontal accuracy in meters. Positive
  /// values or NaN are supported.
  /// - `verticalAccuracy` — The vertical accuracy in meters. Positive values or
  /// NaN are supported.
  /// - `speed` — The location's speed in meters per second.
  /// - `course` — The location's course in degrees (clockwise), 0 being true
  /// North.
  /// - `isLastKnown` — Indicates whether this is an outdated device position
  /// retrieved and cached earlier and therefore not guaranteed to represent the
  /// current location. Setting this to true will render with the
  /// [LocationDisplay.acquiringSymbol], typically a grayed out location symbol.
  /// - `additionalSourceProperties` — A set of key-value pairs providing
  /// additional meta-data and properties about the source of this
  /// [ArcGISLocation].
  factory ArcGISLocation(
      {required DateTime? timestamp,
      required ArcGISPoint position,
      required double horizontalAccuracy,
      required double verticalAccuracy,
      required double speed,
      required double course,
      bool isLastKnown = false,
      Map<String, dynamic> additionalSourceProperties = const {}}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTimestamp = timestamp?.toArcGIS();
    final coreAdditionalSourceProperties =
        additionalSourceProperties.toDictionary(
            keyType: _ElementType.string, valueType: _ElementType.variant);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_createWithAdditionalSourceProperties(
          coreTimestamp?._handle ?? ffi.nullptr,
          position._handle,
          horizontalAccuracy,
          verticalAccuracy,
          speed,
          course,
          isLastKnown,
          coreAdditionalSourceProperties._handle,
          errorHandler);
    });
    final ArcGISLocation object = ArcGISLocation._withHandle(handle);
    object._timestamp.cache(timestamp);
    object._additionalSourceProperties.value
        .setCache(additionalSourceProperties);
    return object;
  }

  /// A set of key-value pairs providing additional meta-data and properties
  /// about the source of this [ArcGISLocation].
  ///
  /// An [ArcGISLocation] object can be created manually or by a variety of
  /// [LocationDataSource] types, for example from the default platform data
  /// source or external GPS. When user code receives a new [ArcGISLocation], it
  /// can be important to determine how the information was obtained.
  ///
  /// In addition, mobile devices may provide different details about their
  /// in-built location services. For example, Android systems can provide data
  /// on the number of satellites used to find a position, whereas on iOS this
  /// information is not available. When a given property is not available to
  /// the data source the entry should be omitted from the
  /// [ArcGISLocation.additionalSourceProperties].
  ///
  /// The [ArcGISLocation.additionalSourceProperties] provide a means for the
  /// creator of an [ArcGISLocation] object to record flexible information such
  /// as:
  /// * The confidence level associated with the location
  /// * The method used to obtain the location
  /// * The provenance of the location
  ///
  /// Information is provided as a set of key-value pairs, where the [String]
  /// key describes the type of data held in the [dynamic] value. Values must be
  /// basic data types such as string, numeric, boolean or date. The creator of
  /// the [ArcGISLocation] can use any string for the key - but this API
  /// recognizes a number of well known keys which should be used if available.
  /// See `LocationSourcePropertiesKeys`:
  /// * "floor" (an integer value). The floor number of the [ArcGISLocation]
  /// when in a building. Use `LocationSourcePropertiesKeys.floor` to reference
  /// this key.
  /// * "satelliteCount" (an integer value). The number of satellites used to
  /// fix the [ArcGISLocation]. Use
  /// `LocationSourcePropertiesKeys.satelliteCount` to reference this key.
  /// * "positionSource" (a string value). This key can be used to indicate the
  /// position source: GNSS, AppleIPS, BLE, WIFI, CELL, IP. GNSS indicates
  /// global navigation satellite system and AppleIPS is Apple’s indoor
  /// positioning technology. It is possible to have multiple position sources.
  /// In that case positionSource is a list with comma-separated values.
  ///
  /// Keys are case-sensitive.
  Map<String, dynamic> get additionalSourceProperties =>
      _additionalSourceProperties.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>>
      _additionalSourceProperties;

  /// The course of the location in degrees clockwise, 0 being true North.
  double get course {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getCourse(_handle, errorHandler);
    });
  }

  /// The horizontal accuracy of the location in meters.
  double get horizontalAccuracy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getHorizontalAccuracy(
          _handle, errorHandler);
    });
  }

  /// Indicates whether this is an outdated device position retrieved and cached
  /// earlier and therefore not guaranteed to represent the current location.
  bool get isLastKnown {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getLastKnown(_handle, errorHandler);
    });
  }

  /// The position of the location.
  ArcGISPoint get position {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getPosition(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The speed of the location in meters per second.
  double get speed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getVelocity(_handle, errorHandler);
    });
  }

  /// The timestamp of the location.
  DateTime? get timestamp => _timestamp.value;

  final Memoized<DateTime?> _timestamp;

  /// The vertical accuracy of the location in meters.
  double get verticalAccuracy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Location_getVerticalAccuracy(_handle, errorHandler);
    });
  }
}

/// The location data source provides location information that can be displayed
/// on a map using the [ArcGISMapViewController.locationDisplay].
///
/// This is a base class for a number of different location data sources, such
/// as `IndoorsLocationDataSource`, `NmeaLocationDataSource`,
/// `RouteTrackerLocationDataSource`, and [SimulatedLocationDataSource]. Call
/// [LocationDataSource.start] to receive location updates and display the
/// current location using the [ArcGISMapViewController.locationDisplay].
final class LocationDataSource
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_LocationDataSourceHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.LocationDataSource_destroyInstance.cast());

  static LocationDataSource? _fromHandle(RT_LocationDataSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocationDataSource._instanceCache.instanceWith(handle);
  }

  static _LocationDataSourceType _objectTypeOf(
      RT_LocationDataSourceHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_getObjectType(
          handle, errorHandler);
    });
    return _LocationDataSourceType._fromCoreValue(coreValue);
  }

  _LocationDataSourceType get _objectType =>
      LocationDataSource._objectTypeOf(_handle);

  LocationDataSource._withHandle(RT_LocationDataSourceHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocationDataSource_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _errorChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setErrorChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceErrorChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setErrorChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _headingChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setHeadingChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceHeadingChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setHeadingChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _locationChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceLocationChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _locationDataSourceStartStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationDataSourceStartCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceStartCallbackEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationDataSourceStartCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _locationDataSourceStopStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationDataSourceStopCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceStopCallbackEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setLocationDataSourceStopCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _statusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDataSourceStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDataSource_setStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );

    _onLocationDataSourceStart.listen((_) => _handleCoreStartEvent());
    _onLocationDataSourceStop.listen((_) => _handleCoreStopEvent());
  }

  late final StreamController<ArcGISException?> _errorChangedStreamController;

  /// Indicates that the [LocationDataSource.error] property has changed.
  Stream<ArcGISException?> get onErrorChanged =>
      _errorChangedStreamController.stream;

  late final StreamController<double> _headingChangedStreamController;

  /// Set the heading changed callback function for the location data source.
  Stream<double> get onHeadingChanged => _headingChangedStreamController.stream;

  late final StreamController<ArcGISLocation> _locationChangedStreamController;

  /// Set the location changed callback function for the location data source.
  Stream<ArcGISLocation> get onLocationChanged =>
      _locationChangedStreamController.stream;

  late final StreamController<void> _locationDataSourceStartStreamController;

  /// Set the start callback function for the location data source. This method
  /// should not be exposed by the RTC provided location data source
  /// implementations (e.g. SimulatedLocationDataSource).
  Stream<void> get _onLocationDataSourceStart =>
      _locationDataSourceStartStreamController.stream;

  late final StreamController<void> _locationDataSourceStopStreamController;

  /// Set the stop callback function for the location data source. This method
  /// should not be exposed by the RTC provided location data source
  /// implementations (e.g. SimulatedLocationDataSource).
  Stream<void> get _onLocationDataSourceStop =>
      _locationDataSourceStopStreamController.stream;

  late final StreamController<LocationDataSourceStatus>
      _statusChangedStreamController;

  /// Set the status changed callback function for the location data source.
  Stream<LocationDataSourceStatus> get onStatusChanged =>
      _statusChangedStreamController.stream;

  static final _instanceCache = _InstanceCache(
      factory: _LocationDataSourceFactory(), kind: 'LocationDataSource');

  late final StreamController<Exception?> _exceptionChangedStreamController;

  /// Creates a location data source object.
  factory LocationDataSource() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_create(errorHandler);
    });
    return LocationDataSource._instanceCache.instanceWith(handle);
  }

  /// An error that describes a problem encountered while starting or running
  /// the [LocationDataSource].
  ///
  /// This property is used to notify the user about errors that occur in
  /// [LocationDataSource]. Such errors are critical for [LocationDataSource]
  /// and will cause it stop. If [LocationDataSource] cannot be started, or it
  /// stopped after a successful start, this property will store information
  /// related to what caused [LocationDataSource] to stop.
  ArcGISException? get error {
    final errorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_getError(_handle, errorHandler);
    });
    return errorHandle.toArcGISException();
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// The current status of the location data source.
  ///
  /// The status indicates if the location data source is starting, started,
  /// stopping, stopped, and has failed to start.
  LocationDataSourceStatus get status {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_getStatus(_handle, errorHandler);
    });
    return LocationDataSourceStatus._fromCoreValue(coreValue);
  }

  /// The user defined error from the location data source.
  ffi.Pointer<ffi.Void> get _userDefinedFailure {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_getUserDefinedFailure(
          _handle, errorHandler);
    });
  }

  Stream<Exception?> get onExceptionChanged =>
      _exceptionChangedStreamController.stream;

  Exception? get exception {
    final error = this.error;
    return error?.wrappedException ?? error;
  }

  /// Handles the call to start. This method should not be exposed by the RTC
  /// provided location data source implementations (e.g.
  /// SimulatedLocationDataSource).
  ///
  /// When you start a location data source, call it along with this function if
  /// something wrong.
  ///
  /// Parameters:
  /// - `userDefinedError` — The error associated with the start. Set to null if
  /// starting successfully.
  void _handleStart({required _ClientReference? userDefinedError}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDataSource_handleStart(
          _handle, userDefinedError?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Handles the call to stop. This method should not be exposed by the RTC
  /// provided location data source implementations (e.g.
  /// SimulatedLocationDataSource).
  ///
  /// When you stop a location data source, call it along with this function.
  void _handleStop() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDataSource_handleStop(_handle, errorHandler);
    });
  }

  /// Starts the location data source asynchronously and prepares to begin
  /// receiving location updates.
  ///
  /// Return Value: a [Future] indicating when the [LocationDataSource] has
  /// started.
  Future<void> start() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_startAsync(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [start]. See that method for more information.
  CancelableOperation<void> startCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_startAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Stops the location data source asynchronously.
  ///
  /// Return Value: a [Future] indicating when the [LocationDataSource] has
  /// stopped.
  Future<void> stop() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_stopAsync(_handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [stop]. See that method for more information.
  CancelableOperation<void> stopCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_stopAsync(_handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Updates the current heading angle, in degrees clockwise, relative to
  /// north.
  ///
  /// Parameters:
  /// - `heading` — a float64 number.
  void updateHeading(double heading) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDataSource_updateHeading(
          _handle, heading, errorHandler);
    });
  }

  /// Updates the position of the current location.
  ///
  /// Parameters:
  /// - `location` — The [ArcGISLocation], a location object.
  void updateLocation(ArcGISLocation location) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDataSource_updateLocation(
          _handle, location._handle, errorHandler);
    });
  }

  Future<void> _doStart() async {
    // To be overridden by subclass.
  }

  Future<void> _doStop() async {
    // To be overridden by subclass.
  }

  void _handleCoreStartEvent() async {
    _ClientReference? userDefinedError;
    try {
      await _doStart();
    } catch (e) {
      userDefinedError =
          _ClientReferenceManager.generateClientReferenceFromDartObject(e);
    }
    _handleStart(userDefinedError: userDefinedError);
  }

  void _handleCoreStopEvent() async {
    await _doStop();
    _handleStop();
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLocationDataSourceErrorChangedEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _errorChangedStreamController.add(event);
      case AsyncType.asyncTypeLocationDataSourceHeadingChangedEvent:
        final event = () {
          return message[2] as double;
        }();
        _headingChangedStreamController.add(event);
      case AsyncType.asyncTypeLocationDataSourceLocationChangedEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_LocationHandle;
          return ArcGISLocation._fromHandle(objectHandle)!;
        }();
        _locationChangedStreamController.add(event);
      case AsyncType.asyncTypeLocationDataSourceStartCallbackEvent:
        _locationDataSourceStartStreamController.add(null);
      case AsyncType.asyncTypeLocationDataSourceStopCallbackEvent:
        _locationDataSourceStopStreamController.add(null);
      case AsyncType.asyncTypeLocationDataSourceStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LocationDataSourceStatus._fromCoreValue(coreValue);
        }();
        _statusChangedStreamController.add(event);
      default:
        logger.f('LocationDataSource unhandled asyncType $asyncType');
    }
  }
}

final class _LocationDataSourceFactory
    implements
        _InstanceFactory<LocationDataSource, RT_LocationDataSourceHandle> {
  @override
  LocationDataSource createInstance(
      {required RT_LocationDataSourceHandle handle}) {
    switch (LocationDataSource._objectTypeOf(handle)) {
      case _LocationDataSourceType.locationDataSource:
        return LocationDataSource._withHandle(handle);
      case _LocationDataSourceType.simulatedLocationDataSource:
        return SimulatedLocationDataSource._withHandle(handle);
      case _LocationDataSourceType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as LocationDataSource');
        return LocationDataSource._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_LocationDataSourceHandle handle) {
    bindings.LocationDataSource_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_LocationDataSourceHandle handle) {
    return runtimecore.RT_LocationDataSource_getInstanceId(handle, ffi.nullptr);
  }
}

/// The list of possible LocationDataSource statuses.
///
/// This is used to determine the status of a LocationDataSource.
enum LocationDataSourceStatus {
  /// The data source is stopped.
  stopped,

  /// The data source is starting.
  starting,

  /// The data source has started.
  started,

  /// The data source is stopping.
  stopping,

  /// The data source has failed to start.
  failedToStart;

  factory LocationDataSourceStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return stopped;
      case 1:
        return starting;
      case 2:
        return started;
      case 3:
        return stopping;
      case 4:
        return failedToStart;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case stopped:
        return 0;
      case starting:
        return 1;
      case started:
        return 2;
      case stopping:
        return 3;
      case failedToStart:
        return 4;
    }
  }
}

/// The list of Location Data Source types.
///
/// This is used to determine the Location Data Source type.
enum _LocationDataSourceType {
  /// The default platform-provided location data source.
  locationDataSource,

  /// A simulated location display for building samples and demo apps.
  simulatedLocationDataSource,

  /// Location data source based on device sensor data.
  indoorsLocationDataSource,

  /// Location data source which provides snapped to route locations.
  routeTrackerLocationDataSource,

  /// Location data source based on parsed NMEA messages.
  nmeaLocationDataSource,

  /// An unknown location data source.
  unknown;

  factory _LocationDataSourceType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return locationDataSource;
      case 1:
        return simulatedLocationDataSource;
      case 2:
        return indoorsLocationDataSource;
      case 3:
        return routeTrackerLocationDataSource;
      case 4:
        return nmeaLocationDataSource;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case locationDataSource:
        return 0;
      case simulatedLocationDataSource:
        return 1;
      case indoorsLocationDataSource:
        return 2;
      case routeTrackerLocationDataSource:
        return 3;
      case nmeaLocationDataSource:
        return 4;
      case unknown:
        return -1;
    }
  }
}

/// An enumeration of the various modes that define how the map view extent
/// reacts to location changes.
enum LocationDisplayAutoPanMode {
  /// Displays the location symbol at the current location without adjusting the
  /// map view's extent, so no auto-panning is performed.
  off,

  /// Centers the map view at the current location, and shows the location
  /// symbol. When the current location changes, the map view is automatically
  /// panned to re-center at the new location. Behavior is affected by the
  /// wander extent factor.
  recenter,

  /// Pans the map view so that the current location symbol is shown near the
  /// bottom of the map view, and rotates the map view to align it with the
  /// direction of travel. When the current location or direction of travel
  /// changes the map view is automatically panned and rotated to maintain this
  /// position. To use this mode effectively, the device location must be moving
  /// at a speed greater than 0 meters per second. Behavior is affected by the
  /// navigation point height factor.
  navigation,

  /// Centers the map view at the current location, rotates the map view to
  /// align with the direction in which the device is currently, and shows the
  /// location symbol. When the current location or position of the device
  /// changes, the map view is automatically panned and rotated to maintain this
  /// position, thus if the device is spun in a circle, the map view stays
  /// aligned with the real world.
  compassNavigation;

  factory LocationDisplayAutoPanMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return off;
      case 1:
        return recenter;
      case 2:
        return navigation;
      case 3:
        return compassNavigation;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case off:
        return 0;
      case recenter:
        return 1;
      case navigation:
        return 2;
      case compassNavigation:
        return 3;
    }
  }
}

/// The list of Location types.
///
/// This is used to determine the Location type.
enum _LocationType {
  /// A basic location.
  location,

  /// A location obtained from an NMEA location source.
  nmeaLocation,

  /// An unknown location.
  unknown;

  factory _LocationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return location;
      case 1:
        return nmeaLocation;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case location:
        return 0;
      case nmeaLocation:
        return 1;
      case unknown:
        return -1;
    }
  }
}

/// A location data source that provides simulated device locations for testing.
///
/// Use this data source to simulate location updates for a device. It uses a
/// collection of [ArcGISLocation] that are sequentially passed to
/// [LocationDataSource.updateLocation]. The location collection can be derived
/// from vertices in a provided polyline, generated evenly along a polyline
/// based on a travel velocity, or assigned to the collection directly.
final class SimulatedLocationDataSource extends LocationDataSource {
  static SimulatedLocationDataSource? _fromHandle(
      RT_SimulatedLocationDataSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocationDataSource._instanceCache.instanceWith(handle);
  }

  SimulatedLocationDataSource._withHandle(super.handle)
      : _locations = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SimulatedLocationDataSource_getLocations(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a simulated location data source.
  factory SimulatedLocationDataSource() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulatedLocationDataSource_create(errorHandler);
    });
    return LocationDataSource._instanceCache.instanceWith(handle);
  }

  /// The index of the item in the location collection that provides the current
  /// location.
  ///
  /// You can get this value to find which item in the
  /// [SimulatedLocationDataSource.locations] collection represents the current
  /// location. You can also provide a new index to skip to a different location
  /// in the collection.
  int get currentLocationIndex {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulatedLocationDataSource_getCurrentLocationIndex(
          _handle, errorHandler);
    });
  }

  set currentLocationIndex(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimulatedLocationDataSource_setCurrentLocationIndex(
          _handle, value, errorHandler);
    });
  }

  /// The rate over which the [SimulatedLocationDataSource.locations] collection
  /// is iterated.
  ///
  /// This controls the frequency of location updates for the simulated location
  /// data source. The default value is 1.0, resulting in calls to
  /// [LocationDataSource.updateLocation] every second. To increase the
  /// frequency, provide a higher value. A value of 2.0, for example, doubles
  /// the frequency of location updates. To slow down updates, provide a lower
  /// value. A value of 0.5, for example, decreases location updates by a factor
  /// of two. The iteration rate does not affect the [ArcGISLocation.timestamp]
  /// property of the items in the [SimulatedLocationDataSource.locations] (they
  /// are always 1 second apart).
  double get iterationRate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulatedLocationDataSource_getIterationRate(
          _handle, errorHandler);
    });
  }

  set iterationRate(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimulatedLocationDataSource_setIterationRate(
          _handle, value, errorHandler);
    });
  }

  /// A collection of locations that are iterated sequentially.
  ///
  /// As the collection is iterated, the [LocationDataSource.updateLocation] is
  /// fired for each location. The frequency at which
  /// [LocationDataSource.updateLocation] is called is determined by
  /// [SimulatedLocationDataSource.iterationRate]. Populate the collection by
  /// calling [SimulatedLocationDataSource.setLocationsWithPolyline] or by
  /// directly assigning a collection of [ArcGISLocation] to this property.
  List<ArcGISLocation> get locations => _locations.value;

  final Memoized<_MutableArrayList<ArcGISLocation>> _locations;

  /// Creates a collection of locations along an input polyline based on
  /// simulation parameters.
  ///
  /// The generated locations are available from the
  /// [SimulatedLocationDataSource.locations] property. Distance between each
  /// location on the polyline is determined by the value of
  /// [SimulationParameters.speed]. If velocity is 10 meters per second, for
  /// example, the distance between locations will be 10 meters. The
  /// [ArcGISLocation.timestamp] values will always be 1 second apart. These
  /// location properties will be set based on the inputs:
  /// [ArcGISLocation.timestamp], [ArcGISLocation.position],
  /// [ArcGISLocation.speed], [ArcGISLocation.horizontalAccuracy],
  /// [ArcGISLocation.verticalAccuracy] The [ArcGISLocation.course] property
  /// will be calculated based on the inputs and the
  /// [ArcGISLocation.isLastKnown] property will not be set.
  ///
  /// Parameters:
  /// - `polyline` — A polyline that defines a simulated travel path.
  /// - `simulationParameters` — Parameters to control how locations are created
  /// from the polyline.
  void setLocationsWithPolyline(Polyline polyline,
      {SimulationParameters? simulationParameters}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_SimulatedLocationDataSource_setLocationsWithPolylineCombined(
              _handle,
              polyline._handle,
              simulationParameters?._handle ?? ffi.nullptr,
              errorHandler);
    });
  }
}

/// Parameters to control how locations are created from a simulated route of
/// travel (Polyline).
///
/// This can be provided as an input to the
/// [SimulatedLocationDataSource.setLocationsWithPolyline] method to specify the
/// start time for the first location, travel velocity (meters per second), and
/// horizontal and vertical accuracy of locations.
final class SimulationParameters implements ffi.Finalizable {
  final RT_SimulationParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.SimulationParameters_destroy.cast());

  static SimulationParameters? _fromHandle(
      RT_SimulationParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SimulationParameters._withHandle(handle);
  }

  SimulationParameters._withHandle(RT_SimulationParametersHandle handle)
      : _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SimulationParameters_getStartTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_SimulationParameters_setStartTime(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SimulationParameters_created(_handle);
    }
  }

  /// Creates a SimulationParameters.
  ///
  /// Parameters:
  /// - `startTime` — Date and time of the first location. Each subsequent
  /// location will increment its timestamp by one second.
  /// - `speed` — Rate of travel, in meters per second.
  /// - `horizontalAccuracy` — The horizontal accuracy to assign to generated
  /// locations.
  /// - `verticalAccuracy` — The vertical accuracy to assign to generated
  /// locations.
  factory SimulationParameters(
      {DateTime? startTime,
      double speed = 10.0,
      double horizontalAccuracy = 0.0,
      double verticalAccuracy = 0.0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreStartTime = startTime?.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulationParameters_createCombined(
          coreStartTime?._handle ?? ffi.nullptr,
          speed,
          horizontalAccuracy,
          verticalAccuracy,
          errorHandler);
    });
    return SimulationParameters._withHandle(handle);
  }

  /// The horizontal accuracy to assign to generated locations.
  ///
  /// The default value is 0.0.
  double get horizontalAccuracy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulationParameters_getHorizontalAccuracy(
          _handle, errorHandler);
    });
  }

  set horizontalAccuracy(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimulationParameters_setHorizontalAccuracy(
          _handle, value, errorHandler);
    });
  }

  /// Rate of travel, in meters per second.
  ///
  /// The default value is 10.0. Note that very small values for velocity may
  /// greatly increase the number of locations created.
  double get speed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulationParameters_getVelocity(
          _handle, errorHandler);
    });
  }

  set speed(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimulationParameters_setVelocity(
          _handle, value, errorHandler);
    });
  }

  /// Date and time of the first location. Each subsequent location will
  /// increment its timestamp by one second.
  DateTime get startTime => _startTime.value;

  set startTime(DateTime value) => _startTime.value = value;

  final Memoized<DateTime> _startTime;

  /// The vertical accuracy to assign to generated locations.
  ///
  /// The default value is 0.0.
  double get verticalAccuracy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimulationParameters_getVerticalAccuracy(
          _handle, errorHandler);
    });
  }

  set verticalAccuracy(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimulationParameters_setVerticalAccuracy(
          _handle, value, errorHandler);
    });
  }
}
