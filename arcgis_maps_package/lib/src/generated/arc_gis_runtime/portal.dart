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

/// An object that represents a loadable image.
///
/// A loadable image implements the loadable pattern ([Loadable]) and allows
/// getting the underlying image (through [LoadableImage.image]) once the image
/// is loaded. For [LocalItem] thumbnail, the image is read from JSON and is
/// automatically loaded. For [PortalItem] thumbnail, the loadable image is
/// initialized with the thumbnail URI and needs to be loaded before calling
/// [LoadableImage.image].
final class LoadableImage
    with Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_LoadableImageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LoadableImage_destroy.cast());

  static LoadableImage? _fromHandle(RT_LoadableImageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LoadableImage._withHandle(handle);
  }

  LoadableImage._withHandle(RT_LoadableImageHandle handle)
      : _image = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LoadableImage_getImage(handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LoadableImage_getURI(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LoadableImage_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LoadableImage_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LoadableImage_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LoadableImage_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LoadableImage_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a loadable image from an image.
  ///
  /// Parameters:
  /// - `image` — The image.
  factory LoadableImage._withImage({required ArcGISImage image}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadableImage_createWithImage(
          image._handle, errorHandler);
    });
    return LoadableImage._withHandle(handle);
  }

  /// Creates a loadable image from a URI.
  ///
  /// Parameters:
  /// - `uri` — The URI to the loadable image.
  factory LoadableImage._withUri({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadableImage_createWithURI(
          coreURI.bytes, errorHandler);
    });
    return LoadableImage._withHandle(handle);
  }

  /// The image.
  ///
  /// Image is null while the loadable image is not loaded.
  ArcGISImage? get image => _image.value;

  final Memoized<ArcGISImage?> _image;

  /// The URI.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Method to load the image bytes.
  Future<Uint8List> loadBytes() async {
    await load();
    // If loading is successful, the image will not be null
    // If loading fails, an exception will be thrown
    return image!.getEncodedBuffer();
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LoadableImage_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadableImage_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadableImage_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LoadableImage_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _image.invalidateCache();
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
        logger.f('LoadableImage unhandled asyncType $asyncType');
    }
  }
}

