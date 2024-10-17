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

/// A job that estimates the size of a tile cache from a service.
final class EstimateTileCacheSizeJob extends Job<EstimateTileCacheSizeResult> {
  static EstimateTileCacheSizeJob? _fromHandle(
      RT_EstimateTileCacheSizeJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  EstimateTileCacheSizeJob._withHandle(super.handle)
      : _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_EstimateTileCacheSizeJob_getResult(
                handle, errorHandler);
          });
          return EstimateTileCacheSizeResult._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// For a successfully completed job the result returns an estimate of the
  /// tile cache size. Otherwise null is returned.
  ///
  /// If the job is in progress then a null result is returned until the job
  /// successfully completes.
  @override
  EstimateTileCacheSizeResult? get result => _result.value;

  final Memoized<EstimateTileCacheSizeResult?> _result;
}

/// The result of an [EstimateTileCacheSizeJob].
final class EstimateTileCacheSizeResult implements ffi.Finalizable {
  final RT_EstimateTileCacheSizeResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.EstimateTileCacheSizeResult_destroy.cast());

  static EstimateTileCacheSizeResult? _fromHandle(
      RT_EstimateTileCacheSizeResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return EstimateTileCacheSizeResult._withHandle(handle);
  }

  EstimateTileCacheSizeResult._withHandle(
      RT_EstimateTileCacheSizeResultHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.EstimateTileCacheSizeResult_created(_handle);
    }
  }

  /// The size of the tile cache (tile package, .tpk or .tpkx file) in bytes.
  int get fileSize {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EstimateTileCacheSizeResult_getFileSize(
          _handle, errorHandler);
    });
  }

  /// The number of tiles in the tile cache.
  int get tileCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EstimateTileCacheSizeResult_getTileCount(
          _handle, errorHandler);
    });
  }
}

/// A job that exports a tile cache (.tpk or .tpkx) from a service.
final class ExportTileCacheJob extends Job<TileCache> {
  static ExportTileCacheJob? _fromHandle(RT_ExportTileCacheJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  ExportTileCacheJob._withHandle(super.handle)
      : _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportTileCacheJob_getResult(
                handle, errorHandler);
          });
          return TileCache._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// For a successfully completed job the result returns a tile cache.
  /// Otherwise null is returned.
  ///
  /// If the job is in progress then a null result is returned until the job
  /// successfully completes. The returned tile cache is in a not loaded state,
  /// use [TileCache.load] to load it.
  @override
  TileCache? get result => _result.value;

  final Memoized<TileCache?> _result;
}

