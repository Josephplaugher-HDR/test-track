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

part of '../../arcgis_maps.dart';

/// An interface for getting and setting the API key of an object.
///
/// This interface gets and sets the API key generated from your portal.
abstract interface class ApiKeyResource {
  /// The API key allows your app to access ArcGIS location services and private
  /// portal items.
  ///
  /// An API key is a unique long-lived access token that is used to
  /// authenticate and monitor requests to ArcGIS location services and private
  /// portal items. You can create and manage an API key using your portal when
  /// you sign in with an ArcGIS Location Platform account or an ArcGIS Online
  /// account with administrator access or a custom role that has the `Generate
  /// API keys` privilege. To learn how to create and manage API keys, go to the
  /// [Create an API Key](https://developers.arcgis.com/documentation/security-and-authentication/api-key-authentication/tutorials/create-an-api-key/)
  /// tutorial. You must ensure that your API key has the correct privileges to
  /// access secure resources.
  ///
  /// Note: An API key created with a referrer is not supported. If you need
  /// service requests to include the referrer, use the SDK's functionality to
  /// intercept the request and add an HTTP referer header.
  ///
  /// In addition to setting an [ArcGISEnvironment.apiKey] at a global level for
  /// your application, you can set it on any class that implements
  /// [ApiKeyResource]. This overrides the [ArcGISEnvironment.apiKey] and
  /// enables more granular usage telemetry and management of ArcGIS location
  /// resources used by your app.
  ///
  /// Classes that expose an API key property by implementing [ApiKeyResource]
  /// include:
  /// * [Basemap]
  /// * `ArcGISSceneLayer`
  /// * [ArcGISTiledLayer]
  /// * [ArcGISVectorTiledLayer]
  /// * [ServiceFeatureTable]
  /// * [ExportVectorTilesTask]
  /// * [LocatorTask]
  /// * [GeodatabaseSyncTask]
  /// * [ClosestFacilityTask]
  /// * [RouteTask]
  /// * [ServiceAreaTask]
  /// * [ExportTileCacheTask]
  ///
  /// For more information, see
  /// [API key authentication](https://developers.arcgis.com/documentation/security-and-authentication/api-key-authentication/)
  /// and
  /// [Types of authentication](https://developers.arcgis.com/documentation/security-and-authentication/types-of-authentication/).
  String get apiKey;

  set apiKey(String value);
}

