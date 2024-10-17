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

/// The list of authentication modes.
///
/// This is used to determine how [_Request] should handle ArcGIS
/// authentication.
enum _ArcGISAuthenticationMode {
  /// ArcGIS authentication is allowed.
  ///
  /// Credentials are preemptively selected when a match for the request is
  /// available in the store. In cases where there is no matching credential or
  /// when the server responds with an ArcGIS authentication error, a challenge
  /// is issued.
  allowed,

  /// ArcGIS authentication is required even when anonymous access is possible.
  ///
  /// A challenge occurs and the request fails if a valid credential is not
  /// provided.
  required_,

  /// Prevents preemptive use of credentials in the store and any authentication
  /// challenges from occurring.
  forbidden,

  /// Credentials are not applied preemptively when available in the store. If
  /// the server responds with an ArcGIS authentication error, a credential in
  /// the store is used if available, otherwise a challenge is issued.
  conditionallyAllowed;

  factory _ArcGISAuthenticationMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return allowed;
      case 1:
        return required_;
      case 2:
        return forbidden;
      case 3:
        return conditionallyAllowed;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case allowed:
        return 0;
      case required_:
        return 1;
      case forbidden:
        return 2;
      case conditionallyAllowed:
        return 3;
    }
  }
}

/// A map is a container for layers. Use a map together with an
/// [ArcGISMapViewController] to display layers of geographic data in 2D.
///
/// [ArcGISMap] contains layers of mapping data and information such as
/// basemaps, popups, renderers, and labels which define the map's capabilities.
/// You can access [ArcGISMap] content directly or visualize the map in an
/// [ArcGISMapViewController].
///
/// In an MVC architecture, [ArcGISMap] represents the model and
/// [ArcGISMapViewController] represents the view. [ArcGISMap] specifies how the
/// geographic data is organized, and [ArcGISMapViewController] renders the data
/// on the screen and allows users to interact with it.
///
/// A map can contain a basemap and one or more operational layers:
///
/// * A basemap is a map layer that helps orient the user of the map. Typically
/// it sits behind operational layers and shows roads and parcel boundaries to
/// give context to operational layers. Basemaps can also contain layers which
/// are drawn over the top operational layers such as label layers.
/// * An operational layer provides content that is of unique interest to the
/// app and the task at hand, such as data about earthquakes, traffic, or
/// weather. Its content might change frequently.
///
/// You can create a map from an existing web map using its URL or [PortalItem].
/// Alternatively, you can get a map directly from a [MobileMapPackage.maps]
/// collection. [ArcGISMap] properties will be hydrated when the map is loaded.
///
/// If you create a new map, the spatial reference of the first layer you add,
/// which is typically the first layer in the [Basemap], defines the spatial
/// reference of the entire map,
///
/// See
/// [Maps 2D](https://developers.arcgis.com/documentation/mapping-apis-and-services/maps/maps-2d/)
/// for more information about maps.
final class ArcGISMap extends GeoModel with JsonSerializable {
  static ArcGISMap? _fromHandle(RT_MapHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeoModel._instanceCache.instanceWith(handle);
  }

  ArcGISMap._withHandle(super.handle)
      : _backgroundColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Map_getBackgroundColor(handle, errorHandler);
          });
          return colorHandle.toColor();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Map_setBackgroundColor(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _offlineSettings = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Map_getOfflineSettings(handle, errorHandler);
          });
          return OfflineSettings._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Map_getURI(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle();

  /// Creates a map with the specified spatial reference.
  ///
  /// Parameters:
  /// - `spatialReference` — A spatial reference object.
  factory ArcGISMap({SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_createWithSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final ArcGISMap object = GeoModel._instanceCache.instanceWith(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a map with a [Basemap].
  ///
  /// Parameters:
  /// - `basemap` — A basemap object.
  factory ArcGISMap.withBasemap(Basemap basemap) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_createWithBasemap(
          basemap._handle, errorHandler);
    });
    return GeoModel._instanceCache.instanceWith(handle);
  }

  /// Creates a map with a [BasemapStyle].
  ///
  /// Parameters:
  /// - `basemapStyle` — The basemap style.
  factory ArcGISMap.withBasemapStyle(BasemapStyle basemapStyle) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_createWithBasemapStyle(
          basemapStyle.coreValue, errorHandler);
    });
    return GeoModel._instanceCache.instanceWith(handle);
  }

  /// Creates a map with a portal item of type [PortalItemType.webMap].
  ///
  /// The [PortalItem] automatically loads when the [ArcGISMap] loads. If the
  /// loaded [Item] is not a portal item of type [PortalItemType.webMap], the
  /// map fails to load.
  ///
  /// Parameters:
  /// - `item` — A web map [PortalItem].
  factory ArcGISMap.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_createWithItem(item._handle, errorHandler);
    });
    return GeoModel._instanceCache.instanceWith(handle);
  }

  /// Creates a map with the URL to a web map.
  ///
  /// If the specified URL is a portal item URL, the underlying [PortalItem] is
  /// created and can be accessed through [GeoModel.item]. The URL can be a URL
  /// to web map JSON content or the URL of a portal item.
  ///
  /// Examples of supported URL formats:
  /// * The web map viewer page, for example:
  /// https://www.arcgis.com/apps/mapviewer/index.html?webmap=55ebf90799fa4a3fa57562700a68c405
  /// * The web map viewer page (classic), for example:
  /// https://www.arcgis.com/home/webmap/viewer.html?webmap=55ebf90799fa4a3fa57562700a68c405
  /// * The web map item details page, for example:
  /// https://www.arcgis.com/home/item.html?id=55ebf90799fa4a3fa57562700a68c405
  /// * The REST sharing API data page, for example:
  /// https://www.arcgis.com/sharing/rest/content/items/55ebf90799fa4a3fa57562700a68c405/data
  /// * The REST sharing API page (with or without the query parameter f=json),
  /// for example:
  /// https://www.arcgis.com/sharing/rest/content/items/55ebf90799fa4a3fa57562700a68c405?f=json
  ///
  /// Parameters:
  /// - `uri` — URL of a web map on ArcGIS Online or ArcGIS Enterprise portal.
  static ArcGISMap? withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_createWithURI(coreURI.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return GeoModel._instanceCache.instanceWith(handle);
  }

  /// The background color of the map.
  ///
  /// This value specifies the color to be displayed behind the map. This color
  /// will be displayed in transparent areas of the map and areas where there is
  /// no basemap or operational data.
  ///
  /// When a map is set on an [ArcGISMapViewController], changes to
  /// [ArcGISMap.backgroundColor] take immediate effect.
  ///
  /// The default value is null. In this case, the
  /// [ArcGISMapViewController.backgroundGrid] specifies the background color.
  Color? get backgroundColor => _backgroundColor.value;

  set backgroundColor(Color? value) => _backgroundColor.value = value;

  final Memoized<Color?> _backgroundColor;

  /// The extent that constrains the display to a specific region.
  ///
  /// The max extent is initialized when the map loads or when you set it
  /// explicitly. This value limits panning in the [ArcGISMapViewController] to
  /// a specific area of the map.
  ///
  /// If the max extent is null when the map loads, or you set it to null, max
  /// extent is calculated from the union of the full extent of all basemap
  /// layers. If there is no basemap, it is set as the full extent of the map's
  /// first operational layer.
  ///
  /// If the [GeoModel.initialViewpoint] is not set, the max extent is used as
  /// the initial viewpoint. If the [GeoModel.initialViewpoint] is set, but is
  /// outside of the max extent, the max extent takes precedence and the display
  /// will initially show the max extent.
  Envelope? get maxExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_getMaxExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  set maxExtent(Envelope? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Map_setMaxExtent(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The maximum scale for the map.
  ///
  /// A value of zero indicates that there is no maximum scale and the user can
  /// zoom in indefinitely. The default value is 0.0.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_getMaxScale(_handle, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Map_setMaxScale(_handle, value, errorHandler);
    });
  }

  /// The minimum scale for the map.
  ///
  /// A value of zero indicates that there is no minimum scale and the user can
  /// zoom out indefinitely. The default value is 0.0.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_getMinScale(_handle, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Map_setMinScale(_handle, value, errorHandler);
    });
  }

  /// Offline settings configured by the author of an online web map (if
  /// appropriate).
  ///
  /// Offline settings optimize the data that is delivered during download and
  /// synchronization. For example, they can control feature and attachment
  /// delivery or define whether the map's basemap is created using a tile
  /// package already on the device.
  ///
  /// This property is null unless the map represents an online web map and the
  /// author has configured the offline settings.
  OfflineSettings? get offlineSettings => _offlineSettings.value;

  final Memoized<OfflineSettings?> _offlineSettings;

  /// The reference scale for the map.
  ///
  /// The reference scale is the scale at which feature symbols and text will
  /// appear at their authored size. If the viewing scale is different from the
  /// reference scale, then the symbology and text graphics will be scaled to
  /// keep the same size on the map. Only those layers for which scaleSymbols is
  /// true will be scaled. For example, [FeatureLayer.scaleSymbols].
  ///
  /// The default value is 0.0. Zero reference scale means that no reference
  /// scale is set and all symbology and text graphics will be drawn at their
  /// default screen size.
  ///
  /// Updates to the reference scale will redraw other layers that use the
  /// reference scale, and may redraw other layers that depend on them. For
  /// example, dynamic labels may need to re-position to avoid overlaps.
  double get referenceScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_getReferenceScale(_handle, errorHandler);
    });
  }

  set referenceScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Map_setReferenceScale(_handle, value, errorHandler);
    });
  }

  /// The URI for the map.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Determine if a web map can be serialized from the map without losing any
  /// data.
  ///
  /// When serializing a web map it is possible to lose some of the data that
  /// comprises the map due to:
  /// * Unknown JSON data,
  /// * Because some of the layers reference local data (.tpk, .tpkx, .vtpk,
  /// MobileBasemapLayers), or
  /// * Because of layers supported by Runtime but not the web map (KML, Raster,
  /// etc), or
  /// * Because non-default WMS styles can't be persisted in the web map
  ///
  /// Return Value: true if all objects conform to the web map spec and do not
  /// reference local data; false otherwise
  bool _canSaveWithoutForce() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_canSaveWithoutForce(_handle, errorHandler);
    });
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Map_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ArcGISMap.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Map_fromJSON(jsonCString.bytes, errorHandler);
    });
    return ArcGISMap._fromHandle(objectHandle)!;
  }

  factory ArcGISMap.fromJson(Map<String, dynamic> json) {
    return ArcGISMap.fromJsonString(jsonEncode(json));
  }
}

/// A basemap is a non-editable layer that provides background, or reference
/// information, in your map or scene.
///
/// A basemap provides a background of geographical context for the content you
/// display in a map or scene. It provides a visual reference to help orient
/// users and a framework on which you can overlay operational layers, perform
/// analysis, and visualize geographic information. The content of a basemap is
/// typically static and does not change frequently.
///
/// A basemap is composed of a collection of base layers ([Basemap.baseLayers])
/// and reference layers ([Basemap.referenceLayers]). Base layers are displayed
/// at the bottom of a map or scene, and reference layers are displayed at the
/// top, with the [GeoModel.operationalLayers] between them.
///
/// Typically, you construct a basemap using a basemap style:
/// * Use image tile basemap styles for satellite imagery and hillshade.
/// * Use vector tile basemap styles such as streets navigation, light gray
/// canvas, and OpenStreetMap (OSM).
/// * Create custom basemap styles with your own colors, glyphs, and fonts using
/// the
/// [ArcGIS Vector Tile Style Editor](https://developers.arcgis.com/documentation/mapping-apis-and-services/tools/vector-tile-style-editor/).
///
/// See [BasemapStyle] for the full range of the basemap styles provided by
/// Esri. Basemap styles allow you to take advantage of geographically
/// load-balanced services and monitor usage with API keys or named users. See
/// [Basemap layers](https://developers.arcgis.com/documentation/mapping-apis-and-services/maps/basemap-layers/)
/// for more information.
///
/// If your app works offline, you can construct a local basemap from a tiled
/// layer using a [TileCache], such as a tile package (.tpk, .tpkx, .vtpk) or a
/// compact cache, stored on the device.
final class Basemap
    with JsonSerializable, Loadable
    implements ApiKeyResource, _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_BasemapHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Basemap_destroyInstance.cast());

  static Basemap? _fromHandle(RT_BasemapHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Basemap._instanceCache.instanceWith(handle);
  }

  Basemap._withHandle(RT_BasemapHandle handle)
      : _baseLayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Basemap_getBaseLayers(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Basemap_getItem(handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }),
        _referenceLayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Basemap_getReferenceLayers(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Basemap_getURI(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Basemap_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Basemap_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Basemap_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Basemap_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Basemap_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache =
      _InstanceCache(factory: _BasemapFactory(), kind: 'Basemap');

  /// Creates a basemap. Layers need to be added to the basemap before it can be
  /// used.
  factory Basemap() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_create(errorHandler);
    });
    return Basemap._instanceCache.instanceWith(handle);
  }

  /// Creates a basemap with a single base layer.
  ///
  /// Parameters:
  /// - `baseLayer` — A layer object.
  factory Basemap.withBaseLayer(Layer? baseLayer) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_createWithBaseLayer(
          baseLayer?._handle ?? ffi.nullptr, errorHandler);
    });
    return Basemap._instanceCache.instanceWith(handle);
  }

  /// Creates a basemap with a portal item of type [PortalItemType.webMap].
  ///
  /// The [PortalItem] automatically loads when the [Basemap] loads. If the
  /// loaded [Item] is not a portal item of type [PortalItemType.webMap], the
  /// basemap fails to load.
  ///
  /// Parameters:
  /// - `item` — A web map [PortalItem].
  factory Basemap.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_createWithItem(item._handle, errorHandler);
    });
    return Basemap._instanceCache.instanceWith(handle);
  }

  /// Creates a basemap with collections of base and reference layers.
  ///
  /// Parameters:
  /// - `baseLayers` — A collection of layers that serve as base layers.
  /// - `referenceLayers` — A collection of layers that serve as reference
  /// layers.
  factory Basemap.withLayers(
      {required List<Layer> baseLayers, required List<Layer> referenceLayers}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreBaseLayers =
        baseLayers.toMutableArray(valueType: _ElementType.layer);
    final coreReferenceLayers =
        referenceLayers.toMutableArray(valueType: _ElementType.layer);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_createWithLayers(
          coreBaseLayers._handle, coreReferenceLayers._handle, errorHandler);
    });
    final Basemap object = Basemap._instanceCache.instanceWith(handle);
    object._baseLayers.value.setCache(baseLayers);
    object._referenceLayers.value.setCache(referenceLayers);
    return object;
  }

  /// Creates a basemap from an initial [BasemapStyle] with additional
  /// parameters to control settings like language.
  ///
  /// These basemaps are secured and access requires either an API key or an
  /// authenticated user.
  ///
  /// The initial state of the [Basemap] is [LoadStatus.notLoaded]. When the
  /// [Basemap] is loaded the values specified in the [BasemapStyleParameters]
  /// are evaluated. See [BasemapStyleParameters] for information about the
  /// expected behavior for each parameter when the [Basemap] is loaded.
  ///
  /// Parameters:
  /// - `style` — The initial basemap style.
  /// - `parameters` — Parameters that control how the [BasemapStyle] is used -
  /// for example by adjusting the language used for basemap labels.
  factory Basemap.withStyle(BasemapStyle style,
      {BasemapStyleParameters? parameters}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_createWithStyleCombined(
          style.coreValue, parameters?._handle ?? ffi.nullptr, errorHandler);
    });
    return Basemap._instanceCache.instanceWith(handle);
  }

  /// Creates a basemap with the URI.
  ///
  /// If the specified URI is a portal item URL (see [PortalItem.withUri] for
  /// the supported URL formats), the underlying [PortalItem] will be created
  /// and accessible through [Basemap.item].
  ///
  /// Parameters:
  /// - `uri` — URI of the basemap, commonly the URL of a web map portal item.
  static Basemap? withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_createWithURI(coreURI.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return Basemap._instanceCache.instanceWith(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Basemap_setAPIKey(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The collection of base layers in this basemap.
  ///
  /// Base layers are drawn beneath all other layers in the [ArcGISMap] or
  /// `ArcGISScene`. They are designed to provide a visual reference to help
  /// orient the user. Aerial imagery, terrain, and streets are examples of
  /// basemap layers. The collection can be empty but it is never null.
  ///
  /// This collection is specific to this basemap so you cannot reuse a
  /// collection coming from another [Basemap].
  List<Layer> get baseLayers => _baseLayers.value;

  final Memoized<_MutableArrayList<Layer>> _baseLayers;

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_getInstanceId(_handle, errorHandler);
    });
  }

  /// The portal item associated with this basemap.
  Item? get item => _item.value;

  final Memoized<Item?> _item;

  /// The name of this basemap.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Basemap_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The collection of reference layers in this basemap.
  ///
  /// Reference layers are drawn on top all other layers in the [ArcGISMap] or
  /// `ArcGISScene` to display information such as boundaries, labels, and
  /// traffic networks. The collection can be empty but it is never null.
  ///
  /// This collection is specific to this basemap so you cannot reuse a
  /// collection coming from another [Basemap].
  List<Layer> get referenceLayers => _referenceLayers.value;

  final Memoized<_MutableArrayList<Layer>> _referenceLayers;

  /// The URI of this basemap.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Clones this instance of [Basemap] and its members.
  ///
  /// All objects referenced by the basemap, such as layers or portal item, are
  /// copied as well.
  ///
  /// Return Value: A new [Basemap] with the same values as the current
  /// [Basemap].
  Basemap clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_clone(_handle, errorHandler);
    });
    return Basemap._fromHandle(objectHandle)!;
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Basemap.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Basemap_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Basemap._fromHandle(objectHandle)!;
  }

  factory Basemap.fromJson(Map<String, dynamic> json) {
    return Basemap.fromJsonString(jsonEncode(json));
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Basemap_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Basemap_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Basemap_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Basemap_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _baseLayers.invalidateCache();
    _item.invalidateCache();
    _referenceLayers.invalidateCache();
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
        logger.f('Basemap unhandled asyncType $asyncType');
    }
  }
}

