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

/// The direction to synchronize attachments as part of geodatabase sync task.
enum AttachmentSyncDirection {
  /// There is no specified attachment sync direction.
  none,

  /// The attachment changes are uploaded only.
  upload,

  /// The attachment changes are both uploaded and downloaded.
  bidirectional;

  factory AttachmentSyncDirection._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return upload;
      case 2:
        return bidirectional;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case upload:
        return 1;
      case bidirectional:
        return 2;
    }
  }
}

/// A [Job] that requests a feature service to generate a geodatabase file to be
/// downloaded for offline use.
final class GenerateGeodatabaseJob extends Job<Geodatabase> {
  static GenerateGeodatabaseJob? _fromHandle(
      RT_GenerateGeodatabaseJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  GenerateGeodatabaseJob._withHandle(super.handle)
      : _result = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateGeodatabaseJob_getResult(
                handle, errorHandler);
          });
          return Geodatabase._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// For a successfully completed job, the result returns the local
  /// geodatabase. Otherwise, null is returned.
  ///
  /// If the job is in progress then a null result is returned until the job
  /// successfully completes. The returned geodatabase is in a not loaded state;
  /// use [Geodatabase.load] to load it. A geodatabase downloaded in this way
  /// can contain features, annotation and dimensions that are accessed with the
  /// [Geodatabase.geodatabaseFeatureTables],
  /// `Geodatabase.geodatabaseAnnotationTables` and
  /// `Geodatabase.geodatabaseDimensionTables` collections, respectively.
  @override
  Geodatabase? get result => _result.value;

  final Memoized<Geodatabase?> _result;
}