/// Provides access to and manipulation of environment settings, such as
/// configurations for the operating environment and licenses for deployment.
abstract final class ArcGISEnvironment {
  /// The API key allows your app to access ArcGIS location services and private
  /// portal items.
  ///
  /// An API key is a unique long-lived access token that is used to
  /// authenticate and monitor requests to ArcGIS Location services and private
  /// portal items. You can create and manage an API key using your portal when
  /// you sign in with an ArcGIS Location Platform account or an ArcGIS Online
  /// account with administrator access or a custom role that has the `Generate
  /// API keys` privilege. To learn how to create and manage API keys, go to the
  /// [Create an API Key](https://developers.arcgis.com/documentation/security-and-authentication/api-key-authentication/tutorials/create-an-api-key/)
  /// tutorial. You must ensure that your API key has the correct privileges to
  /// access secure resources.
  ///
  /// Note: An API key created with a referrer is not supported. If you need
  /// service requests to include the referrer, use the SDK's functionality to
  /// intercept the request and add an HTTP referer header.
  ///
  /// In addition to setting an [ArcGISEnvironment.apiKey] at a global level for
  /// your application, you can set it on any class that implements
  /// [ApiKeyResource]. This overrides the [ArcGISEnvironment.apiKey] and
  /// enables more granular usage telemetry and management of the ArcGIS
  /// location resources used by your app.
  ///
  /// Classes that expose an API key property by implementing [ApiKeyResource]
  /// include:
  /// * [Basemap]
  /// * `ArcGISSceneLayer`
  /// * [ArcGISTiledLayer]
  /// * [ArcGISVectorTiledLayer]
  /// * [ServiceFeatureTable]
  /// * [ExportVectorTilesTask]
  /// * [LocatorTask]
  /// * [GeodatabaseSyncTask]
  /// * [ClosestFacilityTask]
  /// * [RouteTask]
  /// * [ServiceAreaTask]
  /// * [ExportTileCacheTask]
  ///
  /// For more information, see
  /// [API key authentication](https://developers.arcgis.com/documentation/security-and-authentication/api-key-authentication/)
  /// and
  /// [Types of authentication](https://developers.arcgis.com/documentation/security-and-authentication/types-of-authentication/).
  static String get apiKey {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_getAPIKey(errorHandler);
    });
    return stringHandle.toDartString();
  }

  static set apiKey(String value) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setAPIKey(
          coreValue.bytes, errorHandler);
    });
  }

  /// The object responsible for issuing authentication challenges and managing
  /// credential stores.
  static AuthenticationManager get authenticationManager {
    _initializeArcGISEnvironmentIfNeeded();
    return ArcGISEnvironment._authenticationManager.value;
  }

  static void _setAuthenticationManager(
      AuthenticationManager authenticationManager) {
    _initializeArcGISEnvironmentIfNeeded();
    ArcGISEnvironment._authenticationManager.value = authenticationManager;
  }

  static final _authenticationManager = Memoized(getter: () {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_getAuthenticationManager(
          errorHandler);
    });
    return AuthenticationManager._fromHandle(objectHandle)!;
  }, setter: (value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setAuthenticationManager(
          value._handle, errorHandler);
    });
  });

  /// Determines if curve geometries are fetched from and sent to services that
  /// support them.
  ///
  /// By default, this API does not fetch curves in geometries or act as a true
  /// curve client, which means:
  ///
  /// * Densified versions of any curve geometries are fetched from services,
  /// resulting in client-side geometries where [Geometry.hasCurves] is always
  /// false.
  /// * Curve geometries stored in services where
  /// [ArcGISFeatureServiceInfo.onlyAllowTrueCurveUpdatesByTrueCurveClients] is
  /// true cannot be updated.
  ///
  /// If your application preserves curve segments throughout all workflows, set
  /// this property to [ServiceCurveGeometryMode.trueCurveClient], which means:
  ///
  /// * Curve geometries are fetched from services, resulting in client-side
  /// geometries where [Geometry.hasCurves] is true.
  /// * Your app will inform the services that it is a true curve client, and
  /// therefore will be able to update curve geometries stored in services where
  /// [ArcGISFeatureServiceInfo.onlyAllowTrueCurveUpdatesByTrueCurveClients] is
  /// true.
  ///
  /// Ensure that you change this property before any calls to services are
  /// made, as it cannot be changed after the first request has begun. Note that
  /// some geometry operations do not support curve geometries; see
  /// [GeometryEngine] for details of curve support. `GeometryEditor` does not
  /// support curve geometries. It is your responsibility to ensure data
  /// integrity by correctly preserving any curve segments throughout your
  /// application when using [ArcGISEnvironment.serviceCurveGeometryMode].
  ///
  /// For details of curve support in services, see
  /// [ArcGIS REST API documentation](https://developers.arcgis.com/rest/services-reference/enterprise/get-started-with-the-services-directory.htm).
  ///
  /// For services that don't support curves, this value has no effect. It also
  /// has no effect on local data sources that may contain curve geometries,
  /// such as mobile geodatabases or mobile map packages created using ArcGIS
  /// Pro.
  static ServiceCurveGeometryMode get serviceCurveGeometryMode {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISRuntimeEnvironment_getServiceCurveGeometryMode(
              errorHandler);
    });
    return ServiceCurveGeometryMode._fromCoreValue(coreValue);
  }

  static set serviceCurveGeometryMode(ServiceCurveGeometryMode value) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setServiceCurveGeometryMode(
          value.coreValue, errorHandler);
    });
  }

  /// The HTTP Client.
  static final httpClient = ArcGISHttpClient._();

  /// Disables request chaining.
  ///
  /// Request chaining is enabled by default. It should be disabled by clients
  /// that have switched to the global request handler.
  static void _disableRequestChaining() {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_disableRequestChaining(
          errorHandler);
    });
  }

  /// Enables/disables breaking on exceptions.
  ///
  /// Parameters:
  /// - `enable` — true if the runtime should break on an exception, false
  /// otherwise.
  static void _enableBreakOnException({required bool enable}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_enableBreakOnException(
          enable, errorHandler);
    });
  }

  /// Enables/disables memory leak detection.
  ///
  /// Disabling will cause the runtime to dump all of the object instances that
  /// were currently being tracked and it will not track object instances from
  /// the point of disabling. Enabling leak detection will make the runtime
  /// track all object instances allocated from the point of enabling. By
  /// default, leak detection is turned off.
  ///
  /// Parameters:
  /// - `enable` — true if the runtime should be tracking object allocations and
  /// deallocations, false otherwise.
  static void _enableLeakDetection({required bool enable}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_enableLeakDetection(
          enable, errorHandler);
    });
  }

  /// Enables/disables raising assertion.
  ///
  /// This is enabled by default in debug builds and disabled by default in
  /// release builds. If disable abort will not be called.
  ///
  /// Parameters:
  /// - `enable` — true if the runtime should turn assertions on and abort,
  /// false otherwise.
  static void _enableRaiseAssertion({required bool enable}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_enableRaiseAssertion(
          enable, errorHandler);
    });
  }

  /// Enables/disables the assert/abort dialog on Windows Desktop.
  ///
  /// Parameters:
  /// - `enable` — true the assert/abort dialog should appear with abort, break
  /// and continue options. enable false if all asserts and errors should go to
  /// the debug console.
  static void _enableShowAssertDialog({required bool enable}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_enableShowAssertDialog(
          enable, errorHandler);
    });
  }

  /// Forcibly set [ArcGISEnvironment.serviceCurveGeometryMode] after an initial
  /// request has been made.
  ///
  /// An exception is thrown if [ArcGISEnvironment.serviceCurveGeometryMode] is
  /// changed after the first call to a service is made as this could lead to
  /// unexpected behaviors such as exceptions due to unexpected curve
  /// geometries, or data corruption due to unexpected overwriting of curve
  /// geometries with densified geometries.
  ///
  /// By calling this method instead of setting that property, you can forcibly
  /// change the value of [ArcGISEnvironment.serviceCurveGeometryMode] after the
  /// first call to a service is made, without triggering an exception. This
  /// internal method is intended to aid writing and executing tests that rely
  /// on having different values for this property. Do not change this setting
  /// during execution of a test. Doing so can lead to data corruption
  /// (unexpected loss of curve information). This must only be changed during
  /// test setup or teardown.
  ///
  /// Parameters:
  /// - `serviceCurveGeometryMode` — Indicates how curve geometries are fetched
  /// from and sent to services that support them.
  static void _forceServiceCurveGeometryMode(
      {required ServiceCurveGeometryMode serviceCurveGeometryMode}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_forceServiceCurveGeometryMode(
          serviceCurveGeometryMode.coreValue, errorHandler);
    });
  }

  /// Get the path of the directory containing the feature toggle file.
  ///
  /// Returns the path of the directory used to find the feature toggle file
  /// 'arcgis_runtime_feature_set.txt'. This directory is set by calling
  /// [ArcGISEnvironment._setFeatureToggleDirectory]
  ///
  /// Additionally when [ArcGISEnvironment._setInstallDirectory] is called, if
  /// the feature toggle directory has not already been set, then it is set to
  /// the install directory.
  ///
  /// The feature toggle file is plain text. Each line contains the name of a
  /// feature (no spaces) and '=' a boolean value. For example:
  /// <code>
  /// enable_rendering_engine_mr3d=true
  /// </code>
  ///
  /// Return Value: The location of the directory containing the feature toggle
  /// file.
  static Uri _getFeatureToggleDirectory() {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_getFeatureToggleDirectory(
          errorHandler);
    });
    return stringHandle.toFileUri()!;
  }

  /// Get the license details about the application.
  ///
  /// The license details includes the [LicenseStatus], [LicenseLevel], and
  /// [LicenseType] values for the licensed application. It also contains the
  /// expiry date of the license or whether the provided license is perpetual.
  ///
  /// Return Value: The license details about the application.
  static License getLicense() {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_getLicense(errorHandler);
    });
    return License._fromHandle(objectHandle)!;
  }

  /// Get the type of screen coordinates.
  ///
  /// Screen coordinates may be in DIPs or pixels (depending on the platform).
  /// The default is [_ScreenCoordinateType.dips].
  ///
  /// Return Value: Get the type of screen coordinates.
  static _ScreenCoordinateType _getScreenCoordinateType() {
    _initializeArcGISEnvironmentIfNeeded();
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_getScreenCoordinateType(
          errorHandler);
    });
    return _ScreenCoordinateType._fromCoreValue(coreValue);
  }

  /// Indicates if a specified feature is enabled in the feature toggle file.
  ///
  /// If the feature toggle file contains the specified name then toggle value
  /// is returned. Otherwise false is returned where the file or toggle does not
  /// exist. See [ArcGISEnvironment._setFeatureToggleDirectory] and
  /// [ArcGISEnvironment._getFeatureToggleDirectory].
  ///
  /// Parameters:
  /// - `featureToggle` — The name of the feature in the feature toggle file.
  ///
  /// Return Value: The location of the directory containing the feature toggle
  /// file.
  static bool _isFeatureEnabled({required String featureToggle}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFeatureToggle = _CString(featureToggle);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_isFeatureEnabled(
          coreFeatureToggle.bytes, errorHandler);
    });
  }

  /// Set the location of the APK for the Android application.
  ///
  /// This allows core to access file resources stored in the APK, for example:
  /// - DirectX strings in:
  /// <i><b>assets/arcgisruntime/network_analyst/strings.bin</b></i>
  ///
  /// Parameters:
  /// - `apkUri` — The path to the APK for the application.
  static void _setAndroidApkPath({required Uri apkUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreApkUri = _CString(apkUri.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setAndroidAPKPath(
          coreApkUri.bytes, errorHandler);
    });
  }

  /// This will override the license watermark text with the beta text info.
  ///
  /// * 'true' the water mark will always appear even if you set a license
  /// * 'false' (default) the water mark will not appear. The developer license
  /// will appear if a license is not set.
  ///
  /// Parameters:
  /// - `set` — Set to true if you wish the beta watermark to appear, false if
  /// you wish the license level text to appear.
  static void _setBetaWatermark({required bool set}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setBetaWatermark(
          set, errorHandler);
    });
  }

  /// Set a custom path to the EGL library file.
  ///
  /// This is to support a specific use case. The Qt framework supplies both
  /// debug and release versions of the OpenGL libraries. We need to load the
  /// same version that Qt loads. However, we don't want to distribute two
  /// binaries. This allows the Qt API to choose the library path depending on
  /// what is needed. "EGL" sits below OpenGLES, and is needed to load GL
  /// extension functions when using GLES. This should be set once, before the
  /// [_Device] is created. The value is global to the process.
  ///
  /// Parameters:
  /// - `eglLibraryFilename` — A path to a library file on Windows. If the
  /// graphics API is GLES, then this path will be used by HAL to load the
  /// required EGL library.
  static void _setCustomEglLibFilename({required String eglLibraryFilename}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreEglLibraryFilename = _CString(eglLibraryFilename);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setCustomEglLibFilename(
          coreEglLibraryFilename.bytes, errorHandler);
    });
  }

  /// Set a custom path to the OpenGL library file.
  ///
  /// This is to support a specific use case. The Qt framework supplies both
  /// debug and release versions of the OpenGL libraries. We need to load the
  /// same version that Qt loads. However, we don't want to distribute two
  /// binaries. This allows the Qt API to choose the library path depending on
  /// what is needed. This should be set once, before the [_Device] is created.
  /// The value is global to the process.
  ///
  /// Parameters:
  /// - `openglLibraryFilename` — A path to a library file on Windows. If the
  /// graphics API is GLES, then this path will be used by HAL to load the
  /// required OpenGL library (typically something like libGLESv2.dll).
  static void _setCustomOpenglLibFilename(
      {required String openglLibraryFilename}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreOpenglLibraryFilename = _CString(openglLibraryFilename);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setCustomOpenglLibFilename(
          coreOpenglLibraryFilename.bytes, errorHandler);
    });
  }

  /// Sets the location of the directory containing the feature toggle file and
  /// reads the content of the file.
  ///
  /// Sets the directory containing the feature toggle file
  /// 'arcgis_runtime_feature_set.txt'. If the file exists it will be read into
  /// memory. If the file is not formatted an error is returned, for example if
  /// a toggle is missing an '='. The feature toggles are used to enable or
  /// disable features that are tested [ArcGISEnvironment._isFeatureEnabled].
  ///
  /// If the directory or file does not exist, no error is returned and tests
  /// for features will return false. This function should be called once at the
  /// start of runtime initialization.
  ///
  /// Additionally when [ArcGISEnvironment._setInstallDirectory] is called, if
  /// the feature toggle directory has not already been set, then it is set to
  /// the install directory.
  ///
  /// The feature toggle file is plain text. Each line contains the name of a
  /// feature (no spaces) and '=' a boolean value. For example:
  /// <code>
  /// enable_rendering_engine_mr3d=true
  /// </code>
  ///
  /// Parameters:
  /// - `featureToggleDirectory` — The path to the directory containing the
  /// feature toggle file.
  static void _setFeatureToggleDirectory(Uri featureToggleDirectory) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFeatureToggleDirectory =
        _CString(featureToggleDirectory.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setFeatureToggleDirectory(
          coreFeatureToggleDirectory.bytes, errorHandler);
    });
  }

  /// Set the graphics API to be used.
  ///
  /// This is used to set the graphics API for the lifetime of the application.
  /// It cannot be changed once set.
  ///
  /// Parameters:
  /// - `type` — The graphics API to be used.
  static void _setGraphicsApi({required _GraphicApiType type}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setGraphicsAPI(
          type.coreValue, errorHandler);
    });
  }

  /// Set the location of the root folder for the deployment resources.
  ///
  /// This is used for the default location to find file resources as follows:
  /// - DirectX shaders default location.
  /// - <i><b>install_path</b></i>/resources/shaders
  /// - military dictionary symbol style default location
  /// - <i><b>install_path</b></i>/resources/symbols/mil2525c
  /// - navigation localized resources
  /// - <i><b>install_path</b></i>/resources/navigation
  ///
  /// Parameters:
  /// - `installUri` — The path to the root folder of the deployment.
  static void _setInstallDirectory({required Uri installUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreInstallUri = _CString(installUri.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setInstallDirectory(
          coreInstallUri.bytes, errorHandler);
    });
  }

  /// License an application for deployment using license info.
  ///
  /// License an application for deployment using a license info for named-user
  /// access. A license info instance can be obtained from a portal for the
  /// current logged in user. The license info instance is only valid for 30
  /// days so the user will be required to log into the portal again when this
  /// expires.
  ///
  /// Parameters:
  /// - `licenseInfo` — The [LicenseInfo] used for named-user access.
  ///
  /// Return Value: The [LicenseResult] of the main license attempting to be
  /// set.
  static LicenseResult setLicenseUsingInfo(LicenseInfo licenseInfo) {
    ArcGISHttpClient._userAgent = null;
    return _setLicenseUsingInfo(licenseInfo);
  }

  static LicenseResult _setLicenseUsingInfo(LicenseInfo licenseInfo) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_setLicenseInfo(
          licenseInfo._handle, errorHandler);
    });
    return LicenseResult._fromHandle(objectHandle)!;
  }

  /// License an application for deployment using an ESRI license string and
  /// extension license strings.
  ///
  /// License an application for deployment using an ESRI license string and one
  /// or more extension license strings.
  ///
  /// Parameters:
  /// - `licenseKey` — The lite, basic, standard, or advanced ESRI license
  /// string.
  /// - `extensions` — A [List] of extension license strings.
  ///
  /// Return Value: The [LicenseResult] of the main license attempting to be
  /// set.
  static LicenseResult setLicenseUsingKey(String licenseKey,
      {List<String> extensions = const []}) {
    ArcGISHttpClient._userAgent = null;
    return _setLicenseUsingKey(licenseKey, extensions: extensions);
  }

  static LicenseResult _setLicenseUsingKey(String licenseKey,
      {List<String> extensions = const []}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreLicenseKey = _CString(licenseKey);
    final coreExtensions =
        extensions.toMutableArray(valueType: _ElementType.string);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISRuntimeEnvironment_setLicenseWithExtensions(
          coreLicenseKey.bytes, coreExtensions._handle, errorHandler);
    });
    return LicenseResult._fromHandle(objectHandle)!;
  }

  /// Set platform helpers provider to the runtime environment.
  ///
  /// Platform helpers provider is used to provide access to features related to
  /// platform locale and platform peculiarities, like date/time formatting.
  /// After creating [_PlatformHelpersProvider], connect delegates for:
  /// `PlatformHelpersProvider.applicationLocale`
  /// `PlatformHelpersProvider.convertDateTime`
  /// `PlatformHelpersProvider.convertNumber` Then set the provider to the
  /// runtime environment.
  ///
  /// Parameters:
  /// - `platformHelpersProvider` — The [_PlatformHelpersProvider] with
  /// connected delegates.
  static void _setPlatformHelpersProvider(
      _PlatformHelpersProvider platformHelpersProvider) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setPlatformHelpersProvider(
          platformHelpersProvider._handle, errorHandler);
    });
  }

  /// Sets the resources directory for the process.
  ///
  /// If not set, it will default to "<install_directory>\resources\".
  ///
  /// Parameters:
  /// - `resourcesUri` — Full pathname of the resources directory.
  static void _setResourcesDirectory({required Uri resourcesUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreResourcesUri = _CString(resourcesUri.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setResourcesDirectory(
          coreResourcesUri.bytes, errorHandler);
    });
  }

  /// Set the runtime client type and version.
  ///
  /// This is to support a specific use case. The Unity game engine requires a
  /// different thread pool implementation and this allows to identify the
  /// runtime client and instantiate the right thread pool implementation at
  /// startup. This should be called before the runtime environment is created.
  /// Calling it after that has no effect. The values are global to the process
  /// and default to [_RuntimeClient.none] and an empty string respectively when
  /// not set. Both values are also used to build the user-agent string.
  static void _setRuntimeClient(
      {required _RuntimeClient runtimeClient, required String version}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreVersion = _CString(version);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setRuntimeClient(
          runtimeClient.coreValue, coreVersion.bytes, errorHandler);
    });
  }

  /// Set the type of screen coordinates.
  ///
  /// Screen coordinates may be in DIPs or pixels (depending on the platform).
  /// The default is [_ScreenCoordinateType.dips].
  ///
  /// Parameters:
  /// - `screenCoordType` — The screen coordinate type.
  static void _setScreenCoordinateType(
      {required _ScreenCoordinateType screenCoordType}) {
    _initializeArcGISEnvironmentIfNeeded();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setScreenCoordinateType(
          screenCoordType.coreValue, errorHandler);
    });
  }

  /// Sets the shader directory for the process.
  ///
  /// If not set, it will default to "<install_directory>\resources\shaders\".
  ///
  /// Parameters:
  /// - `shaderUri` — Full pathname of the shader directory.
  static void _setShaderDirectory({required Uri shaderUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreShaderUri = _CString(shaderUri.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setShaderDirectory(
          coreShaderUri.bytes, errorHandler);
    });
  }

  /// Sets the temp directory for the process.
  ///
  /// Parameters:
  /// - `tempUri` — Full pathname of the temporary file.
  static void _setTempDirectory({required Uri tempUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTempUri = _CString(tempUri.toFilePath());
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISRuntimeEnvironment_setTempDirectory(
          coreTempUri.bytes, errorHandler);
    });
  }
}

