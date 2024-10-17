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

/// Indicates whether tables will contain all rows or can be filtered to a
/// smaller set of related rows. Used by the property
/// [GenerateOfflineMapParameters.destinationTableRowFilter].
enum DestinationTableRowFilter {
  /// Indicates all rows of a table will be take offline.
  all,

  /// Indicates that, where appropriate, a table will be filtered to only
  /// related rows when taking the table offline.
  relatedOnly;

  factory DestinationTableRowFilter._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return all;
      case 1:
        return relatedOnly;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case all:
        return 0;
      case relatedOnly:
        return 1;
    }
  }
}

/// A job to download an offline map area from an online map as part of the
/// preplanned offline workflow.
///
/// Use this job to download the map content of a map area to your device so
/// that you can work offline without a network connection. Upon completion, the
/// job's [DownloadPreplannedOfflineMapResult] provides the offline map along
/// with the details of any errors incurred during the download process.
final class DownloadPreplannedOfflineMapJob
    extends Job<DownloadPreplannedOfflineMapResult> {
  static DownloadPreplannedOfflineMapJob? _fromHandle(
      RT_DownloadPreplannedOfflineMapJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  DownloadPreplannedOfflineMapJob._withHandle(super.handle)
      : _downloadDirectoryUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapJob_getDownloadDirectoryPath(
                    handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _onlineMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DownloadPreplannedOfflineMapJob_getOnlineMap(
                handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle);
        }),
        _parameters = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DownloadPreplannedOfflineMapJob_getParameters(
                handle, errorHandler);
          });
          return DownloadPreplannedOfflineMapParameters._fromHandle(
              objectHandle)!;
        }),
        _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DownloadPreplannedOfflineMapJob_getResult(
                handle, errorHandler);
          });
          return DownloadPreplannedOfflineMapResult._fromHandle(objectHandle);
        }),
        __task = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DownloadPreplannedOfflineMapJob_getTask(
                handle, errorHandler);
          });
          return OfflineMapTask._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// The directory path to the location of the mobile map package.
  ///
  /// The directory path is the path that was supplied as a parameter to the
  /// [OfflineMapTask.downloadPreplannedOfflineMapWithParameters]. The job will
  /// fail if the last directory in the path cannot be created or is not empty.
  Uri get downloadDirectoryUri => _downloadDirectoryUri.value;

  final Memoized<Uri> _downloadDirectoryUri;

  /// The online map used by this job.
  ArcGISMap? get onlineMap => _onlineMap.value;

  final Memoized<ArcGISMap?> _onlineMap;

  /// The preplanned map parameters used to create this job.
  DownloadPreplannedOfflineMapParameters get parameters => _parameters.value;

  final Memoized<DownloadPreplannedOfflineMapParameters> _parameters;

  /// The result of a download preplanned offline map job that has succeeded.
  ///
  /// Although this job will have succeeded you must confirm whether any of the
  /// map content failed to be taken offline. Examine
  /// [DownloadPreplannedOfflineMapResult.hasErrors] and the
  /// [DownloadPreplannedOfflineMapResult.layerErrors] and
  /// [DownloadPreplannedOfflineMapResult.tableErrors] dictionaries to identify
  /// layers and tables that could not be taken offline.
  @override
  DownloadPreplannedOfflineMapResult? get result => _result.value;

  final Memoized<DownloadPreplannedOfflineMapResult?> _result;

  /// An instance of the offline map task associated with this job.
  OfflineMapTask? get _task => __task.value;

  final Memoized<OfflineMapTask?> __task;
}

/// The parameters that specify how an offline map area is downloaded from an
/// online map using a [DownloadPreplannedOfflineMapJob].
///
/// The online map must be a web map either on ArcGIS Online or ArcGIS
/// Enterprise. Note that the API refers to an offline map area as a
/// [PreplannedMapArea].
///
/// To generate default parameters that match the online map's offline settings,
/// call [OfflineMapTask.createDefaultDownloadPreplannedOfflineMapParameters].
/// You can then modify the parameters with any desired changes. Alternatively,
/// you can generate an empty set of parameters using
/// `DownloadPreplannedOfflineMapParameters.new` and set the parameters
/// individually. To create a [DownloadPreplannedOfflineMapJob], pass the
/// parameters to the
/// [OfflineMapTask.downloadPreplannedOfflineMapWithParameters] method and
/// provide a path to a folder where the map content is stored on the device.
final class DownloadPreplannedOfflineMapParameters implements ffi.Finalizable {
  final RT_DownloadPreplannedOfflineMapParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.DownloadPreplannedOfflineMapParameters_destroy.cast());

  static DownloadPreplannedOfflineMapParameters? _fromHandle(
      RT_DownloadPreplannedOfflineMapParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DownloadPreplannedOfflineMapParameters._withHandle(handle);
  }

  DownloadPreplannedOfflineMapParameters._withHandle(
      RT_DownloadPreplannedOfflineMapParametersHandle handle)
      : _preplannedMapArea = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapParameters_getPreplannedMapArea(
                    handle, errorHandler);
          });
          return PreplannedMapArea._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore
                .RT_DownloadPreplannedOfflineMapParameters_setPreplannedMapArea(
                    handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _referenceBasemapDirectory = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapParameters_getReferenceBasemapDirectory(
                    handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }, setter: (value) {
          final coreValue = value != null ? _CString(value.toFilePath()) : null;
          _withThrowingErrorHandler((errorHandler) {
            runtimecore
                .RT_DownloadPreplannedOfflineMapParameters_setReferenceBasemapDirectory(
                    handle, coreValue?.bytes ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DownloadPreplannedOfflineMapParameters_created(_handle);
    }
  }

  /// Creates a download preplanned offline map parameters object with the given
  /// offline map area.
  ///
  /// Parameters:
  /// - `preplannedMapArea` — preplanned map area representing area to be
  /// downloaded for offline use.
  factory DownloadPreplannedOfflineMapParameters(
      {PreplannedMapArea? preplannedMapArea}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_createCombined(
              preplannedMapArea?._handle ?? ffi.nullptr, errorHandler);
    });
    final DownloadPreplannedOfflineMapParameters object =
        DownloadPreplannedOfflineMapParameters._withHandle(handle);
    object._preplannedMapArea.cache(preplannedMapArea);
    return object;
  }

  /// Indicates whether or not the download preplanned offline map job should
  /// continue running in the event of failure to take a layer offline.
  ///
  /// If this property is true, failure to take a layer or table offline will
  /// not fail the job, the failure will be exposed in the job result. If this
  /// property is false, failure to take a layer or table offline will fail the
  /// job and no more layers or tables will be taken offline. The layer or
  /// table's error will be available as the job's error. The default value is
  /// true.
  bool get continueOnErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_getContinueOnErrors(
              _handle, errorHandler);
    });
  }

  set continueOnErrors(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DownloadPreplannedOfflineMapParameters_setContinueOnErrors(
          _handle, value, errorHandler);
    });
  }

  /// Indicates whether or not a basemap will be included in the offline map.
  ///
  /// If you do not want a basemap in the offline map then set this property to
  /// FALSE.
  ///
  /// After loading the offline map, your application can programmatically
  /// insert a basemap into the map. Note that, a programmatically inserted
  /// basemap will not be persisted in the map. If you want a basemap in the
  /// offline map then set this property to TRUE. You can choose to either:
  /// * Download and use the basemap that is part of the [PreplannedMapArea].
  /// This is the default.
  /// * Use the local basemap on the device by setting the
  /// [DownloadPreplannedOfflineMapParameters.referenceBasemapDirectory]
  ///
  /// The default value is true.
  bool get includeBasemap {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_getIncludeBasemap(
              _handle, errorHandler);
    });
  }

  set includeBasemap(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DownloadPreplannedOfflineMapParameters_setIncludeBasemap(
          _handle, value, errorHandler);
    });
  }

  /// The offline map area that will be downloaded for offline use.
  PreplannedMapArea? get preplannedMapArea => _preplannedMapArea.value;

  set preplannedMapArea(PreplannedMapArea? value) =>
      _preplannedMapArea.value = value;

  final Memoized<PreplannedMapArea?> _preplannedMapArea;

  /// The path to a directory on the device where the local basemap file is
  /// located.
  ///
  /// Set this property to use a basemap which is already on the device (rather
  /// than downloading it). The directory should only be set when
  /// [DownloadPreplannedOfflineMapParameters.referenceBasemapFilename] is
  /// defined.
  ///
  /// This property supports any directory specified as either:
  /// * An absolute path
  /// * A path relative to the parent directory of the generated mobile map
  /// package (see downloadPath for
  /// [OfflineMapTask.downloadPreplannedOfflineMapWithParameters])
  ///
  /// If the directory does not exist, or does not contain the specified
  /// basemap, the [DownloadPreplannedOfflineMapJob] will fail.
  ///
  /// Note that, the mobile map package will store either a relative or absolute
  /// path to the reference basemap file so that it can be opened in the future.
  ///
  /// A relative path typically begins with "." to denote the parent directory
  /// of the resulting mobile map package or ".." to move up one directory. The
  /// parent directory of the mobile map package will be set when calling
  /// [OfflineMapTask.generateOfflineMap].
  ///
  /// For example, to download a mobile map package to "\[my root
  /// path]/my_offline_maps/my_mobile_map_package", which uses a reference
  /// basemap in "\[my root path]/other_maps/my_basemap.tpk", you would set the
  /// relative path as follows:
  /// * [DownloadPreplannedOfflineMapJob.downloadDirectoryUri] to "\[my root
  /// path]/my_offline_maps/my_mobile_map_package"
  /// * [DownloadPreplannedOfflineMapParameters.referenceBasemapDirectory] to
  /// "../other_maps"
  /// * [DownloadPreplannedOfflineMapParameters.referenceBasemapFilename] to
  /// "my_basemap.tpk"
  ///
  /// Note that, this property is ignored if
  /// [DownloadPreplannedOfflineMapParameters.includeBasemap] is FALSE.
  Uri? get referenceBasemapDirectory => _referenceBasemapDirectory.value;

  set referenceBasemapDirectory(Uri? value) =>
      _referenceBasemapDirectory.value = value;

  final Memoized<Uri?> _referenceBasemapDirectory;

  /// The name of a local basemap file on the device which can be used rather
  /// than downloading an online basemap.
  ///
  /// The local basemap filename must end with .tpk, .tpkx or .vtpk since these
  /// are the supported file formats. This property can be read directly from
  /// settings applied by the author of the online web map (see
  /// [OfflineSettings]) or set by user code to a file known to be on the
  /// device. This property will be populated from online settings when created
  /// with [OfflineMapTask.createDefaultDownloadPreplannedOfflineMapParameters].
  ///
  /// If you wish to use the specified local basemap rather than downloading,
  /// you must also set
  /// [DownloadPreplannedOfflineMapParameters.referenceBasemapDirectory].
  ///
  /// If the directory does not exist, or does not contain the specified basemap
  /// filename, the [DownloadPreplannedOfflineMapJob] will fail.
  ///
  /// The spatial reference of the reference basemap is used for the offline map
  /// when it is different to the online map's spatial reference.
  ///
  /// Note that this property is ignored if
  /// [DownloadPreplannedOfflineMapParameters.includeBasemap] is FALSE.
  String get referenceBasemapFilename {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_getReferenceBasemapFilename(
              _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set referenceBasemapFilename(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_setReferenceBasemapFilename(
              _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Describes how the offline map will obtain feature updates from the online
  /// service.
  ///
  /// The preplanned workflow offers three modes for updating the feature data
  /// in your offline map:
  /// * Sync feature changes directly with online feature services.
  /// * Download a set of scheduled update packages (geodatabase delta files
  /// that are cached on the server) from the online map area.
  /// * Download scheduled updates from the online map area and upload new
  /// features to the feature service.
  ///
  /// To register your mobile geodatabases for syncing with online feature
  /// services, set this property to
  /// [PreplannedUpdateMode.syncWithFeatureServices]. Syncing allows you to
  /// upload as well as download changes, so this approach should be used when
  /// you need full control to edit your data. As you sync changes directly with
  /// the back-end services, you will receive the most up-to-date feature data
  /// available. This is the default mode if you construct the
  /// [DownloadPreplannedOfflineMapParameters].
  ///
  /// To download a set of cached updates (delta files) from the online map
  /// area, set this property to
  /// [PreplannedUpdateMode.downloadScheduledUpdates]. With this approach,
  /// updates are generated whenever the online map area is refreshed - for
  /// example according to its update schedule. Updates are prepared once and
  /// cached for download by all users of the offline map area. Sharing a single
  /// set of cached updates, rather than performing individual sync operations,
  /// reduces the load on the back-end services - this makes this approach
  /// scalable for large deployments. As updates are only downloaded, this
  /// approach can only be used with read-only workflows. The updates also
  /// reflect a snapshot of the feature data at the time the online map area was
  /// refreshed - rather than the most up-to-date information. The web map
  /// author must configure the online map to store cached updates for this
  /// approach.
  ///
  /// To use a hybrid approach where you download scheduled updates and upload
  /// new features, set this property to
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures]. This
  /// approach combines the scalability of downloading scheduled updates with
  /// the ability to collect and share data in the field. Note that this
  /// approach is strictly add only, meaning that you cannot delete or edit
  /// features once they have been uploaded to the feature service.
  ///
  /// If you use a [DownloadPreplannedOfflineMapParameters.updateMode] of
  /// [PreplannedUpdateMode.downloadScheduledUpdates] or
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures], with
  /// a web map that does not support scheduled updates, the resultant
  /// [DownloadPreplannedOfflineMapJob] will fail with an error [_Error.code] of
  /// [ArcGISExceptionType.mappingScheduledUpdatesNotSupported].
  PreplannedUpdateMode get updateMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DownloadPreplannedOfflineMapParameters_getUpdateMode(
              _handle, errorHandler);
    });
    return PreplannedUpdateMode._fromCoreValue(coreValue);
  }

  set updateMode(PreplannedUpdateMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DownloadPreplannedOfflineMapParameters_setUpdateMode(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The result of a [DownloadPreplannedOfflineMapJob].
///
/// When the job completes it returns the offline map and indicates whether any
/// errors were incurred during the download process
/// ([DownloadPreplannedOfflineMapResult.hasErrors]). Examine the individual
/// layer and table errors to identify the source of the problem. For example,
/// the loss of the online service, a layer or table may not be taken offline or
/// export tiles has not been enabled on the layer.
final class DownloadPreplannedOfflineMapResult implements ffi.Finalizable {
  final RT_DownloadPreplannedOfflineMapResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.DownloadPreplannedOfflineMapResult_destroy.cast());

  static DownloadPreplannedOfflineMapResult? _fromHandle(
      RT_DownloadPreplannedOfflineMapResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DownloadPreplannedOfflineMapResult._withHandle(handle);
  }

  DownloadPreplannedOfflineMapResult._withHandle(
      RT_DownloadPreplannedOfflineMapResultHandle handle)
      : _layerErrors = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapResult_getLayerErrors(
                    handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _mobileMapPackage = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapResult_getMobileMapPackage(
                    handle, errorHandler);
          });
          return MobileMapPackage._fromHandle(objectHandle)!;
        }),
        _offlineMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapResult_getOfflineMap(
                    handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle)!;
        }),
        _tableErrors = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_DownloadPreplannedOfflineMapResult_getTableErrors(
                    handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DownloadPreplannedOfflineMapResult_created(_handle);
    }
  }

  /// Indicates that there is at least one layer or table that could not be
  /// taken offline.
  ///
  /// To determine which layers or tables could not be taken offline examine the
  /// [DownloadPreplannedOfflineMapResult.layerErrors] and the
  /// [DownloadPreplannedOfflineMapResult.tableErrors], respectively.
  bool get hasErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DownloadPreplannedOfflineMapResult_getHasErrors(
          _handle, errorHandler);
    });
  }

  /// A dictionary of layers that could not be taken offline.
  ///
  /// Iterate through the dictionary to examine the error strings to determine
  /// why the layers failed to be taken offline.
  Map<Layer, ArcGISException> get layerErrors => _layerErrors.value;

  final Memoized<_UnmodifiableDictionaryMap<Layer, ArcGISException>>
      _layerErrors;

  /// The mobile map package containing the requested offline map.
  MobileMapPackage get mobileMapPackage => _mobileMapPackage.value;

  final Memoized<MobileMapPackage> _mobileMapPackage;

  /// The offline map containing the requested preplanned map area.
  ArcGISMap get offlineMap => _offlineMap.value;

  final Memoized<ArcGISMap> _offlineMap;

  /// A dictionary of tables to errors for any tables that could not be taken
  /// offline.
  ///
  /// Iterate through the dictionary and examine the error strings to determine
  /// why the tables failed to be taken offline.
  Map<FeatureTable, ArcGISException> get tableErrors => _tableErrors.value;

  final Memoized<_UnmodifiableDictionaryMap<FeatureTable, ArcGISException>>
      _tableErrors;
}

