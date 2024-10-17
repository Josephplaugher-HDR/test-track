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

/// A structure that describes a geocode method parameters.
///
/// Structure holding the parameters to support the geocode operation for a
/// geocoding service or local locator.
final class GeocodeParameters implements ffi.Finalizable {
  final RT_GeocodeParametersHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeocodeParameters_destroy.cast());

  static GeocodeParameters? _fromHandle(RT_GeocodeParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeocodeParameters._withHandle(handle);
  }

  GeocodeParameters._withHandle(RT_GeocodeParametersHandle handle)
      : _categories = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeocodeParameters_getCategories(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeocodeParameters_getOutputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeocodeParameters_setOutputSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _resultAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeocodeParameters_getResultAttributeNames(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeocodeParameters_created(_handle);
    }
  }

  /// Creates a new geocode parameters object.
  factory GeocodeParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_create(errorHandler);
    });
    return GeocodeParameters._withHandle(handle);
  }

  /// Categories.
  ///
  /// Determines addresses from which the categories should be returned.
  List<String> get categories => _categories.value;

  final Memoized<_MutableArrayList<String>> _categories;

  /// Country code.
  ///
  /// Determines addresses from which the country should be returned.
  String get countryCode {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getCountryCode(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set countryCode(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setCountryCode(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// For storage property.
  ///
  /// Specifies whether the results of the operation will be persisted. The
  /// default value is false, which indicates the results of the operation can't
  /// be stored. If you store the results, in a database for example, you need
  /// to set this parameter to true.
  bool get forStorage {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getForStorage(
          _handle, errorHandler);
    });
  }

  set forStorage(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setForStorage(
          _handle, value, errorHandler);
    });
  }

  /// Max results.
  ///
  /// Determines the maximum count of candidates which should be returned. By
  /// default should be returned all found candidates.
  int get maxResults {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getMaxResults(
          _handle, errorHandler);
    });
  }

  set maxResults(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setMaxResults(
          _handle, value, errorHandler);
    });
  }

  /// Min score.
  ///
  /// Determines addresses the minimal score value (score threshold) \[0..100].
  /// By default used 0 and get real value from locator properties.
  double get minScore {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getMinScore(
          _handle, errorHandler);
    });
  }

  set minScore(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setMinScore(
          _handle, value, errorHandler);
    });
  }

  /// Output language code.
  ///
  /// Determines the language of candidate labels which should be returned.
  String get outputLanguageCode {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getOutputLanguageCode(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set outputLanguageCode(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setOutputLanguageCode(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Output spatial reference.
  ///
  /// The spatial reference for candidate geometries.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  set outputSpatialReference(SpatialReference? value) =>
      _outputSpatialReference.value = value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Preferred search location.
  ///
  /// Distance specifying with location the preferred area where candidates will
  /// be searched. Supported value from interval \[1000..50000], 50000 by
  /// default.
  ArcGISPoint? get preferredSearchLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getPreferredSearchLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set preferredSearchLocation(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setPreferredSearchLocation(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Attribute names.
  ///
  /// Array of candidate attribute names indicating which attributes should be
  /// returned for every candidate. For empty array return only default
  /// attributes, "*" means all attributes will be returned.
  List<String> get resultAttributeNames => _resultAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _resultAttributeNames;

  /// Search area.
  ///
  /// Envelope specifying the area where candidates will be searched.
  Geometry? get searchArea {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeParameters_getSearchArea(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set searchArea(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeocodeParameters_setSearchArea(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }
}

/// A match candidate returned from a [LocatorTask] geocode or reverse geocode
/// operation.
///
/// [GeocodeResult] provides information about the candidate, such as a
/// collection of requested attribute values, user-friendly label text, and
/// locations suited for accurate match display or for routing input.
final class GeocodeResult implements ffi.Finalizable {
  final RT_GeocodeResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeocodeResult_destroy.cast());

  static GeocodeResult? _fromHandle(RT_GeocodeResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeocodeResult._withHandle(handle);
  }

  GeocodeResult._withHandle(RT_GeocodeResultHandle handle)
      : _attributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeocodeResult_getAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeocodeResult_created(_handle);
    }
  }

  /// A collection of attributes as requested by
  /// [GeocodeParameters.resultAttributeNames] or
  /// [ReverseGeocodeParameters.resultAttributeNames].
  ///
  /// Available attributes depend on the data stored with the locator, and can
  /// include things like place name, URL, phone number, and so on.
  Map<String, dynamic> get attributes => _attributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>> _attributes;

  /// Location of the candidate suitable for display on a map.
  ///
  /// For example, this may provide a more precise rooftop location of a house,
  /// whereas [GeocodeResult.routeLocation] represents the nearest street
  /// location.
  ArcGISPoint? get displayLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getDisplayLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// An extent suitable for zooming the map to display the candidate.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The [ArcGISPoint] provided as input to [LocatorTask.reverseGeocode].
  ///
  /// Only applicable for results of reverse-geocode operations.
  ArcGISPoint? get inputLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getInputLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// User-friendly text that describes this result.
  String get label {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getLabel(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The nearest street location for the result.
  ///
  /// Use this location if you want to use the candidate as a stop in a route.
  /// For example, [GeocodeResult.displayLocation] may provide a more precise
  /// rooftop location of a house, whereas [GeocodeResult.routeLocation] will
  /// provide the nearest street location.
  ArcGISPoint? get routeLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getRouteLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// A value that indicates how well the address was matched.
  ///
  /// The score is in a range between 0 (no match) and 100 (perfect match).
  double get score {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeocodeResult_getScore(_handle, errorHandler);
    });
  }
}

/// A class that declares description of attributes.
final class LocatorAttribute implements ffi.Finalizable {
  final RT_LocatorAttributeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LocatorAttribute_destroy.cast());

  static LocatorAttribute? _fromHandle(RT_LocatorAttributeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocatorAttribute._withHandle(handle);
  }

  LocatorAttribute._withHandle(RT_LocatorAttributeHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocatorAttribute_created(_handle);
    }
  }

  /// Display name.
  ///
  /// Display name (alias) of attribute.
  String get displayName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorAttribute_getDisplayName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Name.
  ///
  /// Name of attribute.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorAttribute_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Required status of locator attribute.
  ///
  /// Determines attribute is mandatory.
  bool get required_ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorAttribute_getRequired(_handle, errorHandler);
    });
  }

  /// Type of locator attribute.
  ///
  /// An enumeration that represents semantic type of attribute.
  _ElementType get _type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorAttribute_getType(_handle, errorHandler);
    });
    return _ElementType._fromCoreValue(coreValue);
  }
}