/// Format of a date/time.
///
/// Controls how a date/time is converted to a string. It is a superset of
/// PopupDateFormat. All provided examples are localized to en-US.
enum _DateTimeFormat {
  /// Example: Dec 30, 1997.
  dayShortMonthYear,

  /// Example: Tuesday, December 30, 1997.
  longDate,

  /// Example: December 30, 1997.
  longMonthDayYear,

  /// Example: December 1997.
  longMonthYear,

  /// Example: 12/30/1997.
  shortDate,

  /// Example: 30/12/1997.
  shortDateLe,

  /// Example: 30/12/1997 5:59:59 PM.
  shortDateLeLongTime,

  /// Example: 30/12/1997 17:59:59.
  shortDateLeLongTime24,

  /// Example: 30/12/1997 6:00 PM.
  shortDateLeShortTime,

  /// Example: 30/12/1997 18:00.
  shortDateLeShortTime24,

  /// Example: 12/30/1997 5:59:59 PM.
  shortDateLongTime,

  /// Example: 12/30/1997 17:59:59.
  shortDateLongTime24,

  /// Example: 12/30/1997 6:00 PM.
  shortDateShortTime,

  /// Example: 12/30/1997 18:00.
  shortDateShortTime24,

  /// Example: Dec 1997.
  shortMonthYear,

