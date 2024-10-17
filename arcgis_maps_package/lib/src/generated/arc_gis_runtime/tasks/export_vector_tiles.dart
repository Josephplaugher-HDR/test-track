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

/// Enumerates options for downloading an Esri vector tiled basemap service.
///
/// When taking an Esri vector tiled basemap service offline (e.g. to create a
/// [VectorTileCache] on your device), you can choose from different versions of
/// the service depending on your use case.
///
/// Primary considerations are the download speed and the size of the resulting
/// .vtpk file. Among other things, file size is influenced by the amount of
/// fonts downloaded from the service. Esri vector tiled basemap layers make use
/// of fonts as part of their style resources - see the
/// [Vector Tile Style documentation](https://developers.arcgis.com/rest/services-reference/enterprise/vector-tile-style.htm).
/// When you take a vector tiled layer offline, these fonts are downloaded as
/// part of the [VectorTileCache].
///
/// Esri services also offer an alternative version with a reduced font package
/// size which will reduce the download size of a vtpk by around 80 Mb. You can
/// view a set of vector tile styles which use the reduced font services
/// [here](https://www.arcgis.com/home/group.html?id=c61ab1493fff4b84b53705184876c9b0).
/// If you are creating a web map that is only intended for taking maps offline
/// and not for online-viewing, these "for export" versions of the services are
/// recommended.
///
/// This enumeration describes options for controlling which set of fonts are
/// downloaded. Note that these options only apply to Esri vector tile basemap
/// services.
enum EsriVectorTilesDownloadOption {
  /// The complete set of vector tile resources for the original service,
  /// including the full set of fonts, will be downloaded.
  ///
  /// Downloading all font resources increases the download size of a .vtpk.
  /// However, this option ensures that the offline vector tile layer displays
  /// the same as the original online service.
  useOriginalService,

  /// An alternative service that uses a reduced set of font resources,
  /// supporting a limited set of language characters, will be downloaded.
  ///
  /// Downloading the smaller set of font resources reduces the download size of
  /// a .vtpk by around 80 Mb. This omits the large Arial Unicode font, that is
  /// used to support many characters for the full world basemap. This makes
  /// this option unsuitable for some locales or when your offline vector tiled
  /// layer includes certain character sets. For example, this option will not
  /// display Chinese, Japanese, Thai, Korean or Georgian characters. You should
  /// confirm that this option is suitable for your specific use-case.
  ///
  /// You can view a set of vector tile styles which use the reduced font
  /// services
  /// [here](https://www.arcgis.com/home/group.html?id=c61ab1493fff4b84b53705184876c9b0).
  /// This option is not recommended for Esri basemap services that do not have
  /// an equivalent "for export" version.
  useReducedFontsService;

  factory EsriVectorTilesDownloadOption._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return useOriginalService;
      case 1:
        return useReducedFontsService;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case useOriginalService:
        return 0;
      case useReducedFontsService:
        return 1;
    }
  }
}

