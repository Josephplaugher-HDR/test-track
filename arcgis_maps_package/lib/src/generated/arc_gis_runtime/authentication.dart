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

/// An ArcGIS authentication challenge.
///
/// An ArcGIS authentication challenge is raised by the
/// `ArcGISAuthenticationChallengeHandler` if an ArcGIS secured resource
/// requires OAuth or ArcGIS Token authentication.
final class ArcGISAuthenticationChallenge implements ffi.Finalizable {
  final RT_ArcGISAuthenticationChallengeHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISAuthenticationChallenge_destroy.cast());

  static ArcGISAuthenticationChallenge? _fromHandle(
      RT_ArcGISAuthenticationChallengeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISAuthenticationChallenge._withHandle(handle);
  }

  ArcGISAuthenticationChallenge._withHandle(
      RT_ArcGISAuthenticationChallengeHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISAuthenticationChallenge_getError(
                handle, errorHandler);
          });
          return errorHandle.toArcGISException()!;
        }),
        _requestUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISAuthenticationChallenge_getRequestURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISAuthenticationChallenge_created(_handle);
    }
  }

  WeakReference<_AuthenticationChallengeQueue>? _queue;

  /// Creates an instance of an [ArcGISAuthenticationChallenge].
  ///
  /// Parameters:
  /// - `requestUri` — The URL of the request that initiated the challenge.
  /// - `error` — The [ArcGISExceptionType] that was encountered.
  factory ArcGISAuthenticationChallenge._(
      {required Uri requestUri, required ArcGISExceptionType error}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRequestUri = _CString(requestUri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISAuthenticationChallenge_create(
          coreRequestUri.bytes, error.coreValue, errorHandler);
    });
    final ArcGISAuthenticationChallenge object =
        ArcGISAuthenticationChallenge._withHandle(handle);
    object._requestUri.cache(requestUri);
    return object;
  }

  /// The underlying error that led to this authentication challenge.
  ArcGISException get error => _error.value;

  final Memoized<ArcGISException> _error;

  /// The URL of the request that led to this authentication challenge.
  Uri get requestUri => _requestUri.value;

  final Memoized<Uri> _requestUri;

  /// Cancels the request that initiated the challenge.
  void cancel() {
    _cancel();
    _queue?.target?._cancel(this);
  }

  void _cancel() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISAuthenticationChallenge_cancel(
          _handle, errorHandler);
    });
  }

  /// Handles the challenge without a credential, causing it to fail with the
  /// original authentication error.
  void continueAndFail() {
    _continueAndFail();
    _queue?.target?._continueAndFail(this);
  }

  void _continueAndFail() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISAuthenticationChallenge_continueAndFail(
          _handle, errorHandler);
    });
  }

  /// Handles the challenge with an error that occurred at the platform API
  /// level while trying to generate a credential.
  ///
  /// Parameters:
  /// - `platformApiError` — The platform API error that was encountered during
  /// the challenge.
  void _continueAndFailWithPlatformApiError(
      {required _ClientReference platformApiError}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_ArcGISAuthenticationChallenge_continueAndFailWithPlatformAPIError(
              _handle, platformApiError._handle, errorHandler);
    });
  }

  /// Handles the challenge with the specified credential.
  ///
  /// Parameters:
  /// - `credential` — The credential to use when retrying the request.
  void continueWithCredential(ArcGISCredential credential) {
    _continueWithCredential(credential);
    _queue?.target?._continueWithCredential(this, credential);
  }

  void _continueWithCredential(ArcGISCredential credential) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISAuthenticationChallenge_continueWithCredential(
          _handle, credential._handle, errorHandler);
    });
  }

  /// Returns a boolean indicating if this challenge is a match for another
  /// challenge for the purpose of sharing the result returned from a challenge
  /// handler.
  ///
  /// Parameters:
  /// - `other` — The other [ArcGISAuthenticationChallenge] to test for a match.
  ///
  /// Return Value: True if the challenge is a match, false otherwise.
  bool _isMatch(ArcGISAuthenticationChallenge other) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISAuthenticationChallenge_isMatch(
          _handle, other._handle, errorHandler);
    });
  }
}

/// A base class for types of ArcGIS credentials used to access secured
/// resources.
///
/// This is a base class for ArcGIS credentials requiring OAuth or ArcGIS Token
/// authentication, such as [OAuthUserCredential], [OAuthApplicationCredential],
/// [PregeneratedTokenCredential] and [TokenCredential].
final class ArcGISCredential with JsonSerializable implements ffi.Finalizable {
  final RT_ArcGISCredentialHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ArcGISCredential_destroy.cast());

  static ArcGISCredential? _fromHandle(RT_ArcGISCredentialHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (ArcGISCredential._objectTypeOf(handle)) {
      case _ArcGISCredentialType.oauthApplicationCredential:
        return OAuthApplicationCredential._withHandle(handle);
      case _ArcGISCredentialType.oauthUserCredential:
        return OAuthUserCredential._withHandle(handle);
      case _ArcGISCredentialType.pregeneratedTokenCredential:
        return PregeneratedTokenCredential._withHandle(handle);
      case _ArcGISCredentialType.tokenCredential:
        return TokenCredential._withHandle(handle);
    }
  }

  static _ArcGISCredentialType _objectTypeOf(RT_ArcGISCredentialHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_getObjectType(
          handle, errorHandler);
    });
    return _ArcGISCredentialType._fromCoreValue(coreValue);
  }

  _ArcGISCredentialType get _objectType =>
      ArcGISCredential._objectTypeOf(_handle);

  ArcGISCredential._withHandle(RT_ArcGISCredentialHandle handle)
      : _serverContext = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISCredential_getServerContext(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISCredential_created(_handle);
    }
  }

  /// The referer used to generate a token.
  ///
  /// * [TokenCredential] - The referer is `app://arcgis-maps/<application
  /// identifier>`.
  /// * [PregeneratedTokenCredential] - The referer passed to the constructor
  /// should match the referer used to generate the token, or empty string if
  /// none was used.
  /// * [OAuthUserCredential] and [OAuthApplicationCredential] - The referer is
  /// an empty string.
  String get referer {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_getReferer(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The URL by which the root of a server is accessed.
  ///
  /// This is the URL against which rest endpoints are resolved. For example,
  /// "https://sampleserver3.arcgisonline.com/ArcGIS/rest/services/SanFrancisco/311Incidents/FeatureServer/0"
  /// would have a server context of
  /// "https://sampleserver3.arcgisonline.com/ArcGIS", on which we could add
  /// "/rest/info" or "/rest" to fetch the server information.
  Uri get serverContext => _serverContext.value;

  final Memoized<Uri> _serverContext;

  /// The user associated with the credential.
  String get username {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_getUsername(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Gets the [_ArcGISTokenInfo] generated by this credential.
  ///
  /// Return Value: A [Future] that returns an [_ArcGISTokenInfo] from this
  /// credential.
  Future<_ArcGISTokenInfo> _getArcGisTokenInfo() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_getArcGISTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsArcGISTokenInfo()!);
  }

  /// Cancelable version of [_getArcGisTokenInfo]. See that method for more
  /// information.
  CancelableOperation<_ArcGISTokenInfo> _getArcGisTokenInfoCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_getArcGISTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsArcGISTokenInfo()!);
  }

  /// Indicates whether or not a token in the authorization header is supported.
  ///
  /// Return Value: The return value is based on the version number of the
  /// server or portal. Sending tokens in headers requires either a full version
  /// of 10.5.1 or greater, or a current version of 5.1 or greater.
  bool _isTokenInHeaderSupported() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_isTokenInHeaderSupported(
          _handle, errorHandler);
    });
  }

  /// Indicates whether or not the credential is valid.
  ///
  /// Return Value: True if the credential has a non-expired pregenerated token,
  /// or is capable of generating new tokens.
  bool _isValid() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_isValid(_handle, errorHandler);
    });
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ArcGISCredential.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_ArcGISCredential_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return ArcGISCredential._fromHandle(objectHandle)!;
  }

  factory ArcGISCredential.fromJson(Map<String, dynamic> json) {
    return ArcGISCredential.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArcGISCredential) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredential_hash(_handle, errorHandler);
    });
  }
}

