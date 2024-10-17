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

/// A layer that can visualize data from an ArcGIS map service using dynamically
/// generated map images.
///
/// An ArcGIS map image layer displays a map from an ArcGIS MapServer REST
/// service endpoint. Each time a request is made to the map server, layers
/// contained in the map are rendered by the server and returned to the client
/// as a single image of the map. While the image itself does not contain
/// information about the features it displays, you can access and control the
/// visual appearance of the layers using the
/// [ArcGISMapImageLayer.arcGISMapImageSublayers] collection.
///
/// Functional characteristics
///
/// Map images are created and returned by the server on every request, so they
/// show the latest data at the time of the request. You can specify
/// characteristics of the image, such as [ImageAdjustmentLayer.brightness],
/// [ImageAdjustmentLayer.contrast], [ImageAdjustmentLayer.gamma], and
/// [Layer.opacity]. If you obtain the associated sublayers of the
/// [ArcGISMapImageLayer] using the
/// [ArcGISMapImageLayer.arcGISMapImageSublayers] property, you can control the
/// sublayer's visibility and its [ArcGISSublayer.definitionExpression]. If you
/// want the background color for the map image to be transparent, you must set
/// the [ArcGISMapImageLayer.imageFormat] to PNG.
///
/// The underlying [ServiceFeatureTable], for each map image sublayer or for
/// non-spatial tables used in the service, can be accessed via the
/// [ArcGISMapImageLayer.tables] property. These tables can be queried using any
/// valid combination of attribute, spatial, and temporal criteria via the
/// numerous query methods. You can also query for
/// [FeatureTable.queryStatistics] to see summary statistics or to find related
/// features in other tables via the numerous query methods.
///
/// This layer supports time-based filtering.
///
/// Performance characteristics
///
/// The ArcGIS map service creates map images on the fly. This rendering time
/// depends on the amount and complexity of the data in the map. It will
/// typically be slower than fetching the equivalent map as previously rendered
/// and cached tiles via an [ArcGISTiledLayer]. Because the server renders the
/// map, map image layers require less processing time on the client than
/// similar maps rendered locally.
///
/// ArcGIS map image layers are good candidates for showing features that change
/// periodically, or that require filtering by the user. Although rendering
/// occurs on the server, you have access to service feature tables for all
/// sublayers (as well as non-spatial tables and relationships).
final class ArcGISMapImageLayer extends ImageAdjustmentLayer
    implements TimeAware, _CallbackReceiver, _Refreshable {
  static ArcGISMapImageLayer? _fromHandle(RT_ArcGISMapImageLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  ArcGISMapImageLayer._withHandle(super.handle)
      : _arcGISMapImageSublayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getMapImageSublayers(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _arcGISMapServiceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getMapServiceInfo(
                handle, errorHandler);
          });
          return ArcGISMapServiceInfo._fromHandle(objectHandle);
        }),
        _tables = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getTables(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getURI(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _timeInterval = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getTimeInterval(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }),
        _timeOffset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageLayer_getTimeOffset(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ArcGISMapImageLayer_setTimeOffset(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _fullTimeExtentChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISMapImageLayer_setFullTimeExtentChangedCallback(
              _handle,
              bindings.addresses.asyncTimeAwareFullTimeExtentChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISMapImageLayer_setFullTimeExtentChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<TimeExtent?>
      _fullTimeExtentChangedStreamController;

  @override
  Stream<TimeExtent?> get onFullTimeExtentChanged =>
      _fullTimeExtentChangedStreamController.stream;

  /// Creates an ArcGIS map image layer from a [PortalItem] representing an
  /// ArcGIS map service.
  ///
  /// The item's type should be [PortalItemType.arcGISMapService].
  ///
  /// Parameters:
  /// - `item` — A portal item of type [PortalItemType.arcGISMapService].
  factory ArcGISMapImageLayer.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_createWithItem(
          item._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates an ArcGIS map image layer from the specified URI.
  ///
  /// If the specified URI is a map service URL, the MapServer must have "Single
  /// Fused Map Cache" set to false in its ArcGIS REST Services Directory. If
  /// the specified URI is a portal item URL, the underlying [PortalItem] is
  /// created and can be accessed through [Layer.item]. See [PortalItem.withUri]
  /// for the supported URL formats.
  ///
  /// Parameters:
  /// - `uri` — The URL to the endpoint of an ArcGIS map service or to an ArcGIS
  /// map service portal item.
  factory ArcGISMapImageLayer.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_createWithURI(
          coreURI.bytes, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// The sublayers of an ArcGIS map image layer.
  ///
  /// The collection is specific to a layer so you can't reuse a sublayer
  /// collection coming from another [ArcGISMapImageLayer] or [ArcGISSublayer].
  /// You have to create a new layer collection.
  List<ArcGISMapImageSublayer> get arcGISMapImageSublayers =>
      _arcGISMapImageSublayers.value;

  final Memoized<_MutableArrayList<ArcGISMapImageSublayer>>
      _arcGISMapImageSublayers;

  /// The ArcGIS map service information.
  ///
  /// This information is available after the layer has successfully loaded.
  ArcGISMapServiceInfo? get arcGISMapServiceInfo => _arcGISMapServiceInfo.value;

  final Memoized<ArcGISMapServiceInfo?> _arcGISMapServiceInfo;

  @override
  TimeExtent? get fullTimeExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getFullTimeExtent(
          _handle, errorHandler);
    });
    return TimeExtent._fromHandle(objectHandle);
  }

  /// The geodatabase version of the map image layer.
  String get geodatabaseVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getGeodatabaseVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set geodatabaseVersion(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageLayer_setGeodatabaseVersion(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The image format used to generate map images on this layer.
  ///
  /// If imageFormat value is [MapServiceImageFormat.default_], the default
  /// image format is defined by the service.
  MapServiceImageFormat get imageFormat {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getImageFormat(
          _handle, errorHandler);
    });
    return MapServiceImageFormat._fromCoreValue(coreValue);
  }

  set imageFormat(MapServiceImageFormat value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageLayer_setImageFormat(
          _handle, value.coreValue, errorHandler);
    });
  }

  @override
  bool get isTimeFilteringEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getIsTimeFilteringEnabled(
          _handle, errorHandler);
    });
  }

  @override
  set isTimeFilteringEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageLayer_setIsTimeFilteringEnabled(
          _handle, value, errorHandler);
    });
  }

  @override
  int get refreshInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getRefreshInterval(
          _handle, errorHandler);
    });
  }

  @override
  set refreshInterval(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageLayer_setRefreshInterval(
          _handle, value, errorHandler);
    });
  }

  @override
  bool get supportsTimeFiltering {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_getSupportsTimeFiltering(
          _handle, errorHandler);
    });
  }

  /// The read-only collection of non-spatial tables in the map image layer.
  ///
  /// The collection is specific to this map image layer. Tables are not loaded
  /// by default. You can load a table by calling [FeatureTable.load] or
  /// [ArcGISMapImageLayer.loadTablesAndLayers]. Alternatively, tables are
  /// loaded internally when asynchronous operations like query are performed.
  List<ServiceFeatureTable> get tables => _tables.value;

  final Memoized<_ArrayList<ServiceFeatureTable>> _tables;

  @override
  TimeValue? get timeInterval => _timeInterval.value;

  final Memoized<TimeValue?> _timeInterval;

  @override
  TimeValue? get timeOffset => _timeOffset.value;

  @override
  set timeOffset(TimeValue? value) => _timeOffset.value = value;

  final Memoized<TimeValue?> _timeOffset;

  /// The URL to the REST endpoint of an ArcGIS map service.
  ///
  /// The URI is available after the layer has successfully loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Creates an ArcGIS map image layer from a JSON string.
  ///
  /// Parameters:
  /// - `json` — The JSON data describing the service.
  ///
  /// Return Value: An [ArcGISMapImageLayer] which is a [Layer].
  static ArcGISMapImageLayer? _fromJson(String json) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreJSON = _CString(json);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_fromJSON(
          coreJSON.bytes, errorHandler);
    });
    return ArcGISMapImageLayer._fromHandle(objectHandle);
  }

  /// Loads all of the ArcGIS map service's sublayers and non-spatial tables.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> loadTablesAndLayers() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_loadTablesAndLayers(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [loadTablesAndLayers]. See that method for more
  /// information.
  CancelableOperation<void> loadTablesAndLayersCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageLayer_loadTablesAndLayers(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Resets the sublayers of a map image layer to the default values defined by
  /// the service.
  ///
  /// After this call, any changes to the sublayers (either by using an
  /// ArcGISMapImageSublayer setter or by changing the sublayer collections) are
  /// lost. The sublayer hierarchy returns to its initial state (defined by the
  /// service) and image requests to display the layer will no longer use the
  /// dynamic layer capabilities of the service. All [ArcGISMapImageSublayer]
  /// objects will be recreated.
  void resetSublayers() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageLayer_resetSublayers(_handle, errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeTimeAwareFullTimeExtentChangedEvent:
        _fullTimeExtentChangedStreamController.add(fullTimeExtent);
      default:
        super._processCallback(message);
    }
  }
}

/// A sublayer of an ArcGIS map image layer.
///
/// [ArcGISMapImageSublayer] provides access to layers that comprise an
/// [ArcGISMapImageLayer]. Once the [ArcGISMapImageLayer] has loaded, you can
/// obtain its map image sublayers from the
/// [ArcGISMapImageLayer.arcGISMapImageSublayers] collection. You can obtain the
/// ArcGIS map service information for each of these sublayers from the
/// [ArcGISSublayer.arcGISMapServiceSublayerInfo].
///
/// If one of the sublayers is a group layer (where the
/// [ArcGISMapServiceSublayerInfo.sublayerType] is
/// [ArcGISMapServiceSublayerType.groupLayer]), it will also have a collection
/// of sublayers. Use [ArcGISSublayer.sublayers] to obtain the collection of
/// sublayers. If one of these sublayers is a group layer it will also contain a
/// collection of sublayers, and so on.
///
/// If you know the sublayer Id, you can create it from the
/// `ArcGISMapImageSublayer.new` constructor.
///
/// Once you have obtained the sublayer, you can change the data that is
/// displayed by the [ArcGISMapImageLayer] by setting the sublayer's visibility,
/// layer definition expression, and other visual properties such as renderer
/// and scale.
final class ArcGISMapImageSublayer extends ArcGISSublayer {
  static ArcGISMapImageSublayer? _fromHandle(
      RT_ArcGISMapImageSublayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSublayer._instanceCache.instanceWith(handle);
  }

  ArcGISMapImageSublayer._withHandle(super.handle)
      : _source = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageSublayer_getSource(
                handle, errorHandler);
          });
          return SublayerSource._fromHandle(objectHandle);
        }),
        _table = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapImageSublayer_getTable(
                handle, errorHandler);
          });
          return ServiceFeatureTable._fromHandle(objectHandle);
        }),
        super._withHandle() {
    _renderer.setter = (value) {
      _withThrowingErrorHandler((errorHandler) {
        runtimecore.RT_ArcGISMapImageSublayer_setRenderer(
            _handle, value?._handle ?? ffi.nullptr, errorHandler);
      });
    };
  }

  /// Creates an ArcGIS map image sublayer with the specified sublayer id and a
  /// source.
  ///
  /// Only map services that support dynamic layers will be able to manage
  /// sublayers with sublayer sources. The ArcGIS MapServer must have `Supports
  /// Dynamic Layers` equal to true in the ArcGIS REST Services Directory. For
  /// sublayer sources other than rasters, you must set an
  /// [ArcGISMapImageSublayer.renderer].
  ///
  /// Parameters:
  /// - `id` — The sublayer id.
  /// - `source` — The sublayer source.
  factory ArcGISMapImageSublayer({required int id, SublayerSource? source}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageSublayer_createCombined(
          id, source?._handle ?? ffi.nullptr, errorHandler);
    });
    final ArcGISMapImageSublayer object =
        ArcGISSublayer._instanceCache.instanceWith(handle);
    object._source.cache(source);
    return object;
  }

  /// The sublayer's default visibility.
  ///
  /// The sublayer default visibility. Will return false if an error occurs.
  bool get defaultVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapImageSublayer_getDefaultVisibility(
          _handle, errorHandler);
    });
  }

  set definitionExpression(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setDefinitionExpression(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  set labelsEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setLabelsEnabled(
          _handle, value, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setMaxScale(
          _handle, value, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setMinScale(
          _handle, value, errorHandler);
    });
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setOpacity(
          _handle, value, errorHandler);
    });
  }

  set renderer(Renderer? value) => _renderer.value = value;

  set scaleSymbols(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISMapImageSublayer_setScaleSymbols(
          _handle, value, errorHandler);
    });
  }

  /// The sublayer's source if available.
  SublayerSource? get source => _source.value;

  final Memoized<SublayerSource?> _source;

  /// The sublayer's feature table.
  ///
  /// This only applies to sublayers of type
  /// [ArcGISMapServiceSublayerType.featureLayer] or
  /// [ArcGISMapServiceSublayerType.table]. This method returns null if the
  /// sublayer has not been loaded.
  ServiceFeatureTable? get table => _table.value;

  final Memoized<ServiceFeatureTable?> _table;
}