/// A job that exports vector tiles from a service. The job can also export an
/// item resource cache from a portal item.
final class ExportVectorTilesJob extends Job<ExportVectorTilesResult>
    implements _CallbackReceiver {
  static ExportVectorTilesJob? _fromHandle(
      RT_ExportVectorTilesJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  ExportVectorTilesJob._withHandle(super.handle)
      : _itemResourceCacheUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesJob_getItemResourceCachePath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _parameters = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesJob_getParameters(
                handle, errorHandler);
          });
          return ExportVectorTilesParameters._fromHandle(objectHandle)!;
        }),
        __portalItem = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesJob_getPortalItem(
                handle, errorHandler);
          });
          return PortalItem._fromHandle(objectHandle);
        }),
        _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesJob_getResult(
                handle, errorHandler);
          });
          return ExportVectorTilesResult._fromHandle(objectHandle);
        }),
        _vectorTileCacheUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesJob_getVectorTileCachePath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _ensurePortalItemHasRequestHandlerStreamController =
        StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_ExportVectorTilesJob_setEnsurePortalItemHasRequestHandlerCallback(
                  _handle,
                  bindings.addresses
                      .asyncExportVectorTilesJobEnsurePortalItemHasRequestHandlerEvent,
                  userData,
                  errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_ExportVectorTilesJob_setEnsurePortalItemHasRequestHandlerCallback(
                  _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void>
      _ensurePortalItemHasRequestHandlerStreamController;

  /// This event can fire during job execution and indicates a change to
  /// [ExportVectorTilesTask.portalItem] property by the underlying
  /// [ExportVectorTilesTask] code.
  ///
  /// When the job is executing it may need to create a new [PortalItem] in
  /// order to export an [ItemResourceCache]. APIs need to set a call-back to
  /// check for and wrap the new portal item exposed in the internal-only
  /// [ExportVectorTilesJob._portalItem] property. This event can happen when
  /// the job is created from a not loaded [ExportVectorTilesTask] with a URL to
  /// a portal item or if the job is deserialized from JSON. If the job is
  /// created from an [ExportVectorTilesTask] which already has an
  /// [ExportVectorTilesTask.portalItem] the event is not fired and the
  /// [ExportVectorTilesJob._portalItem] will contain the same instance and be
  /// re-used.
  Stream<void> get _onEnsurePortalItemHasRequestHandler =>
      _ensurePortalItemHasRequestHandlerStreamController.stream;

  /// The path that the downloaded vector tile style is saved to. If this job
  /// was created with [ExportVectorTilesTask.exportVectorTiles], this will be
  /// an empty string.
  Uri? get itemResourceCacheUri => _itemResourceCacheUri.value;

  final Memoized<Uri?> _itemResourceCacheUri;

  /// The parameters used to create this job.
  ExportVectorTilesParameters get parameters => _parameters.value;

  final Memoized<ExportVectorTilesParameters> _parameters;

  /// A portal item created internally for handling requests.
  PortalItem? get _portalItem => __portalItem.value;

  final Memoized<PortalItem?> __portalItem;

  /// Result of the successfully completed job ([ExportVectorTilesResult]). If
  /// successful it will contain the downloaded vector tile cache. Otherwise
  /// null is returned.
  ///
  /// If the job is in progress then a null result is returned until the job
  /// successfully completes.
  @override
  ExportVectorTilesResult? get result => _result.value;

  final Memoized<ExportVectorTilesResult?> _result;

  /// The path that the downloaded vector tile cache is saved to. If this job
  /// was created with [ExportVectorTilesTask.exportStyleResourceCache], this
  /// will be an empty string.
  Uri? get vectorTileCacheUri => _vectorTileCacheUri.value;

  final Memoized<Uri?> _vectorTileCacheUri;

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType
            .asyncTypeExportVectorTilesJobEnsurePortalItemHasRequestHandlerEvent:
        _ensurePortalItemHasRequestHandlerStreamController.add(null);
      default:
        super._processCallback(message);
    }
  }
}