/// The parameters that specify how a sync-enabled geodatabase is generated and
/// downloaded from an ArcGIS feature service using a [GenerateGeodatabaseJob].
///
/// To generate parameters with values which take into account the capabilities
/// supported by the ArcGIS feature service and the data it contains, call
/// [GeodatabaseSyncTask.createDefaultGenerateGeodatabaseParameters]. You can
/// then modify the parameters with any desired changes. Alternatively, you can
/// generate an empty set of parameters using
/// [GenerateGeodatabaseParameters.new] and set the parameters individually. To
/// create a [GenerateGeodatabaseJob], pass the parameters to the
/// [GeodatabaseSyncTask.generateGeodatabase] method and provide a path where
/// the .geodatabase file can be downloaded to on the device.
///
/// You can also use the [GenerateGeodatabaseParameters] to provide more
/// fine-grained control over the geodatabase that is exported when an offline
/// map is generated. For more information, see the
/// [GenerateOfflineMapParameterOverrides] class.
final class GenerateGeodatabaseParameters
    implements _InstanceId, ffi.Finalizable {
  final RT_GenerateGeodatabaseParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GenerateGeodatabaseParameters_destroyInstance.cast());

  static GenerateGeodatabaseParameters? _fromHandle(
      RT_GenerateGeodatabaseParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GenerateGeodatabaseParameters._instanceCache.instanceWith(handle);
  }

  GenerateGeodatabaseParameters._withHandle(
      RT_GenerateGeodatabaseParametersHandle handle)
      : _layerOptions = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GenerateGeodatabaseParameters_getLayerOptions(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GenerateGeodatabaseParameters_getOutSpatialReference(
                    handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GenerateGeodatabaseParameters_setOutSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GenerateGeodatabaseParameters_created(_handle);
    }
  }

  static final _instanceCache = _InstanceCache(
      factory: _GenerateGeodatabaseParametersFactory(),
      kind: 'GenerateGeodatabaseParameters');

  /// Create a parameters object for use with the generate method on the
  /// geodatabase sync task.
  factory GenerateGeodatabaseParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_create(errorHandler);
    });
    return GenerateGeodatabaseParameters._instanceCache.instanceWith(handle);
  }

  /// Specifies the direction for attachments to be synchronized.
  ///
  /// This parameter is available when the service resource sync capabilities
  /// includes supportsAttachmentsSyncDirection. This parameter defines how
  /// attachments will be synced and is only applicable if the feature service
  /// has attachments. [AttachmentSyncDirection.bidirectional] - Attachment
  /// edits can be both uploaded from the client and downloaded from the service
  /// when syncing. [AttachmentSyncDirection.upload] - Attachment edits can only
  /// be uploaded from the client when syncing. This is useful in cases where
  /// the data collector does not want to consume space with attachments from
  /// the service, but does need to collect new attachments.
  /// [AttachmentSyncDirection.none] - Attachment edits are never synced from
  /// either the client or the server. When
  /// [GenerateGeodatabaseParameters.returnAttachments] is set to true, you can
  /// set [GenerateGeodatabaseParameters.attachmentSyncDirection] to either
  /// [AttachmentSyncDirection.bidirectional] (default) or
  /// [AttachmentSyncDirection.upload]. In this case, create replica includes
  /// attachments from the service. When
  /// [GenerateGeodatabaseParameters.returnAttachments] is set to false, you can
  /// set [GenerateGeodatabaseParameters.attachmentSyncDirection] to either
  /// [AttachmentSyncDirection.upload] or [AttachmentSyncDirection.none]
  /// (default). In this case, the geodatabase does not include attachments from
  /// the service. Attachment sync direction is set during the
  /// [GeodatabaseSyncTask.generateGeodatabase] operation and cannot be
  /// overridden during [GeodatabaseSyncTask.syncGeodatabase].
  AttachmentSyncDirection get attachmentSyncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateGeodatabaseParameters_getAttachmentSyncDirection(
              _handle, errorHandler);
    });
    return AttachmentSyncDirection._fromCoreValue(coreValue);
  }

  set attachmentSyncDirection(AttachmentSyncDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setAttachmentSyncDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The geometry that is used to intersect the features in the service to
  /// replicate into the geodatabase.
  ///
  /// This is typically an envelope, but other geometry types can be used too.
  /// An intersects test will be used to determine which features are
  /// replicated.
  Geometry? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getExtent(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set extent(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setExtent(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// The list of layers and tables to include in the geodatabase if the sync
  /// model is layer.
  ///
  /// This must be populated with minimum of one valid layer id. For valid
  /// layers and tables see [ArcGISFeatureServiceInfo.layerInfos] and
  /// [ArcGISFeatureServiceInfo.tableInfos]. You can also populate with all
  /// layers using
  /// [GeodatabaseSyncTask.createDefaultGenerateGeodatabaseParameters]
  List<GenerateLayerOption> get layerOptions => _layerOptions.value;

  final Memoized<_MutableArrayList<GenerateLayerOption>> _layerOptions;

  /// The spatial reference that is used for the generated geodatabase.
  ///
  /// If this is null, the Extent's spatial reference is used. If that is null
  /// the feature services spatial reference is then used.
  SpatialReference? get outSpatialReference => _outSpatialReference.value;

  set outSpatialReference(SpatialReference? value) =>
      _outSpatialReference.value = value;

  final Memoized<SpatialReference?> _outSpatialReference;

  /// Indicates if attachments are added to the geodatabase.
  ///
  /// The default value is false. This parameter is only applicable if the
  /// feature service has attachments.
  bool get returnAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getReturnAttachments(
          _handle, errorHandler);
    });
  }

  set returnAttachments(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setReturnAttachments(
          _handle, value, errorHandler);
    });
  }

  /// Specifies whether Annotation data is to be included from the service, when
  /// generating, or downloading to, an offline geodatabase.
  ///
  /// Feature layers and tables are always included in the generation and
  /// synchronization of the geodatabase. Annotation data can be optionally
  /// included when downloading from the service.
  ///
  /// Once this data is taken offline to a local geodatabase, any subsequent
  /// inserts, edits or deletions will NOT be applied to the server data when
  /// re-synchronized. If features linked to the annotation have been changed,
  /// the server WILL apply the feature-linked-annotation updates. Another
  /// download from the server will replace any offline inserts, edits or
  /// deletions of Annotation features.
  ///
  /// The default value is true. Annotation data will be included.
  ///
  /// `SyncCapabilities.supportsAnnotations` can be used to check whether
  /// Annotation data is available from the service.
  ///
  /// This property can be used at the same time as specifying other additional
  /// data types to be included.
  bool get syncAnnotations {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getSyncAnnotations(
          _handle, errorHandler);
    });
  }

  set syncAnnotations(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setSyncAnnotations(
          _handle, value, errorHandler);
    });
  }

  /// Specifies whether Contingent Value data is to be included from the
  /// service, when generating, or synchronizing with, an offline geodatabase.
  ///
  /// Feature layers and tables are always included in the generation and
  /// synchronization of the geodatabase. Contingent Value data can be
  /// optionally included.
  ///
  /// The default value is true. Contingent Value data will be included.
  ///
  /// `SyncCapabilities.supportsContingentValues` can be used to check whether
  /// Contingent Value data is available from the service.
  ///
  /// This property can be used at the same time as specifying other additional
  /// data types to be included.
  bool get syncContingentValues {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateGeodatabaseParameters_getSyncContingentValues(
              _handle, errorHandler);
    });
  }

  set syncContingentValues(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setSyncContingentValues(
          _handle, value, errorHandler);
    });
  }

  /// Specifies whether Dimension data is to be included from the service, when
  /// generating, or synchronizing with, an offline geodatabase.
  ///
  /// Feature layers and tables are always included in the generation and
  /// synchronization of the geodatabase. Dimension data can be optionally
  /// included.
  ///
  /// The default value is true. Dimension data will be included.
  ///
  /// `SyncCapabilities.supportsDimensions` can be used to check whether
  /// Dimension data is available from the service.
  ///
  /// This property can be used at the same time as specifying other additional
  /// data types to be included.
  bool get syncDimensions {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getSyncDimensions(
          _handle, errorHandler);
    });
  }

  set syncDimensions(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setSyncDimensions(
          _handle, value, errorHandler);
    });
  }

  /// The synchronization model that will be used generate a geodatabase.
  ///
  /// The default is sync model is Layer. Check the services supports the
  /// required sync model, see [ArcGISFeatureServiceInfo.syncCapabilities].
  SyncModel get syncModel {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_getSyncModel(
          _handle, errorHandler);
    });
    return SyncModel._fromCoreValue(coreValue);
  }

  set syncModel(SyncModel value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setSyncModel(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Specifies the generation and synchronization mode of Utility Network data
  /// from the service to an offline geodatabase.
  ///
  /// Feature layers and tables are always included in the generation and
  /// synchronization of the geodatabase. Utility Network System data can be
  /// optionally included.
  ///
  /// When this property is set to something other than
  /// [UtilityNetworkSyncMode.none], the schema of all data layers and tables in
  /// the feature service is required to support querying associations or
  /// tracing offline.
  ///
  /// You can filter feature data using
  /// [GenerateGeodatabaseParameters.layerOptions] by:
  /// * setting [GenerateLayerOption.queryOption] to
  /// [GenerateLayerQueryOption.none]
  /// * specifying a [GenerateLayerOption.whereClause]
  /// * setting [GenerateLayerOption.useGeometry] to true
  ///
  /// Excluding data layers or including system layers of the feature service in
  /// the [GenerateGeodatabaseParameters.layerOptions] will result in an error
  /// in the [GenerateGeodatabaseJob].
  ///
  /// Use [SyncCapabilities] to check which synchronization mode the feature
  /// service supports. If `SyncCapabilities.supportsUtilityNetworkSystem` is
  /// true, [UtilityNetworkSyncMode.syncSystemTables] may be used. If
  /// `SyncCapabilities.supportsUtilityNetworkTopology` is also true,
  /// [UtilityNetworkSyncMode.syncSystemAndTopologyTables] may be used.
  ///
  /// Setting this property to something other than
  /// [UtilityNetworkSyncMode.none] allows offline `UtilityNetwork` query
  /// associations. Setting this property to
  /// `SyncCapabilities.supportsUtilityNetworkTopology` also enables offline
  /// tracing.
  ///
  /// When a replica is created with tracing support from an ArcGIS Enterprise
  /// 11.2 or earlier feature service, the
  /// [GenerateGeodatabaseParameters.syncModel] must be [SyncModel.none]. As of
  /// ArcGIS Enterprise 11.3, feature services configured with edit capabilities
  /// will support [SyncModel.geodatabase].
  ///
  /// <table>
  ///   <tr>
  ///     <th>Utility network sync mode ([UtilityNetworkSyncMode])</th>
  ///     <th>Required sync capabilities ([SyncCapabilities])</th>
  ///     <th>Enables utility network capabilities (`UtilityNetworkCapabilities`)</th>
  ///   </tr>
  ///   <tr>
  ///     <td>[UtilityNetworkSyncMode.none]</td>
  ///     <td>No sync capability required</td>
  ///     <td>No utility network capability enabled</td>
  ///   </tr>
  ///   <tr>
  ///     <td>[UtilityNetworkSyncMode.syncSystemTables]</td>
  ///     <td>`SyncCapabilities.supportsUtilityNetworkSystem`</td>
  ///     <td>`UtilityNetworkCapabilities.supportsQueryAssociations`</td>
  ///   </tr>
  ///   <tr>
  ///     <td>[UtilityNetworkSyncMode.syncSystemAndTopologyTables]</td>
  ///     <td>`SyncCapabilities.supportsUtilityNetworkSystem`, `SyncCapabilities.supportsUtilityNetworkTopology`</td>
  ///     <td>`UtilityNetworkCapabilities.supportsQueryAssociations`, `UtilityNetworkCapabilities.supportsTrace`</td>
  ///   </tr>
  /// </table>
  ///
  /// The default value is [UtilityNetworkSyncMode.none]. Utility Network System
  /// data will not be included.
  ///
  /// This property can be used at the same time as specifying other additional
  /// data types to be included.
  UtilityNetworkSyncMode get utilityNetworkSyncMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GenerateGeodatabaseParameters_getUtilityNetworkSyncMode(
              _handle, errorHandler);
    });
    return UtilityNetworkSyncMode._fromCoreValue(coreValue);
  }

  set utilityNetworkSyncMode(UtilityNetworkSyncMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateGeodatabaseParameters_setUtilityNetworkSyncMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [GenerateGeodatabaseParameters].
  ///
  /// Return Value: A new [GenerateGeodatabaseParameters] with the same values
  /// as the current [GenerateGeodatabaseParameters].
  GenerateGeodatabaseParameters clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateGeodatabaseParameters_clone(
          _handle, errorHandler);
    });
    return GenerateGeodatabaseParameters._fromHandle(objectHandle)!;
  }
}

