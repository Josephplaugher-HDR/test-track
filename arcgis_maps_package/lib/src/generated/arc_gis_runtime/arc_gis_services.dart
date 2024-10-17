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

/// An enumeration of various antialiasing modes.
enum AntialiasingMode {
  /// No antialiasing is performed.
  none,

  /// Minimal antialiasing is performed, optimized for speed.
  fastest,

  /// Some antialiasing is performed, optimized for speed with better quality
  /// than can be achieved with Fastest.
  fast,

  /// A good balance of speed and quality.
  normal,

  /// The best quality antialiasing.  This option takes the longest to render.
  best;

  factory AntialiasingMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return fastest;
      case 2:
        return fast;
      case 3:
        return normal;
      case 4:
        return best;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case fastest:
        return 1;
      case fast:
        return 2;
      case normal:
        return 3;
      case best:
        return 4;
    }
  }
}

/// The metadata for an individual layer or table in an ArcGIS feature service.
///
/// An ArcGIS feature service is a data service that provides access to spatial
/// features stored in layers and non-spatial features stored in tables.
/// [ArcGISFeatureLayerInfo] provides basic information about an individual
/// layer or table in this service, such as the description, geometry type,
/// fields, drawing information, extent, feature templates, editor tracking
/// fields, and whether it has attachments, z-values or m-values.
///
/// You can obtain the [ArcGISFeatureLayerInfo] from a loaded
/// [ArcGISFeatureTable] or from a loaded [FeatureCollectionTable].
final class ArcGISFeatureLayerInfo implements ffi.Finalizable {
  final RT_ArcGISFeatureLayerInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISFeatureLayerInfo_destroy.cast());

  static ArcGISFeatureLayerInfo? _fromHandle(
      RT_ArcGISFeatureLayerInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISFeatureLayerInfo._withHandle(handle);
  }

  ArcGISFeatureLayerInfo._withHandle(RT_ArcGISFeatureLayerInfoHandle handle)
      : _capabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getCapabilities(
                handle, errorHandler);
          });
          return FeatureServiceCapabilities._fromHandle(objectHandle);
        }),
        _defaultSubtypeCode = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getDefaultSubtypeCode(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _drawingInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getDrawingInfo(
                handle, errorHandler);
          });
          return DrawingInfo._fromHandle(objectHandle);
        }),
        _editFieldsInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getEditFieldsInfo(
                handle, errorHandler);
          });
          return EditFieldsInfo._fromHandle(objectHandle);
        }),
        _featureSubtypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getFeatureSubtypes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTemplates = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getFeatureTemplates(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getFeatureTypes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _fields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getFields(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _ownershipBasedAccessControl = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISFeatureLayerInfo_getOwnershipBasedAccessControl(
                    handle, errorHandler);
          });
          return OwnershipBasedAccessControlInfo._fromHandle(objectHandle);
        }),
        _relationshipInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getRelationshipInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _timeInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getTimeInfo(
                handle, errorHandler);
          });
          return LayerTimeInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureLayerInfo_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISFeatureLayerInfo_created(_handle);
    }
  }

  /// True if the layer allows geometry updates, false otherwise.
  bool get allowGeometryUpdates {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getAllowGeometryUpdates(
          _handle, errorHandler);
    });
  }

  /// The layer's attribution.
  String get attribution {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getAttribution(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The capabilities of the layer or table's ArcGIS feature service.
  FeatureServiceCapabilities? get capabilities => _capabilities.value;

  final Memoized<FeatureServiceCapabilities?> _capabilities;

  /// The layer's CIM version.
  String get cimVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getCIMVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the layer has versioned data, false otherwise.
  bool get dataVersioned {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getDataVersioned(
          _handle, errorHandler);
    });
  }

  /// The layer's default subtype code.
  dynamic get defaultSubtypeCode => _defaultSubtypeCode.value;

  final Memoized<dynamic> _defaultSubtypeCode;

  /// True if the layer default visibility value, false otherwise.
  bool get defaultVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getDefaultVisibility(
          _handle, errorHandler);
    });
  }

  /// The layer's description.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer's display field name.
  String get displayFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getDisplayFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer's drawing info.
  DrawingInfo? get drawingInfo => _drawingInfo.value;

  final Memoized<DrawingInfo?> _drawingInfo;

  /// The layer's edit fields record who adds or edits the features and when the
  /// edits are made.
  ///
  /// If editor tracking has not been enabled, then these fields will be null.
  /// For more information, see
  /// [Editor tracking for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/editor-tracking-for-feature-services.htm).
  EditFieldsInfo? get editFieldsInfo => _editFieldsInfo.value;

  final Memoized<EditFieldsInfo?> _editFieldsInfo;

  /// The layer's effective max scale.
  double get effectiveMaxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getEffectiveMaxScale(
          _handle, errorHandler);
    });
  }

  /// The layer's effective min scale.
  double get effectiveMinScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getEffectiveMinScale(
          _handle, errorHandler);
    });
  }

  /// The layer's extent.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The layer's feature subtypes.
  List<FeatureSubtype> get featureSubtypes => _featureSubtypes.value;

  final Memoized<_ArrayList<FeatureSubtype>> _featureSubtypes;

  /// The layer's feature templates.
  List<FeatureTemplate> get featureTemplates => _featureTemplates.value;

  final Memoized<_ArrayList<FeatureTemplate>> _featureTemplates;

  /// The layer's feature types.
  List<FeatureType> get featureTypes => _featureTypes.value;

  final Memoized<_ArrayList<FeatureType>> _featureTypes;

  /// The layer's field definitions.
  List<Field> get fields => _fields.value;

  final Memoized<_ArrayList<Field>> _fields;

  /// The layer's geometry type.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// The layer's global id field name.
  String get globalIdFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getGlobalIdFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the layer has attachments, false otherwise.
  bool get hasAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getHasAttachments(
          _handle, errorHandler);
    });
  }

  /// True if the layer has m-values, false otherwise.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getHasM(
          _handle, errorHandler);
    });
  }

  /// True if the layer has z-values, false otherwise.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getHasZ(
          _handle, errorHandler);
    });
  }

  /// The layer's max record count.
  int get maxRecordCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getMaxRecordCount(
          _handle, errorHandler);
    });
  }

  /// The layer's max scale.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The layer's min scale.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The layer's object id field name.
  String get objectIdFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getObjectIdFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer's ownership based access control.
  OwnershipBasedAccessControlInfo? get ownershipBasedAccessControl =>
      _ownershipBasedAccessControl.value;

  final Memoized<OwnershipBasedAccessControlInfo?> _ownershipBasedAccessControl;

  /// A list of [RelationshipInfo] objects that describe this layer or table's
  /// relationship with another layer or table in the service.
  List<RelationshipInfo> get relationshipInfos => _relationshipInfos.value;

  final Memoized<_ArrayList<RelationshipInfo>> _relationshipInfos;

  /// The layer's ID.
  int get serviceLayerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getServiceLayerId(
          _handle, errorHandler);
    });
  }

  /// The layer's name.
  String get serviceLayerName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getServiceLayerName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The service type of this layer.
  ServiceType get serviceSourceType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getServiceSourceType(
          _handle, errorHandler);
    });
    return ServiceType._fromCoreValue(coreValue);
  }

  /// The layer's type.
  ArcGISFeatureLayerInfoServiceType get serviceType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getServiceType(
          _handle, errorHandler);
    });
    return ArcGISFeatureLayerInfoServiceType._fromCoreValue(coreValue);
  }

  /// The layer's subtype field.
  String get subtypeField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getSubtypeField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the layer supports advanced queries, false otherwise.
  bool get supportsAdvancedQueries {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getSupportsAdvancedQueries(
          _handle, errorHandler);
    });
  }

  /// True if the layer supports OBAC for anonymous users, false otherwise.
  bool get supportsObacForAnonymousUsers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureLayerInfo_getSupportsOBACForAnonymousUsers(
              _handle, errorHandler);
    });
  }

  /// True if the layer supports paginated queries (with a record count and
  /// offset), false otherwise.
  bool get supportsPagination {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getSupportsPagination(
          _handle, errorHandler);
    });
  }

  /// True if the layer supports queries for the extent of features meeting a
  /// specified criteria, false otherwise.
  bool get supportsQueryExtent {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getSupportsQueryExtent(
          _handle, errorHandler);
    });
  }

  /// True if the layer supports rolling back changes on failure, false
  /// otherwise.
  bool get supportsRollbackOnFailureParameter {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureLayerInfo_getSupportsRollbackOnFailureParameter(
              _handle, errorHandler);
    });
  }

  /// True if the layer supports statistical queries, false otherwise.
  bool get supportsStatistics {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getSupportsStatistics(
          _handle, errorHandler);
    });
  }

  /// The layer's time info.
  LayerTimeInfo? get timeInfo => _timeInfo.value;

  final Memoized<LayerTimeInfo?> _timeInfo;

  /// The layer's type id field name.
  String get typeIdFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getTypeIdFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer's URL.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The layer's version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer's default z value.
  double get zDefault {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getZDefault(
          _handle, errorHandler);
    });
  }

  /// True if the layer provides default z values, false otherwise.
  bool get zDefaultsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getZDefaultsEnabled(
          _handle, errorHandler);
    });
  }

  /// Gets a feature type with the given name.
  ///
  /// Parameters:
  /// - `name` — The name.
  ///
  /// Return Value: A [FeatureType].
  FeatureType? getFeatureType({required String name}) {
    final coreName = _CString(name);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getFeatureType(
          _handle, coreName.bytes, errorHandler);
    });
    return FeatureType._fromHandle(objectHandle);
  }

  /// Returns the field definition of the given field name.
  ///
  /// Parameters:
  /// - `fieldName` — The field name.
  ///
  /// Return Value: A [Field].
  Field? getField({required String fieldName}) {
    final coreFieldName = _CString(fieldName);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureLayerInfo_getField(
          _handle, coreFieldName.bytes, errorHandler);
    });
    return Field._fromHandle(objectHandle);
  }
}