final class _BasemapFactory
    implements _InstanceFactory<Basemap, RT_BasemapHandle> {
  @override
  Basemap createInstance({required RT_BasemapHandle handle}) {
    return Basemap._withHandle(handle);
  }

  @override
  void destroyHandle(RT_BasemapHandle handle) {
    bindings.Basemap_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_BasemapHandle handle) {
    return runtimecore.RT_Basemap_getInstanceId(handle, ffi.nullptr);
  }
}

/// The list of basemap styles.
///
/// This is used to determine which basemap to use. These basemaps are secured
/// and require either an APIKey or named user to access them.
enum BasemapStyle {
  /// A composite basemap with satellite imagery of the world (raster) as the
  /// base layer and labels (vector) as the reference layer.
  arcGISImagery,

  /// A raster basemap with satellite imagery of the world as the base layer.
  arcGISImageryStandard,

  /// A vector basemap with labels for the world as the reference layer.
  /// Designed to be overlaid on [BasemapStyle.arcGISImageryStandard].
  arcGISImageryLabels,

  /// A vector basemap for the world featuring a light neutral background style
  /// with minimal colors as the base layer and labels as the reference layer.
  arcGISLightGray,

  /// A vector basemap for the world featuring a light neutral background style
  /// with minimal colors as the base layer.
  arcGISLightGrayBase,

  /// A vector basemap with labels for the world as the reference layer.
  /// Designed to be overlaid on light neutral backgrounds such as the
  /// [BasemapStyle.arcGISLightGrayBase] style.
  arcGISLightGrayLabels,

  /// A vector basemap for the world featuring a dark neutral background style
  /// with minimal colors as the base layer and labels as the reference layer.
  arcGISDarkGray,

  /// A vector basemap for the world featuring a dark neutral background style
  /// with minimal colors as the base layer.
  arcGISDarkGrayBase,

  /// A vector basemap with labels for the world as the reference layer.
  /// Designed to be overlaid on dark neutral backgrounds such as the
  /// [BasemapStyle.arcGISDarkGrayBase] style.
  arcGISDarkGrayLabels,

  /// A vector basemap for the world featuring a custom navigation map style.
  arcGISNavigation,

  /// A vector basemap for the world featuring a 'dark mode' version of the
  /// [BasemapStyle.arcGISNavigation] style, using the same content.
  arcGISNavigationNight,

  /// A vector basemap for the world featuring a classic Esri street map style.
  arcGISStreets,

  /// A vector basemap for the world featuring a custom 'night time' street map
  /// style.
  arcGISStreetsNight,

  /// A composite basemap with elevation hillshade (raster) and a classic Esri
  /// street map style (vector) as the base layers.
  arcGISStreetsRelief,

  /// A composite basemap with elevation hillshade (raster) and classic Esri
  /// topographic map style including a relief map (vector) as the base layers.
  arcGISTopographic,

  /// A composite basemap with ocean data of the world (raster) as the base
  /// layer and labels (vector) as the reference layer.
  arcGISOceans,

  /// A raster basemap with ocean data of the world as the base layer.
  arcGISOceansBase,

  /// A vector basemap with labels for the world as the reference layer.
  /// Designed to be overlaid on [BasemapStyle.arcGISOceansBase].
  arcGISOceansLabels,

  /// A composite basemap with elevation hillshade (raster), minimal map content
  /// like water and land fill, water lines and roads (vector) as the base
  /// layers and minimal map content like populated place names, admin and water
  /// labels with boundary lines (vector) as the reference layer.
  arcGISTerrain,

  /// A vector basemap with minimal map content like water and land fill, water
  /// lines and roads as the base layer.
  arcGISTerrainBase,

  /// A vector basemap with minimal map content like populated place names,
  /// admin and water labels with boundary lines as the reference layer.
  /// Designed to be overlaid on [BasemapStyle.arcGISTerrainBase] and hillshade.
  arcGISTerrainDetail,

  /// A vector basemap for the world in a style that is optimized to display
  /// special areas of interest (AOIs) that have been created and edited by
  /// Community Maps contributors.
  arcGISCommunity,

  /// A composite basemap with elevation hillshade (raster) and the world
  /// featuring a geopolitical style reminiscent of a school classroom wall map
  /// (vector) as the base layers.
  arcGISChartedTerritory,

  /// A vector basemap presented in the style of hand-drawn, colored pencil
  /// cartography.
  arcGISColoredPencil,

  /// A vector basemap for the world featuring a dark background with glowing
  /// blue symbology inspired by science-fiction and futuristic themes.
  arcGISNova,

  /// A composite basemap with elevation hillshade (raster) and the look of 18th
  /// and 19th century antique maps in the modern world of multi-scale mapping
  /// (vector) as the base layers.
  arcGISModernAntique,

  /// A vector basemap inspired by the art and advertising of the 1950's that
  /// presents a unique design option to the ArcGIS basemaps.
  arcGISMidcentury,

  /// A vector basemap in black & white design with halftone patterns, red
  /// highlights, and stylized fonts to depict a unique "newspaper" styled
  /// theme.
  arcGISNewspaper,

  /// A raster basemap with elevation hillshade. Designed to be used as a
  /// backdrop for topographic, soil, hydro, landcover or other outdoor
  /// recreational maps.
  arcGISHillshadeLight,

  /// A raster basemap with world hillshade (Dark) is useful in building maps
  /// that provide terrain context while highlighting feature layers and labels.
  arcGISHillshadeDark,

  /// A vector basemap in the classic Esri street map style, using a relief map
  /// as the base layer. This is a transparent basemap so it is recommended to
  /// use it along with a hillshade (raster) layer or adjust the
  /// [BackgroundGrid] of the [GeoViewController].
  arcGISStreetsReliefBase,

  /// A vector basemap in the classic Esri topographic map style, using a relief
  /// map as the base layer. This is a transparent basemap so it is recommended
  /// to use it along with a hillshade (raster) layer or adjust the
  /// [BackgroundGrid] of the [GeoViewController].
  arcGISTopographicBase,

  /// A vector basemap in a geopolitical style reminiscent of a school classroom
  /// wall map as the base layer. This is a transparent basemap so it is
  /// recommended to use it along with a hillshade (raster) layer or adjust the
  /// [BackgroundGrid] of the [GeoViewController].
  arcGISChartedTerritoryBase,

  /// A vector basemap in the style of 18th and 19th century antique maps in the
  /// modern world of multi-scale mapping as the base layer. This is a
  /// transparent basemap so it is recommended to use it along with a hillshade
  /// (raster) layer or adjust the [BackgroundGrid] of the [GeoViewController].
  arcGISModernAntiqueBase,

  /// A vector tile basemap for ArcGIS Human Geography, with labels.
  ///
  /// A vector tile layer basemap containing monochromatic land polygons. This
  /// map is designed for use with Human Geography Label and Detail layers. The
  /// default global place labels are in English.
  arcGISHumanGeography,

  /// A vector tile basemap for ArcGIS Human Geography.
  ///
  /// A vector tile layer basemap containing monochromatic land polygons. This
  /// map is designed for use with Human Geography Label and Detail layers.
  arcGISHumanGeographyBase,

  /// A detailed vector tile basemap for ArcGIS Human Geography.
  ///
  /// A vector tile layer providing a detailed basemap for the world, featuring
  /// a monochromatic style with content adjusted to support Human Geography
  /// information. This map is designed for use with Human Geography Label and
  /// Base layers. The default global place labels are in English.
  arcGISHumanGeographyDetail,

  /// A vector tile basemap for ArcGIS Human Geography labels.
  ///
  /// A vector tile layer providing a detailed basemap for the world, featuring
  /// a monochromatic style with content consisting of labels to support Human
  /// Geography information. This map is designed for use with Human Geography
  /// Detail and Base layers. The default global place labels are in English.
  arcGISHumanGeographyLabels,

  /// A vector tile basemap for dark ArcGIS Human Geography, with labels.
  ///
  /// A vector tile layer basemap containing dark monochromatic land polygons.
  /// This map is designed for use with Human Geography Dark Label and Detail
  /// layers. The default global place labels are in English.
  arcGISHumanGeographyDark,

  /// A vector tile basemap for dark ArcGIS Human Geography.
  ///
  /// A vector tile layer basemap containing dark monochromatic land polygons.
  /// This map is designed for use with Human Geography Dark Label and Detail
  /// layers. The default global place labels are in English.
  arcGISHumanGeographyDarkBase,

  /// A detailed vector tile basemap for dark ArcGIS Human Geography, with
  /// labels.
  ///
  /// A vector tile layer providing a detailed basemap for the world, featuring
  /// a dark monochromatic style with content adjusted to support Human
  /// Geography information. This map is designed for use with Human Geography
  /// Dark Label and Base layers. The default global place labels are in
  /// English.
  arcGISHumanGeographyDarkDetail,

  /// A vector tile basemap for dark ArcGIS Human Geography labels.
  ///
  /// A vector tile layer providing a detailed basemap for the world, featuring
  /// a dark monochromatic style with content adjusted to support Human
  /// Geography information. This map is designed for use with Human Geography
  /// Dark Detail and Base layers. The default global place labels are in
  /// English.
  arcGISHumanGeographyDarkLabels,

  /// A detailed vector tile basemap for the natural world.
  ///
  /// A vector tile layer providing a detailed basemap with an emphasis on the
  /// natural world. It includes rich cartographic styling with vector contours
  /// and vector hillshade. This is a multisource style. The default global
  /// place labels are in English.
  arcGISOutdoor,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using Open Street Map (OSM) cartography.
  osmStandard,

  /// A composite basemap that uses elevation as an artistic hillshade (raster)
  /// and Open Street Map (OSM) data hosted by Esri. It is rendered similarly to
  /// the Esri Street Map (with Relief) and uses a cartographic style (vector)
  /// as the base layer.
  osmStandardRelief,

  /// A vector basemap is a version of Open Street Map (OSM) data hosted by Esri
  /// and rendered using Esri Street Map cartographic style.
  osmStandardReliefBase,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using Esri Street Map style.
  osmStreets,

  /// A composite basemap with elevation as an artistic hillshade (raster) and
  /// Open Street Map (OSM) data hosted by Esri and rendered similarly to the
  /// Esri Street Map (with Relief) cartographic style (vector) as the base
  /// layers.
  osmStreetsRelief,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using light neutral style with minimal colors as the base layer
  /// and labels as the reference layer.
  osmLightGray,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using light neutral style with minimal colors as the base layer.
  osmLightGrayBase,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri.
  /// Contains only labels as the reference layer. Designed to be overlaid on
  /// light neutral styles with minimal colors such as
  /// [BasemapStyle.osmLightGrayBase].
  osmLightGrayLabels,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using dark neutral style with minimal colors as the base layer
  /// and labels as the reference layer.
  osmDarkGray,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri and
  /// rendered using dark neutral style with minimal colors as the base layer.
  osmDarkGrayBase,

  /// A vector basemap version of Open Street Map (OSM) data hosted by Esri.
  /// Contains only labels as the reference layer. Designed to be overlaid on
  /// dark neutral styles with minimal colors such as
  /// [BasemapStyle.osmDarkGrayBase].
  osmDarkGrayLabels,

  /// A vector basemap with Open Street Map (OSM) data hosted by Esri. It is
  /// rendered similarly to the Esri Street Map (with Relief) and uses a
  /// cartographic style as the base layer. This is a transparent basemap so it
  /// is recommended to use it along with a hillshade (raster) layer or adjust
  /// the [BackgroundGrid] of the [GeoViewController].
  osmStreetsReliefBase,

  /// An Open Street Map (OSM) vector basemap presented using a blueprint style.
  ///
  /// This vector basemap is based on the Daylight map distribution of OSM data
  /// and is hosted by Esri. The map is presented in a creative cartographic
  /// style emulating a blueprint technical drawing. The default place labels
  /// are shown in the local language for where the label appears. For example,
  /// labels for places in France are shown in French.
  osmBlueprint,

  /// An Open Street Map (OSM) basemap for the world.
  ///
  /// A basemap version of Open Street Map (OSM) data hosted by Esri. This layer
  /// presents low-resolution satellite imagery for the world and
  /// high-resolution satellite and aerial imagery, typically within 3-5 years
  /// of currency, for most of the world. The default place labels are shown in
  /// the local language for where the label appears. For example, labels for
  /// places in France are shown in French.
  osmHybrid,

  /// An Open Street Map (OSM) detailed vector basemap for the world.
  ///
  /// A basemap version of Open Street Map (OSM) data hosted by Esri. This
  /// vector tile layer provides a detailed reference layer for the world
  /// designed to be overlaid on imagery. The default place labels are shown in
  /// the local language for where the label appears. For example, labels for
  /// places in France are shown in French.
  osmHybridDetail,

  /// An Open Street Map (OSM) vector basemap presented using the Navigation
  /// style.
  ///
  /// This vector basemap is based on the Daylight map distribution of OSM data
  /// and is hosted by Esri. It presents the map in a cartographic style similar
  /// to the Esri Vector Basemap Navigation map. The default place labels are
  /// shown in the local language for where the label appears. For example,
  /// labels for places in France are shown in French.
  osmNavigation,

  /// An Open Street Map (OSM) vector basemap presented using the dark
  /// Navigation style.
  ///
  /// This vector basemap is based on the Daylight map distribution of OSM data
  /// and is hosted by Esri. It presents the map in a cartographic style similar
  /// to the Esri Vector Basemap Navigation Dark Mode map. The default place
  /// labels are shown in the local language for where the label appears. For
  /// example, labels for places in France are shown in French.
  osmNavigationDark;