/// A Job to generate an offline map from an online map.
final class GenerateOfflineMapJob extends Job<GenerateOfflineMapResult> {
  static GenerateOfflineMapJob? _fromHandle(
      RT_GenerateOfflineMapJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  GenerateOfflineMapJob._withHandle(super.handle)
      : _downloadDirectoryUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapJob_getDownloadDirectoryPath(
                    handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _onlineMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapJob_getOnlineMap(
                handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle);
        }),
        _parameterOverrides = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapJob_getParameterOverrides(
                handle, errorHandler);
          });
          return GenerateOfflineMapParameterOverrides._fromHandle(objectHandle);
        }),
        _parameters = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapJob_getParameters(
                handle, errorHandler);
          });
          return GenerateOfflineMapParameters._fromHandle(objectHandle)!;
        }),
        _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapJob_getResult(
                handle, errorHandler);
          });
          return GenerateOfflineMapResult._fromHandle(objectHandle);
        }),
        __task = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapJob_getTask(
                handle, errorHandler);
          });
          return OfflineMapTask._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// The download directory used by this job to write the mobile map package
  /// result.
  ///
  /// This property holds the path for the mobile map package which will be
  /// generated as a result of running this job.
  ///
  /// As the job also returns a mobile map package, the same path can be used to
  /// instantiate the [MobileMapPackage] for later use.
  Uri get downloadDirectoryUri => _downloadDirectoryUri.value;

  final Memoized<Uri> _downloadDirectoryUri;

  /// The online map used by this job.
  ArcGISMap? get onlineMap => _onlineMap.value;

  final Memoized<ArcGISMap?> _onlineMap;

  /// The parameter overrides used by this job. Can be null.
  GenerateOfflineMapParameterOverrides? get parameterOverrides =>
      _parameterOverrides.value;

  final Memoized<GenerateOfflineMapParameterOverrides?> _parameterOverrides;

  /// The parameters used by this job.
  GenerateOfflineMapParameters get parameters => _parameters.value;

  final Memoized<GenerateOfflineMapParameters> _parameters;

  /// The result of a succeeded generate offline map job.
  ///
  /// If the job has not succeeded a null is returned.
  @override
  GenerateOfflineMapResult? get result => _result.value;

  final Memoized<GenerateOfflineMapResult?> _result;

  /// An instance of the offline map task associated with this job.
  ///
  /// If this job is deserialized from JSON ([Job.fromJsonString]), client API
  /// code will need to wrap the returned task object to ensure that the various
  /// requests and events are handled. This needs to be done before the job is
  /// started.
  OfflineMapTask? get _task => __task.value;

  final Memoized<OfflineMapTask?> __task;
}

/// Gives access to the individual parameters objects that will generate the
/// various geodatabase, vector tile and tile cache packages that make up the
/// data of an offline map.
///
/// This object allows the user more fine-grained control over the generation of
/// an offline map than the options presented in the standard
/// [GenerateOfflineMapParameters]. For example, the parameter overrides allow
/// the user to adjust specific layers so that they: use a different spatial
/// extent or scale range; use custom attribute or geometry settings; are
/// omitted from the download. An instance of this object can be created from
/// the overall map settings in [GenerateOfflineMapParameters] by calling
/// [OfflineMapTask.createGenerateOfflineMapParameterOverrides]. This object
/// gives access to the individual parameter objects via three dictionaries
/// containing generate geodatabase parameters, export tile cache parameters and
/// export vector tile parameters. These can be accessed using
/// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters],
/// [GenerateOfflineMapParameterOverrides.exportTileCacheParameters] and
/// [GenerateOfflineMapParameterOverrides.exportVectorTilesParameters]
/// respectively. The dictionaries contain the various parameters objects mapped
/// against an [OfflineMapParametersKey]. An [OfflineMapParametersKey]
/// represents the service that a particular parameters object is intended for.
/// The [OfflineMapParametersKey.withLayer],
/// [OfflineMapParametersKey.withTable], or
/// `OfflineMapParametersKey.OfflineMapParametersKey(UtilityNetwork)` can be
/// used to construct a key given its respective layer, table, or utility
/// network. The returned key can be used to look up a value in a dictionary.
/// The type of dictionary is indicated by the key's
/// [OfflineMapParametersKey.type] property. Note that a given parameters
/// key/value pair may be shared by multiple layers in the map: for example a
/// single [GenerateGeodatabaseParameters] could represent the online settings
/// for multiple feature layers that all access the same underlying feature
/// service. All entries in the dictionaries should correspond to layers and
/// table instances in the online [ArcGISMap]. If a dictionary entry is removed
/// the corresponding layers or tables will be removed from the offline map
/// without raising an error.
final class GenerateOfflineMapParameterOverrides implements ffi.Finalizable {
  final RT_GenerateOfflineMapParameterOverridesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GenerateOfflineMapParameterOverrides_destroy.cast());

  static GenerateOfflineMapParameterOverrides? _fromHandle(
      RT_GenerateOfflineMapParameterOverridesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GenerateOfflineMapParameterOverrides._withHandle(handle);
  }

  GenerateOfflineMapParameterOverrides._withHandle(
      RT_GenerateOfflineMapParameterOverridesHandle handle)
      : _exportTileCacheParameters = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameterOverrides_getExportTileCacheParameters(
                    handle, errorHandler);
          });
          return dictionaryHandle.toMap();
        }),
        _exportVectorTilesParameters = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameterOverrides_getExportVectorTilesParameters(
                    handle, errorHandler);
          });
          return dictionaryHandle.toMap();
        }),
        _generateGeodatabaseParameters = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameterOverrides_getGenerateGeodatabaseParameters(
                    handle, errorHandler);
          });
          return dictionaryHandle.toMap();
        }),
        _onlineLayers = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameterOverrides_getOnlineLayers(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _onlineTables = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameterOverrides_getOnlineTables(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GenerateOfflineMapParameterOverrides_created(_handle);
    }
  }

  /// The [Map] with keys of [OfflineMapParametersKey] and values of
  /// [ExportTileCacheParameters].
  ///
  /// All entries in the dictionary should correspond to [ArcGISTiledLayer]
  /// instances in the online [ArcGISMap]. If a dictionary entry is removed the
  /// corresponding layers will be removed from the offline map without raising
  /// an error.
  Map<OfflineMapParametersKey, ExportTileCacheParameters>
      get exportTileCacheParameters => _exportTileCacheParameters.value;

  final Memoized<
          _DictionaryMap<OfflineMapParametersKey, ExportTileCacheParameters>>
      _exportTileCacheParameters;

  /// The [Map] with keys of [OfflineMapParametersKey] and values of
  /// [ExportVectorTilesParameters].
  ///
  /// All entries in the dictionary should correspond to
  /// [ArcGISVectorTiledLayer] instances in the online [ArcGISMap]. If a
  /// dictionary entry is removed the corresponding layers will be removed from
  /// the offline map without raising an error.
  Map<OfflineMapParametersKey, ExportVectorTilesParameters>
      get exportVectorTilesParameters => _exportVectorTilesParameters.value;

  final Memoized<
          _DictionaryMap<OfflineMapParametersKey, ExportVectorTilesParameters>>
      _exportVectorTilesParameters;

  /// The [Map] with keys of [OfflineMapParametersKey] and values of
  /// [GenerateGeodatabaseParameters].
  ///
  /// All entries in the dictionary should correspond to [FeatureLayer],
  /// [ServiceFeatureTable], or `UtilityNetwork` instances in the online
  /// [ArcGISMap]. If a dictionary entry is removed the corresponding layers,
  /// tables, or utility network will be removed from the offline map without
  /// raising an error.
  Map<OfflineMapParametersKey, GenerateGeodatabaseParameters>
      get generateGeodatabaseParameters => _generateGeodatabaseParameters.value;

  final Memoized<
      _DictionaryMap<OfflineMapParametersKey,
          GenerateGeodatabaseParameters>> _generateGeodatabaseParameters;

  /// This list indicates layers that will not be taken offline and will
  /// continue to reference online services.
  ///
  /// In some situations, you may wish to prevent a layer from being taken
  /// offline even though it is supported. For example, by continuing to
  /// reference the live online service for a [FeatureLayer], you can benefit
  /// from the most up-to-date information. You can choose to keep layers from
  /// the map's operational layers or basemap layers collections online.
  ///
  /// To make the offline map continue to reference an online layer add it to
  /// the [GenerateOfflineMapParameterOverrides.onlineLayers] collection. By
  /// adding a [Layer] to this list, you indicate that the layer will not be
  /// taken offline but will instead continue to reference the online service.
  /// Be aware that the resulting offline map will require a network connection
  /// and may also require authentication.
  ///
  /// Note that if a [Layer] is included in this collection it will not be taken
  /// offline - you should update the relevant parameters to remove the details
  /// pertaining to that layer:
  /// * [GenerateOfflineMapParameterOverrides.exportTileCacheParameters] can be
  /// removed to prevent an [ArcGISTiledLayer] from being taken offline
  /// * [GenerateOfflineMapParameterOverrides.exportVectorTilesParameters] can
  /// be removed to prevent an [ArcGISVectorTiledLayer] from being taken offline
  /// * [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters] can
  /// be removed for an entire feature service or updated to remove an
  /// individual [FeatureLayer] using
  /// [GenerateGeodatabaseParameters.layerOptions]
  ///
  /// If a feature service contains many tables in the web map, you can choose
  /// to keep specific layers online by adding them to the
  /// [GenerateOfflineMapParameterOverrides.onlineLayers] collection and
  /// updating the
  /// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters] to
  /// remove the specific layers. Any remaining feature layers or stand-alone
  /// tables that you wish to take offline can be configured using the
  /// [GenerateGeodatabaseParameters.layerOptions] for the service in
  /// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters].
  ///
  /// When you create a [GenerateOfflineMapParameterOverrides] object, this
  /// collection will be populated according to the
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] setting in the
  /// original parameters. Things to consider are:
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.exclude] then this collection will be empty
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.include] then this collection will contain each
  /// online-only [Layer] in the web map. For example, layers that cannot be
  /// taken offline.
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.useAuthoredSettings] then this collection will
  /// contain each [Layer] that the web map author selected to remain online
  List<Layer> get onlineLayers => _onlineLayers.value;

  final Memoized<_MutableArrayList<Layer>> _onlineLayers;

  /// This list indicates tables that will not be taken offline and will
  /// continue to reference online services.
  ///
  /// In some situations, you may wish to prevent a non-spatial table from being
  /// taken offline even though it is supported. For example, by continuing to
  /// reference the live online [ServiceFeatureTable], you can benefit from the
  /// most up-to-date information.
  ///
  /// To make the offline map continue to reference an online table, you add it
  /// to the [GenerateOfflineMapParameterOverrides.onlineTables] collection. By
  /// adding a [ServiceFeatureTable] to this list, you indicate that the table
  /// will not be taken offline and it will continue to reference the online
  /// source. Be aware that the resulting offline map will require a network
  /// connection and may require authentication.
  ///
  /// Note that if a [ServiceFeatureTable] is included in this collection it
  /// will not be taken offline - you should update the
  /// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters] to
  /// remove that table.
  ///
  /// If a feature service contains many layers in the web map, you can choose
  /// to keep specific tables online by adding them to the
  /// [GenerateOfflineMapParameterOverrides.onlineTables] collection. Any
  /// remaining tables that you wish to take offline can be configured using the
  /// service's [GenerateGeodatabaseParameters.layerOptions] in the
  /// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters].
  ///
  /// When you create a [GenerateOfflineMapParameterOverrides] object, this
  /// collection will be populated according to the
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] setting in the
  /// original parameters. Things to consider are:
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.exclude] then this collection will be empty
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.include] then this collection will contain each
  /// online-only [ServiceFeatureTable] in the web map. For example, layers that
  /// cannot be taken offline. because they are not sync-enabled.
  /// * If you set [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.useAuthoredSettings], then this collection will
  /// contain each [ServiceFeatureTable] that the web map author selected to
  /// remain online
  List<ServiceFeatureTable> get onlineTables => _onlineTables.value;

  final Memoized<_MutableArrayList<ServiceFeatureTable>> _onlineTables;
}