/// A store for instances of the subclasses of [ArcGISCredential].
///
/// The credential provided while handling an authentication challenge is placed
/// in the ArcGIS credential store of the
/// [ArcGISEnvironment.authenticationManager] and used by all subsequent
/// requests that have a matching server context.
final class ArcGISCredentialStore
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_ArcGISCredentialStoreHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISCredentialStore_destroy.cast());

  static ArcGISCredentialStore? _fromHandle(
      RT_ArcGISCredentialStoreHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISCredentialStore._withHandle(handle);
  }

  ArcGISCredentialStore._withHandle(RT_ArcGISCredentialStoreHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISCredentialStore_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _allCredentialsRemovedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setAllCredentialsRemovedCallback(
              _handle,
              bindings.addresses
                  .asyncArcGISCredentialStoreAllCredentialsRemovedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setAllCredentialsRemovedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _credentialAddedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialAddedCallback(
              _handle,
              bindings.addresses.asyncArcGISCredentialStoreCredentialAddedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialAddedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _credentialRemovedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialRemovedCallback(
              _handle,
              bindings
                  .addresses.asyncArcGISCredentialStoreCredentialRemovedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialRemovedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _credentialUpdatedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialUpdatedCallback(
              _handle,
              bindings
                  .addresses.asyncArcGISCredentialStoreCredentialUpdatedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISCredentialStore_setCredentialUpdatedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void> _allCredentialsRemovedStreamController;

  /// Sets the callback invoked when all credentials are removed from the store.
  Stream<void> get _onAllCredentialsRemoved =>
      _allCredentialsRemovedStreamController.stream;

  late final StreamController<({ArcGISCredential arcGISCredential, Uri? uri})>
      _credentialAddedStreamController;

  /// Sets the callback invoked when a credential is added to this store.
  Stream<({ArcGISCredential arcGISCredential, Uri? uri})>
      get _onCredentialAdded => _credentialAddedStreamController.stream;

  late final StreamController<({ArcGISCredential arcGISCredential, Uri? uri})>
      _credentialRemovedStreamController;

  /// Sets the callback invoked when a credential is removed from this store.
  Stream<({ArcGISCredential arcGISCredential, Uri? uri})>
      get _onCredentialRemoved => _credentialRemovedStreamController.stream;

  late final StreamController<({ArcGISCredential arcGISCredential, Uri? uri})>
      _credentialUpdatedStreamController;

  /// Sets the callback invoked when a credential is updated in this store.
  Stream<({ArcGISCredential arcGISCredential, Uri? uri})>
      get _onCredentialUpdated => _credentialUpdatedStreamController.stream;

  /// Creates an instance of an [ArcGISCredentialStore].
  factory ArcGISCredentialStore() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredentialStore_create(errorHandler);
    });
    return ArcGISCredentialStore._withHandle(handle);
  }

  /// Adds the specified credential to the [ArcGISCredentialStore]. The
  /// credential's server context is used to determine what services the
  /// credential can be shared with.
  ///
  /// If a credential for the same server context is already in the store, then
  /// it will be replaced.
  ///
  /// Parameters:
  /// - `credential` — The credential to be stored within
  /// [ArcGISCredentialStore].
  void add({required ArcGISCredential credential}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISCredentialStore_add(
          _handle, credential._handle, errorHandler);
    });
  }

  /// Adds a specified credential to the store for a given URL. The URL must be
  /// shareable with the server context of the credential. Otherwise, this
  /// method throws an
  /// [ArcGISExceptionType.authenticationCredentialCannotBeShared]. When the
  /// credential is added to the store with this function, for the credential to
  /// be shared with a secured service endpoint, the service endpoint must begin
  /// with the specified URL passed to this function call. For example, if you
  /// were to specify a store URL of
  /// https://www.server.net/arcgis/rest/services/service1/ when calling this
  /// function, then the specified credential would be shared with an endpoint
  /// such as https://www.server.net/arcgis/rest/services/service1/query, but
  /// not for https://www.server.net/arcgis/rest/services/service2/query.
  ///
  /// If a credential was already stored for the same URL then it will be
  /// replaced.
  ///
  /// Parameters:
  /// - `credential` — The credential to be stored within
  /// [ArcGISCredentialStore].
  /// - `uri` — The URL to associate the credential with.
  void addForUri({required ArcGISCredential credential, required Uri uri}) {
    final coreURI = _CString(uri.toString());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISCredentialStore_addForURL(
          _handle, credential._handle, coreURI.bytes, errorHandler);
    });
  }

  /// Returns the best matched credential in the [ArcGISCredentialStore] for the
  /// given URL.
  ///
  /// Parameters:
  /// - `uri` — The URL of an ArcGIS secured resource.
  ///
  /// Return Value: An [ArcGISCredential] in the [ArcGISCredentialStore] that
  /// best matches the given URL.
  ArcGISCredential? getCredential({required Uri uri}) {
    final coreURI = _CString(uri.toString());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredentialStore_getCredential(
          _handle, coreURI.bytes, errorHandler);
    });
    return ArcGISCredential._fromHandle(objectHandle);
  }

  /// Returns an array of unique credentials contained in the
  /// [ArcGISCredentialStore].
  ///
  /// During a logout workflow, users should call this method before calling
  /// [ArcGISCredentialStore.removeAll], filter all instances of
  /// [OAuthUserCredential] and invalidate them by calling
  /// [OAuthUserCredential.revokeToken].
  ///
  /// Return Value: Every [ArcGISCredential] within the [ArcGISCredentialStore].
  List<ArcGISCredential> getCredentials() {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredentialStore_getCredentials(
          _handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Removes the credential from [ArcGISCredentialStore] if present.
  ///
  /// Parameters:
  /// - `credential` — The credential to be removed from
  /// [ArcGISCredentialStore].
  ///
  /// Return Value: True if the credential was found and removed from the store,
  /// otherwise false.
  bool remove({required ArcGISCredential credential}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredentialStore_remove(
          _handle, credential._handle, errorHandler);
    });
  }

  /// Removes all credentials from the [ArcGISCredentialStore].
  ///
  /// During a logout workflow, before calling this function, users should call
  /// [ArcGISCredentialStore.getCredentials], filter all instances of
  /// [OAuthUserCredential], and invalidate them using
  /// [OAuthUserCredential.revokeToken].
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISCredentialStore_removeAll(_handle, errorHandler);
    });
  }

  /// Removes any credentials from the [ArcGISCredentialStore] that would be
  /// shared with a service endpoint represented by the provided URL.
  ///
  /// Parameters:
  /// - `uri` — The URL to search for and remove credentials from the store.
  ///
  /// Return Value: An array of credentials that were removed.
  List<ArcGISCredential> removeCredentials({required Uri uri}) {
    final coreURI = _CString(uri.toString());
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISCredentialStore_removeCredentials(
          _handle, coreURI.bytes, errorHandler);
    });
    return arrayHandle.toList();
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeArcGISCredentialStoreAllCredentialsRemovedEvent:
        _allCredentialsRemovedStreamController.add(null);
      case AsyncType.asyncTypeArcGISCredentialStoreCredentialAddedEvent:
        final arcGISCredentialParameter = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ArcGISCredentialHandle;
          return ArcGISCredential._fromHandle(objectHandle)!;
        }();
        final uriParameter = () {
          final stringHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[3] as int)
                  as RT_StringHandle;
          return stringHandle.toUri();
        }();
        final event =
            (arcGISCredential: arcGISCredentialParameter, uri: uriParameter);
        _credentialAddedStreamController.add(event);
      case AsyncType.asyncTypeArcGISCredentialStoreCredentialRemovedEvent:
        final arcGISCredentialParameter = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ArcGISCredentialHandle;
          return ArcGISCredential._fromHandle(objectHandle)!;
        }();
        final uriParameter = () {
          final stringHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[3] as int)
                  as RT_StringHandle;
          return stringHandle.toUri();
        }();
        final event =
            (arcGISCredential: arcGISCredentialParameter, uri: uriParameter);
        _credentialRemovedStreamController.add(event);
      case AsyncType.asyncTypeArcGISCredentialStoreCredentialUpdatedEvent:
        final arcGISCredentialParameter = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ArcGISCredentialHandle;
          return ArcGISCredential._fromHandle(objectHandle)!;
        }();
        final uriParameter = () {
          final stringHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[3] as int)
                  as RT_StringHandle;
          return stringHandle.toUri();
        }();
        final event =
            (arcGISCredential: arcGISCredentialParameter, uri: uriParameter);
        _credentialUpdatedStreamController.add(event);
      default:
        logger.f('ArcGISCredentialStore unhandled asyncType $asyncType');
    }
  }
}