  factory BasemapStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISImagery;
      case 1:
        return arcGISImageryStandard;
      case 2:
        return arcGISImageryLabels;
      case 3:
        return arcGISLightGray;
      case 4:
        return arcGISLightGrayBase;
      case 5:
        return arcGISLightGrayLabels;
      case 6:
        return arcGISDarkGray;
      case 7:
        return arcGISDarkGrayBase;
      case 8:
        return arcGISDarkGrayLabels;
      case 9:
        return arcGISNavigation;
      case 10:
        return arcGISNavigationNight;
      case 11:
        return arcGISStreets;
      case 12:
        return arcGISStreetsNight;
      case 13:
        return arcGISStreetsRelief;
      case 14:
        return arcGISTopographic;
      case 15:
        return arcGISOceans;
      case 16:
        return arcGISOceansBase;
      case 17:
        return arcGISOceansLabels;
      case 18:
        return arcGISTerrain;
      case 19:
        return arcGISTerrainBase;
      case 20:
        return arcGISTerrainDetail;
      case 21:
        return arcGISCommunity;
      case 22:
        return arcGISChartedTerritory;
      case 23:
        return arcGISColoredPencil;
      case 24:
        return arcGISNova;
      case 25:
        return arcGISModernAntique;
      case 26:
        return arcGISMidcentury;
      case 27:
        return arcGISNewspaper;
      case 28:
        return arcGISHillshadeLight;
      case 29:
        return arcGISHillshadeDark;
      case 30:
        return arcGISStreetsReliefBase;
      case 31:
        return arcGISTopographicBase;
      case 32:
        return arcGISChartedTerritoryBase;
      case 33:
        return arcGISModernAntiqueBase;
      case 34:
        return arcGISHumanGeography;
      case 35:
        return arcGISHumanGeographyBase;
      case 36:
        return arcGISHumanGeographyDetail;
      case 37:
        return arcGISHumanGeographyLabels;
      case 38:
        return arcGISHumanGeographyDark;
      case 39:
        return arcGISHumanGeographyDarkBase;
      case 40:
        return arcGISHumanGeographyDarkDetail;
      case 41:
        return arcGISHumanGeographyDarkLabels;
      case 42:
        return arcGISOutdoor;
      case 101:
        return osmStandard;
      case 102:
        return osmStandardRelief;
      case 103:
        return osmStandardReliefBase;
      case 104:
        return osmStreets;
      case 105:
        return osmStreetsRelief;
      case 106:
        return osmLightGray;
      case 107:
        return osmLightGrayBase;
      case 108:
        return osmLightGrayLabels;
      case 109:
        return osmDarkGray;
      case 110:
        return osmDarkGrayBase;
      case 111:
        return osmDarkGrayLabels;
      case 112:
        return osmStreetsReliefBase;
      case 113:
        return osmBlueprint;
      case 114:
        return osmHybrid;
      case 115:
        return osmHybridDetail;
      case 116:
        return osmNavigation;
      case 117:
        return osmNavigationDark;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISImagery:
        return 0;
      case arcGISImageryStandard:
        return 1;
      case arcGISImageryLabels:
        return 2;
      case arcGISLightGray:
        return 3;
      case arcGISLightGrayBase:
        return 4;
      case arcGISLightGrayLabels:
        return 5;
      case arcGISDarkGray:
        return 6;
      case arcGISDarkGrayBase:
        return 7;
      case arcGISDarkGrayLabels:
        return 8;
      case arcGISNavigation:
        return 9;
      case arcGISNavigationNight:
        return 10;
      case arcGISStreets:
        return 11;
      case arcGISStreetsNight:
        return 12;
      case arcGISStreetsRelief:
        return 13;
      case arcGISTopographic:
        return 14;
      case arcGISOceans:
        return 15;
      case arcGISOceansBase:
        return 16;
      case arcGISOceansLabels:
        return 17;
      case arcGISTerrain:
        return 18;
      case arcGISTerrainBase:
        return 19;
      case arcGISTerrainDetail:
        return 20;
      case arcGISCommunity:
        return 21;
      case arcGISChartedTerritory:
        return 22;
      case arcGISColoredPencil:
        return 23;
      case arcGISNova:
        return 24;
      case arcGISModernAntique:
        return 25;
      case arcGISMidcentury:
        return 26;
      case arcGISNewspaper:
        return 27;
      case arcGISHillshadeLight:
        return 28;
      case arcGISHillshadeDark:
        return 29;
      case arcGISStreetsReliefBase:
        return 30;
      case arcGISTopographicBase:
        return 31;
      case arcGISChartedTerritoryBase:
        return 32;
      case arcGISModernAntiqueBase:
        return 33;
      case arcGISHumanGeography:
        return 34;
      case arcGISHumanGeographyBase:
        return 35;
      case arcGISHumanGeographyDetail:
        return 36;
      case arcGISHumanGeographyLabels:
        return 37;
      case arcGISHumanGeographyDark:
        return 38;
      case arcGISHumanGeographyDarkBase:
        return 39;
      case arcGISHumanGeographyDarkDetail:
        return 40;
      case arcGISHumanGeographyDarkLabels:
        return 41;
      case arcGISOutdoor:
        return 42;
      case osmStandard:
        return 101;
      case osmStandardRelief:
        return 102;
      case osmStandardReliefBase:
        return 103;
      case osmStreets:
        return 104;
      case osmStreetsRelief:
        return 105;
      case osmLightGray:
        return 106;
      case osmLightGrayBase:
        return 107;
      case osmLightGrayLabels:
        return 108;
      case osmDarkGray:
        return 109;
      case osmDarkGrayBase:
        return 110;
      case osmDarkGrayLabels:
        return 111;
      case osmStreetsReliefBase:
        return 112;
      case osmBlueprint:
        return 113;
      case osmHybrid:
        return 114;
      case osmHybridDetail:
        return 115;
      case osmNavigation:
        return 116;
      case osmNavigationDark:
        return 117;
    }
  }
}

/// Options for setting the language on a [Basemap] created from a
/// [BasemapStyle].
enum BasemapStyleLanguageStrategy {
  /// Use the default language setting for the `BasemapStyle`.
  ///
  /// Currently, for ArcGIS styles, the default behavior is global labels for
  /// ArcGIS styles and local labels for OpenStreetMap styles.
  default_,

  /// Use the global language (English) for basemap labels.
  ///
  /// This is the default setting for ArcGIS basemap styles.
  global,

  /// Uses local place names for basemap labels.
  ///
  /// This option uses the names of places in their local language - for
  /// example, "Lisboa" for "Lisbon" and "北京" for "Beijing".
  ///
  /// This is the default setting for OpenStreetMap basemap styles.
  local,

  /// Attempt to use the system locale language for basemap labels.
  ///
  /// Refer to [BasemapStyleParameters.specificLanguage] for a description of
  /// the behavior if the system's locale is an unsupported language.
  applicationLocale;

  factory BasemapStyleLanguageStrategy._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return default_;
      case 1:
        return global;
      case 2:
        return local;
      case 3:
        return applicationLocale;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case default_:
        return 0;
      case global:
        return 1;
      case local:
        return 2;
      case applicationLocale:
        return 3;
    }
  }
}

/// Provides parameters for creating a [Basemap] from a [BasemapStyle].
///
/// [BasemapStyleParameters] allows you to set preferences, such as the language
/// to use for basemap labels, when creating a [Basemap] that suits your
/// application.
///
/// [BasemapStyleParameters] build upon a [BasemapStyle] to adjust settings for
/// how that style is displayed. For example, you can choose from a set of
/// options that determine the language for displaying labels on the basemap.
///
/// * Set the [BasemapStyleParameters.specificLanguage] to specify a desired
/// language for basemap labels.
/// * Set [BasemapStyleParameters.languageStrategy] to use local language, use
/// global language, or attempt to use the application locale.
///
/// Once you are finished configuring the options for your
/// [BasemapStyleParameters], they can be used with a [BasemapStyle] to create a
/// [Basemap]. When the [Basemap] is loaded, the parameters in the
/// [BasemapStyleParameters] are evaluated.
final class BasemapStyleParameters implements ffi.Finalizable {
  final RT_BasemapStyleParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.BasemapStyleParameters_destroy.cast());

  static BasemapStyleParameters? _fromHandle(
      RT_BasemapStyleParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return BasemapStyleParameters._withHandle(handle);
  }

  BasemapStyleParameters._withHandle(RT_BasemapStyleParametersHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.BasemapStyleParameters_created(_handle);
    }
  }

  /// Creates a [BasemapStyleParameters] that controls how a [BasemapStyle] is
  /// used when constructing a [Basemap].
  ///
  /// After creating a [BasemapStyleParameters] object, [BasemapStyle]
  /// preferences, such as language, can be set.
  ///
  /// A preference for using global, local, or the system locale language can be
  /// set using [BasemapStyleParameters.languageStrategy]. To define a
  /// preference for a specific language, set the
  /// [BasemapStyleParameters.specificLanguage] property to a supported language
  /// code.
  factory BasemapStyleParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BasemapStyleParameters_create(errorHandler);
    });
    return BasemapStyleParameters._withHandle(handle);
  }

  /// The option for setting the language for basemap labels.
  ///
  /// This property allows you to specify an option for the language to use for
  /// basemap labels. You can use global or local place names or attempt to use
  /// the system locale. If you want to use a specific language, set the
  /// [BasemapStyleParameters.specificLanguage] property. Note that the
  /// [BasemapStyleParameters.specificLanguage] property takes precedence over
  /// the [BasemapStyleParameters.languageStrategy]. If the
  /// [BasemapStyleParameters.specificLanguage] is a non-empty string, the
  /// [BasemapStyleParameters.languageStrategy] will be ignored.
  ///
  /// The default value is [BasemapStyleLanguageStrategy.default_]
  BasemapStyleLanguageStrategy get languageStrategy {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BasemapStyleParameters_getLanguageStrategy(
          _handle, errorHandler);
    });
    return BasemapStyleLanguageStrategy._fromCoreValue(coreValue);
  }

  set languageStrategy(BasemapStyleLanguageStrategy value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_BasemapStyleParameters_setLanguageStrategy(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The desired language for place labels on the [Basemap] or an empty string
  /// if no specific language is required.
  ///
  /// The [BasemapStyleParameters.specificLanguage] must be a
  /// [CLDR](https://cldr.unicode.org/) (Common Locale Data Repository) format
  /// string that uses a two letter language code (e.g. "en" for English)
  /// optionally followed by a two letter country code (e.g. "en-US" for US
  /// English).
  ///
  /// If the requested combination of language and country (e.g. "fr-CA") is not
  /// supported, the resulting Basemap will fall back to the next most suitable
  /// supported language (e.g. "fr").
  ///
  /// If no fallback is available, a default language strategy will be used.
  /// "global" for ArcGIS basemap styles or "local" for OSM basemap styles.
  ///
  /// The list of supported language codes is shown in the table below. To see
  /// the latest list of languages supported by the Basemap Styles Service, see
  /// the [Languages
  /// section](https://developers.arcgis.com/rest/basemap-styles/#languages) of
  /// the Basemap Styles Service documentation:
  ///
  /// <table>
  ///   <tr>
  ///     <th>Language (CLDR code)</th>
  ///     <th>Description</th>
  ///   </tr>
  ///   <tr>
  ///     <td>ar</td>
  ///     <td>Arabic</td>
  ///   </tr>
  ///   <tr>
  ///     <td>bs</td>
  ///     <td>Bosnian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>bg</td>
  ///     <td>Bulgarian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>ca</td>
  ///     <td>Catalan</td>
  ///   </tr>
  ///     <tr>
  ///     <td>zh-HK</td>
  ///     <td>Chinese (Hong Kong)</td>
  ///   </tr>
  ///     <tr>
  ///     <td>zh-CN</td>
  ///     <td>Chinese (Simplified)</td>
  ///   </tr>
  ///     <tr>
  ///     <td>zh-TW</td>
  ///     <td>Chinese (Taiwan)</td>
  ///   </tr>
  ///     <tr>
  ///     <td>hr</td>
  ///     <td>Croatian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>cs</td>
  ///     <td>Czech</td>
  ///   </tr>
  ///     <tr>
  ///     <td>da</td>
  ///     <td>Danish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>nl</td>
  ///     <td>Dutch</td>
  ///   </tr>
  ///     <tr>
  ///     <td>en</td>
  ///     <td>English</td>
  ///   </tr>
  ///     <tr>
  ///     <td>et</td>
  ///     <td>Estonian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>fi</td>
  ///     <td>Finnish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>fr</td>
  ///     <td>French</td>
  ///   </tr>
  ///     <tr>
  ///     <td>de</td>
  ///     <td>German</td>
  ///   </tr>
  ///     <tr>
  ///     <td>el</td>
  ///     <td>Greek</td>
  ///   </tr>
  ///     <tr>
  ///     <td>he</td>
  ///     <td>Hebrew</td>
  ///   </tr>
  ///     <tr>
  ///     <td>hu</td>
  ///     <td>Hungarian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>id</td>
  ///     <td>Indonesian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>it</td>
  ///     <td>Italian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>ja</td>
  ///     <td>Japanese</td>
  ///   </tr>
  ///     <tr>
  ///     <td>ko</td>
  ///     <td>Korean</td>
  ///   </tr>
  ///     <tr>
  ///     <td>lv</td>
  ///     <td>Latvian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>lt</td>
  ///     <td>Lithuanian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>nb</td>
  ///     <td>Norwegian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>pl</td>
  ///     <td>Polish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>pt-BR</td>
  ///     <td>Portuguese (Brazil)</td>
  ///   </tr>
  ///     <tr>
  ///     <td>pt-PT</td>
  ///     <td>Portuguese (Portugal)</td>
  ///   </tr>
  ///     <tr>
  ///     <td>ro</td>
  ///     <td>Romanian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>ru</td>
  ///     <td>Russian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>sr</td>
  ///     <td>Serbian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>sk</td>
  ///     <td>Slovak</td>
  ///   </tr>
  ///     <tr>
  ///     <td>sl</td>
  ///     <td>Slovenian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>es</td>
  ///     <td>Spanish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>sv</td>
  ///     <td>Swedish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>th</td>
  ///     <td>Thai</td>
  ///   </tr>
  ///     <tr>
  ///     <td>tr</td>
  ///     <td>Turkish</td>
  ///   </tr>
  ///     <tr>
  ///     <td>uk</td>
  ///     <td>Ukrainian</td>
  ///   </tr>
  ///     <tr>
  ///     <td>vi</td>
  ///     <td>Vietnamese</td>
  ///   </tr>
  /// </table>
  ///
  /// If a supported language code is supplied, the labels are displayed in the
  /// identified language. If an unsupported language code is used, the label
  /// language falls back to the closest available language. For example,
  /// American English (en-US) or Canadian French (fr-CA) are not currently
  /// supported. These are interpreted as English and French respectively. If no
  /// suitable fallback language code is found, labels use the default language
  /// for the style.
  ///
  /// The default value is an empty string.
  ///
  /// If set, this property takes precedence over the
  /// [BasemapStyleParameters.languageStrategy].
  String get specificLanguage {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BasemapStyleParameters_getSpecificLanguage(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set specificLanguage(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_BasemapStyleParameters_setSpecificLanguage(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// A geographic or time location for quick navigate.
final class Bookmark implements ffi.Finalizable {
  final RT_BookmarkHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Bookmark_destroy.cast());

  static Bookmark? _fromHandle(RT_BookmarkHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Bookmark._withHandle(handle);
  }

  Bookmark._withHandle(RT_BookmarkHandle handle)
      : _viewpoint = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Bookmark_getViewpoint(handle, errorHandler);
          });
          return Viewpoint._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Bookmark_setViewpoint(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Bookmark_created(_handle);
    }
  }

  /// Creates a bookmark object.
  ///
  /// Parameters:
  /// - `name` — The name.
  /// - `viewpoint` — The viewpoint.
  factory Bookmark({String name = '', Viewpoint? viewpoint}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Bookmark_createCombined(
          coreName.bytes, viewpoint?._handle ?? ffi.nullptr, errorHandler);
    });
    final Bookmark object = Bookmark._withHandle(handle);
    object._viewpoint.cache(viewpoint);
    return object;
  }

  /// The name of the bookmark.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Bookmark_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Bookmark_setName(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The viewpoint representing the bookmark.
  Viewpoint? get viewpoint => _viewpoint.value;

  set viewpoint(Viewpoint? value) => _viewpoint.value = value;

  final Memoized<Viewpoint?> _viewpoint;

  /// Clones the [Bookmark].
  ///
  /// Return Value: A new [Bookmark] with the same values as the current
  /// [Bookmark].
  Bookmark clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Bookmark_clone(_handle, errorHandler);
    });
    return Bookmark._fromHandle(objectHandle)!;
  }
}