/// A base class for ArcGIS sublayer classes such as [ArcGISMapImageSublayer],
/// `ArcGISTiledSublayer` and `SubtypeSublayer`.
///
/// Some layers, such as [ArcGISMapImageLayer], [ArcGISTiledLayer], and
/// `SubtypeFeatureLayer`, represent a collection of layers that are referred to
/// as sublayers. For example, [ArcGISMapImageLayer] represents the collection
/// of [ArcGISMapImageLayer.arcGISMapImageSublayers].
///
/// If one of the sublayers is a group layer (where the
/// [ArcGISMapServiceSublayerInfo.sublayerType] is
/// [ArcGISMapServiceSublayerType.groupLayer], for example), it will also have a
/// collection of sublayers. Use [ArcGISSublayer.sublayers] to obtain the
/// collection of sublayers. If one of these sublayers is a group layer it will
/// also contain a collection of sublayers, and so on.
///
/// Note: Some of the sublayer properties can only be accessed once the sublayer
/// has loaded.
final class ArcGISSublayer
    with Loadable
    implements LayerContent, _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_ArcGISSublayerHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISSublayer_destroyInstance.cast());

  static ArcGISSublayer? _fromHandle(RT_ArcGISSublayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSublayer._instanceCache.instanceWith(handle);
  }

  static _ArcGISSublayerType _objectTypeOf(RT_ArcGISSublayerHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getObjectType(handle, errorHandler);
    });
    return _ArcGISSublayerType._fromCoreValue(coreValue);
  }

  _ArcGISSublayerType get _objectType => ArcGISSublayer._objectTypeOf(_handle);

  ArcGISSublayer._withHandle(RT_ArcGISSublayerHandle handle)
      : _arcGISMapServiceSublayerInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISSublayer_getMapServiceSublayerInfo(
                handle, errorHandler);
          });
          return ArcGISMapServiceSublayerInfo._fromHandle(objectHandle);
        }),
        _renderer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISSublayer_getRenderer(
                handle, errorHandler);
          });
          return Renderer._fromHandle(objectHandle);
        }),
        _sublayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISSublayer_getSublayers(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISSublayer_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _subLayerContentChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setSubLayerContentChangedCallback(
              _handle,
              bindings.addresses.asyncLayerContentSubLayerContentChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setSubLayerContentChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISSublayer_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<List<LayerContent>>
      _subLayerContentChangedStreamController;

  @override
  Stream<List<LayerContent>> get onSubLayerContentChanged =>
      _subLayerContentChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _ArcGISSublayerFactory(), kind: 'ArcGISSublayer');

  /// The sublayer's metadata.
  ///
  /// The sublayer metadata once the sublayer is loaded. Will return null if an
  /// error occurs or if the sublayer is not loaded.
  ArcGISMapServiceSublayerInfo? get arcGISMapServiceSublayerInfo =>
      _arcGISMapServiceSublayerInfo.value;

  final Memoized<ArcGISMapServiceSublayerInfo?> _arcGISMapServiceSublayerInfo;

  @override
  bool get canChangeVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getCanChangeVisibility(
          _handle, errorHandler);
    });
  }

  /// A SQL statement where clause that stipulates a subset of features to be
  /// displayed.
  ///
  /// The definition expression string uses the SQL-92 where clause syntax
  /// (https://en.wikipedia.org/wiki/SQL-92). Be sure to escape special
  /// characters in the expression string as required for your platform. The
  /// DATE keyword expects the date format yyyy-mm-dd and the TIMESTAMP keyword
  /// expects the time stamp format yyyy-mm-dd hh:mm:ss. For more information,
  /// see the ArcGIS Blog article
  /// [Querying Feature Services Date-Time Queries](https://www.esri.com/arcgis-blog/products/api-rest/data-management/querying-feature-services-date-time-queries/).
  String get definitionExpression {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getDefinitionExpression(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The id that uniquely identifies this sublayer.
  ///
  /// Will return -1 if an error occurs.
  int get id {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getId(_handle, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getInstanceId(_handle, errorHandler);
    });
  }

  @override
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getIsVisible(_handle, errorHandler);
    });
  }

  @override
  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISSublayer_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// True if the sublayer's labels are enabled, false otherwise.
  ///
  /// Will return false if an error occurs.
  bool get labelsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getLabelsEnabled(
          _handle, errorHandler);
    });
  }

  /// The sublayer's maximum scale.
  ///
  /// The sublayer maximum scale. Will return NAN if an error occurs.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getMaxScale(_handle, errorHandler);
    });
  }

  /// The sublayer's minimum scale.
  ///
  /// The sublayer minimum scale. Will return NAN if an error occurs.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getMinScale(_handle, errorHandler);
    });
  }

  @override
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer's opacity.
  ///
  /// Will return NAN if an error occurs.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getOpacity(_handle, errorHandler);
    });
  }

  /// The sublayer's renderer.
  Renderer? get renderer => _renderer.value;

  final Memoized<Renderer?> _renderer;

  /// True if the sublayer renderers its symbols based on scale, false
  /// otherwise.
  ///
  /// Will return false if an error occurs.
  bool get scaleSymbols {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getScaleSymbols(
          _handle, errorHandler);
    });
  }

  @override
  bool get showInLegend {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getShowInLegend(
          _handle, errorHandler);
    });
  }

  @override
  set showInLegend(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISSublayer_setShowInLegend(
          _handle, value, errorHandler);
    });
  }

  @override
  List<LayerContent> get subLayerContents {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getSubLayerContents(
          _handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// The collection of sublayers of a sublayer.
  ///
  /// This collection is usually empty unless the parent layer is loaded.
  /// Modifying this collection has no effect unless this sublayer is associated
  /// with an ArcGIS map service that supports dynamic layers. "Supports Dynamic
  /// Layers" must be set to true in the ArcGIS MapServer REST Services
  /// Directory.
  List<ArcGISSublayer> get sublayers => _sublayers.value;

  final Memoized<_MutableArrayList<ArcGISSublayer>> _sublayers;

  /// Clones the [ArcGISSublayer].
  ///
  /// Return Value: A new [ArcGISSublayer] with the same values as the current
  /// [ArcGISSublayer].
  ArcGISSublayer clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_clone(_handle, errorHandler);
    });
    return ArcGISSublayer._fromHandle(objectHandle)!;
  }

  @override
  Future<List<LegendInfo>> fetchLegendInfos() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_fetchLegendInfos(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [fetchLegendInfos]. See that method for more
  /// information.
  CancelableOperation<List<LegendInfo>> fetchLegendInfosCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_fetchLegendInfos(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  @override
  bool isVisibleAtScale(double scale) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_isVisibleAtScale(
          _handle, scale, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISSublayer_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISSublayer_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISSublayer_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISSublayer_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _arcGISMapServiceSublayerInfo.invalidateCache();
    _renderer.invalidateCache();
    _sublayers.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLayerContentSubLayerContentChangedEvent:
        _subLayerContentChangedStreamController.add(subLayerContents);
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
        logger.f('ArcGISSublayer unhandled asyncType $asyncType');
    }
  }
}

final class _ArcGISSublayerFactory
    implements _InstanceFactory<ArcGISSublayer, RT_ArcGISSublayerHandle> {
  @override
  ArcGISSublayer createInstance({required RT_ArcGISSublayerHandle handle}) {
    switch (ArcGISSublayer._objectTypeOf(handle)) {
      case _ArcGISSublayerType.arcGISMapImageSublayer:
        return ArcGISMapImageSublayer._withHandle(handle);
      case _ArcGISSublayerType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as ArcGISSublayer');
        return ArcGISSublayer._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_ArcGISSublayerHandle handle) {
    bindings.ArcGISSublayer_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_ArcGISSublayerHandle handle) {
    return runtimecore.RT_ArcGISSublayer_getInstanceId(handle, ffi.nullptr);
  }
}

/// The list of ArcGIS sublayer types.
///
/// This is used to determine the sublayer type.
enum _ArcGISSublayerType {
  /// An ArcGIS map image sublayer.
  arcGISMapImageSublayer,

  /// An ArcGIS Tiled sublayer.
  arcGISTiledSublayer,

  /// A feature subtype sublayer.
  subtypeSublayer,

  /// Unknown sublayer type.
  unknown;

  factory _ArcGISSublayerType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISMapImageSublayer;
      case 1:
        return arcGISTiledSublayer;
      case 2:
        return subtypeSublayer;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISMapImageSublayer:
        return 0;
      case arcGISTiledSublayer:
        return 1;
      case subtypeSublayer:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// A layer that can visualize data from an ArcGIS map service or a local
/// [TileCache] by using previously generated tiles.
///
/// ArcGIS tiled layers consume image tiles provided by an ArcGIS map service or
/// a local tile package. Raster tiles are cached at various scales when the map
/// service is created. This API requests the tiles needed at a particular map
/// extent. [ArcGISTiledLayer] will display data from an ArcGIS MapServer if
/// "Single Fused Map Cache" is set to true in its ArcGIS REST Services
/// Directory.
///
/// You can use the [ExportTileCacheTask] class to generate and download tiles
/// from the service, creating a tile package (.tpk/.tpkx) for use locally on
/// the device. Alternatively, you can use ArcGIS Pro to create a map tile
/// package and provision it to the device.
///
/// Functional characteristics
///
/// ArcGIS tiled layers do not support reprojection, query, select, identify, or
/// editing.
///
/// Performance characteristics
///
/// Tiled image layers (those that derive functionality from the
/// [ImageTiledLayer] class) provide fast display of geographic imagery stored
/// in raster files. These rasters typically contain image data acquired from
/// satellite, aircraft, or drones. The resolution of such imagery can be very
/// high, providing a detailed view. With increased resolution comes increased
/// file sizes and potentially slower performance.
///
/// Raster tiling is a process that resamples the pixel size at different scales
/// to create images with the appropriate resolution for each scale. The tiling
/// process creates level-of-detail pyramids to efficiently manage how much
/// detail you see as you zoom in and out on the map. Typically, as you zoom
/// closer to the Earth's surface, you want to see greater detail of the
/// geographic information. Tiled image layers allow you to see just the
/// information you need very quickly based on the level-of-detail pyramid at a
/// particular scale, rather than having to load a single large image at once.
///
/// Tiles are generated by the server when the service is created. Requests for
/// tiles are made on multiple threads and handled asynchronously. The size of
/// each returned tile increases as the resolution or complexity of the image in
/// the tile increases. For example, high-resolution imagery tiles can be result
/// in larger file sizes than topographic mapping for the same area and map
/// extent.
final class ArcGISTiledLayer extends ImageTiledLayer
    implements ApiKeyResource, _Refreshable {
  static ArcGISTiledLayer? _fromHandle(RT_ArcGISTiledLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  ArcGISTiledLayer._withHandle(super.handle)
      : _arcGISMapServiceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISTiledLayer_getMapServiceInfo(
                handle, errorHandler);
          });
          return ArcGISMapServiceInfo._fromHandle(objectHandle);
        }),
        _tileCache = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISTiledLayer_getTileCache(
                handle, errorHandler);
          });
          return TileCache._fromHandle(objectHandle);
        }),
        _tiledSublayers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISTiledLayer_getTiledSublayers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISTiledLayer_getURI(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle();

  /// Creates an ArcGIS tiled layer from a [PortalItem] representing an ArcGIS
  /// map service.
  ///
  /// The item's type should be [PortalItemType.arcGISMapService].
  ///
  /// Parameters:
  /// - `item` — A portal item of type [PortalItemType.arcGISMapService].
  factory ArcGISTiledLayer.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_createWithItem(
          item._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates an ArcGIS Tiled Layer object from a local cache of previously
  /// rendered map tiles.
  ///
  /// Parameters:
  /// - `tileCache` — A tile cache.
  factory ArcGISTiledLayer.withTileCache(TileCache tileCache) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_createWithTileCache(
          tileCache._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates an ArcGIS tiled layer from the specified URI.
  ///
  /// If the specified URI is a map service URL, the MapServer must have "Single
  /// Fused Map Cache" set to true in its ArcGIS REST Services Directory. If the
  /// specified URI is a portal item URL, the underlying [PortalItem] is created
  /// and can be accessed through [Layer.item]. See [PortalItem.withUri] for the
  /// supported URL formats.
  ///
  /// Parameters:
  /// - `uri` — The URL to the REST endpoint of an ArcGIS map service or ArcGIS
  /// map service portal item, or the path to a local tile package(.tpk/.tpkx).
  factory ArcGISTiledLayer.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_createWithURI(
          coreURI.bytes, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISTiledLayer_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The ArcGIS map service information.
  ///
  /// This information is available after the layer has successfully loaded.
  ArcGISMapServiceInfo? get arcGISMapServiceInfo => _arcGISMapServiceInfo.value;

  final Memoized<ArcGISMapServiceInfo?> _arcGISMapServiceInfo;

  @override
  int get refreshInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_getRefreshInterval(
          _handle, errorHandler);
    });
  }

  @override
  set refreshInterval(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISTiledLayer_setRefreshInterval(
          _handle, value, errorHandler);
    });
  }

  /// The local tiled cache.
  ///
  /// This property is populated if the [ArcGISTiledLayer] has been loaded from
  /// a local tile package (.tpk/.tpkx).
  TileCache? get tileCache => _tileCache.value;

  final Memoized<TileCache?> _tileCache;

  /// The read-only collection sublayers in an ArcGIS tiled layer.
  List<LayerContent> get tiledSublayers => _tiledSublayers.value;

  final Memoized<_ArrayList<LayerContent>> _tiledSublayers;

  /// The URL to the endpoint of an ArcGIS map service or the path to a local
  /// tile package (.tpk/.tpkx) file.
  ///
  /// The URI is available after the layer has successfully loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Creates an ArcGIS tiled Layer from a JSON string.
  ///
  /// Parameters:
  /// - `json` — The JSON data describing the service.
  ///
  /// Return Value: An [ArcGISTiledLayer] which is a [Layer].
  static ArcGISTiledLayer? _fromJson(String json) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreJSON = _CString(json);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTiledLayer_fromJSON(
          coreJSON.bytes, errorHandler);
    });
    return ArcGISTiledLayer._fromHandle(objectHandle);
  }
}