/// The list of credential types.
///
/// This is used to determine the credential type.
enum _ArcGISCredentialType {
  /// A token credential.
  tokenCredential,

  /// A pregenerated token credential.
  pregeneratedTokenCredential,

  /// An OAuth user credential.
  oauthUserCredential,

  /// An OAuth application credential.
  oauthApplicationCredential;

  factory _ArcGISCredentialType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return tokenCredential;
      case 2:
        return pregeneratedTokenCredential;
      case 3:
        return oauthUserCredential;
      case 4:
        return oauthApplicationCredential;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case tokenCredential:
        return 1;
      case pregeneratedTokenCredential:
        return 2;
      case oauthUserCredential:
        return 3;
      case oauthApplicationCredential:
        return 4;
    }
  }
}

/// A type that has information about an ArcGIS authentication token.
final class _ArcGISTokenInfo implements ffi.Finalizable {
  final RT_ArcGISTokenInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ArcGISTokenInfo_destroy.cast());

  static _ArcGISTokenInfo? _fromHandle(RT_ArcGISTokenInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ArcGISTokenInfo._withHandle(handle);
  }

  _ArcGISTokenInfo._withHandle(RT_ArcGISTokenInfoHandle handle)
      : _expirationDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISTokenInfo_getExpirationDate(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISTokenInfo_created(_handle);
    }
  }

  /// The access token string.
  String get accessToken {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTokenInfo_getAccessToken(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The token expiration date.
  DateTime get expirationDate => _expirationDate.value;

  final Memoized<DateTime> _expirationDate;

  /// A Boolean value that indicates whether the token must be passed over
  /// HTTPS.
  bool get isSslRequired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTokenInfo_getIsSSLRequired(
          _handle, errorHandler);
    });
  }

  /// Indicates whether or not the access token has expired.
  ///
  /// Return Value: True if the token's expiration date has passed, otherwise
  /// false.
  bool isExpired() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTokenInfo_isExpired(_handle, errorHandler);
    });
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _ArcGISTokenInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTokenInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISTokenInfo_hash(_handle, errorHandler);
    });
  }
}