/// A class that contains information about supports the ability and return
/// attributes.
///
/// Class containing the information for a [LocatorTask], either an online
/// locator created from an ArcGIS geocode service, or a local locator created
/// from local data.
final class LocatorInfo implements ffi.Finalizable {
  final RT_LocatorInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LocatorInfo_destroy.cast());

  static LocatorInfo? _fromHandle(RT_LocatorInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocatorInfo._withHandle(handle);
  }

  LocatorInfo._withHandle(RT_LocatorInfoHandle handle)
      : _intersectionResultAttributes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorInfo_getIntersectionResultAttributes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _properties = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorInfo_getProperties(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _resultAttributes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorInfo_getResultAttributes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _searchAttributes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorInfo_getSearchAttributes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorInfo_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocatorInfo_created(_handle);
    }
  }

  /// Description of locator.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Intersection result attributes.
  ///
  /// Array of output fields for intersections geocoding. Empty if intersections
  /// geocoding is not supported.
  List<LocatorAttribute> get intersectionResultAttributes =>
      _intersectionResultAttributes.value;

  final Memoized<_ArrayList<LocatorAttribute>> _intersectionResultAttributes;

  /// Name of locator.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Properties of locator task.
  Map<String, String> get properties => _properties.value;

  final Memoized<_UnmodifiableDictionaryMap<String, String>> _properties;

  /// Result attributes.
  ///
  /// Array of output fields for addresses geocoding.
  List<LocatorAttribute> get resultAttributes => _resultAttributes.value;

  final Memoized<_ArrayList<LocatorAttribute>> _resultAttributes;

  /// Search attributes.
  ///
  /// Array of input fields for multiline addresses geocoding.
  List<LocatorAttribute> get searchAttributes => _searchAttributes.value;

  final Memoized<_ArrayList<LocatorAttribute>> _searchAttributes;

  /// Spatial reference.
  ///
  /// Locator task internal spatial reference.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Supports of addresses.
  ///
  /// True if addresses (point address or street address) are supported by
  /// locator task.
  bool get supportsAddresses {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getSupportsAddresses(
          _handle, errorHandler);
    });
  }

  /// Supports of intersections.
  ///
  /// True if intersections a supported by locator task.
  bool get supportsIntersections {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getSupportsIntersections(
          _handle, errorHandler);
    });
  }

  /// Supports of POI.
  ///
  /// True if POI is supported by locator task.
  bool get supportsPoi {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getSupportsPOI(_handle, errorHandler);
    });
  }

  /// Supports of suggestions.
  ///
  /// True if suggest is supported by locator task.
  bool get supportsSuggestions {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getSupportsSuggestions(
          _handle, errorHandler);
    });
  }

  /// Version of locator task.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorInfo_getVersion(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// A class can be used to convert an address to a point (geocode) or vice-versa