/// Represents a type used for limiting which features are rendered.
///
/// Features filtered from display remain available for query and analysis. Use
/// display filter when only a subset of features needs to be visible while
/// maintaining access to all features.
final class DisplayFilter implements _InstanceId, ffi.Finalizable {
  final RT_DisplayFilterHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.DisplayFilter_destroyInstance.cast());

  static DisplayFilter? _fromHandle(RT_DisplayFilterHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DisplayFilter._instanceCache.instanceWith(handle);
  }

  static _DisplayFilterType _objectTypeOf(RT_DisplayFilterHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_getObjectType(handle, errorHandler);
    });
    return _DisplayFilterType._fromCoreValue(coreValue);
  }

  _DisplayFilterType get _objectType => DisplayFilter._objectTypeOf(_handle);

  DisplayFilter._withHandle(RT_DisplayFilterHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DisplayFilter_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _DisplayFilterFactory(), kind: 'DisplayFilter');

  /// Creates a new [DisplayFilter] with the specified name and where clause.
  ///
  /// Parameters:
  /// - `name` — A descriptive name for this display filter.
  /// - `whereClause` — A SQL expression that defines which features are
  /// rendered.
  factory DisplayFilter.withWhereClause(
      {required String name, required String whereClause}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreWhereClause = _CString(whereClause);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_createWithWhereClause(
          coreName.bytes, coreWhereClause.bytes, errorHandler);
    });
    return DisplayFilter._instanceCache.instanceWith(handle);
  }

  /// The identifier for this display filter.
  ///
  /// Use a unique name to identify this display filter when used in a webmap as
  /// a [ManualDisplayFilterDefinition.activeFilter].
  String get filterId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_getFilterId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_getInstanceId(_handle, errorHandler);
    });
  }

  /// A descriptive name for this display filter.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DisplayFilter_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// A SQL expression that defines which features are rendered.
  ///
  /// The where clause string that is used as the [DisplayFilter.whereClause]
  /// should follow standard SQL syntax similar to what is discussed in the
  /// document
  /// [SQL reference for query expressions used in ArcGIS](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm).
  ///
  /// A where clause that is not valid for the data may result in no features
  /// being drawn when this display filter is applied either by
  /// [ManualDisplayFilterDefinition.activeFilter] or by
  /// [ScaleRangeDisplayFilter.maxScale]. Check the layer's [LayerViewState] for
  /// a [LayerViewStatus.warning]; if there is one, then there might be a
  /// [LayerViewState.error] describing that the display filter's where clause
  /// is not valid.
  String get whereClause {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilter_getWhereClause(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set whereClause(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DisplayFilter_setWhereClause(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

final class _DisplayFilterFactory
    implements _InstanceFactory<DisplayFilter, RT_DisplayFilterHandle> {
  @override
  DisplayFilter createInstance({required RT_DisplayFilterHandle handle}) {
    switch (DisplayFilter._objectTypeOf(handle)) {
      case _DisplayFilterType.displayFilter:
        return DisplayFilter._withHandle(handle);
      case _DisplayFilterType.scaleRangeDisplayFilter:
        return ScaleRangeDisplayFilter._withHandle(handle);
      case _DisplayFilterType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  @override
  void destroyHandle(RT_DisplayFilterHandle handle) {
    bindings.DisplayFilter_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_DisplayFilterHandle handle) {
    return runtimecore.RT_DisplayFilter_getInstanceId(handle, ffi.nullptr);
  }
}

/// Provides definition on how features are filtered from the display.
///
/// When [FeatureLayer.displayFilterDefinition] is not null, only features that
/// satisfy the currently applied display filter are rendered. Use this to
/// improve data visualization or optimize rendering performance.
final class DisplayFilterDefinition implements ffi.Finalizable {
  final RT_DisplayFilterDefinitionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.DisplayFilterDefinition_destroy.cast());

  static DisplayFilterDefinition? _fromHandle(
      RT_DisplayFilterDefinitionHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (DisplayFilterDefinition._objectTypeOf(handle)) {
      case _DisplayFilterDefinitionType.manualDisplayFilterDefinition:
        return ManualDisplayFilterDefinition._withHandle(handle);
      case _DisplayFilterDefinitionType.scaleDisplayFilterDefinition:
        return ScaleDisplayFilterDefinition._withHandle(handle);
      case _DisplayFilterDefinitionType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _DisplayFilterDefinitionType _objectTypeOf(
      RT_DisplayFilterDefinitionHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DisplayFilterDefinition_getObjectType(
          handle, errorHandler);
    });
    return _DisplayFilterDefinitionType._fromCoreValue(coreValue);
  }

  _DisplayFilterDefinitionType get _objectType =>
      DisplayFilterDefinition._objectTypeOf(_handle);

  DisplayFilterDefinition._withHandle(RT_DisplayFilterDefinitionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DisplayFilterDefinition_created(_handle);
    }
  }
}

/// The different types of available display filter definitions.
enum _DisplayFilterDefinitionType {
  /// An unknown display filter definition type.
  unknown,

  /// A [ManualDisplayFilterDefinition].
  manualDisplayFilterDefinition,

  /// A [ScaleDisplayFilterDefinition].
  scaleDisplayFilterDefinition;

  factory _DisplayFilterDefinitionType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return manualDisplayFilterDefinition;
      case 1:
        return scaleDisplayFilterDefinition;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case manualDisplayFilterDefinition:
        return 0;
      case scaleDisplayFilterDefinition:
        return 1;
    }
  }
}

/// The different types of available display filters.
enum _DisplayFilterType {
  /// An unknown display filter type.
  unknown,

  /// A [DisplayFilter].
  displayFilter,

  /// A [ScaleRangeDisplayFilter].
  scaleRangeDisplayFilter;

  factory _DisplayFilterType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return displayFilter;
      case 1:
        return scaleRangeDisplayFilter;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case displayFilter:
        return 0;
      case scaleRangeDisplayFilter:
        return 1;
    }
  }
}

/// A layer that can visualize feature data.
///
/// Feature layers can display [Feature] data from a range of online feature
/// table sources, such as [ServiceFeatureTable], `WfsFeatureTable` or
/// `OgcFeatureCollectionTable` source, and offline sources such as
/// [GeodatabaseFeatureTable], `ShapefileFeatureTable`, or
/// [GeoPackageFeatureTable]. You can construct a feature layer object using
/// these feature table sources or you can obtain it directly from a map or
/// scene's collection of [GeoModel.operationalLayers].
///
/// Feature layers can also be used to store features associated with a utility
/// network. To display features in a [FeatureCollectionTable], use
/// [FeatureCollectionLayer] instead.
///
/// Feature layers can be used to display, select, and query features in a
/// layer. Individual features can be queried and filtered based on spatial
/// queries or SQL queries. String comparisons for features queried in service
/// feature tables are case insensitive.
///
/// If the underlying feature service or table supports editing, you can use it
/// with a feature layer as a basis for editing geometry, attributes, and
/// attachments.
///
/// The features in a feature layer are retrieved as needed by the app. Features
/// can be downloaded from a sync-enabled feature service when the device is
/// connected and cached locally for use when the device is offline. Edits can
/// then be synchronized back to the service.
///
/// Functional characteristics
///
/// The following sources can be rendered using a feature layer:
/// * Feature service - backed by a [ServiceFeatureTable]. The feature data from
/// the service is cached locally in the table. New features are retrieved
/// automatically when you navigate the map. The local table cache is discarded
/// when the layer is disposed. If sync is enabled, features can be created,
/// edited, and synchronized back to the server.
/// * Geodatabase - backed by a [GeodatabaseFeatureTable]. The geodatabase can
/// be a replica of a feature service, which allows synchronizing with the
/// feature service, or taking the content of a feature service offline. Use
/// [GeodatabaseSyncTask] to synchronize the geodatabase with the service. The
/// geodatabase can also be a mobile geodatabase created by ArcGIS Pro. These
/// geodatabases cannot be synced and use a default renderer.
/// * Shapefile - backed by a `ShapefileFeatureTable`. Use a feature layer to
/// show the contents of a shapefile (.shp).
/// * Geopackage - backed by a [GeoPackageFeatureTable]. This uses a feature
/// layer to render the tables in a GeoPackage (.gpkg). A GeoPackage is a data
/// source that conforms to the
/// [OGC GeoPackage specification](https://www.ogc.org/standards/geopackage).
/// Geopackage feature tables can be edited and saved, but do not support sync,
/// because there is no backing feature service. This API supports GeoPackage
/// versions 1.0, 1.1, and 1.2.
/// * Web Feature Service (WFS) - backed by a `WfsFeatureTable`. You can
/// populate the table using [QueryParameters] or raw XML-encoded GetFeature
/// queries. A WFS feature table only supports the manual cache feature request
/// mode. This API supports [OGC WFS](https://www.ogc.org/standards/wfs)
/// versions 2.0.0 and 2.0.2. WFS server implementations are inconsistent in how
/// they expect coordinates to be formatted. Some return and expect coordinates
/// in (x,y) order, while others expect (y,x). This API anticipates the order
/// but you can configure it with the `WFSFeatureTable.axisOrder` and
/// `WFSFeatureTable.filterAxisOrder`.
/// * OGC API Features - Backed by an `OgcFeatureCollectionTable`. You can
/// populate the table using [QueryParameters]. An OCG feature collection table
/// only supports the manual cache feature request mode. This API supports
/// [OGC API - Features - Part 1](https://docs.opengeospatial.org/is/17-069r3/17-069r3.html)
/// and
/// [OGC API - Features - Part 2](https://docs.opengeospatial.org/is/18-058/18-058.html).
///
/// The features displayed in a [FeatureLayer] are automatically projected to
/// match the map or scene's [GeoModel.spatialReference], if necessary. Local
/// tables cannot be projected automatically.
///
/// [FeatureLayer] does not expose every value defined in the web map or web
/// scene specification. You can obtain a dictionary of unsupported values from
/// `FeatureLayer.unsupportedJSON`. The [FeatureLayer] also provides
/// `FeatureLayer.unknownJSON` to return JSON that is not recognized in the web
/// map or web scene specification. Performance characteristics
///
/// The feature layer offers excellent display performance when zooming and
/// panning the map within the extent of locally cached features. This is
/// because features are drawn natively and full feature information is cached
/// locally in a geodatabase, shapefile, or GeoPackage. Querying features is
/// also efficient, enabling app functions such as real-time updates of query
/// results in a map.
///
/// Initially, a local cache must be created. The initial download to the device
/// may require extensive network usage and subsequent local device storage. App
/// memory usage increases with the number and complexity of the features
/// cached. You can eliminate the network usage by provisioning the cache
/// directly to the device in advance.
///
/// If the feature layer's [FeatureTable] is backed by a service it has three
/// feature request modes ([FeatureRequestMode]) that control how and when
/// features are requested from the service:
/// * On interaction cache - Features are requested automatically for the
/// visible map or scene extent. As the user pans and zooms, features are cached
/// locally. If the user returns to an area where features have already been
/// loaded, the table won't need to download those features again.
/// * Manual cache - Features are manually populated using a call to
/// [ServiceFeatureTable.populateFromService]. Once populated, all queries are
/// made against the local table only. [ServiceFeatureTable.populateFromService]
/// can be called again to retrieve more features from the service.
/// * On interaction, no cache - Features are requested automatically for the
/// visible map extent. As the user pans and zooms, features outside the visible
/// extent are not cached and must be downloaded again each time.
final class FeatureLayer extends Layer
    implements TimeAware, _CallbackReceiver, _Refreshable {
  static FeatureLayer? _fromHandle(RT_FeatureLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  FeatureLayer._withHandle(super.handle)
      : _displayFilterDefinition = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getDisplayFilterDefinition(
                handle, errorHandler);
          });
          return DisplayFilterDefinition._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureLayer_setDisplayFilterDefinition(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _featureReduction = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getFeatureReduction(
                handle, errorHandler);
          });
          return FeatureReduction._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureLayer_setFeatureReduction(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _featureTable = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getFeatureTable(
                handle, errorHandler);
          });
          return FeatureTable._fromHandle(objectHandle);
        }),
        _renderer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getRenderer(
                handle, errorHandler);
          });
          return Renderer._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureLayer_setRenderer(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _timeInterval = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getTimeInterval(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }),
        _timeOffset = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureLayer_getTimeOffset(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureLayer_setTimeOffset(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _fullTimeExtentChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureLayer_setFullTimeExtentChangedCallback(
              _handle,
              bindings.addresses.asyncTimeAwareFullTimeExtentChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureLayer_setFullTimeExtentChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<TimeExtent?>
      _fullTimeExtentChangedStreamController;

  @override
  Stream<TimeExtent?> get onFullTimeExtentChanged =>
      _fullTimeExtentChangedStreamController.stream;

  /// Creates a new feature layer object from a feature layer or feature service
  /// portal item.
  ///
  /// If the portal item is a feature service, the [FeatureLayer] will be
  /// created from the first layer on the service.
  ///
  /// Parameters:
  /// - `item` — A feature layer or feature service [PortalItem].
  factory FeatureLayer.withFeatureLayerItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_createWithFeatureLayerItem(
          item._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates a new feature layer from a given [FeatureTable].
  ///
  /// Any inherited [FeatureTable] type can be used as the input parameter for
  /// this constructor, except [FeatureCollectionTable]. To display features in
  /// a [FeatureCollectionTable], use [FeatureCollectionLayer].
  ///
  /// Parameters:
  /// - `featureTable` — The feature table used as the data source of the
  /// feature layer.
  factory FeatureLayer.withFeatureTable(FeatureTable featureTable) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_createWithFeatureTable(
          featureTable._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates a new feature layer object from a feature service portal item.
  ///
  /// The feature layer will fail to load if an invalid portal item is passed
  /// in.
  ///
  /// Parameters:
  /// - `featureServiceItem` — A feature service [PortalItem]. The item's type
  /// must be [PortalItemType.featureService].
  /// - `layerId` — The layer id of an individual layer in the ArcGIS feature
  /// service represented by the item parameter.
  factory FeatureLayer.withItem(
      {required Item featureServiceItem, required int layerId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_createWithItem(
          featureServiceItem._handle, layerId, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// A SQL expression which limits the features available for query and display
  /// on the feature layer.
  ///
  /// The definition expression string should follow standard SQL syntax as
  /// detailed in the
  /// [SQL reference for query expressions used in ArcGIS](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm)
  /// document.
  String get definitionExpression {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getDefinitionExpression(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set definitionExpression(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setDefinitionExpression(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Defines how features are filtered from the display.
  ///
  /// Use this property to reduce the number of features displayed in the map or
  /// scene view. The filter aims to improve data visualization and optimize
  /// rendering performance. It only affects the display of features so all
  /// features are still available for query methods such as
  /// [FeatureLayer.selectFeaturesWithQuery]: Future<FeatureQueryResult>.
  DisplayFilterDefinition? get displayFilterDefinition =>
      _displayFilterDefinition.value;

  set displayFilterDefinition(DisplayFilterDefinition? value) =>
      _displayFilterDefinition.value = value;

  final Memoized<DisplayFilterDefinition?> _displayFilterDefinition;

  /// Defines properties for dynamically aggregating and summarizing groups of
  /// features as the map scale or visible extent changes.
  ///
  /// [FeatureReduction] is only supported for point feature layers in dynamic
  /// rendering mode ([FeatureRenderingMode.dynamic]) in 2D. The following
  /// conditions will generate a [LayerViewState] error and will result in the
  /// layer rendering the original features.
  ///   1. A [FeatureLayer] that uses static rendering mode is enabled with
  /// [FeatureReduction].
  ///   2. A [FeatureLayer] enabled with [FeatureReduction] is added to an
  /// `ArcGISScene` (or an `ArcGISScene` that contains such a layer is loaded).
  ///   3. An unsupported renderer is used as the
  /// `AggregationFeatureReduction.renderer`. See
  /// `AggregationFeatureReduction.renderer` for more info.
  ///
  /// If this property is explicitly set to null, [FeatureReduction] is removed
  /// from the [FeatureLayer] and is not persisted when saving the map.
  FeatureReduction? get featureReduction => _featureReduction.value;

  set featureReduction(FeatureReduction? value) =>
      _featureReduction.value = value;

  final Memoized<FeatureReduction?> _featureReduction;

  /// The feature table whose features are drawn on the map by this layer.
  FeatureTable? get featureTable => _featureTable.value;

  final Memoized<FeatureTable?> _featureTable;

  @override
  TimeExtent? get fullTimeExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getFullTimeExtent(
          _handle, errorHandler);
    });
    return TimeExtent._fromHandle(objectHandle);
  }

  @override
  bool get isTimeFilteringEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getIsTimeFilteringEnabled(
          _handle, errorHandler);
    });
  }

  @override
  set isTimeFilteringEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setIsTimeFilteringEnabled(
          _handle, value, errorHandler);
    });
  }

  /// True if features in the layer are labelled, otherwise false.
  bool get labelsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getLabelsEnabled(
          _handle, errorHandler);
    });
  }

  set labelsEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setLabelsEnabled(
          _handle, value, errorHandler);
    });
  }

  @override
  int get refreshInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getRefreshInterval(
          _handle, errorHandler);
    });
  }

  @override
  set refreshInterval(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setRefreshInterval(
          _handle, value, errorHandler);
    });
  }

  /// The renderer specifies how the features are symbolized.
  Renderer? get renderer => _renderer.value;

  set renderer(Renderer? value) => _renderer.value = value;

  final Memoized<Renderer?> _renderer;

  /// The mode defines how the feature layer is rendered.
  ///
  /// [FeatureRenderingMode.static] mode is better suited for displaying large
  /// datasets (in terms of the number of vertices) and for complex symbology
  /// because it does not update the layer's display while pan/zoom operations
  /// are in progress.
  ///
  /// [FeatureRenderingMode.dynamic] mode is better suited for small datasets
  /// that update frequently or for better interactive experiences when the
  /// layer's display is updated continuously while pan/zoom operations are in
  /// progress.
  FeatureRenderingMode get renderingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getRenderingMode(
          _handle, errorHandler);
    });
    return FeatureRenderingMode._fromCoreValue(coreValue);
  }

  set renderingMode(FeatureRenderingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setRenderingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// True if the layer's symbols and labels honor the map's reference scale,
  /// otherwise false.
  ///
  /// If the map has a positive reference scale, and the layer honors it, then
  /// symbols and labels are drawn at their specified size when the viewing
  /// scale is the same as the reference scale. They will grow or shrink as the
  /// view zooms in or out, to keep the symbol a fixed size on the map. If the
  /// map has no reference scale, the reference scale is zero, or this feature
  /// layer's scaleSymbols property is false, then the symbols and labels will
  /// be drawn at their fixed screen size.
  bool get scaleSymbols {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getScaleSymbols(_handle, errorHandler);
    });
  }

  set scaleSymbols(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setScaleSymbols(_handle, value, errorHandler);
    });
  }

  @override
  bool get supportsTimeFiltering {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getSupportsTimeFiltering(
          _handle, errorHandler);
    });
  }

  /// The mode defines whether feature tiling is used to retrieve the features
  /// from the feature service.
  ///
  /// The default tiling mode is [FeatureTilingMode.enabledWhenSupported].
  FeatureTilingMode get tilingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getTilingMode(_handle, errorHandler);
    });
    return FeatureTilingMode._fromCoreValue(coreValue);
  }

  set tilingMode(FeatureTilingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setTilingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  @override
  TimeValue? get timeInterval => _timeInterval.value;

  final Memoized<TimeValue?> _timeInterval;

  @override
  TimeValue? get timeOffset => _timeOffset.value;

  @override
  set timeOffset(TimeValue? value) => _timeOffset.value = value;

  final Memoized<TimeValue?> _timeOffset;

  /// Clears all selected features.
  void clearSelection() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_clearSelection(_handle, errorHandler);
    });
  }

  /// Returns a collection of the currently selected features.
  ///
  /// Return Value: A [Future] that returns a [FeatureQueryResult].
  Future<FeatureQueryResult> getSelectedFeatures() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getSelectedFeatures(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [getSelectedFeatures]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> getSelectedFeaturesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_getSelectedFeatures(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Reset the visibility of all features back to their original state.
  void resetFeaturesVisible() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_resetFeaturesVisible(_handle, errorHandler);
    });
  }

  /// Reset the renderer back to the original renderer provided by the
  /// [FeatureTable].
  void resetRenderer() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_resetRenderer(_handle, errorHandler);
    });
  }

  /// Selects the given feature and adds it to the current collection of
  /// selected features.
  ///
  /// Selected features are rendered according to the
  /// [GeoViewController.selectionProperties].
  ///
  /// Parameters:
  /// - `feature` — The feature.
  void selectFeature({required Feature feature}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_selectFeature(
          _handle, feature._handle, errorHandler);
    });
  }

  /// Selects the given features and adds them to the current collection of
  /// selected features.
  ///
  /// Use the [FeatureLayer.getSelectedFeatures]: Future<FeatureQueryResult> to
  /// retrieve all of the selected features.
  ///
  /// Parameters:
  /// - `features` — A collection of features to be selected. Contents of the
  /// [List] are copied.
  void selectFeatures({required List<Feature> features}) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_selectFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
  }

  /// Selects the features that match the criteria in the [QueryParameters]
  /// object and adds them to the current collection of selected features.
  ///
  /// Parameters:
  /// - `parameters` — A query that defines features to select from the
  /// [FeatureTable].
  /// - `mode` — Defines how the collection of currently selected features will
  /// be updated with the features returned from the query.
  ///
  /// Return Value: A [Future] that returns a [FeatureQueryResult].
  Future<FeatureQueryResult> selectFeaturesWithQuery(
      {required QueryParameters parameters, required SelectionMode mode}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_selectFeaturesWithQuery(
          _handle, parameters._handle, mode.coreValue, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [selectFeaturesWithQuery]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> selectFeaturesWithQueryCancelable(
      {required QueryParameters parameters, required SelectionMode mode}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureLayer_selectFeaturesWithQuery(
          _handle, parameters._handle, mode.coreValue, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Sets the visibility of the given feature.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  /// - `visible` — True to show the features, otherwise false.
  void setFeatureVisible({required Feature feature, required bool visible}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setFeatureVisible(
          _handle, feature._handle, visible, errorHandler);
    });
  }

  /// Sets the visibility of the given features.
  ///
  /// Parameters:
  /// - `features` — A [List] of [Feature]. Contents of the [List] are copied.
  /// - `visible` — True to show the features, otherwise false.
  void setFeaturesVisible(
      {required List<Feature> features, required bool visible}) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_setFeaturesVisible(
          _handle, coreFeatures._handle, visible, errorHandler);
    });
  }

  /// Unselects the given feature and removes it from the current collection of
  /// selected features.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  void unselectFeature({required Feature feature}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_unselectFeature(
          _handle, feature._handle, errorHandler);
    });
  }

  /// Unselects the given features and removes them from the current collection
  /// of selected features.
  ///
  /// Parameters:
  /// - `features` — A [List] of [Feature]. Contents of the [List] are copied.
  void unselectFeatures({required List<Feature> features}) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureLayer_unselectFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeTimeAwareFullTimeExtentChangedEvent:
        _fullTimeExtentChangedStreamController.add(fullTimeExtent);
      default:
        super._processCallback(message);
    }
  }
}