/// The manager of requests for secure resources made by the application.
///
/// The authentication manager provides:
/// * ArcGIS and network challenge handlers for authentication challenges. For
/// example, you can write code in an authentication challenge handler to prompt
/// the user for credential information, create a credential, and use it to
/// continue with the challenge.
/// * The credential stores are available for storing the ArcGIS and network
/// credentials that are automatically checked when your application attempts to
/// connect to secured resources.
final class AuthenticationManager
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_AuthenticationManagerHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.AuthenticationManager_destroy.cast());

  static AuthenticationManager? _fromHandle(
      RT_AuthenticationManagerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return AuthenticationManager._withHandle(handle);
  }

  AuthenticationManager._withHandle(RT_AuthenticationManagerHandle handle)
      : _arcGISCredentialStore = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_AuthenticationManager_getArcGISCredentialStore(
                    handle, errorHandler);
          });
          return ArcGISCredentialStore._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_AuthenticationManager_setArcGISCredentialStore(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.AuthenticationManager_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _arcGISAuthenticationChallengeIssuedStreamController =
        StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_AuthenticationManager_setArcGISAuthenticationChallengeIssuedCallback(
                  _handle,
                  bindings
                      .addresses.asyncAuthenticationManagerIssuedChallengeEvent,
                  userData,
                  errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_AuthenticationManager_setArcGISAuthenticationChallengeIssuedCallback(
                  _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _oauthUserLoginStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_AuthenticationManager_setOAuthUserLoginCallback(
              _handle,
              bindings.addresses.asyncAuthenticationManagerOAuthUserLoginEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_AuthenticationManager_setOAuthUserLoginCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _portalNetworkSecuredInquiryStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_AuthenticationManager_setPortalNetworkSecuredInquiryCallback(
                  _handle,
                  bindings.addresses
                      .asyncAuthenticationManagerPortalNetworkSecuredInquiryEvent,
                  userData,
                  errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_AuthenticationManager_setPortalNetworkSecuredInquiryCallback(
                  _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<ArcGISAuthenticationChallenge>
      _arcGISAuthenticationChallengeIssuedStreamController;

  /// Sets the global callback invoked when an authentication challenge is
  /// issued.
  Stream<ArcGISAuthenticationChallenge>
      get _onArcGISAuthenticationChallengeIssued =>
          _arcGISAuthenticationChallengeIssuedStreamController.stream;

  late final StreamController<_OAuthUserLoginPrompt>
      _oauthUserLoginStreamController;

  /// Sets the global callback invoked when an OAuth user login is issued.
  Stream<_OAuthUserLoginPrompt> get _onOauthUserLogin =>
      _oauthUserLoginStreamController.stream;

  late final StreamController<_PortalNetworkSecuredInquiry>
      _portalNetworkSecuredInquiryStreamController;

  /// Sets the global callback invoked when a portal network secured inquiry is
  /// issued.
  Stream<_PortalNetworkSecuredInquiry> get _onPortalNetworkSecuredInquiry =>
      _portalNetworkSecuredInquiryStreamController.stream;

  /// Creates an AuthenticationManager.
  factory AuthenticationManager._() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AuthenticationManager_create(errorHandler);
    });
    return AuthenticationManager._withHandle(handle);
  }

  /// Storage for [ArcGISCredential] objects. The credential store is checked
  /// for a matching credential before sending requests or issuing
  /// authentication challenges.
  ArcGISCredentialStore get arcGISCredentialStore =>
      _arcGISCredentialStore.value;

  set arcGISCredentialStore(ArcGISCredentialStore value) =>
      _arcGISCredentialStore.value = value;

  final Memoized<ArcGISCredentialStore> _arcGISCredentialStore;

  /// The unique app or bundle ID that should be appended to the default referer
  /// used by [TokenCredential] instances.
  ///
  /// This should be set before any [TokenCredential] instances are created.
  /// This only applies to [ArcGISCredential.referer].
  String get _refererAppId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AuthenticationManager_getRefererAppId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set _refererAppId(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_AuthenticationManager_setRefererAppId(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The maximum number of times a request can be retried.
  static int get _requestRetryCount {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AuthenticationManager_getRequestRetryCount(
          errorHandler);
    });
  }

  /// The handler is called to handle [ArcGISAuthenticationChallenge] when requests are made for ArcGIS secured
  /// resources that require an OAuth or ArcGIS token authentication.
  ///
  /// The credential provided while handling an authentication challenge is placed in the ArcGIS credential store of the
  /// [ArcGISEnvironment.authenticationManager] and used by all subsequent requests that have a matching server context.
  ArcGISAuthenticationChallengeHandler? arcGISAuthenticationChallengeHandler;

  /// @nodoc
  @visibleForTesting
  Stream<int> get onQueueLengthChanged =>
      _authenticationChallengeQueue._onQueueLengthChanged;

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeAuthenticationManagerIssuedChallengeEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ArcGISAuthenticationChallengeHandle;
          return ArcGISAuthenticationChallenge._fromHandle(objectHandle)!;
        }();
        _arcGISAuthenticationChallengeIssuedStreamController.add(event);
      case AsyncType.asyncTypeAuthenticationManagerOAuthUserLoginEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_OAuthUserLoginPromptHandle;
          return _OAuthUserLoginPrompt._fromHandle(objectHandle)!;
        }();
        _oauthUserLoginStreamController.add(event);
      case AsyncType
            .asyncTypeAuthenticationManagerPortalNetworkSecuredInquiryEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_PortalNetworkSecuredInquiryHandle;
          return _PortalNetworkSecuredInquiry._fromHandle(objectHandle)!;
        }();
        _portalNetworkSecuredInquiryStreamController.add(event);
      default:
        logger.f('AuthenticationManager unhandled asyncType $asyncType');
    }
  }
}

/// The OAuth application credential generates a short-lived access token that
/// gives your application permission to access ready-to-use services, such as
/// basemap layers, geocoding, and routing, in ArcGIS.
///
/// It is important to treat client secret as you would your password. You must
/// keep it confidential and we recommended not storing in your application.
final class OAuthApplicationCredential extends ArcGISCredential {
  static OAuthApplicationCredential? _fromHandle(
      RT_OAuthApplicationCredentialHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OAuthApplicationCredential._withHandle(handle);
  }

  OAuthApplicationCredential._withHandle(super.handle)
      : _portalUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthApplicationCredential_getPortalURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        super._withHandle();

  /// A unique identifier associated with an application registered with the
  /// portal that assists with client/server OAuth authentication.
  String get clientId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationCredential_getClientId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The URL of the portal to authenticate with.
  Uri get portalUri => _portalUri.value;

  final Memoized<Uri> _portalUri;

  /// The length of time a token credential remains valid. Represented in
  /// minutes. If not explicitly set, the server default is used.
  ///
  /// If unspecified, the server returns a token with an expiration interval of
  /// 120 minutes (2 hours). The server default for the maximum allowed
  /// expiration time is 20160 minutes (14 days), but this value can be
  /// configured on the server.
  int get tokenExpirationInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthApplicationCredential_getTokenExpirationInterval(
              _handle, errorHandler);
    });
  }

  /// Creates an [OAuthApplicationCredential] with information needed to access
  /// an ArcGIS resource.
  ///
  /// Parameters:
  /// - `portalUri` — The URL of the portal to authenticate with.
  /// - `clientId` — A unique identifier associated with an application
  /// registered with the portal that assists with client/server OAuth
  /// authentication.
  /// - `clientSecret` — A private key that verifies the application is
  /// authorized to access the registered service.
  /// - `tokenExpirationInterval` — The duration the token will remain valid,
  /// represented in minutes. The value must be greater than 0, otherwise the
  /// server default is used.
  ///
  /// Return Value: Returns an [OAuthApplicationCredential].
  static Future<OAuthApplicationCredential> create(
      {required Uri portalUri,
      required String clientId,
      required String clientSecret,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePortalUri = _CString(portalUri.toString());
    final coreClientId = _CString(clientId);
    final coreClientSecret = _CString(clientSecret);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationCredential_createAsync(
          corePortalUri.bytes,
          coreClientId.bytes,
          coreClientSecret.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOAuthApplicationCredential()!);
  }

  /// Cancelable version of [create]. See that method for more information.
  static CancelableOperation<OAuthApplicationCredential> createCancelable(
      {required Uri portalUri,
      required String clientId,
      required String clientSecret,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePortalUri = _CString(portalUri.toString());
    final coreClientId = _CString(clientId);
    final coreClientSecret = _CString(clientSecret);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationCredential_createAsync(
          corePortalUri.bytes,
          coreClientId.bytes,
          coreClientSecret.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOAuthApplicationCredential()!);
  }

  /// Returns an instance of [OAuthApplicationTokenInfo] generated by this
  /// credential.
  ///
  /// Expired tokens are automatically regenerated while credentials remain
  /// valid.
  ///
  /// Return Value: Returns the non-expired OAuth application token information
  /// generated by this credential.
  Future<OAuthApplicationTokenInfo> getTokenInfo() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOAuthApplicationTokenInfo()!);
  }

  /// Cancelable version of [getTokenInfo]. See that method for more
  /// information.
  CancelableOperation<OAuthApplicationTokenInfo> getTokenInfoCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOAuthApplicationTokenInfo()!);
  }
}