/// The entry point into the ArcGIS portal services hosted by ArcGIS Online and
/// ArcGIS Enterprise.
///
/// ArcGIS portals are geospatial content management systems from ESRI that
/// customers can use to securely store, manage, and access different types of
/// content. There are two types of portals:
///
/// * ArcGIS Online portal - a service hosted by Esri that you can access with
/// an ArcGIS Developer account or ArcGIS Online account.
/// * ArcGIS Enterprise portal - a service hosted by ArcGIS Enterprise that you
/// can access with an ArcGIS Enterprise account.
///
/// The [Portal] class is the main entry point into the
/// [ArcGIS Portal Directory REST API](https://developers.arcgis.com/rest/users-groups-and-items/working-with-users-groups-and-items.htm)
/// that allows you to work with users, groups and content hosted within ArcGIS
/// Online or ArcGIS Enterprise portals. Once instantiated, you can use the
/// [Portal] to search for items and groups and see portal content, such as
/// services, layers, and so on.
///
/// For more information about authenticating your app or its users with a
/// portal, see the
/// [Introduction to security and authentication](https://developers.arcgis.com/documentation/mapping-apis-and-services/security/).
final class Portal
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_PortalHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Portal_destroyInstance.cast());

  static Portal? _fromHandle(RT_PortalHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Portal._instanceCache.instanceWith(handle);
  }

  Portal._withHandle(RT_PortalHandle handle)
      : _portalInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Portal_getPortalInfo(handle, errorHandler);
          });
          return PortalInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Portal_getURL(handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Portal_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _portalInfoRequestStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setPortalInfoRequestCallback(_handle,
              bindings.addresses.asyncPortalInfoEvent, userData, errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setPortalInfoRequestCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Portal_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void> _portalInfoRequestStreamController;

  /// Sets the callback to invoke when the Portal needs the Portal Info JSON.
  ///
  /// This callback must call [Portal._setPortalInfoOrError] to ensure the task
  /// returned by [Portal.fetchLicenseInfo] completes.
  Stream<void> get _onPortalInfoRequest =>
      _portalInfoRequestStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _PortalFactory(), kind: 'Portal');

  final _portalHelper = _PortalHelper();

  /// Creates a portal using the portal URL with anonymous access.
  ///
  /// The supported URL formats are:
  /// * The URL of the portal (Example: https://www.arcgis.com)
  /// * The URL of the portal REST endpoint (Example:
  /// https://www.arcgis.com/sharing/rest)
  /// * The URL of the deprecated portal REST endpoint (Example:
  /// https://www.arcgis.com/sharing)
  ///
  /// Parameters:
  /// - `uri` — The URL to the portal.
  factory Portal._withUri({required Uri uri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Portal_createWithURL(coreURI.bytes, errorHandler);
    });
    final Portal object = Portal._instanceCache.instanceWith(handle);
    object._uri.cache(uri);
    return object;
  }

  /// Creates a portal object.
  ///
  /// The supported URL formats are:
  /// * The URL of the portal (Example: https://www.arcgis.com)
  /// * The URL of the portal REST endpoint (Example:
  /// https://www.arcgis.com/sharing/rest)
  /// * The URL of the deprecated portal REST endpoint (Example:
  /// https://www.arcgis.com/sharing)
  ///
  /// If the portal permits anonymous access and you want to connect anonymously, set `connection`
  /// to [PortalConnection.anonymous]. If you want to connect to the portal using an identity, you should set
  /// `connection` to [PortalConnection.authenticated] and an authentication challenge will be issued to first
  /// request a credential.
  ///
  /// Parameters:
  /// - `uri` - The URL to the portal.
  /// - `connection` - The connection type used while loading the portal.
  factory Portal(Uri uri,
      {PortalConnection connection = PortalConnection.anonymous}) {
    final portal = Portal._withUri(uri: uri);
    portal._portalHelper.init(portal, connection);
    return portal;
  }

  /// Creates a portal instance pointing to https://www.arcgis.com.
  ///
  /// The portal should be loaded using [Portal.load()] before using it.
  /// ArcGIS Online permits anonymous access. If you want to connect to the portal anonymously,
  /// you should set `connection` to [PortalConnection.anonymous]. If you want to connect to the portal using an
  /// identity, you should set `connection` to [PortalConnection.authenticated] and an authentication challenge
  /// will be issued to first request a credential.
  /// Parameters:
  /// - `connection` - The connection type used while loading the portal.
  factory Portal.arcGISOnline(
      {PortalConnection connection = PortalConnection.anonymous}) {
    return Portal(Uri.parse('https://www.arcgis.com'), connection: connection);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Portal_getInstanceId(_handle, errorHandler);
    });
  }

  /// Details about the [Portal] instance, such as its name, logo, featured
  /// items, and supported protocols (http vs https).
  PortalInfo? get portalInfo => _portalInfo.value;

  final Memoized<PortalInfo?> _portalInfo;

  /// The URL of this portal.
  Uri get uri => _uri.value;

  final Memoized<Uri> _uri;

  /// Retrieves the current portal user's [LicenseInfo] including its
  /// entitlements and extensions.
  ///
  /// Return Value: A [Future] that provides the [LicenseInfo] for the current
  /// user on the portal.
  Future<LicenseInfo> fetchLicenseInfo() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Portal_fetchLicenseInfoAsync(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsLicenseInfo()!);
  }

  /// Cancelable version of [fetchLicenseInfo]. See that method for more
  /// information.
  CancelableOperation<LicenseInfo> fetchLicenseInfoCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Portal_fetchLicenseInfoAsync(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsLicenseInfo()!);
  }

  /// Sets the [PortalInfo] on the [Portal] after the loading is done or an
  /// error if the load failed.
  ///
  /// Parameters:
  /// - `portalInfo` — The [PortalInfo] being set.
  /// - `userDefinedError` — The error.
  void _setPortalInfoOrError(
      {required PortalInfo? portalInfo,
      required _ClientReference? userDefinedError}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Portal_setPortalInfoOrError(
          _handle,
          portalInfo?._handle ?? ffi.nullptr,
          userDefinedError?._handle ?? ffi.nullptr,
          errorHandler);
    });
  }

  /// A Future that completes with an array of [Basemap] objects within the basemap gallery group. See [PortalInfo.basemapGalleryGroupQuery].
  Future<List<Basemap>> basemaps() => _portalHelper.basemaps();

  /// A Future that completes with an array of [Basemap] objects within the developer basemap gallery group. See [PortalInfo.developerBasemapGalleryGroupQuery].
  Future<List<Basemap>> developerBasemaps() =>
      _portalHelper.developerBasemaps();

  /// Retrieves a collection of styles using the [PortalInfo.stylesGroupQuery] query string.
  ///
  /// The result is an unmodifiable list of [PortalItem] objects. Note: the collection size is limited to 25.
  ///
  /// Returns: A [Future] that provides [PortalItem] objects for the styles.
  Future<List<PortalItem>> fetchStyles() => _portalHelper.fetchStyles();

  /// Finds portal groups that match the given query parameters.
  ///
  /// This method obtains a [PortalQueryResultSet] object containing a collection of [PortalGroup] objects. Use
  /// [PortalQueryResultSet.results] to obtain the collection of [PortalGroup] objects that match the query
  /// parameters. The [PortalGroup] objects are fully populated and have a load status of [LoadStatus.loaded].
  /// Use the [PortalQueryParameters] to restrict the items returned by this method. If you provide a simple
  /// keyword string for the search, such as "federal", this method searches the default set of high performance
  /// index fields, such as id, title, description, snippet, tags, and owner.
  ///
  /// For more advanced searches, you can preface your simple keyword strings with ArcGIS Portal Directory REST
  /// named fields followed by a colon (:). These advanced searches can take advantage of Boolean operators
  /// (AND, NOT, OR, -) and a range of special characters. For a more information, see the
  /// [Search reference](https://developers.arcgis.com/rest/users-groups-and-items/search-reference.htm) document
  /// in the ArcGIS Portal Directory REST API. Here are some examples of advanced search strings:
  ///
  /// * To find one specific portal group by it's Id: "id:1db70a32f5f84ea9a88f5f460f22557b"
  /// * To find all private portal groups with the word 'federal' in the Title field: "title:federal AND access:private"
  /// * To find all portal groups with the word 'federal' in the Title field and the word 'restricted' in the Description field: "title:federal AND description:restricted"
  /// * To find all portal groups with the word 'state' in the Title field and not have the word 'restricted' in the Description field: "title:state NOT description:restricted"
  ///
  /// Returns: a [Future] of [PortalQueryResultSet] containing the PortalGroups that were found.
  Future<PortalQueryResultSet<PortalGroup>> findGroups(
          {required PortalQueryParameters parameters}) =>
      _portalHelper.findGroups(parameters: parameters);

  /// Finds portal items that match the specified query parameters.
  ///
  /// This method obtains a [PortalQueryResultSet] object that contains [PortalItem] objects. Use [PortalQueryResultSet.results]
  /// to obtain the collection of [PortalItem] objects that match the query parameters. Since portal items can
  /// be maps, layers, applications or tools, use the [PortalQueryParameters] to restrict which items are
  /// returned. If you provide a simple keyword string for the search, such as "florida", this method searches a
  /// default set of high performance index fields, such as title, tags, snippet, description, type, and typekeywords.
  ///
  /// For more advanced searches, you can preface your simple keyword strings with ArcGIS Portal Directory REST
  /// named fields followed by a colon (:). These advanced searches can take advantage of Boolean operators
  /// (AND, NOT, OR, -) and a range of special characters. For a more information, see the
  /// [Search reference](https://developers.arcgis.com/rest/users-groups-and-items/search-reference.htm) document
  /// in the ArcGIS Portal Directory REST API. Here are some examples of advanced search strings:
  ///
  /// * To find one specific portal item by its Id: "id:00e5e70929e14055ab686df16c842ec1"
  /// * To find all WebMap portal items with the word 'florida' in the Title field: "title:florida AND type:web map"
  /// * To find all Layer Package portal items with the word 'florida' in the Title field: "title:florida AND type:layer package"
  /// * To find all portal items with the word 'florida' in the Title field and the word 'esri' in the LicenseInfo field: "title:florida AND licenseinfo:esri"
  /// * To find all portal items with the word 'florida' in the Title field and not have the word 'esri' in the LicenseInfo field: "title:florida NOT licenseinfo:esri"
  /// * To find all portal items with located within a specific spatial extent and the word 'esri' in the LicenseInfo: "extent:\[-114.3458, 21.7518] - \[-73.125, 44.0658] AND licenseinfo:esri"
  /// * To find all portal items with a SpatialReference.WKID of 4267: "spatialreference:4267"
  /// * To find all portal items with a SpatialReference.WKID of 4267 or have the word 'cancer' in the Title field: "spatialreference:4267 OR title:cancer"
  ///
  /// If you want to find items that belong to a group, then use [PortalGroup.findItems] to search group
  /// content.
  ///
  /// Returns: a [Future] of [PortalQueryResultSet] containing the portal items that were found.
  Future<PortalQueryResultSet<PortalItem>> findItems(
          {required PortalQueryParameters parameters}) =>
      _portalHelper.findItems(parameters: parameters);

  /// The connection type used while loading the portal.
  PortalConnection get connection => _portalHelper.connection;

  /// The authenticated user of this portal.
  ///
  /// This value is null if no user is signed in due to anonymous access or the portal is not loaded.
  PortalUser? get user => _portalHelper.user;

  @override
  int _coreLoadStatus() => _portalHelper._coreLoadStatus();

  @override
  void _coreLoad() => _portalHelper._coreLoad();

  @override
  void _coreRetryLoad() => _portalHelper._coreRetryLoad();

  @override
  void _coreCancelLoad() => _portalHelper._coreCancelLoad();

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypePortalInfoEvent:
        _portalInfoRequestStreamController.add(null);
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
        logger.f('Portal unhandled asyncType $asyncType');
    }
  }
}

final class _PortalFactory
    implements _InstanceFactory<Portal, RT_PortalHandle> {
  @override
  Portal createInstance({required RT_PortalHandle handle}) {
    return Portal._withHandle(handle);
  }

  @override
  void destroyHandle(RT_PortalHandle handle) {
    bindings.Portal_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_PortalHandle handle) {
    return runtimecore.RT_Portal_getInstanceId(handle, ffi.nullptr);
  }
}

/// Indicates the level of access to this portal object: private, shared,
/// organization, or public.
enum PortalAccess {
  /// An unknown portal access.
  unknown,

  /// Organization level of access.
  organization,

  /// Private access.
  private,

  /// Public access.
  public,

  /// Shared access.
  shared;

  factory PortalAccess._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return organization;
      case 1:
        return private;
      case 2:
        return public;
      case 3:
        return shared;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case organization:
        return 0;
      case private:
        return 1;
      case public:
        return 2;
      case shared:
        return 3;
    }
  }
}