/// (reverse geocode).
///
/// [LocatorTask] involves finding matching locations for a given address.
/// Reverse-geocoding is the opposite and involves finding corresponding
/// addresses for a given location.
final class LocatorTask
    with Loadable
    implements ApiKeyResource, _CallbackReceiver, ffi.Finalizable {
  final RT_LocatorTaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LocatorTask_destroy.cast());

  static LocatorTask? _fromHandle(RT_LocatorTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocatorTask._withHandle(handle);
  }

  LocatorTask._withHandle(RT_LocatorTaskHandle handle)
      : _locatorInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorTask_getLocatorInfo(
                handle, errorHandler);
          });
          return LocatorInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocatorTask_getURI(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocatorTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocatorTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocatorTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocatorTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocatorTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a new locator task object.
  ///
  /// Parameters:
  /// - `uri` — The URI of online service or local locator.
  factory LocatorTask.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_createWithURI(
          coreURI.bytes, errorHandler);
    });
    return LocatorTask._withHandle(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocatorTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Locator info.
  ///
  /// Information about locator.
  LocatorInfo? get locatorInfo => _locatorInfo.value;

  final Memoized<LocatorInfo?> _locatorInfo;

  /// The URI of online service or local locator.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Geocodes address with parameters and returns candidates.
  ///
  /// Executes a geocoding operation to find location candidates for a given
  /// address.
  ///
  /// Parameters:
  /// - `searchText` — Address inputs.
  /// - `parameters` — Geocode method parameters.
  ///
  /// Return Value: A [Future] returning a [List] of [GeocodeResult]
  Future<List<GeocodeResult>> geocode(
      {required String searchText, GeocodeParameters? parameters}) {
    final coreSearchText = _CString(searchText);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithParameters(
          _handle,
          coreSearchText.bytes,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [geocode]. See that method for more information.
  CancelableOperation<List<GeocodeResult>> geocodeCancelable(
      {required String searchText, GeocodeParameters? parameters}) {
    final coreSearchText = _CString(searchText);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithParameters(
          _handle,
          coreSearchText.bytes,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Geocodes multiline address with parameters and returns candidates.
  ///
  /// Executes a geocoding operation to find location candidates for a given
  /// multiline address.
  ///
  /// Parameters:
  /// - `searchValues` — Multiline address inputs.
  /// - `parameters` — Geocode method parameters.
  ///
  /// Return Value: A [Future] returning a [List] of [GeocodeResult]
  Future<List<GeocodeResult>> geocodeWithSearchValues(
      Map<String, String> searchValues,
      {GeocodeParameters? parameters}) {
    final coreSearchValues = searchValues.toDictionary(
        keyType: _ElementType.string, valueType: _ElementType.string);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithSearchValuesAndParameters(
          _handle,
          coreSearchValues._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [geocodeWithSearchValues]. See that method for more
  /// information.
  CancelableOperation<List<GeocodeResult>> geocodeWithSearchValuesCancelable(
      Map<String, String> searchValues,
      {GeocodeParameters? parameters}) {
    final coreSearchValues = searchValues.toDictionary(
        keyType: _ElementType.string, valueType: _ElementType.string);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithSearchValuesAndParameters(
          _handle,
          coreSearchValues._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Geocodes suggest with parameters and returns candidates.
  ///
  /// Executes geocoding based on result of suggestion.
  ///
  /// Parameters:
  /// - `suggestResult` — Suggest method result.
  /// - `parameters` — Geocode parameters.
  ///
  /// Return Value: A [Future] returning a [List] of [GeocodeResult]
  Future<List<GeocodeResult>> geocodeWithSuggestResult(
      SuggestResult suggestResult,
      {GeocodeParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithSuggestResultAndParameters(
          _handle,
          suggestResult._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [geocodeWithSuggestResult]. See that method for more
  /// information.
  CancelableOperation<List<GeocodeResult>> geocodeWithSuggestResultCancelable(
      SuggestResult suggestResult,
      {GeocodeParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_geocodeWithSuggestResultAndParameters(
          _handle,
          suggestResult._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Finds address with parameters by location point.
  ///
  /// Executes a reverse-geocoding operation to find address candidates for a
  /// given location.
  ///
  /// Parameters:
  /// - `location` — The location point.
  /// - `parameters` — The  reverse geocode parameters.
  ///
  /// Return Value: A [Future] returning a [List] of [GeocodeResult]
  Future<List<GeocodeResult>> reverseGeocode(
      {required ArcGISPoint location, ReverseGeocodeParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_reverseGeocodeCombined(_handle,
          location._handle, parameters?._handle ?? ffi.nullptr, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [reverseGeocode]. See that method for more
  /// information.
  CancelableOperation<List<GeocodeResult>> reverseGeocodeCancelable(
      {required ArcGISPoint location, ReverseGeocodeParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_reverseGeocodeCombined(_handle,
          location._handle, parameters?._handle ?? ffi.nullptr, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Suggest address with parameters and returns possible variants.
  ///
  /// Geocoding suggestions provide a mechanism for implementing
  /// character-by-character auto-complete. Using a text input and optional
  /// [SuggestParameters], suggested addresses can be quickly found and
  /// presented to the user. Suggestions are not limited to addresses, they can
  /// also be used for POIs (Points of Interest). To return a focused set of
  /// suggestions, set the [SuggestParameters.preferredSearchLocation] or the
  /// [SuggestParameters.searchArea]. Using the
  /// [SuggestParameters.preferredSearchLocation] is similar to how ArcGIS Pro
  /// limits the suggestions returned.
  ///
  /// Parameters:
  /// - `searchText` — Part of address text.
  /// - `parameters` — Suggest method parameters.
  ///
  /// Return Value: A [Future] returning a [List] of [SuggestResult]
  Future<List<SuggestResult>> suggest(
      {required String searchText, SuggestParameters? parameters}) {
    final coreSearchText = _CString(searchText);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_suggestCombined(
          _handle,
          coreSearchText.bytes,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [suggest]. See that method for more information.
  CancelableOperation<List<SuggestResult>> suggestCancelable(
      {required String searchText, SuggestParameters? parameters}) {
    final coreSearchText = _CString(searchText);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_suggestCombined(
          _handle,
          coreSearchText.bytes,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocatorTask_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocatorTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocatorTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocatorTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _locatorInfo.invalidateCache();
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
        logger.f('LocatorTask unhandled asyncType $asyncType');
    }
  }
}

/// A class that describes a reverse geocode method parameters.
///
/// Structure holding the parameters to support the reverse geocode operation
/// for a geocoding service or local locator.
final class ReverseGeocodeParameters implements ffi.Finalizable {
  final RT_ReverseGeocodeParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ReverseGeocodeParameters_destroy.cast());

  static ReverseGeocodeParameters? _fromHandle(
      RT_ReverseGeocodeParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ReverseGeocodeParameters._withHandle(handle);
  }

  ReverseGeocodeParameters._withHandle(RT_ReverseGeocodeParametersHandle handle)
      : _featureTypes = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ReverseGeocodeParameters_getFeatureTypes(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ReverseGeocodeParameters_getOutputSpatialReference(
                    handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ReverseGeocodeParameters_setOutputSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _resultAttributeNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ReverseGeocodeParameters_getResultAttributeNames(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ReverseGeocodeParameters_created(_handle);
    }
  }

  /// Creates a new reverse geocode parameters object.
  factory ReverseGeocodeParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ReverseGeocodeParameters_create(errorHandler);
    });
    return ReverseGeocodeParameters._withHandle(handle);
  }

  /// Feature types.
  ///
  /// Determines what feature types of address which should be returned.
  List<String> get featureTypes => _featureTypes.value;

  final Memoized<_MutableArrayList<String>> _featureTypes;

  /// For storage property.
  ///
  /// Specifies whether the results of the operation will be persisted. The
  /// default value is false, which indicates the results of the operation can't
  /// be stored. If you store the results, in a database for example, you need
  /// to set this parameter to true.
  bool get forStorage {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ReverseGeocodeParameters_getForStorage(
          _handle, errorHandler);
    });
  }

  set forStorage(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ReverseGeocodeParameters_setForStorage(
          _handle, value, errorHandler);
    });
  }

  /// Distance specifying with location the area where candidates will be
  /// searched in meters.
  ///
  /// Distance specifying with location the area where candidates will be
  /// searched \[meters]. Supported value in a range between 1000 and 50000
  /// meters, 1000 meters by default.
  double get maxDistance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ReverseGeocodeParameters_getMaxDistance(
          _handle, errorHandler);
    });
  }

  set maxDistance(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ReverseGeocodeParameters_setMaxDistance(
          _handle, value, errorHandler);
    });
  }

  /// Max locations.
  ///
  /// Determines the maximum count of candidates which should be returned. By
  /// default should be returned all found candidates.
  int get maxResults {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ReverseGeocodeParameters_getMaxResults(
          _handle, errorHandler);
    });
  }

  set maxResults(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ReverseGeocodeParameters_setMaxResults(
          _handle, value, errorHandler);
    });
  }

  /// Output language code.
  ///
  /// Determines addresses with which the language should be returned.
  String get outputLanguageCode {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ReverseGeocodeParameters_getOutputLanguageCode(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set outputLanguageCode(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ReverseGeocodeParameters_setOutputLanguageCode(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Output spatial reference.
  ///
  /// The spatial reference for candidate geometries.
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  set outputSpatialReference(SpatialReference? value) =>
      _outputSpatialReference.value = value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Array of geocode result attribute names indicating which attributes should
  /// be returned for every result.
  ///
  /// For empty array return only default attributes, "*" means all attributes
  /// will be returned.
  List<String> get resultAttributeNames => _resultAttributeNames.value;

  final Memoized<_MutableArrayList<String>> _resultAttributeNames;
}

/// A structure representing parameters for a geocoding suggestion operation.
///
/// Geocoding suggestions provide character-by-character auto-completion for
/// facilitating interactive search experiences.
final class SuggestParameters implements ffi.Finalizable {
  final RT_SuggestParametersHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SuggestParameters_destroy.cast());

  static SuggestParameters? _fromHandle(RT_SuggestParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SuggestParameters._withHandle(handle);
  }

  SuggestParameters._withHandle(RT_SuggestParametersHandle handle)
      : _categories = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SuggestParameters_getCategories(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SuggestParameters_created(_handle);
    }
  }

  /// Creates a new suggest parameters object.
  factory SuggestParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestParameters_create(errorHandler);
    });
    return SuggestParameters._withHandle(handle);
  }

  /// Categories.
  ///
  /// Determines addresses from which categories should be returned.
  List<String> get categories => _categories.value;

  final Memoized<_MutableArrayList<String>> _categories;

  /// Country code.
  ///
  /// Determines addresses from which the country should be returned.
  String get countryCode {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestParameters_getCountryCode(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set countryCode(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SuggestParameters_setCountryCode(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Max results.
  ///
  /// Determines the maximum number of returned suggestions. Supported value
  /// from interval \[1..15], 5 by default.
  int get maxResults {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestParameters_getMaxResults(
          _handle, errorHandler);
    });
  }

  set maxResults(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SuggestParameters_setMaxResults(
          _handle, value, errorHandler);
    });
  }

  /// Preferred search location.
  ///
  /// Point specifying the preferred location where candidates will be searched.
  ArcGISPoint? get preferredSearchLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestParameters_getPreferredSearchLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set preferredSearchLocation(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SuggestParameters_setPreferredSearchLocation(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Search area.
  ///
  /// Input geometry specifying the area where candidates will be searched.
  Geometry? get searchArea {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestParameters_getSearchArea(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set searchArea(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SuggestParameters_setSearchArea(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }
}

/// A class representing the result of a geocoding suggestion operation.
///
/// A suggestion result can be forwarded to geocoding find operation.
final class SuggestResult implements ffi.Finalizable {
  final RT_SuggestResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SuggestResult_destroy.cast());

  static SuggestResult? _fromHandle(RT_SuggestResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SuggestResult._withHandle(handle);
  }

  SuggestResult._withHandle(RT_SuggestResultHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SuggestResult_created(_handle);
    }
  }

  /// A flag that indicates candidate is related to a category or group.
  ///
  /// Candidate can be related with a category or group for example 'coffee', or
  /// some business name for example 'Starbucks'.
  bool get isCollection {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestResult_getIsCollection(
          _handle, errorHandler);
    });
  }

  /// Label.
  ///
  /// A label that contains suggested address.
  String get label {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SuggestResult_getLabel(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}