/// The parameters that specify how a vector tile cache (.vtpk) is exported from
/// a vector tile service using an [ExportVectorTilesJob].
///
/// To generate parameters populated with values from the vector tile service,
/// call [ExportVectorTilesTask.createDefaultExportVectorTilesParameters]. You
/// can then modify these parameters with any desired changes. Alternatively,
/// you can generate an empty set of parameters using
/// [ExportVectorTilesParameters.new] and set the parameter values individually.
/// To export the vector tile cache, create an [ExportVectorTilesJob], pass the
/// parameters to the [ExportVectorTilesTask.exportVectorTiles] method and
/// provide a path where the .vtpk file can be downloaded to on the device.
///
/// You can also use the [ExportVectorTilesParameters] to provide more
/// fine-grained control over the vector tiles that are exported when an offline
/// map is generated. For more information, see the
/// [GenerateOfflineMapParameterOverrides] class.
final class ExportVectorTilesParameters
    implements _InstanceId, ffi.Finalizable {
  final RT_ExportVectorTilesParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ExportVectorTilesParameters_destroyInstance.cast());

  static ExportVectorTilesParameters? _fromHandle(
      RT_ExportVectorTilesParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExportVectorTilesParameters._instanceCache.instanceWith(handle);
  }

  ExportVectorTilesParameters._withHandle(
      RT_ExportVectorTilesParametersHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExportVectorTilesParameters_created(_handle);
    }
  }

  static final _instanceCache = _InstanceCache(
      factory: _ExportVectorTilesParametersFactory(),
      kind: 'ExportVectorTilesParameters');

  /// Creates a new export vector tiles parameters instance.
  factory ExportVectorTilesParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesParameters_create(errorHandler);
    });
    return ExportVectorTilesParameters._instanceCache.instanceWith(handle);
  }

  /// Area of interest geometry. May be set to null to specify retrieval of the
  /// full vector tiles extent.
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference. Where a
  /// [Polygon] is supplied, tiles will be filtered according to the polygon
  /// geometry, which can help reduce the size of the resulting tile package.
  /// Note that the filtered set of tiles may vary, depending on the underlying
  /// service.
  Geometry? get areaOfInterest {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesParameters_getAreaOfInterest(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set areaOfInterest(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesParameters_setAreaOfInterest(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Describes how Esri vector tiled basemap layers will be downloaded.
  ///
  /// This property lets you choose how to download Esri vector tiled basemap
  /// layers. This property only applies when taking an Esri vector tile basemap
  /// service offline.
  ///
  /// When taking an Esri vector tiled basemap service offline (e.g. to create a
  /// [VectorTileCache] on your device), you can choose from different versions
  /// of the service depending on your use case.
  ///
  /// Primary considerations are the download speed and the size of the
  /// resulting .vtpk file. Among other things, file size is influenced by the
  /// number of fonts downloaded from the service. Esri vector tiled basemap
  /// layers use fonts as part of their style resources - see the
  /// [vector-tile-style
  /// documentation](https://developers.arcgis.com/rest/services-reference/enterprise/vector-tile-style.htm).
  /// When you take a vector tiled layer offline, these fonts are downloaded as
  /// part of the [VectorTileCache].
  ///
  /// Esri services also offer an alternative version with a reduced font
  /// package size. This omits the large Arial Unicode font, which greatly
  /// reduces the download size. You can view the set of reduced font vector
  /// tile services
  /// [here](https://www.arcgis.com/home/group.html?id=c61ab1493fff4b84b53705184876c9b0).
  ///
  /// * If you choose [EsriVectorTilesDownloadOption.useOriginalService], the
  /// full set of resources used by the original online service, including all
  /// fonts, will be downloaded. This increases the download size of the
  /// [VectorTileCache] but ensures that the offline layer will display the same
  /// as the original online data.
  ///
  /// * If you choose [EsriVectorTilesDownloadOption.useReducedFontsService],
  /// the smaller set of fonts used by the alternative, for export, version of
  /// the service will be downloaded. This reduces the download size of the
  /// [VectorTileCache] but is not suitable for all locales or when your offline
  /// vector tiled layer includes certain language characters. For example, this
  /// option will not display Chinese, Japanese, Thai, Korean or Georgian
  /// characters. If an alternative, for export version of the service cannot be
  /// found, the original service will be used.
  ///
  /// The default value is [EsriVectorTilesDownloadOption.useOriginalService].
  EsriVectorTilesDownloadOption get esriVectorTilesDownloadOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportVectorTilesParameters_getEsriVectorTilesDownloadOption(
              _handle, errorHandler);
    });
    return EsriVectorTilesDownloadOption._fromCoreValue(coreValue);
  }

  set esriVectorTilesDownloadOption(EsriVectorTilesDownloadOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_ExportVectorTilesParameters_setEsriVectorTilesDownloadOption(
              _handle, value.coreValue, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesParameters_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// The maximum level of detail at which the vector tiles are going to be
  /// exported.
  ///
  /// This represents the maximum level of detail to export. The vector tile
  /// export will always take levels 0 and all in between levels up to and
  /// including the value of max level. The larger the level the more tiles will
  /// be included. The default value is -1, which must be set to a valid value
  /// >= 0.
  int get maxLevel {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesParameters_getMaxLevel(
          _handle, errorHandler);
    });
  }

  set maxLevel(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesParameters_setMaxLevel(
          _handle, value, errorHandler);
    });
  }

  /// Clones the [ExportVectorTilesParameters].
  ///
  /// Return Value: A new [ExportVectorTilesParameters] with the same values as
  /// the current [ExportVectorTilesParameters].
  ExportVectorTilesParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesParameters_clone(
          _handle, errorHandler);
    });
    return ExportVectorTilesParameters._fromHandle(objectHandle)!;
  }
}