/// A class that contains information about the related [Portal].
final class PortalInfo implements ffi.Finalizable {
  final RT_PortalInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.PortalInfo_destroy.cast());

  static PortalInfo? _fromHandle(RT_PortalInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PortalInfo._withHandle(handle);
  }

  PortalInfo._withHandle(RT_PortalInfoHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PortalInfo_created(_handle);
    }
  }

  final _portalInfoHelper = _PortalInfoHelper();

  /// Creates a portal info object from the portal self call.
  ///
  /// Parameters:
  /// - `portalInfoJson` — The JSON returned by the portal self call.
  factory PortalInfo._withJson({required String portalInfoJson}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePortalInfoJson = _CString(portalInfoJson);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalInfo_createWithJSON(
          corePortalInfoJson.bytes, errorHandler);
    });
    return PortalInfo._withHandle(handle);
  }

  factory PortalInfo._withPortal(Portal portal, String portalInfoJson) {
    final portalInfo = PortalInfo._withJson(portalInfoJson: portalInfoJson);
    portalInfo._portalInfoHelper.init(portal, portalInfoJson);
    return portalInfo;
  }

  /// Determines who can view the organization's content.
  PortalAccess get access => _portalInfoHelper._access;

  /// The pre-defined query string for finding the collection of basemaps.
  String get basemapGalleryGroupQuery =>
      _portalInfoHelper._basemapGalleryGroupQuery;

  /// Indicates whether the members of the organization can search content outside of the organization.
  bool get canSearchPublic => _portalInfoHelper._canSearchPublic;

  /// Indicates whether the members of the organization can share content outside of the organization.
  bool get canSharePublic => _portalInfoHelper._canSharePublic;

  /// A query that identifies the group containing developer basemaps.
  ///
  /// Developer basemaps are accessible and metered via API keys.
  String get developerBasemapGalleryGroupQuery =>
      _portalInfoHelper._developerBasemapGalleryGroupQuery;

  /// The banner image of the organization.
  ///
  /// If it is "null", there is no image. Otherwise, the image needs to be
  /// loaded using [LoadableImage.load].
  LoadableImage? get organizationBanner =>
      _portalInfoHelper._organizationBanner;

  /// The description of the organization.
  String get organizationDescription =>
      _portalInfoHelper._organizationDescription;

  /// The ID of the organization.
  String get organizationId => _portalInfoHelper._organizationId;

  /// The name of the organization.
  String get organizationName => _portalInfoHelper._organizationName;

  /// The portion of the URL's host component that identifies a specific organization subscription within a portal.
  String get organizationSubdomain => _portalInfoHelper._organizationSubdomain;

  /// The portal that is being referred to.
  Portal get portal => _portalInfoHelper._portal;

  /// The name of the portal.
  String get portalName => _portalInfoHelper._portalName;

  /// The thumbnail image of the portal.
  ///
  /// If it is "null", there is no image. Otherwise, the image needs to be
  /// loaded using [LoadableImage.load].
  LoadableImage? get portalThumbnail => _portalInfoHelper._portalThumbnail;

  /// A query that identifies a group of styles. Each style contains references to symbols that can be used across
  /// ArcGIS products.
  ///
  /// This expression can be used as the query string parameter to find the styles group.
  /// Instead of providing your own query, you can use the helper method [Portal.fetchStyles] to fetch the
  /// items in the styles group.
  String get stylesGroupQuery => _portalInfoHelper._stylesGroupQuery;

  /// Indicates whether or not this portal supports OAuth authentication.
  bool get supportsOAuth => _portalInfoHelper._supportsOAuth;

  /// The thumbnail image of the organization.
  ///
  /// If it is "null", there is no image. Otherwise, the image needs to be
  /// loaded using [LoadableImage.load].
  LoadableImage? get thumbnail => _portalInfoHelper._thumbnail;
}