/// Provides methods for client APIs to ask Runtime Core to send a request.
///
/// This class enables client APIs to utilize the ArcGIS authentication logic of
/// core for sending platform-specific requests. The correct way to use the
/// functions of this class is as follows:
///
/// 1. The request URL is used by core to create its request object, issuing an
/// ArcGIS authentication challenge, using its server context for storing the
/// credential in the ArcGIS credential store, and handling SSL required error.
/// 2. Client APIs must create a request context as a [_ClientReference] using
/// the platform-specific request object along with any other necessary types.
/// 3. When the core request is received by client APIs,
///   - Unpack the [_Request.requestContext] to retrieve the platform-specific
/// request object to send.
///   - Do not use the request URL to build the platform-specific request, as it
/// only supports GET requests.
///   - If core had handled the SSL required error, then the request URL would
/// be HTTPS, so update the unpacked request object's URL to HTTPS before
/// sending.
///   - If parameters has token parameter then sending token in header is not
/// supported and token must be applied to the unpacked request object.
abstract final class _ClientRequestSender {
  /// This method sends a file request initiated by the client API.
  ///
  /// File requests are made with [_ArcGISAuthenticationMode.allowed]. APIs do
  /// not need to pass down response data when handling the response for these
  /// requests, as this API reads the data from the filepath. The media type is
  /// still passed down.
  ///
  /// Parameters:
  /// - `requestUri` — The URL used to create the core request object.
  /// - `fileUri` — The path at which the file should be stored.
  /// - `requestContext` — A client reference object created using the
  /// platform-specific request object along with any other necessary types.
  ///
  /// Return Value: A task that returns a reference to the platform specific
  /// response object.
  static Future<_ClientReference> sendFileRequest(
      {required Uri requestUri,
      required Uri fileUri,
      required _ClientReference requestContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRequestUri = _CString(requestUri.toString());
    final coreFileUri = _CString(fileUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientRequestSender_sendFileRequestAsync(
          coreRequestUri.bytes,
          coreFileUri.bytes,
          requestContext._handle,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsClientReference()!);
  }

  /// Cancelable version of [sendFileRequest]. See that method for more
  /// information.
  static CancelableOperation<_ClientReference> sendFileRequestCancelable(
      {required Uri requestUri,
      required Uri fileUri,
      required _ClientReference requestContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRequestUri = _CString(requestUri.toString());
    final coreFileUri = _CString(fileUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientRequestSender_sendFileRequestAsync(
          coreRequestUri.bytes,
          coreFileUri.bytes,
          requestContext._handle,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsClientReference()!);
  }

  /// This method sends a request initiated by the client API.
  ///
  /// As long as they preserve it themselves to provide to the user upon
  /// successful completion, APIs do not need to pass down the entire response
  /// data when handling responses for these requests. For JSON and plain text
  /// responses, this API only parses the data if it is less than or equal to
  /// 250 bytes in size. For HTML responses, this API only parses the data if it
  /// is less-than-or-equal-to 1500 bytes in size.
  ///
  /// Parameters:
  /// - `requestUri` — The URL used to create the core request object.
  /// - `authenticationMode` — The authentication mode the request should use.
  /// - `requestContext` — A client reference object created using the
  /// platform-specific request object along with any other necessary types.
  ///
  /// Return Value: A task that returns response data and a reference to the
  /// platform specific response object.
  static Future<_ClientResponse> sendRequest(
      {required Uri requestUri,
      required _ArcGISAuthenticationMode authenticationMode,
      required _ClientReference requestContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRequestUri = _CString(requestUri.toString());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientRequestSender_sendRequestAsync(
          coreRequestUri.bytes,
          authenticationMode.coreValue,
          requestContext._handle,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsClientResponse()!);
  }

  /// Cancelable version of [sendRequest]. See that method for more information.
  static CancelableOperation<_ClientResponse> sendRequestCancelable(
      {required Uri requestUri,
      required _ArcGISAuthenticationMode authenticationMode,
      required _ClientReference requestContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRequestUri = _CString(requestUri.toString());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClientRequestSender_sendRequestAsync(
          coreRequestUri.bytes,
          authenticationMode.coreValue,
          requestContext._handle,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsClientResponse()!);
  }
}

/// A response for a request initiated by the client API to support ArcGIS
/// authentication.
final class _ClientResponse implements ffi.Finalizable {
  final RT_ClientResponseHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ClientResponse_destroy.cast());

  static _ClientResponse? _fromHandle(RT_ClientResponseHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ClientResponse._withHandle(handle);
  }

  _ClientResponse._withHandle(RT_ClientResponseHandle handle)
      : _data = Memoized(getter: () {
          final byteArrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClientResponse_getData(handle, errorHandler);
          });
          return _ByteArray._fromHandle(byteArrayHandle)!.toDartList();
        }),
        _response = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClientResponse_getResponse(
                handle, errorHandler);
          });
          return _ClientReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClientResponse_created(_handle);
    }
  }

  /// The data received for the request.
  Uint8List get data => _data.value;

  final Memoized<Uint8List> _data;

  /// The client reference to the platform specific response object.
  _ClientReference? get response => _response.value;

  final Memoized<_ClientReference?> _response;
}

/// Expiration details, that indicate whether a given package is out of date.
///
/// Expiration details can indicate that the package in question:
/// * Is still valid
/// * Has expired and should be used with caution (see
/// [ExpirationType.allowExpiredAccess])
/// * Has expired and can no longer be used (see
/// [ExpirationType.preventExpiredAccess])
final class Expiration implements ffi.Finalizable {
  final RT_ExpirationHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Expiration_destroy.cast());

  static Expiration? _fromHandle(RT_ExpirationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Expiration._withHandle(handle);
  }

  Expiration._withHandle(RT_ExpirationHandle handle)
      : _dateTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Expiration_getDateTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Expiration_created(_handle);
    }
  }

  /// The date and time when the package will expire.
  ///
  /// This property is in Unix time (milliseconds since Epoch) using UTC.
  DateTime? get dateTime => _dateTime.value;

  final Memoized<DateTime?> _dateTime;

  /// Indicates that the current package has expired.
  ///
  /// This property shows whether the given package was expired at the time it
  /// was loaded. Subsequent checks can be made by performing a comparison of
  /// the current time against [Expiration.dateTime].
  bool get isExpired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Expiration_getIsExpired(_handle, errorHandler);
    });
  }

  /// An accompanying message which provides contextual information when the
  /// package has expired.
  ///
  /// The message could indicate the reasons for expiration or where an
  /// up-to-date version of the data can be obtained from. The author of the
  /// package may have configured the message to contain raw text, hyperlinks or
  /// HTML.
  ///
  /// The message can be empty.
  String get message {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Expiration_getMessage(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The type of expiration for the given package.
  ///
  /// This property indicates what expiration entails for a given package. That
  /// is, when the package expires:
  /// * It is out-of-date but can still be used (see
  /// [ExpirationType.allowExpiredAccess])
  /// * It can no longer be used and will fail to load (see
  /// [ExpirationType.preventExpiredAccess])
  ExpirationType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Expiration_getType(_handle, errorHandler);
    });
    return ExpirationType._fromCoreValue(coreValue);
  }
}

/// Enumerates the possible types of expiration.
enum ExpirationType {
  /// The expiration is provided for warning purposes only. The package can
  /// still be used.
  allowExpiredAccess,

  /// The expiration is mandatory and the package can no longer be used - for
  /// example, it will fail to load.
  preventExpiredAccess;

  factory ExpirationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return allowExpiredAccess;
      case 1:
        return preventExpiredAccess;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case allowExpiredAccess:
        return 0;
      case preventExpiredAccess:
        return 1;
    }
  }
}

/// Represents a request to download a file directly to disk.
///
/// [_FileRequest] adds a number of properties and methods to [_Request] to
/// support performing a download of a file directly to disk.
///
/// The location to write the completed download is specified by the
/// [_FileRequest.fileUri] property. Clients respond to a file request in the
/// usual way via a notification from `Requestable.requestRequired`. A file
/// request has the [_Request.objectType] to [_RequestType.fileRequest].
///
/// Guidelines for implementation are:
/// * Avoid reading the file into memory as it can be very large, the file
/// should be streamed to disk. For example tile package (.tpk) files can be
/// gigabytes in size.
/// * Implementations can make use of platform-specific "background download"
/// service to download files while an app is suspended
/// * Alternatively, an implementation could use http requests and specifically
/// http range requests to stream a file down in chunks
/// * Consider implementing resiliency to network outages. Some background
/// download services provide this and retry a number of times before failing
/// the overall request.
/// * While the download is in progress any partial file must not use the
/// filename specified in [_FileRequest.fileUri] and prefer to use a temp
/// directory. See [_FileRequest.fileUri] for details.
/// * If progress of the download can be obtained use
/// [_FileRequest.setTotalBytesToReceive] and
/// [_FileRequest.setCurrentBytesReceived] to report it
/// * To support resuming a file download after app termination and restart, the
/// [_FileRequest.persistentRequestId] should be used to store content needed to
/// reconnect to the download. See [_FileRequest.persistentRequestId] for more
/// details.
/// * A file request may be paused. Respond to this by checking the
/// [_FileRequest.isPaused] property, changes are notified by the event
/// `FileRequest.isPausedChanged`. See [_FileRequest.isPaused] for more details.
/// * When the download has successfully completed, the file must be present at
/// the specified [_FileRequest.fileUri]. A call to
/// [_Request.handleResponseWithResponse] completes the request. Supply the data
/// parameter with a 0 size and null data pointer. The ArcGIS runtime will check
/// the file exists then proceed to use as part of its current operation.
/// * If a download fails, respond with an error in the same way as other types
/// of request with a call to [_Request.handleResponseWithResponse]. Pass the
/// parameter 'userDefinedError' with the platform specific error contained in a
/// [_ClientReference] instance.
/// * Many file requests can be issued in some scenarios. For example
/// downloading many delta files for scheduled updates workflow as part of
/// [OfflineMapSyncJob]. The client code or the platform OS can determine if
/// throttling the number of simultaneous file requests is required.
final class _FileRequest extends _Request {
  static _FileRequest? _fromHandle(RT_FileRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _FileRequest._withHandle(super.handle)
      : _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FileRequest_getFilePath(handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        super._withHandle();

  /// The file path of the request.
  ///
  /// This path is the file path where the request response should put the file
  /// when the download is successfully complete. While the download is in
  /// progress any partial file must not use the filename specified in
  /// [_FileRequest.fileUri]. This avoids incomplete and invalid files being
  /// left on the system. Consider using a file extension like '.temp' until the
  /// file download is complete. Prefer to download partial in-progress files to
  /// a temp directory using unique names to prevent clashing. When complete
  /// move the file to the destination [_FileRequest.fileUri]. This will ensure
  /// abandoned downloads can be cleaned up.
  Uri get fileUri => _fileUri.value;

  final Memoized<Uri> _fileUri;

  /// Indicates the file download should be paused.
  ///
  /// Changes to this property are notified by `FileRequest.isPausedChanged`.
  /// When this property changes from false to true the client API file download
  /// should be paused.
  ///
  /// Similarly, when changing from true to false the download can resume. An
  /// example implementation of this would be if http range requests are used to
  /// download chunks of a file, when the file request is paused then no more
  /// requests for chunks are issued until this property becomes false.
  ///
  /// If a chunk of a file is being downloaded when pause is called then
  /// continue to complete the chunk and write to the file before pausing for
  /// the next chunk.
  ///
  /// If pausing the request cannot be supported, for example there is no
  /// support for http range requests, then the pause can be ignored and the
  /// file continues to download to complete the request as normal.
  ///
  /// Alternatively, the request can be cancelled then restarted when resumed,
  /// this choice may depend on how much of the file has been downloaded if this
  /// is known.
  ///
  /// The main use of pausing file requests is from [Job]. A call to [Job.pause]
  /// will pause any in-progress [_FileRequest] instances. Resuming a paused
  /// file request is triggered by a call to [Job.start], when the job was
  /// previously paused.
  ///
  /// Completing a file request while paused simply completes the request as
  /// usual. In this case a paused [Job] will not proceed to the next step.
  bool get isPaused {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FileRequest_getIsPaused(_handle, errorHandler);
    });
  }

  /// A string that can set to any content and subsequently read to resume a
  /// previous download after serialization and deserialization.
  ///
  /// This property can be set and read at any time during the life of a
  /// [_FileRequest] and can contain a string with any required content to
  /// reconnect and resume an in-progress download.
  ///
  /// This property is not modified by the core code issuing the file request.
  ///
  /// When the owning instance of the file request, typically a [Job], is
  /// serialized then all in-progress file requests have their
  /// [_FileRequest.persistentRequestId] read and the value is stored along with
  /// the [Job]'s state.
  ///
  /// After deserialization the same content will be restored into the file
  /// request before it's issued through [_Request.handleResponseWithResponse].
  ///
  /// The client code can use this content to reconnect to a partially complete
  /// download. This may be a background download service or other locations and
  /// values on the system.
  ///
  /// The client code needs to robustly deserialize this value and handle any
  /// content changes across different versions of this API.
  ///
  /// This property helps support efficiently resuming a [Job] after an app
  /// termination and restart.
  String get persistentRequestId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FileRequest_getPersistentRequestId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set persistentRequestId(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FileRequest_setPersistentRequestId(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// This method can be called to report progress of a file download.
  ///
  /// Before calling this function, call [_FileRequest.setTotalBytesToReceive]
  /// to set in the total size of the file in bytes. As a file download
  /// progresses repeatedly call [_FileRequest.setCurrentBytesReceived] passing
  /// in the current size of the download until the file is complete and the
  /// current bytes is equal to the total bytes. These properties are used to
  /// calculate a progress percentage reported to other parts of this API, in
  /// particular to [Job.progress].
  ///
  /// Progress is calculated by dividing the current bytes by the total with the
  /// following exceptions:
  /// * If the total or current bytes is less than or equal to 0 the progress is
  /// considered to be 0
  /// * If the current bytes is greater than total bytes the progress is
  /// considered to be 100
  /// * If the current bytes is less than the previous value the progress is not
  /// updated
  ///
  /// Parameters:
  /// - `bytesSoFar` — The number of bytes acquired so far.
  void setCurrentBytesReceived({required int bytesSoFar}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FileRequest_setCurrentBytesReceived(
          _handle, bytesSoFar, errorHandler);
    });
  }

  /// Use this method to supply file download progress when file sizes are known
  /// in advance.
  ///
  /// Pass in the total number of bytes of the file being downloaded, then as
  /// the file is downloaded use [_FileRequest.setCurrentBytesReceived] as
  /// chunks of the file are downloaded. These properties are used to calculate
  /// a progress percentage reported to other parts of this API, in particular
  /// to [Job.progress].
  ///
  /// Progress is calculated by dividing the current bytes by the total with the
  /// following exceptions:
  /// * If the total or current bytes is less than or equal to 0 the progress is
  /// considered to be 0
  /// * If the current bytes is greater than total bytes the progress is
  /// considered to be 100
  /// * If the current bytes is less than the previous value the progress is not
  /// updated
  ///
  /// Parameters:
  /// - `totalBytes` — The total number of bytes that will ultimately be passed
  /// to this file request.
  void setTotalBytesToReceive({required int totalBytes}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FileRequest_setTotalBytesToReceive(
          _handle, totalBytes, errorHandler);
    });
  }
}

/// An abstract representation of geographic entities in a map, scene, map view
/// or scene view.
///
/// Each geographic entity can possess geometry, to describe the location and
/// shape of the entity, and a set of attributes to provide information about
/// the real-world entity it represents. For example, a feature in a feature
/// layer, a graphic in a graphics overlay, and a raster cell in a raster layer
/// are represented by the [Feature], [Graphic], and `RasterCell` classes. Each
/// class inherits from [GeoElement].
///
/// Operations that identify all of the layers in a map or scene, such as
/// [GeoViewController.identifyLayers], can return a collection of
/// [IdentifyLayerResult] objects. You can obtain the various types of
/// [GeoElement] objects using [IdentifyLayerResult.geoElements].
abstract interface class GeoElement {
  /// The attributes of the [GeoElement] as a collection of name/value pairs.
  Map<String, dynamic> get attributes;

  /// The geometry defines the shape and location of the [GeoElement].
  Geometry? get geometry;