/// The parameters that specify how an offline map is generated and downloaded
/// from an online map using a [GenerateOfflineMapJob].
///
/// The online map must be a web map either on ArcGIS Online or ArcGIS
/// Enterprise.
///
/// To generate parameters with appropriate default values which take into
/// account the online map and the data it contains, call
/// [OfflineMapTask.createDefaultGenerateOfflineMapParameters]). You can then
/// modify the parameters with any desired changes. Alternatively, you can
/// generate an empty set of parameters using [GenerateOfflineMapParameters.new]
/// and set the parameters individually. To create a [GenerateOfflineMapJob],
/// pass the parameters to the [OfflineMapTask.generateOfflineMap] method and
/// provide a path to a folder where the map content is stored on the device.
final class GenerateOfflineMapParameters implements ffi.Finalizable {
  final RT_GenerateOfflineMapParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GenerateOfflineMapParameters_destroy.cast());

  static GenerateOfflineMapParameters? _fromHandle(
      RT_GenerateOfflineMapParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GenerateOfflineMapParameters._withHandle(handle);
  }

  GenerateOfflineMapParameters._withHandle(
      RT_GenerateOfflineMapParametersHandle handle)
      : _itemInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapParameters_getItemInfo(
                handle, errorHandler);
          });
          return OfflineMapItemInfo._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GenerateOfflineMapParameters_setItemInfo(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _referenceBasemapDirectory = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateOfflineMapParameters_getReferenceBasemapDirectory(
                    handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }, setter: (value) {
          final coreValue = value != null ? _CString(value.toFilePath()) : null;
          _withThrowingErrorHandler((errorHandler) {
            runtimecore
                .RT_GenerateOfflineMapParameters_setReferenceBasemapDirectory(
                    handle, coreValue?.bytes ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GenerateOfflineMapParameters_created(_handle);
    }
  }

  /// Creates a generate offline map parameters object.
  factory GenerateOfflineMapParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_create(errorHandler);
    });
    return GenerateOfflineMapParameters._withHandle(handle);
  }

  /// Creates a generate offline map parameters object.
  ///
  /// The area of interest must have a spatial reference. If min_scale or
  /// max_scale is zero that implies there is no bound on the scale. If both are
  /// non-zero, they must both be positive with min_scale greater than
  /// max_scale.
  ///
  /// Parameters:
  /// - `areaOfInterest` — Area of interest.
  /// - `minScale` — Min scale.
  /// - `maxScale` — Max scale.
  factory GenerateOfflineMapParameters.withAreaOfInterest(
      Geometry areaOfInterest,
      {double minScale = 0.0,
      double maxScale = 0.0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_createWithAreaOfInterestAndMinScaleAndMaxScale(
              areaOfInterest._handle, minScale, maxScale, errorHandler);
    });
    return GenerateOfflineMapParameters._withHandle(handle);
  }

  /// The area of interest for the offline map. This is used for the extent of
  /// offline tile caches, geodatabases and the offline map's
  /// [GeoModel.initialViewpoint] property.
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference. Where a
  /// [Polygon] is supplied, features and tiles will be filtered according to
  /// the polygon geometry, which can help reduce the size of the resulting
  /// offline map. Note that the filtered set of tiles may vary, depending on
  /// the underlying service.
  Geometry? get areaOfInterest {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getAreaOfInterest(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set areaOfInterest(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setAreaOfInterest(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Specifies the direction for attachments to be synchronized when syncing
  /// offline feature layers. This method should be used in conjunction with
  /// [GenerateOfflineMapParameters.returnLayerAttachmentOption] to determine
  /// which layers should be taken offline with attachments included.
  ///
  /// This property is valid when the service resource sync capabilities
  /// includes supportsAttachmentsSyncDirection otherwise it is ignored.
  ///
  /// This property works in conjunction with
  /// [GenerateOfflineMapParameters.returnLayerAttachmentOption] and in some
  /// cases may have its value overridden by
  /// [GenerateOfflineMapParameters.returnLayerAttachmentOption].
  ///
  /// The table below shows the valid combinations of values for layer
  /// attachment options and attachment sync direction. The notes column
  /// explains where the behavior for a given layer may differ from the values
  /// set for these properties.
  ///
  /// | Layer Attachment Option                        | Valid Attachment Sync Direction           | Note                                                                                    |
  /// | ---------------------------------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------- |
  /// | [ReturnLayerAttachmentOption.none]           | [AttachmentSyncDirection.none]          |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// | [ReturnLayerAttachmentOption.allLayers]      | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] |                                                                                         |
  /// | [ReturnLayerAttachmentOption.readOnlyLayers] | [AttachmentSyncDirection.none]          | Layers *with* attachments will treat this as [AttachmentSyncDirection.bidirectional]  |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] | Layers *without* attachments will treat this as [AttachmentSyncDirection.none]        |
  /// | [ReturnLayerAttachmentOption.editableLayers] | [AttachmentSyncDirection.none]          | Layers *with* attachments will treat this as [AttachmentSyncDirection.bidirectional]  |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] | Layers *without* attachments will treat this as [AttachmentSyncDirection.none]        |
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides] this property is superseded.
  AttachmentSyncDirection get attachmentSyncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getAttachmentSyncDirection(
              _handle, errorHandler);
    });
    return AttachmentSyncDirection._fromCoreValue(coreValue);
  }

  set attachmentSyncDirection(AttachmentSyncDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setAttachmentSyncDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Indicates whether or not the generate offline map job should continue
  /// running in the event of failure to take a layer offline.
  ///
  /// If this property is true, failure to take a layer or table offline will
  /// not fail the job, the failure will be exposed in the job result. If this
  /// property is false, failure to take a layer or table offline will fail the
  /// job and no more layers or tables will be taken offline. The layer or
  /// table's error will be available as the job's error. The default value is
  /// true.
  bool get continueOnErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getContinueOnErrors(
          _handle, errorHandler);
    });
  }

  set continueOnErrors(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setContinueOnErrors(
          _handle, value, errorHandler);
    });
  }

  /// Indicates whether tables will contain all rows or can be filtered to a
  /// smaller set of related rows.
  ///
  /// When the property is [DestinationTableRowFilter.relatedOnly] (the default)
  /// this can substantially reduce the number of rows in offline tables to only
  /// those that are related to rows from other layers or tables. Only tables
  /// present in [GeoModel.tables] are considered as candidates for filtering.
  ///
  /// This does not apply when the table:
  /// * Is the origin of a relationship and not a destination
  /// * Is a destination of a relationship from a layer or table that is not in
  /// the map
  /// * Is editable and
  /// [GenerateOfflineMapParameters.returnSchemaOnlyForEditableLayers] is true
  /// * Has a [ServiceFeatureTable.definitionExpression] and
  /// [GenerateOfflineMapParameters.isDefinitionExpressionFilterEnabled] is true
  ///
  /// The relationships of a table are accessible via
  /// [ArcGISFeatureTable.layerInfo] and the
  /// [ArcGISFeatureLayerInfo.relationshipInfos] property.
  ///
  /// The default value is [DestinationTableRowFilter.relatedOnly].
  ///
  /// If set to [DestinationTableRowFilter.all] then all rows in tables are
  /// returned.
  DestinationTableRowFilter get destinationTableRowFilter {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getDestinationTableRowFilter(
              _handle, errorHandler);
    });
    return DestinationTableRowFilter._fromCoreValue(coreValue);
  }

  set destinationTableRowFilter(DestinationTableRowFilter value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setDestinationTableRowFilter(
          _handle, value.coreValue, errorHandler);
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
  /// [Vector Tile Style documentation](https://developers.arcgis.com/rest/services-reference/enterprise/vector-tile-style.htm).
  /// When you take vector tiled layer offline, these fonts are downloaded as
  /// part of the [VectorTileCache].
  ///
  /// Esri services also offer an alternative version with a reduced font
  /// package size. This omits the large Arial Unicode font, which greatly
  /// reduces the download size. You can view the set of reduced font vector
  /// tile services
  /// [here](https://www.arcgis.com/home/group.html?id=c61ab1493fff4b84b53705184876c9b0).
  ///
  /// If you choose [EsriVectorTilesDownloadOption.useOriginalService], the full
  /// set of resources used by the original online service, including all fonts,
  /// will be downloaded. This increases the download size of the
  /// [VectorTileCache] but ensures that the offline layer will display the same
  /// as the original online data.
  ///
  /// If you choose [EsriVectorTilesDownloadOption.useReducedFontsService], the
  /// smaller set of fonts used by the alternative, for export, version of the
  /// service will be downloaded. This reduces the download size of the
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
          .RT_GenerateOfflineMapParameters_getEsriVectorTilesDownloadOption(
              _handle, errorHandler);
    });
    return EsriVectorTilesDownloadOption._fromCoreValue(coreValue);
  }

  set esriVectorTilesDownloadOption(EsriVectorTilesDownloadOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_GenerateOfflineMapParameters_setEsriVectorTilesDownloadOption(
              _handle, value.coreValue, errorHandler);
    });
  }

  /// Indicates whether or not a basemap will be included in the offline map.
  ///
  /// If you do not want a basemap in the offline map then set this property to
  /// FALSE. After loading the offline map, your application can
  /// programmatically insert a basemap into the map. Note that, a
  /// programmatically inserted basemap will not be persisted in the map.
  ///
  /// If you want a basemap in the offline map then set this property to TRUE.
  /// You can choose to either:
  /// * Generate and download the online basemap using the
  /// [GenerateOfflineMapJob]. This is the default.
  /// * Use a local basemap on the device by setting the
  /// [GenerateOfflineMapParameters.referenceBasemapDirectory]
  ///
  /// The default value is true.
  ///
  /// This property is superseded if the [GenerateOfflineMapParameters] is used
  /// in conjunction with [GenerateOfflineMapParameterOverrides].
  bool get includeBasemap {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getIncludeBasemap(
          _handle, errorHandler);
    });
  }

  set includeBasemap(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setIncludeBasemap(
          _handle, value, errorHandler);
    });
  }

  /// Indicates if feature layer definition expressions are used when taking
  /// feature layers and tables offline.
  ///
  /// A value of true allows [GenerateOfflineMapJob] to use the SQL where clause
  /// in [FeatureLayer.definitionExpression] as a filter when generating offline
  /// geodatabases.
  ///
  /// Applying the definition expression may reduce the number of features taken
  /// offline for display and sync.
  ///
  /// If the value is false this could result in a larger geodatabase than is
  /// required to display the feature layer.
  ///
  /// The default value is true.
  ///
  /// For tables the definition expression is taken from the property
  /// [ServiceFeatureTable.definitionExpression].
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides] this property is superseded.
  bool get isDefinitionExpressionFilterEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getIsDefinitionExpressionFilterEnabled(
              _handle, errorHandler);
    });
  }

  set isDefinitionExpressionFilterEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_GenerateOfflineMapParameters_setIsDefinitionExpressionFilterEnabled(
              _handle, value, errorHandler);
    });
  }

  /// Offline map item info used for the local item properties in the offline
  /// map.
  ///
  /// If this property is null then the properties are copied from the portal
  /// item.
  OfflineMapItemInfo? get itemInfo => _itemInfo.value;

  set itemInfo(OfflineMapItemInfo? value) => _itemInfo.value = value;

  final Memoized<OfflineMapItemInfo?> _itemInfo;

  /// The maximum scale for how far in to extract tiles from tiled services. The
  /// 0 default means extract the levels down to the most detailed.
  ///
  /// This is used as input for levels of detail for [TileCache] and
  /// [VectorTileCache].
  ///
  /// This is not applicable to offline data in [Geodatabase].
  ///
  /// A minScale of 100000 and a maxScale of 500 will select level IDs between
  /// 1:500 and 1:100,000 scale.
  ///
  /// A minScale of 0 and a maxScale of 500 will select all global level IDs
  /// down to 1:500 scale.
  ///
  /// A minScale of 100000 and a maxScale of 0 will select level IDs from
  /// 1:100,000 scale to the most detailed available level.
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides], this property is superseded for
  /// individual layers tile caches.
  ///
  /// Note that this property only sets the levels of detail to download for
  /// tiled data. The offline basemap layers will use the same max scale as in
  /// the online web map (either defined by the service or on the layer itself)
  /// to allow zooming in.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getMaxScale(
          _handle, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setMaxScale(
          _handle, value, errorHandler);
    });
  }

  /// The minimum scale for how far out data will be in tile caches. The 0
  /// default means extract all the available detailed levels to global scales.
  ///
  /// This is used as input for levels of detail for [TileCache].
  ///
  /// This is not applicable to offline data in [VectorTileCache] or
  /// [Geodatabase].
  ///
  /// A minScale of 100000 and a maxScale of 500 will select level IDs between
  /// 1:500 and 1:100,000 scale.
  ///
  /// A minScale of 0 and a maxScale of 500 will select all global level IDs
  /// down to 1:500 scale.
  ///
  /// A minScale of 100000 and a maxScale of 0 will select level IDs from
  /// 1:100,000 scale to the most detailed available level.
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides], this property is superseded for
  /// individual layers tile caches.
  ///
  /// Note that this property only sets the levels of detail to download for
  /// tiled data. The offline basemap layers will use the same min scale as in
  /// the online web map (either defined by the service or on the layer itself).
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getMinScale(
          _handle, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setMinScale(
          _handle, value, errorHandler);
    });
  }

  /// Describes how data that requires an online service will be handled when
  /// taking a map offline.
  ///
  /// Online layers and tables cannot be taken offline in the following
  /// situations:
  /// * The layer or table is using a service that cannot be taken offline. For
  /// example, `WmsLayer` or `WmtsLayer`.
  /// * The layer or table is using a service that supports offline, such as an
  /// ArcGISFeatureLayer, but synchronization has not been enabled on the
  /// service ([FeatureServiceCapabilities.supportsSync] is set to false).
  /// Services utilize synchronization to take layers and tables offline and
  /// synchronize changes.
  ///
  /// Online services that cannot be taken offline are referred to as
  /// online-only services. Online-only services require network connectivity
  /// and may involve authentication. Examples of online-only services include:
  /// * Dynamic information, such as changing weather or traffic conditions,
  /// that delivers frequent and regular updates to the app
  /// * Large datasets that would be impractical to take offline to a device
  ///
  /// This property allows you to specify how online-only data will be handled
  /// when taking the map offline. There are three options:
  /// * [OnlineOnlyServicesOption.exclude] means that any data that cannot be
  /// taken offline will be omitted from the offline map. Choosing this option
  /// means that your offline map will not require a network connection but may
  /// not include all of the data from the original web map.
  /// * [OnlineOnlyServicesOption.include] means that data that cannot be taken
  /// offline will be accessed via the URL in the offline map. Choosing this
  /// option means that your offline map will retain all of the information from
  /// the original web map, but it will require a network connection and may
  /// require authentication.
  /// * [OnlineOnlyServicesOption.useAuthoredSettings] means that layers and
  /// tables will be taken offline, remain online or be omitted from the offline
  /// map according to the map author's intent as defined in the web map
  ///
  /// The default value is [OnlineOnlyServicesOption.exclude].
  OnlineOnlyServicesOption get onlineOnlyServicesOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getOnlineOnlyServicesOption(
              _handle, errorHandler);
    });
    return OnlineOnlyServicesOption._fromCoreValue(coreValue);
  }

  set onlineOnlyServicesOption(OnlineOnlyServicesOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setOnlineOnlyServicesOption(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The path to a directory on the device where the local basemap file is
  /// located.
  ///
  /// Set this property to use a basemap that is already on the device (rather
  /// than downloading it). The directory should only be set when the parameters
  /// have a [GenerateOfflineMapParameters.referenceBasemapFilename] defined.
  ///
  /// This property supports any directory specified as either:
  /// * An absolute path
  /// * A path relative to the parent directory of the generated mobile map
  /// package (see downloadPath for [OfflineMapTask.generateOfflineMap])
  ///
  /// If the directory does not exist, or does not contain the specified
  /// basemap, the [GenerateOfflineMapJob] will fail.
  ///
  /// Note that, the mobile map package will store either a relative or absolute
  /// path to the reference basemap file so that it can be opened in the future.
  ///
  /// A relative path typically begins with "." to denote the parent directory
  /// of the resulting mobile map package or ".." to move up one directory. The
  /// parent directory of the mobile map package will be set when calling
  /// [OfflineMapTask.generateOfflineMap].
  ///
  /// For example, to generate a mobile map package to "\[my root
  /// path]/my_offline_maps/my_mobile_map_package", that uses a reference
  /// basemap in "\[my root path]/other_maps/my_basemap.tpk", you would set the
  /// relative path as follows:
  /// * [GenerateOfflineMapJob.downloadDirectoryUri] to "\[my root
  /// path]/my_offline_maps/my_mobile_map_package"
  /// * [GenerateOfflineMapParameters.referenceBasemapDirectory] to
  /// "../other_maps"
  /// * [GenerateOfflineMapParameters.referenceBasemapFilename] to
  /// "my_basemap.tpk"
  ///
  /// Note that this property is ignored if
  /// [GenerateOfflineMapParameters.includeBasemap] is FALSE.
  Uri? get referenceBasemapDirectory => _referenceBasemapDirectory.value;

  set referenceBasemapDirectory(Uri? value) =>
      _referenceBasemapDirectory.value = value;

  final Memoized<Uri?> _referenceBasemapDirectory;

  /// The name of a local basemap file on the device that can be used rather
  /// than downloading an online basemap.
  ///
  /// The local basemap filename must end with .tpk, .tpkx or .vtpk since these
  /// are the supported file formats. This property can be read directly from
  /// settings applied by the author of the online web map (see
  /// [OfflineSettings]) or set by user code to a file known to be on the
  /// device. This property will be populated from online settings when created
  /// with [OfflineMapTask.createDefaultGenerateOfflineMapParameters].
  ///
  /// If you wish to use the specified local basemap rather than downloading,
  /// you must also set
  /// [GenerateOfflineMapParameters.referenceBasemapDirectory].
  ///
  /// If the directory does not exist, or does not contain the specified
  /// basemap, the [GenerateOfflineMapJob] will fail.
  ///
  /// The spatial reference of the reference basemap is used for the offline map
  /// when it is different to the online map's spatial reference.
  ///
  /// Note that this property is ignored if
  /// [GenerateOfflineMapParameters.includeBasemap] is FALSE.
  String get referenceBasemapFilename {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getReferenceBasemapFilename(
              _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set referenceBasemapFilename(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setReferenceBasemapFilename(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Which feature layers will include attachments when being taken offline.
  /// Attachments can be included with none of the layers, all of the layers,
  /// read only layers or editable layers. This method should be used in
  /// conjunction with [GenerateOfflineMapParameters.attachmentSyncDirection] to
  /// control how the attachments are synced.
  ///
  /// For offline maps, a feature layer is considered to be editable if the
  /// feature service has capabilities that include any of create, update or
  /// delete. A read-only layer is one that supports sync, but does not have any
  /// of create, update or delete capability. Service capabilities are
  /// accessible from service infos see
  /// [ArcGISFeatureServiceInfo.featureServiceCapabilities] or
  /// [ArcGISFeatureLayerInfo.capabilities].
  ///
  /// This property works in conjunction with
  /// [GenerateOfflineMapParameters.attachmentSyncDirection] and in some cases
  /// may override the value returned by
  /// [GenerateOfflineMapParameters.attachmentSyncDirection]. The table below
  /// shows the valid combinations of values for layer attachment options and
  /// attachment sync direction. The notes column explains where the behavior
  /// for a given layer may differ from the values set for these properties.
  ///
  /// | Layer Attachment Option                        | Valid Attachment Sync Direction           | Note                                                                                    |
  /// | ---------------------------------------------- | ----------------------------------------- | --------------------------------------------------------------------------------------- |
  /// | [ReturnLayerAttachmentOption.none]           | [AttachmentSyncDirection.none]          |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// | [ReturnLayerAttachmentOption.allLayers]      | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] |                                                                                         |
  /// | [ReturnLayerAttachmentOption.readOnlyLayers] | [AttachmentSyncDirection.none]          | Layers *with* attachments will treat this as [AttachmentSyncDirection.bidirectional]  |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] | Layers *without* attachments will treat this as [AttachmentSyncDirection.none]        |
  /// | [ReturnLayerAttachmentOption.editableLayers] | [AttachmentSyncDirection.none]          | Layers *with* attachments will treat this as [AttachmentSyncDirection.bidirectional]  |
  /// |                                                | [AttachmentSyncDirection.upload]        |                                                                                         |
  /// |                                                | [AttachmentSyncDirection.bidirectional] | Layers *without* attachments will treat this as [AttachmentSyncDirection.none]        |
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides] this property is superseded.
  ReturnLayerAttachmentOption get returnLayerAttachmentOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getReturnLayerAttachmentOption(
              _handle, errorHandler);
    });
    return ReturnLayerAttachmentOption._fromCoreValue(coreValue);
  }

  set returnLayerAttachmentOption(ReturnLayerAttachmentOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_GenerateOfflineMapParameters_setReturnLayerAttachmentOption(
              _handle, value.coreValue, errorHandler);
    });
  }

  /// Whether or not feature layers taken offline should be schema only and
  /// contain no data.
  ///
  /// For an upload only type workflow, this property can be set to true to take
  /// feature layers offline with no existing data in them. If
  /// [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides] this property is superseded.
  bool get returnSchemaOnlyForEditableLayers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateOfflineMapParameters_getReturnSchemaOnlyForEditableLayers(
              _handle, errorHandler);
    });
  }

  set returnSchemaOnlyForEditableLayers(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_GenerateOfflineMapParameters_setReturnSchemaOnlyForEditableLayers(
              _handle, value, errorHandler);
    });
  }

  /// Describes how the offline map will support synchronization with online
  /// services.
  ///
  /// A value of [GenerateOfflineMapUpdateMode.syncWithFeatureServices]
  /// instructs the [GenerateOfflineMapJob] to create offline geodatabases that
  /// support syncing with online feature services.
  ///
  /// A value of [GenerateOfflineMapUpdateMode.noUpdates] instructs the
  /// [GenerateOfflineMapJob] to disable data synchronization for generated
  /// offline geodatabases. In this case, no synchronization replicas will be
  /// created on corresponding feature services. This reduces the load on the
  /// feature server and frees the developer from needing to unregister server
  /// replicas when they are no longer needed.
  ///
  /// The default value is
  /// [GenerateOfflineMapUpdateMode.syncWithFeatureServices].
  ///
  /// If [GenerateOfflineMapParameters] is used in conjunction with
  /// [GenerateOfflineMapParameterOverrides] this property is superseded by the
  /// [GenerateGeodatabaseParameters.syncModel] property of the overridden
  /// layer.
  GenerateOfflineMapUpdateMode get updateMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapParameters_getUpdateMode(
          _handle, errorHandler);
    });
    return GenerateOfflineMapUpdateMode._fromCoreValue(coreValue);
  }

  set updateMode(GenerateOfflineMapUpdateMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateOfflineMapParameters_setUpdateMode(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The result of a [GenerateOfflineMapJob].
final class GenerateOfflineMapResult implements ffi.Finalizable {
  final RT_GenerateOfflineMapResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GenerateOfflineMapResult_destroy.cast());

  static GenerateOfflineMapResult? _fromHandle(
      RT_GenerateOfflineMapResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GenerateOfflineMapResult._withHandle(handle);
  }

  GenerateOfflineMapResult._withHandle(RT_GenerateOfflineMapResultHandle handle)
      : _layerErrors = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapResult_getLayerErrors(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _mobileMapPackage = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapResult_getMobileMapPackage(
                handle, errorHandler);
          });
          return MobileMapPackage._fromHandle(objectHandle)!;
        }),
        _offlineMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapResult_getOfflineMap(
                handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle)!;
        }),
        _tableErrors = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateOfflineMapResult_getTableErrors(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GenerateOfflineMapResult_created(_handle);
    }
  }

  /// Indicates that there is at least one layer or table that could not be
  /// taken offline.
  bool get hasErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateOfflineMapResult_getHasErrors(
          _handle, errorHandler);
    });
  }

  /// A dictionary of layers to errors for any layers that could not be taken
  /// offline.
  Map<Layer, ArcGISException> get layerErrors => _layerErrors.value;

  final Memoized<_UnmodifiableDictionaryMap<Layer, ArcGISException>>
      _layerErrors;

  /// The mobile map package containing the offline map.
  MobileMapPackage get mobileMapPackage => _mobileMapPackage.value;

  final Memoized<MobileMapPackage> _mobileMapPackage;

  /// Offline map. The layers within the map will reference offline layers.
  ArcGISMap get offlineMap => _offlineMap.value;

  final Memoized<ArcGISMap> _offlineMap;

  /// A dictionary of tables to errors for any tables that could not be taken
  /// offline.
  Map<FeatureTable, ArcGISException> get tableErrors => _tableErrors.value;

  final Memoized<_UnmodifiableDictionaryMap<FeatureTable, ArcGISException>>
      _tableErrors;
}