/// The type of the dataset underlying an [ArcGISFeatureLayerInfo].
///
/// This is used to determine the type of the dataset behind an
/// [ArcGISFeatureLayerInfo]. Spatial datasets are considered to be layers
/// whereas non-spatial datasets are tables.
enum ArcGISFeatureLayerInfoServiceType {
  /// A feature layer.
  ///
  /// Containing geometrical features such as a points, lines or polygons.
  layer,

  /// A feature table.
  table,

  /// A group layer.
  groupLayer,

  /// An annotation layer.
  ///
  /// Containing text features to be drawn at specific positions.
  annotationLayer,

  /// A dimension layer.
  ///
  /// Containing schematic measurement features to be drawn at specific
  /// positions.
  dimensionLayer,

  /// An unknown/unsupported dataset type.
  unknown;

  factory ArcGISFeatureLayerInfoServiceType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return layer;
      case 1:
        return table;
      case 2:
        return groupLayer;
      case 3:
        return annotationLayer;
      case 4:
        return dimensionLayer;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case layer:
        return 0;
      case table:
        return 1;
      case groupLayer:
        return 2;
      case annotationLayer:
        return 3;
      case dimensionLayer:
        return 4;
      case unknown:
        return -1;
    }
  }
}

/// The metadata for an ArcGIS feature service.
///
/// An ArcGIS feature service is a data service that provides access to spatial
/// features stored in layers and non-spatial features stored in tables.
/// [ArcGISFeatureServiceInfo] provides basic information about the feature
/// service, including the feature layers and tables that it contains, the
/// service description, supported spatial reference, sync capabilities, editor
/// tracking information, and so on.
///
/// You can obtain the [ArcGISFeatureServiceInfo] from a loaded
/// [GeodatabaseSyncTask] or from a loaded `ServiceGeodatabase`.
final class ArcGISFeatureServiceInfo implements ffi.Finalizable {
  final RT_ArcGISFeatureServiceInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISFeatureServiceInfo_destroy.cast());

  static ArcGISFeatureServiceInfo? _fromHandle(
      RT_ArcGISFeatureServiceInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISFeatureServiceInfo._withHandle(handle);
  }

  ArcGISFeatureServiceInfo._withHandle(RT_ArcGISFeatureServiceInfoHandle handle)
      : _documentInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getDocumentInfo(
                handle, errorHandler);
          });
          return ServiceDocumentInfo._fromHandle(objectHandle);
        }),
        _editorTrackingInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISFeatureServiceInfo_getEditorTrackingInfo(
                    handle, errorHandler);
          });
          return EditorTrackingInfo._fromHandle(objectHandle);
        }),
        _featureServiceCapabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISFeatureServiceInfo_getFeatureServiceCapabilities(
                    handle, errorHandler);
          });
          return FeatureServiceCapabilities._fromHandle(objectHandle)!;
        }),
        _layerInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getLayerInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _syncCapabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getSyncCapabilities(
                handle, errorHandler);
          });
          return SyncCapabilities._fromHandle(objectHandle);
        }),
        _tableInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getTableInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _unit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getUnit(
                handle, errorHandler);
          });
          return Unit._fromHandle(objectHandle)!;
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureServiceInfo_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISFeatureServiceInfo_created(_handle);
    }
  }

  /// True if the service allows geometry updates, false otherwise.
  bool get allowGeometryUpdates {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getAllowGeometryUpdates(
          _handle, errorHandler);
    });
  }

  /// True if the service allows curve geometries to be updated, false
  /// otherwise.
  ///
  /// This property can only be true if
  /// [ArcGISFeatureServiceInfo.supportsTrueCurve] is true.
  ///
  /// If this property is true and
  /// [ArcGISFeatureServiceInfo.onlyAllowTrueCurveUpdatesByTrueCurveClients] is
  /// false, features with curve geometries can be updated by any client. This
  /// includes cases where the client provides a densified geometry to update
  /// the curve geometry.
  ///
  /// By default, this API is not a true curve-enabled client. Use
  /// [ArcGISEnvironment.serviceCurveGeometryMode] to change this behavior.
  bool get allowTrueCurvesUpdates {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getAllowTrueCurvesUpdates(
          _handle, errorHandler);
    });
  }

  /// The service's attribution.
  String get attribution {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getAttribution(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if you can use `ServiceGeodatabase.applyEditsAsync()` to commit
  /// changes back to the service, false otherwise.
  ///
  /// This value is true if the support for global IDs in all tables in the
  /// geodatabase is enabled, or support for global IDs in all tables in the
  /// geodatabase is disabled, false otherwise.
  ///
  /// `ServiceGeodatabase.applyEditsAsync()` applies edits to all affected
  /// tables as a single transaction. This is the recommended approach for
  /// applying edits. However, if the service has been setup with mixed support
  /// for global IDs, then you must apply the edits individually to each
  /// affected table using [ServiceFeatureTable.applyEdits]
  ///
  /// If `ServiceGeodatabase.applyEditsAsync()` is used when this property is
  /// set to false, it can fail with
  /// [ArcGISExceptionType.geodatabaseGlobalIdSupportMismatch]
  bool get canUseServiceGeodatabaseApplyEdits {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureServiceInfo_getCanUseServiceGeodatabaseApplyEdits(
              _handle, errorHandler);
    });
  }

  /// The service's description.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The service's document info.
  ServiceDocumentInfo? get documentInfo => _documentInfo.value;

  final Memoized<ServiceDocumentInfo?> _documentInfo;

  /// The feature service's editor tracking settings.
  ///
  /// This information is present if editor tracking is enabled on this service.
  /// For more information, see
  /// [Editor tracking for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/editor-tracking-for-feature-services.htm).
  EditorTrackingInfo? get editorTrackingInfo => _editorTrackingInfo.value;

  final Memoized<EditorTrackingInfo?> _editorTrackingInfo;

  /// The service's capabilities.
  FeatureServiceCapabilities get featureServiceCapabilities =>
      _featureServiceCapabilities.value;

  final Memoized<FeatureServiceCapabilities> _featureServiceCapabilities;

  /// The service's full extent.
  Envelope? get fullExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getFullExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// True if the service has static data, false otherwise.
  bool get hasStaticData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getHasStaticData(
          _handle, errorHandler);
    });
  }

  /// True if the service has versioned data, false otherwise.
  bool get hasVersionedData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getHasVersionedData(
          _handle, errorHandler);
    });
  }

  /// The service's initial extent.
  Envelope? get initialExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getInitialExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The service's layers.
  ///
  /// The [IdInfo] provides basic layer metadata. It can be cast to a
  /// [FeatureServiceLayerIdInfo] for more detailed metadata.
  List<IdInfo> get layerInfos => _layerInfos.value;

  final Memoized<_ArrayList<IdInfo>> _layerInfos;

  /// The service's max record count.
  int get maxRecordCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getMaxRecordCount(
          _handle, errorHandler);
    });
  }

  /// True if the service only allows curve geometries to be updated by client
  /// code that identifies itself as a true curve-enabled client, indicating
  /// that client editing workflows account for curve segments correctly, false
  /// otherwise.
  ///
  /// This property can only be true if
  /// [ArcGISFeatureServiceInfo.allowTrueCurvesUpdates] is true.
  ///
  /// By default, this API is not a true curve-enabled client. Use
  /// [ArcGISEnvironment.serviceCurveGeometryMode] to change this behavior.
  bool get onlyAllowTrueCurveUpdatesByTrueCurveClients {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureServiceInfo_getOnlyAllowTrueCurveUpdatesByTrueCurveClients(
              _handle, errorHandler);
    });
  }

  /// The service's service description.
  String get serviceDescription {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getServiceDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The service's spatial reference.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// True if the service supports disconnected editing, false otherwise.
  bool get supportsDisconnectedEditing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureServiceInfo_getSupportsDisconnectedEditing(
              _handle, errorHandler);
    });
  }

  /// True if the service supports curve segments in feature geometries, false
  /// otherwise.
  ///
  /// Some services support storing feature geometries with curve segments. By
  /// default, these services return densified versions of the feature
  /// geometries instead. Use [ArcGISEnvironment.serviceCurveGeometryMode] to
  /// change this behavior.
  bool get supportsTrueCurve {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getSupportsTrueCurve(
          _handle, errorHandler);
    });
  }

  /// The service's sync capabilities.
  SyncCapabilities? get syncCapabilities => _syncCapabilities.value;

  final Memoized<SyncCapabilities?> _syncCapabilities;

  /// True if the service has sync enabled, false otherwise.
  bool get syncEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getSyncEnabled(
          _handle, errorHandler);
    });
  }

  /// The service's tables.
  List<IdInfo> get tableInfos => _tableInfos.value;

  final Memoized<_ArrayList<IdInfo>> _tableInfos;

  /// Units used by the service.
  Unit get unit => _unit.value;

  final Memoized<Unit> _unit;

  /// The service's URL.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The service's current version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The service's default z value.
  double get zDefault {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getZDefault(
          _handle, errorHandler);
    });
  }

  /// True if the service defaults z values, false otherwise.
  bool get zDefaultsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureServiceInfo_getZDefaultsEnabled(
          _handle, errorHandler);
    });
  }
}