/// An item (unit of content) stored in an ArcGIS portal, such as a layer, web
/// map, package file, or map service.
///
/// ArcGIS portals support various types of portal items, including:
///   * Web maps and scenes.
///   * Services such as feature, map, scene, image, and OGC services that can
/// be added as layers to a map.
///   * Data files that can be uploaded, stored, and downloaded, such as .mmpk
/// or .vtpk files.
///   * Applications and tools.
///
/// Each portal item contains information about the item such as its unique ID,
/// the owning [Portal], and the type of item it is ([PortalItemType]). Portal
/// items can be kept private to the users that created them, shared with other
/// users in specific groups, or made public and accessible to everyone.
///
/// You can use the portal item ID along with a portal URL to quickly
/// instantiate a new portal item object. The item's details page has the
/// following URL format: https://www.arcgis.com/home/item.html?id=\[item_id].
/// If your portal item is a web map, you can also obtain a URL with the format:
/// https://www.arcgis.com/home/webmap/viewer.html?webmap=\[item_id] from the
/// [ArcGIS Online Map Viewer](https://doc.arcgis.com/en/arcgis-online/get-started/get-started-with-mv.htm).
/// In both cases, you can use the \[item_id] as the ID to instantiate a portal
/// item.
///
/// Alternatively, you can obtain a portal item directly from a portal using a
/// method such as `Portal.findItemsAsync(PortalQueryParameters)`.
final class PortalItem extends Item
    with JsonSerializable, Loadable
    implements _CallbackReceiver {
  static PortalItem? _fromHandle(RT_PortalItemHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Item._instanceCache.instanceWith(handle);
  }

  PortalItem._withHandle(super.handle)
      : _portal = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PortalItem_getPortal(handle, errorHandler);
          });
          return Portal._fromHandle(objectHandle)!;
        }),
        _serviceUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PortalItem_getServiceURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PortalItem_getURL(handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PortalItem_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PortalItem_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PortalItem_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PortalItem_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a portal item from the specified JSON string and portal.
  ///
  /// Parameters:
  /// - `json` — The JSON representation of the portal item.
  /// - `portal` — The portal.
  static PortalItem? withJson(String json, {required Portal portal}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreJSON = _CString(json);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_createWithJSON(
          coreJSON.bytes, portal._handle, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    final PortalItem object = Item._instanceCache.instanceWith(handle);
    object._portal.cache(portal);
    return object;
  }

  /// Creates a portal item object using the specified portal and item ID.
  ///
  /// The portal item ID can be determined from the URL of the item details web
  /// page or the ArcGIS Online map viewer and scene viewer web applications in
  /// your portal. The item details page has the following format
  /// https://www.arcgis.com/home/item.html?id=\[item_id]. The map viewer has
  /// the format
  /// https://www.arcgis.com/home/webmap/viewer.html?webmap=\[item_id] or
  /// https://www.arcgis.com/apps/mapviewer/index.html?webmap=\[item_id]
  /// depending on whether you use the classic map viewer or the new map viewer.
  /// The scene viewer has the following format
  /// https://www.arcgis.com/home/webscene/viewer.html?webscene=\[item_id]. In
  /// all cases, you can use the \[item_id] as the ID to instantiate a portal
  /// item.
  ///
  /// Parameters:
  /// - `portal` — The portal.
  /// - `itemId` — The item ID.
  factory PortalItem.withPortalAndItemId(
      {required Portal portal, required String itemId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreItemId = _CString(itemId);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_createWithPortalAndItemId(
          portal._handle, coreItemId.bytes, errorHandler);
    });
    final PortalItem object = Item._instanceCache.instanceWith(handle);
    object._portal.cache(portal);
    return object;
  }

  /// Creates a new portal item with the specified type in the specified portal.
  ///
  /// Use this constructor if you wish to create a new a [PortalItem] to add to
  /// a portal.
  ///
  /// Parameters:
  /// - `portal` — The portal.
  /// - `type` — The type of portal item.
  factory PortalItem.withPortalAndType(
      {required Portal portal, required PortalItemType type}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_createWithPortalAndType(
          portal._handle, type.coreValue, errorHandler);
    });
    final PortalItem object = Item._instanceCache.instanceWith(handle);
    object._portal.cache(portal);
    return object;
  }

  /// Creates a portal item from the specified portal item URL.
  ///
  /// Use this object to create a portal item from a URL. The supported URL
  /// formats are:
  /// * The REST Sharing API URL of the portal item (with or without the query
  /// parameter f=json). Example:
  /// https://www.arcgis.com/sharing/rest/content/items/c6a2c53ead68432586cc9ac9ec366055?f=json
  /// * The REST Sharing API URL of the portal item data. Example:
  /// https://www.arcgis.com/sharing/rest/content/items/c6a2c53ead68432586cc9ac9ec366055/data
  /// * The URL of the portal item details web page. Example:
  /// https://www.arcgis.com/home/item.html?id=c6a2c53ead68432586cc9ac9ec366055
  /// * The URL of a web map opened in the portal's map viewer web application
  /// (classic or new). Example:
  /// https://www.arcgis.com/home/webmap/viewer.html?webmap=8bf7167d20924cbf8e25e7b11c7c502c
  /// or
  /// https://www.arcgis.com/apps/mapviewer/index.html?webmap=8bf7167d20924cbf8e25e7b11c7c502c
  /// * The URL of a web scene opened in the portal's scene viewer web
  /// application. Example:
  /// https://www.arcgis.com/home/webscene/viewer.html?webscene=74ec7d6ca482442ba24f80b708aec67e
  ///
  /// Parameters:
  /// - `uri` — The URL to the portal item.
  static PortalItem? withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_createWithURL(
          coreURI.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return Item._instanceCache.instanceWith(handle);
  }

  /// The portal item access.
  ///
  /// A portal item can be accessed by various types of users. There are four
  /// levels of access that can be associated with a [PortalItem]. Some of the
  /// access levels can be concurrent, others cannot. [PortalItem.access]
  /// however only returns a single [PortalAccess] level enumeration even though
  /// multiple levels of access may have been specified. If multiple access
  /// levels have been specified on a [PortalItem], the returned access level
  /// will be the least restrictive access level.
  PortalAccess get access {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getAccess(_handle, errorHandler);
    });
    return PortalAccess._fromCoreValue(coreValue);
  }

  void _setAccess(PortalAccess access) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setAccess(
          _handle, access.coreValue, errorHandler);
    });
  }

  /// The average rating of this portal item.
  double get averageRating {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getAverageRating(_handle, errorHandler);
    });
  }

  void _setAverageRating(double averageRating) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setAverageRating(
          _handle, averageRating, errorHandler);
    });
  }

  /// The number of comments on this portal item.
  int get commentCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getCommentCount(_handle, errorHandler);
    });
  }

  void _setCommentCount(int commentCount) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setCommentCount(
          _handle, commentCount, errorHandler);
    });
  }

  /// True if the comments are allowed on the portal item, false otherwise.
  ///
  /// Will return false if an error occurs.
  bool get commentsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getCommentsEnabled(
          _handle, errorHandler);
    });
  }

  /// The culture (language and country) of the portal item.
  String get culture {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getCulture(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The ID of the folder in which the owner has stored the item. The property
  /// is only returned to users who are the item's owner or the org admin.
  ///
  /// A null folderID means either an error or that the folderID is unknown to
  /// the user. An empty folderID means that the item is stored at the root
  /// folder of the user directory.
  String get folderId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getFolderId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  void _setFolderId(String folderId) {
    final coreFolderId = _CString(folderId);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setFolderId(
          _handle, coreFolderId.bytes, errorHandler);
    });
  }

  /// The username of the user who owns this portal item.
  String get owner {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getOwner(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  void _setOwner(String owner) {
    final coreOwner = _CString(owner);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setOwner(
          _handle, coreOwner.bytes, errorHandler);
    });
  }

  /// The ArcGIS portal that contains this portal item.
  ///
  /// Will Throw [ArcGISExceptionType.commonIllegalState] if the portal item is
  /// loaded or loading.
  Portal get portal => _portal.value;

  final Memoized<Portal> _portal;

  /// The number of ratings on the portal item.
  ///
  /// For internal use only. When the user adds their item rating, the number of
  /// ratings needs to be incremented.
  int get ratingCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getRatingCount(_handle, errorHandler);
    });
  }

  void _setRatingCount(int ratingCount) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setRatingCount(
          _handle, ratingCount, errorHandler);
    });
  }

  /// The URL of the service that this portal item represents. This only applies
  /// to portal items that represent web-accessible resources such as map
  /// services.
  ///
  /// Will return null if an error occurs and an empty string if the item
  /// doesn't represent a web-accessible resource.
  Uri get serviceUri => _serviceUri.value;

  final Memoized<Uri> _serviceUri;

  /// The size of this portal item.
  ///
  /// Will return -1 if an error occurs.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getSize(_handle, errorHandler);
    });
  }

  /// The GIS content type of this portal item.
  ///
  /// A portal item's type cannot be changed once it has an item ID. If you wish
  /// to change the type you must create a new [PortalItem].
  PortalItemType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getType(_handle, errorHandler);
    });
    return PortalItemType._fromCoreValue(coreValue);
  }

  set type(PortalItemType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_setType(_handle, value.coreValue, errorHandler);
    });
  }

  /// The type name of this portal item.
  ///
  /// Most generally the type name is the string representation of the
  /// [PortalItemType] returned by [PortalItem.type]. However if the type is
  /// [PortalItemType.unknown], the type name is set with the type found in the
  /// portal item JSON. This allows API to deal with new portal item types added
  /// since the latest API release.
  String get typeName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getTypeName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The URL of this portal item.
  ///
  /// Will Throw [ArcGISExceptionType.commonIllegalState] if the portal item is
  /// loaded or loading.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The number of views of this portal item.
  ///
  /// Will return -1 if an error occurs.
  int get viewCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getViewCount(_handle, errorHandler);
    });
  }

  /// Converts a string to a [PortalAccess].
  ///
  /// Returns [PortalAccess.unknown] if an error occurs. For internal use only.
  /// Useful while all portal objects are not deserialized by C_API.
  ///
  /// Parameters:
  /// - `access` — The portal access as a string.
  ///
  /// Return Value: A [PortalAccess].
  static PortalAccess _portalAccessFromString({required String access}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreAccess = _CString(access);
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_portalAccessFromString(
          coreAccess.bytes, errorHandler);
    });
    return PortalAccess._fromCoreValue(coreValue);
  }

  /// Converts a [PortalAccess] to a [String].
  ///
  /// For internal use only. Useful while all portal objects are not
  /// deserialized by C_API.
  ///
  /// Parameters:
  /// - `access` — The portal access as a [PortalAccess].
  ///
  /// Return Value: A [String].
  static String _portalAccessToString({required PortalAccess access}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_portalAccessToString(
          access.coreValue, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Converts a string to a [PortalItemType].
  ///
  /// Returns [PortalItemType.unknown] if an error occurs. For internal use
  /// only. Useful while all portal objects are not deserialized by C_API.
  ///
  /// Parameters:
  /// - `type` — The portal item type as string.
  ///
  /// Return Value: A [PortalItemType].
  static PortalItemType _portalItemTypeFromString({required String type}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreType = _CString(type);
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_portalItemTypeFromString(
          coreType.bytes, errorHandler);
    });
    return PortalItemType._fromCoreValue(coreValue);
  }

  /// Converts a [PortalItemType] to a [String].
  ///
  /// For internal use only. Useful while all portal objects are not
  /// deserialized by C_API.
  ///
  /// Parameters:
  /// - `type` — The portal access as a [PortalItemType].
  ///
  /// Return Value: A [String].
  static String _portalItemTypeToString({required PortalItemType type}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_portalItemTypeToString(
          type.coreValue, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory PortalItem.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_PortalItem_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return PortalItem._fromHandle(objectHandle)!;
  }

  factory PortalItem.fromJson(Map<String, dynamic> json) {
    return PortalItem.fromJsonString(jsonEncode(json));
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PortalItem_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalItem_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _portal.invalidateCache();
    _serviceUri.invalidateCache();
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
        logger.f('PortalItem unhandled asyncType $asyncType');
    }
  }
}