final class _ExportVectorTilesParametersFactory
    implements
        _InstanceFactory<ExportVectorTilesParameters,
            RT_ExportVectorTilesParametersHandle> {
  @override
  ExportVectorTilesParameters createInstance(
      {required RT_ExportVectorTilesParametersHandle handle}) {
    return ExportVectorTilesParameters._withHandle(handle);
  }

  @override
  void destroyHandle(RT_ExportVectorTilesParametersHandle handle) {
    bindings.ExportVectorTilesParameters_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(
      RT_ExportVectorTilesParametersHandle handle) {
    return runtimecore.RT_ExportVectorTilesParameters_getInstanceId(
        handle, ffi.nullptr);
  }
}

/// The result of an [ExportVectorTilesJob].
final class ExportVectorTilesResult implements ffi.Finalizable {
  final RT_ExportVectorTilesResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ExportVectorTilesResult_destroy.cast());

  static ExportVectorTilesResult? _fromHandle(
      RT_ExportVectorTilesResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExportVectorTilesResult._withHandle(handle);
  }

  ExportVectorTilesResult._withHandle(RT_ExportVectorTilesResultHandle handle)
      : _itemResourceCache = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesResult_getItemResourceCache(
                handle, errorHandler);
          });
          return ItemResourceCache._fromHandle(objectHandle);
        }),
        _vectorTileCache = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesResult_getVectorTileCache(
                handle, errorHandler);
          });
          return VectorTileCache._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExportVectorTilesResult_created(_handle);
    }
  }

  /// The item resource cache result of a successful export vector titles job.
  /// For vector tiles, this contains a custom style.
  ItemResourceCache? get itemResourceCache => _itemResourceCache.value;

  final Memoized<ItemResourceCache?> _itemResourceCache;

  /// The vector tile cache result of a successful export vector tiles job. This
  /// result will be null if the item cache resource alone is returned.
  VectorTileCache? get vectorTileCache => _vectorTileCache.value;

  final Memoized<VectorTileCache?> _vectorTileCache;
}