  /// Example: 1997.
  year,

  /// Example: 5:32:10 PM.
  longTime,

  /// Example: 5:32 PM.
  shortTime,

  /// Example: Dec 30, 1997, 5:32:10 PM.
  dayShortMonthYearLongTime,

  /// Example: Dec 30, 1997, 17:32:10.
  dayShortMonthYearLongTime24,

  /// Example: Dec 30, 1997, 6:00 PM.
  dayShortMonthYearShortTime,

  /// Example: Dec 30, 1997, 17:32.
  dayShortMonthYearShortTime24,

  /// Example: Tuesday, December 30, 1997, 5:32:10 PM.
  longDateLongTime,

  /// Example: Tuesday, December 30, 1997, 17:32:10.
  longDateLongTime24,

  /// Example: Tuesday, December 30, 1997, 6:00 PM.
  longDateShortTime,

  /// Example: Tuesday, December 30, 1997, 17:32.
  longDateShortTime24,

  /// Example: December 30, 1997, 5:32:10 PM.
  longMonthDayYearLongTime,

  /// Example: December 30, 1997, 17:32:10.
  longMonthDayYearLongTime24,

  /// Example: December 30, 1997, 6:00 PM.
  longMonthDayYearShortTime,

  /// Example: December 30, 1997, 18:00.
  longMonthDayYearShortTime24;

