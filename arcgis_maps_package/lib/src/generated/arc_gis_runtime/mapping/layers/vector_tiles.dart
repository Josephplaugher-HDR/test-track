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

part of '../../../../../arcgis_maps.dart';

/// A layer that can visualize data from an ArcGIS vector tile service or a
/// local [VectorTileCache].
///
/// An ArcGIS vector tiled layer displays vector tiles from an online vector
/// tile service or a local vector tile cache (.vtpk file). Vector tiled layers
/// are appropriate for basemap, reference and possibly operational layers. They
/// do not contain feature data, and do not support identify, search, or editing
/// operations.
///
/// Vector tiles are an alternative to raster tile basemap layers, such as
/// [ArcGISTiledLayer]. Instead of pixels (raster), the cartography is delivered
/// using 2D points. The points describe lines, polygons, or the locations of
/// labels and marker symbols. The file format of vector tiles is binary and
/// conforms to the
/// [Mapbox Vector Tile Specification](https://mapbox.github.io/vector-tile-spec/).
/// This specification allows a more continuous visual experience between levels
/// of detail compared to raster tiles. The vector tile file format requires
/// less space than raster tiles and is optimized to reduce network bandwidth.
///
/// You can create a vector tiled layer using either a URI or a portal item. The
/// URI can point to a vector tile source, a vector tile style sheet, or a local
/// vector tile package (.vtpk) file. The portal item will contain a URI to a
/// vector tile style sheet. The style sheet describes the appearance of the
/// geometry and must be in the Mapbox GL Style format. The style sheet also
/// contains a URI to a vector tile source. The source must be in the Mapbox
/// TileJSON format. The source info includes a URI to a default style sheet.
///
/// More than one vector tile style sheet can use the same source. Both the
/// source info and the style sheet are human readable JSON files.
///
/// You can also download vector tiles from an online vector tile service using
/// [ExportVectorTilesTask]. The downloaded vector tile package is a single file
/// (.vtpk) that contains all of the tile data files, the source information, a
/// style sheet, and the font and symbol marker resources required to display
/// the map.
///
/// Vector tile packages can be distributed inside mobile map packages (.mmpk).
/// The mobile map package JSON can point to the location of the vector tile
/// style sheet or the root of the vector tile package data.
final class ArcGISVectorTiledLayer extends Layer implements ApiKeyResource {
  static ArcGISVectorTiledLayer? _fromHandle(
      RT_ArcGISVectorTiledLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  ArcGISVectorTiledLayer._withHandle(super.handle)
      : _itemResourceCache = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISVectorTiledLayer_getItemResourceCache(
                handle, errorHandler);
          });
          return ItemResourceCache._fromHandle(objectHandle);
        }),
        _sourceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISVectorTiledLayer_getSourceInfo(
                handle, errorHandler);
          });
          return VectorTileSourceInfo._fromHandle(objectHandle);
        }),
        _style = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISVectorTiledLayer_getStyle(
                handle, errorHandler);
          });
          return VectorTileStyle._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISVectorTiledLayer_getURI(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _vectorTileCache = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISVectorTiledLayer_getVectorTileCache(
                handle, errorHandler);
          });
          return VectorTileCache._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// Creates an ArcGIS Vector Tiled Layer from a [PortalItem].
  ///
  /// Parameters:
  /// - `item` — An [Item].
  factory ArcGISVectorTiledLayer.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISVectorTiledLayer_createWithItem(
          item._handle, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates an ArcGIS Vector Tiled Layer from an ArcGIS Vector Tile Service
  /// URL, a Vector Tile Style Sheet URI, or the path to a local vector tile
  /// package (.vtpk) file.
  ///
  /// Parameters:
  /// - `uri` — An ArcGIS Vector Tile Service URL, an ArcGIS Vector Tile Style
  /// Sheet URI, or the path to a local vector tile package (.vtpk) file.
  factory ArcGISVectorTiledLayer.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISVectorTiledLayer_createWithURI(
          coreURI.bytes, errorHandler);
    });
    return Layer._instanceCache.instanceWith(handle);
  }

  /// Creates an ArcGIS Vector Tiled Layer from a vector tile cache and an item
  /// resource cache containing a custom style for this vector tile layer.
  ///
  /// Parameters:
  /// - `vectorTileCache` — A [VectorTileCache].
  /// - `itemResourceCache` — The item resource cache contains a custom style.
  factory ArcGISVectorTiledLayer.withVectorTileCache(
      VectorTileCache vectorTileCache,
      {ItemResourceCache? itemResourceCache}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISVectorTiledLayer_createWithVectorTileCacheAndItemResourceCache(
              vectorTileCache._handle,
              itemResourceCache?._handle ?? ffi.nullptr,
              errorHandler);
    });
    final ArcGISVectorTiledLayer object =
        Layer._instanceCache.instanceWith(handle);
    object._itemResourceCache.cache(itemResourceCache);
    return object;
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISVectorTiledLayer_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISVectorTiledLayer_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The item resource cache contains a custom style that can be applied to
  /// this layer.
  ///
  /// This method can only be called if the layer load status is
  /// [LoadStatus.notLoaded] or [LoadStatus.failedToLoad] otherwise
  /// [ArcGISExceptionType.commonIllegalState] exception will occur.
  ItemResourceCache? get itemResourceCache => _itemResourceCache.value;

  final Memoized<ItemResourceCache?> _itemResourceCache;

  /// The vector tile source info.
  VectorTileSourceInfo? get sourceInfo => _sourceInfo.value;

  final Memoized<VectorTileSourceInfo?> _sourceInfo;

  /// The vector tile style info.
  VectorTileStyle? get style => _style.value;

  final Memoized<VectorTileStyle?> _style;

  /// The URI of the ArcGIS vector tiled layer.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The underlying vector tile cache or null if no vector tile cache is
  /// present.
  ///
  /// If this layer was created from a vector tile cache or a local file URI,
  /// then it will return the vector tile cache. If this layer was created from
  /// a remote URI, it will return null.
  VectorTileCache? get vectorTileCache => _vectorTileCache.value;

  final Memoized<VectorTileCache?> _vectorTileCache;
}