  set geometry(Geometry? value);

  /// Calculates the callout location of the geo-element.
  ///
  /// Parameters:
  /// - `tapLocation` — The optional tap location. If a tap location is
  /// specified, the callout location will be the geometry nearest point of this
  /// tap location.
  /// - `arcGISMapView` — The optional map view. Without map view the leader
  /// offset of the marker symbols won't be taken into account.
  ///
  /// Return Value: An [ArcGISPoint].
  ArcGISPoint? _computeCalloutLocation(
      {required ArcGISPoint? tapLocation,
      required ArcGISMapViewController? arcGISMapView});
}

/// A base class for [ArcGISMap] and `ArcGISScene` that contains layers and
/// properties and can be displayed in a [GeoViewController].
///
/// This base class represents the model in a model-view-controller (MVC)
/// architecture, while the [GeoViewController] represents the view. To display
/// a map or scene to the user, pass [GeoModel] to its appropriate
/// [GeoViewController], as follows:
/// * Pass an [ArcGISMap] to an [ArcGISMapViewController].
/// * Pass an `ArcGISScene` to a `SceneView`.
///
/// [GeoModel] has many properties that are common to both maps and scenes. For
/// example:
/// * Each map or scene typically has a [GeoModel.basemap] to help orient the
/// users.
/// * The [GeoModel.operationalLayers] collection gives you access to the vector
/// data (points, line, polygons), raster data, and attribute information
/// provided by the [ArcGISMap] or `ArcGISScene`.
/// * The [GeoModel.spatialReference] determines how spatial data relates to
/// real-world space.
final class GeoModel
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_GeoModelHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeoModel_destroyInstance.cast());

  static GeoModel? _fromHandle(RT_GeoModelHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeoModel._instanceCache.instanceWith(handle);
  }

  static _GeoModelType _objectTypeOf(RT_GeoModelHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_getObjectType(handle, errorHandler);
    });
    return _GeoModelType._fromCoreValue(coreValue);
  }

  _GeoModelType get _objectType => GeoModel._objectTypeOf(_handle);

  GeoModel._withHandle(RT_GeoModelHandle handle)
      : _bookmarks = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getBookmarks(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _initialViewpoint = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getInitialViewpoint(
                handle, errorHandler);
          });
          return Viewpoint._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeoModel_setInitialViewpoint(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getItem(handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeoModel_setItem(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _loadSettings = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getLoadSettings(
                handle, errorHandler);
          });
          return LoadSettings._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeoModel_setLoadSettings(
                handle, value._handle, errorHandler);
          });
        }),
        _operationalLayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getOperationalLayers(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _tables = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getTables(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _transportationNetworks = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoModel_getTransportationNetworks(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeoModel_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _basemapChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setBasemapChangedCallback(
              _handle,
              bindings.addresses.asyncGeoModelBasemapChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setBasemapChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoModel_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<Basemap?> _basemapChangedStreamController;

  /// Callback invoked when the basemap changes.
  Stream<Basemap?> get onBasemapChanged =>
      _basemapChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _GeoModelFactory(), kind: 'GeoModel');

  /// The basemap for this map or scene.
  ///
  /// A basemap provides a background of geographical context for the content
  /// you display in a map or scene. It is an optional set of non-editable
  /// layers such as aerial imagery, roads, or landmarks, that help orient the
  /// user of the map or scene.
  ///
  /// A basemap is composed of a collection of base layers
  /// ([Basemap.baseLayers]) and reference layers ([Basemap.referenceLayers]).
  /// Base layers are displayed at the bottom of a map or scene, and reference
  /// layers are displayed at the top, with the [GeoModel.operationalLayers]
  /// between them.
  ///
  /// You can use ready-to-use basemaps, style your own basemaps with the
  /// [ArcGIS Vector Tile Style Editor](https://developers.arcgis.com/documentation/mapping-apis-and-services/tools/vector-tile-style-editor/),
  /// or create and publish your own with ArcGIS Pro.
  Basemap? get basemap {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_getBasemap(_handle, errorHandler);
    });
    return Basemap._fromHandle(objectHandle);
  }

  set basemap(Basemap? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoModel_setBasemap(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The collection of bookmarks defined for this map or scene.
  ///
  /// Bookmarks allow users to quickly navigate to a particular area of interest
  /// in a map or scene.
  List<Bookmark> get bookmarks => _bookmarks.value;

  final Memoized<_MutableArrayList<Bookmark>> _bookmarks;

  /// The initial viewpoint when the map or scene is first displayed.
  ///
  /// The initial viewpoint value is available when the map or scene is loaded.
  /// If you want to change the initial viewpoint, you can do this before you
  /// add the map or scene to a [GeoViewController]. At this point, the
  /// [GeoViewController]'s viewpoint is set to this initial viewpoint. Any
  /// subsequent changes to the [GeoModel.initialViewpoint] are ignored.
  ///
  /// If you want to change the viewpoint of a displayed map or scene, use
  /// methods such as:
  ///
  /// * [GeoViewController.setViewpoint] for instantly changing the visible area
  /// with no animation.
  /// * `SceneView.setViewpointCamera(Camera)` for instantly moving the
  /// perspective in 3D scenes.
  /// * [ArcGISMapViewController.setViewpointWithDurationAndCurve] for smooth
  /// animated viewpoint changes in 2D maps.
  Viewpoint? get initialViewpoint => _initialViewpoint.value;

  set initialViewpoint(Viewpoint? value) => _initialViewpoint.value = value;

  final Memoized<Viewpoint?> _initialViewpoint;

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_getInstanceId(_handle, errorHandler);
    });
  }

  /// The ArcGIS item associated with this map or scene.
  ///
  /// This can be a [PortalItem] (for web maps and web scenes loaded from a
  /// portal or saved to a portal), or a [LocalItem] (for maps in a map package
  /// or scenes in a scene package), or null if no [Item] is associated with
  /// this map or scene.
  Item? get item => _item.value;

  set item(Item? value) => _item.value = value;

  final Memoized<Item?> _item;

  /// The properties that control the default loading and rendering behavior of
  /// feature layers in this map or scene.
  ///
  /// For example, you can specify which tiling mode should be used when feature
  /// layers are added, or specify whether feature tables should use advanced
  /// symbology.
  LoadSettings get loadSettings => _loadSettings.value;

  set loadSettings(LoadSettings value) => _loadSettings.value = value;

  final Memoized<LoadSettings> _loadSettings;

  /// A collection of layers that can access geographic data from a file or a
  /// service.
  ///
  /// The operational layers collection is used to display geographic data
  /// layers on top of a basemap layer in an [ArcGISMap] or `ArcGISScene`. For
  /// example, you can display a fleet of vehicles being tracked on a map or
  /// display a point cloud layer of a tree canopy in a scene.
  ///
  /// This collection of layers is unique to the map or scene, it cannot be used
  /// by another [GeoModel]. You can add and remove layers from the map or scene
  /// by adding and removing them from this collection. Ensure that the map has
  /// finished loading, otherwise you will replace the map's original
  /// operational layers with the newly added layers.
  ///
  /// The first layer in the [GeoModel.operationalLayers] collection is drawn
  /// first (on the bottom) above the basemap layer. Each subsequent layer is
  /// drawn on top. Typically, imagery or tile layers are added to the
  /// collection first, and then polygon, line, and point layers last. When you
  /// pass the [GeoModel] to the [GeoViewController] it combines these layers to
  /// create the final display for the user.
  ///
  /// See
  /// [Data Layers](https://developers.arcgis.com/documentation/mapping-apis-and-services/maps/data-layers/)
  /// for more information about working with operational layers.
  List<Layer> get operationalLayers => _operationalLayers.value;

  final Memoized<_MutableArrayList<Layer>> _operationalLayers;

  /// The spatial reference for this map or scene.
  ///
  /// [SpatialReference] specifies how geometry coordinates relate to real-world
  /// space. It ensures that you can accurately view, query, and analyze the
  /// layers of a map or scene.
  ///
  /// The spatial reference value is null until the [ArcGISMap] or `ArcGISScene`
  /// is loaded. You can set this value explicitly using the [ArcGISMap.new] or
  /// `Scene.Scene(SceneViewTilingScheme)` constructors.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// A collection of feature tables in the map or scene. Unlike
  /// [GeoModel.operationalLayers], tables are not displayed by the
  /// [GeoViewController].
  ///
  /// The collection of feature tables is specific to the map or scene. You can
  /// add and remove tables by adding or removing them from the collection.
  ///
  /// By default, the tables are not loaded. You can load them explicitly
  /// ([FeatureTable.load]) or load them by calling methods such as
  /// [FeatureTable.queryFeatures].
  List<FeatureTable> get tables => _tables.value;

  final Memoized<_MutableArrayList<FeatureTable>> _tables;

  /// A collection of transportation network datasets defined for the map or
  /// scene.
  ///
  /// Map and scene authors can use ArcGIS Pro to create mobile map or scene
  /// packages that include transportation networks. If the map or scene is
  /// created from one of these packages, this collection will be populated with
  /// a read-only collection of [TransportationNetworkDataset] objects.
  ///
  /// A [TransportationNetworkDataset] from this collection can be used to
  /// construct one of the network analysis tasks (such as [RouteTask],
  /// [ServiceAreaTask], and [ClosestFacilityTask]).
  List<TransportationNetworkDataset> get transportationNetworks =>
      _transportationNetworks.value;

  final Memoized<_ArrayList<TransportationNetworkDataset>>
      _transportationNetworks;

  /// The version of the [ArcGISMap] or `ArcGISScene` when it is loaded. The
  /// version of a newly created [ArcGISMap] or `ArcGISScene` is empty.
  ///
  /// When you load an existing map or scene, the version value is the version
  /// that it was created at, according to the
  /// [[ESRI web map specification](https://developers.arcgis.com/web-map-specification/)
  /// or
  /// [ESRI web scene specification](https://developers.arcgis.com/web-scene-specification/),
  /// respectively.
  ///
  /// You can make changes to a map (associated with a [PortalItem]) and save it
  /// back to the web map it originated from. Alternatively, you can save a map
  /// as a new web map on a specified [Portal] with a given title and folder. In
  /// these cases, the version of the saved map will be the version of the
  /// [[ESRI web map specification](https://developers.arcgis.com/web-map-specification/)
  /// supported by this API. You cannot save changes to maps in mobile map
  /// packages.
  ///
  /// Saving changes to scenes is not currently supported.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_getVersion(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Clones this instance of [GeoModel] and its members.
  ///
  /// Return Value: A new [GeoModel] with the same values as the current
  /// [GeoModel].
  GeoModel clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_clone(_handle, errorHandler);
    });
    return GeoModel._fromHandle(objectHandle)!;
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoModel_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoModel_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoModel_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoModel_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _bookmarks.invalidateCache();
    _initialViewpoint.invalidateCache();
    _item.invalidateCache();
    _loadSettings.invalidateCache();
    _operationalLayers.invalidateCache();
    _spatialReference.invalidateCache();
    _tables.invalidateCache();
    _transportationNetworks.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeGeoModelBasemapChangedEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_BasemapHandle;
          return Basemap._fromHandle(objectHandle);
        }();
        _basemapChangedStreamController.add(event);
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
        logger.f('GeoModel unhandled asyncType $asyncType');
    }
  }
}

final class _GeoModelFactory
    implements _InstanceFactory<GeoModel, RT_GeoModelHandle> {
  @override
  GeoModel createInstance({required RT_GeoModelHandle handle}) {
    switch (GeoModel._objectTypeOf(handle)) {
      case _GeoModelType.arcGISMap:
        return ArcGISMap._withHandle(handle);
      default:
        logger.w('An object of unsupported type is being treated as GeoModel');
        return GeoModel._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_GeoModelHandle handle) {
    bindings.GeoModel_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_GeoModelHandle handle) {
    return runtimecore.RT_GeoModel_getInstanceId(handle, ffi.nullptr);
  }
}

/// The type of a [GeoModel].
enum _GeoModelType {
  /// The [GeoModel] is an [ArcGISMap].
  arcGISMap,

  /// The [GeoModel] is an `ArcGISScene`.
  arcGISScene;

  factory _GeoModelType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISMap;
      case 1:
        return arcGISScene;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISMap:
        return 0;
      case arcGISScene:
        return 1;
    }
  }
}

/// The list of available HTTP operations.
///
/// This is used to determine a request's HTTP operation.
enum HttpOperation {
  /// An HTTP GET operation.
  get,

  /// An HTTP POST operation.
  post,

  /// An HTTP Multipart POST operation.
  multipartPost,

  /// A raw HTTP POST operation. Call [_Request.body] to get the bytes to set as
  /// the body of the post, and [_Request.contentType] To set the content-type
  /// header.
  rawPost,

  /// Unknown HTTP operation type.
  unknown;

  factory HttpOperation._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return get;
      case 1:
        return post;
      case 2:
        return multipartPost;
      case 3:
        return rawPost;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case get:
        return 0;
      case post:
        return 1;
      case multipartPost:
        return 2;
      case rawPost:
        return 3;
      case unknown:
        return -1;
    }
  }
}

/// Represents a request for a dynamic image.
///
/// Information needs to be retrieved.
final class _ImageRequest extends _Request {
  static _ImageRequest? _fromHandle(RT_ImageRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _ImageRequest._withHandle(super.handle) : super._withHandle();
}

/// An object that represents an item.
final class Item implements _InstanceId, ffi.Finalizable {
  final RT_ItemHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Item_destroyInstance.cast());

  static Item? _fromHandle(RT_ItemHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Item._instanceCache.instanceWith(handle);
  }