/// A task used to export vector tiles and optionally a portal item's vector
/// tile style resources.
///
/// Vector tiles are exported as a vector tile package (.vtpk) file, see
/// [VectorTileCache].
///
/// A portal item can contain a custom style resources overriding the vector
/// tile services default style and this can be checked with
/// [ExportVectorTilesTask.hasStyleResources]. The custom style is exported
/// separately as an [ItemResourceCache].
///
/// The export vector tiles task can be initialized with a URL using
/// [ExportVectorTilesTask.withUri]. The URL can be to:
/// * A vector tile server that ends in "VectorTileServer" and is the rest
/// end-point used to export vector tile packages. The vector tile service must
/// be enabled for export or the task will fail to load.
/// * A portal item for a vector tile service or a vector tiled layer with a
/// custom style applied.
/// * A vector basemap layer created using a [BasemapStyle].
///
/// Alternatively a [PortalItem], referencing a vector tile service or a custom
/// style for a vector tiled layer, can be used with
/// [ExportVectorTilesTask.withPortalItem].
///
/// When using Esri provided vector basemaps that do not support exporting tiles
/// (such as the ArcGIS streets basemap - see [BasemapStyle.arcGISStreets]), an
/// alternative service that supports exporting tiles will be used instead.
final class ExportVectorTilesTask
    with Loadable
    implements ApiKeyResource, _CallbackReceiver, ffi.Finalizable {
  final RT_ExportVectorTilesTaskHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ExportVectorTilesTask_destroy.cast());

  static ExportVectorTilesTask? _fromHandle(
      RT_ExportVectorTilesTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExportVectorTilesTask._withHandle(handle);
  }

  ExportVectorTilesTask._withHandle(RT_ExportVectorTilesTaskHandle handle)
      : _portalItem = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesTask_getPortalItem(
                handle, errorHandler);
          });
          return PortalItem._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesTask_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _vectorTileSourceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportVectorTilesTask_getVectorTileSourceInfo(
                handle, errorHandler);
          });
          return VectorTileSourceInfo._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExportVectorTilesTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _ensurePortalItemHasRequestHandlerStreamController =
        StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_ExportVectorTilesTask_setEnsurePortalItemHasRequestHandlerCallback(
                  _handle,
                  bindings.addresses
                      .asyncExportVectorTilesTaskEnsurePortalItemHasRequestHandlerEvent,
                  userData,
                  errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_ExportVectorTilesTask_setEnsurePortalItemHasRequestHandlerCallback(
                  _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportVectorTilesTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportVectorTilesTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportVectorTilesTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportVectorTilesTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void>
      _ensurePortalItemHasRequestHandlerStreamController;

  /// This event can fire during loading and indicates a change to
  /// [ExportVectorTilesTask.portalItem] property by the underlying
  /// [ExportVectorTilesTask] code.
  ///
  /// If the task was constructed with a portal URL, as part of loading the
  /// underlying [ExportVectorTilesTask] will create a new [PortalItem]. This is
  /// to handle requests for checking and exporting style resources. If an
  /// [ExportVectorTilesTask.portalItem] was set by external code the event will
  /// not fire as this instance will already be wrapped. Additionally if there's
  /// failure to load as a result of a new [PortalItem] the
  /// [ExportVectorTilesTask.portalItem] will be set to null and another call to
  /// [ExportVectorTilesTask._onEnsurePortalItemHasRequestHandler] will be
  /// fired.
  Stream<void> get _onEnsurePortalItemHasRequestHandler =>
      _ensurePortalItemHasRequestHandlerStreamController.stream;

  /// Initialize an export vector tiles task with a portal item of type
  /// [PortalItemType.vectorTileService].
  ///
  /// If the portal item is not of type [PortalItemType.vectorTileService] the
  /// task will fail to load.
  ///
  /// The portal item will reference a vector tile service and once the task is
  /// loaded the property [ExportVectorTilesTask.uri] will be populated to the
  /// backing service.
  ///
  /// This portal item can also contain custom style resources see
  /// [ExportVectorTilesTask.hasStyleResources] which can additionally be
  /// exported as [ItemResourceCache].
  ///
  /// Parameters:
  /// - `portalItem` — A portal item instance.
  factory ExportVectorTilesTask.withPortalItem(PortalItem portalItem) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_createWithPortalItem(
          portalItem._handle, errorHandler);
    });
    return ExportVectorTilesTask._withHandle(handle);
  }

  /// Initialize an export vector tiles task with a URL to a vector tile
  /// service.
  ///
  /// The URL can be for:
  /// * A vector tile server that ends in "VectorTileServer" and is the rest
  /// end-point used to export vector tile packages. The vector tile service
  /// must be enabled for export or the task will fail to load.
  /// * A portal item for a vector tile service or a vector tiled layer with a
  /// custom style applied
  /// * A vector basemap layer created using a [BasemapStyle]
  ///
  /// If the URL represents a [PortalItem] that can be used to download vector
  /// tiles or style resources, the [ExportVectorTilesTask.portalItem] property
  /// will be populated when the task is loaded.
  ///
  /// Parameters:
  /// - `uri` — The URL of a service or portal item to be used for exporting
  /// vector tiles.
  factory ExportVectorTilesTask.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return ExportVectorTilesTask._withHandle(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Indicates if the task's portal item has any associated style resources
  /// that override the default style of the vector tile service.
  ///
  /// This property will be set to true if the export vector tile task has been
  /// loaded and the task's portal item has style resources. The portal item's
  /// style resources override the default style of the vector tile service and
  /// can be exported as [ItemResourceCache].
  bool get hasStyleResources {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_getHasStyleResources(
          _handle, errorHandler);
    });
  }

  /// The task's portal item which must be of type
  /// [PortalItemType.vectorTileService].
  ///
  /// This property can only be set when the task is load status
  /// [LoadStatus.notLoaded] or [LoadStatus.failedToLoad] If the portal item is
  /// not of type [PortalItemType.vectorTileService] the task will fail to load.
  /// A vector tile service can be referenced by an item in a portal of type
  /// [PortalItemType.vectorTileService]. This item can also contain custom
  /// style resources see [ExportVectorTilesTask.hasStyleResources] which can be
  /// exported as [ItemResourceCache].
  PortalItem? get portalItem => _portalItem.value;

  final Memoized<PortalItem?> _portalItem;

  /// The URL for exporting vector tiles.
  ///
  /// This property can be the URL of:
  /// * A vector tile server that ends in "VectorTileServer" and is the rest
  /// end-point used to export vector tile packages. The vector tile service
  /// must be enabled for export or the task will fail to load.
  /// * A portal item for a vector tile service or a vector tiled layer with a
  /// custom style applied
  /// * A vector basemap layer created using a [BasemapStyle]
  ///
  /// If the URL represents a [PortalItem] that can be used to download vector
  /// tiles or style resources, the [ExportVectorTilesTask.portalItem] property
  /// will be populated when the task is loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The task's [VectorTileSourceInfo] representing the source metadata for a
  /// vector tile service.
  VectorTileSourceInfo? get vectorTileSourceInfo => _vectorTileSourceInfo.value;

  final Memoized<VectorTileSourceInfo?> _vectorTileSourceInfo;

  /// Creates and returns the default parameters for the export vector tile
  /// task.
  ///
  /// This function is asynchronous because it makes use of the service metadata
  /// to populate the [ExportVectorTilesParameters] object. Calling this
  /// function will trigger the [ExportVectorTilesTask] to be loaded, unless it
  /// is already loaded.
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference. Where a
  /// [Polygon] is supplied, tiles will be filtered according to the polygon
  /// geometry, which can help reduce the size of the resulting tile package.
  /// Note that the filtered set of tiles may vary, depending on the underlying
  /// service.
  ///
  /// A max_scale of 0 will include all levels of detail of the service. Be
  /// careful when you provide a large area of interest or a small max_scale
  /// value as this could result in a large number of tiles being requested. If
  /// the number of tiles requested exceeds the service's maximum export tile
  /// count the [ExportVectorTilesJob] will fail.
  ///
  /// Parameters:
  /// - `areaOfInterest` — a [Geometry] specifying the area of vector tiles to
  /// be exported. Must not be null.
  /// - `maxScale` — the map scale '1:max_scale' which determines how far in to
  /// export the vector tiles. Set the value to 0 to include all levels of
  /// detail in the service.
  ///
  /// Return Value: The [ExportVectorTilesParameters].
  Future<ExportVectorTilesParameters> createDefaultExportVectorTilesParameters(
      {required Geometry areaOfInterest, required double maxScale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportVectorTilesTask_createDefaultExportVectorTilesParametersAsync(
              _handle, areaOfInterest._handle, maxScale, errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsExportVectorTilesParameters()!);
  }

  /// Cancelable version of [createDefaultExportVectorTilesParameters]. See that
  /// method for more information.
  CancelableOperation<ExportVectorTilesParameters>
      createDefaultExportVectorTilesParametersCancelable(
          {required Geometry areaOfInterest, required double maxScale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportVectorTilesTask_createDefaultExportVectorTilesParametersAsync(
              _handle, areaOfInterest._handle, maxScale, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsExportVectorTilesParameters()!);
  }

  /// Return a new export vector tiles job that will download a custom style
  /// from a portal item as an item resource cache.
  ///
  /// The job will return the item resource cache without a vector tile cache.
  /// This is useful when a number of different styles are applied to the same
  /// underlying vector tile service. This avoids exporting multiple copies of
  /// the same tiles.
  ///
  /// Parameters:
  /// - `itemResourceCacheUri` — The file path where the vector style file will
  /// be saved on disk.
  ///
  /// Return Value: A new [ExportVectorTilesJob].
  ExportVectorTilesJob exportStyleResourceCache(
      {required Uri itemResourceCacheUri}) {
    final coreItemResourceCacheUri =
        _CString(itemResourceCacheUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_exportStyleResourceCache(
          _handle, coreItemResourceCacheUri.bytes, errorHandler);
    });
    return ExportVectorTilesJob._fromHandle(objectHandle)!;
  }

  /// Returns a new export vector tiles job that can be used to generate and
  /// download a vector tile package containing the vector tiles specified by
  /// the parameters ([ExportVectorTilesParameters]).
  ///
  /// Parameters:
  /// - `parameters` — specifying which tiles to include in the vector tile
  /// package.
  /// - `downloadFileUri` — The file path where the vector tiles will be saved
  /// on disk, including the desired file name ending with the .vtpk file
  /// extension.
  ///
  /// Return Value: A new [ExportVectorTilesJob] to export the vector tiles from
  /// a service.
  ExportVectorTilesJob exportVectorTiles(
      {required ExportVectorTilesParameters parameters,
      required Uri downloadFileUri}) {
    final coreDownloadFileUri = _CString(downloadFileUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_exportVectorTiles(
          _handle, parameters._handle, coreDownloadFileUri.bytes, errorHandler);
    });
    return ExportVectorTilesJob._fromHandle(objectHandle)!;
  }

  /// Return a new export vector tiles job that can be used to generate and
  /// download a vector tile package and return a custom style as an item
  /// resource cache.
  ///
  /// Parameters:
  /// - `parameters` — specifying which tiles to include in the vector tile
  /// package.
  /// - `vectorTileCacheUri` — The file path where the vector tiles will be
  /// saved on disk, including the desired file name ending with the .vtpk file
  /// extension.
  /// - `itemResourceCacheUri` — The directory path where the style file will be
  /// saved on disk.
  ///
  /// Return Value: A new [ExportVectorTilesJob] to export the vector tiles from
  /// a service.
  ExportVectorTilesJob exportVectorTilesWithItemResourceCache(
      {required ExportVectorTilesParameters parameters,
      required Uri vectorTileCacheUri,
      required Uri itemResourceCacheUri}) {
    final coreVectorTileCacheUri = _CString(vectorTileCacheUri.toFilePath());
    final coreItemResourceCacheUri =
        _CString(itemResourceCacheUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportVectorTilesTask_exportVectorTilesWithItemResourceCache(
              _handle,
              parameters._handle,
              coreVectorTileCacheUri.bytes,
              coreItemResourceCacheUri.bytes,
              errorHandler);
    });
    return ExportVectorTilesJob._fromHandle(objectHandle)!;
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportVectorTilesTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportVectorTilesTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _portalItem.invalidateCache();
    _uri.invalidateCache();
    _vectorTileSourceInfo.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType
            .asyncTypeExportVectorTilesTaskEnsurePortalItemHasRequestHandlerEvent:
        _ensurePortalItemHasRequestHandlerStreamController.add(null);
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
        logger.f('ExportVectorTilesTask unhandled asyncType $asyncType');
    }
  }
}