final class _GenerateGeodatabaseParametersFactory
    implements
        _InstanceFactory<GenerateGeodatabaseParameters,
            RT_GenerateGeodatabaseParametersHandle> {
  @override
  GenerateGeodatabaseParameters createInstance(
      {required RT_GenerateGeodatabaseParametersHandle handle}) {
    return GenerateGeodatabaseParameters._withHandle(handle);
  }

  @override
  void destroyHandle(RT_GenerateGeodatabaseParametersHandle handle) {
    bindings.GenerateGeodatabaseParameters_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(
      RT_GenerateGeodatabaseParametersHandle handle) {
    return runtimecore.RT_GenerateGeodatabaseParameters_getInstanceId(
        handle, ffi.nullptr);
  }
}

/// An object that is used in conjunction with [GenerateGeodatabaseParameters]
/// to identify what layers or tables to take offline.
///
/// This object allows you to set properties on a layer or table to specify what
/// features to take offline.
final class GenerateLayerOption implements ffi.Finalizable {
  final RT_GenerateLayerOptionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GenerateLayerOption_destroy.cast());

  static GenerateLayerOption? _fromHandle(RT_GenerateLayerOptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GenerateLayerOption._withHandle(handle);
  }

  GenerateLayerOption._withHandle(RT_GenerateLayerOptionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GenerateLayerOption_created(_handle);
    }
  }

  /// Creates a new generate layer option instance with a given layer id for use
  /// with generate geodatabase on the geodatabase sync task.
  ///
  /// Creates a new instance with the supplied layer ID and the following
  /// values:
  /// * [GenerateLayerOption.queryOption] = [GenerateLayerQueryOption.useFilter]
  /// * [GenerateLayerOption.useGeometry] = true
  /// * [GenerateLayerOption.includeRelated] = false
  /// * [GenerateLayerOption.whereClause] = ""
  ///
  /// Parameters:
  /// - `layerId` — A layer id in the service.
  factory GenerateLayerOption({int layerId = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_createWithLayerId(
          layerId, errorHandler);
    });
    return GenerateLayerOption._withHandle(handle);
  }

  /// Creates a new generate layer option instance for use with generate
  /// geodatabase on the geodatabase sync task.
  ///
  /// Creates a new instance with the supplied layer ID and includeRelated value
  /// and the following values:
  /// * [GenerateLayerOption.queryOption] = [GenerateLayerQueryOption.none]
  /// * [GenerateLayerOption.useGeometry] = true
  /// * [GenerateLayerOption.whereClause] = ""
  ///
  /// includeRelated only applies when the queryOption is none.
  ///
  /// Parameters:
  /// - `layerId` — A layer id in the service.
  /// - `includeRelated` — Indicates if related rows should be included.
  factory GenerateLayerOption.withLayerIdIncludeRelated(
      {required int layerId, required bool includeRelated}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_createWithLayerIdIncludeRelated(
          layerId, includeRelated, errorHandler);
    });
    return GenerateLayerOption._withHandle(handle);
  }

  /// Creates a new generate layer option instance with the supplied layer id
  /// and where clause for use with generate geodatabase on the geodatabase sync
  /// task.
  ///
  /// Creates a new instance with the supplied layer ID and where clause and the
  /// following default values:
  /// - [GenerateLayerOption.queryOption] = [GenerateLayerQueryOption.useFilter]
  /// - [GenerateLayerOption.useGeometry] = true
  /// - [GenerateLayerOption.includeRelated] = false
  ///
  /// Parameters:
  /// - `layerId` — A layer id in the service.
  /// - `whereClause` — a where clause to apply to the layer.
  factory GenerateLayerOption.withLayerIdWhereClause(
      {required int layerId, required String whereClause}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWhereClause = _CString(whereClause);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_createWithLayerIdWhereClause(
          layerId, coreWhereClause.bytes, errorHandler);
    });
    return GenerateLayerOption._withHandle(handle);
  }

  /// Indicates if only related rows are added to the specific
  /// [GenerateLayerOption.layerId] in the generated geodatabase.
  ///
  /// This property is only applicable if your data has relationship classes and
  /// when [GenerateLayerOption.queryOption] is [GenerateLayerQueryOption.none].
  ///
  /// Set this to true for a layer or table to retrieve only rows or features
  /// used in relationships.
  ///
  /// A typical scenario is a feature layer related to a large table. Setting
  /// the tables includeRelated to true you can reduce the offline table size to
  /// just rows related to by features that are part of the offline extent.
  ///
  /// The default value of this property is false.
  bool get includeRelated {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_getIncludeRelated(
          _handle, errorHandler);
    });
  }

  set includeRelated(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateLayerOption_setIncludeRelated(
          _handle, value, errorHandler);
    });
  }

  /// The layer or table Id to be included in the service generated geodatabase.
  ///
  /// This defaults to 0.
  int get layerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_getLayerId(
          _handle, errorHandler);
    });
  }

  set layerId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateLayerOption_setLayerId(
          _handle, value, errorHandler);
    });
  }

  /// Whether all, filtered or no features will be copied from the server when
  /// creating a geodatabase.
  ///
  /// Determines how other properties of the [GenerateLayerOption] are
  /// applicable, valid combinations are:
  /// * [GenerateLayerQueryOption.none] to specify no features, or only related
  /// features as specified by the [GenerateLayerOption.includeRelated]
  /// property. When combined with [SyncDirection.upload] synchronization this
  /// option can be used for an efficient upload-only work-flow.
  /// * [GenerateLayerQueryOption.useFilter] to filter features by geometry or
  /// where clause or both. The properties [GenerateLayerOption.useGeometry] and
  /// [GenerateLayerOption.whereClause] are applicable.
  /// * [GenerateLayerQueryOption.all] all other properties are ignored, all
  /// features are returned
  ///
  /// The default is [GenerateLayerQueryOption.useFilter].
  GenerateLayerQueryOption get queryOption {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_getQueryOption(
          _handle, errorHandler);
    });
    return GenerateLayerQueryOption._fromCoreValue(coreValue);
  }

  set queryOption(GenerateLayerQueryOption value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateLayerOption_setQueryOption(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Indicates if [GenerateGeodatabaseParameters.extent] is used to filter the
  /// features for downloading.
  ///
  /// This property is only applicable if [GenerateLayerOption.queryOption] is
  /// [GenerateLayerQueryOption.useFilter].
  ///
  /// When this property is true, features intersecting
  /// [GenerateGeodatabaseParameters.extent] are candidates for taking offline.
  ///
  /// When this property is false, all features are candidates.
  ///
  /// If the [GenerateLayerOption.whereClause] is also set, this further reduces
  /// the features.
  ///
  /// For non-spatial tables this property must be set to false.
  ///
  /// The default value of this property is true.
  bool get useGeometry {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_getUseGeometry(
          _handle, errorHandler);
    });
  }

  set useGeometry(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateLayerOption_setUseGeometry(
          _handle, value, errorHandler);
    });
  }

  /// The where clause of the generate layer option.
  ///
  /// The where clause only applies when [GenerateLayerOption.queryOption] is
  /// [GenerateLayerQueryOption.useFilter].
  ///
  /// The candidate features from a where clause are also filtered by
  /// [GenerateGeodatabaseParameters.extent] if
  /// [GenerateLayerOption.useGeometry] is true.
  String get whereClause {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_getWhereClause(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set whereClause(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GenerateLayerOption_setWhereClause(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Clones the [GenerateLayerOption].
  ///
  /// Return Value: A new [GenerateLayerOption] with the same values as the
  /// current [GenerateLayerOption].
  GenerateLayerOption clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GenerateLayerOption_clone(_handle, errorHandler);
    });
    return GenerateLayerOption._fromHandle(objectHandle)!;
  }
}

/// Control which features for a layer or table are copied from the server when
/// creating a geodatabase.
enum GenerateLayerQueryOption {
  /// All features are copied from the server when creating a geodatabase.
  all,

  /// Combines with [GenerateLayerOption.includeRelated], if false then no
  /// features are copied from the server. If
  /// [GenerateLayerOption.includeRelated] is true then only features that are
  /// in a relationship are included. When used in conjunction with upload-only
  /// synchronization, this enables a faster upload scenario where new features
  /// are only sent to the server and none are downloaded.
  none,