/// An enumeration of various types of portal items.
enum PortalItemType {
  /// An unknown portal item type.
  unknown,

  /// Pro Add In (esriaddinx).
  arcGISProAddIn,

  /// ArcPad Package (zip).
  arcPadPackage,

  /// A Computer-Aided Design drawing comprised of a single file.
  cadDrawing,

  /// A text file of data values separated by commas or other delimiters. Can be
  /// published as a feature service using the Portal API Publish call.
  csv,

  /// A city engine web scene.
  cityEngineWebScene,

  /// The sample code associated with an application whose purpose is code
  /// sample.
  codeAttachment,

  /// A code sample.
  codeSample,

  /// A color set.
  colorSet,

  /// ArcGIS Add-In (esriaddin).
  desktopAddIn,

  /// Desktop Application (zip).
  desktopApplication,

  /// The Desktop Application Template (zip) includes either a desktop add in or
  /// a toolbar.exe.
  desktopApplicationTemplate,

  /// ArcGIS Pro Style file (stylx).
  desktopStyle,

  /// Link to a web resource.
  documentLink,

  /// ArcGIS Explorer Layer (eaz).
  explorerAddIn,

  /// ArcGIS Explorer Layer (nmc).
  explorerLayer,

  /// ArcGIS Explorer Document (nmf).
  explorerMap,

  /// A feature collection is a saved web map feature layer with layer
  /// definition (types, symbols, fields, and so on) and a feature set (the
  /// actual features).
  featureCollection,

  /// A feature collection that includes the layer definition component.
  featureCollectionTemplate,

  /// A feature service. The URL to the service is stored in the serviceURL
  /// property of the item (see [PortalItem.serviceUri]). Optional JSON data
  /// contains overridden service properties.
  featureService,

  /// File Geodatabase.
  fileGeodatabase,

  /// Form authored using Survey123.
  form,

  /// ArcGIS Server Geocoding Service. The URL to the service is stored in the
  /// serviceURL property of the item (see [PortalItem.serviceUri]).
  geocodingService,

  /// ArcGIS Server Geodata Service. The URL to the service is stored in the
  /// serviceURL property of the item (see [PortalItem.serviceUri]).
  geodataService,

  /// ArcGIS Server Geometry Service The URL to the service is stored in the
  /// serviceURL property of the item (see [PortalItem.serviceUri]).
  geometryService,

  /// ArcGIS Geoprocessing Package (gpk).
  geoprocessingPackage,

  /// ArcGIS Pro Geoprocessing Package (gpkx).
  geoprocessingPackageProVersion,

  /// Geoprocessing Sample.
  geoprocessingSample,

  /// ArcGIS Server Geoprocessing Service. The URL to the service is stored in
  /// the serviceURL property of the item (see [PortalItem.serviceUri]).
  geoprocessingService,

  /// ArcGlobe Document (3dd).
  globeDocument,

  /// ArcGIS Server Globe Service. The URL to the service is stored in the
  /// serviceURL property of the item (see [PortalItem.serviceUri]).
  globeService,

  /// Image Types (.jpg, .jpeg, .tif, .tiff, .png).
  image,

  /// A portable file that contains one or more images that can be published as
  /// an image service for imagery visualization and analysis.
  imageCollection,

  /// An image service. The URL to the service is stored in the serviceURL
  /// property of the item (see [PortalItem.serviceUri]). Optional JSON data
  /// contains overridden service properties.
  imageService,

  /// Insights model records analysis steps on an insights pages, including
  /// adding and joining datasets, spatial analysis, data analytics and styling.
  insightsModel,

  /// Insights Page resides in Insights Workbook, used to connect the data and
  /// analyze related content and themes with interactive visualization.
  insightsPage,

  /// Insights Workbook collects or associates all data and analytical activity
  /// for a project, capturing and maintaining relationships such as data
  /// locations and storing result layers, models, pages and cards.
  insightsWorkbook,

  /// iWork Keynote file (.key).
  iWorkKeynote,

  /// iWork Numbers file (.numbers).
  iWorkNumbers,

  /// iWork Pages file (.pages).
  iWorkPages,

  /// KML Network Link or KML file. If a file, then the data resource retrieves
  /// the file and can be used as a network link. If a network link, then the
  /// serviceURL property of the item (see [PortalItem.serviceUri]) contains the
  /// URL for the network link.
  kml,

  /// A zip file containing a collection of KML/KMZ files.
  kmlCollection,

  /// Layer File (lyr) or ArcGIS Pro layer file (lyrx).
  layer,

  /// Layer Package (lpk).
  layerPackage,

  /// ArcGIS Pro Layout File (pagx).
  layout,

  /// ArcGIS Locator Package (gcpk).
  locatorPackage,

  /// ArcMap Document (mxd).
  arcGISMapDocument,

  /// ArcGIS Map Package (mpk).
  arcGISMapPackage,

  /// A map service. The URL to the service is stored in the serviceURL property
  /// of the item (see [PortalItem.serviceUri]). Optional JSON data contains
  /// overridden service properties.
  arcGISMapService,

  /// The Map Template (.zip) contains documentation, a map, and GDB folder.
  arcGISMapTemplate,

  /// Microsoft Excel Document (.xls, .xlsx).
  microsoftExcel,

  /// Microsoft Powerpoint (.ppt, .pptx).
  microsoftPowerpoint,

  /// Microsoft Word Document (.doc, .docx).
  microsoftWord,

  /// A mobile application. The URL to the application in the app store is
  /// stored in the serviceURL property of the item (see
  /// [PortalItem.serviceUri]).
  mobileApplication,

  /// ArcGIS Mobile Basemap Package (.bpk).
  mobileBasemapPackage,

  /// ArcGIS Mobile Map Package (mmpk).
  mobileMapPackage,

  /// Native Application for ArcGIS AppStudio.
  nativeApplication,

  /// Native Application Installer for ArcGIS AppStudio.
  nativeApplicationInstaller,

  /// Native Application Template for ArcGIS AppStudio.
  nativeApplicationTemplate,

  /// Self-describing, portable and scalable file format for storing
  /// multidimensional scientific data usable by GeoAnalytics tools.
  netCdf,

  /// ArcGIS Server Network Analyst Service. The URL to the service is stored in
  /// the serviceURL property of the item (see [PortalItem.serviceUri]).
  networkAnalysisService,