  factory _DateTimeFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return dayShortMonthYear;
      case 1:
        return longDate;
      case 2:
        return longMonthDayYear;
      case 3:
        return longMonthYear;
      case 4:
        return shortDate;
      case 5:
        return shortDateLe;
      case 6:
        return shortDateLeLongTime;
      case 7:
        return shortDateLeLongTime24;
      case 8:
        return shortDateLeShortTime;
      case 9:
        return shortDateLeShortTime24;
      case 10:
        return shortDateLongTime;
      case 11:
        return shortDateLongTime24;
      case 12:
        return shortDateShortTime;
      case 13:
        return shortDateShortTime24;
      case 14:
        return shortMonthYear;
      case 15:
        return year;
      case 16:
        return longTime;
      case 17:
        return shortTime;
      case 18:
        return dayShortMonthYearLongTime;
      case 19:
        return dayShortMonthYearLongTime24;
      case 20:
        return dayShortMonthYearShortTime;
      case 21:
        return dayShortMonthYearShortTime24;
      case 22:
        return longDateLongTime;
      case 23:
        return longDateLongTime24;
      case 24:
        return longDateShortTime;
      case 25:
        return longDateShortTime24;
      case 26:
        return longMonthDayYearLongTime;
      case 27:
        return longMonthDayYearLongTime24;
      case 28:
        return longMonthDayYearShortTime;
      case 29:
        return longMonthDayYearShortTime24;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case dayShortMonthYear:
        return 0;
      case longDate:
        return 1;
      case longMonthDayYear:
        return 2;
      case longMonthYear:
        return 3;
      case shortDate:
        return 4;
      case shortDateLe:
        return 5;
      case shortDateLeLongTime:
        return 6;
      case shortDateLeLongTime24:
        return 7;
      case shortDateLeShortTime:
        return 8;
      case shortDateLeShortTime24:
        return 9;
      case shortDateLongTime:
        return 10;
      case shortDateLongTime24:
        return 11;
      case shortDateShortTime:
        return 12;
      case shortDateShortTime24:
        return 13;
      case shortMonthYear:
        return 14;
      case year:
        return 15;
      case longTime:
        return 16;
      case shortTime:
        return 17;
      case dayShortMonthYearLongTime:
        return 18;
      case dayShortMonthYearLongTime24:
        return 19;
      case dayShortMonthYearShortTime:
        return 20;
      case dayShortMonthYearShortTime24:
        return 21;
      case longDateLongTime:
        return 22;
      case longDateLongTime24:
        return 23;
      case longDateShortTime:
        return 24;
      case longDateShortTime24:
        return 25;
      case longMonthDayYearLongTime:
        return 26;
      case longMonthDayYearLongTime24:
        return 27;
      case longMonthDayYearShortTime:
        return 28;
      case longMonthDayYearShortTime24:
        return 29;
    }
  }
}