/// The parameters that specify how a tile cache (.tpkx) is exported from an
/// ArcGIS map or image service using an [ExportTileCacheJob].
///
/// To generate parameters populated with values from the underlying service,
/// call [ExportTileCacheTask.createDefaultExportTileCacheParameters]. You can
/// then modify these parameters with any desired changes. Alternatively, you
/// can generate an empty set of parameters using
/// [ExportTileCacheParameters.new] and set the parameters individually.
///
/// Before you export the tiles you should ensure that your device has
/// sufficient space for the tile cache. Generate an [EstimateTileCacheSizeJob]
/// by passing the parameters to [ExportTileCacheTask.estimateTileCacheSize].
/// Run this job to obtain an estimate of the tile cache size found in the
/// [EstimateTileCacheSizeResult].
///
/// To export the tile cache, create an [ExportTileCacheJob], pass the
/// parameters to the [ExportTileCacheTask.exportTileCache] method and provide a
/// path where the .tpkx file can be downloaded to on the device.
///
/// You can also use the [ExportTileCacheParameters] to provide more
/// fine-grained control over the tiles that are exported when an offline map is
/// generated. For more information, see the
/// [GenerateOfflineMapParameterOverrides] class.
final class ExportTileCacheParameters implements _InstanceId, ffi.Finalizable {
  final RT_ExportTileCacheParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ExportTileCacheParameters_destroyInstance.cast());

  static ExportTileCacheParameters? _fromHandle(
      RT_ExportTileCacheParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExportTileCacheParameters._instanceCache.instanceWith(handle);
  }

  ExportTileCacheParameters._withHandle(
      RT_ExportTileCacheParametersHandle handle)
      : _levelIds = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportTileCacheParameters_getLevelIds(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExportTileCacheParameters_created(_handle);
    }
  }

  static final _instanceCache = _InstanceCache(
      factory: _ExportTileCacheParametersFactory(),
      kind: 'ExportTileCacheParameters');

  /// Creates a new export tile cache parameters instance.
  factory ExportTileCacheParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheParameters_create(errorHandler);
    });
    return ExportTileCacheParameters._instanceCache.instanceWith(handle);
  }

  /// Area of interest geometry. May be set to null to specify retrieval of the
  /// full tile cache extent.
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference. Where a
  /// [Polygon] is supplied, tiles will be filtered according to the polygon
  /// geometry, which can help reduce the size of the resulting tile package.
  /// Note that the filtered set of tiles may vary, depending on the underlying
  /// service.
  Geometry? get areaOfInterest {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheParameters_getAreaOfInterest(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set areaOfInterest(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheParameters_setAreaOfInterest(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The compression quality.
  ///
  /// Compression quality is a value from 0 to 100 or NaN. A lower number
  /// reduces the size of the exported tile package, but reduces the quality.
  /// This applies to JPEG format tiles. If the value is NaN the service will
  /// use its default compression quality. The default compression value for the
  /// service is accessible on the services metadata under
  /// [TileInfo.compressionQuality].
  double get compressionQuality {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheParameters_getCompressionQuality(
          _handle, errorHandler);
    });
  }

  set compressionQuality(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheParameters_setCompressionQuality(
          _handle, value, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheParameters_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// Level IDs.
  List<int> get levelIds => _levelIds.value;

  final Memoized<_MutableArrayList<int>> _levelIds;

  /// Clones the [ExportTileCacheParameters].
  ///
  /// Return Value: A new [ExportTileCacheParameters] with the same values as
  /// the current [ExportTileCacheParameters].
  ExportTileCacheParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheParameters_clone(
          _handle, errorHandler);
    });
    return ExportTileCacheParameters._fromHandle(objectHandle)!;
  }
}