/// The metadata for an ArcGIS map service.
///
/// An ArcGIS map service is a data service that provides access to map images
/// that can be rendered dynamically or pre-rendered and cached in a tile grid
/// as static images. You can display dynamically rendered images using
/// [ArcGISMapImageLayer] and pre-rendered static images using
/// [ArcGISTiledLayer].
///
/// [ArcGISMapServiceInfo] provides basic information about the map, including
/// the layers that it contains, whether or not the map is cached, its spatial
/// reference, initial and full extents, map units, and copyright text. It also
/// provides some metadata associated with the service, such as the service
/// description, its author, and keywords. If the map service has a tile cache,
/// additional information about the tiling scheme is included, such as the
/// levels of detail, tiling scheme origin, and tile dimensions.
///
/// You can obtain the [ArcGISMapServiceInfo] from a loaded
/// [ArcGISMapImageLayer], [ArcGISTiledLayer], or [ExportTileCacheTask].
final class ArcGISMapServiceInfo
    with JsonSerializable
    implements ffi.Finalizable {
  final RT_ArcGISMapServiceInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISMapServiceInfo_destroy.cast());

  static ArcGISMapServiceInfo? _fromHandle(
      RT_ArcGISMapServiceInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISMapServiceInfo._withHandle(handle);
  }

  ArcGISMapServiceInfo._withHandle(RT_ArcGISMapServiceInfoHandle handle)
      : _capabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getCapabilities(
                handle, errorHandler);
          });
          return MapServiceCapabilities._fromHandle(objectHandle)!;
        }),
        _documentInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getDocumentInfo(
                handle, errorHandler);
          });
          return ServiceDocumentInfo._fromHandle(objectHandle);
        }),
        _layerInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getLayerInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _supportedImageFormatTypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceInfo_getSupportedImageFormatTypes(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _tableInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getTableInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _tileInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getTileInfo(
                handle, errorHandler);
          });
          return TileInfo._fromHandle(objectHandle);
        }),
        _tileServers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getTileServers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _timeInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getTimeInfo(
                handle, errorHandler);
          });
          return ServiceTimeInfo._fromHandle(objectHandle);
        }),
        _unit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getUnit(
                handle, errorHandler);
          });
          return Unit._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceInfo_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISMapServiceInfo_created(_handle);
    }
  }

  /// The name of the map.
  String get arcGISMapName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMapName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The copyright text.
  String get attribution {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getAttribution(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The map service's capabilities. For example, exporting map images, data
  /// and query operations.
  MapServiceCapabilities get capabilities => _capabilities.value;

  final Memoized<MapServiceCapabilities> _capabilities;

  /// The current version of the ArcGIS map service.
  String get currentVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getCurrentVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The description.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The document information such as the title, author, and comments.
  ServiceDocumentInfo? get documentInfo => _documentInfo.value;

  final Memoized<ServiceDocumentInfo?> _documentInfo;

  /// True if exporting tiles in compact version 2 format (.tpkx) is supported,
  /// false otherwise.
  ///
  /// The export tile cache compact version 2 (.tpkx) format now supersedes the
  /// compact (.tpk) format across ArcGIS software. For more information, see
  /// [CacheStorageFormat.compactV2].
  ///
  /// If this property is true, the map service supports exporting tiles as
  /// .tpkx format. If this property is false, the service does not support
  /// exporting .tpkx format, and you should check
  /// [ArcGISMapServiceInfo.exportTilesAllowed] to confirm whether it supports
  /// exporting the earlier .tpk format version.
  ///
  /// [ArcGISMapServiceInfo.currentVersion], 10.9 or greater, supports exporting
  /// tiles as .tpkx. Compact V2 tile caches can also be exported from
  /// export-enabled Esri image basemaps and elevation services hosted on ArcGIS
  /// Online. For more details on the specification of a .tpkx file format, see
  /// https://github.com/Esri/tile-package-spec.
  bool get exportTileCacheCompactV2Allowed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISMapServiceInfo_getExportTileCacheCompactV2Allowed(
              _handle, errorHandler);
    });
  }

  /// True if exporting tiles in compact format (.tpk) is supported, false
  /// otherwise.
  ///
  /// This property indicates whether the map service supports exporting tiles
  /// as compact (.tpk) format. Exporting tiles allows you to use them as a
  /// basemap, operational layer, or elevation source, without network
  /// connectivity. See [TileCache] for information on creating a layer from a
  /// local tile cache.
  ///
  /// To export tiles, you can use either the [ExportTileCacheTask] or the
  /// [OfflineMapTask].
  ///
  /// There are two formats for exporting a tile cache:
  /// * Compact (.tpk) is the legacy format for a tile cache. All services that
  /// support exporting tiles, support the .tpk format. See
  /// [CacheStorageFormat.compact]
  /// * Compact V2 (.tpkx) is the latest format used for exporting tiles. Check
  /// [ArcGISMapServiceInfo.exportTileCacheCompactV2Allowed] to confirm whether
  /// the service supports this format.
  bool get exportTilesAllowed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getExportTilesAllowed(
          _handle, errorHandler);
    });
  }

  /// The full extent of the layer.
  Envelope? get fullExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getFullExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The initial extent of the layer.
  Envelope? get initialExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getInitialExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The service's layers.
  List<IdInfo> get layerInfos => _layerInfos.value;

  final Memoized<_ArrayList<IdInfo>> _layerInfos;

  /// The maximum number of tiles that can be exported.
  int get maxExportTilesCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMaxExportTilesCount(
          _handle, errorHandler);
    });
  }

  /// The max image height in pixels.
  int get maxImageHeight {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMaxImageHeight(
          _handle, errorHandler);
    });
  }

  /// The max image width in pixels.
  int get maxImageWidth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMaxImageWidth(
          _handle, errorHandler);
    });
  }

  /// The maximum number of records that will be returned at once for a query.
  int get maxRecordCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMaxRecordCount(
          _handle, errorHandler);
    });
  }

  /// The layers's max scale.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The layers's min scale.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The ArcGIS map service description.
  String get serviceDescription {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getServiceDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The type of this ArcGIS service.
  ServiceType get serviceSourceType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getServiceSourceType(
          _handle, errorHandler);
    });
    return ServiceType._fromCoreValue(coreValue);
  }

  /// True if the ArcGIS map service has a single fused map cache, false
  /// otherwise.
  ///
  /// This is true if "Single Fused Map Cache" is set to true in the map service
  /// ArcGIS REST Services Directory.
  bool get singleFusedMapCache {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getSingleFusedMapCache(
          _handle, errorHandler);
    });
  }

  /// The spatial reference of the map service.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The image format types supported by this layer when generating a map
  /// image.
  ///
  /// A [List] of [String].
  List<String> get supportedImageFormatTypes =>
      _supportedImageFormatTypes.value;

  final Memoized<_ArrayList<String>> _supportedImageFormatTypes;

  /// True if the ArcGIS map service supports dynamic layers, false otherwise.
  ///
  /// This is true if "Supports Dynamic Layers" is set to true in the map
  /// service ArcGIS REST Services Directory.
  bool get supportsDynamicLayers {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_getSupportsDynamicLayers(
          _handle, errorHandler);
    });
  }

  /// The service's tables.
  List<IdInfo> get tableInfos => _tableInfos.value;

  final Memoized<_ArrayList<IdInfo>> _tableInfos;

  /// The tile information of this ArcGIS map service.
  TileInfo? get tileInfo => _tileInfo.value;

  final Memoized<TileInfo?> _tileInfo;

  /// A list of tile server URLs that can be used to split requests for tiles.
  ///
  /// A [List] of [String].
  List<Uri> get tileServers => _tileServers.value;

  final Memoized<_ArrayList<Uri>> _tileServers;

  /// Information on the support of time based queries and map requests of this
  /// map service. If this map service does not support time based requests,
  /// this will be null.
  ServiceTimeInfo? get timeInfo => _timeInfo.value;

  final Memoized<ServiceTimeInfo?> _timeInfo;

  /// The units used by this ArcGIS map service.
  Unit? get unit => _unit.value;

  final Memoized<Unit?> _unit;

  /// The map service URL.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceInfo_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ArcGISMapServiceInfo.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_ArcGISMapServiceInfo_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return ArcGISMapServiceInfo._fromHandle(objectHandle)!;
  }

  factory ArcGISMapServiceInfo.fromJson(Map<String, dynamic> json) {
    return ArcGISMapServiceInfo.fromJsonString(jsonEncode(json));
  }
}