  /// Combines with [GenerateLayerOption.whereClause] and
  /// [GenerateLayerOption.useGeometry] properties when copying features from
  /// the server to take offline.
  useFilter;

  factory GenerateLayerQueryOption._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return all;
      case 1:
        return none;
      case 2:
        return useFilter;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case all:
        return 0;
      case none:
        return 1;
      case useFilter:
        return 2;
    }
  }
}

/// Represents the delta files created to synchronize changes to a
/// [Geodatabase].
///
/// A delta geodatabase is a file that contains the changes that have occurred
/// since a mobile replica [Geodatabase] was last synchronized with its feature
/// service. See
/// https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm
/// for an overview of the delta files used in synchronization.
///
/// There are two types of delta geodatabase:
/// * Local edits, performed on the user's device, are exported as an "upload"
/// delta that is applied to the originating feature service
/// * Online edits, performed by other users are requested as a "download" delta
/// which is then applied to the local replica geodatabase.
///
/// Delta geodatabases allow you to troubleshoot sync problems. For example, you
/// can inspect the geodatabase changes or you could send the file to the
/// administrator of the feature service.
///
/// To access the [GeodatabaseDeltaInfo] after a sync has completed, set one of
/// the following properties to true:
/// * [SyncGeodatabaseParameters.keepGeodatabaseDeltas]. This will populate the
/// [SyncGeodatabaseJob.geodatabaseDeltaInfo] property.
/// * [OfflineMapSyncParameters.keepGeodatabaseDeltas]. This will add instances
/// to the [OfflineMapSyncJob.geodatabaseDeltaInfos] property.
final class GeodatabaseDeltaInfo implements ffi.Finalizable {
  final RT_GeodatabaseDeltaInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeodatabaseDeltaInfo_destroy.cast());

  static GeodatabaseDeltaInfo? _fromHandle(
      RT_GeodatabaseDeltaInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeodatabaseDeltaInfo._withHandle(handle);
  }

  GeodatabaseDeltaInfo._withHandle(RT_GeodatabaseDeltaInfoHandle handle)
      : _downloadDeltaUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseDeltaInfo_getDownloadDeltaPath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _featureServiceUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseDeltaInfo_getFeatureServiceURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _geodatabaseUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseDeltaInfo_getGeodatabasePath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _uploadDeltaUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseDeltaInfo_getUploadDeltaPath(
                handle, errorHandler);
          });
          return stringHandle.toFileUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeodatabaseDeltaInfo_created(_handle);
    }
  }

  /// The full file path of the downloaded delta file, including the file name
  /// and extension.
  ///
  /// This property is the full path to the download delta geodatabase
  /// downloaded from the server during a bidirectional or download sync. The
  /// file will be saved to the user's temp directory and will be subject to the
  /// system's policy for cleanup of temporary files. This property will be null
  /// if there were no server changes to download or the sync direction is
  /// [SyncDirection.upload].
  Uri? get downloadDeltaUri => _downloadDeltaUri.value;

  final Memoized<Uri?> _downloadDeltaUri;

  /// The feature service that is used to sync changes to the geodatabase
  /// specified by [GeodatabaseDeltaInfo.geodatabaseUri].
  Uri get featureServiceUri => _featureServiceUri.value;

  final Memoized<Uri> _featureServiceUri;

  /// The file path to the [Geodatabase] that is used to sync changes, including
  /// the file name and extension.
  ///
  /// The path refers to a .geodatabase file that is used to sync changes to the
  /// service specified by [GeodatabaseDeltaInfo.featureServiceUri]. Each sync
  /// process can create an "upload" delta file
  /// ([GeodatabaseDeltaInfo.uploadDeltaUri]) and/or a "download" delta file
  /// ([GeodatabaseDeltaInfo.downloadDeltaUri]).
  Uri get geodatabaseUri => _geodatabaseUri.value;

  final Memoized<Uri> _geodatabaseUri;

  /// The full file path of the generated upload delta file, including the file
  /// name and extension.
  ///
  /// This property is the full path to the upload delta geodatabase created
  /// from the local [Geodatabase] during a bidirectional or upload sync. The
  /// file will be saved to the user's temp directory and will be subject to the
  /// system's policy for cleanup of temporary files. This property will be null
  /// if there were no changes to upload or the sync direction is
  /// [SyncDirection.download] only.
  Uri? get uploadDeltaUri => _uploadDeltaUri.value;

  final Memoized<Uri?> _uploadDeltaUri;
}