/// Contains information about the offline resources typically associated with a
/// custom style of an [ArcGISVectorTiledLayer].
///
/// For example, an ArcGIS vector tile layer can have style resources, such as
/// fonts and sprites.
final class ItemResourceCache
    with Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_ItemResourceCacheHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ItemResourceCache_destroy.cast());

  static ItemResourceCache? _fromHandle(RT_ItemResourceCacheHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ItemResourceCache._withHandle(handle);
  }

  ItemResourceCache._withHandle(RT_ItemResourceCacheHandle handle)
      : _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ItemResourceCache_getItem(
                handle, errorHandler);
          });
          return LocalItem._fromHandle(objectHandle);
        }),
        _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ItemResourceCache_getPath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ItemResourceCache_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ItemResourceCache_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ItemResourceCache_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ItemResourceCache_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ItemResourceCache_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates an instance of this object with a path to a directory containing
  /// [ItemResourceCache].
  ///
  /// Parameters:
  /// - `fileUri` — path.
  factory ItemResourceCache({required Uri fileUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ItemResourceCache_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    return ItemResourceCache._withHandle(handle);
  }

  /// The path to the on-disk location containing the [ItemResourceCache].
  ///
  /// The path can be a directory on-disk that contains the [ItemResourceCache].
  /// Alternatively, if the [ItemResourceCache] was loaded from a package file,
  /// such as a [MobileMapPackage], the path is to the package.
  Uri? get fileUri => _fileUri.value;

  final Memoized<Uri?> _fileUri;

  /// The [LocalItem] containing the [ItemResourceCache]'s thumbnail and
  /// metadata.
  ///
  /// This property can be null if the [LocalItem] is not present within the
  /// [ItemResourceCache] directory. If the [ItemResourceCache] was taken
  /// offline using [ExportVectorTilesTask] or [OfflineMapTask] the [LocalItem]
  /// will be populated from the online [PortalItem]. If the [ItemResourceCache]
  /// was created inside a [MobileMapPackage] authored from ArcGIS Pro then this
  /// property will return null.
  LocalItem? get item => _item.value;

  final Memoized<LocalItem?> _item;

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ItemResourceCache_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ItemResourceCache_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ItemResourceCache_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ItemResourceCache_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _item.invalidateCache();
    _fileUri.invalidateCache();
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
        logger.f('ItemResourceCache unhandled asyncType $asyncType');
    }
  }
}