/// The metadata of an ArcGIS map service sublayer.
///
/// [ArcGISMapServiceSublayerInfo] provides basic information about an
/// individual map image sublayer (or map service sublayer), such as the
/// description, geometry type, drawing information, fields, extent,
/// capabilities, and layer type. You can obtain a collection of map image
/// sublayers from [ArcGISMapImageLayer.arcGISMapImageSublayers] and obtain the
/// [ArcGISMapServiceSublayerInfo] using the
/// [ArcGISSublayer.arcGISMapServiceSublayerInfo].
///
/// The [ArcGISMapServiceSublayerInfo.sublayerType] specifies if the map image
/// sublayer is a feature layer, table, raster layer, or group layer. If the
/// sublayer type is [ArcGISMapServiceSublayerType.groupLayer], it will have its
/// own collection of sublayers that you can access using
/// [ArcGISSublayer.sublayers]. If one of these sublayers is a group layer it
/// will also contain a collection of sublayers, and so on.
final class ArcGISMapServiceSublayerInfo
    with JsonSerializable
    implements ffi.Finalizable {
  final RT_ArcGISMapServiceSublayerInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ArcGISMapServiceSublayerInfo_destroy.cast());

  static ArcGISMapServiceSublayerInfo? _fromHandle(
      RT_ArcGISMapServiceSublayerInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISMapServiceSublayerInfo._withHandle(handle);
  }

  ArcGISMapServiceSublayerInfo._withHandle(
      RT_ArcGISMapServiceSublayerInfoHandle handle)
      : _capabilities = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getCapabilities(
                handle, errorHandler);
          });
          return MapServiceCapabilities._fromHandle(objectHandle)!;
        }),
        _defaultSubtypeCode = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceSublayerInfo_getDefaultSubtypeCode(
                    handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _drawingInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getDrawingInfo(
                handle, errorHandler);
          });
          return DrawingInfo._fromHandle(objectHandle);
        }),
        _featureSubtypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceSublayerInfo_getFeatureSubtypes(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getFeatureTypes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _fields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getFields(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _ownershipBasedAccessControl = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceSublayerInfo_getOwnershipBasedAccessControl(
                    handle, errorHandler);
          });
          return OwnershipBasedAccessControlInfo._fromHandle(objectHandle);
        }),
        _parentLayerInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceSublayerInfo_getParentLayerInfo(
                    handle, errorHandler);
          });
          return IdInfo._fromHandle(objectHandle);
        }),
        _relationshipInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_ArcGISMapServiceSublayerInfo_getRelationshipInfos(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _sublayerInfos = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getSublayerInfos(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _timeInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getTimeInfo(
                handle, errorHandler);
          });
          return LayerTimeInfo._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISMapServiceSublayerInfo_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ArcGISMapServiceSublayerInfo_created(_handle);
    }
  }

  /// The sublayer's attribution.
  String get attribution {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getAttribution(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// A flag indicating whether the sublayer supports modifying its renderer
  /// and/or its data source.
  ///
  /// False if an error occurs.
  bool get canModifyLayer {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getCanModifyLayer(
          _handle, errorHandler);
    });
  }

  /// A flag indicating whether the text and symbols on the sublayer will change
  /// as the map scale varies.
  ///
  /// False if an error occurs.
  bool get canScaleSymbols {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getCanScaleSymbols(
          _handle, errorHandler);
    });
  }

  /// The sublayer's capabilities.
  MapServiceCapabilities get capabilities => _capabilities.value;

  final Memoized<MapServiceCapabilities> _capabilities;

  /// The sublayer's default subtype code.
  dynamic get defaultSubtypeCode => _defaultSubtypeCode.value;

  final Memoized<dynamic> _defaultSubtypeCode;

  /// True if the sublayer is visible by default.
  ///
  /// False if an error occurs.
  bool get defaultVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getDefaultVisibility(
          _handle, errorHandler);
    });
  }

  /// The sublayer's definition expression.
  ///
  /// The definition expression string uses the SQL-92 where clause syntax
  /// (https://en.wikipedia.org/wiki/SQL-92). Be sure to escape special
  /// characters in the expression string as required for your platform. The
  /// DATE keyword expects the date format yyyy-mm-dd and the TIMESTAMP keyword
  /// expects the time stamp format yyyy-mm-dd hh:mm:ss. For more information,
  /// see the ArcGIS Blog article
  /// [Querying Feature Services Date-Time Queries](https://www.esri.com/arcgis-blog/products/api-rest/data-management/querying-feature-services-date-time-queries/).
  String get definitionExpression {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISMapServiceSublayerInfo_getDefinitionExpression(
              _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer's description.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer's display field name.
  String get displayFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getDisplayFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer's drawing info.
  DrawingInfo? get drawingInfo => _drawingInfo.value;

  final Memoized<DrawingInfo?> _drawingInfo;

  /// The sublayer's effective max scale.
  double get effectiveMaxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getEffectiveMaxScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's effective min scale.
  double get effectiveMinScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getEffectiveMinScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's extent.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getExtent(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The sublayer's feature subtypes.
  List<FeatureSubtype> get featureSubtypes => _featureSubtypes.value;

  final Memoized<_ArrayList<FeatureSubtype>> _featureSubtypes;

  /// The sublayer's feature types.
  List<FeatureType> get featureTypes => _featureTypes.value;

  final Memoized<_ArrayList<FeatureType>> _featureTypes;

  /// The sublayer's field definitions.
  List<Field> get fields => _fields.value;

  final Memoized<_ArrayList<Field>> _fields;

  /// The sublayer's geometry type.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// True if the sublayer has attachments.
  ///
  /// False if an error occurs.
  bool get hasAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getHasAttachments(
          _handle, errorHandler);
    });
  }

  /// True if the sublayer has labels defined on it.
  ///
  /// False if an error occurs.
  bool get hasLabels {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getHasLabels(
          _handle, errorHandler);
    });
  }

  /// True if the sublayer has m-values.
  ///
  /// False if an error occurs.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getHasM(
          _handle, errorHandler);
    });
  }

  /// True if the sublayer has z-values.
  ///
  /// False if an error occurs.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getHasZ(
          _handle, errorHandler);
    });
  }

  /// True if the sublayer has versioned data.
  ///
  /// False if an error occurs.
  bool get isDataVersioned {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getIsDataVersioned(
          _handle, errorHandler);
    });
  }

  /// The sublayer's max record count.
  int get maxRecordCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getMaxRecordCount(
          _handle, errorHandler);
    });
  }

  /// The sublayer's max scale.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's min scale.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's ownership based access control.
  OwnershipBasedAccessControlInfo? get ownershipBasedAccessControl =>
      _ownershipBasedAccessControl.value;

  final Memoized<OwnershipBasedAccessControlInfo?> _ownershipBasedAccessControl;

  /// The parent layer info.
  ///
  /// An [IdInfo] containing the sublayer parent id and name. Will return null
  /// if an error occurs or if the sublayer has no parent.
  IdInfo? get parentLayerInfo => _parentLayerInfo.value;

  final Memoized<IdInfo?> _parentLayerInfo;

  /// The sublayer's relationship infos.
  List<RelationshipInfo> get relationshipInfos => _relationshipInfos.value;

  final Memoized<_ArrayList<RelationshipInfo>> _relationshipInfos;

  /// The sublayer's ID.
  int get serviceLayerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getServiceLayerId(
          _handle, errorHandler);
    });
  }

  /// The sublayer's name.
  String get serviceLayerName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getServiceLayerName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer info.
  List<IdInfo> get sublayerInfos => _sublayerInfos.value;

  final Memoized<_ArrayList<IdInfo>> _sublayerInfos;

  /// The type of sublayer in the ArcGIS map service.
  ///
  /// [ArcGISMapServiceSublayerType.unknown] if an error occurs.
  ArcGISMapServiceSublayerType get sublayerType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getSublayerType(
          _handle, errorHandler);
    });
    return ArcGISMapServiceSublayerType._fromCoreValue(coreValue);
  }

  /// The sublayer's subtype field.
  String get subtypeField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getSubtypeField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the sublayer supports advanced queries such as order by fields.
  ///
  /// False if an error occurs.
  bool get supportsAdvancedQueries {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISMapServiceSublayerInfo_getSupportsAdvancedQueries(
              _handle, errorHandler);
    });
  }

  /// True if the sublayer supports statistical functions in query operations.
  ///
  /// False if an error occurs.
  bool get supportsStatistics {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getSupportsStatistics(
          _handle, errorHandler);
    });
  }

  /// The sublayer's time info.
  LayerTimeInfo? get timeInfo => _timeInfo.value;

  final Memoized<LayerTimeInfo?> _timeInfo;

  /// The sublayer's type id field name.
  String get typeIdFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getTypeIdFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The sublayer's URL.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// A flag indicating whether the sublayer requires the use of standardized
  /// queries. Returns true indicates the sublayer requires the use of
  /// standardized queries, a value of false indicates otherwise.
  ///
  /// False if an error occurs.
  bool get useStandardizedQueries {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISMapServiceSublayerInfo_getUseStandardizedQueries(
              _handle, errorHandler);
    });
  }

  /// The sublayer's version.
  String get version {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns the field definition of the given field name.
  ///
  /// Parameters:
  /// - `fieldName` — The field name.
  ///
  /// Return Value: A [Field].
  Field? getField({required String fieldName}) {
    final coreFieldName = _CString(fieldName);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_getField(
          _handle, coreFieldName.bytes, errorHandler);
    });
    return Field._fromHandle(objectHandle);
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_toJSON(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ArcGISMapServiceSublayerInfo.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_ArcGISMapServiceSublayerInfo_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return ArcGISMapServiceSublayerInfo._fromHandle(objectHandle)!;
  }

  factory ArcGISMapServiceSublayerInfo.fromJson(Map<String, dynamic> json) {
    return ArcGISMapServiceSublayerInfo.fromJsonString(jsonEncode(json));
  }
}

/// The type of sublayer in the ArcGIS map service.
enum ArcGISMapServiceSublayerType {
  /// A feature layer.
  featureLayer,

  /// A feature table.
  table,

  /// A group layer.
  groupLayer,

  /// A raster layer.
  rasterLayer,

  /// A network analysis layer.
  networkAnalysisLayer,

  /// An unknown/unsupported service type.
  unknown;

  factory ArcGISMapServiceSublayerType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return featureLayer;
      case 1:
        return table;
      case 2:
        return groupLayer;
      case 3:
        return rasterLayer;
      case 4:
        return networkAnalysisLayer;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case featureLayer:
        return 0;
      case table:
        return 1;
      case groupLayer:
        return 2;
      case rasterLayer:
        return 3;
      case networkAnalysisLayer:
        return 4;
      case unknown:
        return -1;
    }
  }
}

/// The storage format of a tile cache.
enum CacheStorageFormat {
  /// Compact storage format (.tpk).
  compact,

  /// Compact V2 storage format (.tpkx).
  ///
  /// For more details on the specification of a tpkx file, see
  /// https://github.com/Esri/tile-package-spec.
  compactV2,

  /// Exploded storage format.
  exploded,

  /// Unknown storage format.
  unknown;

  factory CacheStorageFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return compact;
      case 1:
        return compactV2;
      case 2:
        return exploded;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case compact:
        return 0;
      case compactV2:
        return 1;
      case exploded:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// An object that provides various information on how to render features in a
/// feature layer.
final class DrawingInfo implements ffi.Finalizable {
  final RT_DrawingInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DrawingInfo_destroy.cast());

  static DrawingInfo? _fromHandle(RT_DrawingInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return DrawingInfo._withHandle(handle);
  }

  DrawingInfo._withHandle(RT_DrawingInfoHandle handle)
      : _renderer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DrawingInfo_getRenderer(handle, errorHandler);
          });
          return Renderer._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DrawingInfo_created(_handle);
    }
  }

  /// The renderer attached to this drawing info.
  Renderer? get renderer => _renderer.value;

  final Memoized<Renderer?> _renderer;

  /// True if symbols should be scaled.
  bool get scaleSymbols {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DrawingInfo_getScaleSymbols(_handle, errorHandler);
    });
  }

  /// True if labels should be shown.
  bool get showLabels {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DrawingInfo_getShowLabels(_handle, errorHandler);
    });
  }

  /// The transparency.
  double get transparency {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DrawingInfo_getTransparency(_handle, errorHandler);
    });
  }
}