/// Details of an extension license.
final class ExtensionLicense implements ffi.Finalizable {
  final RT_ExtensionLicenseHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ExtensionLicense_destroy.cast());

  static ExtensionLicense? _fromHandle(RT_ExtensionLicenseHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ExtensionLicense._withHandle(handle);
  }

  ExtensionLicense._withHandle(RT_ExtensionLicenseHandle handle)
      : _expiry = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ExtensionLicense_getExpiry(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ExtensionLicense_created(_handle);
    }
  }

  /// The date the extension license expires.
  DateTime get expiry => _expiry.value;

  final Memoized<DateTime> _expiry;

  /// True if the extension license is permanent, false otherwise.
  ///
  /// Typically this returns true for a license string with 'none' for the
  /// expiration date field.
  bool get isPermanent {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExtensionLicense_getIsPermanent(
          _handle, errorHandler);
    });
  }

  /// The [LicenseStatus] of the extension license.
  LicenseStatus get licenseStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExtensionLicense_getLicenseStatus(
          _handle, errorHandler);
    });
    return LicenseStatus._fromCoreValue(coreValue);
  }

  /// The name of the extension license.
  ///
  /// This is the name of the extension embedded in the license string.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ExtensionLicense_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// Indicates whether a file path is being serialized or deserialized.
enum _FilePathSerializationParameterDirection {
  /// The file path is being written to JSON.
  toJson,

  /// The file path has been read from JSON.
  fromJson;

  factory _FilePathSerializationParameterDirection._fromCoreValue(
      int coreValue) {
    switch (coreValue) {
      case 0:
        return toJson;
      case 1:
        return fromJson;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case toJson:
        return 0;
      case fromJson:
        return 1;
    }
  }
}