/// A task to generate and synchronize a mobile geodatabase with a sync-enabled
/// ArcGIS feature service.
///
/// Mobile geodatabases are designed for querying and viewing feature data when
/// your app is offline. While offline, users can edit a mobile geodatabase
/// locally and later synchronize changes with its feature service, assuming the
/// associated service supports synchronization. While offline, the geodatabase
/// keeps track of all local edits. When you synchronize the geodatabase with
/// the service, the service receives the geodatabase's local edits, and the
/// geodatabase receives the service's remote edits.
///
/// This task allows you to build apps that can download data from an ArcGIS
/// feature service that has been
/// [enabled for offline use](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/prepare-data-for-offline-use.htm)
/// into a geodatabase. Here are the typical steps to download data from
/// sync-enabled ArcGIS feature service into a geodatabase file on your device:
///
/// * Construct and load the [GeodatabaseSyncTask] with a URL to a sync-enabled
/// ArcGIS feature service.
/// * Create a [Geometry] to define the area of interest that you wish to take
/// offline.
/// * Obtain the [GenerateGeodatabaseParameters] for the area of interest by
/// calling [GeodatabaseSyncTask.createDefaultGenerateGeodatabaseParameters].
/// * Create a [GenerateGeodatabaseJob] by calling
/// [GeodatabaseSyncTask.generateGeodatabase]. Specify a path where the mobile
/// geodatabase (.geodatabase file) is downloaded to.
/// * Start the [GenerateGeodatabaseJob]. Upon job completion, obtain the
/// [Geodatabase] from the [GenerateGeodatabaseJob.result].
///
/// The geodatabase may contain feature layers, annotation layers, related
/// records, non-spatial tables, and attachments. You can create, update, or
/// delete this data according to the capabilities of the source feature
/// service. The geodatabase is registered with the online feature service so
/// that you can synchronize their data when a network connection to the feature
/// service is available. Your app business logic will determine whether the
/// synchronization just downloads changes from the feature service
/// ([SyncDirection.download]), just uploads changes made to the geodatabase
/// ([SyncDirection.upload]), or uploads and downloads changes
/// ([SyncDirection.bidirectional]). Here are the typical steps to synchronize
/// data between the geodatabase file and the source feature service:
///
/// * Create a [GeodatabaseSyncTask] with the [Geodatabase.serviceUri].
/// * Obtain the [SyncGeodatabaseParameters] for the geodatabase by calling
/// [GeodatabaseSyncTask.createDefaultSyncGeodatabaseParameters].
/// * Create a [SyncGeodatabaseJob] by calling
/// [GeodatabaseSyncTask.syncGeodatabase]). Specify the synchronization
/// direction.
/// * Start the [SyncGeodatabaseJob]. Upon job completion, examine the
/// [SyncLayerResult] from the [SyncGeodatabaseJob.result] to determine whether
/// the synchronization was successful.
///
/// When the geodatabase is no longer needed, you should unregister it to clean
/// up the tracking metadata stored on the feature service. Unregistered
/// geodatabases cannot be re-registered. Here are the steps to unregister a
/// geodatabase:
///
/// * Create and load a [Geodatabase] from the downloaded geodatabase file using
/// [Geodatabase.withFileUri].
/// * Examine [Geodatabase.isSyncEnabled] to check that the geodatabase is
/// sync-enabled. If this is false, no further action is needed.
/// * Create a [GeodatabaseSyncTask] with the [Geodatabase.serviceUri].
/// * Unregister the geodatabase using
/// [GeodatabaseSyncTask.unregisterGeodatabase].
///
/// There is another option for working with mobile geodatabases. You can place
/// a copy of a sync-enabled geodatabase onto your device and register it with
/// the associated service using
/// [GeodatabaseSyncTask.registerSyncEnabledGeodatabase]. This will give the
/// geodatabase its own replica ID and you will be able to synchronize the
/// geodatabase with its service.
///
/// If you want to download a portion of a web map and its content, instead of
/// individual ArcGIS feature services, consider using the [OfflineMapTask]. You
/// can then synchronize all of the map's geodatabase content together using the
/// [OfflineMapSyncTask].
final class GeodatabaseSyncTask
    with Loadable
    implements ApiKeyResource, _CallbackReceiver, ffi.Finalizable {
  final RT_GeodatabaseSyncTaskHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeodatabaseSyncTask_destroy.cast());

  static GeodatabaseSyncTask? _fromHandle(RT_GeodatabaseSyncTaskHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeodatabaseSyncTask._withHandle(handle);
  }

  GeodatabaseSyncTask._withHandle(RT_GeodatabaseSyncTaskHandle handle)
      : _featureServiceInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseSyncTask_getFeatureServiceInfo(
                handle, errorHandler);
          });
          return ArcGISFeatureServiceInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseSyncTask_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeodatabaseSyncTask_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeodatabaseSyncTask_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeodatabaseSyncTask_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeodatabaseSyncTask_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeodatabaseSyncTask_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a geodatabase sync task object using a URL to a sync-enabled
  /// ArcGIS feature service.
  ///
  /// Parameters:
  /// - `uri` — A URL to an ArcGIS feature service with the sync capability
  /// enabled.
  factory GeodatabaseSyncTask.withUrl(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_createWithURL(
          coreURI.bytes, errorHandler);
    });
    final GeodatabaseSyncTask object = GeodatabaseSyncTask._withHandle(handle);
    object._uri.cache(uri);
    return object;
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodatabaseSyncTask_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Metadata about the ArcGIS feature service.
  ///
  /// This information is available when the task is loaded.
  ArcGISFeatureServiceInfo? get featureServiceInfo => _featureServiceInfo.value;

  final Memoized<ArcGISFeatureServiceInfo?> _featureServiceInfo;

  /// The URL of the ArcGIS feature service.
  ///
  /// This property is only writable when the task is in load status
  /// [LoadStatus.notLoaded].
  Uri get uri => _uri.value;

  final Memoized<Uri> _uri;

  /// Creates default parameters to generate and download a geodatabase using
  /// the [GenerateGeodatabaseJob].
  ///
  /// This populates the parameters with values that match the feature service.
  /// For example, if the service does not support [SyncModel.layer] then
  /// [SyncModel.geodatabase] will be used and all layers from the service will
  /// be included. Attachments are included by default, but related
  /// tables/layers are not included. Output features are in the spatial
  /// reference of the given extent.
  ///
  /// Parameters:
  /// - `extent` — The extent of the data to be included in the generated
  /// geodatabase. Must be non-null.
  ///
  /// Return Value: Returns a set of parameters that can be used to generate a
  /// geodatabase. The returned [Future] contains a
  /// [GenerateGeodatabaseParameters].
  Future<GenerateGeodatabaseParameters>
      createDefaultGenerateGeodatabaseParameters({required Geometry extent}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultGenerateGeodatabaseParametersAsync(
              _handle, extent._handle, errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsGenerateGeodatabaseParameters()!);
  }

  /// Cancelable version of [createDefaultGenerateGeodatabaseParameters]. See
  /// that method for more information.
  CancelableOperation<GenerateGeodatabaseParameters>
      createDefaultGenerateGeodatabaseParametersCancelable(
          {required Geometry extent}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultGenerateGeodatabaseParametersAsync(
              _handle, extent._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsGenerateGeodatabaseParameters()!);
  }

  /// Creates default parameters to synchronize a geodatabase using the
  /// [SyncGeodatabaseJob].
  ///
  /// This populates the parameters with values that match the geodatabase sync
  /// task's feature service and the geodatabase. For a geodatabase with
  /// [SyncModel.layer] then all geodatabase layers will be included. If the
  /// service is read-only then the sync direction will be
  /// [SyncDirection.download]. Otherwise the sync direction will be
  /// [SyncDirection.bidirectional].
  ///
  /// Parameters:
  /// - `geodatabase` — a geodatabase to sync.
  ///
  /// Return Value: Returns a sync parameters object with defaults populated.
  /// The returned [Future] contains a [SyncGeodatabaseParameters].
  Future<SyncGeodatabaseParameters> createDefaultSyncGeodatabaseParameters(
      {required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultSyncGeodatabaseParametersAsync(
              _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsSyncGeodatabaseParameters()!);
  }

  /// Cancelable version of [createDefaultSyncGeodatabaseParameters]. See that
  /// method for more information.
  CancelableOperation<SyncGeodatabaseParameters>
      createDefaultSyncGeodatabaseParametersCancelable(
          {required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultSyncGeodatabaseParametersAsync(
              _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsSyncGeodatabaseParameters()!);
  }

  /// Creates default parameters for a sync geodatabase using the given sync
  /// direction.
  ///
  /// This populates the parameters with values that match the geodatabase sync
  /// task's feature service and the geodatabase. For a geodatabase with
  /// [SyncModel.layer] then all geodatabase layers will be included. A service
  /// is editable if it has capabilities that include any of create, update or
  /// delete. In this case both [SyncDirection.bidirectional] and
  /// [SyncDirection.upload] are supported sync directions. Alternatively, a
  /// service that does not have create, update or delete capability is
  /// considered read-only and only [SyncDirection.download] will be supported.
  /// If the given sync direction is not compatible with the geodatabase sync
  /// task's feature service or the geodatabase is not sync-enabled, the
  /// returned task will fail.
  ///
  /// Parameters:
  /// - `geodatabase` — a geodatabase to sync.
  /// - `syncDirection` — the sync direction to use.
  ///
  /// Return Value: Returns a Future containing a sync parameter object of type
  /// [SyncGeodatabaseParameters] with the given sync direction. Other
  /// parameters are populated with default values.
  Future<SyncGeodatabaseParameters>
      createDefaultSyncGeodatabaseParametersWithSyncDirection(
          {required Geodatabase geodatabase,
          required SyncDirection syncDirection}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultSyncGeodatabaseParametersWithSyncDirectionAsync(
              _handle,
              geodatabase._handle,
              syncDirection.coreValue,
              errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsSyncGeodatabaseParameters()!);
  }

  /// Cancelable version of
  /// [createDefaultSyncGeodatabaseParametersWithSyncDirection]. See that method
  /// for more information.
  CancelableOperation<SyncGeodatabaseParameters>
      createDefaultSyncGeodatabaseParametersWithSyncDirectionCancelable(
          {required Geodatabase geodatabase,
          required SyncDirection syncDirection}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_createDefaultSyncGeodatabaseParametersWithSyncDirectionAsync(
              _handle,
              geodatabase._handle,
              syncDirection.coreValue,
              errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsSyncGeodatabaseParameters()!);
  }

  /// Generates an upload delta geodatabase file containing all the changes
  /// since the last sync.
  ///
  /// A delta geodatabase contains the changes that have occurred since a mobile
  /// replica [Geodatabase] was last-synchronized with the feature service. See
  /// [Synchronize Replica](https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm)
  /// for an overview of the delta files used in synchronization. An "upload"
  /// delta geodatabase contains the local edits, performed on the user's
  /// device, to be sent to the originating feature service.
  ///
  /// When you run this task, any local edits in the [Geodatabase] will be
  /// exported to the specified output path. The output path should include the
  /// full path and file name (ending in ".geodatabase") for the export.
  ///
  /// The delta file created by this method is not sent to the server and has no
  /// impact on any subsequent sync job. You can call this method repeatedly
  /// without affecting the state of the local geodatabase.
  ///
  /// The task returned by this method has a boolean result that indicates
  /// whether or not a delta geodatabase was created.
  ///
  /// You should not execute more than one sync on a particular geodatabase at
  /// the same time. This includes any operations that export or import deltas
  /// from the local [Geodatabase], which are:
  /// * [GeodatabaseSyncTask.exportDelta]
  /// * [GeodatabaseSyncTask.importDelta]
  /// * [SyncGeodatabaseJob]
  /// * [OfflineMapSyncJob]
  ///
  /// Parameters:
  /// - `geodatabase` — The geodatabase to generate a delta from.
  /// - `outputUri` — The path and filename to save the generated delta to.
  ///
  /// Return Value: A task that generates a geodatabase delta and has an element
  /// type of bool. This bool indicates whether a delta was generated or not.
  static Future<bool> exportDelta(
      {required Geodatabase geodatabase, required Uri outputUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreOutputUri = _CString(outputUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_exportDeltaAsync(
          geodatabase._handle, coreOutputUri.bytes, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [exportDelta]. See that method for more information.
  static CancelableOperation<bool> exportDeltaCancelable(
      {required Geodatabase geodatabase, required Uri outputUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreOutputUri = _CString(outputUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_exportDeltaAsync(
          geodatabase._handle, coreOutputUri.bytes, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Returns a job to generate and download a geodatabase from an ArcGIS
  /// feature service.
  ///
  /// Parameters:
  /// - `parameters` — The parameters for generate geodatabase.
  /// - `pathToGeodatabaseFileUri` — a path including a new filename where the
  /// downloaded geodatabase is written to.
  ///
  /// Return Value: Returns a job to generate a geodatabase into the specified
  /// filename. The filenames should end in .geodatabase.
  GenerateGeodatabaseJob generateGeodatabase(
      {required GenerateGeodatabaseParameters parameters,
      required Uri pathToGeodatabaseFileUri}) {
    final corePathToGeodatabaseFileUri =
        _CString(pathToGeodatabaseFileUri.toFilePath());
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_generateGeodatabase(_handle,
          parameters._handle, corePathToGeodatabaseFileUri.bytes, errorHandler);
    });
    return GenerateGeodatabaseJob._fromHandle(objectHandle)!;
  }

  /// Imports a geodatabase delta and applies it to the given geodatabase.
  ///
  /// A delta geodatabase contains the changes that have occurred since a mobile
  /// replica [Geodatabase] was last-synchronized with the feature service. See
  /// [Synchronize Replica](https://developers.arcgis.com/rest/services-reference/enterprise/synchronize-replica.htm)
  /// for an overview of the delta files used in synchronization. A "download"
  /// delta geodatabase contains the online edits that will be imported to the
  /// local geodatabase.
  ///
  /// The task returned by this method returns an array of [SyncLayerResult].
  ///
  /// You should not execute more than one sync on a particular geodatabase at
  /// the same time. This includes any operations that export or import deltas
  /// from the local [Geodatabase], which are:
  /// * [GeodatabaseSyncTask.exportDelta]
  /// * [GeodatabaseSyncTask.importDelta]
  /// * [SyncGeodatabaseJob]
  /// * [OfflineMapSyncJob]
  ///
  /// Parameters:
  /// - `geodatabase` — The geodatabase to apply a delta to.
  /// - `inputUri` — The path and filename to import the delta from.
  ///
  /// Return Value: A task that imports a geodatabase delta and has an element
  /// type of [List]. The array elements are of type [SyncLayerResult].
  static Future<List<SyncLayerResult>> importDelta(
      {required Geodatabase geodatabase, required Uri inputUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreInputUri = _CString(inputUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_importDeltaAsync(
          geodatabase._handle, coreInputUri.bytes, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [importDelta]. See that method for more information.
  static CancelableOperation<List<SyncLayerResult>> importDeltaCancelable(
      {required Geodatabase geodatabase, required Uri inputUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreInputUri = _CString(inputUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_importDeltaAsync(
          geodatabase._handle, coreInputUri.bytes, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Registers a copy of a sync-enabled geodatabase with an ArcGIS feature
  /// service to allow the copy to sync changes.
  ///
  /// This method is typically used as part of services pattern workflow,
  /// sometimes known as a pre-planned workflow. A sync-enabled geodatabase is
  /// generated centrally and not modified or synced. Copies of this original
  /// geodatabase are distributed and loaded onto each user's device. The copy
  /// must first be registered with the service to allow the server to identify
  /// changes in subsequent sync operations. One of the main benefits of this
  /// workflow is a reduction in server load to generate geodatabases for many
  /// clients. It is important not to sync the copy before registering to ensure
  /// the server can maintain consistent state on each copy. This operation is
  /// not the opposite of [GeodatabaseSyncTask.unregisterGeodatabase] which is
  /// used to remove a geodatabase from the service prior to deletion.
  ///
  /// Parameters:
  /// - `geodatabase` — a geodatabase to register.
  ///
  /// Return Value: Returns a task that registers a geodatabase with the
  /// service.
  Future<void> registerSyncEnabledGeodatabase(
      {required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_registerSyncEnabledGeodatabaseAsync(
              _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [registerSyncEnabledGeodatabase]. See that method
  /// for more information.
  CancelableOperation<void> registerSyncEnabledGeodatabaseCancelable(
      {required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_registerSyncEnabledGeodatabaseAsync(
              _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Returns a job to synchronize a geodatabase back to its source ArcGIS
  /// feature service.
  ///
  /// For a successfully completed job the job's result returns an array of
  /// [SyncLayerResult], typically the array is empty. If individual edits
  /// failed then the result array provides these errors grouped by each table
  /// using [SyncLayerResult] instances which in turn contain each edit error.
  ///
  /// You should not execute more than one sync on a particular geodatabase at
  /// the same time. This includes any operations that export or import deltas
  /// from the local [Geodatabase], which are:
  /// * [GeodatabaseSyncTask.exportDelta]
  /// * [GeodatabaseSyncTask.importDelta]
  /// * [SyncGeodatabaseJob]
  /// * [OfflineMapSyncJob]
  ///
  /// Parameters:
  /// - `parameters` — Parameters to use to sync the geodatabase.
  /// - `geodatabase` — The geodatabase to sync.
  ///
  /// Return Value: A job to synchronize a geodatabase.
  SyncGeodatabaseJob syncGeodatabase(
      {required SyncGeodatabaseParameters parameters,
      required Geodatabase geodatabase}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_syncGeodatabase(
          _handle, parameters._handle, geodatabase._handle, errorHandler);
    });
    return SyncGeodatabaseJob._fromHandle(objectHandle)!;
  }

  /// Returns a job to synchronize a geodatabase back to its source ArcGIS
  /// feature service using the specified sync direction and rollback on failure
  /// boolean value.
  ///
  /// If the given sync direction is not compatible with the geodatabase sync
  /// task's feature service, the returned job will fail.
  ///
  /// You should not execute more than one sync on a particular geodatabase at
  /// the same time. This includes any operations that export or import deltas
  /// from the local [Geodatabase], which are:
  /// * [GeodatabaseSyncTask.exportDelta]
  /// * [GeodatabaseSyncTask.importDelta]
  /// * [SyncGeodatabaseJob]
  /// * [OfflineMapSyncJob]
  ///
  /// Parameters:
  /// - `syncDirection` — Sync direction to use when syncing the geodatabase.
  /// - `rollbackOnFailure` — True to rollback all changes to the service and/or
  /// the geodatabase if the job fails, false to accept any of the changes up
  /// until the point when the job fails.
  /// - `geodatabase` — The geodatabase to sync.
  ///
  /// Return Value: A job to synchronize a geodatabase.
  SyncGeodatabaseJob syncGeodatabaseWithSyncDirection(
      {required SyncDirection syncDirection,
      required bool rollbackOnFailure,
      required Geodatabase geodatabase}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_syncGeodatabaseWithSyncDirection(
              _handle,
              syncDirection.coreValue,
              rollbackOnFailure,
              geodatabase._handle,
              errorHandler);
    });
    return SyncGeodatabaseJob._fromHandle(objectHandle)!;
  }

  /// Unregisters a geodatabase from its source ArcGIS feature service. This
  /// removes the services replica id.
  ///
  /// After unregistering a geodatabase it can no longer be synced back to the
  /// service. This is often used prior to deleting a local geodatabase. This
  /// operation is not related to
  /// [GeodatabaseSyncTask.registerSyncEnabledGeodatabase], which is for
  /// registering copies of a sync-enabled geodatabase.
  ///
  /// Parameters:
  /// - `geodatabase` — a geodatabase to unregister.
  ///
  /// Return Value: Returns a task that will unregister a geodatabase, the task
  /// does not contain a return value.
  Future<void> unregisterGeodatabase({required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_unregisterGeodatabaseAsync(
          _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [unregisterGeodatabase]. See that method for more
  /// information.
  CancelableOperation<void> unregisterGeodatabaseCancelable(
      {required Geodatabase geodatabase}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_unregisterGeodatabaseAsync(
          _handle, geodatabase._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Unregisters a geodatabase from its source ArcGIS feature service using the
  /// geodatabases sync ID. This removes the services replica id.
  ///
  /// This method is used to unregister a geodatabase from a service using the
  /// sync ID. This is commonly used to enable cleanup of the service after the
  /// local geodatabase has already been deleted. See [Geodatabase.syncId].
  /// After unregistering a geodatabase it can no longer be synced back to the
  /// service. This operation is not related to
  /// [GeodatabaseSyncTask.registerSyncEnabledGeodatabase], which is for
  /// registering copies of a sync-enabled geodatabase.
  ///
  /// Parameters:
  /// - `syncId` — sync ID of geodatabase to unregister.
  ///
  /// Return Value: Returns a task that will unregister a geodatabase, the task
  /// does not contain a return value. This task will fail if the unregister
  /// process is unsuccessful.
  Future<void> unregisterGeodatabaseWithSyncId({required Guid syncId}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_unregisterGeodatabaseWithSyncIdAsync(
              _handle, syncId._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [unregisterGeodatabaseWithSyncId]. See that method
  /// for more information.
  CancelableOperation<void> unregisterGeodatabaseWithSyncIdCancelable(
      {required Guid syncId}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeodatabaseSyncTask_unregisterGeodatabaseWithSyncIdAsync(
              _handle, syncId._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseSyncTask_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodatabaseSyncTask_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodatabaseSyncTask_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodatabaseSyncTask_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _featureServiceInfo.invalidateCache();
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
        logger.f('GeodatabaseSyncTask unhandled asyncType $asyncType');
    }
  }
}

/// The direction to synchronize as part of geodatabase sync task.
enum SyncDirection {
  /// There is no specified sync direction.
  none,

  /// The geodatabase changes are downloaded only.
  download,

  /// The geodatabase changes are uploaded only.
  upload,

  /// The geodatabase changes are both uploaded and downloaded.
  bidirectional;

  factory SyncDirection._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return download;
      case 2:
        return upload;
      case 3:
        return bidirectional;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case download:
        return 1;
      case upload:
        return 2;
      case bidirectional:
        return 3;
    }
  }
}

/// A [Job] that synchronizes changes to a local geodatabase back to a feature
/// service.
final class SyncGeodatabaseJob extends Job<List<SyncLayerResult>> {
  static SyncGeodatabaseJob? _fromHandle(RT_SyncGeodatabaseJobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  SyncGeodatabaseJob._withHandle(super.handle)
      : _geodatabaseDeltaInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SyncGeodatabaseJob_getGeodatabaseDeltaInfo(
                handle, errorHandler);
          });
          return GeodatabaseDeltaInfo._fromHandle(objectHandle);
        }),
        _result = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SyncGeodatabaseJob_getResult(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// Returns information on geodatabase upload and download delta files.
  ///
  /// When [SyncGeodatabaseParameters.keepGeodatabaseDeltas] is set to true,
  /// this property provides information about the synced geodatabase along with
  /// the paths to its uploaded and downloaded deltas.
  ///
  /// Delta geodatabases allow you to troubleshoot sync problems - for example
  /// by inspecting the changes they contain or sending the file to the system
  /// administrator for the feature service.
  ///
  /// This property will be set even if the job fails. If
  /// [SyncGeodatabaseParameters.keepGeodatabaseDeltas] is false, this property
  /// will be null.
  GeodatabaseDeltaInfo? get geodatabaseDeltaInfo => _geodatabaseDeltaInfo.value;

  final Memoized<GeodatabaseDeltaInfo?> _geodatabaseDeltaInfo;

  /// For a successfully completed job, an array of [SyncLayerResult] is
  /// returned. If all edits to the geodatabase's tables and layers are synced
  /// successfully, an empty array is returned.
  ///
  /// If the job did not succeed, a null result array is returned.
  ///
  /// If the job succeeded, but individual edits failed to sync, the result
  /// array provides an array of each failed edit operation
  /// ([FeatureEditResult]) grouped by the geodatabase table name. Only errors
  /// are reported.
  ///
  /// If the array is empty, it should be assumed all edits were synchronized
  /// properly and no edit errors were encountered during the sync process.
  @override
  List<SyncLayerResult> get result => _result.value;

  final Memoized<_ArrayList<SyncLayerResult>> _result;
}

/// The parameters that specify how a geodatabase is synchronized with its
/// ArcGIS feature service using a [SyncGeodatabaseJob].
///
/// To generate default parameters that match the geodatabase and its ArcGIS
/// feature service, call
/// [GeodatabaseSyncTask.createDefaultSyncGeodatabaseParameters]. You can then
/// modify the parameters with any desired changes. Alternatively, you can
/// generate an empty set of parameters using [SyncGeodatabaseParameters.new]
/// and set the parameters individually. To create a [SyncGeodatabaseJob], pass
/// the parameters to the [GeodatabaseSyncTask.syncGeodatabase] method and
/// provide the geodatabase to be synchronized.
final class SyncGeodatabaseParameters implements ffi.Finalizable {
  final RT_SyncGeodatabaseParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.SyncGeodatabaseParameters_destroy.cast());

  static SyncGeodatabaseParameters? _fromHandle(
      RT_SyncGeodatabaseParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SyncGeodatabaseParameters._withHandle(handle);
  }

  SyncGeodatabaseParameters._withHandle(
      RT_SyncGeodatabaseParametersHandle handle)
      : _layerOptions = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SyncGeodatabaseParameters_getLayerOptions(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SyncGeodatabaseParameters_created(_handle);
    }
  }

  /// Create a parameters object for use with the sync method on the geodatabase
  /// sync task.
  factory SyncGeodatabaseParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncGeodatabaseParameters_create(errorHandler);
    });
    return SyncGeodatabaseParameters._withHandle(handle);
  }

  /// The synchronization direction that will be used when synchronizing the
  /// geodatabase.
  ///
  /// This is only used if the Geodatabase has a sync model of
  /// [SyncModel.geodatabase], it is ignored for [SyncModel.layer].
  SyncDirection get geodatabaseSyncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_SyncGeodatabaseParameters_getGeodatabaseSyncDirection(
              _handle, errorHandler);
    });
    return SyncDirection._fromCoreValue(coreValue);
  }

  set geodatabaseSyncDirection(SyncDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncGeodatabaseParameters_setGeodatabaseSyncDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Indicates whether or not the upload or downloaded server delta
  /// geodatabases will be removed at the end of the sync job.
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
  bool get keepGeodatabaseDeltas {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncGeodatabaseParameters_getKeepGeodatabaseDeltas(
          _handle, errorHandler);
    });
  }

  set keepGeodatabaseDeltas(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncGeodatabaseParameters_setKeepGeodatabaseDeltas(
          _handle, value, errorHandler);
    });
  }

  /// The list of sync layer options to include in the sync operation.
  List<SyncLayerOption> get layerOptions => _layerOptions.value;

  final Memoized<_MutableArrayList<SyncLayerOption>> _layerOptions;

  /// True if replica branch version automatically reconciles with the default
  /// branch upon sync, false otherwise.
  ///
  /// This parameter is supported by feature services that have the
  /// [SyncCapabilities.supportsBranchVersionReconcile] property set to true.
  ///
  /// If this value is true and
  /// [SyncCapabilities.supportsBranchVersionReconcile] is false,
  /// [GeodatabaseSyncTask] will fail with
  /// [ArcGISExceptionType.geodatabaseReconcileBranchVersionUnsupported]
  ///
  /// The default value is false.
  bool get reconcileBranchVersion {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncGeodatabaseParameters_getReconcileBranchVersion(
          _handle, errorHandler);
    });
  }

  set reconcileBranchVersion(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncGeodatabaseParameters_setReconcileBranchVersion(
          _handle, value, errorHandler);
    });
  }

  /// Indicates if a sync should roll back on a failure.
  bool get rollbackOnFailure {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncGeodatabaseParameters_getRollbackOnFailure(
          _handle, errorHandler);
    });
  }

  set rollbackOnFailure(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncGeodatabaseParameters_setRollbackOnFailure(
          _handle, value, errorHandler);
    });
  }
}

/// The can be used in conjunction with [SyncGeodatabaseParameters] to specify
/// per layer synchronization options.
final class SyncLayerOption implements ffi.Finalizable {
  final RT_SyncLayerOptionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SyncLayerOption_destroy.cast());

  static SyncLayerOption? _fromHandle(RT_SyncLayerOptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SyncLayerOption._withHandle(handle);
  }

  SyncLayerOption._withHandle(RT_SyncLayerOptionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SyncLayerOption_created(_handle);
    }
  }

  /// Creates a new sync layer option with layer id and sync direction.
  ///
  /// Parameters:
  /// - `layerId` — A layer id to sync.
  /// - `syncDirection` — the direction to sync the layer.
  factory SyncLayerOption(
      {int layerId = 0,
      SyncDirection syncDirection = SyncDirection.bidirectional}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerOption_createWithLayerIdSyncDirection(
          layerId, syncDirection.coreValue, errorHandler);
    });
    return SyncLayerOption._withHandle(handle);
  }

  /// The layer or table Id to further filter in the generated geodatabase.
  ///
  /// The Ids used here must match Ids used in the synchronized geodatabase.
  /// Only layers that need further refining need to be included.
  int get layerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerOption_getLayerId(_handle, errorHandler);
    });
  }

  set layerId(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncLayerOption_setLayerId(_handle, value, errorHandler);
    });
  }

  /// The sync direction for the specified layer Id.
  SyncDirection get syncDirection {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerOption_getSyncDirection(
          _handle, errorHandler);
    });
    return SyncDirection._fromCoreValue(coreValue);
  }

  set syncDirection(SyncDirection value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SyncLayerOption_setSyncDirection(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [SyncLayerOption].
  ///
  /// Return Value: A new [SyncLayerOption] with the same values as the current
  /// [SyncLayerOption].
  SyncLayerOption clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerOption_clone(_handle, errorHandler);
    });
    return SyncLayerOption._fromHandle(objectHandle)!;
  }
}