  /// An operation view.
  ///
  /// This item type was retired in ArcGIS Online deployments and ArcGIS
  /// Enterprise deployments starting at version 10.7.
  operationView,

  /// ArcGIS Operations Dashboard Add In (opdashboardaddin).
  ///
  /// This item type was retired in ArcGIS Online deployments and ArcGIS
  /// Enterprise deployments starting at version 10.7.
  operationsDashboardAddIn,

  /// ArcGIS Operations Dashboard Extension.
  ///
  /// This item type was retired in ArcGIS Online deployments and ArcGIS
  /// Enterprise deployments starting at version 10.7.
  operationsDashboardExtension,

  /// Portable Document Format (.pdf).
  pdf,

  /// ArcGIS Project Package (ppkx).
  projectPackage,

  /// ArcGIS Project Template (aptx).
  projectTemplate,

  /// ArcGIS Pro map file (mapx).
  proMap,

  /// ArcReader Document (pmf).
  publishedMap,

  /// ArcGIS Pro raster function template.
  rasterFunctionTemplate,

  /// ArcGIS server relational catalog service. Item represents a connection to
  /// a database for the purpose of viewing, querying and analyzing its
  /// contents.
  relationalDatabaseConnection,

  /// Report template used by the geoenrichment service and Business Analyst
  /// applications to generate custom reports.
  reportTemplate,

  /// ArcGIS Rule Package (lpk).
  rulePackage,

  /// ArcScene Document (sxd).
  arcGISSceneDocument,

  /// Scene Layer Package (spk or slpk).
  arcGISScenePackage,

  /// Cached web layers that are optimized for displaying a large amount of 2D
  /// or 3D features.
  arcGISSceneService,

  /// A Service Definition that can be published to create a geo spatial web
  /// service using the Portal API Publish call.
  serviceDefinition,

  /// A shape file.
  shapeFile,

  /// Data collection used by the geoenrichment service and Business Analyst
  /// applications to perform data aggregation with statistical feature data.
  statisticalDataCollection,

  /// A symbol set.
  symbolSet,

  /// ArcGIS Task File (esriTasks).
  taskFile,

  /// Tile Package (tpk).
  tilePackage,

  /// Vector Tile Package (.vtpk).
  vectorTilePackage,

  /// A Vector Tile Service. The URL to the service is stored in the serviceURL
  /// property of the item (see [PortalItem.serviceUri]).
  vectorTileService,

  /// Visio Document (.vsd).
  visioDocument,

  /// A 360-degrees virtual reality experience that lets you explore a set of
  /// connected geo-located panoramic 3D visualizations or photos.
  vr360Experience,

  /// OGC Web Feature Service. The URL of the service is stored in the
  /// serviceURL property of the item (see [PortalItem.serviceUri]).
  wfs,

  /// OGC Web Map Service. The URL to the service is stored in the serviceURL
  /// property of the item (see [PortalItem.serviceUri]).
  wms,

  /// A WMTS Service.
  wmts,

  /// A Web map.
  webMap,

  /// A web mapping application.
  webMappingApplication,

  /// Web scene.
  webScene,

  /// A windows mobile package.
  windowsMobilePackage,

  /// Workflow Manager Package (wpk)
  workflowManagerPackage,

  /// ArcGIS Server Workflow Manager Service.
  workflowManagerService,

  /// Workforce Project.
  workforceProject,

  /// A runtime sqlite geodatabase.
  sqliteGeodatabase,

  /// An offline map area defining a map created ahead-of-time.
  arcGISMapArea,

  /// Initiatives organize data and tools with an organization goal.
  hubInitiative,

  /// A customizable website that provides a focused view of an organization's
  /// items.
  hubSiteApplication,

  /// Hub pages provide web site pages to market Hub Initiatives and provide
  /// chart and app content.
  hubPage,

  /// AppBuilder Extension for ArcGIS Web AppBuilder. URL that references custom
  /// widgets for use in Web AppBuilder apps within Portal.
  appBuilderExtension,

  /// AppBuilder Widget Package for ArcGIS Web AppBuilder. Custom widget in a
  /// zip file that can be downloaded for use in Web AppBuilder Developer
  /// Edition or ArcGIS Enterprise 10.5.1 or above.
  appBuilderWidgetPackage,

  /// Dashboards integrate maps, lists, charts, and gauges that help monitoring
  /// and managing daily operations.
  dashboard,

  /// A customization of Pro to include a custom splash screen and startup page
  /// as well as tools, dock panes, and menus.
  arcGISProConfiguration,

  /// Content category set is used as templates for creating the category set
  /// for an organization or a group.
  contentCategorySet,

  /// Insights Theme is a collection of properties set on cards and pages in an
  /// Insights Workbook.
  insightsTheme,

  /// Mobile Scene Package (mspk)
  mobileScenePackage,

  /// A collection of images stored as a catalog where data is added with
  /// specific parameters and auxiliary information to allow exploring non-nadir
  /// imagery on map and see the camera's field of view dynamically.
  orientedImageryCatalog,

  /// Ortho mapping project.
  orthoMappingProject,

  /// Ortho mapping template.
  orthoMappingTemplate,

  /// A solution is comprised of one or more related items and groups that work
  /// together as part of a workflow. It can be deployed to create a new copy of
  /// all the items and groups that make up the solution.
  solution,

  /// Building scene layers allow users to visualize and query building
  /// information.
  buildingSceneLayer,

  /// A tile package allows you to create a set of tiles (images) from a map,
  /// Raster or mosaic dataset, then use the set of tiles as a basemap in ArcGIS
  /// applications. (tpkx).
  compactTilePackage,

  /// For a given geodatabase or file share datastore, the datastore will be
  /// registered with Enterprise and will control who can see the datastore
  /// itself, enumerate datasets in it, and publish feature layers from it.
  dataStore,

  /// Deep Learning model package (dlpk).
  deepLearningPackage,

  /// A collection of portal items that provides a focused user experience when
  /// working with imagery to accomplish an image-based workflows as handled by
  /// the ArcGIS Excalibur web app.
  excaliburImageryProject,

  /// A GeoPackage is SQLite based containing both vector geospatial features
  /// and/or tile matrix sets.
  geoPackage,

  /// A collection of portal items that provides a focused user experience when
  /// working in this new product offering for mission focused, situational
  /// awareness.
  mission,

  /// The ArcGIS Enterprise Sites application creates this item. When viewed,
  /// users are able to interact with an Enterprise Site.
  siteApplication,

  /// The ArcGIS Enterprise Sites application creates this item. When viewed,
  /// users are able to interact with a page.
  sitePage,

  /// A component used by the ArcGIS Analytics for IoT application for
  /// processing high volumes of data.
  bigDataAnalytic,

  /// A component used by the ArcGIS Analytics for IoT application for bringing
  /// in a real-time data feed. Behaves like a stream layer when added to a map.
  feed,

  /// A component used by the ArcGIS Analytics for IoT application for
  /// processing real-time data. Includes references to data feeds, analytic
  /// operations, and destinations (outputs) where the results should be sent.
  realTimeAnalytic,

  /// ArcGIS Pro Report File (rptx).
  proReport,

  /// A project created by the QuickCapture Designer tool for use by the
  /// QuickCapture mobile app.
  quickCaptureProject,

  /// Survey123 Add-Ins are created and published via Survey123 Connect and are
  /// downloaded and used by the Survey123 field app.
  survey123AddIn,

  /// Contains all information needed to start up an Urban App including links
  /// to the Urban database services.
  urbanModel,