/// The fields that record who adds or edits the features and when the edits are
/// made.
///
/// These editing fields are defined when the data owner enables editor tracking
/// on the feature service. For more information, see
/// [Editor tracking for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/editor-tracking-for-feature-services.htm).
///
/// You can obtain the [EditFieldsInfo] from
/// [ArcGISFeatureLayerInfo.editFieldsInfo]. This information is recorded if
/// [EditorTrackingInfo.editorTrackingEnabled] is true.
final class EditFieldsInfo implements ffi.Finalizable {
  final RT_EditFieldsInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.EditFieldsInfo_destroy.cast());

  static EditFieldsInfo? _fromHandle(RT_EditFieldsInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return EditFieldsInfo._withHandle(handle);
  }

  EditFieldsInfo._withHandle(RT_EditFieldsInfoHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.EditFieldsInfo_created(_handle);
    }
  }

  /// The name of the creation date field.
  String get creationDateField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditFieldsInfo_getCreationDateField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The name of the creator field.
  String get creatorField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditFieldsInfo_getCreatorField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The name of the edit date field.
  String get editDateField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditFieldsInfo_getEditDateField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The name of the editor field.
  String get editorField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditFieldsInfo_getEditorField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The realm is a string that uniquely identifies an editor and how they
  /// edited the data.
  ///
  /// Realms can be used to differentiate edits made through a feature service
  /// as opposed to those made directly to the data in the geodatabase. If a
  /// realm string is present, it is appended to the username using the "@"
  /// character. For example, a realm string of "denver" is appended to the user
  /// "John" to give a user name of "John@denver". For more information, see
  /// [Configure a realm for a feature service](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/use-realms-with-editor-tracking-fs.htm#ESRI_SECTION1_C48E63619BB149DEB40EE31C6158F6C3).
  String get realm {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditFieldsInfo_getRealm(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// Editor tracking information indicates who can edit features of an ArcGIS
/// feature service.
///
/// Editor tracking allows you to record who made edits and when the edits were
/// applied. This can help you enforce accountability and quality control of the
/// features you add to the geodatabase. If
/// [EditorTrackingInfo.editorTrackingEnabled] is true, this editing information
/// is recorded against each edited feature using the fields specified in the
/// [EditFieldsInfo]. For more information, see
/// [Editor tracking for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/editor-tracking-for-feature-services.htm).
///
/// You can obtain [EditorTrackingInfo] from the
/// [ArcGISFeatureServiceInfo.editorTrackingInfo].
final class EditorTrackingInfo implements ffi.Finalizable {
  final RT_EditorTrackingInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.EditorTrackingInfo_destroy.cast());

  static EditorTrackingInfo? _fromHandle(RT_EditorTrackingInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return EditorTrackingInfo._withHandle(handle);
  }

  EditorTrackingInfo._withHandle(RT_EditorTrackingInfoHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.EditorTrackingInfo_created(_handle);
    }
  }

  /// True if anonymous users are allowed to delete features, false otherwise.
  ///
  /// True if an error occurs.
  bool get allowAnonymousToDelete {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditorTrackingInfo_getAllowAnonymousToDelete(
          _handle, errorHandler);
    });
  }

  /// True if anonymous users are allowed to update features, false otherwise.
  ///
  /// True if an error occurs.
  bool get allowAnonymousToUpdate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditorTrackingInfo_getAllowAnonymousToUpdate(
          _handle, errorHandler);
    });
  }

  /// True if users other than the owner are allowed to delete, false otherwise.
  ///
  /// False if an error occurs.
  bool get allowOthersToDelete {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditorTrackingInfo_getAllowOthersToDelete(
          _handle, errorHandler);
    });
  }

  /// True if users other than the owner are allowed to update, false otherwise.
  ///
  /// False if an error occurs.
  bool get allowOthersToUpdate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditorTrackingInfo_getAllowOthersToUpdate(
          _handle, errorHandler);
    });
  }

  /// True if editor tracking is enabled, false otherwise.
  ///
  /// If true, the feature service will record who added or edited the data and
  /// when the edit is made. This information is stored in fields that the data
  /// owner defined when they enabled editor tracking on the feature service.
  /// You can obtain these edit field names from
  /// [ArcGISFeatureLayerInfo.editFieldsInfo]. For more information, see
  /// [Editor tracking for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/editor-tracking-for-feature-services.htm).
  ///
  /// False if an error occurs.
  bool get editorTrackingEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditorTrackingInfo_getEditorTrackingEnabled(
          _handle, errorHandler);
    });
  }

  /// True if ownership-based access control is enabled, false otherwise.
  ///
  /// The data owner can restrict people from accessing features they do not own
  /// using Ownership-based access control. For more information, see
  /// [Ownership-based access control for feature services](https://enterprise.arcgis.com/en/server/latest/publish-services/windows/ownership-based-access-control-for-feature-services.htm).
  ///
  /// False if an error occurs.
  bool get ownershipBasedAccessControlEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_EditorTrackingInfo_getOwnershipBasedAccessControlEnabled(
              _handle, errorHandler);
    });
  }
}

/// The capabilities of an ArcGIS feature service.
///
/// ArcGIS feature service capabilities, such as Query, Create, Update, and
/// Sync, are stated within the "Capabilities" tag of its ArcGIS REST Services
/// Directory. Each of its capabilities are reflected in
/// [FeatureServiceCapabilities.supportsCreate],
/// [FeatureServiceCapabilities.supportsDelete],
/// [FeatureServiceCapabilities.supportsEditing], and so on.
///
/// You can obtain an ArcGIS feature service's [FeatureServiceCapabilities] from
/// its metadata using the [ArcGISFeatureLayerInfo]. This is available from two
/// sources:
/// * a loaded [ServiceFeatureTable].
/// * a loaded [GeodatabaseFeatureTable] that is downloaded from a feature
/// service using either the [GeodatabaseSyncTask] or the [OfflineMapTask].
final class FeatureServiceCapabilities implements ffi.Finalizable {
  final RT_FeatureServiceCapabilitiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.FeatureServiceCapabilities_destroy.cast());

  static FeatureServiceCapabilities? _fromHandle(
      RT_FeatureServiceCapabilitiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureServiceCapabilities._withHandle(handle);
  }

  FeatureServiceCapabilities._withHandle(
      RT_FeatureServiceCapabilitiesHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureServiceCapabilities_created(_handle);
    }
  }

  /// True if the service allows new features to be created, false otherwise.
  bool get supportsCreate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsCreate(
          _handle, errorHandler);
    });
  }

  /// True if the service allows features to be deleted, false otherwise.
  bool get supportsDelete {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsDelete(
          _handle, errorHandler);
    });
  }

  /// True if the service allows features to be edited, false otherwise.
  bool get supportsEditing {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsEditing(
          _handle, errorHandler);
    });
  }

  /// True if the service allows features to be queried, false otherwise.
  bool get supportsQuery {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsQuery(
          _handle, errorHandler);
    });
  }

  /// True if the service allows features to be synchronized, false otherwise.
  bool get supportsSync {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsSync(
          _handle, errorHandler);
    });
  }

  /// True if the service allows features to be updated, false otherwise.
  bool get supportsUpdate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceCapabilities_getSupportsUpdate(
          _handle, errorHandler);
    });
  }
}

/// An object that represents the metadata for a Feature service layer.
///
/// You will get this object from [ArcGISFeatureServiceInfo.layerInfos].
final class FeatureServiceLayerIdInfo extends IdInfo {
  static FeatureServiceLayerIdInfo? _fromHandle(
      RT_FeatureServiceLayerIdInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureServiceLayerIdInfo._withHandle(handle);
  }

  FeatureServiceLayerIdInfo._withHandle(super.handle) : super._withHandle();

  /// Whether the features in the layer should be visible when loaded.
  bool get defaultVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceLayerIdInfo_getDefaultVisibility(
          _handle, errorHandler);
    });
  }

  /// The type of geometry that all the features in the layer possess.
  ///
  /// For point, multipoint, polyline or polygon feature layers, this will be
  /// the type of the feature's geometry. For annotation and dimension feature
  /// layers, this will be [GeometryType.polygon] (referring to the outline of
  /// the text graphic). For tables, this will be [GeometryType.unknown].
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceLayerIdInfo_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// The maximum scale at which the layer's contents will be visible.
  ///
  /// The layer is only visible when you are zoomed further out than the
  /// maxScale.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceLayerIdInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The minimum scale at which the layer's contents will be visible.
  ///
  /// The layer is only visible when you are zoomed further in than the
  /// minScale. However, zero indicates that there is no minScale restriction.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceLayerIdInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The type of data held in the layer on the service.
  ///
  /// Indicates the type of data contained in the layer, e.g., table row,
  /// geometric feature, annotation or dimension feature.
  ArcGISFeatureLayerInfoServiceType get serviceType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureServiceLayerIdInfo_getServiceType(
          _handle, errorHandler);
    });
    return ArcGISFeatureLayerInfoServiceType._fromCoreValue(coreValue);
  }
}

/// An object that represents the sub layer metadata for a Feature service or a
/// Map service.
final class IdInfo implements ffi.Finalizable {
  final RT_IdInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.IdInfo_destroy.cast());

  static IdInfo? _fromHandle(RT_IdInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (IdInfo._objectTypeOf(handle)) {
      case _IdInfoType.featureServiceLayerIdInfo:
        return FeatureServiceLayerIdInfo._withHandle(handle);
      case _IdInfoType.idInfo:
        return IdInfo._withHandle(handle);
      case _IdInfoType.arcGISMapServiceLayerIdInfo:
        return MapServiceLayerIdInfo._withHandle(handle);
      case _IdInfoType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _IdInfoType _objectTypeOf(RT_IdInfoHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_IdInfo_getObjectType(handle, errorHandler);
    });
    return _IdInfoType._fromCoreValue(coreValue);
  }

  _IdInfoType get _objectType => IdInfo._objectTypeOf(_handle);

  IdInfo._withHandle(RT_IdInfoHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.IdInfo_created(_handle);
    }
  }

  /// The id info's id.
  ///
  /// Will return -1 if an error occurs.
  int get id {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_IdInfo_getId(_handle, errorHandler);
    });
  }

  /// The id info's name.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_IdInfo_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// The type of [IdInfo] object.