/// The OAuth application token information that can be used to access
/// ready-to-use services, such as basemap layers, geocoding, and routing.
final class OAuthApplicationTokenInfo implements ffi.Finalizable {
  final RT_OAuthApplicationTokenInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OAuthApplicationTokenInfo_destroy.cast());

  static OAuthApplicationTokenInfo? _fromHandle(
      RT_OAuthApplicationTokenInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OAuthApplicationTokenInfo._withHandle(handle);
  }

  OAuthApplicationTokenInfo._withHandle(
      RT_OAuthApplicationTokenInfoHandle handle)
      : _expirationDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthApplicationTokenInfo_getExpirationDate(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OAuthApplicationTokenInfo_created(_handle);
    }
  }

  /// The access token to be used to make an authenticated request.
  String get accessToken {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationTokenInfo_getAccessToken(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The access token expiration date.
  DateTime get expirationDate => _expirationDate.value;

  final Memoized<DateTime> _expirationDate;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OAuthApplicationTokenInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationTokenInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthApplicationTokenInfo_hash(
          _handle, errorHandler);
    });
  }
}

/// The OAuth user configuration information used by an [OAuthUserCredential].
///
/// * The portal URL, client ID, and redirect URL are required to create an
/// OAuth user credential. See
/// [register your application](https://developers.arcgis.com/documentation/mapping-apis-and-services/security/tutorials/register-your-application/)
/// and
/// [add a redirect URI](https://developers.arcgis.com/documentation/mapping-apis-and-services/security/tutorials/add-redirect-uri/)
/// for getting the client ID and redirect URL.
/// * Use refresh token expiration and exchange intervals to configure the
/// lifetime of an OAuth user credential.
/// * Use show cancel button, user interface style, etc. to configure the look
/// and feel of the OAuth login page displayed by an OAuth user credential.
final class OAuthUserConfiguration
    with JsonSerializable
    implements ffi.Finalizable {
  final RT_OAuthUserConfigurationHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OAuthUserConfiguration_destroy.cast());

  static OAuthUserConfiguration? _fromHandle(
      RT_OAuthUserConfigurationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OAuthUserConfiguration._withHandle(handle);
  }

  OAuthUserConfiguration._withHandle(RT_OAuthUserConfigurationHandle handle)
      : _portalUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserConfiguration_getPortalURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _redirectUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserConfiguration_getRedirectURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OAuthUserConfiguration_created(_handle);
    }
  }

  /// Creates an OAuth configuration with the specified parameters.
  ///
  /// Parameters:
  /// - `portalUri` — The URL of the portal to authenticate with.
  /// - `clientId` — A unique identifier associated with an application
  /// registered with the portal that assists with client/server OAuth
  /// authentication.
  /// - `redirectUri` — The URL that the OAuth login page redirects to when
  /// authentication completes.
  /// - `culture` — The OAuth login page is displayed in the language specified
  /// by the given culture code.
  /// - `refreshTokenExpirationInterval` — The requested expiration interval (in
  /// minutes) for the refreshToken generated by the OAuth request. The max
  /// interval can be overridden by the portal administrator.
  /// - `refreshTokenExchangeInterval` — The requested exchange interval (in
  /// minutes) for the OAuth refresh token. Use this to exchange a refresh token
  /// before it expires. This will limit the number of times a user will have to
  /// login because of expiring tokens.
  /// - `federatedTokenExpirationInterval` — The requested expiration interval
  /// (in minutes) for federated tokens generated using the OAuth credential.
  /// - `showCancelButton` — A Boolean value indicating whether to show "Cancel"
  /// button on the OAuth login page.
  /// - `userInterfaceStyle` — Constants indicating the interface style for the
  /// OAuth login page.
  /// - `preferPrivateWebBrowserSession` — A Boolean value indicating whether
  /// the OAuth login session should ask the browser for a private
  /// authentication session.
  factory OAuthUserConfiguration(
      {required Uri portalUri,
      required String clientId,
      required Uri redirectUri,
      String culture = '',
      int refreshTokenExpirationInterval = 0,
      int refreshTokenExchangeInterval = 0,
      int federatedTokenExpirationInterval = 0,
      bool showCancelButton = true,
      UserInterfaceStyle userInterfaceStyle = UserInterfaceStyle.unspecified,
      bool preferPrivateWebBrowserSession = false}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePortalUri = _CString(portalUri.toString());
    final coreClientId = _CString(clientId);
    final coreRedirectUri = _CString(redirectUri.toString());
    final coreCulture = _CString(culture);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_create(
          corePortalUri.bytes,
          coreClientId.bytes,
          coreRedirectUri.bytes,
          coreCulture.bytes,
          refreshTokenExpirationInterval,
          refreshTokenExchangeInterval,
          federatedTokenExpirationInterval,
          showCancelButton,
          userInterfaceStyle.coreValue,
          preferPrivateWebBrowserSession,
          errorHandler);
    });
    final OAuthUserConfiguration object =
        OAuthUserConfiguration._withHandle(handle);
    object._portalUri.cache(portalUri);
    object._redirectUri.cache(redirectUri);
    return object;
  }

  /// A unique identifier associated with an application registered with the
  /// portal that assists with client/server OAuth authentication.
  String get clientId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_getClientId(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The OAuth login page is displayed in the language specified by the given
  /// culture code.
  ///
  /// If not explicitly set, the culture used by the device/machine is used. If
  /// the culture is not supported by the portal then OAuth login page will be
  /// displayed in the language corresponding to culture specified in the
  /// portal/organization settings. The format for culture code is based on a
  /// language code and a country code separated by a dash. Example: "en-US".
  String get culture {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_getCulture(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The requested expiration interval (in minutes) for federated tokens
  /// generated using the OAuth credential.
  int get federatedTokenExpirationInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthUserConfiguration_getFederatedTokenExpirationInterval(
              _handle, errorHandler);
    });
  }

  /// The URL of the portal to authenticate with.
  Uri get portalUri => _portalUri.value;

  final Memoized<Uri> _portalUri;

  /// A Boolean value indicating whether the OAuth login session should ask the
  /// browser for a private authentication session.
  bool get preferPrivateWebBrowserSession {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthUserConfiguration_getPreferPrivateWebBrowserSession(
              _handle, errorHandler);
    });
  }

  /// The URL that the OAuth login page will redirect to when authentication
  /// completes.
  Uri get redirectUri => _redirectUri.value;

  final Memoized<Uri> _redirectUri;

  /// The requested exchange interval (in minutes) for the OAuth refresh token.
  /// Use this to exchange a refresh token before it expires. This will limit
  /// the number of times a user will have to login because of expiring tokens.
  ///
  /// If the exchange interval is set to 0 or less than 0, then the refresh
  /// token will never be exchanged and will eventually expire, causing the user
  /// to have to log in again.
  ///
  /// To have any affect, this should be set to a value less than the
  /// [OAuthUserConfiguration.refreshTokenExpirationInterval]. Setting it to a
  /// value greater than the
  /// [OAuthUserConfiguration.refreshTokenExpirationInterval] will have the same
  /// effect as setting this to 0.
  ///
  /// It is recommended to keep this interval as low as possible because long
  /// lived refresh tokens may increase the security risk.
  int get refreshTokenExchangeInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthUserConfiguration_getRefreshTokenExchangeInterval(
              _handle, errorHandler);
    });
  }

  /// The requested expiration interval (in minutes) for the refreshToken
  /// generated by the OAuth request. Set this to `-1` for getting the maximum
  /// refresh token supported by the portal (ninety days). The max interval can
  /// be overridden by the portal administrator.
  ///
  /// If this is not set, then the refresh token is valid for two weeks.
  int get refreshTokenExpirationInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthUserConfiguration_getRefreshTokenExpirationInterval(
              _handle, errorHandler);
    });
  }

  /// A Boolean value indicating whether to show the "Cancel" button on the
  /// OAuth login page.
  bool get showCancelButton {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_getShowCancelButton(
          _handle, errorHandler);
    });
  }

  /// Constants indicating the interface style for the OAuth login page.
  ///
  /// The default is [UserInterfaceStyle.unspecified].
  UserInterfaceStyle get userInterfaceStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_getUserInterfaceStyle(
          _handle, errorHandler);
    });
    return UserInterfaceStyle._fromCoreValue(coreValue);
  }

  /// Checks if this configuration can be used for the given URL.
  ///
  /// Parameters:
  /// - `uri` — The URL to check.
  ///
  /// Return Value: True if this configuration can be used, otherwise false.
  bool canBeUsedForUri(Uri uri) {
    final coreURI = _CString(uri.toString());
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_canBeUsedForURL(
          _handle, coreURI.bytes, errorHandler);
    });
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_toJSON(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory OAuthUserConfiguration.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_OAuthUserConfiguration_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return OAuthUserConfiguration._fromHandle(objectHandle)!;
  }

  factory OAuthUserConfiguration.fromJson(Map<String, dynamic> json) {
    return OAuthUserConfiguration.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OAuthUserConfiguration) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserConfiguration_hash(_handle, errorHandler);
    });
  }
}