/// An object that represents the result of sync operation on a table or layer
/// if there has been edit errors with individual features.
///
/// If the server has an error applying an edit, this is returned as
/// [FeatureEditResult] error. Only errors are reported, the feature edit
/// results of a sync operation do not contain information about successful
/// adds, deletes or updates.
final class SyncLayerResult implements ffi.Finalizable {
  final RT_SyncLayerResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SyncLayerResult_destroy.cast());

  static SyncLayerResult? _fromHandle(RT_SyncLayerResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SyncLayerResult._withHandle(handle);
  }

  SyncLayerResult._withHandle(RT_SyncLayerResultHandle handle)
      : _editResults = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SyncLayerResult_getEditResults(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SyncLayerResult_created(_handle);
    }
  }

  /// An array of any errors from sync feature edit results representing the
  /// result of a sync.
  ///
  /// If the server has an error applying an edit, this is returned as
  /// [FeatureEditResult] error. Only errors are reported, the feature edit
  /// results of a sync operation do not contain information about successful
  /// adds, deletes or updates.
  List<FeatureEditResult> get editResults => _editResults.value;

  final Memoized<_ArrayList<FeatureEditResult>> _editResults;

  /// The layer or table Id.
  ///
  /// If there's an error the return value is -1.
  int get layerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerResult_getLayerId(_handle, errorHandler);
    });
  }

  /// The table name for the sync result.
  String get tableName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncLayerResult_getTableName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// The various types of sync models.