///
/// Tells you what id info you are working with.
enum _IdInfoType {
  /// Simple id info with id and name.
  idInfo,

  /// [MapServiceLayerIdInfo] with more info: default visibility, min/max
  /// scales, parent layer id, sub layer ids.
  arcGISMapServiceLayerIdInfo,

  /// [FeatureServiceLayerIdInfo] with more info: default visibility, min/max
  /// scales, geometry type, table data type.
  featureServiceLayerIdInfo,

  /// The IdInfo is unknown. This is for error conditions.
  unknown;

  factory _IdInfoType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return idInfo;
      case 1:
        return arcGISMapServiceLayerIdInfo;
      case 2:
        return featureServiceLayerIdInfo;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case idInfo:
        return 0;
      case arcGISMapServiceLayerIdInfo:
        return 1;
      case featureServiceLayerIdInfo:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// Metadata about a Layer or Sublayers support for time.
///
/// It contains various information needed to be able to perform time based
/// queries such as the time fields, the native time reference and the time
/// extent.
final class LayerTimeInfo implements ffi.Finalizable {
  final RT_LayerTimeInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LayerTimeInfo_destroy.cast());

  static LayerTimeInfo? _fromHandle(RT_LayerTimeInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LayerTimeInfo._withHandle(handle);
  }

  LayerTimeInfo._withHandle(RT_LayerTimeInfoHandle handle)
      : _interval = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LayerTimeInfo_getInterval(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }),
        _timeExtent = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LayerTimeInfo_getTimeExtent(
                handle, errorHandler);
          });
          return TimeExtent._fromHandle(objectHandle);
        }),
        _timeReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LayerTimeInfo_getTimeReference(
                handle, errorHandler);
          });
          return TimeReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LayerTimeInfo_created(_handle);
    }
  }

  /// The name of the field that contains the end time for each feature in the
  /// layer.
  ///
  /// This is available for feature data that has a start and end time stored in
  /// two separate fields, where a feature's time is valid for a duration
  /// between the start time and the end time.
  String get endTimeField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LayerTimeInfo_getEndTimeField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Whether there is live data.
  ///
  /// If true, export and identify operations will default the time extent to
  /// start time = (current server time - time interval), end time = current
  /// server time.
  bool get hasLiveData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LayerTimeInfo_getHasLiveData(_handle, errorHandler);
    });
  }

  /// The time interval of the data in the layer.
  ///
  /// This is useful for the implementation of a time slider control.
  TimeValue? get interval => _interval.value;

  final Memoized<TimeValue?> _interval;

  /// The name of the field that contains the start time for each feature in the
  /// layer.
  ///
  /// This is available for feature data that has time stored in either a single
  /// field where a feature's time is valid for an instant in time, or in two
  /// fields where a feature's time is valid for a duration between the start
  /// time and the end time.
  String get startTimeField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LayerTimeInfo_getStartTimeField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The time extent that is inclusive of all the data in the layer.
  TimeExtent? get timeExtent => _timeExtent.value;

  final Memoized<TimeExtent?> _timeExtent;

  /// Information about the time reference used for time values in the layer.
  ///
  /// This includes information about the time zone and whether the layer
  /// respects daylight savings time.
  TimeReference? get timeReference => _timeReference.value;

  final Memoized<TimeReference?> _timeReference;

  /// The field name that defines the track ID.
  ///
  /// Values in the track ID field uniquely identify individual objects to allow
  /// observations of the same object at different times to be represented by
  /// different features in the layer.
  String get trackIdField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LayerTimeInfo_getTrackIdField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// This object represents a level of detail (LOD) in a tile scheme.
///
/// You can get this object from [TileInfo.levelsOfDetail].
final class LevelOfDetail implements ffi.Finalizable {
  final RT_LevelOfDetailHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LevelOfDetail_destroy.cast());

  static LevelOfDetail? _fromHandle(RT_LevelOfDetailHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LevelOfDetail._withHandle(handle);
  }

  LevelOfDetail._withHandle(RT_LevelOfDetailHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LevelOfDetail_created(_handle);
    }
  }

  /// Creates a new level of detail (LOD) object.
  ///
  /// Parameters:
  /// - `level` — The level of the LOD.
  /// - `resolution` — The resolution of the LOD.
  /// - `scale` — The scale of the LOD.
  factory LevelOfDetail.with_(
      {required int level, required double resolution, required double scale}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LevelOfDetail_createWith(
          level, resolution, scale, errorHandler);
    });
    return LevelOfDetail._withHandle(handle);
  }

  /// The level of the level of detail.
  int get level {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LevelOfDetail_getLevel(_handle, errorHandler);
    });
  }

  /// The resolution of the level of detail.
  double get resolution {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LevelOfDetail_getResolution(_handle, errorHandler);
    });
  }

  /// The scale of the level of detail.
  double get scale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LevelOfDetail_getScale(_handle, errorHandler);
    });
  }
}

/// The capabilities of an ArcGIS map service, including whether it supports
/// exporting map images, data and query operations.
///
/// You can access the content of a map from an ArcGIS map service using one of
/// its three main capabilities:
/// * Data - find, query, and related records.
/// * Map - export map images and list all layers and tables.
/// * Query - identify and access attachment data.
///
/// These capabilities are reflected in [MapServiceCapabilities.supportsData],
/// [MapServiceCapabilities.supportsMap], and
/// [MapServiceCapabilities.supportsQuery]. For more information, see the
/// [Map Service](https://developers.arcgis.com/rest/services-reference/enterprise/map-service.htm)
/// help documentation.
///
/// You can obtain an ArcGIS map service's [MapServiceCapabilities] using
/// [ArcGISMapServiceInfo]. This is available from a number of loaded resources,
/// such as [ArcGISMapImageLayer], [ArcGISTiledLayer], or [ExportTileCacheTask].
final class MapServiceCapabilities implements ffi.Finalizable {
  final RT_MapServiceCapabilitiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.MapServiceCapabilities_destroy.cast());

  static MapServiceCapabilities? _fromHandle(
      RT_MapServiceCapabilitiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MapServiceCapabilities._withHandle(handle);
  }

  MapServiceCapabilities._withHandle(RT_MapServiceCapabilitiesHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.MapServiceCapabilities_created(_handle);
    }
  }

  /// True if the map service supports data operations, such as find, query, and
  /// related records, false otherwise.
  ///
  /// All ArcGIS REST API operations define their required capability in the
  /// [Map Service](https://developers.arcgis.com/rest/services-reference/enterprise/map-service.htm)
  /// help documentation.
  bool get supportsData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceCapabilities_getSupportsData(
          _handle, errorHandler);
    });
  }

  /// True if the map service supports map operations, such as exporting map
  /// images and listing all layers and tables, false otherwise.
  ///
  /// All ArcGIS REST API operations define their required capability in the
  /// [Map Service](https://developers.arcgis.com/rest/services-reference/enterprise/map-service.htm)
  /// help documentation.
  bool get supportsMap {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceCapabilities_getSupportsMap(
          _handle, errorHandler);
    });
  }

  /// True if the map service supports query operations, such as identify and
  /// access attachment data, false otherwise.
  ///
  /// All ArcGIS REST API operations define their required capability in the
  /// [Map Service](https://developers.arcgis.com/rest/services-reference/enterprise/map-service.htm)
  /// help documentation.
  bool get supportsQuery {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceCapabilities_getSupportsQuery(
          _handle, errorHandler);
    });
  }

  /// True if the map service supports tiles, false otherwise.
  bool get supportsTilemap {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceCapabilities_getSupportsTilemap(
          _handle, errorHandler);
    });
  }

  /// True if the map service only supports tile requests, false otherwise.
  ///
  /// You cannot create an [ArcGISMapImageLayer] from a service that only
  /// supports tile requests.
  bool get supportsTilesOnly {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceCapabilities_getSupportsTilesOnly(
          _handle, errorHandler);
    });
  }
}

/// An object that represents the sub layer metadata for a Map service.
///
/// The [MapServiceLayerIdInfo] class is derived from the [IdInfo] class.
final class MapServiceLayerIdInfo extends IdInfo {
  static MapServiceLayerIdInfo? _fromHandle(
      RT_MapServiceLayerIdInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MapServiceLayerIdInfo._withHandle(handle);
  }

  MapServiceLayerIdInfo._withHandle(super.handle)
      : _sublayerIds = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapServiceLayerIdInfo_getSublayerIds(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// The sublayer's default visibility.
  ///
  /// The sublayer default visibility. Will return false if an error occurs.
  bool get defaultVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceLayerIdInfo_getDefaultVisibility(
          _handle, errorHandler);
    });
  }

  /// The sublayer's max scale.
  ///
  /// The sublayer max scale. Will return NAN if an error occurs.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceLayerIdInfo_getMaxScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's min scale.
  ///
  /// The sublayer min scale. Will return NAN if an error occurs.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceLayerIdInfo_getMinScale(
          _handle, errorHandler);
    });
  }

  /// The sublayer's parent id.
  ///
  /// The sublayer parent id. Will return -1 if an error occurs or if the
  /// sublayer has no parent.
  int get parentLayerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceLayerIdInfo_getParentLayerId(
          _handle, errorHandler);
    });
  }

  /// The type of data held in the layer on the service.
  ArcGISMapServiceSublayerType get serviceType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapServiceLayerIdInfo_getServiceType(
          _handle, errorHandler);
    });
    return ArcGISMapServiceSublayerType._fromCoreValue(coreValue);
  }

  /// The sublayer IDs.
  List<int> get sublayerIds => _sublayerIds.value;

  final Memoized<_ArrayList<int>> _sublayerIds;
}