/// Rendering modes available for feature layers.
///
/// Represents the rendering mode for a feature layer.
enum FeatureRenderingMode {
  /// The rendering mode for the layer will be automatically chosen based on the
  /// geometry type and renderer.
  automatic,

  /// Static rendering mode. Only update features between zoom and pan
  /// operations in a retained mode. This mode is good for complex geometries or
  /// features to be rendered with cartographic quality symbology for example.
  /// It may also be suited for rendering features when low end graphics
  /// hardware is used.
  static,

  /// Dynamic rendering mode - Features will be updated as pan and zoom
  /// operations for a smoothly rendered display. This mode is not supported by
  /// all renderers. A heat map renderer is an example of a renderer not
  /// supported by the dynamic rendering mode. Unknown.
  dynamic;

  factory FeatureRenderingMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return automatic;
      case 1:
        return static;
      case 2:
        return dynamic;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case automatic:
        return 0;
      case static:
        return 1;
      case dynamic:
        return 2;
    }
  }
}

/// Feature tiling modes available to feature layers. This determines how
/// feature tiling is handled for each layer. Using the default mode is highly
/// recommended. As of now, only services based on service feature tables
/// support feature tiling.
enum FeatureTilingMode {
  /// Use feature tiling whenever a service supports it. Feature tiling
  /// retrieves more features per layer from a service by making multiple,
  /// smaller requests to said service. Since each request gathers a portion of
  /// the total features, this allows more features to be rendered in the extent
  /// than what the maxRecordCount would normally allow.
  ///
  /// When in this mode, all rendering requests to services will use feature
  /// tiling unless the following applies: [FeatureRequestMode] is
  /// [FeatureRequestMode.manualCache], the service does not support coordinate
  /// quantization, or if the service does not support tile result types. This
  /// is the default mode.
  enabledWhenSupported,

  /// Feature tiling is disabled.
  ///
  /// When in this mode, feature tiling will not be used even if a service
  /// supports it. This reduces the number of requests sent by each layer.
  /// Disabling feature tiling results in less features returned from a service.
  disabled,

  /// Use feature tiling and request full resolution geometries when supported
  /// by the service. If the latter is not supported,
  /// [FeatureTilingMode.enabledWhenSupported] is used instead.
  ///
  /// This mode requires the service to support the edit quantization mode,
  /// which returns all vertices of the source geometry in a high resolution.
  /// Use this mode for workflows that benefit from precise geometry editing,
  /// such as snapping feature geometries, without loading the feature. This
  /// mode may impact performance due to the increase in network traffic.
  enabledWithFullResolutionWhenSupported;

  factory FeatureTilingMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return enabledWhenSupported;
      case 1:
        return disabled;
      case 2:
        return enabledWithFullResolutionWhenSupported;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case enabledWhenSupported:
        return 0;
      case disabled:
        return 1;
      case enabledWithFullResolutionWhenSupported:
        return 2;
    }
  }
}

/// A base class for raster type layers that allows per-pixel adjustments.
final class ImageAdjustmentLayer extends Layer {
  static ImageAdjustmentLayer? _fromHandle(
      RT_ImageAdjustmentLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  ImageAdjustmentLayer._withHandle(super.handle) : super._withHandle();

  /// The brightness of the layer.
  double get brightness {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImageAdjustmentLayer_getBrightness(
          _handle, errorHandler);
    });
  }

  set brightness(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageAdjustmentLayer_setBrightness(
          _handle, value, errorHandler);
    });
  }

  /// The contrast of the layer.
  double get contrast {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImageAdjustmentLayer_getContrast(
          _handle, errorHandler);
    });
  }

  set contrast(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageAdjustmentLayer_setContrast(
          _handle, value, errorHandler);
    });
  }

  /// The gamma of the layer.
  double get gamma {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImageAdjustmentLayer_getGamma(
          _handle, errorHandler);
    });
  }

  set gamma(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageAdjustmentLayer_setGamma(
          _handle, value, errorHandler);
    });
  }
}