final class _ExportTileCacheParametersFactory
    implements
        _InstanceFactory<ExportTileCacheParameters,
            RT_ExportTileCacheParametersHandle> {
  @override
  ExportTileCacheParameters createInstance(
      {required RT_ExportTileCacheParametersHandle handle}) {
    return ExportTileCacheParameters._withHandle(handle);
  }

  @override
  void destroyHandle(RT_ExportTileCacheParametersHandle handle) {
    bindings.ExportTileCacheParameters_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(
      RT_ExportTileCacheParametersHandle handle) {
    return runtimecore.RT_ExportTileCacheParameters_getInstanceId(
        handle, ffi.nullptr);
  }
}

/// A task used to export a tile cache (.tpk or .tpkx). Use this in conjunction
/// with a map or image service to generate and download tile packages.
///
/// To confirm whether a map or image service supports exporting tiles, check:
/// * [ArcGISMapServiceInfo.exportTilesAllowed] property for the legacy compact
/// format (.tpk)
/// * [ArcGISMapServiceInfo.exportTileCacheCompactV2Allowed] property for the
/// compact version 2 format (.tpkx)
///
/// See [TileCache] for information on creating a layer from a local tile cache.
///
/// When using Esri provided image basemaps (such as the World Imagery basemap,
/// see [BasemapStyle.arcGISImagery]) an
/// [alternative service](https://www.arcgis.com/home/group.html?id=3a890be7a4b046c7840dc4a0446c5b31#overview)
/// which supports exporting tiles may be used instead. For example, the World
/// Imagery Service
/// (https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer)
/// will be exported using a corresponding export-enabled service
/// (https://tiledbasemaps.arcgis.com/arcgis/rest/services/World_Imagery/MapServer).
///
/// Similarly, when using elevation data from Esri (such as Terrain 3D), an
/// [alternative service](https://www.arcgis.com/home/group.html?id=3a890be7a4b046c7840dc4a0446c5b31#overview)
/// that supports exporting tiles may be used instead. For example, the Terrain
/// 3D
/// (https://elevation3d.arcgis.com/ArcGIS/rest/services/WorldElevation3D/Terrain3D/ImageServer)
/// will be exported using a corresponding export-enabled service
/// (https://tiledbasemaps.arcgis.com/arcgis/rest/services/WorldElevation3D/Terrain3D/ImageServer).
/// The resulting tile cache can then be used to create an offline
/// `ArcGISTiledElevationSource` in a scene.
///
/// Note that these export-enabled services are not intended for use as an
/// online basemap or elevation source, and should only be used for exporting
/// tiles for offline use. The export-enabled services require authentication to
/// export tiles.
final class ExportTileCacheTask
    with Loadable
    implements ApiKeyResource, _CallbackReceiver, ffi.Finalizable {
  final RT_ExportTileCacheTaskHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ExportTileCacheTask_destroy.cast());

  static ExportTileCacheTask? _fromHandle(RT_ExportTileCacheTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExportTileCacheTask._withHandle(handle);
  }

  ExportTileCacheTask._withHandle(RT_ExportTileCacheTaskHandle handle)
      : _arcGISMapServiceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportTileCacheTask_getMapServiceInfo(
                handle, errorHandler);
          });
          return ArcGISMapServiceInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExportTileCacheTask_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExportTileCacheTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportTileCacheTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportTileCacheTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportTileCacheTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ExportTileCacheTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Create an export tile cache task from a URL.
  ///
  /// The map or image service must support tile cache export.
  ///
  /// Parameters:
  /// - `uri` — The URL of an ArcGIS REST service that supports tile cache
  /// export.
  factory ExportTileCacheTask({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    final ExportTileCacheTask object = ExportTileCacheTask._withHandle(handle);
    object._uri.cache(uri);
    return object;
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheTask_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The task's [ArcGISMapServiceInfo]
  ///
  /// If created with a URL, this property will be populated after the task has
  /// been loaded. Before then, null will be returned.
  ///
  /// In the case of Esri provided image basemaps or elevation sources, the
  /// meta-data will be for the export-enabled version of the service.
  ArcGISMapServiceInfo? get arcGISMapServiceInfo => _arcGISMapServiceInfo.value;

  final Memoized<ArcGISMapServiceInfo?> _arcGISMapServiceInfo;

  /// The task's service URL.
  ///
  /// This property is only writable when the task is in load status
  /// [LoadStatus.notLoaded].
  Uri get uri => _uri.value;

  final Memoized<Uri> _uri;

  /// Creates and returns a [Future] of [ExportTileCacheParameters].
  ///
  /// This function is asynchronous because it makes use of the service metadata
  /// to build an [ExportTileCacheParameters] object. Calling the function will
  /// trigger load of the [ExportTileCacheTask], unless it's already loaded.
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference. When a
  /// [Polygon] is supplied, tiles will be filtered according to the polygon
  /// geometry, which can help reduce the size of the resulting tile package.
  /// Note that the filtered set of tiles may vary, depending on the underlying
  /// service.
  ///
  /// The value of min_scale must be larger than the value of max_scale, unless
  /// they are 0. A min_scale value of 0 will result in this method choosing the
  /// services smallest level number, typically level 0.
  ///
  /// Similarly, a max_scale of 0 will result in the services largest level
  /// number being used, representing the closest in view being visible when
  /// taken offline. If min_scale is between the scales of tile levels the
  /// previous smallest level is used.
  ///
  /// If max_scale is between tile levels the next level is taken to ensure it
  /// is displayed. For example a simple service has 4 levels: level 0 scale
  /// 2000000; level 1 scale
  /// 1000000; level 2 scale 500000; level 3 scale 250000.
  ///
  /// A min_scale of 0 and max_scale of 0 selects all levels 0,1,2,3.
  ///
  /// A min_scale of 750000 (between levels 1 and 2) and a max_scale of 25000
  /// (at level 3) will select levels 1,2,3.
  ///
  /// A min_scale of 0 and a max_scale 750000 (between 1 and 2) will select
  /// levels 0,1,2.
  ///
  /// A min_scale of 1000000 and a max_scale of 0 will select all levels from 1
  /// onwards 1,2,3.
  ///
  /// Be careful when combining a large extent or a wide range of scales, this
  /// can result in the export failing due to exceeding the services maximum
  /// export tile count.
  ///
  /// Parameters:
  /// - `areaOfInterest` — A [Geometry] specifying the area to be exported. Must
  /// be non-null.
  /// - `minScale` — The map scale '1:min_scale' which determines how far out to
  /// take offline. Can be 0 for the furthest out.
  /// - `maxScale` — The map scale '1:max_scale' which determines how far in to
  /// take offline. Can be 0 for the closest in the service allows.
  ///
  /// Return Value: A [Future] containing an [ExportTileCacheParameters].
  Future<ExportTileCacheParameters> createDefaultExportTileCacheParameters(
      {required Geometry areaOfInterest,
      required double minScale,
      required double maxScale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportTileCacheTask_createDefaultExportTileCacheParametersAsync(
              _handle,
              areaOfInterest._handle,
              minScale,
              maxScale,
              errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsExportTileCacheParameters()!);
  }

  /// Cancelable version of [createDefaultExportTileCacheParameters]. See that
  /// method for more information.
  CancelableOperation<ExportTileCacheParameters>
      createDefaultExportTileCacheParametersCancelable(
          {required Geometry areaOfInterest,
          required double minScale,
          required double maxScale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ExportTileCacheTask_createDefaultExportTileCacheParametersAsync(
              _handle,
              areaOfInterest._handle,
              minScale,
              maxScale,
              errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsExportTileCacheParameters()!);
  }

  /// Return a new estimate tile cache size job.
  ///
  /// Parameters:
  /// - `parameters` — Export tile cache parameters to be used in estimating.
  ///
  /// Return Value: A new [EstimateTileCacheSizeJob].
  EstimateTileCacheSizeJob estimateTileCacheSize(
      {required ExportTileCacheParameters parameters}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheTask_estimateTileCacheSize(
          _handle, parameters._handle, errorHandler);
    });
    return EstimateTileCacheSizeJob._fromHandle(objectHandle)!;
  }

  /// Return a new export tile cache job.
  ///
  /// The resulting job will export tiles from the service, which is referenced
  /// by the [ExportTileCacheTask.uri] property (or its export-enabled
  /// alternative), to a local tile cache at the downloadFilePath. The format of
  /// the tile cache is determined by the file extension supplied in the
  /// downloadFilePath parameter.
  ///
  /// If the download file path ends with ".tpk", the tile cache will use the
  /// legacy compact format.
  ///
  /// If the download file path ends with ".tpkx", the tile cache will use the
  /// current compact version 2 format.
  ///
  /// If the service does not support exporting tiles, the job will fail with
  /// [ArcGISExceptionType.mappingTileExportNotEnabled].
  ///
  /// If a .tpkx format was requested, but the format is not supported by the
  /// service, the job will fail with
  /// [ArcGISExceptionType.mappingTileCacheCompactV2ExportNotEnabled].
  ///
  /// Parameters:
  /// - `parameters` — Export tile cache parameters to be used in exporting.
  /// - `downloadFileUri` — Downloaded tile cache file path that ends with .tpk
  /// or .tpkx, depending on the desired format.
  ///
  /// Return Value: A new [ExportTileCacheJob].
  ExportTileCacheJob exportTileCache(
      {required ExportTileCacheParameters parameters,
      required Uri downloadFileUri}) {
    final coreDownloadFileUri = _CString(downloadFileUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheTask_exportTileCache(
          _handle, parameters._handle, coreDownloadFileUri.bytes, errorHandler);
    });
    return ExportTileCacheJob._fromHandle(objectHandle)!;
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExportTileCacheTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ExportTileCacheTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _arcGISMapServiceInfo.invalidateCache();
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
        logger.f('ExportTileCacheTask unhandled asyncType $asyncType');
    }
  }
}