/// An object that defines ownership-based access control settings of a service.
final class OwnershipBasedAccessControlInfo implements ffi.Finalizable {
  final RT_OwnershipBasedAccessControlInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.OwnershipBasedAccessControlInfo_destroy.cast());

  static OwnershipBasedAccessControlInfo? _fromHandle(
      RT_OwnershipBasedAccessControlInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OwnershipBasedAccessControlInfo._withHandle(handle);
  }

  OwnershipBasedAccessControlInfo._withHandle(
      RT_OwnershipBasedAccessControlInfoHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OwnershipBasedAccessControlInfo_created(_handle);
    }
  }

  /// True if anonymous users are allowed to delete features.
  ///
  /// True if an error occurs.
  bool get allowAnonymousToDelete {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OwnershipBasedAccessControlInfo_getAllowAnonymousToDelete(
              _handle, errorHandler);
    });
  }

  /// True if anonymous users are allowed to update features.
  ///
  /// True if an error occurs.
  bool get allowAnonymousToUpdate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OwnershipBasedAccessControlInfo_getAllowAnonymousToUpdate(
              _handle, errorHandler);
    });
  }

  /// True if others are allowed to delete features.
  ///
  /// False if an error occurs.
  bool get allowOthersToDelete {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OwnershipBasedAccessControlInfo_getAllowOthersToDelete(
              _handle, errorHandler);
    });
  }

  /// True if others are allowed to query for features.
  ///
  /// False if an error occurs.
  bool get allowOthersToQuery {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OwnershipBasedAccessControlInfo_getAllowOthersToQuery(
              _handle, errorHandler);
    });
  }

  /// True if others are allowed to update features.
  ///
  /// False if an error occurs.
  bool get allowOthersToUpdate {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_OwnershipBasedAccessControlInfo_getAllowOthersToUpdate(
              _handle, errorHandler);
    });
  }
}

/// An enumeration of the different cardinalities of feature table
/// relationships.
enum RelationshipCardinality {
  /// Features in both tables may be related to any number of features in the
  /// other table.
  manyToMany,

  /// An origin feature can be related to any number of features in the
  /// destination table.
  oneToMany,

  /// An origin feature can be related to at most one feature in the destination
  /// table.
  oneToOne,

  /// This value is returned from C_API functions returning
  /// [RelationshipCardinality] when an error has occurred.
  _unknown;

  factory RelationshipCardinality._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return manyToMany;
      case 1:
        return oneToMany;
      case 2:
        return oneToOne;
      case -1:
        return _unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case manyToMany:
        return 0;
      case oneToMany:
        return 1;
      case oneToOne:
        return 2;
      case _unknown:
        return -1;
    }
  }
}

/// An object that defines information about the relationship between tables.
///
/// A relationship consists of two and only two tables, each having one of these
/// roles in the relationship:
///  - Origin table, sometimes referred to as the source table or original
/// table.
///  - Destination table.
///
/// One table must have one of these roles and the other table must have the
/// other role. A table can participate in more than one relationship. Further,
/// a table may be an origin table in one relationship and also a destination
/// table in another relationship. The relationship's cardinality describes
/// whether features in a table are related to only one feature in the other
/// table, or whether a feature may be related to multiple features. In a simple
/// relationship, the features in the participating tables can exist without the
/// other. For example, a transformer and an electric pole may be related but
/// one's existence does not depend on the other. Deleting the origin features
/// will simply disassociate the destination features from the origin features.
/// In a composite relationship, the destination features cannot exist without
/// the origin features. When the origin feature is deleted, the related
/// destination feature is deleted as well. This is called a cascade delete.
/// This dependency also means that each destination feature must be linked to a
/// counterpart origin feature.
final class RelationshipInfo implements ffi.Finalizable {
  final RT_RelationshipInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.RelationshipInfo_destroy.cast());

  static RelationshipInfo? _fromHandle(RT_RelationshipInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RelationshipInfo._withHandle(handle);
  }

  RelationshipInfo._withHandle(RT_RelationshipInfoHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RelationshipInfo_created(_handle);
    }
  }

  /// The cardinality of this relationship.
  RelationshipCardinality get cardinality {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getCardinality(
          _handle, errorHandler);
    });
    return RelationshipCardinality._fromCoreValue(coreValue);
  }

  /// The ID of this relationship.
  ///
  /// The relationship ID is shared between the origin and destination tables.
  int get id {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getId(_handle, errorHandler);
    });
  }

  /// Whether this is a composite relationship.
  ///
  /// In a composite relationship, a feature in the destination table must
  /// always be associated with an origin feature. Orphan features in the
  /// destination tables are not permitted. Therefore, destination table
  /// features will be deleted when their associated origin table features are
  /// deleted (this is called a cascade delete).
  bool get isComposite {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getIsComposite(
          _handle, errorHandler);
    });
  }

  /// The key field, the field that links the origin and destination tables of
  /// this relationship.
  String get keyField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getKeyField(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The key field in the relationship table.
  ///
  /// Used in many-to-many and attributed relationships. Values in this field
  /// will match values stored in the [RelationshipInfo.keyField] of features
  /// participating in the relationship.
  String get keyFieldInRelationshipTable {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getKeyFieldInRelationshipTable(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The name of the relationship.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The ID of the related table.
  int get relatedTableId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getRelatedTableId(
          _handle, errorHandler);
    });
  }

  /// The ID of the relationship table. The default value is -1, indicating that
  /// no table exists.
  ///
  /// The relationship table is used in many-to-many and attributed
  /// relationships.
  int get relationshipTableId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getRelationshipTableId(
          _handle, errorHandler);
    });
  }

  /// The role that this table has in this relationship.
  RelationshipRole get role {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelationshipInfo_getRole(_handle, errorHandler);
    });
    return RelationshipRole._fromCoreValue(coreValue);
  }
}

/// An enumeration of the different roles of feature table relationships.
enum RelationshipRole {
  /// Represents the destination table in a relationship.
  destination,

  /// Represents the origin table in a relationship.
  origin,

  /// This value is returned from C_API functions returning [RelationshipRole]
  /// when an error has occurred.
  _unknown;

  factory RelationshipRole._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return destination;
      case 1:
        return origin;
      case -1:
        return _unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case destination:
        return 0;
      case origin:
        return 1;
      case _unknown:
        return -1;
    }
  }
}

/// Provides various information about the map service such as title, author,
/// keywords and comments. It also includes the text anti-aliasing mode.
final class ServiceDocumentInfo implements ffi.Finalizable {
  final RT_ServiceDocumentInfoHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ServiceDocumentInfo_destroy.cast());

  static ServiceDocumentInfo? _fromHandle(RT_ServiceDocumentInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceDocumentInfo._withHandle(handle);
  }

  ServiceDocumentInfo._withHandle(RT_ServiceDocumentInfoHandle handle)
      : _keywords = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceDocumentInfo_getKeywords(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceDocumentInfo_created(_handle);
    }
  }

  /// The anti aliasing mode.
  ///
  /// [AntialiasingMode.none] if an error occurs.
  AntialiasingMode get antialiasingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getAntialiasingMode(
          _handle, errorHandler);
    });
    return AntialiasingMode._fromCoreValue(coreValue);
  }

  /// The document author.
  String get author {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getAuthor(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The document category.
  String get category {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getCategory(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The document comments.
  String get comments {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getComments(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The document keywords.
  List<String> get keywords => _keywords.value;

  final Memoized<_ArrayList<String>> _keywords;

  /// The document subject.
  String get subject {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getSubject(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The text anti aliasing mode.
  ///
  /// [TextAntialiasingMode.none] if an error occurs.
  TextAntialiasingMode get textAntialiasingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getTextAntialiasingMode(
          _handle, errorHandler);
    });
    return TextAntialiasingMode._fromCoreValue(coreValue);
  }

  /// The document title.
  String get title {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceDocumentInfo_getTitle(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// Represents metadata about a service's support for querying features (see
/// [FeatureTable.queryFeatures]) and requesting map images for
/// [ArcGISMapImageLayer] based on time.
///
/// It contains various time related information such as the map's time extent
/// and the map's native time reference.
final class ServiceTimeInfo implements ffi.Finalizable {
  final RT_ServiceTimeInfoHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ServiceTimeInfo_destroy.cast());

  static ServiceTimeInfo? _fromHandle(RT_ServiceTimeInfoHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ServiceTimeInfo._withHandle(handle);
  }

  ServiceTimeInfo._withHandle(RT_ServiceTimeInfoHandle handle)
      : _defaultInterval = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceTimeInfo_getDefaultInterval(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }),
        _timeExtent = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceTimeInfo_getTimeExtent(
                handle, errorHandler);
          });
          return TimeExtent._fromHandle(objectHandle);
        }),
        _timeReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceTimeInfo_getTimeReference(
                handle, errorHandler);
          });
          return TimeReference._fromHandle(objectHandle);
        }),
        _timeWindow = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceTimeInfo_getTimeWindow(
                handle, errorHandler);
          });
          return TimeValue._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ServiceTimeInfo_created(_handle);
    }
  }

  /// The default time interval for the service. This can be used as a time
  /// slider's step size.
  ///
  /// Will return null if an error occurs or if the service doesn't define a
  /// default time interval.
  TimeValue? get defaultInterval => _defaultInterval.value;

  final Memoized<TimeValue?> _defaultInterval;

  /// Indicates if the service has live data.
  ///
  /// If true, export and identify operations will default the TimeExtent to
  /// startTime = (current server time - time interval), endTime = current
  /// server time.
  bool get hasLiveData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceTimeInfo_getHasLiveData(
          _handle, errorHandler);
    });
  }

  /// The time extent that includes all of the data in the layer.
  ///
  /// The time extent of the service. Will return null if an error occurs or if
  /// the service is not time aware.
  TimeExtent? get timeExtent => _timeExtent.value;

  final Memoized<TimeExtent?> _timeExtent;

  /// The time reference for the service.
  ///
  /// Will return null if an error occurs or if the service has no time
  /// reference.
  TimeReference? get timeReference => _timeReference.value;

  final Memoized<TimeReference?> _timeReference;

  /// The time relation for the service.
  ///
  /// This can be used for determining how a time slider's start and end time
  /// are processed.
  TimeRelation get timeRelation {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceTimeInfo_getTimeRelation(
          _handle, errorHandler);
    });
    return TimeRelation._fromCoreValue(coreValue);
  }

  /// The default time window for the service to use for a time slider.
  ///
  /// Will return null if an error occurs or if the service doesn't define a
  /// default time window. If this value is null, then the time slider should
  /// create and use a time extent for an instant in time (start time = end
  /// time), if it is greater than 0 this value should be used as the difference
  /// between the start time and end time.
  TimeValue? get timeWindow => _timeWindow.value;

  final Memoized<TimeValue?> _timeWindow;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ServiceTimeInfo) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceTimeInfo_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceTimeInfo_hash(_handle, errorHandler);
    });
  }
}