/// A base class for layers that display cached maps. You would typically work
/// with one or more sub-classes of this class.
///
/// [ImageTiledLayer] defines a base class for layers that display tiled map
/// services and cached image services. This is an abstract class that can be
/// derived in a custom class to implement a local tile data scheme. To
/// implement a custom [ImageTiledLayer], for example to load your own local
/// tile data, you should derive from this type and supply the data for each
/// tile as it is requested. Additionally, you must supply [TileInfo] that
/// describes the tiling scheme, and an [Envelope] that defines the layer
/// extent.
///
/// Implement this class if you want to create a custom tiled layer where the
/// cached images cannot be referenced by a simple URI. If your images can be
/// referenced by a simple URI, you should instead implement
/// `ServiceImageTiledLayer`.
final class ImageTiledLayer extends ImageAdjustmentLayer
    implements _CallbackReceiver {
  static ImageTiledLayer? _fromHandle(RT_ImageTiledLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  ImageTiledLayer._withHandle(super.handle)
      : _tileInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ImageTiledLayer_getTileInfo(
                handle, errorHandler);
          });
          return TileInfo._fromHandle(objectHandle);
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _cancelTileRequestStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ImageTiledLayer_setCancelTileRequestCallback(
              _handle,
              bindings.addresses.asyncLayerTileEvent_cancelTileRequest,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ImageTiledLayer_setCancelTileRequestCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _tileRequestStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ImageTiledLayer_setTileRequestCallback(
              _handle,
              bindings.addresses.asyncLayerTileEvent_tileRequest,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ImageTiledLayer_setTileRequestCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<TileKey> _cancelTileRequestStreamController;

  /// Sets the callback to invoke when the layer cancels a tile request.
  ///
  /// Only use this callback for user defined layers. This callback will be
  /// ignored for other tiled layer types.
  Stream<TileKey> get _onCancelTileRequest =>
      _cancelTileRequestStreamController.stream;

  late final StreamController<TileKey> _tileRequestStreamController;

  /// Sets the callback to invoke when the layer needs to request a tile.
  ///
  /// Only use this callback for user defined layers. This callback will be
  /// ignored if the tiled layer is actually an [ArcGISTiledLayer] or a
  /// `ServiceImageTiledLayer`.
  Stream<TileKey> get _onTileRequest => _tileRequestStreamController.stream;

  /// Creates an image tiled layer from the given tile metadata and the full
  /// extent.
  ///
  /// Parameters:
  /// - `tileInfo` — A tile info object.
  /// - `fullExtent` — The full extent of the layer.
  factory ImageTiledLayer(
      {required TileInfo tileInfo, required Envelope fullExtent}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImageTiledLayer_createWithInfoFullExtent(
          tileInfo._handle, fullExtent._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Controls how a tile request that returns 'NoData' is resampled.
  ///
  /// Zooming in can result in tile requests with no tiles at the requested
  /// level of detail. In this case, there are options that control what to
  /// display where the tile should be including:
  /// * [NoDataTileBehavior.upSample] - Resample the pixels from a lower level
  /// of detail tile. This can result in pixelation or blurriness. This is the
  /// default behavior for operational layers.
  /// * [NoDataTileBehavior.blank] - The 'NoData' pixels will show the raster
  /// picture as being blank (or disappearing). This is the default behavior for
  /// basemap reference layers.
  /// * [NoDataTileBehavior.show_] - This will show the raster picture with the
  /// text 'No Data' stamped over it once you pass the lowest level-of-detail
  /// scale.
  ///
  /// Note: Sometimes, to see the effect on the map when setting the
  /// [ImageTiledLayer.noDataTileBehavior] property, the [Layer.maxScale] value
  /// must also be explicitly set. The [Layer.maxScale] property may need to be
  /// smaller than the level-of-detail setting that was used to create the tiled
  /// images in ArcGIS Pro or ArcGIS Desktop. For example, consider an
  /// operational image tile layer showing forest cover that was created with
  /// the level-of-detail assumption that it was to be viewed above a scale of
  /// 5000 (meaning you will not see 'NoData' until you zoom closer to the Earth
  /// than a 5000 scale). However, you want to be able to zoom in closer to the
  /// Earth surface, say down to 3000 or 300. By setting the [Layer.maxScale]
  /// property to a number smaller than 5000, you will be able to zoom in closer
  /// to the Earth and see the effects of changing the
  /// [ImageTiledLayer.noDataTileBehavior] enumerations.
  NoDataTileBehavior get noDataTileBehavior {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImageTiledLayer_getNoDataTileBehavior(
          _handle, errorHandler);
    });
    return NoDataTileBehavior._fromCoreValue(coreValue);
  }

  set noDataTileBehavior(NoDataTileBehavior value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageTiledLayer_setNoDataTileBehavior(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The tiling scheme information for this layer.
  ///
  /// The value of tileInfo cannot be changed after this layer is loaded.
  TileInfo? get tileInfo => _tileInfo.value;

  final Memoized<TileInfo?> _tileInfo;

  /// Sets the attribution string for the image tiled layer.
  ///
  /// Parameters:
  /// - `attribution` — The attribution string.
  void setAttribution(String attribution) {
    final coreAttribution = _CString(attribution);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageTiledLayer_setAttribution(
          _handle, coreAttribution.bytes, errorHandler);
    });
  }

  /// Set the tile image which was requested as being a no data tile.
  ///
  /// Only use this callback for no data tile. When receiving this response,
  /// ArcGIS Runtime won't request the finest tiles.
  ///
  /// Parameters:
  /// - `tileKey` — The tile key (level, column, row).
  void _setNoDataTile({required TileKey tileKey}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageTiledLayer_setNoDataTile(
          _handle, tileKey._handle, errorHandler);
    });
  }

  /// Set the tile image which was requested.
  ///
  /// Only use this callback for user defined layers. This allows you to pass
  /// the image data to the layer.
  ///
  /// Parameters:
  /// - `tileKey` — The tile key for this tile that you are setting.
  /// - `data` — The image data for this tile that you are setting.
  void _setTile({required TileKey tileKey, required Uint8List? data}) {
    final coreData = data?.toByteArrayWrapper() ?? _ByteArrayWrapper.empty();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageTiledLayer_setTile(
          _handle, tileKey._handle, coreData.ref, errorHandler);
    });
  }

  /// Set the tile image which was requested as being in error.
  ///
  /// Only use this callback for user defined layers.
  ///
  /// Parameters:
  /// - `tileKey` — The tile key (level, column, row).
  /// - `userDefinedError` — The error.
  void _setTileWithResponse(
      {required TileKey tileKey, required _ClientReference? userDefinedError}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ImageTiledLayer_setTileWithResponse(
          _handle,
          tileKey._handle,
          userDefinedError?._handle ?? ffi.nullptr,
          errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLayerTileEvent_cancelTileRequest:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_TileKeyHandle;
          return TileKey._fromHandle(objectHandle)!;
        }();
        _cancelTileRequestStreamController.add(event);
      case AsyncType.asyncTypeLayerTileEvent_tileRequest:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_TileKeyHandle;
          return TileKey._fromHandle(objectHandle)!;
        }();
        _tileRequestStreamController.add(event);
      default:
        super._processCallback(message);
    }
  }
}

/// The join type (left outer or left inner) of a table join sublayer source.
///
/// Can get the join type by calling [TableJoinSublayerSource.joinType].
enum JoinType {
  /// Inner join type.
  innerJoin,

  /// Left outer join type.
  leftOuterJoin,

  /// Unknown.
  unknown;

  factory JoinType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return innerJoin;
      case 1:
        return leftOuterJoin;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case innerJoin:
        return 0;
      case leftOuterJoin:
        return 1;
      case unknown:
        return -1;
    }
  }
}

/// A base class for classes that represent layers.
///
/// A layer, also known as an operational layer, provides access to geographic
/// data that is displayed in a map or scene. Each layer references a file or
/// service data source that contains either vector data (points, lines,
/// polygons and attributes) or raster data (images). The [ArcGISMap] or
/// `ArcGISScene` can display these layers inside an [ArcGISMapViewController]
/// or `SceneView`, respectively. To enhance the displayed information, you can
/// 'stack' the layers into a collection of [GeoModel.operationalLayers] or
/// [GeoModel.operationalLayers]. The first layer in the collection is drawn
/// first (on the bottom) and each subsequent layer is drawn on top of it.
///
/// Layer is the base class for these different types of layers:
///
/// <table>
/// <tr>
///     <th>Layer type</th>
///     <th>2D/3D</th>
///     <th>Time-aware</th>
///     <th>Online/offline</th>
///     <th>Sources</th>
/// </tr>
/// <tr>
///     <td>Annotation layer (`AnnotationLayer`)</td>
///     <td>2D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>ArcGIS feature service, portal item, mobile map package (.mmpk)</td>
/// </tr>
/// <tr>
///     <td>ArcGIS map image layer ([ArcGISMapImageLayer])</td>
///     <td>Both</td>
///     <td>Yes</td>
///     <td>Online</td>
///     <td>ArcGIS map service</td>
/// </tr>
/// <tr>
///     <td>ArcGIS scene layer (`ArcGISSceneLayer`)</td>
///     <td>3D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Scene service or scene package</td>
/// </tr>
/// <tr>
///     <td>ArcGIS tiled layer ([ArcGISTiledLayer])</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>ArcGIS tile service, tile package (.tpk/.tpkx)</td>
/// </tr>
/// <tr>
///     <td>ArcGIS vector tiled layer ([ArcGISVectorTiledLayer])</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>ArcGIS vector tile service, vector tile package (.vtpk)</td>
/// </tr>
/// <tr>
///     <td>Bing maps layer (`BingMapsLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Online</td>
///     <td>Bing maps</td>
/// </tr>
/// <tr>
///     <td>Dimension layer (`DimensionLayer`)</td>
///     <td>2D</td>
///     <td>Yes</td>
///     <td>Offline</td>
///     <td>Mobile map package (.mmpk)</td>
/// </tr>
/// <tr>
///     <td>Dynamic entity layer (`DynamicEntityLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Online</td>
///     <td>ArcGIS stream service</td>
/// </tr>
/// <tr>
///     <td>ENC layer (`EncLayer`)</td>
///     <td>2D</td>
///     <td>No</td>
///     <td>Offline</td>
///     <td>ENC exchange set, ENC cell</td>
/// </tr>
/// <tr>
///     <td>Feature collection layer ([FeatureCollectionLayer])</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Portal item, web map, feature set / query result</td>
/// </tr>
/// <tr>
///     <td>Feature layer ([FeatureLayer])</td>
///     <td>Both</td>
///     <td>Yes</td>
///     <td>Both</td>
///     <td>ArcGIS feature service, WFS, shapefile, GeoPackage, geodatabase, OGC API Features</td>
/// </tr>
/// <tr>
///     <td>Group layer (`GroupLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Other layers and group layers</td>
/// </tr>
/// <tr>
///     <td>KML layer (`KmlLayer`)</td>
///     <td>Both</td>
///     <td>Yes</td>
///     <td>Both</td>
///     <td>KML file (.kml, .kmz)</td>
/// </tr>
/// <tr>
///     <td>Integrated mesh layer (`IntegratedMeshLayer`)</td>
///     <td>3D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Scene layer package (.slpk)</td>
/// </tr>
/// <tr>
///     <td>Mobile basemap layer (`MobileBasemapLayer`)</td>
///     <td>2D</td>
///     <td>No</td>
///     <td>Offline</td>
///     <td>Mobile map package (.mmpk)</td>
/// </tr>
/// <tr>
///     <td>OGC 3D Tiles layer (`Ogc3DTilesLayer`)</td>
///     <td>3D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Portal item, tileset, tile package(.3tz)</td>
/// </tr>
/// <tr>
///     <td>OpenStreetMap layer (`OpenStreetMapLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Online</td>
///     <td>OpenStreetMap.org</td>
/// </tr>
/// <tr>
///     <td>Point cloud layer (`PointCloudLayer`)</td>
///     <td>3D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>Portal item, scene layer package (.slpk) </td>
/// </tr>
/// <tr>
///     <td>Raster layer (`RasterLayer`)</td>
///     <td>Both</td>
///     <td>Yes</td>
///     <td>Both</td>
///     <td>GeoPackage, raster file, ArcGIS Image service</td>
/// </tr>
///
/// <tr>
///     <td>Subtype feature layer (`SubtypeFeatureLayer`)</td>
///     <td>2D</td>
///     <td>No</td>
///     <td>Both</td>
///     <td>ArcGIS feature service, geodatabase</td>
/// </tr>
/// <tr>
///     <td>Web tiled layer (`WebTiledLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Online</td>
///     <td>Web tile service</td>
/// </tr>
/// <tr>
///     <td>WMS layer (`WmsLayer`)</td>
///     <td>Both</td>
///     <td>Yes</td>
///     <td>Online</td>
///     <td>WMS service</td>
/// </tr>
/// <tr>
///     <td>WMTS layer (`WmtsLayer`)</td>
///     <td>Both</td>
///     <td>No</td>
///     <td>Online</td>
///     <td>WMTS service</td>
/// </tr>
/// </table>
final class Layer
    with Loadable
    implements LayerContent, _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_LayerHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Layer_destroyInstance.cast());

  static Layer? _fromHandle(RT_LayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  static _LayerType _objectTypeOf(RT_LayerHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getObjectType(handle, errorHandler);
    });
    return _LayerType._fromCoreValue(coreValue);
  }

  _LayerType get _objectType => Layer._objectTypeOf(_handle);

  Layer._withHandle(RT_LayerHandle handle)
      : _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Layer_getItem(handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Layer_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Layer_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _visibilityChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setVisibilityChangedCallback(
              _handle,
              bindings.addresses.asyncLayerVisibilityChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setVisibilityChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _subLayerContentChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setSubLayerContentChangedCallback(
              _handle,
              bindings.addresses.asyncLayerContentSubLayerContentChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setSubLayerContentChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Layer_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<bool> _visibilityChangedStreamController;

  /// Callback invoked when the visibility of the layer changes.
  Stream<bool> get onVisibilityChanged =>
      _visibilityChangedStreamController.stream;

  late final StreamController<List<LayerContent>>
      _subLayerContentChangedStreamController;

  @override
  Stream<List<LayerContent>> get onSubLayerContentChanged =>
      _subLayerContentChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _LayerFactory(), kind: 'Layer');

  /// The attribution text for the layer.
  String get attribution {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getAttribution(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  bool get canChangeVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getCanChangeVisibility(_handle, errorHandler);
    });
  }

  /// The description for the layer.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The full extent of this layer, which is the extent where all layer data is
  /// contained.
  ///
  /// You can use this to zoom to all of the data contained in this layer. For
  /// feature layers, the extent is retrieved from its [FeatureTable.extent].
  Envelope? get fullExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getFullExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The unique identifying string for the layer, as specified in a map or
  /// scene.
  ///
  /// The id is used by other parts of this API to refer to a specific [Layer],
  /// such as in a set of `FeatureFenceParameters` or a
  /// `FacilityLayerDefinition`. If not supplied, all layers will be assigned a
  /// unique id when created.
  ///
  /// It is not recommended to change this property when the layer is obtained
  /// from a map or scene. If changed, ensure that the string is unique, for
  /// example based on a generated GUID.
  String get id {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set id(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setId(_handle, coreValue.bytes, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getInstanceId(_handle, errorHandler);
    });
  }

  /// True if the layer supports identify, false otherwise.
  ///
  /// The value of this property may not be correct until the layer is in a
  /// fully loaded state.
  bool get isIdentifyEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getIsIdentifyEnabled(_handle, errorHandler);
    });
  }

  @override
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getIsVisible(_handle, errorHandler);
    });
  }

  @override
  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// The item the layer has been created from.
  Item? get item => _item.value;

  final Memoized<Item?> _item;

  /// The maximum scale for the layer.
  ///
  /// The maximum scale at which this layer is visible. If the map or scene is
  /// zoomed in beyond this scale, the layer will not be visible. A value of 0
  /// means there is no maximum scale threshold and the layer will be visible at
  /// the smallest scale available for the map or scene. If the value is nil,
  /// there is no maximum scale. All of the connected map and scene views will
  /// be updated.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getMaxScale(_handle, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setMaxScale(_handle, value, errorHandler);
    });
  }

  /// The minimum scale for the layer.
  ///
  /// The minimum scale at which this layer is visible. If the map or scene is
  /// zoomed out beyond this scale, the layer will not be visible. A value of 0
  /// means there is no minimum scale threshold and the layer will be visible at
  /// the largest scale available for the map or scene. If the value is nil,
  /// there is no minimum scale. All of the connected map and scene views will
  /// be updated.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getMinScale(_handle, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setMinScale(_handle, value, errorHandler);
    });
  }

  @override
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The opacity for the layer.
  ///
  /// The opacity of this layer as a value between 0 (fully transparent) and 1
  /// (fully opaque). The default opacity value is 1.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getOpacity(_handle, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setOpacity(_handle, value, errorHandler);
    });
  }

  @override
  bool get showInLegend {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getShowInLegend(_handle, errorHandler);
    });
  }

  @override
  set showInLegend(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_setShowInLegend(_handle, value, errorHandler);
    });
  }

  /// The spatial reference of the layer.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  @override
  List<LayerContent> get subLayerContents {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getSubLayerContents(_handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Clones this instance of the layer and its members.
  ///
  /// Return Value: A new [Layer] with the same values as the current [Layer].
  Layer clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_clone(_handle, errorHandler);
    });
    return Layer._fromHandle(objectHandle)!;
  }

  @override
  Future<List<LegendInfo>> fetchLegendInfos() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_fetchLegendInfos(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [fetchLegendInfos]. See that method for more
  /// information.
  CancelableOperation<List<LegendInfo>> fetchLegendInfosCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_fetchLegendInfos(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Returns the value that indicates a bad id value.
  ///
  /// Return Value: A size_t.
  static int _invalidId() {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_invalidId(errorHandler);
    });
  }

  @override
  bool isVisibleAtScale(double scale) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_isVisibleAtScale(
          _handle, scale, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Layer_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _item.invalidateCache();
    _spatialReference.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLayerVisibilityChangedEvent:
        final event = () {
          return message[2] as bool;
        }();
        _visibilityChangedStreamController.add(event);
      case AsyncType.asyncTypeLayerContentSubLayerContentChangedEvent:
        _subLayerContentChangedStreamController.add(subLayerContents);
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
        logger.f('Layer unhandled asyncType $asyncType');
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Layer) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_equals(_handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Layer_getHash(_handle, errorHandler);
    });
  }
}