  static _ItemType _objectTypeOf(RT_ItemHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getObjectType(handle, errorHandler);
    });
    return _ItemType._fromCoreValue(coreValue);
  }

  _ItemType get _objectType => Item._objectTypeOf(_handle);

  Item._withHandle(RT_ItemHandle handle)
      : _created = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Item_getCreated(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _modified = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Item_getModified(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _tags = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Item_getTags(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _thumbnail = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Item_getThumbnail(handle, errorHandler);
          });
          return LoadableImage._fromHandle(objectHandle);
        }),
        _typeKeywords = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Item_getTypeKeywords(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Item_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _ItemFactory(), kind: 'Item');

  /// The information on the source of the item and its copyright status.
  String get accessInformation {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getAccessInformation(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set accessInformation(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setAccessInformation(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The date the item was created.
  DateTime? get created => _created.value;

  final Memoized<DateTime?> _created;

  /// The description of the specified item.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The extent of the specified item.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  set extent(Envelope? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setExtent(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getInstanceId(_handle, errorHandler);
    });
  }

  /// The item ID of the specified item.
  ///
  /// Item ID can only be set on not loaded item.
  String get itemId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getItemId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  void _setItemId(String itemId) {
    final coreItemId = _CString(itemId);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setItemId(_handle, coreItemId.bytes, errorHandler);
    });
  }

  /// The date the item was last modified.
  DateTime? get modified => _modified.value;

  final Memoized<DateTime?> _modified;

  /// The name of this item.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  void _setName(String name) {
    final coreName = _CString(name);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setName(_handle, coreName.bytes, errorHandler);
    });
  }

  /// The short summary description of the specified item.
  ///
  /// A short summary description of the item.
  String get snippet {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getSnippet(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set snippet(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setSnippet(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The spatial reference name of the specified item.
  ///
  /// The coordinate system of the specified item.
  String get spatialReferenceName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getSpatialReferenceName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The user defined tags that describe the specified item.
  List<String> get tags => _tags.value;

  final Memoized<_MutableArrayList<String>> _tags;

  /// The terms of use of the item.
  ///
  /// It is stored in the "licenseInfo" property in json. The property can
  /// contain HTML markup.
  String get termsOfUse {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getTermsOfUse(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set termsOfUse(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setTermsOfUse(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The thumbnail of the item.
  LoadableImage? get thumbnail => _thumbnail.value;

  final Memoized<LoadableImage?> _thumbnail;

  /// The title of the specified item.
  ///
  /// This is the name that's displayed to users and by which they refer to the
  /// item. Every item must have a title.
  String get title {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_getTitle(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set title(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setTitle(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// An array of keywords that further describes the type of this item. Each
  /// item is tagged with a set of type keywords that are derived based on its
  /// primary type.
  ///
  /// The type keywords of the specified item.
  List<String> get typeKeywords => _typeKeywords.value;

  final Memoized<_MutableArrayList<String>> _typeKeywords;

  /// Fetches the item's data.
  ///
  /// Return Value: A [Future] that returns an [Uint8List].
  Future<Uint8List> fetchData() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_fetchData(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsUint8List()!);
  }

  /// Cancelable version of [fetchData]. See that method for more information.
  CancelableOperation<Uint8List> fetchDataCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_fetchData(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsUint8List()!);
  }

  /// Sets the thumbnail of the item with the specified image.
  ///
  /// Parameters:
  /// - `image` — The image (can be null).
  void setThumbnail({required ArcGISImage? image}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Item_setThumbnailWithImage(
          _handle, image?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Updates an item's properties in a file on disk when this item instance is
  /// a [LocalItem].
  ///
  /// This method resides in the [Item] base class to match the public API, but
  /// within the C API it's implemented only on [LocalItem] and [PortalItem]
  /// simply throws an exception. The client APIs provide their own
  /// implementations of this method for PortalItems.
  ///
  /// The following remarks apply when the item instance is a [LocalItem].
  ///
  /// Updating properties can be only done for local items that are unpacked.
  /// For example a mobile map package file (.mmpk) can be unpacked using
  /// [MobileMapPackage.unpack]. Once unpacked local items within the package
  /// can be updated see [MobileMapPackage.item] and for any maps use
  /// [GeoModel.item]. As well as packages, the local item available from an
  /// item resource cache can be updated. This is accessed with
  /// [ItemResourceCache.item]. If the package is not unpacked an error of
  /// [ArcGISExceptionType.commonInvalidCall] is returned as an error in the
  /// async task.
  ///
  /// Return Value: A [Future] that contains no return value.
  Future<void> updateItemProperties() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_updateItemPropertiesAsync(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [updateItemProperties]. See that method for more
  /// information.
  CancelableOperation<void> updateItemPropertiesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Item_updateItemPropertiesAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }
}

final class _ItemFactory implements _InstanceFactory<Item, RT_ItemHandle> {
  @override
  Item createInstance({required RT_ItemHandle handle}) {
    switch (Item._objectTypeOf(handle)) {
      case _ItemType.localItem:
        return LocalItem._withHandle(handle);
      case _ItemType.portalItem:
        return PortalItem._withHandle(handle);
      case _ItemType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  @override
  void destroyHandle(RT_ItemHandle handle) {
    bindings.Item_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_ItemHandle handle) {
    return runtimecore.RT_Item_getInstanceId(handle, ffi.nullptr);
  }
}

/// The different types of items.
enum _ItemType {
  /// An unknown item type.
  unknown,

  /// A portal item object.
  portalItem,

  /// A local item object.
  localItem;

  factory _ItemType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return portalItem;
      case 1:
        return localItem;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case portalItem:
        return 0;
      case localItem:
        return 1;
    }
  }
}

/// Represents a request for a Job.
///
/// Information needs to be retrieved.
final class _JobRequest extends _Request {
  static _JobRequest? _fromHandle(RT_JobRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _JobRequest._withHandle(super.handle) : super._withHandle();
}

/// Represents a request for JSON.
///
/// Information needs to be retrieved.
final class _JsonRequest extends _Request {
  static _JsonRequest? _fromHandle(RT_JSONRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _JsonRequest._withHandle(super.handle) : super._withHandle();
}

/// Represents a request for JSON data.
///
/// Information needs to be retrieved.
final class _LoadRequest extends _Request {
  static _LoadRequest? _fromHandle(RT_LoadRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _LoadRequest._withHandle(super.handle) : super._withHandle();
}

/// This class allows you to specify how the map/scene should treat feature
/// layers.
///
/// Represents load settings.
final class LoadSettings implements ffi.Finalizable {
  final RT_LoadSettingsHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LoadSettings_destroy.cast());

  static LoadSettings? _fromHandle(RT_LoadSettingsHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LoadSettings._withHandle(handle);
  }

  LoadSettings._withHandle(RT_LoadSettingsHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LoadSettings_created(_handle);
    }
  }

  /// Creates a new load settings object.
  factory LoadSettings() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadSettings_create(errorHandler);
    });
    return LoadSettings._withHandle(handle);
  }

  /// The request mode to use for requesting features. Default is
  /// [FeatureRequestMode.onInteractionCache].
  FeatureRequestMode get featureRequestMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadSettings_getFeatureRequestMode(
          _handle, errorHandler);
    });
    return FeatureRequestMode._fromCoreValue(coreValue);
  }

  set featureRequestMode(FeatureRequestMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setFeatureRequestMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The feature tiling mode in use. Sets the feature tiling mode of each
  /// feature layer that is loaded. Default is
  /// [FeatureTilingMode.enabledWhenSupported].
  ///
  /// Changes how feature tiling is handled by each feature layer. Individual
  /// feature layers can override these settings.
  FeatureTilingMode get featureTilingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadSettings_getFeatureTilingMode(
          _handle, errorHandler);
    });
    return FeatureTilingMode._fromCoreValue(coreValue);
  }

  set featureTilingMode(FeatureTilingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setFeatureTilingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The preferred rendering mode for point and multi-point based feature
  /// layers. The layer will attempt to render in the specified mode if this is
  /// supported. If for example DYNAMIC is not supported by a layer's rendering
  /// mode then it will fall back to rendering in STATIC mode.
  FeatureRenderingMode get preferredPointFeatureRenderingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadSettings_getPreferredPointFeatureRenderingMode(
          _handle, errorHandler);
    });
    return FeatureRenderingMode._fromCoreValue(coreValue);
  }

  set preferredPointFeatureRenderingMode(FeatureRenderingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setPreferredPointFeatureRenderingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The preferred rendering mode for polygon based feature layers. The layer
  /// will attempt to render in the specified mode if this is supported. If for
  /// example DYNAMIC is not supported by a layer's rendering mode then it will
  /// fall back to rendering in STATIC mode.
  FeatureRenderingMode get preferredPolygonFeatureRenderingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_LoadSettings_getPreferredPolygonFeatureRenderingMode(
              _handle, errorHandler);
    });
    return FeatureRenderingMode._fromCoreValue(coreValue);
  }

  set preferredPolygonFeatureRenderingMode(FeatureRenderingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setPreferredPolygonFeatureRenderingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The preferred rendering mode for polyline based feature layers. The layer
  /// will attempt to render in the specified mode if this is supported. If for
  /// example DYNAMIC is not supported by a layer's rendering mode then it will
  /// fall back to rendering in STATIC mode.
  FeatureRenderingMode get preferredPolylineFeatureRenderingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_LoadSettings_getPreferredPolylineFeatureRenderingMode(
              _handle, errorHandler);
    });
    return FeatureRenderingMode._fromCoreValue(coreValue);
  }

  set preferredPolylineFeatureRenderingMode(FeatureRenderingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setPreferredPolylineFeatureRenderingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Whether or not to use advanced symbology. Default is true.
  bool get useAdvancedSymbology {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadSettings_getUseAdvancedSymbology(
          _handle, errorHandler);
    });
  }

  set useAdvancedSymbology(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadSettings_setUseAdvancedSymbology(
          _handle, value, errorHandler);
    });
  }
}

/// An object that represents a local item.
final class LocalItem extends Item {
  static LocalItem? _fromHandle(RT_LocalItemHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Item._instanceCache.instanceWith(handle);
  }

  LocalItem._withHandle(super.handle)
      : _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocalItem_getPath(handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }, setter: (value) {
          final coreValue = value != null ? _CString(value.toFilePath()) : null;
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocalItem_setPath(
                handle, coreValue?.bytes ?? ffi.nullptr, errorHandler);
          });
        }),
        _portalUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocalItem_getPortalURL(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle();

  /// The local item path.
  ///
  /// This path can be empty when the item is contained within a
  /// [MobileMapPackage] or `MobileScenePackage`.
  Uri? get fileUri => _fileUri.value;

  void _setFileUri(Uri? fileUri) {
    _fileUri.value = fileUri;
  }

  final Memoized<Uri?> _fileUri;

  /// The original portal item ID.
  String get originalPortalItemId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocalItem_getOriginalPortalItemId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  void _setOriginalPortalItemId(String originalPortalItemId) {
    final coreOriginalPortalItemId = _CString(originalPortalItemId);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocalItem_setOriginalPortalItemId(
          _handle, coreOriginalPortalItemId.bytes, errorHandler);
    });
  }

  /// The URL of the portal from which this local item was downloaded.
  ///
  /// This property can be used in conjunction with the
  /// [LocalItem.originalPortalItemId] to find the URL of the portal from which
  /// this local item was downloaded. This can be useful when following offline
  /// map workflows as it allows you to find the URL of the online webmap.
  ///
  /// This property will be empty when the local item was not created from an
  /// online resource - for example if exported from ArcGIS Pro.
  Uri? get portalUri => _portalUri.value;

  final Memoized<Uri?> _portalUri;

  /// The local item type.
  LocalItemType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocalItem_getType(_handle, errorHandler);
    });
    return LocalItemType._fromCoreValue(coreValue);
  }

  void _setType(LocalItemType type) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocalItem_setType(_handle, type.coreValue, errorHandler);
    });
  }
}

/// An enumeration of various types of local items.
enum LocalItemType {
  /// An unknown local item type.
  unknown,

  /// A mobile map.
  mobileMap,

  /// A mobile scene.
  mobileScene,

  /// A mobile map package.
  mobileMapPackage,

  /// A mobile scene package.
  mobileScenePackage;

  factory LocalItemType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return mobileMap;
      case 1:
        return mobileScene;
      case 2:
        return mobileMapPackage;
      case 3:
        return mobileScenePackage;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case mobileMap:
        return 0;
      case mobileScene:
        return 1;
      case mobileMapPackage:
        return 2;
      case mobileScenePackage:
        return 3;
    }
  }
}