/// Details of license.
///
/// Until an app is licensed, it runs at the Developer license level. All
/// functionality is available, but the map display is watermarked and a message
/// is logged stating that the app is in developer mode.
///
/// A deployed app needs to be run at minimum with the Lite license level to
/// disable the map watermark. The Lite, Basic, Standard, or Advanced license
/// level is set by calling [ArcGISEnvironment.setLicenseUsingKey] with a
/// license string obtained from the ArcGIS for Developers website or Esri
/// Customer Service. With the varying license levels, a subset of functionality
/// is available. Any attempt to use licensed functionality that is not
/// available at the current license level will log or emit error messages.
///
/// To get Lite, Basic, Standard, or Advanced license level functionality, a
/// user app is licensed in one of two ways:
///
/// * With license information retrieved after logging in to a portal (Lite and
/// Basic levels).
/// * With a license string acquired from the ArcGIS for Developers website or
/// Esri Customer Service.
///
/// To license with a license string, call
/// [ArcGISEnvironment.setLicenseUsingKey].
///
/// To validate with information from a portal, you need a [LicenseInfo]
/// instance. You can get one by calling [Portal.fetchLicenseInfo]. Pass the
/// [LicenseInfo] to [ArcGISEnvironment.setLicenseUsingInfo].
///
/// Both of these methods return a [LicenseResult] that reports the status of
/// the license. Note that there is a 30-day timeout when using [LicenseInfo].
/// If the app is licensed using this method, the user must log in to the portal
/// again before licensing the app. When this period has expired, calling
/// [ArcGISEnvironment.setLicenseUsingInfo] returns a [LicenseResult] which
/// contains license status of [LicenseStatus.loginRequired], and the app
/// continues to run at the current license level (default is
/// [LicenseLevel.developer]).
final class License implements ffi.Finalizable {
  final RT_LicenseHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.License_destroy.cast());

  static License? _fromHandle(RT_LicenseHandle handle) {
    if (handle == ffi.nullptr) return null;
    return License._withHandle(handle);
  }

  License._withHandle(RT_LicenseHandle handle)
      : _expiry = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_License_getExpiry(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _extensions = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_License_getExtensions(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.License_created(_handle);
    }
  }

  /// License expiry date and time in UTC.
  ///
  /// This is either the expiry date of a license set with
  /// [ArcGISEnvironment.setLicenseUsingKey] or the portal subscription expiry
  /// when using [ArcGISEnvironment.setLicenseUsingInfo].
  DateTime get expiry => _expiry.value;

  final Memoized<DateTime> _expiry;

  /// The collection of extension licenses for the app.
  ///
  /// For valid extension license keys supplied when calling
  /// [ArcGISEnvironment.setLicenseUsingKey], this collection is populated with
  /// information about the extension licenses. Use this function to iterate
  /// extension licenses available for the app.
  ///
  /// Note that, although this collection is empty when running an app in
  /// developer mode, all extension licensed functionality will be available.
  List<ExtensionLicense> get extensions => _extensions.value;

  final Memoized<_ArrayList<ExtensionLicense>> _extensions;

  /// True if a license is perpetual, false otherwise.
  ///
  /// Typically this returns true for apps licensed with a license string with
  /// 'none' for the expiration date field.
  bool get isPermanent {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_License_getIsPermanent(_handle, errorHandler);
    });
  }

  /// The current license level set in the app. See [LicenseLevel] for available
  /// levels.
  ///
  /// By default, unless a deployment license is provided, apps run with a
  /// [LicenseLevel.developer] license.
  LicenseLevel get licenseLevel {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_License_getLicenseLevel(_handle, errorHandler);
    });
    return LicenseLevel._fromCoreValue(coreValue);
  }

  /// The current license status of the provided license.
  LicenseStatus get licenseStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_License_getLicenseStatus(_handle, errorHandler);
    });
    return LicenseStatus._fromCoreValue(coreValue);
  }

  /// The license type of the current license.
  ///
  /// In developer mode, this function returns [LicenseType.developer].
  /// Otherwise, it can return [LicenseType.namedUser] if the app was licensed
  /// by logging in to a portal and acquiring a [LicenseInfo], or
  /// [LicenseType.licenseKey] if the app was licensed from a license string.
  /// The license type can change while an app runs. For instance, the app may
  /// start running licensed with a Lite license key ([LicenseType.licenseKey])
  /// and later become licensed from [LicenseInfo] ([LicenseType.namedUser]).
  LicenseType get licenseType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_License_getLicenseType(_handle, errorHandler);
    });
    return LicenseType._fromCoreValue(coreValue);
  }
}

/// A class that contains encrypted JSON information pertaining to a licensed
/// named user.
final class LicenseInfo with JsonSerializable implements ffi.Finalizable {
  final RT_LicenseInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LicenseInfo_destroy.cast());

  static LicenseInfo? _fromHandle(RT_LicenseInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LicenseInfo._withHandle(handle);
  }

  LicenseInfo._withHandle(RT_LicenseInfoHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LicenseInfo_created(_handle);
    }
  }

  /// Create a license info with Portal Info JSON.
  ///
  /// Parameters:
  /// - `portalInfoJson` — The JSON string of the Portal Info.
  static LicenseInfo? _withPortalInfo({required String portalInfoJson}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePortalInfoJson = _CString(portalInfoJson);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LicenseInfo_createWithPortalInfo(
          corePortalInfoJson.bytes, errorHandler);
    });
    if (handle == ffi.nullptr) return null;
    return LicenseInfo._withHandle(handle);
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LicenseInfo_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory LicenseInfo.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_LicenseInfo_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return LicenseInfo._fromHandle(objectHandle)!;
  }

  factory LicenseInfo.fromJson(Map<String, dynamic> json) {
    return LicenseInfo.fromJsonString(jsonEncode(json));
  }
}

/// The different license levels.
///
/// Each of different license levels.
enum LicenseLevel {
  /// Application will run in developer mode: full functionality but with a
  /// watermarked view.
  developer,

  /// Lite mode: no watermark and functionality available at the lowest level.
  lite,

  /// Basic mode: no watermark and functionality available at the basic level.
  basic,

  /// Standard mode: no watermark and functionality available at the standard
  /// level.
  standard,

  /// Advanced mode: no watermark and functionality available at the advanced
  /// level.
  advanced;

  factory LicenseLevel._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return developer;
      case 1:
        return lite;
      case 2:
        return basic;
      case 3:
        return standard;
      case 4:
        return advanced;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case developer:
        return 0;
      case lite:
        return 1;
      case basic:
        return 2;
      case standard:
        return 3;
      case advanced:
        return 4;
    }
  }
}

/// The status of the license and any extension licenses.
final class LicenseResult implements ffi.Finalizable {
  final RT_LicenseResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LicenseResult_destroy.cast());

  static LicenseResult? _fromHandle(RT_LicenseResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LicenseResult._withHandle(handle);
  }

  LicenseResult._withHandle(RT_LicenseResultHandle handle)
      : _extensionsStatus = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LicenseResult_getExtensionsStatus(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LicenseResult_created(_handle);
    }
  }

  /// A mapping of key-value pairs for extension license name to license status.
  ///
  /// The value type should be casted to a [LicenseStatus] enumeration value.
  Map<String, LicenseStatus> get extensionsStatus => _extensionsStatus.value;

  final Memoized<_UnmodifiableDictionaryMap<String, LicenseStatus>>
      _extensionsStatus;

  /// The license status from a call to [ArcGISEnvironment.setLicenseUsingKey].
  LicenseStatus get licenseStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LicenseResult_getLicenseStatus(
          _handle, errorHandler);
    });
    return LicenseStatus._fromCoreValue(coreValue);
  }
}