final class _LayerFactory implements _InstanceFactory<Layer, RT_LayerHandle> {
  @override
  Layer createInstance({required RT_LayerHandle handle}) {
    switch (Layer._objectTypeOf(handle)) {
      case _LayerType.arcGISMapImageLayer:
        return ArcGISMapImageLayer._withHandle(handle);
      case _LayerType.arcGISTiledLayer:
        return ArcGISTiledLayer._withHandle(handle);
      case _LayerType.arcGISVectorTiledLayer:
        return ArcGISVectorTiledLayer._withHandle(handle);
      case _LayerType.featureCollectionLayer:
        return FeatureCollectionLayer._withHandle(handle);
      case _LayerType.featureLayer:
        return FeatureLayer._withHandle(handle);
      case _LayerType.imageTiledLayer:
        return ImageTiledLayer._withHandle(handle);
      default:
        logger.w('An object of unsupported type is being treated as Layer');
        return Layer._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_LayerHandle handle) {
    bindings.Layer_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_LayerHandle handle) {
    return runtimecore.RT_Layer_getInstanceId(handle, ffi.nullptr);
  }
}

/// An interface for building a Table of Contents.
///
/// This interface is implemented by [Layer], [ArcGISSublayer].
abstract interface class LayerContent {
  /// A flag indicating whether the layer content's visibility can be changed.
  ///
  /// A flag indicating whether the layer content visibility can be changed.
  /// Will return false if an error occurs.
  bool get canChangeVisibility;

  /// The layer content's visibility.
  ///
  /// The layer content visibility. Will return false if an error occurs.
  bool get isVisible;

  set isVisible(bool value);

  /// The layer content's name.
  ///
  /// The layer content name.
  String get name;

  /// A flag indicating whether the layer content participates in the legend.
  ///
  /// A flag indicating whether the layer content is shown in the legend.
  bool get showInLegend;

  set showInLegend(bool value);

  /// The sub layer contents of a layer content.
  List<LayerContent> get subLayerContents;

  /// Fetches the list of legend info.
  ///
  /// Return Value: A [Future]. A [List] of [LegendInfo] is returned
  /// asynchronously by the task. A null is returned if an error occurs.
  Future<List<LegendInfo>> fetchLegendInfos();

  /// Returns the layer content's effective visibility at the specified scale.
  ///
  /// Returns the effective layer content visibility. This effective visibility
  /// takes care of the effective visibility of the parents at the specified
  /// scale. Will return false if an error occurs.
  ///
  /// Parameters:
  /// - `scale` — The scale the visibility has to be calculated for.
  ///
  /// Return Value: A bool.
  bool isVisibleAtScale(double scale);

  /// Callback invoked when the sublayer content of the layer content have
  /// changed.
  Stream<void> get onSubLayerContentChanged;
}

/// The list of layer types.
///
/// This is used to determine the layer type.
enum _LayerType {
  /// An image tiled layer.
  imageTiledLayer,

  /// A service image tiled layer.
  serviceImageTiledLayer,

  /// An ArcGIS Map Image layer.
  arcGISMapImageLayer,

  /// An ArcGIS Tiled layer.
  arcGISTiledLayer,

  /// A feature collection layer.
  featureCollectionLayer,

  /// A feature layer.
  featureLayer,

  /// A KML layer.
  kmlLayer,

  /// A raster layer.
  rasterLayer,

  /// An unsupported layer.
  unsupportedLayer,

  /// A Mobile Basemap Layer.
  mobileBasemapLayer,

  /// A vector tiled layer.
  arcGISVectorTiledLayer,

  /// An ArcGIS Scene layer.
  arcGISSceneLayer,

  /// A WMTS layer.
  wmtsLayer,

  /// An OpenStreetMap layer.
  openStreetMapLayer,

  /// A web tiled layer.
  webTiledLayer,

  /// A Bing maps layer.
  bingMapsLayer,

  /// An ENC layer.
  encLayer,

  /// A WMS layer.
  wmsLayer,

  /// An Integrated Mesh layer.
  integratedMeshLayer,

  /// A Point Cloud layer.
  pointCloudLayer,

  /// A Group layer.
  groupLayer,

  /// An annotation layer.
  annotationLayer,

  /// A subtype feature layer.
  subtypeFeatureLayer,

  /// A dimension layer.
  dimensionLayer,

  /// A dynamic entity layer.
  dynamicEntityLayer,

  /// An OGC 3D tiles layer.
  ogc3DTilesLayer,

  /// Unknown layer type.
  unknownLayer;

  factory _LayerType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return imageTiledLayer;
      case 2:
        return serviceImageTiledLayer;
      case 3:
        return arcGISMapImageLayer;
      case 4:
        return arcGISTiledLayer;
      case 5:
        return featureCollectionLayer;
      case 6:
        return featureLayer;
      case 7:
        return kmlLayer;
      case 9:
        return rasterLayer;
      case 10:
        return unsupportedLayer;
      case 11:
        return mobileBasemapLayer;
      case 12:
        return arcGISVectorTiledLayer;
      case 13:
        return arcGISSceneLayer;
      case 14:
        return wmtsLayer;
      case 15:
        return openStreetMapLayer;
      case 16:
        return webTiledLayer;
      case 17:
        return bingMapsLayer;
      case 18:
        return encLayer;
      case 19:
        return wmsLayer;
      case 20:
        return integratedMeshLayer;
      case 21:
        return pointCloudLayer;
      case 22:
        return groupLayer;
      case 23:
        return annotationLayer;
      case 24:
        return subtypeFeatureLayer;
      case 25:
        return dimensionLayer;
      case 26:
        return dynamicEntityLayer;
      case 27:
        return ogc3DTilesLayer;
      case -1:
        return unknownLayer;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case imageTiledLayer:
        return 1;
      case serviceImageTiledLayer:
        return 2;
      case arcGISMapImageLayer:
        return 3;
      case arcGISTiledLayer:
        return 4;
      case featureCollectionLayer:
        return 5;
      case featureLayer:
        return 6;
      case kmlLayer:
        return 7;
      case rasterLayer:
        return 9;
      case unsupportedLayer:
        return 10;
      case mobileBasemapLayer:
        return 11;
      case arcGISVectorTiledLayer:
        return 12;
      case arcGISSceneLayer:
        return 13;
      case wmtsLayer:
        return 14;
      case openStreetMapLayer:
        return 15;
      case webTiledLayer:
        return 16;
      case bingMapsLayer:
        return 17;
      case encLayer:
        return 18;
      case wmsLayer:
        return 19;
      case integratedMeshLayer:
        return 20;
      case pointCloudLayer:
        return 21;
      case groupLayer:
        return 22;
      case annotationLayer:
        return 23;
      case subtypeFeatureLayer:
        return 24;
      case dimensionLayer:
        return 25;
      case dynamicEntityLayer:
        return 26;
      case ogc3DTilesLayer:
        return 27;
      case unknownLayer:
        return -1;
    }
  }
}

/// This object represents a legend item.
///
/// You can get this object from the LayerContent.fetchLegendInfosAsync method
/// of objects that implement the [LayerContent] interface (e.g.
/// [ArcGISSublayer.fetchLegendInfos]).
final class LegendInfo implements ffi.Finalizable {
  final RT_LegendInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LegendInfo_destroy.cast());

  static LegendInfo? _fromHandle(RT_LegendInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LegendInfo._withHandle(handle);
  }

  LegendInfo._withHandle(RT_LegendInfoHandle handle)
      : _symbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LegendInfo_getSymbol(handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LegendInfo_created(_handle);
    }
  }

  /// The name of the legend item.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LegendInfo_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The symbol of a legend item.
  ///
  /// The symbol of the legend item.
  ArcGISSymbol? get symbol => _symbol.value;

  final Memoized<ArcGISSymbol?> _symbol;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LegendInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_LegendInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_LegendInfo_getHash(_handle, errorHandler);
    });
  }
}

/// Filter features from the display based on the specified active display
/// filter.
///
/// This is useful when making visual comparisons of the data, or filtering out
/// specific pieces of data.
final class ManualDisplayFilterDefinition extends DisplayFilterDefinition {
  static ManualDisplayFilterDefinition? _fromHandle(
      RT_ManualDisplayFilterDefinitionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ManualDisplayFilterDefinition._withHandle(handle);
  }

  ManualDisplayFilterDefinition._withHandle(super.handle)
      : _activeFilter = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ManualDisplayFilterDefinition_getActiveFilter(
                handle, errorHandler);
          });
          return DisplayFilter._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ManualDisplayFilterDefinition_setActiveFilter(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _availableFilters = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ManualDisplayFilterDefinition_getAvailableFilters(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a new [ManualDisplayFilterDefinition] with the specified active
  /// and available filters.
  ///
  /// Parameters:
  /// - `activeFilter` — A display filter from
  /// [ManualDisplayFilterDefinition.availableFilters] to apply.
  /// - `availableFilters` — The collection of display filters that can be
  /// applied.
  factory ManualDisplayFilterDefinition.withFilters(
      {required DisplayFilter? activeFilter,
      required List<DisplayFilter> availableFilters}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreAvailableFilters =
        availableFilters.toMutableArray(valueType: _ElementType.displayFilter);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ManualDisplayFilterDefinition_createWithFilters(
          activeFilter?._handle ?? ffi.nullptr,
          coreAvailableFilters._handle,
          errorHandler);
    });
    final ManualDisplayFilterDefinition object =
        ManualDisplayFilterDefinition._withHandle(handle);
    object._activeFilter.cache(activeFilter);
    object._availableFilters.value.setCache(availableFilters);
    return object;
  }

  /// A display filter from [ManualDisplayFilterDefinition.availableFilters] to
  /// apply.
  ///
  /// To enable display filter on a layer, specify a filter that is part of
  /// [ManualDisplayFilterDefinition.availableFilters]. If no active filter is
  /// set, then no display filter is applied.
  DisplayFilter? get activeFilter => _activeFilter.value;

  set activeFilter(DisplayFilter? value) => _activeFilter.value = value;

  final Memoized<DisplayFilter?> _activeFilter;

  /// The collection of display filters that can be applied.
  ///
  /// To enable display filter on a layer, specify a
  /// [ManualDisplayFilterDefinition.activeFilter] that is part of this
  /// collection.
  ///
  /// If the specified [ManualDisplayFilterDefinition.activeFilter] does not
  /// appear to be applied, check the layer's [LayerViewState] for a
  /// [LayerViewStatus.warning] as there might be a [LayerViewState.error]
  /// describing that display filter's where clause is not valid.
  ///
  /// Note that should collection contain a [ScaleRangeDisplayFilter], its
  /// [ScaleRangeDisplayFilter.minScale] and [ScaleRangeDisplayFilter.maxScale]
  /// are both ignored.
  List<DisplayFilter> get availableFilters => _availableFilters.value;

  final Memoized<_MutableArrayList<DisplayFilter>> _availableFilters;
}

/// The image formats supported by ArcGIS map services and ArcGIS image
/// services.
enum MapServiceImageFormat {
  /// To use service-defined default image format.
  default_,

  /// PNG. Supported in ArcGIS map service only.
  png,

  /// 8-bit PNG. Supported in both the ArcGIS image and map services.
  png8,

  /// 24bit PNG. Supported in both the ArcGIS image and map services.
  png24,

  /// PNG32. Supported in both the ArcGIS image and map services.
  png32,

  /// JPEG. Supported in both the ArcGIS image and map services.
  jpg,

  /// JPG | PNG. Supported in ArcGIS image service only.
  ///
  /// This format returns a JPG if there are no transparent pixels in the
  /// requested extent, otherwise it returns a PNG.
  jpgpng,

  /// BMP.
  bmp,

  /// GIF.
  gif,

  /// TIFF.
  tiff,

  /// Unknown.
  unknown;