/// Different modes for synchronization of features in a generated offline map.
enum GenerateOfflineMapUpdateMode {
  /// Changes, including local edits, will be synced directly with the
  /// underlying feature services.
  syncWithFeatureServices,

  /// No feature updates will be performed.
  noUpdates;

  factory GenerateOfflineMapUpdateMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return syncWithFeatureServices;
      case 1:
        return noUpdates;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case syncWithFeatureServices:
        return 0;
      case noUpdates:
        return 1;
    }
  }
}

/// Describes whether a layer or table can be included in an offline map.
final class OfflineCapability implements ffi.Finalizable {
  final RT_OfflineCapabilityHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OfflineCapability_destroy.cast());

  static OfflineCapability? _fromHandle(RT_OfflineCapabilityHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineCapability._withHandle(handle);
  }

  OfflineCapability._withHandle(RT_OfflineCapabilityHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineCapability_getError(
                handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineCapability_created(_handle);
    }
  }

  /// An error if the layer or table could not be included in the offline map,
  /// otherwise null.
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// Indicates if this online only layer or table will be referenced from an
  /// offline map.
  ///
  /// This relates to the
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] property. If
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] is set to
  /// [OnlineOnlyServicesOption.exclude], this property will always be false. If
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] is set to
  /// [OnlineOnlyServicesOption.include], this property may be true for layers
  /// that cannot be taken offline.
  bool get remainsOnline {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineCapability_getRemainsOnline(
          _handle, errorHandler);
    });
  }

  /// Indicates if this layer or table supports being taken offline.
  ///
  /// Note that if this property is false and the
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] is set to
  /// [OnlineOnlyServicesOption.include], the [OfflineCapability.remainsOnline]
  /// property may indicate that the layer or table will remain online and be
  /// referenced by the offline map.
  bool get supportsOffline {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineCapability_getSupportsOffline(
          _handle, errorHandler);
    });
  }
}

/// Represents the capability of taking a map's layers and tables offline.
final class OfflineMapCapabilities implements ffi.Finalizable {
  final RT_OfflineMapCapabilitiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapCapabilities_destroy.cast());

  static OfflineMapCapabilities? _fromHandle(
      RT_OfflineMapCapabilitiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapCapabilities._withHandle(handle);
  }

  OfflineMapCapabilities._withHandle(RT_OfflineMapCapabilitiesHandle handle)
      : _layerCapabilities = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapCapabilities_getLayerCapabilities(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _tableCapabilities = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapCapabilities_getTableCapabilities(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapCapabilities_created(_handle);
    }
  }

  /// Indicates if there is at least one layer or table that cannot be included
  /// in the offline map.
  ///
  /// This property indicates whether the map contains any layers or tables that
  /// cannot be taken offline. This is not relevant to offline maps that
  /// reference online-only layers and tables. Setting
  /// [GenerateOfflineMapParameters.onlineOnlyServicesOption] to
  /// [OnlineOnlyServicesOption.include] will allow online-only data to be
  /// included in the offline map and referenced by URL.
  bool get hasErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapCapabilities_getHasErrors(
          _handle, errorHandler);
    });
  }

  /// Layer capabilities for all layers in the map. The dictionary maps layer
  /// instances to offline capability.
  ///
  /// The Dictionary has keys of element type [Layer] with values of
  /// [OfflineCapability].
  Map<Layer, OfflineCapability> get layerCapabilities =>
      _layerCapabilities.value;

  final Memoized<_UnmodifiableDictionaryMap<Layer, OfflineCapability>>
      _layerCapabilities;

  /// Capabilities for all tables in the map. The dictionary maps table
  /// instances to offline capability.
  ///
  /// The Dictionary has keys of element type [FeatureTable] with values of
  /// [OfflineCapability].
  Map<FeatureTable, OfflineCapability> get tableCapabilities =>
      _tableCapabilities.value;

  final Memoized<_UnmodifiableDictionaryMap<FeatureTable, OfflineCapability>>
      _tableCapabilities;
}

/// Contains properties to override the offline maps item properties.
final class OfflineMapItemInfo implements ffi.Finalizable {
  final RT_OfflineMapItemInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OfflineMapItemInfo_destroy.cast());

  static OfflineMapItemInfo? _fromHandle(RT_OfflineMapItemInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapItemInfo._withHandle(handle);
  }

  OfflineMapItemInfo._withHandle(RT_OfflineMapItemInfoHandle handle)
      : _tags = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapItemInfo_getTags(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _thumbnail = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapItemInfo_getThumbnail(
                handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_OfflineMapItemInfo_setThumbnail(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapItemInfo_created(_handle);
    }
  }

  /// Creates an offline map item info object.
  factory OfflineMapItemInfo() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_create(errorHandler);
    });
    return OfflineMapItemInfo._withHandle(handle);
  }

  /// The access information for the offline map.
  String get accessInformation {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_getAccessInformation(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set accessInformation(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapItemInfo_setAccessInformation(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The description text of the offline map.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapItemInfo_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The snippet text of the offline map.
  String get snippet {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_getSnippet(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set snippet(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapItemInfo_setSnippet(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The user defined tags that describe the offline map.
  List<String> get tags => _tags.value;

  final Memoized<_MutableArrayList<String>> _tags;

  /// The terms of use of the item.
  ///
  /// This property can contain HTML formatting.
  String get termsOfUse {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_getTermsOfUse(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set termsOfUse(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapItemInfo_setTermsOfUse(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The thumbnail to be used for the offline map.
  ArcGISImage? get thumbnail => _thumbnail.value;

  set thumbnail(ArcGISImage? value) => _thumbnail.value = value;

  final Memoized<ArcGISImage?> _thumbnail;

  /// The title for the offline map's item.
  String get title {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapItemInfo_getTitle(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set title(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapItemInfo_setTitle(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// A key comprising of a service URL and type of an online service. The key is
/// used to lookup values in a dictionary exposed by a
/// [GenerateOfflineMapParameterOverrides].
///
/// [GenerateOfflineMapParameterOverrides] consist of instances of data type
/// specific parameters [GenerateGeodatabaseParameters],
/// [ExportTileCacheParameters] and [ExportVectorTilesParameters]. Each instance
/// is associated with the service URL that the parameters will be sent to when
/// taking the given data offline. The data type specific parameters can be
/// retrieved from their respective dictionaries on
/// [GenerateOfflineMapParameterOverrides] with an instance of
/// [OfflineMapParametersKey]. A key instance for a particular layer can be
/// constructed by calling [OfflineMapParametersKey.withLayer]. For a table,
/// call [OfflineMapParametersKey.withTable]. For a utility network, call
/// `OfflineMapParametersKey.OfflineMapParametersKey(UtilityNetwork)`. Use the
/// key with the dictionary returned by one of these properties:
/// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters],
/// [GenerateOfflineMapParameterOverrides.exportVectorTilesParameters],
/// [GenerateOfflineMapParameterOverrides.exportTileCacheParameters]. The
/// particular dictionary property will be determined by the
/// [OfflineMapParametersKey.type] property. Note that a given parameters
/// key/value pair may be shared by multiple layers in the map: for example a
/// single [GenerateGeodatabaseParameters] could represent the online settings
/// for multiple feature layers and tables which all access the same underlying
/// feature service.
final class OfflineMapParametersKey implements _InstanceId, ffi.Finalizable {
  final RT_OfflineMapParametersKeyHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapParametersKey_destroyInstance.cast());

  static OfflineMapParametersKey? _fromHandle(
      RT_OfflineMapParametersKeyHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapParametersKey._instanceCache.instanceWith(handle);
  }

  OfflineMapParametersKey._withHandle(RT_OfflineMapParametersKeyHandle handle)
      : _serviceUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapParametersKey_getServiceURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapParametersKey_created(_handle);
    }
  }

  static final _instanceCache = _InstanceCache(
      factory: _OfflineMapParametersKeyFactory(),
      kind: 'OfflineMapParametersKey');

  /// Create an offline map parameters key for the given layer.
  ///
  /// Layers that are supported for offline use are:
  /// * [FeatureLayer] with a table which is a [ServiceFeatureTable]
  /// * [ArcGISTiledLayer] with an online URL
  /// * [ArcGISVectorTiledLayer] with an online URL
  ///
  /// To construct a key the layer must be loaded, or if not loaded have a
  /// service URL available in the layer's properties. The returned key can be
  /// used to retrieve a data type specific parameters object from one of the
  /// three parameter overrides dictionaries. The dictionary that the key is
  /// valid for is indicated by its [OfflineMapParametersKey.type] property:
  /// | Parameter Type                                  | Dictionary                                                                |
  /// |-------------------------------------------------|---------------------------------------------------------------------------|
  /// | [OfflineMapParametersType.generateGeodatabase] | [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters] |
  /// | [OfflineMapParametersType.exportVectorTiles]   | [GenerateOfflineMapParameterOverrides.exportVectorTilesParameters]   |
  /// | [OfflineMapParametersType.exportTileCache]     | [GenerateOfflineMapParameterOverrides.exportTileCacheParameters]     |
  /// If the layer type is not supported an error is returned with a null handle
  ///
  /// Parameters:
  /// - `layer` — layer that is to be used to access dictionaries in
  /// [GenerateOfflineMapParameterOverrides] object.
  factory OfflineMapParametersKey.withLayer(Layer layer) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_createWithLayer(
          layer._handle, errorHandler);
    });
    return OfflineMapParametersKey._instanceCache.instanceWith(handle);
  }

  /// Create an offline map parameters key for the given table.
  ///
  /// The returned key can be used to retrieve a data type specific parameter
  /// object from the dictionary returned by
  /// [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters].
  ///
  /// Parameters:
  /// - `table` — table that is to be used to access dictionaries in
  /// [GenerateOfflineMapParameterOverrides] object.
  factory OfflineMapParametersKey.withTable(ServiceFeatureTable table) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_createWithTable(
          table._handle, errorHandler);
    });
    return OfflineMapParametersKey._instanceCache.instanceWith(handle);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// Service URL of this key.
  ///
  /// The service URL is the URL associated with a data specific parameter
  /// object in one of the dictionaries owned by a
  /// [GenerateOfflineMapParameterOverrides] instance.
  Uri? get serviceUri => _serviceUri.value;

  final Memoized<Uri?> _serviceUri;

  /// The parameter type of this key.
  ///
  /// The type of this key indicates which
  /// [GenerateOfflineMapParameterOverrides] dictionary this key belongs to:
  /// | Parameter Type                                  | Dictionary                                                               |
  /// |-------------------------------------------------|--------------------------------------------------------------------------|
  /// | [OfflineMapParametersType.generateGeodatabase] | [GenerateOfflineMapParameterOverrides.generateGeodatabaseParameters] |
  /// | [OfflineMapParametersType.exportVectorTiles]   | [GenerateOfflineMapParameterOverrides.exportVectorTilesParameters]   |
  /// | [OfflineMapParametersType.exportTileCache]     | [GenerateOfflineMapParameterOverrides.exportTileCacheParameters]     |
  OfflineMapParametersType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_getType(
          _handle, errorHandler);
    });
    return OfflineMapParametersType._fromCoreValue(coreValue);
  }

  /// Clones the [OfflineMapParametersKey].
  ///
  /// Return Value: A new [OfflineMapParametersKey] with the same values as the
  /// current [OfflineMapParametersKey].
  OfflineMapParametersKey clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_clone(
          _handle, errorHandler);
    });
    return OfflineMapParametersKey._fromHandle(objectHandle)!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OfflineMapParametersKey) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapParametersKey_hash(_handle, errorHandler);
    });
  }
}