  /// An experience item created from Experience Builder for ArcGIS.
  webExperience,

  /// A template for a web experience, created from Experience Builder for
  /// ArcGIS.
  webExperienceTemplate,

  /// The next generation of StoryMap applications.
  storyMap,

  /// A collection of information (jobs, workflows, and configuration elements)
  /// supporting the ArcGIS Workflow Manager Server.
  workflow,

  /// An Insights Script is JSON that allows parameterized code created in the
  /// Insights console to be shared as an item and consumed in Insights in order
  /// for the user to run the script using different Insights data sets and
  /// fields as input parameters.
  insightsScript,

  /// A Kernel Gateway Connection is JSON that creates a connection string from
  /// Insights in order for the Insights console to connect and execute code
  /// against a Jupyter Kernel Gateway.
  kernelGatewayConnection,

  /// A Knowledge Graph enables you to connect, open, and access graph data so
  /// that it can be used in Link Charts and Maps.
  knowledgeGraph,

  /// A Link Chart enables you to visualize and perform link analysis using
  /// entities and relationships from a Knowledge Graph so that you may better
  /// understand their connectivity.
  linkChart,

  /// A webstyle item.
  style,

  /// An administrative report in CSV format that outlines various organization
  /// usage activities. This cannot be shared to the public.
  administrativeReport,

  /// A package that allows administrators or group owners to export a group,
  /// and its content, into a downloadable package (.epk file).
  exportPackage,

  /// An open standard geospatial data interchange format that represents simple
  /// geographic features and their nonspatial attributes. Based on JavaScript
  /// Object Notation (JSON), GeoJSON is a format for encoding a variety of
  /// geographic data structures.
  geoJson,

  /// Geography Markup Language (GML) file (.zip). An XML grammar defined by the
  /// OGC for expressing geographical features, serving as both a modeling
  /// language and an interchange format.
  gml,

  /// A central premium capability within ArcGIS Hub Premium, empowering
  /// customers and their trusted community members to create, edit, and manage
  /// in-person/online events.
  hubEvent,

  /// A package of multiple solutions related to a specific project or goal.
  hubInitiativeTemplate,

  /// A set of fonts, colors, block styles, and other design elements that
  /// define the appearance of a StoryMap.
  storyMapTheme,

  /// A custom widget (available via marketplace) is a configurable and
  /// shareable functional unit for use in ArcGIS Web AppBuilder. It will allow
  /// administrators to enable the use of a custom widget in Web AppBuilder UI
  /// so an organization can leverage the ArcGIS Online platform to host their
  /// applications.
  webAppBuilderWidget,

  /// An ArcGIS Earth configuration file is an exportable file containing all
  /// major settings in Earth. Earth users who have access to this file can
  /// customize the Earth settings by modifying this file. An Earth
  /// configuration file is saved as an .xml file. Users need to compress and
  /// zip the file before sharing. This zip file can be distributed and imported
  /// to Earth deployments.
  earthConfiguration,

  /// Support to publish OGC API Features service.
  ogcFeatureServer,

  /// An OGC 3D Tiles Service.
  ogc3DTilesService;