/// A local cache of vector tiles that can be used to create an
/// [ArcGISVectorTiledLayer].
///
/// Local tile caches are ideal for providing basemaps or less frequently
/// changing contextual layers, where network access is limited or non-existent.
/// You can create and download a vector tile cache onto a device by using an
/// [ExportVectorTilesJob], or alternatively you can provision it directly to
/// local storage. Currently the only supported type of cache is the vector tile
/// package (.vtpk). This single file contains all of the tile data files, the
/// source information, a style sheet, and the font and symbol marker resources
/// required to display the map.
///
/// You can create an [ArcGISVectorTiledLayer] from a [VectorTileCache] and then
/// use it as a basemap or as an operational layer in a map or scene.
final class VectorTileCache
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_VectorTileCacheHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.VectorTileCache_destroyInstance.cast());

  static VectorTileCache? _fromHandle(RT_VectorTileCacheHandle handle) {
    if (handle == ffi.nullptr) return null;
    return VectorTileCache._instanceCache.instanceWith(handle);
  }

  VectorTileCache._withHandle(RT_VectorTileCacheHandle handle)
      : _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileCache_getPath(handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _sourceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileCache_getSourceInfo(
                handle, errorHandler);
          });
          return VectorTileSourceInfo._fromHandle(objectHandle);
        }),
        _thumbnail = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileCache_getThumbnail(
                handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.VectorTileCache_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_VectorTileCache_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_VectorTileCache_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_VectorTileCache_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_VectorTileCache_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache = _InstanceCache(
      factory: _VectorTileCacheFactory(), kind: 'VectorTileCache');

  /// Create a vector tile cache with the given path.
  ///
  /// Parameters:
  /// - `fileUri` — path.
  factory VectorTileCache({required Uri fileUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileCache_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    return VectorTileCache._instanceCache.instanceWith(handle);
  }

  /// The path to the on disk source file for this vector tile cache.
  ///
  /// This path can be empty when the vector tile cache is contained within a
  /// [MobileMapPackage] or `MobileScenePackage`.
  Uri? get fileUri => _fileUri.value;

  final Memoized<Uri?> _fileUri;

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileCache_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// Source info.
  VectorTileSourceInfo? get sourceInfo => _sourceInfo.value;

  final Memoized<VectorTileSourceInfo?> _sourceInfo;

  /// Thumbnail.
  ArcGISImage? get thumbnail => _thumbnail.value;

  final Memoized<ArcGISImage?> _thumbnail;

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileCache_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_VectorTileCache_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_VectorTileCache_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_VectorTileCache_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _fileUri.invalidateCache();
    _sourceInfo.invalidateCache();
    _thumbnail.invalidateCache();
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
        logger.f('VectorTileCache unhandled asyncType $asyncType');
    }
  }
}

final class _VectorTileCacheFactory
    implements _InstanceFactory<VectorTileCache, RT_VectorTileCacheHandle> {
  @override
  VectorTileCache createInstance({required RT_VectorTileCacheHandle handle}) {
    return VectorTileCache._withHandle(handle);
  }

  @override
  void destroyHandle(RT_VectorTileCacheHandle handle) {
    bindings.VectorTileCache_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_VectorTileCacheHandle handle) {
    return runtimecore.RT_VectorTileCache_getInstanceId(handle, ffi.nullptr);
  }
}