final class _OfflineMapParametersKeyFactory
    implements
        _InstanceFactory<OfflineMapParametersKey,
            RT_OfflineMapParametersKeyHandle> {
  @override
  OfflineMapParametersKey createInstance(
      {required RT_OfflineMapParametersKeyHandle handle}) {
    return OfflineMapParametersKey._withHandle(handle);
  }

  @override
  void destroyHandle(RT_OfflineMapParametersKeyHandle handle) {
    bindings.OfflineMapParametersKey_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_OfflineMapParametersKeyHandle handle) {
    return runtimecore.RT_OfflineMapParametersKey_getInstanceId(
        handle, ffi.nullptr);
  }
}

/// Indicates the type of parameters object used to take layers offline.
enum OfflineMapParametersType {
  /// The parameter is of type [GenerateGeodatabaseParameters].
  generateGeodatabase,

  /// The parameter is of type [ExportVectorTilesParameters].
  exportVectorTiles,

  /// The parameter is of type [ExportTileCacheParameters].
  exportTileCache,

  /// The parameter type is unknown.
  unknown;

  factory OfflineMapParametersType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return generateGeodatabase;
      case 1:
        return exportVectorTiles;
      case 2:
        return exportTileCache;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case generateGeodatabase:
        return 0;
      case exportVectorTiles:
        return 1;
      case exportTileCache:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// A Job to synchronize an offline map's geodatabases with their originating
/// services.
///
/// Note that if this job is to be serialized to JSON, its map needs to be
/// loaded first. An attempt to serialize with a not loaded map will throw an
/// [ArcGISExceptionType.mappingNotLoaded] exception.
final class OfflineMapSyncJob extends Job<OfflineMapSyncResult> {
  static OfflineMapSyncJob? _fromHandle(RT_OfflineMapSyncJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  OfflineMapSyncJob._withHandle(super.handle)
      : _geodatabaseDeltaInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncJob_getGeodatabaseDeltaInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _parameters = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncJob_getParameters(
                handle, errorHandler);
          });
          return OfflineMapSyncParameters._fromHandle(objectHandle)!;
        }),
        __portalItems = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncJob_getPortalItems(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncJob_getResult(
                handle, errorHandler);
          });
          return OfflineMapSyncResult._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// Returns information on upload and download delta geodatabases generated
  /// during the sync process.
  ///
  /// Contains a collection of [GeodatabaseDeltaInfo] with one for each
  /// geodatabase synced. These provide information about the synced geodatabase
  /// along with the paths to its uploaded and downloaded deltas.
  ///
  /// Delta geodatabases allow you to troubleshoot sync problems - for example
  /// by inspecting the changes they contain or sending the file to the system
  /// administrator for the feature service.
  ///
  /// This collection will be updated even if the job fails and there are deltas
  /// on disk. This collection will only be updated if
  /// [OfflineMapSyncParameters.keepGeodatabaseDeltas] is true, otherwise it
  /// will remain empty.
  List<GeodatabaseDeltaInfo> get geodatabaseDeltaInfos =>
      _geodatabaseDeltaInfos.value;

  final Memoized<_ArrayList<GeodatabaseDeltaInfo>> _geodatabaseDeltaInfos;

  /// The parameters used by this job.
  OfflineMapSyncParameters get parameters => _parameters.value;

  final Memoized<OfflineMapSyncParameters> _parameters;

  /// Portal items used by the job to access preplanned areas and package items
  /// for scheduled updates.
  ///
  /// This array is not intended for general access. This is only for wrapping
  /// new portal items the job needs to allow requests to get out and
  /// authentication to occur. This does not include portal items from
  /// [OfflineMapSyncTask._portalItems].
  List<PortalItem> get _portalItems => __portalItems.value;

  final Memoized<_ArrayList<PortalItem>> __portalItems;

  /// The result of a succeeded offline map sync job.
  ///
  /// A null if the job has not succeeded.
  @override
  OfflineMapSyncResult? get result => _result.value;

  final Memoized<OfflineMapSyncResult?> _result;
}

/// The result of an [OfflineMapSyncJob] for a single layer or table.
final class OfflineMapSyncLayerResult implements ffi.Finalizable {
  final RT_OfflineMapSyncLayerResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapSyncLayerResult_destroy.cast());

  static OfflineMapSyncLayerResult? _fromHandle(
      RT_OfflineMapSyncLayerResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapSyncLayerResult._withHandle(handle);
  }

  OfflineMapSyncLayerResult._withHandle(
      RT_OfflineMapSyncLayerResultHandle handle)
      : _editErrors = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncLayerResult_getEditErrors(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncLayerResult_getError(
                handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapSyncLayerResult_created(_handle);
    }
  }

  /// The edit errors for a layer or table.
  ///
  /// The layer results returned contains information about row edit errors that
  /// occur on the server during the synchronization of a feature layer.
  /// Server-side errors of this kind are infrequent, so this array is typically
  /// empty.
  List<FeatureEditResult> get editErrors => _editErrors.value;

  final Memoized<_ArrayList<FeatureEditResult>> _editErrors;

  /// An error if the layer or table could not be synchronized, otherwise
  /// returns null.
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// Indicates if an error has been encountered synchronizing this layer or
  /// table.
  bool get hasErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncLayerResult_getHasErrors(
          _handle, errorHandler);
    });
  }
}

/// Parameters used for creating an [OfflineMapSyncJob].
final class OfflineMapSyncParameters implements ffi.Finalizable {
  final RT_OfflineMapSyncParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapSyncParameters_destroy.cast());

  static OfflineMapSyncParameters? _fromHandle(
      RT_OfflineMapSyncParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapSyncParameters._withHandle(handle);
  }

  OfflineMapSyncParameters._withHandle(RT_OfflineMapSyncParametersHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapSyncParameters_created(_handle);
    }
  }

  /// Creates an offline map sync parameters object.
  factory OfflineMapSyncParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncParameters_create(errorHandler);
    });
    return OfflineMapSyncParameters._withHandle(handle);
  }

  /// Indicates whether or not the upload or downloaded delta geodatabases
  /// should be removed at the end of the sync job.
  ///
  /// A delta geodatabase is a file that contains the changes that have occurred
  /// since a mobile replica [Geodatabase] was last synchronized with its
  /// feature service. See
  /// https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm
  /// for an overview of the delta files used in synchronization.
  ///
  /// There are two types of delta geodatabase:
  /// * Local edits, performed on the user's device, are exported as an "upload"
  /// delta that is applied to the originating feature service
  /// * Online edits, performed by other users are requested as a "download"
  /// delta which is then applied to the local replica geodatabase
  ///
  /// Delta geodatabases allow you to troubleshoot sync problems. For example,
  /// you can inspect the geodatabase changes or you could send the file to the
  /// administrator of the feature service.
  ///
  /// You can choose to retain both the uploaded and downloaded delta
  /// geodatabases once the sync job has completed. Set to true to retain both
  /// delta geodatabases and set to false to have them deleted at the end of the
  /// sync job. Deltas will be retained regardless of whether the job succeeds
  /// or fails. Note that when this property is set to true, the upload delta
  /// geodatabase will only be available if there are changes to upload and the
  /// sync direction is [SyncDirection.upload] or [SyncDirection.bidirectional].
  /// The download delta geodatabase will only be available when there are
  /// changes to download and the sync direction is [SyncDirection.download] or
  /// [SyncDirection.bidirectional]. The default value is false.
  ///
  /// No geodatabase deltas will be retained if your geodatabase uses a
  /// scheduled updates workflow.
  bool get keepGeodatabaseDeltas {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncParameters_getKeepGeodatabaseDeltas(
          _handle, errorHandler);
    });
  }

  set keepGeodatabaseDeltas(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncParameters_setKeepGeodatabaseDeltas(
          _handle, value, errorHandler);
    });
  }

  /// Determines whether update packages will be downloaded from an online map
  /// area and applied to the map's data.
  ///
  /// If your map was taken offline with a
  /// [DownloadPreplannedOfflineMapParameters.updateMode] of
  /// [PreplannedUpdateMode.downloadScheduledUpdates] or
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures] then
  /// you can set this property to
  /// [PreplannedScheduledUpdatesOption.downloadAllUpdates] to download and
  /// apply update packages to your offline geodatabases.
  ///
  /// The default value is
  /// [PreplannedScheduledUpdatesOption.downloadAllUpdates].
  PreplannedScheduledUpdatesOption get preplannedScheduledUpdatesOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapSyncParameters_getPreplannedScheduledUpdatesOption(
              _handle, errorHandler);
    });
    return PreplannedScheduledUpdatesOption._fromCoreValue(coreValue);
  }

  set preplannedScheduledUpdatesOption(PreplannedScheduledUpdatesOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore
          .RT_OfflineMapSyncParameters_setPreplannedScheduledUpdatesOption(
              _handle, value.coreValue, errorHandler);
    });
  }

  /// True if a geodatabase feature service replica branch version automatically
  /// reconciles with the default branch upon sync, false otherwise.
  ///
  /// This property only applies to feature services that are branch versioned
  /// and have a true value for the
  /// [SyncCapabilities.supportsBranchVersionReconcile] property.
  ///
  /// The default value is false.
  bool get reconcileBranchVersion {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncParameters_getReconcileBranchVersion(
          _handle, errorHandler);
    });
  }

  set reconcileBranchVersion(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncParameters_setReconcileBranchVersion(
          _handle, value, errorHandler);
    });
  }

  /// Indicates if geodatabase feature service synchronization should roll back
  /// on a failure.
  ///
  /// The default is false (no rollback on failure).
  bool get rollbackOnFailure {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncParameters_getRollbackOnFailure(
          _handle, errorHandler);
    });
  }

  set rollbackOnFailure(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncParameters_setRollbackOnFailure(
          _handle, value, errorHandler);
    });
  }

  /// The synchronization direction for geodatabases registered with feature
  /// services.
  ///
  /// This property applies to any geodatabases that are registered for feature
  /// service synchronization. It does not apply to geodatabases which use
  /// scheduled updates.
  ///
  /// The default value is [SyncDirection.bidirectional].
  ///
  /// If you select [SyncDirection.upload], any download only geodatabases (e.g.
  /// with [FeatureServiceCapabilities.supportsUpdate] = false) will not be
  /// updated and you will receive an
  /// [ArcGISExceptionType.mappingSyncDirectionUploadNotSupported] error in the
  /// associated [OfflineMapSyncResult.layerResults].
  SyncDirection get syncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncParameters_getSyncDirection(
          _handle, errorHandler);
    });
    return SyncDirection._fromCoreValue(coreValue);
  }

  set syncDirection(SyncDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncParameters_setSyncDirection(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The result of an [OfflineMapSyncJob].
final class OfflineMapSyncResult implements ffi.Finalizable {
  final RT_OfflineMapSyncResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapSyncResult_destroy.cast());

  static OfflineMapSyncResult? _fromHandle(
      RT_OfflineMapSyncResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapSyncResult._withHandle(handle);
  }

  OfflineMapSyncResult._withHandle(RT_OfflineMapSyncResultHandle handle)
      : _layerResults = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncResult_getLayerResults(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _tableResults = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncResult_getTableResults(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapSyncResult_created(_handle);
    }
  }

  /// Indicates if the offline map sync result has synchronization errors
  /// available.
  bool get hasErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncResult_getHasErrors(
          _handle, errorHandler);
    });
  }

  /// Indicates whether the mobile map package must be closed and reopened with
  /// a new instance to allow the updates to take effect.
  ///
  /// In some cases, applying updates may require files such as mobile
  /// geodatabases to be replaced with a new version. When reopen is required,
  /// this property will be true and you need to:
  /// * Release all instances of the [MobileMapPackage] and its maps and layers.
  /// For example, you should remove any [ArcGISMap] instances from the
  /// [ArcGISMapViewController] and remove layers and geodatabases from custom
  /// views such as lists and tables of contents. This will allow files to be
  /// closed.
  /// * Call [MobileMapPackage.close] to close the mobile map package instance
  /// and files
  /// * Create a new [MobileMapPackage] instance with the same path
  /// * Load the new [MobileMapPackage]. This will apply updates to geodatabases
  /// that have been replaced via a scheduled updates workflow.
  ///
  /// If your offline map was created using
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures], be
  /// aware that immediately following replacement, the new geodatabase will not
  /// contain the new features that have been synced up to the feature service.
  /// The uploaded features can be downloaded after the next scheduled update
  /// has executed and changes are available for download.
  bool get isMobileMapPackageReopenRequired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapSyncResult_getIsMobileMapPackageReopenRequired(
              _handle, errorHandler);
    });
  }

  /// The synchronization results for geodatabase feature layers.
  Map<Layer, OfflineMapSyncLayerResult> get layerResults => _layerResults.value;

  final Memoized<_UnmodifiableDictionaryMap<Layer, OfflineMapSyncLayerResult>>
      _layerResults;

  /// The synchronization results for tables.
  Map<FeatureTable, OfflineMapSyncLayerResult> get tableResults =>
      _tableResults.value;

  final Memoized<
          _UnmodifiableDictionaryMap<FeatureTable, OfflineMapSyncLayerResult>>
      _tableResults;
}