/// A credential for accessing OAuth token secured ArcGIS resources.
final class OAuthUserCredential extends ArcGISCredential {
  static OAuthUserCredential? _fromHandle(RT_OAuthUserCredentialHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OAuthUserCredential._withHandle(handle);
  }

  OAuthUserCredential._withHandle(super.handle)
      : _configuration = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserCredential_getConfiguration(
                handle, errorHandler);
          });
          return OAuthUserConfiguration._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// An authorization code to generate the OAuth token.
  String get authorizationCode {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_getAuthorizationCode(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The OAuth configuration details of an application that can sign into an
  /// ArcGIS Online or ArcGIS Enterprise portal using OAuth.
  OAuthUserConfiguration get configuration => _configuration.value;

  final Memoized<OAuthUserConfiguration> _configuration;

  /// Creates an [OAuthUserCredential] with information needed to access an
  /// ArcGIS resource. This initiates the OAuth login process by presenting the
  /// OAuth login page.
  ///
  /// Parameters:
  /// - `configuration` — The OAuth configuration details of an application that
  /// can sign into an ArcGIS Online or ArcGIS Enterprise portal using OAuth.
  ///
  /// Return Value: Returns an [OAuthUserCredential].
  static Future<OAuthUserCredential> create(
      {required OAuthUserConfiguration configuration}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_createAsync(
          configuration._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOAuthUserCredential()!);
  }

  /// Cancelable version of [create]. See that method for more information.
  static CancelableOperation<OAuthUserCredential> createCancelable(
      {required OAuthUserConfiguration configuration}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_createAsync(
          configuration._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOAuthUserCredential()!);
  }

  /// Creates an [OAuthUserCredential] with information needed to access an
  /// ArcGIS resource. This initiates the OAuth login process by presenting the
  /// OAuth login page.
  ///
  /// Parameters:
  /// - `configuration` — The OAuth configuration details of an application that
  /// can sign into an ArcGIS Online or ArcGIS Enterprise portal using OAuth.
  /// - `loginContext` — A client reference to the context for the platform
  /// specific OAuth login.
  ///
  /// Return Value: Returns an [OAuthUserCredential].
  static Future<OAuthUserCredential> _createWithLoginContext(
      {required OAuthUserConfiguration configuration,
      required _ClientReference loginContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_createWithLoginContextAsync(
          configuration._handle, loginContext._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOAuthUserCredential()!);
  }

  /// Cancelable version of [_createWithLoginContext]. See that method for more
  /// information.
  static CancelableOperation<OAuthUserCredential>
      _createWithLoginContextCancelable(
          {required OAuthUserConfiguration configuration,
          required _ClientReference loginContext}) {
    _initializeArcGISEnvironmentIfNeeded();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_createWithLoginContextAsync(
          configuration._handle, loginContext._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOAuthUserCredential()!);
  }

  /// Returns an instance of [OAuthUserTokenInfo] generated by this credential.
  ///
  /// If the access token has expired, this method regenerates it. If the
  /// [OAuthUserConfiguration.refreshTokenExchangeInterval] is set, this method
  /// exchanges the refresh token at specified interval. While regenerating the
  /// access token or exchanging the refresh token, if the refresh token is
  /// expired, an invalid token error is returned.
  ///
  /// Return Value: Returns the non-expired OAuth token information generated by
  /// this credential.
  Future<OAuthUserTokenInfo> getTokenInfo() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOAuthUserTokenInfo()!);
  }

  /// Cancelable version of [getTokenInfo]. See that method for more
  /// information.
  CancelableOperation<OAuthUserTokenInfo> getTokenInfoCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOAuthUserTokenInfo()!);
  }

  /// Sends a network request to revoke OAuth refresh and access tokens.
  ///
  /// This call will fail if the tokens have not been successfully revoked.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> revokeToken() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_revokeTokenAsync(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [revokeToken]. See that method for more information.
  CancelableOperation<void> revokeTokenCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserCredential_revokeTokenAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }
}

/// An object to represent an OAuth user login prompt.
final class _OAuthUserLoginPrompt implements ffi.Finalizable {
  final RT_OAuthUserLoginPromptHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OAuthUserLoginPrompt_destroy.cast());

  static _OAuthUserLoginPrompt? _fromHandle(
      RT_OAuthUserLoginPromptHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _OAuthUserLoginPrompt._withHandle(handle);
  }

  _OAuthUserLoginPrompt._withHandle(RT_OAuthUserLoginPromptHandle handle)
      : _authorizeUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserLoginPrompt_getAuthorizeURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _context = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserLoginPrompt_getContext(
                handle, errorHandler);
          });
          return _ClientReference._fromHandle(objectHandle);
        }),
        _redirectUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserLoginPrompt_getRedirectURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OAuthUserLoginPrompt_created(_handle);
    }
  }

  /// The URL pointing to the OAuth user login webpage.
  Uri get authorizeUri => _authorizeUri.value;

  final Memoized<Uri> _authorizeUri;

  /// A client reference to the context for the platform specific OAuth login.
  _ClientReference? get context => _context.value;

  final Memoized<_ClientReference?> _context;

  /// A Boolean value indicating whether the session should ask the browser for
  /// a private authentication session.
  bool get preferPrivateWebBrowserSession {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OAuthUserLoginPrompt_getPreferPrivateWebBrowserSession(
              _handle, errorHandler);
    });
  }

  /// The URL that the app redirects to after login completes.
  Uri get redirectUri => _redirectUri.value;

  final Memoized<Uri> _redirectUri;

  /// Call this method to return the response URL after OAuth user login.
  ///
  /// Parameters:
  /// - `uri` — The response URL returned after OAuth user login.
  void respond({required Uri uri}) {
    final coreURI = _CString(uri.toString());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OAuthUserLoginPrompt_respond(
          _handle, coreURI.bytes, errorHandler);
    });
  }

  /// Call this method to return any errors after OAuth user login.
  ///
  /// Parameters:
  /// - `platformApiError` — The error received by the platform API.
  void respondWithError({required _ClientReference platformApiError}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OAuthUserLoginPrompt_respondWithError(
          _handle, platformApiError._handle, errorHandler);
    });
  }
}