  factory MapServiceImageFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return default_;
      case 1:
        return png;
      case 2:
        return png8;
      case 3:
        return png24;
      case 4:
        return png32;
      case 5:
        return jpg;
      case 6:
        return jpgpng;
      case 7:
        return bmp;
      case 8:
        return gif;
      case 9:
        return tiff;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case default_:
        return 0;
      case png:
        return 1;
      case png8:
        return 2;
      case png24:
        return 3;
      case png32:
        return 4;
      case jpg:
        return 5;
      case jpgpng:
        return 6;
      case bmp:
        return 7;
      case gif:
        return 8;
      case tiff:
        return 9;
      case unknown:
        return -1;
    }
  }
}

/// A map sublayer source refers to a layer in the current map service.
///
/// If supported, use the geodatabase version property to specify an alternate
/// geodatabase version.
final class MapSublayerSource extends SublayerSource {
  static MapSublayerSource? _fromHandle(RT_MapSublayerSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MapSublayerSource._withHandle(handle);
  }

  MapSublayerSource._withHandle(super.handle) : super._withHandle();

  /// Create a map sublayer source from a map sublayer id.
  ///
  /// Parameters:
  /// - `id` — The map sublayer id.
  factory MapSublayerSource({required int id}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapSublayerSource_createWithId(id, errorHandler);
    });
    return MapSublayerSource._withHandle(handle);
  }

  /// The map sublayer id of the map sublayer source.
  ///
  /// -1 if an error occurs.
  int get arcGISMapSublayerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapSublayerSource_getMapSublayerId(
          _handle, errorHandler);
    });
  }

  /// The geodatabase version.
  String get geodatabaseVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapSublayerSource_getGeodatabaseVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set geodatabaseVersion(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapSublayerSource_setGeodatabaseVersion(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// The [ImageTiledLayer] behavior for the tiles without data.
enum NoDataTileBehavior {
  /// Show coarser tiles. That's the default for operational layers and basemap
  /// base layers.
  upSample,

  /// Show blank tiles (nothing). That's the default for basemap reference
  /// layers.
  blank,

  /// Show the tiles with 'No Data' stamped over them.
  show_,

  /// Unknown.
  unknown;

  factory NoDataTileBehavior._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return upSample;
      case 1:
        return blank;
      case 2:
        return show_;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case upSample:
        return 0;
      case blank:
        return 1;
      case show_:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// An Interface for setting and getting the refreshInterval of an object.
///
/// This interface will be used to set or get the refreshInterval of an object
/// that supports a refresh interval. The get method returns a refreshInterval
/// (in milliseconds) and not the interface [_Refreshable].
abstract interface class _Refreshable {
  /// The objects refresh interval.
  ///
  /// The refresh interval, in milliseconds. A refresh interval of 0 means never
  /// refresh.
  int get refreshInterval;

  set refreshInterval(int value);
}

/// Filter features from the display based on the current map scale.
///
/// This is useful when there is so much feature density at small scales making
/// the display difficult to interpret or slow to draw.
final class ScaleDisplayFilterDefinition extends DisplayFilterDefinition {
  static ScaleDisplayFilterDefinition? _fromHandle(
      RT_ScaleDisplayFilterDefinitionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ScaleDisplayFilterDefinition._withHandle(handle);
  }

  ScaleDisplayFilterDefinition._withHandle(super.handle)
      : _filters = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ScaleDisplayFilterDefinition_getFilters(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a new [ScaleDisplayFilterDefinition] with the specified scale
  /// range display filters.
  ///
  /// Parameters:
  /// - `filters` — The collection of scale range display filters.
  factory ScaleDisplayFilterDefinition.withFilters(
      List<ScaleRangeDisplayFilter> filters) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFilters =
        filters.toMutableArray(valueType: _ElementType.scaleRangeDisplayFilter);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ScaleDisplayFilterDefinition_createWithFilters(
          coreFilters._handle, errorHandler);
    });
    final ScaleDisplayFilterDefinition object =
        ScaleDisplayFilterDefinition._withHandle(handle);
    object._filters.value.setCache(filters);
    return object;
  }

  /// The collection of scale range display filters.
  ///
  /// To enable display filter on a layer, every [ScaleRangeDisplayFilter] in
  /// this collection must provide a [ScaleRangeDisplayFilter.minScale] or
  /// [ScaleRangeDisplayFilter.maxScale] within the map's current scale.
  ///
  /// If more than one [ScaleRangeDisplayFilter] is applicable at a given scale,
  /// the first [ScaleRangeDisplayFilter] within the current map scale is
  /// applied.
  ///
  /// If the features displayed are not expected, check the layer's
  /// [LayerViewState] for a [LayerViewStatus.warning] as there might be a
  /// [LayerViewState.error] indicating there is a scale overlap between
  /// multiple [ScaleRangeDisplayFilter] objects.
  List<ScaleRangeDisplayFilter> get filters => _filters.value;

  final Memoized<_MutableArrayList<ScaleRangeDisplayFilter>> _filters;
}

/// A [DisplayFilter] that is applied on the layer based on the provided scale
/// range.
final class ScaleRangeDisplayFilter extends DisplayFilter {
  static ScaleRangeDisplayFilter? _fromHandle(
      RT_ScaleRangeDisplayFilterHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DisplayFilter._instanceCache.instanceWith(handle);
  }

  ScaleRangeDisplayFilter._withHandle(super.handle) : super._withHandle();

  /// Creates a new [ScaleRangeDisplayFilter] with the specified name, where
  /// clause, and scale range.
  ///
  /// Parameters:
  /// - `name` — A descriptive name for this display filter.
  /// - `whereClause` — A SQL expression that defines which features are
  /// rendered.
  /// - `minScale` — The minimum scale at which this display filter is applied.
  /// - `maxScale` — The maximum scale at which this display filter is applied.
  factory ScaleRangeDisplayFilter.withScaleRange(
      {required String name,
      required String whereClause,
      required double minScale,
      required double maxScale}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreWhereClause = _CString(whereClause);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ScaleRangeDisplayFilter_createWithScaleRange(
          coreName.bytes,
          coreWhereClause.bytes,
          minScale,
          maxScale,
          errorHandler);
    });
    return DisplayFilter._instanceCache.instanceWith(handle);
  }

  /// The maximum scale at which this display filter is applied.
  ///
  /// This display filter is only applied when zoomed further out than the
  /// maximum scale. Set this property to allow current scale of the map to
  /// determine when this display filter is applied. If
  /// [ArcGISMapViewController.scale] or [Viewpoint.targetScale] is greater than
  /// or equal this value, the [DisplayFilter] will be applied. This value
  /// should be less than [ScaleRangeDisplayFilter.minScale]. A value of 0
  /// indicates this display filter is applied without an upper limit. The
  /// default value is 0.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ScaleRangeDisplayFilter_getMaxScale(
          _handle, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ScaleRangeDisplayFilter_setMaxScale(
          _handle, value, errorHandler);
    });
  }

  /// The minimum scale at which this display filter is applied.
  ///
  /// This display filter is only applied when zoomed further in than the
  /// minimum scale. Set this property to allow current scale of the map to
  /// determine when this display filter is applied. If
  /// [ArcGISMapViewController.scale] or [Viewpoint.targetScale] is less than or
  /// equal this value, the [DisplayFilter] will be applied. This value should
  /// be greater than [ScaleRangeDisplayFilter.maxScale]. A value of 0 indicates
  /// this display filter is applied without a lower limit. The default value is
  /// 0.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ScaleRangeDisplayFilter_getMinScale(
          _handle, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ScaleRangeDisplayFilter_setMinScale(
          _handle, value, errorHandler);
    });
  }
}

/// Describes how to combine a feature selection request with the current
/// selected features list.
enum SelectionMode {
  /// Appends the features to be selected with the current list of selected
  /// features.
  add,

  /// Replaces the current list of selected features with the features to be
  /// selected.
  new_,

  /// Removes the features from the current list of selected features.
  subtract;

  factory SelectionMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return add;
      case 1:
        return new_;
      case 2:
        return subtract;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case add:
        return 0;
      case new_:
        return 1;
      case subtract:
        return 2;
    }
  }
}

/// The source of an [ArcGISMapImageSublayer].
///
/// Depending on the type of [SublayerSource], these layers are classified as
/// follows:
/// * Map: a layer in the current map service (see [MapSublayerSource])
/// * Dynamic table: data from a table data source (see [TableSublayerSource])
/// * Dynamic query table: data from a queryTable data source (see
/// [TableQuerySublayerSource])
/// * Dynamic raster: data from a raster data source (see
/// `RasterSublayerSource`)
/// * Dynamic join table: data from a joinTable data source (see
/// [TableJoinSublayerSource])
final class SublayerSource implements ffi.Finalizable {
  final RT_SublayerSourceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SublayerSource_destroy.cast());

  static SublayerSource? _fromHandle(RT_SublayerSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (SublayerSource._objectTypeOf(handle)) {
      case SublayerSourceType.arcGISMapSublayerSource:
        return MapSublayerSource._withHandle(handle);
      case SublayerSourceType.tableJoinSublayerSource:
        return TableJoinSublayerSource._withHandle(handle);
      case SublayerSourceType.tableQuerySublayerSource:
        return TableQuerySublayerSource._withHandle(handle);
      case SublayerSourceType.tableSublayerSource:
        return TableSublayerSource._withHandle(handle);
      case SublayerSourceType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as SublayerSource');
        return SublayerSource._withHandle(handle);
    }
  }

  static SublayerSourceType _objectTypeOf(RT_SublayerSourceHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SublayerSource_getObjectType(handle, errorHandler);
    });
    return SublayerSourceType._fromCoreValue(coreValue);
  }

  SublayerSourceType get _objectType => SublayerSource._objectTypeOf(_handle);

  SublayerSource._withHandle(RT_SublayerSourceHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SublayerSource_created(_handle);
    }
  }
}

/// The different types of sublayer sources.
///
/// This is used to determine the sublayer source type. Can get the type by
/// calling [SublayerSource._objectType].
enum SublayerSourceType {
  /// A map sublayer source.
  arcGISMapSublayerSource,

  /// A table query sublayer source.
  tableQuerySublayerSource,

  /// A table join sublayer source.
  tableJoinSublayerSource,

  /// A table sublayer source.
  tableSublayerSource,

  /// A raster sublayer source.
  rasterSublayerSource,

  /// Unknown.
  unknown;

  factory SublayerSourceType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISMapSublayerSource;
      case 1:
        return tableQuerySublayerSource;
      case 2:
        return tableJoinSublayerSource;
      case 3:
        return tableSublayerSource;
      case 4:
        return rasterSublayerSource;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISMapSublayerSource:
        return 0;
      case tableQuerySublayerSource:
        return 1;
      case tableJoinSublayerSource:
        return 2;
      case tableSublayerSource:
        return 3;
      case rasterSublayerSource:
        return 4;
      case unknown:
        return -1;
    }
  }
}

/// Table Join sublayer source is the result of a join operation.
///
/// Nested joins are supported. To use nested joins, set either leftTableSource
/// or rightTableSource to be a [TableJoinSublayerSource].
final class TableJoinSublayerSource extends SublayerSource {
  static TableJoinSublayerSource? _fromHandle(
      RT_TableJoinSublayerSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TableJoinSublayerSource._withHandle(handle);
  }

  TableJoinSublayerSource._withHandle(super.handle)
      : __fields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableJoinSublayerSource_getFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _leftSublayerSource = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableJoinSublayerSource_getLeftSublayerSource(
                handle, errorHandler);
          });
          return SublayerSource._fromHandle(objectHandle)!;
        }),
        _rightSublayerSource = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_TableJoinSublayerSource_getRightSublayerSource(
                    handle, errorHandler);
          });
          return SublayerSource._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// Creates a table join sublayer source.
  ///
  /// Parameters:
  /// - `leftFieldName` — The left field name.
  /// - `leftSublayerSource` — The left sublayer source.
  /// - `rightFieldName` — The right field name.
  /// - `rightSublayerSource` — The right sublayer source.
  /// - `joinType` — The join type.
  factory TableJoinSublayerSource(
      {required String leftFieldName,
      required SublayerSource leftSublayerSource,
      required String rightFieldName,
      required SublayerSource rightSublayerSource,
      required JoinType joinType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreLeftFieldName = _CString(leftFieldName);
    final coreRightFieldName = _CString(rightFieldName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableJoinSublayerSource_createWithJoin(
          coreLeftFieldName.bytes,
          leftSublayerSource._handle,
          coreRightFieldName.bytes,
          rightSublayerSource._handle,
          joinType.coreValue,
          errorHandler);
    });
    final TableJoinSublayerSource object =
        TableJoinSublayerSource._withHandle(handle);
    object._leftSublayerSource.cache(leftSublayerSource);
    object._rightSublayerSource.cache(rightSublayerSource);
    return object;
  }

  /// The fields of the table join sublayer source.
  ///
  /// Use fields to control field visibility. If this value is empty, all fields
  /// are visible on the dynamic layer. Returns null if an error occurs.
  List<Field> get _fields => __fields.value;

  final Memoized<_MutableArrayList<Field>> __fields;

  /// The join type.
  ///
  /// [JoinType.unknown] if an error occurs.
  JoinType get joinType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableJoinSublayerSource_getJoinType(
          _handle, errorHandler);
    });
    return JoinType._fromCoreValue(coreValue);
  }

  /// The left field name.
  String get leftFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableJoinSublayerSource_getLeftFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The left sublayer source.
  SublayerSource get leftSublayerSource => _leftSublayerSource.value;

  final Memoized<SublayerSource> _leftSublayerSource;

  /// The right field name.
  String get rightFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableJoinSublayerSource_getRightFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The right sublayer source.
  SublayerSource get rightSublayerSource => _rightSublayerSource.value;

  final Memoized<SublayerSource> _rightSublayerSource;
}

/// Query table sublayer source is a layer/table that is defined by a SQL query.
final class TableQuerySublayerSource extends SublayerSource {
  static TableQuerySublayerSource? _fromHandle(
      RT_TableQuerySublayerSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TableQuerySublayerSource._withHandle(handle);
  }