/// A mobile map package.
///
/// Mobile map packages allow you to work with maps on a mobile device. A mobile
/// map package contains all of the files necessary to work with your maps and
/// is stored on a device as either:
/// * A single archive file with an .mmpk extension
/// * A directory containing an unpacked mobile map package
///
/// You can create a mobile map package using either:
/// * ArcGIS Pro (from version 1.3). This API version supports any
/// [MobileMapPackage] up to major version 5. Mobile map packages created with
/// ArcGIS Pro are stored in a file with an .mmpk extension.
/// * Use the [OfflineMapTask.generateOfflineMap] method to generate and
/// download a mobile map package on-demand, or use the
/// [OfflineMapTask.downloadPreplannedOfflineMapWithParameters] to download a
/// mobile map package already prepared by the map author. Mobile map packages
/// created with the [OfflineMapTask] are stored in a directory containing an
/// unpacked mobile map package.
///
/// A mobile map package can encapsulate one or more maps along with their
/// layers and data. Each package contains an [Item] with metadata about the
/// package (description, thumbnail, etc.).
///
/// Mobile map packages created with ArcGIS Pro can also include transportation
/// networks, locators, and links to online services. You can choose whether to
/// use:
/// * A tile package (such as .tpkx or .vtpk) or an online basemap as the
/// [GeoModel.basemap]
/// * A mobile geodatabase (.geodatabase) or an online feature service as one of
/// the [GeoModel.operationalLayers]. Online services (such as traffic or
/// weather) can provide excellent contextual information for your users. If the
/// mobile map package is going to be used in areas of poor connectivity,
/// however, you must ensure that data critical to your workflow is stored
/// locally on the device.
///
/// Mobile map packages implement the [Loadable] interface; you need to load the
/// [MobileMapPackage] before you can access its content. Once loaded you can:
/// * Determine the version of this package using the [MobileMapPackage.version]
/// property. This API currently supports mobile map packages up to and
/// including major version 5. If the package is from an unsupported version, it
/// will fail to load.
/// * Discover whether the mobile map package has expired using the
/// [MobileMapPackage.expiration] property
/// * Access the individual maps and display them in an
/// [ArcGISMapViewController]
/// * Programmatically add, modify, and remove layers in the map. Mobile map
/// packages, however, are read-only and these changes to maps or layers are not
/// persisted.
final class MobileMapPackage
    with Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_MobileMapPackageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.MobileMapPackage_destroy.cast());

  static MobileMapPackage? _fromHandle(RT_MobileMapPackageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MobileMapPackage._withHandle(handle);
  }

  MobileMapPackage._withHandle(RT_MobileMapPackageHandle handle)
      : _expiration = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MobileMapPackage_getExpiration(
                handle, errorHandler);
          });
          return Expiration._fromHandle(objectHandle);
        }),
        _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MobileMapPackage_getItem(
                handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }),
        _locatorTask = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MobileMapPackage_getLocatorTask(
                handle, errorHandler);
          });
          return LocatorTask._fromHandle(objectHandle);
        }),
        _maps = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MobileMapPackage_getMaps(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MobileMapPackage_getPath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.MobileMapPackage_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MobileMapPackage_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MobileMapPackage_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MobileMapPackage_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MobileMapPackage_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Create a [MobileMapPackage] with a path.
  ///
  /// The path can refer to a file with an .mmpk extension or a directory
  /// containing an unpacked mobile map package.
  ///
  /// Parameters:
  /// - `fileUri` — A path to mobile map package.
  factory MobileMapPackage.withFileUri(Uri fileUri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MobileMapPackage_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    final MobileMapPackage object = MobileMapPackage._withHandle(handle);
    object._fileUri.cache(fileUri);
    return object;
  }

  /// Expiration details for this mobile map package, if provided.
  ///
  /// Expiration details provide:
  /// * The package’s expiration date and time
  /// * Whether the maps can be accessed after expiration
  /// * Any messages relevant for the user
  ///
  /// These expiration details can be specified when the author creates a mobile
  /// map package using ArcGIS Pro (from version 2.4). This requires the ArcGIS
  /// Pro Publisher Extension. Mobile map packages created with the
  /// [OfflineMapTask] do not support expiration.
  ///
  /// By publishing a package with expiration details, the author can control
  /// the experience an end-user has when they try to access information that is
  /// no longer valid. For example, for time limited data (such as major
  /// sporting events), the author can ensure that the data cannot be accessed
  /// after the expiry date.
  ///
  /// During package loading, this API will determine whether the mobile map
  /// package was authored with expiration. If so, then this property will be
  /// populated.
  ///
  /// If the package has expired and was authored as
  /// [ExpirationType.preventExpiredAccess], loading will fail and you will not
  /// be able to access the maps. The expiration details will be accessible for
  /// you to examine and/or communicate to the user.
  Expiration? get expiration => _expiration.value;

  final Memoized<Expiration?> _expiration;

  /// The path to the mobile map package.
  ///
  /// The path can refer to a file with an .mmpk extension or a directory
  /// containing an unpacked mobile map package.
  Uri get fileUri => _fileUri.value;

  final Memoized<Uri> _fileUri;

  /// The mobile map package's [Item] describing metadata about the package.
  ///
  /// The item includes the metadata about the mobile map package, such as:
  /// * Title
  /// * Snippet (summary)
  /// * Description
  /// * Tags
  /// * Thumbnail If the package was created with ArcGIS Pro, the metadata was
  /// provided by the package author. If the package was created using the
  /// [OfflineMapTask], the metadata was provided by the originating web map.
  ///
  /// A package's item will be an instance of a [LocalItem].
  ///
  /// Returns null if the package is not loaded.
  Item? get item => _item.value;

  final Memoized<Item?> _item;

  /// A [LocatorTask] from the mobile map package.
  ///
  /// Use this task to geocode and reverse-geocode addresses and places. There
  /// is only one [LocatorTask] in each mobile map package but it can be used by
  /// all maps.
  ///
  /// Returns null if there is no [LocatorTask] in the package or the package is
  /// not loaded.
  LocatorTask? get locatorTask => _locatorTask.value;

  final Memoized<LocatorTask?> _locatorTask;

  /// A collection of [ArcGISMap] from the [MobileMapPackage].
  ///
  /// To use the maps in a [MobileMapPackage], you first need to load the
  /// package. If the mobile map package was created with ArcGIS Pro, the maps
  /// are presented in the same order in which they were packaged. Mobile map
  /// packages created with the [OfflineMapTask] will only contain one map.
  ///
  /// If you display the map by setting the map to an [ArcGISMapViewController],
  /// the map will automatically load. If you only need to access the map's
  /// content or metadata, you will need to load it by calling [GeoModel.load].
  /// If the package is not loaded, an empty collection is returned.
  List<ArcGISMap> get maps => _maps.value;

  final Memoized<_ArrayList<ArcGISMap>> _maps;

  /// The mobile map package's version.
  ///
  /// The mobile map package version is set when the package is authored in
  /// ArcGIS Pro or when it is generated by the [OfflineMapTask].
  ///
  /// This property will be populated when you attempt to load the package. The
  /// version property will always be populated for you to examine, even if the
  /// package is an unsupported version.
  ///
  /// This API currently supports mobile map packages up to and including major
  /// version 5.
  ///
  /// You may wish to check the version property before trying to access
  /// specific functionality. For example:
  /// * Expiration details are only available from mobile map package version
  /// 3.1 onwards
  /// * Links to online services are only available from mobile map package
  /// version 4.0 onwards
  ///
  /// If the package fails to load, check that the version number has not
  /// exceeded the supported major version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MobileMapPackage_getVersion(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Closes a mobile map package.
  ///
  /// Closes a mobile map package and frees file locks on the underlying .mmpk
  /// file or directory.
  ///
  /// All references to mobile map package data (maps, layers, tables, networks,
  /// locators, etc.) should be released before closing the package. If active
  /// references to mobile map package data exist, this method will still close
  /// the package, but subsequent rendering and data access methods will fail.
  /// Results of accessing mobile map package data after
  /// [MobileMapPackage.close] are undefined.
  ///
  /// After closing a mobile map package, the underlying .mmpk file or directory
  /// can be moved or deleted.
  ///
  /// Closing a mobile map package is not necessary if the package has not been
  /// loaded.
  void close() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MobileMapPackage_close(_handle, errorHandler);
    });
  }

  /// Unpacks a mobile map package file (.mmpk) to an output directory.
  ///
  /// If the last level of the `mobileMapPackageFileUri` is not present, it will
  /// be created as part of the unpack task. The unpack task writes the full
  /// content of the mobile map package to the output directory. Care should be
  /// taken on devices with limited storage space, especially if the original
  /// package is very large. After unpacking, you can remove the original .mmpk
  /// file from the device.
  ///
  /// Note that unpacking will fail if the package is expired and was authored
  /// as [ExpirationType.preventExpiredAccess].
  ///
  /// Parameters:
  /// - `mobileMapPackageFileUri` — The path to a mobile map package file
  /// (.mmpk)
  /// - `outputDirectory` — The path to a directory to write the mobile map
  /// package contents. This path must be specified without a trailing slash.
  ///
  /// Return Value: [Future] with no return value.
  static Future<void> unpack(
      {required Uri mobileMapPackageFileUri, required Uri outputDirectory}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreMobileMapPackageFileUri =
        _CString(mobileMapPackageFileUri.toFilePath());
    final coreOutputDirectory = _CString(outputDirectory.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MobileMapPackage_unpackAsync(
          coreMobileMapPackageFileUri.bytes,
          coreOutputDirectory.bytes,
          errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [unpack]. See that method for more information.
  static CancelableOperation<void> unpackCancelable(
      {required Uri mobileMapPackageFileUri, required Uri outputDirectory}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreMobileMapPackageFileUri =
        _CString(mobileMapPackageFileUri.toFilePath());
    final coreOutputDirectory = _CString(outputDirectory.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MobileMapPackage_unpackAsync(
          coreMobileMapPackageFileUri.bytes,
          coreOutputDirectory.bytes,
          errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MobileMapPackage_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MobileMapPackage_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MobileMapPackage_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MobileMapPackage_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _expiration.invalidateCache();
    _item.invalidateCache();
    _locatorTask.invalidateCache();
    _maps.invalidateCache();
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
        logger.f('MobileMapPackage unhandled asyncType $asyncType');
    }
  }
}

/// Represents settings in an online web map which the author has configured for
/// offline use.
///
/// Offline settings can be configured by a web map author to provide default
/// values which are appropriate for taking a map offline. Applications which
/// take the map offline can choose to ignore these offline settings when
/// setting parameters for an [OfflineMapTask].
///
/// Note: the following methods will use the offline settings to set default
/// parameter values:
/// * [OfflineMapTask.createDefaultDownloadPreplannedOfflineMapParameters]
/// * [OfflineMapTask.createDefaultGenerateOfflineMapParameters]
/// * [OfflineMapTask.createDefaultGenerateOfflineMapParameters]
/// * [OfflineMapTask.createGenerateOfflineMapParameterOverrides]
final class OfflineSettings implements ffi.Finalizable {
  final RT_OfflineSettingsHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OfflineSettings_destroy.cast());

  static OfflineSettings? _fromHandle(RT_OfflineSettingsHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineSettings._withHandle(handle);
  }

  OfflineSettings._withHandle(RT_OfflineSettingsHandle handle)
      : _onlineLayers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineSettings_getOnlineLayers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _onlineTables = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineSettings_getOnlineTables(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineSettings_created(_handle);
    }
  }

  /// A setting configured by the web map author that provides guidance for how
  /// attachments should be synced when working offline.
  ///
  /// If this setting is [AttachmentSyncDirection.none], then attachments should
  /// never be uploaded or downloaded when performing a sync operation.
  ///
  /// If this setting is [AttachmentSyncDirection.upload], then attachments
  /// should be uploaded when performing sync.
  ///
  /// If this setting is [AttachmentSyncDirection.bidirectional], then
  /// attachments should be uploaded and downloaded when performing sync.
  ///
  /// This value can be used to set a default for
  /// [GenerateOfflineMapParameters.attachmentSyncDirection]. Alternatively,
  /// using [OfflineMapTask.createDefaultGenerateOfflineMapParameters] will
  /// pre-populate the parameters using this property.
  AttachmentSyncDirection get attachmentSyncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineSettings_getAttachmentSyncDirection(
          _handle, errorHandler);
    });
    return AttachmentSyncDirection._fromCoreValue(coreValue);
  }

  /// List of layers that the web map author determined will remain online when
  /// the map is taken offline.
  ///
  /// Layers may be selected to remain online because they do not support being
  /// taken offline or to provide live contextual information such as traffic or
  /// weather.
  List<Layer> get onlineLayers => _onlineLayers.value;

  final Memoized<_ArrayList<Layer>> _onlineLayers;

  /// List of non-spatial tables that the web map author determined will remain
  /// online when the map is taken offline.
  ///
  /// Tables may be selected to remain online because they do not support being
  /// taken offline or to provide live contextual information such as traffic or
  /// weather.
  List<ServiceFeatureTable> get onlineTables => _onlineTables.value;

  final Memoized<_ArrayList<ServiceFeatureTable>> _onlineTables;

  /// The name of a local basemap file which can be used instead of downloading
  /// a basemap when taking this map offline.
  ///
  /// Supported basemap formats are:
  /// * .tpk
  /// * .tpkx
  /// * .vtpk
  ///
  /// The webmap author sets this property to denote an appropriate basemap
  /// file. Client code is responsible for ensuring that the basemap has been
  /// correctly side-loaded to the device.
  ///
  /// This property can be used to inform settings for:
  /// * [DownloadPreplannedOfflineMapParameters.referenceBasemapFilename]
  /// * [GenerateOfflineMapParameters.referenceBasemapFilename]
  String get referenceBasemapFilename {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineSettings_getReferenceBasemapFilename(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// A setting configured by the web map author that indicates which feature
  /// layers should include attachments when taken offline.
  ///
  /// Based on the value of this setting, attachments should be included with:
  /// * None of the layers when the value is [ReturnLayerAttachmentOption.none]
  /// * All of the layers when the value is
  /// [ReturnLayerAttachmentOption.allLayers]
  /// * Read only layers when the value is
  /// [ReturnLayerAttachmentOption.readOnlyLayers]
  /// * Editable layers when the value is
  /// [ReturnLayerAttachmentOption.editableLayers]
  ///
  /// This value can be used to set a default for
  /// [GenerateOfflineMapParameters.returnLayerAttachmentOption]. Alternatively,
  /// using [OfflineMapTask.createDefaultGenerateOfflineMapParameters] will
  /// pre-populate the parameters using this property.
  ReturnLayerAttachmentOption get returnLayerAttachmentOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineSettings_getReturnLayerAttachmentOption(
          _handle, errorHandler);
    });
    return ReturnLayerAttachmentOption._fromCoreValue(coreValue);
  }

  /// A setting configured by the web map author that indicates whether or not
  /// feature layers taken offline should be schema only and contain no data.
  ///
  /// If TRUE, this setting means that feature layers should be taken offline
  /// with no existing data in them.
  ///
  /// If FALSE, this setting means that existing features should be included
  /// when taking data offline for an editing workflow.
  ///
  /// This value can be used to set a default for
  /// [GenerateOfflineMapParameters.returnSchemaOnlyForEditableLayers].
  ///
  /// Alternatively, using
  /// [OfflineMapTask.createDefaultGenerateOfflineMapParameters] will
  /// pre-populate the parameters using this property.
  bool get returnSchemaOnlyForEditableLayers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineSettings_getReturnSchemaOnlyForEditableLayers(
              _handle, errorHandler);
    });
  }
}

/// Represents a request from a raster object.
///
/// Information needs to be retrieved.
final class _RasterRequest extends _Request {
  static _RasterRequest? _fromHandle(RT_RasterRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _RasterRequest._withHandle(super.handle) : super._withHandle();

  /// The data length in a raster HTTP GET request. Negative value means to get
  /// the full length.
  int get length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RasterRequest_getLength(_handle, errorHandler);
    });
  }

  /// The data offset in a raster HTTP GET request.
  ///
  /// It specifies the optional offset value in HTTP GET request, if the length
  /// returned from [_RasterRequest.length] is a positive number, a range query
  /// needs to be specified in HTTP request: Range=range0-range1.
  int get offset {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RasterRequest_getOffset(_handle, errorHandler);
    });
  }
}

/// Information that is being requested.
///
/// Information needs to be retrieved.
final class _Request
    implements ApiKeyResource, _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_RequestHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Request_destroyInstance.cast());

  static _Request? _fromHandle(RT_RequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  static _RequestType _objectTypeOf(RT_RequestHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getObjectType(handle, errorHandler);
    });
    return _RequestType._fromCoreValue(coreValue);
  }

  _RequestType get _objectType => _Request._objectTypeOf(_handle);

  _Request._withHandle(RT_RequestHandle handle)
      : _attachments = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Request_getAttachments(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _body = Memoized(getter: () {
          final byteArrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Request_getBody(handle, errorHandler);
          });
          return _ByteArray._fromHandle(byteArrayHandle)!.toDartList();
        }),
        _credential = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Request_getCredential(handle, errorHandler);
          });
          return ArcGISCredential._fromHandle(objectHandle);
        }),
        _parameters = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Request_getParameters(handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _requestContext = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Request_getRequestContext(
                handle, errorHandler);
          });
          return _ClientReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Request_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _cancelRequestStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Request_setCancelRequestCallback(
              _handle,
              bindings.addresses.asyncRequestCancelRequestEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Request_setCancelRequestCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void> _cancelRequestStreamController;

  /// Sets the callback to be invoked when the request is canceled.
  Stream<void> get onCancelRequest => _cancelRequestStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _RequestFactory(), kind: 'Request');

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getAPIKey(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Request_setAPIKey(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// Attachments associated with the request object.
  List<_RequestAttachment> get attachments => _attachments.value;

  final Memoized<_ArrayList<_RequestAttachment>> _attachments;

  /// An enum that defines if ArcGIS authentication occurs and how. The default
  /// value is [_ArcGISAuthenticationMode.allowed].
  _ArcGISAuthenticationMode get authenticationMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getAuthenticationMode(
          _handle, errorHandler);
    });
    return _ArcGISAuthenticationMode._fromCoreValue(coreValue);
  }

  /// This is for requests of [HttpOperation.rawPost]. It returns the bytes that
  /// comprise the body of the post.
  Uint8List get body => _body.value;

  final Memoized<Uint8List> _body;

  /// True if this request has been canceled, false otherwise.
  bool get canceled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getCanceled(_handle, errorHandler);
    });
  }

  /// This is for requests of [HttpOperation.rawPost]. It returns the content
  /// type of the body.
  String get contentType {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getContentType(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The credential that should be used to authentication the request.
  ArcGISCredential? get credential => _credential.value;

  final Memoized<ArcGISCredential?> _credential;

  /// Etag associated with the request object.
  String get etag {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getEtag(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The headers of the request.
  Map<String, String> get headers {
    final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getHeaders(_handle, errorHandler);
    });
    return dictionaryHandle.toUnmodifiableMap();
  }

  /// The HTTP operation requested by the request.
  HttpOperation get httpOperation {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getHTTPOperation(_handle, errorHandler);
    });
    return HttpOperation._fromCoreValue(coreValue);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getInstanceId(_handle, errorHandler);
    });
  }

  /// Indicates whether or not core has already cached the response data for
  /// this Request.
  ///
  /// If core already has the response data cached, APIs can utilize the etag to
  /// determine if the response has changed since the last time it was
  /// requested. If it has not changed, they can use
  /// [_Request.handleCachedResponse] to avoid reading the response stream and
  /// allocating a byte array to pass down to core. If the response has changed,
  /// they should call [_Request.handleResponseWithResponse] with the new data
  /// and etag.
  bool get isDataAlreadyCached {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getIsDataAlreadyCached(
          _handle, errorHandler);
    });
  }

  /// The parameters of the request.
  Map<String, String> get parameters => _parameters.value;

  final Memoized<_UnmodifiableDictionaryMap<String, String>> _parameters;

  /// A client reference to the context for the platform specific request.
  _ClientReference? get requestContext => _requestContext.value;

  final Memoized<_ClientReference?> _requestContext;

  /// A unique identifier for the request.
  int get requestId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getRequestId(_handle, errorHandler);
    });
  }

  /// The URI of the request.
  Uri get uri {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Request_getURI(_handle, errorHandler);
    });
    return stringHandle.toUri()!;
  }

  /// Handles a response to a request for data which has already been cached at
  /// core and has not changed since the last response.
  void handleCachedResponse() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Request_handleCachedResponse(_handle, errorHandler);
    });
  }

  /// Handles a response to a request for data.
  ///
  /// Parameters:
  /// - `data` — The data.
  /// - `etag` — The Etag associated with the response object.
  /// - `mediaType` — A string that indicates the media type of a document,
  /// file, or assortment of bytes contained within the response. Only the media
  /// type should be passed. It can be an empty string if a response does not
  /// contain it.
  /// - `httpStatusCode` — The HTTP status code to accompany the request's
  /// response.
  /// - `platformApiError` — The error received by the platform API.
  /// - `response` — A client reference to the platform specific response
  /// object.
  void handleResponseWithResponse(
      {required Uint8List? data,
      required String etag,
      required String mediaType,
      required int httpStatusCode,
      required _ClientReference? platformApiError,
      required _ClientReference? response}) {
    final coreData = data?.toByteArrayWrapper() ?? _ByteArrayWrapper.empty();
    final coreEtag = _CString(etag);
    final coreMediaType = _CString(mediaType);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Request_handleResponseWithResponse(
          _handle,
          coreData.ref,
          coreEtag.bytes,
          coreMediaType.bytes,
          httpStatusCode,
          platformApiError?._handle ?? ffi.nullptr,
          response?._handle ?? ffi.nullptr,
          errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeRequestCancelRequestEvent:
        _cancelRequestStreamController.add(null);
      default:
        logger.f('_Request unhandled asyncType $asyncType');
    }
  }
}

