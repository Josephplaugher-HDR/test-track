//
// COPYRIGHT © 2023 Esri
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

part of '../arcgis_maps.dart';

final _callbackRelay = _CallbackRelay();

final _arcGISEnvironmentCallbackReceiver = ArcGISEnvironmentCallbackReceiver();

late final _PlatformHelpersProvider _platformHelpersProvider;
late final _ResourceProvider _resourceProvider;
late final _AuthenticationChallengeQueue _authenticationChallengeQueue;
late final _AuthenticationOAuthHandler
    _authenticationOAuthHandler; // ignore: unused_element

final _packageInfoCompleter = Completer<PackageInfo>();

/// Initializes the ArcGIS environment, if needed.
/// This is called where needed to guarantee that it
/// happens before any user code can call into runtimecore.
final void Function() _initializeArcGISEnvironmentIfNeeded = () {
  final buildLabel = bindings.buildLabel().cast<Utf8>().toDartString();
  if (buildLabel != _correspondingBuildLabel) {
    throw UnsupportedError(
        'Mismatched arcgis_maps_core version - run `dart run arcgis_maps install` to correct');
  }

  // When running unit tests, we need to mock PackageInfo (to avoid loading its plugin)
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    // ignore: invalid_use_of_visible_for_testing_member
    PackageInfo.setMockInitialValues(
      appName: 'arcgis_maps',
      packageName: 'com.esri.arcgis_maps',
      version: '0.0.0',
      buildNumber: '0',
      buildSignature: '',
    );
  }

  // Set the Beta watermark
  runtimecore.RT_ArcGISRuntimeEnvironment_setBetaWatermark(true, ffi.nullptr);

  final userData = _callbackRelay.register(_arcGISEnvironmentCallbackReceiver);

  // no '_withThrowingErrorHandler' until we have set the error callback
  runtimecore.RT_ArcGISRuntimeEnvironment_setErrorCallback(
    bindings.addresses.asyncArcGISRuntimeEnvironmentErrorEvent,
    userData,
    ffi.nullptr,
  );

  // As a side effect of calling setTempDirectory(), runtimecore is initialized by its internal "initialize_()" function.
  // This internal initialization is necessary for async calls built on the pplx mechanism to operate properly.

  final tempDirectory = _CString(Directory.systemTemp.uri.toFilePath());
  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_setTempDirectory(
        tempDirectory.bytes, errorHandler);
  });

  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_disableRequestChaining(
        errorHandler);
  });

  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_setRequestRequiredCallback(
      bindings.addresses.asyncRequestRequestRequiredEvent,
      userData,
      errorHandler,
    );
  });

  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_setClientReferenceReleaseCallback(
      bindings.addresses.asyncClientReferenceReleaseEvent,
      userData,
      errorHandler,
    );
  });

  if (Platform.isIOS || Platform.isMacOS) {
    final bundleDirectory = bindings.BundlePath().cast<Utf8>().toDartString();
    final resourcesSubdirectory = Platform.isIOS
        ? 'Frameworks/Runtimecore.framework'
        : 'Contents/Frameworks/arcgis_maps.framework/Resources';
    final resourcesUri =
        Uri.directory('$bundleDirectory/$resourcesSubdirectory');
    final resourcesCString = _CString(resourcesUri.toFilePath());

    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setResourcesDirectory(
          resourcesCString.bytes, errorHandler);
    });

    final shadersUri = resourcesUri.resolve('Shaders');
    final shadersCString = _CString(shadersUri.toFilePath());

    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setShaderDirectory(
          shadersCString.bytes, errorHandler);
    });
  } else if (Platform.isAndroid) {
    // the APK directory is set in the ArcGISMapsPlugin Kotlin code
    final arcgisAssetsRelativePath = _CString('assets/arcgis_maps');
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setResourcesDirectory(
          arcgisAssetsRelativePath.bytes, errorHandler);
    });
  }

  final _GraphicApiType graphicApiType = () {
    if (Platform.isAndroid) {
      return _GraphicApiType.gles;
    } else if (Platform.isIOS || Platform.isMacOS) {
      return _GraphicApiType.metal;
    } else {
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }
  }();

  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_setGraphicsAPI(
        graphicApiType.coreValue, errorHandler);
  });

  // AuthenticationManager requires special care to set up properly:
  // - We must avoid calling functions that call _initializeArcGISEnvironmentIfNeeded(), to avoid recursion
  // - _onArcGISAuthenticationChallengeIssued and _onPortalNetworkSecuredInquiry must be connected before calling _setAuthenticationManager
  final authenticationManagerHandle =
      runtimecore.RT_AuthenticationManager_create(ffi.nullptr);
  final authenticationManager =
      AuthenticationManager._withHandle(authenticationManagerHandle);
  final authenticationChallengeSubscription = authenticationManager
      ._onArcGISAuthenticationChallengeIssued
      .listen((_) {});
  authenticationManager._onPortalNetworkSecuredInquiry
      .listen((portalNetworkSecuredInquiry) {
    // Ignore network security until we implement it later
    portalNetworkSecuredInquiry.respond(isPortalNetworkSecured: false);
  });
  ArcGISEnvironment._authenticationManager.value = authenticationManager;
  _authenticationChallengeQueue =
      _AuthenticationChallengeQueue(authenticationManager);
  authenticationChallengeSubscription.cancel();
  _authenticationOAuthHandler =
      _AuthenticationOAuthHandler(authenticationManager);

  // PlatformHelpersProvider requires its "Convert" callbacks to be connected before
  // calling _setPlatformHelpersProvider.
  _platformHelpersProvider = _PlatformHelpersProvider._withHandle(
    _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PlatformHelpersProvider_create(errorHandler);
    }),
  );
  _SynchronousResponder.connectPlatformHelpersProvider(
      _platformHelpersProvider, userData);
  _withThrowingErrorHandler((errorHandler) {
    runtimecore.RT_ArcGISRuntimeEnvironment_setPlatformHelpersProvider(
        _platformHelpersProvider._handle, errorHandler);
  });

  _resourceProvider = _ResourceProvider._withHandle(
    _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ResourceProvider_create(errorHandler);
    }),
  );
  _SynchronousResponder.connectResourceProvider(_resourceProvider, userData);

  PackageInfo.fromPlatform().then((packageInfo) {
    ArcGISEnvironment._authenticationManager.value._refererAppId =
        packageInfo.packageName;
    _packageInfoCompleter.complete(packageInfo);
  });

  return () {};
}();

final _userCanceledException = ArcGISException._(
  message: 'User canceled',
  code: ArcGISExceptionType.commonUserCanceled.coreValue,
  domain: _ArcGISExceptionDomain.arcGISRuntime,
);