/// The metadata for a vector tile source.
///
/// A vector tile source can be provided by online vector tile service, a vector
/// tile style sheet, or a local vector tile cache. [VectorTileSourceInfo]
/// provides basic information about the vector tile source such as the name,
/// URI, extent and visible scale. You can obtain the [VectorTileSourceInfo]
/// from an [ArcGISVectorTiledLayer] or a [VectorTileCache].
final class VectorTileSourceInfo implements ffi.Finalizable {
  final RT_VectorTileSourceInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.VectorTileSourceInfo_destroy.cast());

  static VectorTileSourceInfo? _fromHandle(
      RT_VectorTileSourceInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return VectorTileSourceInfo._withHandle(handle);
  }

  VectorTileSourceInfo._withHandle(RT_VectorTileSourceInfoHandle handle)
      : _defaultStyle = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileSourceInfo_getDefaultStyle(
                handle, errorHandler);
          });
          return VectorTileStyle._fromHandle(objectHandle);
        }),
        _defaultStyleUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileSourceInfo_getDefaultStyleURI(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _levelsOfDetail = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileSourceInfo_getLevelsOfDetail(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileSourceInfo_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileSourceInfo_getURI(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.VectorTileSourceInfo_created(_handle);
    }
  }

  /// The default style object.
  VectorTileStyle? get defaultStyle => _defaultStyle.value;

  final Memoized<VectorTileStyle?> _defaultStyle;

  /// The current the default style URI.
  Uri get defaultStyleUri => _defaultStyleUri.value;

  final Memoized<Uri> _defaultStyleUri;

  /// True if this source supports exporting tiles, false otherwise.
  bool get exportTilesAllowed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getExportTilesAllowed(
          _handle, errorHandler);
    });
  }

  /// The full extent of the source data.
  Envelope? get fullExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getFullExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The initial extent of the source data.
  Envelope? get initialExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getInitialExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The levels of detail of the source data.
  List<LevelOfDetail> get levelsOfDetail => _levelsOfDetail.value;

  final Memoized<_ArrayList<LevelOfDetail>> _levelsOfDetail;

  /// The maximum number of tiles that can be exported from the service.
  int get maxExportTilesCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getMaxExportTilesCount(
          _handle, errorHandler);
    });
  }

  /// The maximum scale.
  ///
  /// Will return an undefined float if an error occurs.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The minimum scale.
  ///
  /// Will return an undefined float if an error occurs.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The source name.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The origin of the source data.
  ArcGISPoint? get origin {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getOrigin(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// The spatial reference of the source data.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The vector tile source URI.
  Uri get uri => _uri.value;

  final Memoized<Uri> _uri;

  /// The source version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileSourceInfo_getVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// The style information for a vector tile layer.
///
/// Styles allows vector tiles to be visualized in different ways, such as day
/// and night viewing. A vector tile style is a JSON structure and resources
/// that define how the contents of vector tiles are displayed using an
/// [ArcGISVectorTiledLayer]. Each style contains sets of visual properties for
/// a vector tiled layer, such as fill colors, viewing levels, and labels, and
/// its resources include fonts and sprites. Each ArcGIS vector tile source will
/// have a default vector tile style and may have additional custom styles.
///
/// You can download vector tiles, their default style and any custom style
/// resources by using the [ExportVectorTilesTask]. To download styles, check
/// that [ExportVectorTilesTask.hasStyleResources] is true. If you want to
/// download a vector tile cache with a custom vector tile style, use
/// [ExportVectorTilesTask.exportVectorTilesWithItemResourceCache] to generate
/// the [ExportVectorTilesJob] and specify the local paths to store vector tile
/// cache and the item resource cache. If you just want to download a custom
/// style, use the [ExportVectorTilesTask.exportStyleResourceCache] to generate
/// the [ExportVectorTilesJob] and specify the local path to store the item
/// resource cache.
///
/// To display tiles from a local vector tile package (.vtpk) using a custom
/// vector tile style, use the [ArcGISVectorTiledLayer.withVectorTileCache]
/// constructor and provide the custom item resource cache for the style.
///
/// You can create new styles for an ArcGIS vector tile source using the
/// [ArcGIS Vector Tile Style Editor](https://developers.arcgis.com/documentation/mapping-apis-and-services/tools/vector-tile-style-editor/).
/// ArcGIS Online provides some example layers with multiple styles in
/// [Creative Vector Tile Layers and Web Maps](https://www.arcgis.com/home/group.html?id=20dd19496c504cbf999c408014f88353#overview).
final class VectorTileStyle implements ffi.Finalizable {
  final RT_VectorTileStyleHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.VectorTileStyle_destroy.cast());

  static VectorTileStyle? _fromHandle(RT_VectorTileStyleHandle handle) {
    if (handle == ffi.nullptr) return null;
    return VectorTileStyle._withHandle(handle);
  }

  VectorTileStyle._withHandle(RT_VectorTileStyleHandle handle)
      : _sourceUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_VectorTileStyle_getSourceURI(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.VectorTileStyle_created(_handle);
    }
  }

  /// The vector tile source URI.
  Uri get sourceUri => _sourceUri.value;

  final Memoized<Uri> _sourceUri;

  /// The style version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_VectorTileStyle_getVersion(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}