/// A task to synchronize an offline map's geodatabases with its originating
/// sync-enabled ArcGIS feature services.
///
/// You can take a map offline from a web map using the [OfflineMapTask]. This
/// can be an offline map created ahead-of-time or an on-demand map. For more
/// information, see the
/// [Ahead-of-time vs on-demand](https://developers.arcgis.com/documentation/mapping-apis-and-services/offline/offline-maps/ahead-of-time-vs-on-demand/)
/// workflows. The offline map is stored on the device so its data can be
/// displayed, queried, and edited whilst the device is offline.
///
/// You can update the data content by synchronizing the offline map with its
/// source web map. Edits to offline feature data can be posted to the source
/// web map, and any edits to the source web map's feature data content can be
/// downloaded and applied to the offline map. This brings the source web map
/// content and the offline map content into alignment. Edits to features,
/// non-spatial data, related data, and attachments can be synchronized. A
/// network connection must be present for synchronization. Here are typical
/// steps to synchronize data between the offline map and its source web map:
///
/// * Create an [OfflineMapSyncTask] with the offline map ([ArcGISMap]).
/// * Obtain the [OfflineMapSyncParameters] for the offline map by calling
/// [OfflineMapSyncTask.createDefaultOfflineMapSyncParameters]. Optionally
/// modify these (for example, to specifying a synchronization direction).
/// * Create an [OfflineMapSyncJob] by calling
/// [OfflineMapSyncTask.syncOfflineMap].
/// * Start the [OfflineMapSyncJob]. Upon job completion, examine the
/// [OfflineMapSyncResult] from the [OfflineMapSyncJob.result] to determine
/// whether the synchronization was successful.
///
/// If there are attribute or geometry level conflicts on a feature during
/// synchronization, the most recently synchronized edit will be applied. For
/// example, if both user A and user B edit the same feature while offline, if
/// user A synchronizes their edits first, then user B synchronizes their edits,
/// the updated feature will represent the edits made by user B.
///
/// Synchronization errors typically occur because of network connectivity
/// issues during the sync process. The synchronization mechanism is robust to
/// these types of errors, however, and they can be resolved by synchronizing
/// again when a reliable network connection becomes available.
///
/// If you created the offline map using the ahead-of-time workflow, it may
/// support a synchronization workflow known as update packages. Update packages
/// optimize updating the data contents of a downloaded offline map to the
/// latest contents of the source web map. For more information, see
/// [Update packages](https://main.sites.afd.arcgis.com/documentation/mapping-apis-and-services/offline/offline-maps/update-packages/).
///
/// If you want to download and synchronize individual feature services to a
/// single offline geodatabase, instead of taking a map offline, then you can
/// use the [GeodatabaseSyncTask].
final class OfflineMapSyncTask
    with Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_OfflineMapSyncTaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OfflineMapSyncTask_destroy.cast());

  static OfflineMapSyncTask? _fromHandle(RT_OfflineMapSyncTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapSyncTask._withHandle(handle);
  }

  OfflineMapSyncTask._withHandle(RT_OfflineMapSyncTaskHandle handle)
      : _arcGISMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncTask_getMap(
                handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle)!;
        }),
        __portalItems = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncTask_getPortalItems(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _updateCapabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapSyncTask_getUpdateCapabilities(
                handle, errorHandler);
          });
          return OfflineMapUpdateCapabilities._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapSyncTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapSyncTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapSyncTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapSyncTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapSyncTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates an offline map sync task for synchronizing the geodatabases used
  /// by a map.
  ///
  /// Parameters:
  /// - `arcGISMap` — Map to synchronize.
  factory OfflineMapSyncTask.withMap(ArcGISMap arcGISMap) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncTask_createWithMap(
          arcGISMap._handle, errorHandler);
    });
    final OfflineMapSyncTask object = OfflineMapSyncTask._withHandle(handle);
    object._arcGISMap.cache(arcGISMap);
    return object;
  }

  /// The map to be synchronized.
  ArcGISMap get arcGISMap => _arcGISMap.value;

  final Memoized<ArcGISMap> _arcGISMap;

  /// A collection of portal items used to access preplanned areas and package
  /// items for scheduled updates.
  ///
  /// This array is not intended for general access. This is only for wrapping
  /// portal items to allow requests to get out and authentication to occur.
  List<PortalItem> get _portalItems => __portalItems.value;

  final Memoized<_ArrayList<PortalItem>> __portalItems;

  /// Describes the methods that can be used to obtain updates to the offline
  /// map.
  ///
  /// You can use this property to determine whether an offline map is
  /// configured to use the update packages (see
  /// [OfflineMapUpdateCapabilities.supportsScheduledUpdatesForFeatures]) or to
  /// sync directly with feature services (see
  /// [OfflineMapUpdateCapabilities.supportsSyncWithFeatureServices]). If the
  /// offline map was created using
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures], it
  /// will support both update modes, but you will only be able to upload newly
  /// created features.
  ///
  /// This property will return null until the offline map sync task is loaded.
  OfflineMapUpdateCapabilities? get updateCapabilities =>
      _updateCapabilities.value;

  final Memoized<OfflineMapUpdateCapabilities?> _updateCapabilities;

  /// Retrieves [OfflineMapUpdatesInfo] for the offline map that was used to
  /// construct this task.
  ///
  /// The returned [OfflineMapUpdatesInfo] provides high level information on
  /// what updates are available for this offline map. Information is provided
  /// on:
  /// * Online changes that can be applied to update your offline map
  /// * Local changes from your offline map that can be sent back to the online
  /// services
  ///
  /// Calling this method provides high-level information on the available
  /// updates. It can help you to determine whether to call
  /// [OfflineMapSyncTask.syncOfflineMap] immediately, based upon factors such
  /// as current disk space and network availability. Examine these properties
  /// before starting the potentially time-consuming offline map sync process.
  ///
  /// The resulting [OfflineMapUpdatesInfo] provides a snap-shot of available
  /// updates when this method was called. To check for new updates you need to
  /// call this method again.
  ///
  /// Return Value: A [Future] of [OfflineMapUpdatesInfo].
  Future<OfflineMapUpdatesInfo> checkForUpdates() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncTask_checkForUpdatesAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOfflineMapUpdatesInfo()!);
  }

  /// Cancelable version of [checkForUpdates]. See that method for more
  /// information.
  CancelableOperation<OfflineMapUpdatesInfo> checkForUpdatesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncTask_checkForUpdatesAsync(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOfflineMapUpdatesInfo()!);
  }

  /// This populates the parameters with values appropriate for synchronizing
  /// the feature data in this offline map.
  ///
  /// The default parameters will reflect the mobile geodatabases used by the
  /// offline map.
  ///
  /// Return Value: A [Future] of [OfflineMapSyncParameters].
  Future<OfflineMapSyncParameters> createDefaultOfflineMapSyncParameters() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapSyncTask_createDefaultOfflineMapSyncParametersAsync(
              _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOfflineMapSyncParameters()!);
  }

  /// Cancelable version of [createDefaultOfflineMapSyncParameters]. See that
  /// method for more information.
  CancelableOperation<OfflineMapSyncParameters>
      createDefaultOfflineMapSyncParametersCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapSyncTask_createDefaultOfflineMapSyncParametersAsync(
              _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOfflineMapSyncParameters()!);
  }

  /// Returns a job to synchronize an offline map's geodatabases with their
  /// originating services.
  ///
  /// You should not execute more than one sync on a particular geodatabase at
  /// the same time. This includes any operations that export or import deltas
  /// from the local [Geodatabase]:
  /// * [GeodatabaseSyncTask.exportDelta]
  /// * [GeodatabaseSyncTask.importDelta]
  /// * [SyncGeodatabaseJob]
  /// * [OfflineMapSyncJob]
  ///
  /// Parameters:
  /// - `parameters` — Parameters controlling the offline map synchronization.
  ///
  /// Return Value: A [GenerateOfflineMapJob].
  OfflineMapSyncJob syncOfflineMap(
      {required OfflineMapSyncParameters parameters}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncTask_syncOfflineMap(
          _handle, parameters._handle, errorHandler);
    });
    return OfflineMapSyncJob._fromHandle(objectHandle)!;
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapSyncTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapSyncTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _arcGISMap.invalidateCache();
    __portalItems.invalidateCache();
    _updateCapabilities.invalidateCache();
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
        logger.f('OfflineMapSyncTask unhandled asyncType $asyncType');
    }
  }
}