  TableQuerySublayerSource._withHandle(super.handle)
      : __fields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableQuerySublayerSource_getFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _objectIdFieldNames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_TableQuerySublayerSource_getObjectIdFieldNames(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableQuerySublayerSource_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TableQuerySublayerSource_setSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a table query sublayer source.
  ///
  /// Parameters:
  /// - `workspaceId` — The workspace ID.
  /// - `sqlQuery` — The SQL query.
  /// - `objectIdFieldNames` — The object ID field names as a [List] of
  /// [String].
  factory TableQuerySublayerSource(
      {required String workspaceId,
      required String sqlQuery,
      required List<String> objectIdFieldNames}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWorkspaceId = _CString(workspaceId);
    final coreSqlQuery = _CString(sqlQuery);
    final coreObjectIdFieldNames =
        objectIdFieldNames.toArray(valueType: _ElementType.string);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_TableQuerySublayerSource_createWithIdQueryAndObjectIdFieldNames(
              coreWorkspaceId.bytes,
              coreSqlQuery.bytes,
              coreObjectIdFieldNames._handle,
              errorHandler);
    });
    final TableQuerySublayerSource object =
        TableQuerySublayerSource._withHandle(handle);
    object._objectIdFieldNames.value.setCache(objectIdFieldNames);
    return object;
  }

  /// The fields of the table query sublayer source.
  ///
  /// Use fields to control field visibility. If this value is empty, all fields
  /// are visible on the dynamic layer. Returns null if an error occurs.
  List<Field> get _fields => __fields.value;

  final Memoized<_MutableArrayList<Field>> __fields;

  /// The geometry type.
  ///
  /// [GeometryType.unknown] if an error occurs or if the geometry type has not
  /// been set.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableQuerySublayerSource_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  set geometryType(GeometryType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableQuerySublayerSource_setGeometryType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The object ID field names.
  List<String> get objectIdFieldNames => _objectIdFieldNames.value;

  final Memoized<_ArrayList<String>> _objectIdFieldNames;

  /// The spatial reference.
  SpatialReference? get spatialReference => _spatialReference.value;

  set spatialReference(SpatialReference? value) =>
      _spatialReference.value = value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The SQL query.
  String get sqlQuery {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableQuerySublayerSource_getSQLQuery(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The workspace ID.
  String get workspaceId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableQuerySublayerSource_getWorkspaceId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// Table sublayer source is a table, feature class, or raster that resides in a
/// registered workspace (either a folder or geodatabase).
///
/// In the case of a geodatabase, if versioned, use geodatabaseVersion property
/// to switch to an alternate geodatabase version. If version is empty or
/// missing, the registered geodatabase version will be used.
final class TableSublayerSource extends SublayerSource {
  static TableSublayerSource? _fromHandle(RT_TableSublayerSourceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TableSublayerSource._withHandle(handle);
  }

  TableSublayerSource._withHandle(super.handle)
      : __fields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableSublayerSource_getFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Create a table sublayer source from a workspace ID and a data source name.
  ///
  /// Parameters:
  /// - `workspaceId` — The workspace id.
  /// - `dataSourceName` — The data source name.
  factory TableSublayerSource(
      {required String workspaceId, required String dataSourceName}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWorkspaceId = _CString(workspaceId);
    final coreDataSourceName = _CString(dataSourceName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableSublayerSource_createWithIdAndName(
          coreWorkspaceId.bytes, coreDataSourceName.bytes, errorHandler);
    });
    return TableSublayerSource._withHandle(handle);
  }

  /// The data source name.
  String get dataSourceName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableSublayerSource_getDataSourceName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The fields of the table sublayer source.
  ///
  /// Use fields to control field visibility. If this value is empty, all fields
  /// are visible on the dynamic layer. Returns null if an error occurs.
  List<Field> get _fields => __fields.value;

  final Memoized<_MutableArrayList<Field>> __fields;

  /// The geodatabase version of the table sublayer source.
  String get geodatabaseVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableSublayerSource_getGeodatabaseVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set geodatabaseVersion(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableSublayerSource_setGeodatabaseVersion(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The workspace id.
  String get workspaceId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableSublayerSource_getWorkspaceId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// A local cache of rendered map tiles that can be used to create a layer.
///
/// A tile cache stores a collection of images at various scales. A client can
/// request the tiles needed to display a particular map extent. You can use
/// [ExportTileCacheTask] to generate and download tiles from a service,
/// creating a tile package (.tpk/.tpkx). Alternatively, you can use ArcGIS Pro
/// to create a map tile package and provision it to the device.
///
/// Functional characteristics
///
/// ArcGIS tiled layers do not support reprojection, query, select, identify, or
/// editing.
///
/// Performance characteristics
///
/// Tiles are generated when the cache is created. Requests for tiles are made
/// on multiple threads and handled asynchronously. The size of each returned
/// tile increases as the resolution or complexity of the image in the tile
/// increases. For example, high-resolution imagery tiles can be larger files
/// than topographic mapping for the same area and map extent.
///
/// Local tile caches are ideal for providing basemaps, or for infrequent
/// changes to contextual layers when network access is limited or non-existent.
/// Use [ExportTileCacheJob] to create and download a local tile cache to a
/// device. Alternatively, the cache can be provisioned directly to local
/// storage. The supported types of cache file formats are:
/// - Tile package (.tpk, .tpkx) - a tile cache of data, packaged into one
/// convenient, portable file, ideal for offline sharing of complete tiled
/// layers in a disconnected environment or via a portal.
/// - Compact Cache - a directory structure where groups of tiles are combined
/// into larger .bundle files, preserving performance and reducing copy times
/// and the size on disk of the cache.
/// - Exploded Cache - a directory structure where map tiles are stored as
/// individual files.
///
/// A tile cache is often used as a basemap, but can also be used to create an
/// [ArcGISTiledLayer] that is added to a map as an operational layer. An
/// offline `ArcGISTiledElevationSource` can also be created from an appropriate
/// tile cache and added to the `Scene.baseSurface` of an `ArcGISScene`.
final class TileCache
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_TileCacheHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TileCache_destroyInstance.cast());

  static TileCache? _fromHandle(RT_TileCacheHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TileCache._instanceCache.instanceWith(handle);
  }

  TileCache._withHandle(RT_TileCacheHandle handle)
      : _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileCache_getPath(handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _thumbnail = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileCache_getThumbnail(handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }),
        _tileInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileCache_getTileInfo(handle, errorHandler);
          });
          return TileInfo._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TileCache_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_TileCache_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_TileCache_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_TileCache_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_TileCache_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache =
      _InstanceCache(factory: _TileCacheFactory(), kind: 'TileCache');

  /// Create a tile cache from the specified tile cache path.
  ///
  /// Creates a tile cache from the given local path to a tile package (.tpk or
  /// .tpkx file), or directory containing a compact or exploded cache.
  ///
  /// Parameters:
  /// - `fileUri` — The path to the tile cache.
  factory TileCache.withFileUri(Uri fileUri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    return TileCache._instanceCache.instanceWith(handle);
  }

  /// The antialiasing flag of this tile cache.
  ///
  /// False if an error occurs.
  bool get antialiasing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getAntialiasing(_handle, errorHandler);
    });
  }

  /// The storage format of this tile cache.
  ///
  /// [CacheStorageFormat.unknown] if an error occurs.
  CacheStorageFormat get cacheStorageFormat {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getCacheStorageFormat(
          _handle, errorHandler);
    });
    return CacheStorageFormat._fromCoreValue(coreValue);
  }

  /// The path of the tile cache.
  ///
  /// For caches based on tile packages (.tpk or .tpkx files) this is the full
  /// path of the .tpk or .tpkx file; for caches based on compact or exploded
  /// caches this is the path of the directory containing the cache.
  ///
  /// This path can be empty when the tile cache is contained within a
  /// [MobileMapPackage] or `MobileScenePackage`.
  Uri? get fileUri => _fileUri.value;

  final Memoized<Uri?> _fileUri;

  /// The full extent of the tile cache.
  Envelope? get fullExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getFullExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getInstanceId(_handle, errorHandler);
    });
  }

  /// The thumbnail image of this tile cache.
  ArcGISImage? get thumbnail => _thumbnail.value;

  final Memoized<ArcGISImage?> _thumbnail;

  /// Information about the tiling scheme used by this tile cache.
  ///
  /// For example, the tiling scheme indicates the origin of the cached tiles,
  /// the levels of detail available, and the size of each tile.
  TileInfo? get tileInfo => _tileInfo.value;

  final Memoized<TileInfo?> _tileInfo;

  /// Clones the [TileCache].
  ///
  /// Return Value: A new [TileCache] with the same values as the current
  /// [TileCache].
  TileCache clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_clone(_handle, errorHandler);
    });
    return TileCache._fromHandle(objectHandle)!;
  }

  /// Returns the tile data for the specified tile key.
  ///
  /// Parameters:
  /// - `tileKey` — The tile key.
  ///
  /// Return Value: the raw untouched/unclipped data straight out of the tile
  /// cache for the specified tile key.
  Uint8List? getTileData({required TileKey tileKey}) {
    final byteArrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getTileData(
          _handle, tileKey._handle, errorHandler);
    });
    return _ByteArray._fromHandle(byteArrayHandle)?.toDartList();
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TileCache_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TileCache_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TileCache_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _fileUri.invalidateCache();
    _thumbnail.invalidateCache();
    _tileInfo.invalidateCache();
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
        logger.f('TileCache unhandled asyncType $asyncType');
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TileCache) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TileCache_getHash(_handle, errorHandler);
    });
  }
}

final class _TileCacheFactory
    implements _InstanceFactory<TileCache, RT_TileCacheHandle> {
  @override
  TileCache createInstance({required RT_TileCacheHandle handle}) {
    return TileCache._withHandle(handle);
  }

  @override
  void destroyHandle(RT_TileCacheHandle handle) {
    bindings.TileCache_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_TileCacheHandle handle) {
    return runtimecore.RT_TileCache_getInstanceId(handle, ffi.nullptr);
  }
}

/// The image formats supported by tiled layers.
enum TileImageFormat {
  /// PNG.
  png,

  /// 8-bit PNG.
  png8,

  /// 24-bit PNG.
  png24,

  /// 32-bit PNG.
  png32,

  /// JPEG.
  jpg,

  /// Mixed (JPEG in the center of the cache and PNG 32 on the edge of the
  /// cache).
  mixed,

  /// Limited Error Raster Compression.
  lerc,

  /// Unknown.
  unknown;

  factory TileImageFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return png;
      case 1:
        return png8;
      case 2:
        return png24;
      case 3:
        return png32;
      case 4:
        return jpg;
      case 5:
        return mixed;
      case 6:
        return lerc;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case png:
        return 0;
      case png8:
        return 1;
      case png24:
        return 2;
      case png32:
        return 3;
      case jpg:
        return 4;
      case mixed:
        return 5;
      case lerc:
        return 6;
      case unknown:
        return -1;
    }
  }
}

/// Represents the tiling scheme used by a cached map service.
///
/// For example, ArcGIS Server cached map service, Bing Maps, etc. The tiling
/// scheme contains information about how a map is broken up into tiles of
/// images and how a client can use these tiles to display a map.
final class TileInfo implements ffi.Finalizable {
  final RT_TileInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TileInfo_destroy.cast());

  static TileInfo? _fromHandle(RT_TileInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TileInfo._withHandle(handle);
  }

  TileInfo._withHandle(RT_TileInfoHandle handle)
      : _levelsOfDetail = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileInfo_getLevelsOfDetail(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileInfo_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TileInfo_created(_handle);
    }
  }

  /// Create tile information.
  ///
  /// Parameters:
  /// - `dpi` — The DPI of each tile.
  /// - `format` — The format of each tile.
  /// - `levelsOfDetail` — A [List] of [LevelOfDetail]. Contents of the [List]
  /// are copied.
  /// - `origin` — The origin of the tiles.
  /// - `spatialReference` — The spatial reference of the tiles.
  /// - `tileHeight` — Height of a tile, in pixels.
  /// - `tileWidth` — Width of a tile, in pixels.
  factory TileInfo(
      {required int dpi,
      required TileImageFormat format,
      required List<LevelOfDetail> levelsOfDetail,
      required ArcGISPoint origin,
      required SpatialReference spatialReference,
      required int tileHeight,
      required int tileWidth}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreLevelsOfDetail =
        levelsOfDetail.toArray(valueType: _ElementType.levelOfDetail);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_createWith(
          dpi,
          format.coreValue,
          coreLevelsOfDetail._handle,
          origin._handle,
          spatialReference._handle,
          tileHeight,
          tileWidth,
          errorHandler);
    });
    final TileInfo object = TileInfo._withHandle(handle);
    object._levelsOfDetail.value.setCache(levelsOfDetail);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The compression quality of the tile images. The compression quality
  /// controls how much loss the image will be subjected to by the compression
  /// algorithm. The values of the pixels of an image compressed with a higher
  /// compression quality will be closer to those of the original image. The
  /// valid range of compression quality values is from 0 to 100.
  ///
  /// If an error occurs or if the compression quality is not defined, NaN is
  /// returned.
  double get compressionQuality {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getCompressionQuality(
          _handle, errorHandler);
    });
  }

  /// The DPI (dots per inch) of the tiles.
  int get dpi {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getDPI(_handle, errorHandler);
    });
  }

  /// The format of the tile images.
  ///
  /// If there's an error the return value is [TileImageFormat.unknown].
  TileImageFormat get format {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getFormat(_handle, errorHandler);
    });
    return TileImageFormat._fromCoreValue(coreValue);
  }

  /// A list of LevelOfDetail instances. Each one has properties for its
  /// particular resolution and scale.
  ///
  /// A [List] with [LevelOfDetail].
  List<LevelOfDetail> get levelsOfDetail => _levelsOfDetail.value;

  final Memoized<_ArrayList<LevelOfDetail>> _levelsOfDetail;

  /// The origin of the tile info within the spatial reference.
  ///
  /// The origin is the upper left corner of the tiling scheme grid.
  ArcGISPoint get origin {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getOrigin(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The spatial reference for the tile info.
  SpatialReference get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference> _spatialReference;

  /// The height of each tile in pixels.
  int get tileHeight {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getTileHeight(_handle, errorHandler);
    });
  }

  /// The width of each tile in pixels.
  int get tileWidth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileInfo_getTileWidth(_handle, errorHandler);
    });
  }
}