  factory PortalItemType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return arcGISProAddIn;
      case 1:
        return arcPadPackage;
      case 2:
        return cadDrawing;
      case 3:
        return csv;
      case 4:
        return cityEngineWebScene;
      case 5:
        return codeAttachment;
      case 6:
        return codeSample;
      case 7:
        return colorSet;
      case 8:
        return desktopAddIn;
      case 9:
        return desktopApplication;
      case 10:
        return desktopApplicationTemplate;
      case 11:
        return desktopStyle;
      case 12:
        return documentLink;
      case 13:
        return explorerAddIn;
      case 14:
        return explorerLayer;
      case 15:
        return explorerMap;
      case 16:
        return featureCollection;
      case 17:
        return featureCollectionTemplate;
      case 18:
        return featureService;
      case 19:
        return fileGeodatabase;
      case 20:
        return form;
      case 21:
        return geocodingService;
      case 22:
        return geodataService;
      case 23:
        return geometryService;
      case 24:
        return geoprocessingPackage;
      case 25:
        return geoprocessingPackageProVersion;
      case 26:
        return geoprocessingSample;
      case 27:
        return geoprocessingService;
      case 28:
        return globeDocument;
      case 29:
        return globeService;
      case 30:
        return image;
      case 31:
        return imageCollection;
      case 32:
        return imageService;
      case 33:
        return insightsModel;
      case 34:
        return insightsPage;
      case 35:
        return insightsWorkbook;
      case 36:
        return iWorkKeynote;
      case 37:
        return iWorkNumbers;
      case 38:
        return iWorkPages;
      case 39:
        return kml;
      case 40:
        return kmlCollection;
      case 41:
        return layer;
      case 42:
        return layerPackage;
      case 43:
        return layout;
      case 44:
        return locatorPackage;
      case 45:
        return arcGISMapDocument;
      case 46:
        return arcGISMapPackage;
      case 47:
        return arcGISMapService;
      case 48:
        return arcGISMapTemplate;
      case 49:
        return microsoftExcel;
      case 50:
        return microsoftPowerpoint;
      case 51:
        return microsoftWord;
      case 52:
        return mobileApplication;
      case 53:
        return mobileBasemapPackage;
      case 54:
        return mobileMapPackage;
      case 55:
        return nativeApplication;
      case 56:
        return nativeApplicationInstaller;
      case 57:
        return nativeApplicationTemplate;
      case 58:
        return netCdf;
      case 59:
        return networkAnalysisService;
      case 60:
        return operationView;
      case 61:
        return operationsDashboardAddIn;
      case 62:
        return operationsDashboardExtension;
      case 63:
        return pdf;
      case 64:
        return projectPackage;
      case 65:
        return projectTemplate;
      case 66:
        return proMap;
      case 67:
        return publishedMap;
      case 68:
        return rasterFunctionTemplate;
      case 69:
        return relationalDatabaseConnection;
      case 70:
        return reportTemplate;
      case 71:
        return rulePackage;
      case 72:
        return arcGISSceneDocument;
      case 73:
        return arcGISScenePackage;
      case 74:
        return arcGISSceneService;
      case 75:
        return serviceDefinition;
      case 76:
        return shapeFile;
      case 77:
        return statisticalDataCollection;
      case 78:
        return symbolSet;
      case 79:
        return taskFile;
      case 80:
        return tilePackage;
      case 81:
        return vectorTilePackage;
      case 82:
        return vectorTileService;
      case 83:
        return visioDocument;
      case 84:
        return vr360Experience;
      case 85:
        return wfs;
      case 86:
        return wms;
      case 87:
        return wmts;
      case 88:
        return webMap;
      case 89:
        return webMappingApplication;
      case 90:
        return webScene;
      case 91:
        return windowsMobilePackage;
      case 92:
        return workflowManagerPackage;
      case 93:
        return workflowManagerService;
      case 94:
        return workforceProject;
      case 95:
        return sqliteGeodatabase;
      case 96:
        return arcGISMapArea;
      case 97:
        return hubInitiative;
      case 98:
        return hubSiteApplication;
      case 99:
        return hubPage;
      case 100:
        return appBuilderExtension;
      case 101:
        return appBuilderWidgetPackage;
      case 102:
        return dashboard;
      case 103:
        return arcGISProConfiguration;
      case 104:
        return contentCategorySet;
      case 105:
        return insightsTheme;
      case 106:
        return mobileScenePackage;
      case 107:
        return orientedImageryCatalog;
      case 108:
        return orthoMappingProject;
      case 109:
        return orthoMappingTemplate;
      case 110:
        return solution;
      case 111:
        return buildingSceneLayer;
      case 112:
        return compactTilePackage;
      case 113:
        return dataStore;
      case 114:
        return deepLearningPackage;
      case 115:
        return excaliburImageryProject;
      case 116:
        return geoPackage;
      case 117:
        return mission;
      case 118:
        return siteApplication;
      case 119:
        return sitePage;
      case 120:
        return bigDataAnalytic;
      case 121:
        return feed;
      case 122:
        return realTimeAnalytic;
      case 123:
        return proReport;
      case 124:
        return quickCaptureProject;
      case 125:
        return survey123AddIn;
      case 126:
        return urbanModel;
      case 127:
        return webExperience;
      case 128:
        return webExperienceTemplate;
      case 129:
        return storyMap;
      case 130:
        return workflow;
      case 131:
        return insightsScript;
      case 132:
        return kernelGatewayConnection;
      case 133:
        return knowledgeGraph;
      case 134:
        return linkChart;
      case 135:
        return style;
      case 136:
        return administrativeReport;
      case 137:
        return exportPackage;
      case 138:
        return geoJson;
      case 139:
        return gml;
      case 140:
        return hubEvent;
      case 141:
        return hubInitiativeTemplate;
      case 142:
        return storyMapTheme;
      case 143:
        return webAppBuilderWidget;
      case 144:
        return earthConfiguration;
      case 145:
        return ogcFeatureServer;
      case 146:
        return ogc3DTilesService;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case arcGISProAddIn:
        return 0;
      case arcPadPackage:
        return 1;
      case cadDrawing:
        return 2;
      case csv:
        return 3;
      case cityEngineWebScene:
        return 4;
      case codeAttachment:
        return 5;
      case codeSample:
        return 6;
      case colorSet:
        return 7;
      case desktopAddIn:
        return 8;
      case desktopApplication:
        return 9;
      case desktopApplicationTemplate:
        return 10;
      case desktopStyle:
        return 11;
      case documentLink:
        return 12;
      case explorerAddIn:
        return 13;
      case explorerLayer:
        return 14;
      case explorerMap:
        return 15;
      case featureCollection:
        return 16;
      case featureCollectionTemplate:
        return 17;
      case featureService:
        return 18;
      case fileGeodatabase:
        return 19;
      case form:
        return 20;
      case geocodingService:
        return 21;
      case geodataService:
        return 22;
      case geometryService:
        return 23;
      case geoprocessingPackage:
        return 24;
      case geoprocessingPackageProVersion:
        return 25;
      case geoprocessingSample:
        return 26;
      case geoprocessingService:
        return 27;
      case globeDocument:
        return 28;
      case globeService:
        return 29;
      case image:
        return 30;
      case imageCollection:
        return 31;
      case imageService:
        return 32;
      case insightsModel:
        return 33;
      case insightsPage:
        return 34;
      case insightsWorkbook:
        return 35;
      case iWorkKeynote:
        return 36;
      case iWorkNumbers:
        return 37;
      case iWorkPages:
        return 38;
      case kml:
        return 39;
      case kmlCollection:
        return 40;
      case layer:
        return 41;
      case layerPackage:
        return 42;
      case layout:
        return 43;
      case locatorPackage:
        return 44;
      case arcGISMapDocument:
        return 45;
      case arcGISMapPackage:
        return 46;
      case arcGISMapService:
        return 47;
      case arcGISMapTemplate:
        return 48;
      case microsoftExcel:
        return 49;
      case microsoftPowerpoint:
        return 50;
      case microsoftWord:
        return 51;
      case mobileApplication:
        return 52;
      case mobileBasemapPackage:
        return 53;
      case mobileMapPackage:
        return 54;
      case nativeApplication:
        return 55;
      case nativeApplicationInstaller:
        return 56;
      case nativeApplicationTemplate:
        return 57;
      case netCdf:
        return 58;
      case networkAnalysisService:
        return 59;
      case operationView:
        return 60;
      case operationsDashboardAddIn:
        return 61;
      case operationsDashboardExtension:
        return 62;
      case pdf:
        return 63;
      case projectPackage:
        return 64;
      case projectTemplate:
        return 65;
      case proMap:
        return 66;
      case publishedMap:
        return 67;
      case rasterFunctionTemplate:
        return 68;
      case relationalDatabaseConnection:
        return 69;
      case reportTemplate:
        return 70;
      case rulePackage:
        return 71;
      case arcGISSceneDocument:
        return 72;
      case arcGISScenePackage:
        return 73;
      case arcGISSceneService:
        return 74;
      case serviceDefinition:
        return 75;
      case shapeFile:
        return 76;
      case statisticalDataCollection:
        return 77;
      case symbolSet:
        return 78;
      case taskFile:
        return 79;
      case tilePackage:
        return 80;
      case vectorTilePackage:
        return 81;
      case vectorTileService:
        return 82;
      case visioDocument:
        return 83;
      case vr360Experience:
        return 84;
      case wfs:
        return 85;
      case wms:
        return 86;
      case wmts:
        return 87;
      case webMap:
        return 88;
      case webMappingApplication:
        return 89;
      case webScene:
        return 90;
      case windowsMobilePackage:
        return 91;
      case workflowManagerPackage:
        return 92;
      case workflowManagerService:
        return 93;
      case workforceProject:
        return 94;
      case sqliteGeodatabase:
        return 95;
      case arcGISMapArea:
        return 96;
      case hubInitiative:
        return 97;
      case hubSiteApplication:
        return 98;
      case hubPage:
        return 99;
      case appBuilderExtension:
        return 100;
      case appBuilderWidgetPackage:
        return 101;
      case dashboard:
        return 102;
      case arcGISProConfiguration:
        return 103;
      case contentCategorySet:
        return 104;
      case insightsTheme:
        return 105;
      case mobileScenePackage:
        return 106;
      case orientedImageryCatalog:
        return 107;
      case orthoMappingProject:
        return 108;
      case orthoMappingTemplate:
        return 109;
      case solution:
        return 110;
      case buildingSceneLayer:
        return 111;
      case compactTilePackage:
        return 112;
      case dataStore:
        return 113;
      case deepLearningPackage:
        return 114;
      case excaliburImageryProject:
        return 115;
      case geoPackage:
        return 116;
      case mission:
        return 117;
      case siteApplication:
        return 118;
      case sitePage:
        return 119;
      case bigDataAnalytic:
        return 120;
      case feed:
        return 121;
      case realTimeAnalytic:
        return 122;
      case proReport:
        return 123;
      case quickCaptureProject:
        return 124;
      case survey123AddIn:
        return 125;
      case urbanModel:
        return 126;
      case webExperience:
        return 127;
      case webExperienceTemplate:
        return 128;
      case storyMap:
        return 129;
      case workflow:
        return 130;
      case insightsScript:
        return 131;
      case kernelGatewayConnection:
        return 132;
      case knowledgeGraph:
        return 133;
      case linkChart:
        return 134;
      case style:
        return 135;
      case administrativeReport:
        return 136;
      case exportPackage:
        return 137;
      case geoJson:
        return 138;
      case gml:
        return 139;
      case hubEvent:
        return 140;
      case hubInitiativeTemplate:
        return 141;
      case storyMapTheme:
        return 142;
      case webAppBuilderWidget:
        return 143;
      case earthConfiguration:
        return 144;
      case ogcFeatureServer:
        return 145;
      case ogc3DTilesService:
        return 146;
    }
  }
}