/// A task used to take a map offline.
///
/// Taking a map offline involves downloading an online map and its data,
/// including all the supported layers, tables, renderers, web map configuration
/// etc. so that it can be used offline without a network connection. There are
/// two workflows available for taking maps offline:
/// * The ahead-of-time workflow (also sometimes referred to as the preplanned
/// workflow)
/// * The on-demand workflow
///
/// Ahead-of-time workflow. In this workflow the author of a web map defines
/// geographical areas (offline map areas) to take offline. ArcGIS Online, or
/// ArcGIS Enterprise, uses these to prepare offline map content that is stored
/// online. Download the offline map content to a device using the
/// [DownloadPreplannedOfflineMapJob]. Note that this API refers to an offline
/// map area as a [PreplannedMapArea]. For more information about authoring
/// offline map areas, see
/// [Take web maps offline](https://doc.arcgis.com/en/arcgis-online/manage-data/take-maps-offline.htm).
///
/// On-demand workflow. Here the app passes a specific area of interest to a
/// [GenerateOfflineMapJob] to generate and download the map content to the
/// device. Using this workflow, you can choose to keep online only services
/// (e.g. those that require a network connection) in your offline map. Be aware
/// that an offline map which uses online only services will require a network
/// connection and may require authentication.
final class OfflineMapTask
    with Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_OfflineMapTaskHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OfflineMapTask_destroy.cast());

  static OfflineMapTask? _fromHandle(RT_OfflineMapTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapTask._withHandle(handle);
  }

  OfflineMapTask._withHandle(RT_OfflineMapTaskHandle handle)
      : _onlineMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapTask_getOnlineMap(
                handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle);
        }),
        _portalItem = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_OfflineMapTask_getPortalItem(
                handle, errorHandler);
          });
          return PortalItem._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _ensureOnlineMapHasRequestHandlerStreamController =
        StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_OfflineMapTask_setEnsureOnlineMapHasRequestHandlerCallback(
                  _handle,
                  bindings.addresses
                      .asyncOfflineMapTaskEnsureOnlineMapHasRequestHandlerEvent,
                  userData,
                  errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore
              .RT_OfflineMapTask_setEnsureOnlineMapHasRequestHandlerCallback(
                  _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_OfflineMapTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void>
      _ensureOnlineMapHasRequestHandlerStreamController;

  /// Set online map ready callback.
  ///
  /// This callback must be set before the offlineMapTask is loaded.
  ///
  /// During loading of the [OfflineMapTask] there may be a new instance of an
  /// [ArcGISMap] created from a portal item.
  ///
  /// The map instance is always exposed in the [OfflineMapTask.onlineMap]
  /// property.
  ///
  /// Client code responding to this callback must read the
  /// [OfflineMapTask.onlineMap] property and provide a request handler for the
  /// map before the callback returns. This will allow the [OfflineMapTask] to
  /// proceed and load the online map and ensure requests are handled
  /// appropriately.
  ///
  /// Note that if the [OfflineMapTask] was initialize with an [ArcGISMap]
  /// instead of a portal item this callback will still be called.
  Stream<void> get _onEnsureOnlineMapHasRequestHandler =>
      _ensureOnlineMapHasRequestHandlerStreamController.stream;

  /// Create the offline map task for the provided online map. The online map
  /// must represent a web map.
  ///
  /// The online map must be of type [PortalItemType.webMap], either on ArcGIS
  /// Online or an on-premise ArcGIS Enterprise Portal.
  ///
  /// Parameters:
  /// - `onlineMap` — Online map specifying the map to take offline.
  factory OfflineMapTask.withOnlineMap(ArcGISMap onlineMap) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_createWithOnlineMap(
          onlineMap._handle, errorHandler);
    });
    return OfflineMapTask._withHandle(handle);
  }

  /// Creates the offline map task with the provided portal item. The portal
  /// item must represent a web map.
  ///
  /// The [PortalItem] must be of type [PortalItemType.webMap], either on ArcGIS
  /// Online or an on-premise ArcGIS Enterprise Portal.
  ///
  /// Parameters:
  /// - `portalItem` — A [PortalItem] specifying a web map to take offline.
  factory OfflineMapTask.withPortalItem(PortalItem portalItem) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_createWithPortalItem(
          portalItem._handle, errorHandler);
    });
    return OfflineMapTask._withHandle(handle);
  }

  /// The online map to be taken offline.
  ///
  /// The online map will be of type [PortalItemType.webMap], either on ArcGIS
  /// Online or an on-premise ArcGIS Enterprise Portal.
  ArcGISMap? get onlineMap => _onlineMap.value;

  final Memoized<ArcGISMap?> _onlineMap;

  /// The portal item that specifies the map to be taken offline.
  ///
  /// The [PortalItem] will be of type [PortalItemType.webMap], either on ArcGIS
  /// Online or an on-premise ArcGIS Enterprise Portal
  PortalItem? get portalItem => _portalItem.value;

  final Memoized<PortalItem?> _portalItem;

  /// Returns a [Future] of [DownloadPreplannedOfflineMapParameters] created
  /// from the specified [PreplannedMapArea].
  ///
  /// A convenience method to create [DownloadPreplannedOfflineMapParameters]
  /// with default values appropriate for taking the specified map area offline.
  ///
  /// The parameters will be populated using the values in the online map's
  /// [OfflineSettings] (if present).
  ///
  /// Parameters:
  /// - `preplannedMapArea` — The offline map area that is to be downloaded from
  /// the online map.
  ///
  /// Return Value: a [Future] of [DownloadPreplannedOfflineMapParameters]
  Future<DownloadPreplannedOfflineMapParameters>
      createDefaultDownloadPreplannedOfflineMapParameters(
          {required PreplannedMapArea preplannedMapArea}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createDefaultDownloadPreplannedOfflineMapParametersAsync(
              _handle, preplannedMapArea._handle, errorHandler);
    });
    return taskHandle.toFuture((element) =>
        element.getValueAsDownloadPreplannedOfflineMapParameters()!);
  }

  /// Cancelable version of
  /// [createDefaultDownloadPreplannedOfflineMapParameters]. See that method for
  /// more information.
  CancelableOperation<DownloadPreplannedOfflineMapParameters>
      createDefaultDownloadPreplannedOfflineMapParametersCancelable(
          {required PreplannedMapArea preplannedMapArea}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createDefaultDownloadPreplannedOfflineMapParametersAsync(
              _handle, preplannedMapArea._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((element) =>
        element.getValueAsDownloadPreplannedOfflineMapParameters()!);
  }

  /// Returns a [Future] of [GenerateOfflineMapParameters] created from the
  /// specified area of interest, min scale and max scale.
  ///
  /// Parameters:
  /// - `areaOfInterest` — The region of the online map that is to be taken
  /// offline. Sets the property [GenerateOfflineMapParameters.areaOfInterest].
  /// - `minScale` — The minimum scale for offline tile caches. Use 0 for all
  /// far out levels. See the property [GenerateOfflineMapParameters.minScale].
  /// - `maxScale` — The maximum scale for offline tile caches. Use 0 for closer
  /// in detailed levels. Sets the property
  /// [GenerateOfflineMapParameters.maxScale].
  ///
  /// Return Value: A [Future] of [GenerateOfflineMapParameters].
  ///
  /// The supported geometry types for the area of interest are [Envelope] and
  /// [Polygon]. The area of interest must have a spatial reference.
  ///
  /// Where a [Polygon] is supplied, features and tiles will be filtered
  /// according to the polygon geometry, which can help reduce the size of the
  /// resulting offline map. Note that the filtered set of tiles may vary,
  /// depending on the underlying service.
  ///
  /// The returned [GenerateOfflineMapParameters] has its itemInfo property
  /// initialized from the offline map task's portal item, if that is set.
  ///
  /// The ItemInfo's thumbnail will be copied from the portal item's thumbnail.
  ///
  /// The default parameters will be populated using the values in the online
  /// map's [OfflineSettings] (if present).
  ///
  /// If the map being taken offline contains an `UtilityNetwork` and is in an
  /// ArcGIS Enterprise 11.1 or later service, the Offline Capability selected
  /// for the `UtilityNetwork` such as "Trace utility network features" will
  /// automatically be reflected in the default parameters created by this
  /// method. If the map being taken offline contains an `UtilityNetwork` and is
  /// in an earlier version of ArcGIS Enterprise, the
  /// [GenerateGeodatabaseParameters.utilityNetworkSyncMode] property is set to
  /// [UtilityNetworkSyncMode.syncSystemTables] for the [Geodatabase] containing
  /// the `UtilityNetwork`. Use
  /// [OfflineMapTask.createGenerateOfflineMapParameterOverrides] to change the
  /// [UtilityNetworkSyncMode] if desired.
  Future<GenerateOfflineMapParameters>
      createDefaultGenerateOfflineMapParameters(
          {required Geometry areaOfInterest,
          double minScale = 0.0,
          double maxScale = 0.0}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createDefaultGenerateOfflineMapParametersWithAreaOfInterestMinScaleMaxScaleAsync(
              _handle,
              areaOfInterest._handle,
              minScale,
              maxScale,
              errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsGenerateOfflineMapParameters()!);
  }

  /// Cancelable version of [createDefaultGenerateOfflineMapParameters]. See
  /// that method for more information.
  CancelableOperation<GenerateOfflineMapParameters>
      createDefaultGenerateOfflineMapParametersCancelable(
          {required Geometry areaOfInterest,
          double minScale = 0.0,
          double maxScale = 0.0}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createDefaultGenerateOfflineMapParametersWithAreaOfInterestMinScaleMaxScaleAsync(
              _handle,
              areaOfInterest._handle,
              minScale,
              maxScale,
              errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsGenerateOfflineMapParameters()!);
  }

  /// Returns a [Future] of [GenerateOfflineMapParameterOverrides] created from
  /// the specified [GenerateOfflineMapParameters] parameters.
  ///
  /// When the task completes the [GenerateOfflineMapParameterOverrides] will be
  /// populated reflecting the values in the [GenerateOfflineMapParameters]
  /// parameters. The overrides may be inspected and modified to change the
  /// offline data before passing onto creating a job with
  /// [OfflineMapTask.generateOfflineMap].
  ///
  /// If there are errors with loading individual layers or tables, or they
  /// cannot be taken offline due to service settings, the outcome depends on
  /// the value of [GenerateOfflineMapParameters.continueOnErrors].
  ///
  /// If [GenerateOfflineMapParameters.continueOnErrors] is true, the overrides
  /// correspond to the remaining layers and tables that can go offline.
  ///
  /// The resulting offline map will not contain the layers or tables which had
  /// errors.
  ///
  /// If [GenerateOfflineMapParameters.continueOnErrors] is false, the returned
  /// [Future] will complete containing an [ArcGISException] in the
  /// [_ArcGISFuture.getError] property from the failed layer or table.
  ///
  /// To check upfront which layers or tables are valid for taking offline see
  /// [OfflineMapTask.getOfflineMapCapabilities].
  ///
  /// If [GenerateOfflineMapParameters.referenceBasemapDirectory] is set, the
  /// overrides corresponding to online basemap layers will be omitted, since no
  /// basemap layers will be downloaded.
  ///
  /// Parameters:
  /// - `parameters` — The generate offline map parameters from which the
  /// overrides will be populated.
  ///
  /// Return Value: a [Future] of [GenerateOfflineMapParameterOverrides]
  Future<GenerateOfflineMapParameterOverrides>
      createGenerateOfflineMapParameterOverrides(
          {required GenerateOfflineMapParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createGenerateOfflineMapParameterOverridesAsync(
              _handle, parameters._handle, errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsGenerateOfflineMapParameterOverrides()!);
  }

  /// Cancelable version of [createGenerateOfflineMapParameterOverrides]. See
  /// that method for more information.
  CancelableOperation<GenerateOfflineMapParameterOverrides>
      createGenerateOfflineMapParameterOverridesCancelable(
          {required GenerateOfflineMapParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_createGenerateOfflineMapParameterOverridesAsync(
              _handle, parameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsGenerateOfflineMapParameterOverrides()!);
  }

  /// Returns a job that is used to download the preplanned map area specified
  /// by the given parameters object.
  ///
  /// The job that is returned is dormant and needs to be explicitly started.
  /// The job will fail if the last directory in the download directory path
  /// cannot be created or is not empty.
  ///
  /// Parameters:
  /// - `parameters` — Specifies parameters for the job including the preplanned
  /// map area to be downloaded.
  /// - `downloadDirectoryUri` — The path to a folder where the map content is
  /// stored on the device. For example, to create a new mobile map package
  /// "my_mobile_map_package" in a parent directory "\[my root
  /// path]/my_mobile_maps", this property would be "\[my root
  /// path]/my_mobile_maps/my_mobile_map_package".
  ///
  /// Return Value: a [DownloadPreplannedOfflineMapJob] to download a preplanned
  /// map area.
  DownloadPreplannedOfflineMapJob downloadPreplannedOfflineMapWithParameters(
      {required DownloadPreplannedOfflineMapParameters parameters,
      required Uri downloadDirectoryUri}) {
    final coreDownloadDirectoryUri =
        _CString(downloadDirectoryUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapTask_downloadPreplannedOfflineMapWithParameters(_handle,
              parameters._handle, coreDownloadDirectoryUri.bytes, errorHandler);
    });
    return DownloadPreplannedOfflineMapJob._fromHandle(objectHandle)!;
  }

  /// Returns a job that is used to generate an offline map using the specified
  /// parameters and overrides.
  ///
  /// The job that is returned is dormant and needs to be explicitly started.
  /// The job will fail if the last directory in the download directory path
  /// cannot be created or is not empty.
  ///
  /// The [GenerateOfflineMapParameterOverrides] allows more control over the
  /// extracted data.
  ///
  /// To create an instance [GenerateOfflineMapParameterOverrides] use
  /// [OfflineMapTask.createGenerateOfflineMapParameterOverrides].
  ///
  /// Some properties on [GenerateOfflineMapParameters] will be ignored when
  /// using [GenerateOfflineMapParameterOverrides] and replaced with equivalent
  /// properties for each service. The overridden properties are:
  /// * [GenerateOfflineMapParameters.includeBasemap]
  /// * [GenerateOfflineMapParameters.returnLayerAttachmentOption]
  /// * [GenerateOfflineMapParameters.attachmentSyncDirection]
  /// * [GenerateOfflineMapParameters.returnSchemaOnlyForEditableLayers]
  /// * [GenerateOfflineMapParameters.isDefinitionExpressionFilterEnabled]
  /// * [GenerateOfflineMapParameters.onlineOnlyServicesOption]
  ///
  /// Parameters:
  /// - `parameters` — [GenerateOfflineMapParameters] specify how to take a map
  /// offline. For example, specify the area of interest, min and max scale,
  /// layer attachment options.
  /// - `downloadDirectoryUri` — The path to a folder where the map content is
  /// stored on the device. For example, to create a new mobile map package
  /// "my_mobile_map_package" in a parent directory "\[my root
  /// path]/my_mobile_maps", this property would be "\[my root
  /// path]/my_mobile_maps/my_mobile_map_package".
  /// - `overrides` — the overrides to the parameters.
  ///
  /// Return Value: a [GenerateOfflineMapJob] to generate an offline map
  GenerateOfflineMapJob generateOfflineMap(
      {required GenerateOfflineMapParameters parameters,
      required Uri downloadDirectoryUri,
      GenerateOfflineMapParameterOverrides? overrides}) {
    final coreDownloadDirectoryUri =
        _CString(downloadDirectoryUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_generateOfflineMapCombined(
          _handle,
          parameters._handle,
          coreDownloadDirectoryUri.bytes,
          overrides?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return GenerateOfflineMapJob._fromHandle(objectHandle)!;
  }

  /// Returns an async [Future] which, when successful, returns the
  /// [OfflineMapCapabilities] containing information on which layers will be
  /// included in an offline map.
  ///
  /// Parameters:
  /// - `parameters` — The parameters for taking a map offline.
  ///
  /// Return Value: A [Future] containing an element of type
  /// [OfflineMapCapabilities].
  Future<OfflineMapCapabilities> getOfflineMapCapabilities(
      {required GenerateOfflineMapParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_getOfflineMapCapabilitiesAsync(
          _handle, parameters._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsOfflineMapCapabilities()!);
  }

  /// Cancelable version of [getOfflineMapCapabilities]. See that method for
  /// more information.
  CancelableOperation<OfflineMapCapabilities>
      getOfflineMapCapabilitiesCancelable(
          {required GenerateOfflineMapParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_getOfflineMapCapabilitiesAsync(
          _handle, parameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsOfflineMapCapabilities()!);
  }

  /// Returns an async [Future] which when successful, contains a list of
  /// preplanned map areas, if there are any.
  ///
  /// Note that calling this method will load the OfflineMapTask if it is not
  /// already loaded.
  ///
  /// Return Value: Returns an array of [PreplannedMapArea].
  Future<List<PreplannedMapArea>> getPreplannedMapAreas() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_getPreplannedMapAreasAsync(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [getPreplannedMapAreas]. See that method for more
  /// information.
  CancelableOperation<List<PreplannedMapArea>>
      getPreplannedMapAreasCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_getPreplannedMapAreasAsync(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapTask_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OfflineMapTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _onlineMap.invalidateCache();
    _portalItem.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType
            .asyncTypeOfflineMapTaskEnsureOnlineMapHasRequestHandlerEvent:
        _ensureOnlineMapHasRequestHandlerStreamController.add(null);
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
        logger.f('OfflineMapTask unhandled asyncType $asyncType');
    }
  }
}

/// Describes supported methods for obtaining updates for an offline map.
final class OfflineMapUpdateCapabilities implements ffi.Finalizable {
  final RT_OfflineMapUpdateCapabilitiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapUpdateCapabilities_destroy.cast());

  static OfflineMapUpdateCapabilities? _fromHandle(
      RT_OfflineMapUpdateCapabilitiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapUpdateCapabilities._withHandle(handle);
  }

  OfflineMapUpdateCapabilities._withHandle(
      RT_OfflineMapUpdateCapabilitiesHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapUpdateCapabilities_created(_handle);
    }
  }

  /// Whether an offline map supports downloading of read-only scheduled update
  /// packages.
  ///
  /// If this property is true, updates are generated whenever the online map
  /// area is refreshed. For example: according to its update schedule.
  ///
  /// Updates are prepared once and cached for download by all users of the
  /// offline map area. Sharing a single set of cached updates, rather than
  /// performing individual sync operations, reduces the load on the back-end
  /// services. This approach is scalable for large deployments. As updates are
  /// only downloaded, this approach can only be used with read-only workflows.
  /// The updates reflect a snapshot of the feature data at the time the online
  /// map area was refreshed. It does not reflect the most up-to-date feature
  /// data. For this approach the web map author must configure the online map
  /// to perform scheduled updates.
  ///
  /// If this property is false, no updates will be available for download.
  bool get supportsScheduledUpdatesForFeatures {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapUpdateCapabilities_getSupportsScheduledUpdatesForFeatures(
              _handle, errorHandler);
    });
  }

  /// Whether an offline map references feature services which are sync enabled.
  bool get supportsSyncWithFeatureServices {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapUpdateCapabilities_getSupportsSyncWithFeatureServices(
              _handle, errorHandler);
    });
  }
}

/// Provides information on the available updates for an offline map.
///
/// This type provides high level information on what updates are available for
/// an offline map. Update information covers both:
/// * Online changes that can be applied to update your offline map
/// * Local changes from your offline map that can be sent back to the online
/// services
final class OfflineMapUpdatesInfo implements ffi.Finalizable {
  final RT_OfflineMapUpdatesInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OfflineMapUpdatesInfo_destroy.cast());

  static OfflineMapUpdatesInfo? _fromHandle(
      RT_OfflineMapUpdatesInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OfflineMapUpdatesInfo._withHandle(handle);
  }

  OfflineMapUpdatesInfo._withHandle(RT_OfflineMapUpdatesInfoHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OfflineMapUpdatesInfo_created(_handle);
    }
  }

  /// Indicates whether there are changes available to download.
  ///
  /// If this property is [OfflineUpdateAvailability.available] then there are
  /// online updates to apply to your offline map.
  ///
  /// If this property is [OfflineUpdateAvailability.none] then there are no
  /// online updates available for your offline map.
  ///
  /// Note that the availability of updates to download can only be determined
  /// for offline maps that use the scheduled updates workflow. See
  /// [PreplannedUpdateMode.downloadScheduledUpdates] and
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures]. If
  /// your offline map is set up to download changes directly from the feature
  /// services (for example using [PreplannedUpdateMode.syncWithFeatureServices]
  /// or created with a [GenerateOfflineMapJob]), then this property will be
  /// [OfflineUpdateAvailability.indeterminate].
  OfflineUpdateAvailability get downloadAvailability {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapUpdatesInfo_getDownloadAvailability(
          _handle, errorHandler);
    });
    return OfflineUpdateAvailability._fromCoreValue(coreValue);
  }

  /// Indicates whether the mobile map package must be reopened after applying
  /// the available updates.
  ///
  /// In some cases, applying updates may require files, such as mobile
  /// geodatabases, to be replaced with a new version. When a reopen will be
  /// required after updating, this property will be true - see
  /// [OfflineMapSyncResult.isMobileMapPackageReopenRequired].
  ///
  /// If your offline map was created using
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures], be
  /// aware that immediately following replacement, the new geodatabase will not
  /// contain the new features that have been synced up to the feature service.
  /// The uploaded features can be downloaded after the next scheduled update
  /// has executed and changes are available for download.
  bool get isMobileMapPackageReopenRequired {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapUpdatesInfo_getIsMobileMapPackageReopenRequired(
              _handle, errorHandler);
    });
  }

  /// The total size in bytes of update files to download for a scheduled
  /// updates workflow.
  ///
  /// The scheduled updates workflow allows read-only updates to be stored with
  /// the online map area and downloaded to your device at a later time. Updates
  /// can cover several sets of changes to the online geodatabase and can cover
  /// multiple geodatabases in an offline map. This property is the total
  /// download size of all files required to update your offline map.
  ///
  /// You can use this information to determine whether you want to download
  /// updates immediately - for example based on available disk space or network
  /// availability.
  ///
  /// If there are no updates available, or your offline map does not use a
  /// scheduled updates workflow, this property will be 0.
  int get scheduledUpdatesDownloadSize {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OfflineMapUpdatesInfo_getScheduledUpdatesDownloadSize(
              _handle, errorHandler);
    });
  }

  /// Indicates whether there are local changes to upload.
  ///
  /// If your offline map contains local edits that can be uploaded to online
  /// feature services, this property will be
  /// [OfflineUpdateAvailability.available].
  ///
  /// If there are no local changes, or your offline map does not support
  /// syncing with feature services, this property will be
  /// [OfflineUpdateAvailability.none].
  OfflineUpdateAvailability get uploadAvailability {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OfflineMapUpdatesInfo_getUploadAvailability(
          _handle, errorHandler);
    });
    return OfflineUpdateAvailability._fromCoreValue(coreValue);
  }
}

/// Enumerates whether offline data has updates, has no updates, or that the
/// availability of updates cannot be determined.
enum OfflineUpdateAvailability {
  /// There are updates available.
  available,

  /// There are no updates available.
  none,

  /// It is not possible to determine whether updates are available, for
  /// example, because the operation is not supported.
  indeterminate;

  factory OfflineUpdateAvailability._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return available;
      case 1:
        return none;
      case -1:
        return indeterminate;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case available:
        return 0;
      case none:
        return 1;
      case indeterminate:
        return -1;
    }
  }
}

/// Enumerates the possible options for dealing with online-only services (those
/// which cannot be taken offline).
enum OnlineOnlyServicesOption {
  /// Online layers and tables that cannot be taken offline will be excluded
  /// when taking a map offline.
  exclude,

  /// Online layers and tables that cannot be taken offline will be included
  /// when taking a map offline and will continue to reference the online
  /// service.
  include,