enum SyncModel {
  /// The geodatabase is not sync enabled.
  none,

  /// Layers within a geodatabase cannot be synchronized independently, the
  /// whole geodatabase must be synced. The sync operation and sync direction
  /// applies to all the layers in the geodatabase.
  geodatabase,

  /// Layers within a geodatabase can be synchronized independently of one
  /// another. Any subset of the layers can be synchronized when running the
  /// sync operation. Also, each layer's sync direction can be set
  /// independently.
  layer;

  factory SyncModel._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return geodatabase;
      case 2:
        return layer;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case geodatabase:
        return 1;
      case layer:
        return 2;
    }
  }
}

/// The different modes for generation and synchronization of utility networks
/// as part of a geodatabase sync task.
enum UtilityNetworkSyncMode {
  /// No utility network resource will be synced.
  none,

  /// Utility Network system tables will be synced.
  ///
  /// The service must return true for
  /// `SyncCapabilities.supportsUtilityNetworkSystem` to support taking Utility
  /// Network System data offline.
  syncSystemTables,

  /// Utility network topology and system tables will be synced.
  ///
  /// The
  /// [utility network topology](https://pro.arcgis.com/en/pro-app/latest/help/data/utility-network/about-network-topology.htm)
  /// enables offline trace capability. The service must return true for
  /// `SyncCapabilities.supportsUtilityNetworkTopology` to support taking
  /// utility network topology offline. Selecting this enum value will also sync
  /// the utility network system tables.
  syncSystemAndTopologyTables;

  factory UtilityNetworkSyncMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return syncSystemTables;
      case 2:
        return syncSystemAndTopologyTables;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case syncSystemTables:
        return 1;
      case syncSystemAndTopologyTables:
        return 2;
    }
  }
}