/// The different license statuses that occur from setting a license.
///
/// Each of different license statuses.
enum LicenseStatus {
  /// License is invalid.
  invalid,

  /// License is expired.
  expired,

  /// License has passed the 30-day timeout period for a named user.
  loginRequired,

  /// License is valid.
  valid;

  factory LicenseStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return invalid;
      case 1:
        return expired;
      case 2:
        return loginRequired;
      case 3:
        return valid;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case invalid:
        return 0;
      case expired:
        return 1;
      case loginRequired:
        return 2;
      case valid:
        return 3;
    }
  }
}

/// The different license types.
///
/// Each of the possible license types that the application could be licensed
/// as.
enum LicenseType {
  /// The license type has not been set and will run in developer mode.
  developer,

  /// Using a subscription license from a named user account.
  namedUser,

  /// Licensed from a license string.
  licenseKey;

  factory LicenseType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return developer;
      case 1:
        return namedUser;
      case 2:
        return licenseKey;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case developer:
        return 0;
      case namedUser:
        return 1;
      case licenseKey:
        return 2;
    }
  }
}

/// The load status for the object.
///
/// This is used to determine the status of an object that is loadable.
enum LoadStatus {
  /// The object is fully loaded and ready to use.
  loaded,

  /// The object is currently being loaded and some functionality may not work.
  loading,

  /// The object failed to load and some functionality may not work.
  failedToLoad,

  /// The object is not loaded and some functionality may not work.
  notLoaded,

  /// Unknown load state. Only used if an error occurs and we have to return a
  /// value. Should not expose it.
  unknown;

  factory LoadStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return loaded;
      case 1:
        return loading;
      case 2:
        return failedToLoad;
      case 3:
        return notLoaded;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case loaded:
        return 0;
      case loading:
        return 1;
      case failedToLoad:
        return 2;
      case notLoaded:
        return 3;
      case unknown:
        return -1;
    }
  }
}

/// A class defines generic interface to access features related to platform
/// locale or platform peculiarities, like date/time to string conversion.
///
/// This interface should be implemented and consumed by SDK which manages
/// corresponding features in a most efficient way. The runtime core components
/// should use this interface to get the result to pass it back to SDK side.
final class _PlatformHelpersProvider implements ffi.Finalizable {
  final RT_PlatformHelpersProviderHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.PlatformHelpersProvider_destroy.cast());

  static _PlatformHelpersProvider? _fromHandle(
      RT_PlatformHelpersProviderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _PlatformHelpersProvider._withHandle(handle);
  }

  _PlatformHelpersProvider._withHandle(RT_PlatformHelpersProviderHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PlatformHelpersProvider_created(_handle);
    }
  }

  /// Creates a platform helpers provider object.
  factory _PlatformHelpersProvider() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PlatformHelpersProvider_create(errorHandler);
    });
    return _PlatformHelpersProvider._withHandle(handle);
  }
}

/// A class defines generic interface to load localized resources such as
/// localized strings for particular language.
///
/// This interface should be implemented and consumed by SDK which manages all
/// resources in a most efficient way. The runtime core components should use
/// this interface to load resource strings to pass them back to SDK side.
final class _ResourceProvider implements ffi.Finalizable {
  final RT_ResourceProviderHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ResourceProvider_destroy.cast());

  static _ResourceProvider? _fromHandle(RT_ResourceProviderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _ResourceProvider._withHandle(handle);
  }

  _ResourceProvider._withHandle(RT_ResourceProviderHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ResourceProvider_created(_handle);
    }
  }

  /// Creates a resource provider object.
  factory _ResourceProvider() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ResourceProvider_create(errorHandler);
    });
    return _ResourceProvider._withHandle(handle);
  }
}

/// An interface for resourceable classes.
///
/// This interface will be used for resourceable classes - classes which need
/// access to localized resources like resource strings. Allows to set the
/// resource provider to the resourceable class.
abstract interface class _Resourceable {
  /// Set resource provider to Resourceable object.
  ///
  /// Platform must set resource provider with connected delegated to each
  /// resourceable object.
  ///
  /// Parameters:
  /// - `resourceProvider` — The resource provider to set.
  void _setResourceProvider(_ResourceProvider? resourceProvider);
}

/// The different types of screen coordinates.
enum _ScreenCoordinateType {
  /// Screen coordinates are in DIPs.
  dips,

  /// Screen coordinates are in pixels.
  pixels;

  factory _ScreenCoordinateType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return dips;
      case 1:
        return pixels;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case dips:
        return 0;
      case pixels:
        return 1;
    }
  }
}

/// How curve geometries are fetched from and sent to services that support
/// curves.
///
/// By default, curve geometries are not fetched from services that support
/// curves, meaning that densified versions of any curve geometries are fetched
/// from the service. By default, this API is not a true curve-enabled client
/// when sending updates to services that support curves. Use
/// [ArcGISEnvironment.serviceCurveGeometryMode] to change this default
/// behavior.
///
/// For details of curve support in services, see
/// [ArcGIS REST API documentation](https://developers.arcgis.com/rest/services-reference/enterprise/get-started-with-the-services-directory.htm).
enum ServiceCurveGeometryMode {
  /// Densified versions of geometries with curves are fetched. This is the
  /// default.
  densifyCurves,

  /// Curve geometries are fetched, and this API acts as a true curve client
  /// when editing.
  trueCurveClient;

  factory ServiceCurveGeometryMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return densifyCurves;
      case 2:
        return trueCurveClient;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case densifyCurves:
        return 0;
      case trueCurveClient:
        return 2;
    }
  }
}