  /// A given layer or table will be taken offline, included as online content,
  /// or excluded according to the settings in the web map.
  ///
  /// When a web map is created, the author has the option to pre-select which
  /// layers should remain online. This can include:
  /// * Choosing to leave offline-enabled layers online (for example because
  /// they contain data that is frequently updated).
  /// * Choosing whether online-only layers should be included in the offline
  /// map or not.
  ///
  /// If no settings are provided in the web map, the default behavior will be
  /// to omit any online only layers or tables from the offline map. This
  /// matches the [OnlineOnlyServicesOption.exclude] option.
  useAuthoredSettings;

  factory OnlineOnlyServicesOption._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return exclude;
      case 1:
        return include;
      case 2:
        return useAuthoredSettings;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case exclude:
        return 0;
      case include:
        return 1;
      case useAuthoredSettings:
        return 2;
    }
  }
}

/// Represents a single preplanned offline map area.
///
/// Offline map areas are specific work areas or major incident areas that are
/// defined by an online map author ahead of time. Each online map can contain a
/// number of offline map areas. These can be provided in a list by the
/// [OfflineMapTask.getPreplannedMapAreas] method. Each preplanned map area uses
/// map content that is stored online. Download this map content by running a
/// [DownloadPreplannedOfflineMapJob]. Create this job by passing the preplanned
/// map area to the [OfflineMapTask.downloadPreplannedOfflineMapWithParameters]
/// method on the [OfflineMapTask].
///
/// To successfully load a [PreplannedMapArea] the
/// [PreplannedMapArea.packagingStatus] must be
/// [PreplannedPackagingStatus.complete].
final class PreplannedMapArea
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_PreplannedMapAreaHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.PreplannedMapArea_destroyInstance.cast());

  static PreplannedMapArea? _fromHandle(RT_PreplannedMapAreaHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PreplannedMapArea._instanceCache.instanceWith(handle);
  }

  PreplannedMapArea._withHandle(RT_PreplannedMapAreaHandle handle)
      : _packageItems = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PreplannedMapArea_getPackageItems(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _portalItem = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PreplannedMapArea_getPortalItem(
                handle, errorHandler);
          });
          return PortalItem._fromHandle(objectHandle)!;
        }),
        _updateCapabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PreplannedMapArea_getUpdateCapabilities(
                handle, errorHandler);
          });
          return OfflineMapUpdateCapabilities._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.PreplannedMapArea_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PreplannedMapArea_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PreplannedMapArea_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PreplannedMapArea_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PreplannedMapArea_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache = _InstanceCache(
      factory: _PreplannedMapAreaFactory(), kind: 'PreplannedMapArea');

  /// Create an offline map area instance with a portal item that is of type map
  /// area.
  ///
  /// Parameters:
  /// - `portalItem` — [PortalItem] that represents a preplanned offline map
  /// area.
  factory PreplannedMapArea.withItem(PortalItem portalItem) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PreplannedMapArea_createWithItem(
          portalItem._handle, errorHandler);
    });
    final PreplannedMapArea object =
        PreplannedMapArea._instanceCache.instanceWith(handle);
    object._portalItem.cache(portalItem);
    return object;
  }

  /// The area of interest bounding the offline map area.
  ///
  /// The area of interest is returned as a [Geometry], which can be either an
  /// [Envelope] or a [Polygon] depending on how the online map area was
  /// created.
  Geometry? get areaOfInterest {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PreplannedMapArea_getAreaOfInterest(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PreplannedMapArea_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// Portal items for packages related to this preplanned map area.
  ///
  /// When the offline map area has successfully loaded, this collection
  /// contains the portal items for the packages (tile packages or geodatabases)
  /// holding the offline data for the map area.
  List<PortalItem> get packageItems => _packageItems.value;

  final Memoized<_ArrayList<PortalItem>> _packageItems;

  /// Describes the packaging status of the online map area.
  ///
  /// This property allows you to check whether an online [PreplannedMapArea] is
  /// in a [PreplannedPackagingStatus.complete] state and ready to be
  /// downloaded.
  ///
  /// If you attempt to load a [PreplannedMapArea] that is not
  /// [PreplannedPackagingStatus.complete] the [PreplannedMapArea] will fail to
  /// load with an error of [ArcGISExceptionType.commonIllegalState].
  ///
  /// There are four possible values:
  /// * [PreplannedPackagingStatus.complete] indicates the map area is ready for
  /// download and the data has been packaged
  /// * [PreplannedPackagingStatus.processing] indicates that the online map
  /// area is not yet ready to be downloaded. The packages required for the map
  /// area have not been packaged yet. This status will be available after the
  /// [PreplannedMapArea] fails to load.
  /// * [PreplannedPackagingStatus.failed] indicates that an error was
  /// encountered while preparing the online map area or its packages. In this
  /// scenario, the map area cannot be downloaded until the web map author has
  /// resolved the errors. This status will be available after the
  /// [PreplannedMapArea] fails to load.
  /// * [PreplannedPackagingStatus.unknown] indicates that the metadata for the
  /// map area has not been fetched. This will be the value when the map area is
  /// [LoadStatus.notLoaded].
  ///
  /// If the packaging status is [PreplannedPackagingStatus.processing] you can
  /// check it again following these steps:
  /// 1. Create a new [PortalItem] instance using the [PortalItem.uri] in the
  /// [PreplannedMapArea.portalItem].
  /// 2. Create a new [PreplannedMapArea] using the portal item
  /// [PreplannedMapArea.withItem].
  /// 3. Load the [PreplannedMapArea] and check
  /// [PreplannedMapArea.packagingStatus].
  PreplannedPackagingStatus get packagingStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PreplannedMapArea_getPackagingStatus(
          _handle, errorHandler);
    });
    return PreplannedPackagingStatus._fromCoreValue(coreValue);
  }

  /// The portal item that this offline map area was created from.
  PortalItem get portalItem => _portalItem.value;

  final Memoized<PortalItem> _portalItem;

  /// Describes the methods for obtaining updates that are supported for this
  /// offline map area.
  ///
  /// There are two approaches for updating the features in a preplanned offline
  /// map area:
  ///
  /// * Syncing directly with feature services.
  /// * Downloading scheduled updates (or update packages) from the online map
  /// area.
  ///
  /// Choose the approach that best suits your workflow, then select the
  /// appropriate [DownloadPreplannedOfflineMapParameters.updateMode]. For more
  /// details on how to update an offline map, see the [OfflineMapSyncTask].
  ///
  /// If [OfflineMapUpdateCapabilities.supportsSyncWithFeatureServices] is true,
  /// you can sync directly with feature services. This mode gives you full
  /// control over when you upload and download changes. However, performing a
  /// download sync places significant load on the backing feature service, so
  /// this approach does not scale well for very large deployments. Set the
  /// [DownloadPreplannedOfflineMapParameters.updateMode] to
  /// [PreplannedUpdateMode.syncWithFeatureServices] to use this approach.
  ///
  /// If [OfflineMapUpdateCapabilities.supportsScheduledUpdatesForFeatures] is
  /// true, you can download read-only update packages from the online map area.
  /// Updates are prepared on a regular schedule and cached for download by all
  /// users of the offline map area. Sharing a single set of cached updates,
  /// rather than performing individual sync operations, reduces the load on the
  /// back-end services. This approach is scalable for large deployments but
  /// does not support offline editing. Set the
  /// [DownloadPreplannedOfflineMapParameters.updateMode] to
  /// [PreplannedUpdateMode.downloadScheduledUpdates] to use this approach.
  ///
  /// Note that scheduled updates is an optimization that must be enabled by the
  /// web map author when the map area is created.
  ///
  /// If both of the above [OfflineMapUpdateCapabilities] are true, and the
  /// feature services in your online map support creating new features, you can
  /// adopt a hybrid update model where you download read-only update packages
  /// while uploading new features directly to the feature service. This
  /// approach combines the scalability of downloading scheduled updates with
  /// the ability to collect data in the field. However, note that this approach
  /// is strictly add only, meaning that you cannot delete or edit features once
  /// they have been uploaded to the feature service. Set the
  /// [DownloadPreplannedOfflineMapParameters.updateMode] to
  /// [PreplannedUpdateMode.downloadScheduledUpdatesAndUploadNewFeatures] to use
  /// this approach.
  ///
  /// This property will return null until the preplanned map area is loaded.
  OfflineMapUpdateCapabilities? get updateCapabilities =>
      _updateCapabilities.value;

  final Memoized<OfflineMapUpdateCapabilities?> _updateCapabilities;

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PreplannedMapArea_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PreplannedMapArea_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PreplannedMapArea_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PreplannedMapArea_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _packageItems.invalidateCache();
    _portalItem.invalidateCache();
    _updateCapabilities.invalidateCache();
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
        logger.f('PreplannedMapArea unhandled asyncType $asyncType');
    }
  }
}

final class _PreplannedMapAreaFactory
    implements _InstanceFactory<PreplannedMapArea, RT_PreplannedMapAreaHandle> {
  @override
  PreplannedMapArea createInstance(
      {required RT_PreplannedMapAreaHandle handle}) {
    return PreplannedMapArea._withHandle(handle);
  }

  @override
  void destroyHandle(RT_PreplannedMapAreaHandle handle) {
    bindings.PreplannedMapArea_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_PreplannedMapAreaHandle handle) {
    return runtimecore.RT_PreplannedMapArea_getInstanceId(handle, ffi.nullptr);
  }
}

/// Enumerates the different packaging states that an online [PreplannedMapArea]
/// can be in.
///
/// A [PreplannedMapArea] is made up of a set of data packages for each of the
/// layers in the map. When a web map author first creates a map area these
/// packages must be prepared by the relevant online services before the area is
/// ready to be downloaded as an offline map.
///
/// [PreplannedPackagingStatus] lists the possible packaging states for an
/// online map area. The area cannot be downloaded until the value is
/// [PreplannedPackagingStatus.complete].
enum PreplannedPackagingStatus {
  /// Indicates that the packaging status of the [PreplannedMapArea] is unknown.
  ///
  /// This status is returned when your app does not yet know the status of the
  /// online area. For example, this would be the case when the
  /// [PreplannedMapArea] has a load status of [LoadStatus.notLoaded].
  unknown,

  /// Indicates that the [PreplannedMapArea] is not yet ready for download.
  ///
  /// This is the initial status for a [PreplannedMapArea] that has been created
  /// on the web map, but is not yet ready for download.
  processing,

  /// Indicates that a failure occurred when creating the packages for the
  /// [PreplannedMapArea].
  ///
  /// This status means that the [PreplannedMapArea] cannot be downloaded.
  /// Failures encountered while creating packages need to be addressed by the
  /// web map author.
  failed,

  /// Indicates that packaging is complete and the [PreplannedMapArea] is ready
  /// to be downloaded.
  ///
  /// This status means that all packages required to download the
  /// [PreplannedMapArea] have been successfully prepared.
  complete;

  factory PreplannedPackagingStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return unknown;
      case 1:
        return processing;
      case 2:
        return failed;
      case 3:
        return complete;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return 0;
      case processing:
        return 1;
      case failed:
        return 2;
      case complete:
        return 3;
    }
  }
}

/// Enumerates options for downloading read-only preplanned updates from an
/// online map area.
enum PreplannedScheduledUpdatesOption {
  /// No updates will be downloaded.
  noUpdates,

  /// All available updates for feature data will be downloaded.
  downloadAllUpdates;

  factory PreplannedScheduledUpdatesOption._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return noUpdates;
      case 1:
        return downloadAllUpdates;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case noUpdates:
        return 0;
      case downloadAllUpdates:
        return 1;
    }
  }
}

/// Different modes for how updates are obtained for a preplanned offline map
/// area.
enum PreplannedUpdateMode {
  /// No feature updates will be performed.
  noUpdates,

  /// Changes, including local edits, will be synced directly with the
  /// underlying feature services.
  ///
  /// This mode gives you full control over when you upload and download
  /// changes. However, performing a download sync places additional load on the
  /// backing feature service, so this approach does not scale well for larger
  /// deployments.
  ///
  /// This mode is available when the [PreplannedMapArea.updateCapabilities]
  /// include [OfflineMapUpdateCapabilities.supportsSyncWithFeatureServices].
  syncWithFeatureServices,

  /// Scheduled, read-only updates will be downloaded from the online map area
  /// and applied to the local mobile geodatabases.
  ///
  /// Updates are prepared on a regular schedule and cached for download by all
  /// users of the offline map area. Sharing a single set of cached updates,
  /// rather than performing individual sync operations, reduces the load on the
  /// back-end services. This approach is scalable for large deployments but
  /// does not support offline editing.
  ///
  /// This mode is available when the [PreplannedMapArea.updateCapabilities]
  /// include
  /// [OfflineMapUpdateCapabilities.supportsScheduledUpdatesForFeatures].
  downloadScheduledUpdates,

  /// Scheduled, read-only updates are downloaded from the online map area and
  /// applied to the local mobile geodatabases. Newly added features can also be
  /// uploaded to the feature service.
  ///
  /// This is an advanced workflow that improves the scalability of feature
  /// services. When available, applicable scheduled update packages are
  /// downloaded and merged into a local geodatabase. This allows for efficient
  /// downloading of changes. New features are uploaded using feature sync,
  /// which is an efficient operation in the feature service.
  ///
  /// Note that when the required update packages are not available, the local
  /// geodatabase will be replaced with a new copy.
  /// [OfflineMapUpdatesInfo.isMobileMapPackageReopenRequired] indicates that a
  /// new copy of a geodatabase will be downloaded. Local adds on your device
  /// must be uploaded to the feature service before the database can safely be
  /// replaced.
  ///
  /// Be aware that immediately following replacement, the new geodatabase may
  /// not contain the new features that have been synced up to the feature
  /// service, as this relies on a subsequent scheduled update to download to
  /// the client. The new features will be retrieved when the next scheduled
  /// update is downloaded and applied.
  ///
  /// This mode is available when the [PreplannedMapArea.updateCapabilities]
  /// include both
  /// [OfflineMapUpdateCapabilities.supportsSyncWithFeatureServices] and
  /// [OfflineMapUpdateCapabilities.supportsScheduledUpdatesForFeatures] and the
  /// feature services in your map support creating new features.
  downloadScheduledUpdatesAndUploadNewFeatures;

  factory PreplannedUpdateMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return noUpdates;
      case 1:
        return syncWithFeatureServices;
      case 2:
        return downloadScheduledUpdates;
      case 3:
        return downloadScheduledUpdatesAndUploadNewFeatures;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case noUpdates:
        return 0;
      case syncWithFeatureServices:
        return 1;
      case downloadScheduledUpdates:
        return 2;
      case downloadScheduledUpdatesAndUploadNewFeatures:
        return 3;
    }
  }
}

/// Indicate the type of layers we wish to include attachments with when taking
/// feature layers offline.
enum ReturnLayerAttachmentOption {
  /// Don't include attachments when taking feature layers offline.
  none,

  /// Include attachments with all feature layers when taking offline.
  allLayers,

  /// Only include attachments with read-only feature layers when taking
  /// offline.
  readOnlyLayers,

  /// Only include attachments with editable feature layers when taking offline.
  ///
  /// For offline maps, a feature layer is considered to be editable if the
  /// feature service has capabilities that include any of create, update or
  /// delete. A read-only layer is one that supports sync, but does not have any
  /// of create, update or delete capability. Service capabilities are
  /// accessible from service infos see
  /// [ArcGISFeatureServiceInfo.featureServiceCapabilities] or
  /// [ArcGISFeatureLayerInfo.capabilities].
  editableLayers;

  factory ReturnLayerAttachmentOption._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return allLayers;
      case 2:
        return readOnlyLayers;
      case 3:
        return editableLayers;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case allLayers:
        return 1;
      case readOnlyLayers:
        return 2;
      case editableLayers:
        return 3;
    }
  }
}