final class _RequestFactory
    implements _InstanceFactory<_Request, RT_RequestHandle> {
  @override
  _Request createInstance({required RT_RequestHandle handle}) {
    switch (_Request._objectTypeOf(handle)) {
      case _RequestType.fileRequest:
        return _FileRequest._withHandle(handle);
      case _RequestType.imageRequest:
        return _ImageRequest._withHandle(handle);
      case _RequestType.jobRequest:
        return _JobRequest._withHandle(handle);
      case _RequestType.jsonRequest:
        return _JsonRequest._withHandle(handle);
      case _RequestType.loadRequest:
        return _LoadRequest._withHandle(handle);
      case _RequestType.rasterRequest:
        return _RasterRequest._withHandle(handle);
      case _RequestType.request:
        return _Request._withHandle(handle);
      case _RequestType.serviceRequest:
        return _ServiceRequest._withHandle(handle);
      case _RequestType.tileRequest:
        return _TileRequest._withHandle(handle);
      case _RequestType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w('An object of unsupported type is being treated as _Request');
        return _Request._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_RequestHandle handle) {
    bindings.Request_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_RequestHandle handle) {
    return runtimecore.RT_Request_getInstanceId(handle, ffi.nullptr);
  }
}

/// A file attachment that might be included with a [_Request].
final class _RequestAttachment implements ffi.Finalizable {
  final RT_RequestAttachmentHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RequestAttachment_destroy.cast());

  static _RequestAttachment? _fromHandle(RT_RequestAttachmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _RequestAttachment._withHandle(handle);
  }

  _RequestAttachment._withHandle(RT_RequestAttachmentHandle handle)
      : _data = Memoized(getter: () {
          final byteArrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RequestAttachment_getData(
                handle, errorHandler);
          });
          return _ByteArray._fromHandle(byteArrayHandle)?.toDartList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RequestAttachment_created(_handle);
    }
  }

  /// The content type (mime type) of the attachment.
  String get contentType {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RequestAttachment_getContentType(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The data of the attachment. A null if the attachment contains no bytes and
  /// represents an empty file.
  Uint8List? get data => _data.value;

  final Memoized<Uint8List?> _data;

  /// The file name of the attachment.
  String get fileName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RequestAttachment_getFileName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The HTTP parameter name of the attachment.
  String get parameterName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RequestAttachment_getParameterName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns the data of the attachment encoded using base64 encoding.
  ///
  /// Return Value: A [String] containing base64 encoding.
  String getEncodedData() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RequestAttachment_getEncodedData(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// The list of Request types.
///
/// This is used to determine the Request type.
enum _RequestType {
  /// A load request.
  loadRequest,

  /// A tile request.
  tileRequest,

  /// An image request.
  imageRequest,

  /// A request from a job request.
  jobRequest,

  /// A request where the result is returned as a file on disk, rather than as
  /// an in-memory array of bytes.
  fileRequest,

  /// A request from a scene request.
  arcGISSceneRequest,

  /// A service request raised by route task or locator task.
  serviceRequest,

  /// A request from raster data source.
  rasterRequest,

  /// A JSON request.
  jsonRequest,

  /// A simple request with no specialized parameters.
  request,

  /// Unknown Request type.
  unknown;

  factory _RequestType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return loadRequest;
      case 1:
        return tileRequest;
      case 2:
        return imageRequest;
      case 3:
        return jobRequest;
      case 4:
        return fileRequest;
      case 5:
        return arcGISSceneRequest;
      case 6:
        return serviceRequest;
      case 7:
        return rasterRequest;
      case 9:
        return jsonRequest;
      case 10:
        return request;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case loadRequest:
        return 0;
      case tileRequest:
        return 1;
      case imageRequest:
        return 2;
      case jobRequest:
        return 3;
      case fileRequest:
        return 4;
      case arcGISSceneRequest:
        return 5;
      case serviceRequest:
        return 6;
      case rasterRequest:
        return 7;
      case jsonRequest:
        return 9;
      case request:
        return 10;
      case unknown:
        return -1;
    }
  }
}

/// Represents a service raised by route task or locator task.
final class _ServiceRequest extends _Request {
  static _ServiceRequest? _fromHandle(RT_ServiceRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _ServiceRequest._withHandle(super.handle) : super._withHandle();
}

/// Represents a request for a tile.
///
/// Information needs to be retrieved.
final class _TileRequest extends _Request {
  static _TileRequest? _fromHandle(RT_TileRequestHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Request._instanceCache.instanceWith(handle);
  }

  _TileRequest._withHandle(super.handle)
      : _tileKey = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TileRequest_getTileKey(handle, errorHandler);
          });
          return TileKey._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// A flag indicating if the requested tile should return a no data tile.
  ///
  /// APIs should get the etag of the server response, store this etag as
  /// 'NoDataTile' etag and call [_TileRequest.handleResponseNoDataTile]. Then
  /// for each further tile request returning a tile with this etag,
  /// [_TileRequest.handleResponseNoDataTile] should be called instead of
  /// [_Request.handleResponseWithResponse].
  bool get isNoDataTile {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileRequest_getIsNoDataTile(_handle, errorHandler);
    });
  }

  /// The key of the requested tile (includes level, column and row).
  TileKey get tileKey => _tileKey.value;

  final Memoized<TileKey> _tileKey;

  /// Handles a no data tile response to a tile request.
  ///
  /// APIs should manage the no data tile etag header at their side. Each time
  /// the server returns a tile with this etag, they should call
  /// [_TileRequest.handleResponseNoDataTile] instead of
  /// [_Request.handleResponseWithResponse].
  void handleResponseNoDataTile() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TileRequest_handleResponseNoDataTile(
          _handle, errorHandler);
    });
  }
}

/// Represents a span of time between a start time and end time.
///
/// To create a time extent which represents an instant in time set the start
/// time and end time to the same time value. The [TimeExtent] is returned in
/// the meta-data for time-aware services and layers. It is often used to create
/// a time slider ranging from a start time to an end time.
final class TimeExtent implements ffi.Finalizable {
  final RT_TimeExtentHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimeExtent_destroy.cast());

  static TimeExtent? _fromHandle(RT_TimeExtentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimeExtent._withHandle(handle);
  }

  TimeExtent._withHandle(RT_TimeExtentHandle handle)
      : _endTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimeExtent_getEndTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _startTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TimeExtent_getStartTime(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimeExtent_created(_handle);
    }
  }

  /// Creates a time extent with the given start and end times.
  ///
  /// Parameters:
  /// - `startTime` — The start time.
  /// - `endTime` — The end time.
  factory TimeExtent(
      {required DateTime? startTime, required DateTime? endTime}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreStartTime = startTime?.toArcGIS();
    final coreEndTime = endTime?.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeExtent_createWithStartAndEndTime(
          coreStartTime?._handle ?? ffi.nullptr,
          coreEndTime?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final TimeExtent object = TimeExtent._withHandle(handle);
    object._startTime.cache(startTime);
    object._endTime.cache(endTime);
    return object;
  }

  /// Creates a time extent with a time instant.
  ///
  /// Parameters:
  /// - `timeInstant` — The time instant is both the start and end time of the
  /// extent.
  factory TimeExtent.withTimeInstant(DateTime? timeInstant) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTimeInstant = timeInstant?.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeExtent_createWithTimeInstant(
          coreTimeInstant?._handle ?? ffi.nullptr, errorHandler);
    });
    return TimeExtent._withHandle(handle);
  }

  /// The end time of this time extent.
  DateTime? get endTime => _endTime.value;

  final Memoized<DateTime?> _endTime;

  /// The start time of this time extent.
  DateTime? get startTime => _startTime.value;

  final Memoized<DateTime?> _startTime;
}

/// Defines a time offset or interval for any time related classes.
final class TimeValue implements ffi.Finalizable {
  final RT_TimeValueHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimeValue_destroy.cast());

  static TimeValue? _fromHandle(RT_TimeValueHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimeValue._withHandle(handle);
  }

  TimeValue._withHandle(RT_TimeValueHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimeValue_created(_handle);
    }
  }

  /// Creates a new time value object.
  ///
  /// Parameters:
  /// - `duration` — The duration of the time offset/interval.
  /// - `unit` — The unit of the time offset/interval.
  factory TimeValue({required double duration, required TimeUnit unit}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeValue_createWithDurationUnit(
          duration, unit.coreValue, errorHandler);
    });
    return TimeValue._withHandle(handle);
  }

  /// The length of the time value in the [TimeValue]'s unit.
  double get duration {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeValue_getDuration(_handle, errorHandler);
    });
  }

  /// The unit of the time value.
  TimeUnit get unit {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeValue_getUnit(_handle, errorHandler);
    });
    return TimeUnit._fromCoreValue(coreValue);
  }
}

/// Utilities for parsing information from URL objects.
abstract final class _UrlUtils {
  /// Converts the URL's scheme to HTTPS.
  ///
  /// Parameters:
  /// - `uri` — The URL to convert.
  ///
  /// Return Value: The URL with a scheme of HTTPS.
  static Uri convertToHttps({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_convertToHTTPS(
          coreURI.bytes, errorHandler);
    });
    return stringHandle.toUri()!;
  }

  /// Gets the path by which the root of a server is accessed.
  ///
  /// This is the base URL against which rest endpoints are resolved. For
  /// example,
  /// "https://sampleserver3.arcgisonline.com/ArcGIS/rest/services/SanFrancisco/311Incidents/FeatureServer/0"
  /// would have a server context of
  /// "https://sampleserver3.arcgisonline.com/ArcGIS", on which we could add
  /// "/rest/info" or "/rest" to fetch the server information.
  ///
  /// Parameters:
  /// - `uri` — The URL from which to get the server context.
  ///
  /// Return Value: The server's root access URL.
  static Uri getServerContext({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_getServerContext(
          coreURI.bytes, errorHandler);
    });
    return stringHandle.toUri()!;
  }

  /// Gets the server info rest endpoint of the given URL.
  ///
  /// For example,
  /// "https://sampleserver3.arcgisonline.com/ArcGIS/rest/services/SanFrancisco/311Incidents/FeatureServer/0"
  /// would have a server info URL of
  /// "https://sampleserver3.arcgisonline.com/ArcGIS/rest/info".
  ///
  /// Parameters:
  /// - `uri` — The URL from which to get the server info URL.
  ///
  /// Return Value: The server info rest endpoint URL.
  static Uri getServerInfoUrl({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_getServerInfoURL(
          coreURI.bytes, errorHandler);
    });
    return stringHandle.toUri()!;
  }

  /// Checks if the given URL is using the HTTP scheme.
  ///
  /// Parameters:
  /// - `uri` — The URL to check.
  ///
  /// Return Value: True if the URL is using the HTTP scheme, otherwise false.
  static bool isHttp({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_isHTTP(coreURI.bytes, errorHandler);
    });
  }

  /// Checks if the given URL is using the HTTPS scheme.
  ///
  /// Parameters:
  /// - `uri` — The URL to check.
  ///
  /// Return Value: True if the URL is using the HTTPS scheme, otherwise false.
  static bool isHttps({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_isHTTPS(coreURI.bytes, errorHandler);
    });
  }

  /// Normalizes the URL by lowercasing it, removing query parameters, and
  /// converting the scheme to https.
  ///
  /// Parameters:
  /// - `uri` — The URL to normalize.
  ///
  /// Return Value: The normalized URL.
  static Uri normalize({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_URLUtils_normalize(coreURI.bytes, errorHandler);
    });
    return stringHandle.toUri()!;
  }
}

/// Defines the visible area of a [GeoModel] that is displayed in a
/// [GeoViewController] on a user's screen.
///
/// In an [ArcGISMapViewController], the bounding extent of a geometry or the
/// map's center point and scale can define the map view's two-dimensional
/// [Viewpoint].
///
/// In a `SceneView`, a `Camera` represents the observer's position and
/// perspective within three dimensions and defines the scene view's
/// three-dimensional [Viewpoint]. Each camera has the following properties:
///
/// * Geographic location on the surface (longitude and latitude).
/// * Altitude (height, in meters, above sea level).
/// * Heading (angle about the z axis the camera is rotated, in degrees)
/// * Pitch (angle the camera is rotated up or down, in degrees)
/// * Roll (angle the camera is rotated side-to-side, in degrees)
///
/// When you publish or save a map or scene, as a web map, web scene, mobile map
/// package, or mobile scene package, you define its initial [Viewpoint]. When
/// you load a map or scene into your app, you can access and change the value
/// of this [GeoModel.initialViewpoint]. If you add the map or scene to a
/// [GeoViewController], any change you make to the [GeoModel.initialViewpoint]
/// is ignored. To change the [Viewpoint] of a displayed map or scene, use view
/// methods such as:
///
/// * [GeoViewController.setViewpoint] to instantly change the visible area with
/// no animation.
/// * [ArcGISMapViewController.setViewpointWithDurationAndCurve] to animates the
/// display of the map to a viewpoint using the provided animation curve.
/// * `SceneView.setViewpointCamera(Camera)` to instantly moving the perspective
/// in 3D scenes.
///
/// To determine the current visible area, call
/// [GeoViewController.getCurrentViewpoint]. Make sure that any user-initiated
/// or programmatic navigation is complete before getting the current
/// [Viewpoint] by calling [GeoViewController.isNavigating].
final class Viewpoint with JsonSerializable implements ffi.Finalizable {
  final RT_ViewpointHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Viewpoint_destroy.cast());

  static Viewpoint? _fromHandle(RT_ViewpointHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Viewpoint._withHandle(handle);
  }

  Viewpoint._withHandle(RT_ViewpointHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Viewpoint_created(_handle);
    }
  }

  /// Creates a viewpoint with center point, scale, and rotation.
  ///
  /// Parameters:
  /// - `center` — The center of the visible area.
  /// - `scale` — The ratio between a distance on the map and the corresponding
  /// distance on the ground.
  /// - `rotation` — The rotation angle in degrees between 0 and 360.
  factory Viewpoint.fromCenter(ArcGISPoint center,
      {required double scale, double rotation = double.nan}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_createWithCenterPointScaleRotation(
          center._handle, scale, rotation, errorHandler);
    });
    return Viewpoint._withHandle(handle);
  }

  /// Creates a viewpoint with a bounding extent and rotation.
  ///
  /// Parameters:
  /// - `targetExtent` — The geometry to use as the visible area.
  /// - `rotation` — The rotation angle in degrees between 0 and 360.
  factory Viewpoint.fromTargetExtent(Geometry targetExtent,
      {double rotation = double.nan}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_createWithExtentRotation(
          targetExtent._handle, rotation, errorHandler);
    });
    return Viewpoint._withHandle(handle);
  }

  /// Creates a viewpoint with latitude, longitude, and scale.
  ///
  /// The spatial reference for the defined point is WGS84.
  ///
  /// Parameters:
  /// - `latitude` — The latitude coordinate for the viewpoint. Negative values
  /// are south of the equator.
  /// - `longitude` — The longitude coordinate for the viewpoint. Negative
  /// values are west of the prime meridian.
  /// - `scale` — The ratio between a distance on the map and the corresponding
  /// distance on the ground.
  factory Viewpoint.withLatLongScale(
      {required double latitude,
      required double longitude,
      required double scale}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_createWithLatLongScale(
          latitude, longitude, scale, errorHandler);
    });
    return Viewpoint._withHandle(handle);
  }

  /// The viewpoint rotation angle in degrees between 0 and 360.
  double get rotation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_getRotation(_handle, errorHandler);
    });
  }

  /// The viewpoint target geometry, if the [Viewpoint.viewpointType] is
  /// [ViewpointType.boundingGeometry].
  Geometry get targetGeometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_getTargetGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// The viewpoint's target scale, if the [Viewpoint.viewpointType] is
  /// [ViewpointType.centerAndScale].
  double get targetScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_getTargetScale(_handle, errorHandler);
    });
  }

  /// The viewpoint's type.
  ///
  /// This will be defined by a geometry or an [ArcGISPoint] geometry and scale.
  ViewpointType get viewpointType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_getViewpointType(_handle, errorHandler);
    });
    return ViewpointType._fromCoreValue(coreValue);
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Viewpoint.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Viewpoint_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Viewpoint._fromHandle(objectHandle)!;
  }

  factory Viewpoint.fromJson(Map<String, dynamic> json) {
    return Viewpoint.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Viewpoint) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Viewpoint_getHash(_handle, errorHandler);
    });
  }
}

/// Different types of [Viewpoint].
enum ViewpointType {
  /// A center point and scale.
  centerAndScale,

  /// A visible area.
  boundingGeometry;

  factory ViewpointType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return centerAndScale;
      case 1:
        return boundingGeometry;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case centerAndScale:
        return 0;
      case boundingGeometry:
        return 1;
    }
  }
}