/// The OAuth user token information that can be used by clients in exchange for
/// user credentials.
final class OAuthUserTokenInfo implements ffi.Finalizable {
  final RT_OAuthUserTokenInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OAuthUserTokenInfo_destroy.cast());

  static OAuthUserTokenInfo? _fromHandle(RT_OAuthUserTokenInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OAuthUserTokenInfo._withHandle(handle);
  }

  OAuthUserTokenInfo._withHandle(RT_OAuthUserTokenInfoHandle handle)
      : _expirationDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OAuthUserTokenInfo_getExpirationDate(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _refreshTokenExchangeDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_OAuthUserTokenInfo_getRefreshTokenExchangeDate(
                    handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _refreshTokenExpirationDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_OAuthUserTokenInfo_getRefreshTokenExpirationDate(
                    handle, errorHandler);
          });
          return dateTimeHandle.toDateTime();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OAuthUserTokenInfo_created(_handle);
    }
  }

  /// The access token to be used to make an authenticated request.
  String get accessToken {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserTokenInfo_getAccessToken(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The access token expiration date.
  DateTime get expirationDate => _expirationDate.value;

  final Memoized<DateTime> _expirationDate;

  /// A Boolean value indicating whether the token must be passed over HTTPS.
  bool get isSslRequired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserTokenInfo_getIsSSLRequired(
          _handle, errorHandler);
    });
  }

  /// The refresh token to be used to refresh the access token.
  String get refreshToken {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserTokenInfo_getRefreshToken(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The date that the refresh token should be exchanged.
  DateTime? get refreshTokenExchangeDate => _refreshTokenExchangeDate.value;

  final Memoized<DateTime?> _refreshTokenExchangeDate;

  /// The date that the refresh token expires.
  ///
  /// This is available only for ArcGIS.com and ArcGIS Enterprise version 10.9.1
  /// and above.
  DateTime? get refreshTokenExpirationDate => _refreshTokenExpirationDate.value;

  final Memoized<DateTime?> _refreshTokenExpirationDate;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OAuthUserTokenInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserTokenInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OAuthUserTokenInfo_hash(_handle, errorHandler);
    });
  }
}

/// An object that represents an inquiry of whether a portal is network secured.
final class _PortalNetworkSecuredInquiry implements ffi.Finalizable {
  final RT_PortalNetworkSecuredInquiryHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.PortalNetworkSecuredInquiry_destroy.cast());

  static _PortalNetworkSecuredInquiry? _fromHandle(
      RT_PortalNetworkSecuredInquiryHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _PortalNetworkSecuredInquiry._withHandle(handle);
  }

  _PortalNetworkSecuredInquiry._withHandle(
      RT_PortalNetworkSecuredInquiryHandle handle)
      : _portalUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PortalNetworkSecuredInquiry_getPortalURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PortalNetworkSecuredInquiry_created(_handle);
    }
  }

  /// The URL of the portal to check.
  Uri get portalUri => _portalUri.value;

  final Memoized<Uri> _portalUri;

  /// Handles the inquiry that indicates if the portal is network secured.
  ///
  /// Parameters:
  /// - `isPortalNetworkSecured` — Flag that indicates if the portal is network
  /// secured.
  void respond({required bool isPortalNetworkSecured}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PortalNetworkSecuredInquiry_respond(
          _handle, isPortalNetworkSecured, errorHandler);
    });
  }
}

/// A credential used to access token-secured ArcGIS resources using a token
/// that is generated outside of your application.
final class PregeneratedTokenCredential extends ArcGISCredential {
  static PregeneratedTokenCredential? _fromHandle(
      RT_PregeneratedTokenCredentialHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PregeneratedTokenCredential._withHandle(handle);
  }

  PregeneratedTokenCredential._withHandle(super.handle)
      : _tokenInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PregeneratedTokenCredential_getTokenInfo(
                handle, errorHandler);
          });
          return TokenInfo._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// Creates an instance of a [PregeneratedTokenCredential].
  ///
  /// Parameters:
  /// - `uri` — The URL of the token-secured resource.
  /// - `tokenInfo` — The [TokenInfo] used to access secured resources.
  /// - `referer` — The referer that was used to generate the [TokenInfo].
  factory PregeneratedTokenCredential(
      {required Uri uri,
      required TokenInfo tokenInfo,
      required String referer}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final coreReferer = _CString(referer);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PregeneratedTokenCredential_create(
          coreURI.bytes, tokenInfo._handle, coreReferer.bytes, errorHandler);
    });
    final PregeneratedTokenCredential object =
        PregeneratedTokenCredential._withHandle(handle);
    object._tokenInfo.cache(tokenInfo);
    return object;
  }

  /// Gets the [TokenInfo] used to create the credential.
  TokenInfo get tokenInfo => _tokenInfo.value;

  final Memoized<TokenInfo> _tokenInfo;
}

/// A credential used to access token-secured ArcGIS resources.
final class TokenCredential extends ArcGISCredential {
  static TokenCredential? _fromHandle(RT_TokenCredentialHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TokenCredential._withHandle(handle);
  }

  TokenCredential._withHandle(super.handle) : super._withHandle();