/// An enumeration of the different types of ArcGIS services.
enum ServiceType {
  /// An unknown service type.
  unknown,

  /// A feature service.
  featureService,

  /// An image service.
  imageService,

  /// A map service.
  arcGISMapService;

  factory ServiceType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return featureService;
      case 1:
        return imageService;
      case 2:
        return arcGISMapService;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case featureService:
        return 0;
      case imageService:
        return 1;
      case arcGISMapService:
        return 2;
    }
  }
}

/// An object that identifies the various synchronization capabilities of an
/// ArcGIS feature service.
final class SyncCapabilities implements ffi.Finalizable {
  final RT_SyncCapabilitiesHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SyncCapabilities_destroy.cast());

  static SyncCapabilities? _fromHandle(RT_SyncCapabilitiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SyncCapabilities._withHandle(handle);
  }

  SyncCapabilities._withHandle(RT_SyncCapabilitiesHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SyncCapabilities_created(_handle);
    }
  }

  /// True if asynchronous operations are supported.
  bool get supportsAsync {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsAsync(
          _handle, errorHandler);
    });
  }

  /// True if the service supports options to define how attachments will be
  /// synced.
  bool get supportsAttachmentsSyncDirection {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_SyncCapabilities_getSupportsAttachmentsSyncDirection(
              _handle, errorHandler);
    });
  }

  /// True if reconciling replica branch versions with default branch upon sync
  /// is supported, false otherwise.
  ///
  /// If this value is true, [SyncGeodatabaseParameters.reconcileBranchVersion]
  /// can be used with [GeodatabaseSyncTask]
  bool get supportsBranchVersionReconcile {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsBranchVersionReconcile(
          _handle, errorHandler);
    });
  }

  /// True if registering existing data is supported.
  bool get supportsRegisteringExistingData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsRegisteringExistingData(
          _handle, errorHandler);
    });
  }

  /// If rollback on failure is supported.
  bool get supportsRollbackOnFailure {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsRollbackOnFailure(
          _handle, errorHandler);
    });
  }

  /// If synchronization direction control is supported.
  bool get supportsSyncDirectionControl {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsSyncDirectionControl(
          _handle, errorHandler);
    });
  }

  /// If per replica synchronization is supported.
  bool get supportsSyncModelGeodatabase {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsSyncModelGeodatabase(
          _handle, errorHandler);
    });
  }

  /// If per layer synchronization is supported.
  bool get supportsSyncModelLayer {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsSyncModelLayer(
          _handle, errorHandler);
    });
  }

  /// If no sync model is supported.
  bool get supportsSyncModelNone {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SyncCapabilities_getSupportsSyncModelNone(
          _handle, errorHandler);
    });
  }
}

/// An enumeration of the different text antialiasing modes.
enum TextAntialiasingMode {
  /// No text antialiasing is performed.
  none,

  /// Text antialiasing is performed as determined by the font.
  normal,

  /// Text is always drawn with antialiasing regardless of individual font
  /// parameters.
  force;

  factory TextAntialiasingMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return normal;
      case 2:
        return force;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case normal:
        return 1;
      case force:
        return 2;
    }
  }
}

/// An object that represents a tile key identified by a level, a column and a
/// row.
final class TileKey implements ffi.Finalizable {
  final RT_TileKeyHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TileKey_destroy.cast());

  static TileKey? _fromHandle(RT_TileKeyHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TileKey._withHandle(handle);
  }

  TileKey._withHandle(RT_TileKeyHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TileKey_created(_handle);
    }
  }

  /// Create a tile key from the specified level, column and row.
  ///
  /// Parameters:
  /// - `level` — The level of the tile key.
  /// - `column` — The column of the tile key.
  /// - `row` — The row of the tile key.
  factory TileKey({required int level, required int column, required int row}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_create(level, column, row, errorHandler);
    });
    return TileKey._withHandle(handle);
  }

  /// The column of the tile key.
  int get column {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_getColumn(_handle, errorHandler);
    });
  }

  /// The level of the tile key.
  int get level {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_getLevel(_handle, errorHandler);
    });
  }

  /// The row of the tile key.
  int get row {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_getRow(_handle, errorHandler);
    });
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TileKey) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_TileKey_hash(_handle, errorHandler);
    });
  }
}

/// An interface that is implemented by layers that can support time. These
/// layers are known as time-aware layers.
///
/// Time-aware layers contain spatial datasets that include different
/// information for the same location at different times. If the time-aware
/// layer supports time filtering and is connected to time-enabled data source
/// you can perform time-based operations, such as:
///  * Filter data with a time extent applied to the [GeoViewController].
///  * Compare data over time by applying a time offset to the data in a layer.
///  * Control which layers participate in time filtering.
///  * Add time-based parameters to queries.
///
/// If you are displaying a time-aware layer in a map (or scene) using a view,
/// data is displayed based on the geo view's specified time extent
/// ([GeoViewController.timeExtent]).
///
/// A layer is time-aware if it has a "Time Info" entry in the service's ArcGIS
/// REST Services Directory.
abstract interface class TimeAware {
  /// The full time extent of the layer.
  ///
  /// If the layer, such as an [ArcGISMapImageLayer], has sublayers with
  /// different time extents, fullTimeExtent is a union of its sublayer's time
  /// extents.
  TimeExtent? get fullTimeExtent;

  /// True if the layer filters data based on its
  /// [GeoViewController.timeExtent], false otherwise.
  ///
  /// This is only applicable if the layer's [TimeAware.supportsTimeFiltering]
  /// value is true. If the [GeoViewController.timeExtent] value is null, no
  /// time filtering is applied and all content is rendered.
  bool get isTimeFilteringEnabled;

  set isTimeFilteringEnabled(bool value);

  /// True if the layer supports filtering data based on its time values, false
  /// otherwise.
  bool get supportsTimeFiltering;

  /// The suggested time slider step size for this time aware layer.
  ///
  /// You can use this information to set the step size for a time slider
  /// control. The value is null if no time interval is suggested. The author of
  /// the layer's data typically configures this property if the data has been
  /// collected on a regular basis. For example, the daily position of a
  /// hurricane.
  TimeValue? get timeInterval;

  /// The amount of time by which the temporal values of this layer's data
  /// points are offset when displaying it in a [GeoViewController].
  ///
  /// The time offset is subtracted from the time extent set on the layer's
  /// [GeoViewController]. This is useful if you want to overlay data in
  /// multiple layers that lies within different temporal extents. For example,
  /// if you want to compare data in one layer for a certain year with data in
  /// the same layer from the subsequent year, you can create two layers that
  /// reference the same data's service endpoint but set the [TimeValue] in one
  /// of the layers to be one year.
  TimeValue? get timeOffset;

  set timeOffset(TimeValue? value);

  /// Sets the callback invoked when the full time extent of the object has
  /// changed.
  ///
  /// This callback is called when changes to the time offset result in an
  /// updated Full Time Extent.
  Stream<void> get onFullTimeExtentChanged;
}

/// Represents information about the reference units for time values. See
/// [LayerTimeInfo.timeReference]
///
/// Includes information about the time zone and if the time respects daylight
/// savings which allows ArcGIS to integrate datasets that were recorded in
/// different time zones.
final class TimeReference implements ffi.Finalizable {
  final RT_TimeReferenceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TimeReference_destroy.cast());

  static TimeReference? _fromHandle(RT_TimeReferenceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TimeReference._withHandle(handle);
  }

  TimeReference._withHandle(RT_TimeReferenceHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TimeReference_created(_handle);
    }
  }

  /// Whether the time reference observes daylight savings.
  bool get respectsDaylightSavings {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeReference_getRespectsDaylightSavings(
          _handle, errorHandler);
    });
  }

  /// The time zone information associated with the time reference.
  String get timeZone {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TimeReference_getTimeZone(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// Indicates how the start and end time of the time slider extent are
/// processed.
enum TimeRelation {
  /// Unknown time relation.
  unknown,

  /// When start and end time of the time slider are included.
  overlaps,

  /// When start time is included and end time is excluded.
  afterStartOverlapsEnd,

  /// When start time is excluded and end time is included.
  overlapsStartWithinEnd;

  factory TimeRelation._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return overlaps;
      case 1:
        return afterStartOverlapsEnd;
      case 2:
        return overlapsStartWithinEnd;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case overlaps:
        return 0;
      case afterStartOverlapsEnd:
        return 1;
      case overlapsStartWithinEnd:
        return 2;
    }
  }
}

/// The units of time used in a service, layer or sublayer which support time
/// based operations.
///
/// This is used to determine what the unit of time measurement is.
enum TimeUnit {
  /// Unknown unit of time.
  unknown,

  /// Centuries.
  centuries,

  /// Days.
  days,

  /// Decades.
  decades,

  /// Hours.
  hours,

  /// Milliseconds.
  milliseconds,

  /// Minutes.
  minutes,

  /// Months.
  months,

  /// Seconds.
  seconds,

  /// Weeks.
  weeks,

  /// Years.
  years;

  factory TimeUnit._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return centuries;
      case 1:
        return days;
      case 2:
        return decades;
      case 3:
        return hours;
      case 4:
        return milliseconds;
      case 5:
        return minutes;
      case 6:
        return months;
      case 7:
        return seconds;
      case 8:
        return weeks;
      case 9:
        return years;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case centuries:
        return 0;
      case days:
        return 1;
      case decades:
        return 2;
      case hours:
        return 3;
      case milliseconds:
        return 4;
      case minutes:
        return 5;
      case months:
        return 6;
      case seconds:
        return 7;
      case weeks:
        return 8;
      case years:
        return 9;
    }
  }
}