  /// The length of time a token credential remains valid. Represented in
  /// minutes. If not explicitly set, the server default is used.
  ///
  /// If unspecified, the server returns a token with an expiration interval of
  /// 120 minutes (2 hours). The server default for the maximum allowed
  /// expiration time is 21600 minutes (15 days), but this value can be
  /// configured on the server.
  int get tokenExpirationInterval {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_getTokenExpirationInterval(
          _handle, errorHandler);
    });
  }

  /// Creates a [TokenCredential] with information needed to access an ArcGIS
  /// resource.
  ///
  /// Parameters:
  /// - `uri` — The URL of the token-secured resource.
  /// - `username` — The username used to access the secured resource or
  /// retrieve a token.
  /// - `password` — The password used to access the secured resource or
  /// retrieve a token.
  /// - `tokenExpirationInterval` — The duration the token will remain valid,
  /// represented in minutes. The value must be greater than 0, otherwise the
  /// server default is used.
  ///
  /// Return Value: Returns a [TokenCredential].
  static Future<TokenCredential> create(
      {required Uri uri,
      required String username,
      required String password,
      int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _create(
        uri: uri,
        username: username,
        password: password,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  /// Cancelable version of [create]. See that method for more information.
  static Future<CancelableOperation<TokenCredential>> createCancelable(
      {required Uri uri,
      required String username,
      required String password,
      int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _createCancelable(
        uri: uri,
        username: username,
        password: password,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  static Future<TokenCredential> _create(
      {required Uri uri,
      required String username,
      required String password,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final coreUsername = _CString(username);
    final corePassword = _CString(password);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createAsync(
          coreURI.bytes,
          coreUsername.bytes,
          corePassword.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsTokenCredential()!);
  }

  static CancelableOperation<TokenCredential> _createCancelable(
      {required Uri uri,
      required String username,
      required String password,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final coreUsername = _CString(username);
    final corePassword = _CString(password);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createAsync(
          coreURI.bytes,
          coreUsername.bytes,
          corePassword.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsTokenCredential()!);
  }

  /// Creates a [TokenCredential] with information needed to access an ArcGIS
  /// resource.
  ///
  /// If the required network credential is not available in the network
  /// credential store, a network authentication challenge is expected to be
  /// issued.
  ///
  /// Parameters:
  /// - `uri` — The URL of the network secured resource.
  /// - `username` — The username used to access the secured resource or
  /// retrieve a token.
  /// - `tokenExpirationInterval` — The duration the token will remain valid,
  /// represented in minutes. The value must be greater than 0, otherwise the
  /// server default is used.
  ///
  /// Return Value: Returns a [TokenCredential].
  static Future<TokenCredential> createNetworkSecured(
      {required Uri uri,
      required String username,
      int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _createNetworkSecured(
        uri: uri,
        username: username,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  /// Cancelable version of [createNetworkSecured]. See that method for more
  /// information.
  static Future<CancelableOperation<TokenCredential>>
      createNetworkSecuredCancelable(
          {required Uri uri,
          required String username,
          int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _createNetworkSecuredCancelable(
        uri: uri,
        username: username,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  static Future<TokenCredential> _createNetworkSecured(
      {required Uri uri,
      required String username,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final coreUsername = _CString(username);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createNetworkSecuredAsync(
          coreURI.bytes,
          coreUsername.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsTokenCredential()!);
  }

  static CancelableOperation<TokenCredential> _createNetworkSecuredCancelable(
      {required Uri uri,
      required String username,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final coreUsername = _CString(username);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createNetworkSecuredAsync(
          coreURI.bytes,
          coreUsername.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsTokenCredential()!);
  }

  /// Creates a [TokenCredential] with information needed to access an ArcGIS
  /// resource.
  ///
  /// Parameters:
  /// - `challenge` — An [ArcGISAuthenticationChallenge] object from which to
  /// construct the [TokenCredential].
  /// - `username` — The username used to access the secured resource or
  /// retrieve a token.
  /// - `password` — The password used to access the secured resource or
  /// retrieve a token.
  /// - `tokenExpirationInterval` — The duration the token will remain valid,
  /// represented in minutes. The value must be greater than 0, otherwise the
  /// server default is used.
  ///
  /// Return Value: Returns a [TokenCredential].
  static Future<TokenCredential> createWithChallenge(
      ArcGISAuthenticationChallenge challenge,
      {required String username,
      required String password,
      int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _createWithChallenge(challenge,
        username: username,
        password: password,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  /// Cancelable version of [createWithChallenge]. See that method for more
  /// information.
  static Future<CancelableOperation<TokenCredential>>
      createWithChallengeCancelable(ArcGISAuthenticationChallenge challenge,
          {required String username,
          required String password,
          int tokenExpirationInterval = 0}) async {
    await _packageInfoCompleter.future;
    return _createWithChallengeCancelable(challenge,
        username: username,
        password: password,
        tokenExpirationInterval: tokenExpirationInterval);
  }

  static Future<TokenCredential> _createWithChallenge(
      ArcGISAuthenticationChallenge challenge,
      {required String username,
      required String password,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreUsername = _CString(username);
    final corePassword = _CString(password);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createWithChallengeAsync(
          challenge._handle,
          coreUsername.bytes,
          corePassword.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsTokenCredential()!);
  }

  static CancelableOperation<TokenCredential> _createWithChallengeCancelable(
      ArcGISAuthenticationChallenge challenge,
      {required String username,
      required String password,
      int tokenExpirationInterval = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreUsername = _CString(username);
    final corePassword = _CString(password);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_createWithChallengeAsync(
          challenge._handle,
          coreUsername.bytes,
          corePassword.bytes,
          tokenExpirationInterval,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsTokenCredential()!);
  }

  /// Returns an instance of [TokenInfo] generated by this credential.
  ///
  /// If the token has expired, this method regenerates the access token. Token
  /// expiration is based on the [TokenCredential.tokenExpirationInterval].
  ///
  /// Return Value: Returns the non-expired token information generated by this
  /// credential.
  Future<TokenInfo> getTokenInfo() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsTokenInfo()!);
  }

  /// Cancelable version of [getTokenInfo]. See that method for more
  /// information.
  CancelableOperation<TokenInfo> getTokenInfoCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenCredential_getTokenInfoAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsTokenInfo()!);
  }
}

/// The access token information that can be used by clients in exchange for
/// user credentials. The access token represents the authenticated user for a
/// certain amount of time to access API functionality.
final class TokenInfo implements ffi.Finalizable {
  final RT_TokenInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TokenInfo_destroy.cast());

  static TokenInfo? _fromHandle(RT_TokenInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TokenInfo._withHandle(handle);
  }

  TokenInfo._withHandle(RT_TokenInfoHandle handle)
      : _expirationDate = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TokenInfo_getExpirationDate(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TokenInfo_created(_handle);
    }
  }

  /// Creates an instance of token info from given parameters.
  ///
  /// Parameters:
  /// - `accessToken` — The access token string.
  /// - `expirationDate` — The token expiration date.
  /// - `isSslRequired` — A Boolean value that indicates whether the token must
  /// be passed over HTTPS.
  static TokenInfo? create(
      {required String accessToken,
      required DateTime expirationDate,
      required bool isSslRequired}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreAccessToken = _CString(accessToken);
    final coreExpirationDate = expirationDate.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_create(coreAccessToken.bytes,
          coreExpirationDate._handle, isSslRequired, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    final TokenInfo object = TokenInfo._withHandle(handle);
    object._expirationDate.cache(expirationDate);
    return object;
  }

  /// The access token string.
  String get accessToken {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_getAccessToken(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The token expiration date.
  DateTime get expirationDate => _expirationDate.value;

  final Memoized<DateTime> _expirationDate;

  /// A Boolean value that indicates whether the token must be passed over
  /// HTTPS.
  bool get isSslRequired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_getIsSSLRequired(_handle, errorHandler);
    });
  }

  /// Indicates whether or not the access token has expired.
  ///
  /// Return Value: True if the token's expiration date has passed, otherwise
  /// false.
  bool _isExpired() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_isExpired(_handle, errorHandler);
    });
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TokenInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TokenInfo_hash(_handle, errorHandler);
    });
  }
}
