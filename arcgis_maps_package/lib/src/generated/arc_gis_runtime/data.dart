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

/// An ArcGIS specific feature stored in an [ArcGISFeatureTable].
///
/// ArcGIS features are stored in ArcGIS specific data sources such as a
/// [GeodatabaseFeatureTable] or [ServiceFeatureTable]. Since [ArcGISFeature] is
/// a subclass of [Feature], it contains a geometry that defines its location
/// and shape, and a set of attributes that describe the real-world entity it
/// represents.
///
/// In addition, [ArcGISFeature] objects can also contain:
/// * Feature attachments such as images or documents, that can be edited,
/// updated or deleted.
/// * Feature subtypes that define different default values or domains for
/// fields.
/// * The ability to relate this feature to another [ArcGISFeature].
/// * Geometry that has m-values, which are typically used for linear
/// referencing.
///
/// If you create a [ServiceFeatureTable] from the URL of a feature service,
/// features in the table are initially in one of the following states:
/// * A minimum set of attributes are available in the table, and m-values are
/// omitted. This is an optimization for faster rendering.
/// * All attributes defined by the service are available in the table,
/// including m-values, which might be NaN.
///
/// The initial state of features is determined by the feature request mode of
/// the table. For important details, see [FeatureRequestMode].
///
/// By default, a query on [ArcGISFeature] objects in a minimum state returns
/// them in the same state. To access all attributes (or the m-values) of
/// features returned by a query, you must load the features. You can do one of
/// the following:
/// * Call [Loadable.load] on each feature.
/// * Call [ServiceFeatureTable.loadOrRefreshFeatures] and pass a mutable array
/// of the features to be loaded.
/// * Call [ServiceFeatureTable.queryFeaturesWithFieldOptions] with the constant
/// [QueryFeatureFields.loadAll], which returns all features in a fully loaded
/// state.
///
/// For more information, see the class description for [ServiceFeatureTable].
final class ArcGISFeature extends Feature
    with Loadable
    implements _CallbackReceiver {
  static ArcGISFeature? _fromHandle(RT_ArcGISFeatureHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Feature._instanceCache.instanceWith(handle);
  }

  ArcGISFeature._withHandle(super.handle) : super._withHandle() {
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISFeature_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISFeature_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISFeature_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_ArcGISFeature_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// True if attachments on this feature can be edited, otherwise false.
  bool get canEditAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_getCanEditAttachments(
          _handle, errorHandler);
    });
  }

  /// True if the geometry of this feature can be edited, otherwise false.
  bool get canUpdateGeometry {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_getCanUpdateGeometry(
          _handle, errorHandler);
    });
  }

  /// Adds a new attachment to this feature.
  ///
  /// Parameters:
  /// - `name` — The attachment name.
  /// - `contentType` — The type of content.
  /// - `data` — The attachment data.
  ///
  /// Return Value: A [Future] that returns an [Attachment].
  Future<Attachment> addAttachment(
      {required String name,
      required String contentType,
      required Uint8List data}) {
    final coreName = _CString(name);
    final coreContentType = _CString(contentType);
    final coreData = data.toByteArrayWrapper();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_addAttachment(_handle, coreName.bytes,
          coreContentType.bytes, coreData.ref, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsAttachment()!);
  }

  /// Cancelable version of [addAttachment]. See that method for more
  /// information.
  CancelableOperation<Attachment> addAttachmentCancelable(
      {required String name,
      required String contentType,
      required Uint8List data}) {
    final coreName = _CString(name);
    final coreContentType = _CString(contentType);
    final coreData = data.toByteArrayWrapper();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_addAttachment(_handle, coreName.bytes,
          coreContentType.bytes, coreData.ref, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsAttachment()!);
  }

  /// Deletes the given attachment from this feature.
  ///
  /// Parameters:
  /// - `attachment` — The attachment.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> deleteAttachment(Attachment attachment) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_deleteAttachment(
          _handle, attachment._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [deleteAttachment]. See that method for more
  /// information.
  CancelableOperation<void> deleteAttachmentCancelable(Attachment attachment) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_deleteAttachment(
          _handle, attachment._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Deletes the given attachments from this feature.
  ///
  /// Parameters:
  /// - `attachments` — A [List] of [Attachment]. Contents of the [List] are
  /// copied.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> deleteAttachments(List<Attachment> attachments) {
    final coreAttachments =
        attachments.toMutableArray(valueType: _ElementType.attachment);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_deleteAttachments(
          _handle, coreAttachments._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [deleteAttachments]. See that method for more
  /// information.
  CancelableOperation<void> deleteAttachmentsCancelable(
      List<Attachment> attachments) {
    final coreAttachments =
        attachments.toMutableArray(valueType: _ElementType.attachment);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_deleteAttachments(
          _handle, coreAttachments._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Gets a collection of attachments on this feature. Attachments are returned
  /// in descending order based on their id.
  ///
  /// Return Value: A [Future] that returns a [List] containing [Attachment]
  /// types.
  Future<List<Attachment>> fetchAttachments() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_fetchAttachments(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [fetchAttachments]. See that method for more
  /// information.
  CancelableOperation<List<Attachment>> fetchAttachmentsCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_fetchAttachments(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Gets the corresponding [FeatureSubtype] for this feature.
  ///
  /// If this feature belongs to an [ArcGISFeatureTable] that defines an
  /// [ArcGISFeatureTable.subtypeField], a [FeatureSubtype] that matches
  /// [FeatureSubtype.code] with this feature's attribute value for subtype
  /// field is returned; otherwise, this will return null.
  ///
  /// Return Value: The [FeatureSubtype] for this feature.
  FeatureSubtype? getFeatureSubtype() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_getFeatureSubtype(
          _handle, errorHandler);
    });
    return FeatureSubtype._fromHandle(objectHandle);
  }

  /// Sets up a relationship between this feature and the provided feature based
  /// on the given relationshipInfo. See [RelationshipInfo] for more details.
  ///
  /// Parameters:
  /// - `feature` — The feature to which this feature should be related.
  /// - `relationshipInfo` — The relationship information used to relate the two
  /// features.
  void relateFeature(ArcGISFeature feature,
      {RelationshipInfo? relationshipInfo}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeature_relateFeatureWithRelationshipInfo(
          _handle,
          feature._handle,
          relationshipInfo?._handle ?? ffi.nullptr,
          errorHandler);
    });
  }

  /// Removes the relationship between this feature and the provided feature.
  ///
  /// If there is no existing relationship between the features, an
  /// [ArcGISExceptionType.commonInvalidArgument] is thrown.
  ///
  /// Parameters:
  /// - `feature` — The feature from which this feature should remove its
  /// relationship.
  void unrelateFeature(ArcGISFeature feature) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeature_unrelateFeature(
          _handle, feature._handle, errorHandler);
    });
  }

  /// Updates the given attachment of this feature.
  ///
  /// Parameters:
  /// - `attachmentInfo` — Information describing the attachment.
  /// - `name` — The attachment name.
  /// - `contentType` — The type of content.
  /// - `data` — The attachment data.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> updateAttachment(Attachment attachmentInfo,
      {required String name,
      required String contentType,
      required Uint8List data}) {
    final coreName = _CString(name);
    final coreContentType = _CString(contentType);
    final coreData = data.toByteArrayWrapper();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_updateAttachment(
          _handle,
          attachmentInfo._handle,
          coreName.bytes,
          coreContentType.bytes,
          coreData.ref,
          errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [updateAttachment]. See that method for more
  /// information.
  CancelableOperation<void> updateAttachmentCancelable(
      Attachment attachmentInfo,
      {required String name,
      required String contentType,
      required Uint8List data}) {
    final coreName = _CString(name);
    final coreContentType = _CString(contentType);
    final coreData = data.toByteArrayWrapper();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_updateAttachment(
          _handle,
          attachmentInfo._handle,
          coreName.bytes,
          coreContentType.bytes,
          coreData.ref,
          errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeature_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeature_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeature_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeature_cancelLoad(_handle, errorHandler);
    });
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
        super._processCallback(message);
    }
  }
}

/// A table of features that typically represent real-world objects created from
/// an ArcGIS feature service or an ArcGIS geodatabase.
///
/// This is the base class for the ArcGIS specific feature tables
/// [GeodatabaseFeatureTable] and [ServiceFeatureTable]. You can create
/// instances of these subclasses using their constructors.
///
/// If the [FeatureTable.hasGeometry] is true, you can display the features in
/// an [ArcGISMap] or `ArcGISScene`. To do this create a [FeatureLayer] from the
/// feature table and add it to the map or scene's collection of operational
/// layers ([GeoModel.operationalLayers]). The [ArcGISFeatureTable] can also
/// contain features that do not have a geometry ([FeatureTable.hasGeometry] is
/// false).
///
/// [ArcGISFeatureTable] provides methods for querying related features (for
/// example, ArcGISFeatureTable.queryRelatedFeaturesAsync(ArcGISFeature)), and
/// methods to create new features based on a [FeatureSubtype] or a
/// [FeatureTemplate].
final class ArcGISFeatureTable extends FeatureTable {
  static ArcGISFeatureTable? _fromHandle(RT_ArcGISFeatureTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  ArcGISFeatureTable._withHandle(super.handle)
      : _defaultSubtypeCode = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getDefaultSubtypeCode(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _editableAttributeFields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getEditableAttributeFields(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureSubtypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getFeatureSubtypes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTemplates = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getFeatureTemplates(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTypes = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getFeatureTypes(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _layerInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ArcGISFeatureTable_getLayerInfo(
                handle, errorHandler);
          });
          return ArcGISFeatureLayerInfo._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// The table's default subtype code.
  dynamic get defaultSubtypeCode => _defaultSubtypeCode.value;

  final Memoized<dynamic> _defaultSubtypeCode;

  /// A list of editable fields.
  List<Field> get editableAttributeFields => _editableAttributeFields.value;

  final Memoized<_ArrayList<Field>> _editableAttributeFields;

  /// The table's feature subtypes.
  List<FeatureSubtype> get featureSubtypes => _featureSubtypes.value;

  final Memoized<_ArrayList<FeatureSubtype>> _featureSubtypes;

  /// A list of the feature templates on this table.
  List<FeatureTemplate> get featureTemplates => _featureTemplates.value;

  final Memoized<_ArrayList<FeatureTemplate>> _featureTemplates;

  /// The feature types for this table.
  List<FeatureType> get featureTypes => _featureTypes.value;

  final Memoized<_ArrayList<FeatureType>> _featureTypes;

  /// The global id field name.
  String get globalIdField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getGlobalIdField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the features in this table have attachments, false otherwise.
  bool get hasAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getHasAttachments(
          _handle, errorHandler);
    });
  }

  /// The service information related to the feature layer.
  ///
  /// Explore the editing capabilities of this feature table with
  /// [ArcGISFeatureLayerInfo.capabilities] or the editor tracked fields with
  /// [ArcGISFeatureLayerInfo.editFieldsInfo].
  ArcGISFeatureLayerInfo? get layerInfo => _layerInfo.value;

  final Memoized<ArcGISFeatureLayerInfo?> _layerInfo;

  /// The object id field name.
  String get objectIdField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getObjectIdField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The layer ID in the feature service that this table was created from.
  int get serviceLayerId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getServiceLayerId(
          _handle, errorHandler);
    });
  }

  /// The table's subtype field.
  String get subtypeField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getSubtypeField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The type id field name.
  String get typeIdField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getTypeIdField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the table is using advanced symbology, false otherwise.
  bool get useAdvancedSymbology {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUseAdvancedSymbology(
          _handle, errorHandler);
    });
  }

  set useAdvancedSymbology(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ArcGISFeatureTable_setUseAdvancedSymbology(
          _handle, value, errorHandler);
    });
  }

  /// The username of the feature table.
  ///
  /// The username is used for ownership-based access control (OBAC) and editor
  /// tracking purposes.
  String get username {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUsername(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Creates a new feature based on the provided feature subtype and geometry.
  ///
  /// Parameters:
  /// - `featureSubtype` — The feature subtype.
  /// - `geometry` — The geometry.
  ///
  /// Return Value: An [ArcGISFeature].
  ArcGISFeature createFeatureWithSubtype(FeatureSubtype featureSubtype,
      {Geometry? geometry}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureTable_createFeatureWithSubtypeAndGeometry(
              _handle,
              featureSubtype._handle,
              geometry?._handle ?? ffi.nullptr,
              errorHandler);
    });
    return ArcGISFeature._fromHandle(objectHandle)!;
  }

  /// Creates a new feature based on the provided feature template and geometry.
  ///
  /// Parameters:
  /// - `featureTemplate` — The feature template.
  /// - `geometry` — The geometry.
  ///
  /// Return Value: An [ArcGISFeature].
  ArcGISFeature createFeatureWithTemplate(FeatureTemplate featureTemplate,
      {Geometry? geometry}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureTable_createFeatureWithTemplateAndGeometry(
              _handle,
              featureTemplate._handle,
              geometry?._handle ?? ffi.nullptr,
              errorHandler);
    });
    return ArcGISFeature._fromHandle(objectHandle)!;
  }

  /// Creates a new feature based on the provided feature type and geometry.
  ///
  /// Parameters:
  /// - `featureType` — Type of the feature.
  /// - `geometry` — The geometry.
  ///
  /// Return Value: An [ArcGISFeature].
  ArcGISFeature createFeatureWithType(FeatureType featureType,
      {Geometry? geometry}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_createFeatureWithTypeAndGeometry(
          _handle,
          featureType._handle,
          geometry?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ArcGISFeature._fromHandle(objectHandle)!;
  }

  /// Returns the features added since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns no
  /// features because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features added since last sync. The value of the task result is a
  /// [FeatureQueryResult] object.
  Future<FeatureQueryResult> getAddedFeatures() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getAddedFeatures(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [getAddedFeatures]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> getAddedFeaturesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getAddedFeatures(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Returns the number of features added since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns 0
  /// because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features added since last sync. The value of the task result is int64_t.
  Future<int> getAddedFeaturesCount() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getAddedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [getAddedFeaturesCount]. See that method for more
  /// information.
  CancelableOperation<int> getAddedFeaturesCountCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getAddedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Returns the features deleted since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns no
  /// features because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features deleted since last sync. The value of the task result is a
  /// [FeatureQueryResult] object.
  Future<FeatureQueryResult> getDeletedFeatures() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getDeletedFeatures(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [getDeletedFeatures]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> getDeletedFeaturesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getDeletedFeatures(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Returns the number of features deleted since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns 0
  /// because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features deleted since last sync. The value of the task result is int64_t.
  Future<int> getDeletedFeaturesCount() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getDeletedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [getDeletedFeaturesCount]. See that method for more
  /// information.
  CancelableOperation<int> getDeletedFeaturesCountCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getDeletedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Searches for the feature template with the given name.
  ///
  /// Parameters:
  /// - `name` — The name.
  ///
  /// Return Value: A [FeatureTemplate].
  FeatureTemplate? getFeatureTemplate({required String name}) {
    final coreName = _CString(name);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getFeatureTemplate(
          _handle, coreName.bytes, errorHandler);
    });
    return FeatureTemplate._fromHandle(objectHandle);
  }

  /// Searches for the feature type with the given name.
  ///
  /// Parameters:
  /// - `name` — The name.
  ///
  /// Return Value: A [FeatureType].
  FeatureType? getFeatureType({required String name}) {
    final coreName = _CString(name);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getFeatureType(
          _handle, coreName.bytes, errorHandler);
    });
    return FeatureType._fromHandle(objectHandle);
  }

  /// Returns all the features that were added, updated or deleted since the
  /// last sync.
  ///
  /// Returns a result object containing a feature edit iterator. For mobile
  /// geodatabase created by ArcGIS Pro, the iterator in the result object is
  /// empty because there is no concept of syncing.
  ///
  /// Note that edits inside a transaction (between calls to
  /// [Geodatabase.beginTransaction] and either [Geodatabase.commitTransaction]
  /// or [Geodatabase.rollbackTransaction]) share a common
  /// [LocalFeatureEdit.editDateTime] and may not be returned in a consistent
  /// order.
  ///
  /// Return Value: A [LocalFeatureEditsResult] containing an [Iterable] of
  /// [LocalFeatureEdit] objects.
  Future<LocalFeatureEditsResult> getLocalEdits() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getLocalEdits(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsLocalFeatureEditsResult()!);
  }

  /// Cancelable version of [getLocalEdits]. See that method for more
  /// information.
  CancelableOperation<LocalFeatureEditsResult> getLocalEditsCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getLocalEdits(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsLocalFeatureEditsResult()!);
  }

  /// Returns the number of features that were added, updated or deleted since
  /// the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns a count
  /// of 0 because there is no concept of syncing.
  ///
  /// Return Value: The number of features edited since the last sync.
  Future<int> getLocalEditsCount() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getLocalEditsCount(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [getLocalEditsCount]. See that method for more
  /// information.
  CancelableOperation<int> getLocalEditsCountCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getLocalEditsCount(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Returns a list of all related tables that have been added to the map.
  ///
  /// Only returns tables that have been added to the map that this table is
  /// associated with.
  ///
  /// Return Value: [List] of [ArcGISFeatureTable]
  List<ArcGISFeatureTable> getRelatedTables() {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getRelatedTables(
          _handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Returns list of tables related by the given relationship info.
  ///
  /// Only returns tables that have been added to the map. If there are multiple
  /// instances of the related table on the map, all such instances will be
  /// returned.
  ///
  /// Parameters:
  /// - `relationshipInfo` — The relationship info.
  ///
  /// Return Value: [List] of [ArcGISFeatureTable]
  List<ArcGISFeatureTable> getRelatedTablesWithRelationshipInfo(
      {required RelationshipInfo relationshipInfo}) {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureTable_getRelatedTablesWithRelationshipInfo(
              _handle, relationshipInfo._handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Returns the features updated since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns no
  /// features because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features updated since last sync. The value of the task result is a
  /// [FeatureQueryResult] object.
  Future<FeatureQueryResult> getUpdatedFeatures() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUpdatedFeatures(
          _handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [getUpdatedFeatures]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> getUpdatedFeaturesCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUpdatedFeatures(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Returns the number of features updated since the last sync.
  ///
  /// For mobile geodatabases created by ArcGIS Pro, this method returns 0
  /// because there is no concept of syncing.
  ///
  /// Return Value: The task object representing the asynchronous retrieval of
  /// features updated since last sync. The value of the task result is int64_t.
  Future<int> getUpdatedFeaturesCount() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUpdatedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [getUpdatedFeaturesCount]. See that method for more
  /// information.
  CancelableOperation<int> getUpdatedFeaturesCountCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_getUpdatedFeaturesCount(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Checks whether the feature table has local edits.
  ///
  /// For [ServiceFeatureTable], local edits are edits that have not yet been
  /// applied to the feature service. For [GeodatabaseFeatureTable], local edits
  /// are edits that have been made since the last acknowledged upload. For
  /// mobile geodatabases created by ArcGIS Pro, this method returns false
  /// because there is no concept of uploading or applying edits. For mobile
  /// geodatabases, use [GeodatabaseFeatureTable.hasLocalEditsSince].
  ///
  /// When a table is not change tracked, it will throw an
  /// [ArcGISExceptionType.geodatabaseChangeTrackingNotEnabled].
  ///
  /// Return Value: True if the table has local edits, false otherwise.
  bool hasLocalEdits() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_hasLocalEdits(
          _handle, errorHandler);
    });
  }

  /// Performs a query that returns the number of related features to supplied
  /// feature based on the parameters.
  ///
  /// Parameters:
  /// - `feature` — The feature which should be queried for the number of
  /// related features.
  /// - `parameters` — The parameters to the query.
  ///
  /// Return Value: A task that represents the asynchronous query of related
  /// feature count. The value of the task result contains a uint64_t.
  Future<int> queryRelatedFeatureCount(
      {required ArcGISFeature feature, RelatedQueryParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_queryRelatedFeatureCountCombined(
          _handle,
          feature._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [queryRelatedFeatureCount]. See that method for more
  /// information.
  CancelableOperation<int> queryRelatedFeatureCountCancelable(
      {required ArcGISFeature feature, RelatedQueryParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_queryRelatedFeatureCountCombined(
          _handle,
          feature._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Queries for related features of a given feature in a specific
  /// relationship.
  ///
  /// The origin and all destination tables must be associated with the same
  /// map, either as a feature source for a layer or added to the map via its
  /// table collection. Otherwise, the query will return no results.
  ///
  /// Parameters:
  /// - `feature` — The feature for which to query related features.
  /// - `parameters` — Describes the relationship and the query to perform.
  ///
  /// Return Value: A [Future] that returns a [List] of objects of
  /// [RelatedFeatureQueryResult] type.
  Future<List<RelatedFeatureQueryResult>> queryRelatedFeatures(
      {required ArcGISFeature feature, RelatedQueryParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_queryRelatedFeaturesCombined(
          _handle,
          feature._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [queryRelatedFeatures]. See that method for more
  /// information.
  CancelableOperation<List<RelatedFeatureQueryResult>>
      queryRelatedFeaturesCancelable(
          {required ArcGISFeature feature,
          RelatedQueryParameters? parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ArcGISFeatureTable_queryRelatedFeaturesCombined(
          _handle,
          feature._handle,
          parameters?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Validates constraints for a given feature participating in a relationship.
  ///
  /// The following are considered violations:
  /// * In a composite relationship, adding an orphan feature to the destination
  /// table without relating it to an origin feature
  /// * Cardinality Violations:
  ///   - In 1:1 relationships, if an origin feature is already related to a
  /// destination feature, relating another feature to either of them
  ///   - In 1:n relationships, relating a destination feature to more than one
  /// origin feature
  ///
  /// To recover from an orphaned destination feature violation, simply relate
  /// it to a valid origin feature, using [ArcGISFeature.relateFeature]. You can
  /// usually recover from a cardinality violation by removing the relationship
  /// between the appropriate features, using [ArcGISFeature.unrelateFeature]
  ///
  /// Note that edit operations do not error when there are constraint
  /// violations. This allows you to recover from violations in a back office
  /// operation after applying edits or syncing, if you choose to do so. See
  /// ArcGIS Desktop
  /// [Validate Features](https://desktop.arcgis.com/en/arcmap/10.3/manage-data/editing-attributes/validating-features-and-relationships-in-arcmap.htm)
  /// process here.
  ///
  /// Note: This method makes network calls to query for the related features if
  /// they are not present locally. If you have just related the feature you are
  /// validating, you need to first call [FeatureTable.updateFeature] to reflect
  /// the modified attribute value in the table. If this is not done, validation
  /// results may be incorrect.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: A task that represents the asynchronous validation of
  /// relationship constraints operation. The value of the task result contains
  /// a [RelationshipConstraintViolationType] object.
  Future<RelationshipConstraintViolationType> validateRelationshipConstraints(
      {required ArcGISFeature feature}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureTable_validateRelationshipConstraintsAsync(
              _handle, feature._handle, errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsRelationshipConstraintViolationType()!);
  }

  /// Cancelable version of [validateRelationshipConstraints]. See that method
  /// for more information.
  CancelableOperation<RelationshipConstraintViolationType>
      validateRelationshipConstraintsCancelable(
          {required ArcGISFeature feature}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ArcGISFeatureTable_validateRelationshipConstraintsAsync(
              _handle, feature._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsRelationshipConstraintViolationType()!);
  }
}

/// An object that represents a geodatabase attachment type.
final class Attachment implements ffi.Finalizable {
  final RT_AttachmentHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Attachment_destroy.cast());

  static Attachment? _fromHandle(RT_AttachmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Attachment._withHandle(handle);
  }

  Attachment._withHandle(RT_AttachmentHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Attachment_created(_handle);
    }
  }

  /// The content type of the attachment.
  String get contentType {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_getContentType(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// True if the attachment data has been retrieved.
  bool get hasFetchedData {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_getHasFetchedData(_handle, errorHandler);
    });
  }

  /// The id of the attachment.
  int get id {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_getId(_handle, errorHandler);
    });
  }

  /// The name of the attachment.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The size of the attachment's data.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_getSize(_handle, errorHandler);
    });
  }

  /// Fetches the attachment's data.
  ///
  /// Return Value: A [Future] that returns an [Uint8List].
  Future<Uint8List> fetchData() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_fetchData(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsUint8List()!);
  }

  /// Cancelable version of [fetchData]. See that method for more information.
  CancelableOperation<Uint8List> fetchDataCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Attachment_fetchData(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsUint8List()!);
  }
}

/// An object that represents a coded value found in [CodedValueDomain].
final class CodedValue implements ffi.Finalizable {
  final RT_CodedValueHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.CodedValue_destroy.cast());

  static CodedValue? _fromHandle(RT_CodedValueHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CodedValue._withHandle(handle);
  }

  CodedValue._withHandle(RT_CodedValueHandle handle)
      : _code = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CodedValue_getCode(handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.CodedValue_created(_handle);
    }
  }

  /// The code of the coded value.
  dynamic get code => _code.value;

  final Memoized<dynamic> _code;

  /// The name of the coded value.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CodedValue_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// An object that describes a [CodedValue] to be created.
///
/// Creation of domains is currently only supported on mobile geodatabases,
/// either created in ArcGIS Pro or via [Geodatabase.create].
final class CodedValueDescription implements ffi.Finalizable {
  final RT_CodedValueDescriptionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.CodedValueDescription_destroy.cast());

  static CodedValueDescription? _fromHandle(
      RT_CodedValueDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CodedValueDescription._withHandle(handle);
  }

  CodedValueDescription._withHandle(RT_CodedValueDescriptionHandle handle)
      : _value = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CodedValueDescription_getValue(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue()!;
        }, setter: (value) {
          final coreValue = _ElementExtension.fromDartValue(value);
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_CodedValueDescription_setValue(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.CodedValueDescription_created(_handle);
    }
  }

  /// Creates a new coded value description object with the specified name and
  /// value.
  ///
  /// Parameters:
  /// - `name` — The coded value's name.
  /// - `value` — The coded value's value.
  factory CodedValueDescription(
      {required String name, required dynamic value}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreValue = _ElementExtension.fromDartValue(value);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CodedValueDescription_createWithNameAndValue(
          coreName.bytes, coreValue._handle, errorHandler);
    });
    final CodedValueDescription object =
        CodedValueDescription._withHandle(handle);
    object._value.cache(value);
    return object;
  }

  /// The coded value's name.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CodedValueDescription_getName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_CodedValueDescription_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The coded value's value.
  ///
  /// For fields that utilize a coded value domain, the field type must match
  /// the type of the coded values.
  dynamic get value => _value.value;

  set value(dynamic value) => _value.value = value;

  final Memoized<dynamic> _value;
}

/// An object that specifies an explicit set of values for a [Field].
final class CodedValueDomain extends Domain {
  static CodedValueDomain? _fromHandle(RT_CodedValueDomainHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CodedValueDomain._withHandle(handle);
  }

  CodedValueDomain._withHandle(super.handle)
      : _codedValues = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CodedValueDomain_getCodedValues(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// The coded values of this domain.
  List<CodedValue> get codedValues => _codedValues.value;

  final Memoized<_ArrayList<CodedValue>> _codedValues;
}

/// An object that describes a [CodedValueDomain] to be created.
///
/// Creation of domains is currently only supported on mobile geodatabases,
/// either created in ArcGIS Pro or via [Geodatabase.create].
final class CodedValueDomainDescription extends DomainDescription {
  static CodedValueDomainDescription? _fromHandle(
      RT_CodedValueDomainDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CodedValueDomainDescription._withHandle(handle);
  }

  CodedValueDomainDescription._withHandle(super.handle)
      : _values = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CodedValueDomainDescription_getValues(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a new coded value domain description object with the specified
  /// name and coded values.
  ///
  /// Parameters:
  /// - `name` — The coded value domain's name.
  /// - `fieldType` — The coded value domain's field type.
  /// - `values` — The coded value domain's coded values.
  factory CodedValueDomainDescription(
      {required String name,
      required FieldType fieldType,
      required List<CodedValueDescription> values}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreValues =
        values.toArray(valueType: _ElementType.codedValueDescription);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_CodedValueDomainDescription_createCorrectingFieldType(
              coreName.bytes,
              fieldType.coreValue,
              coreValues._handle,
              errorHandler);
    });
    final CodedValueDomainDescription object =
        CodedValueDomainDescription._withHandle(handle);
    object._values.value.setCache(values);
    return object;
  }

  /// The coded value domain's coded values.
  ///
  /// For fields that utilize a coded value domain, the field type must match
  /// the type of the coded values.
  List<CodedValueDescription> get values => _values.value;

  final Memoized<_MutableArrayList<CodedValueDescription>> _values;
}

/// An object that represents the valid values for a [Field].
final class Domain with JsonSerializable implements ffi.Finalizable {
  final RT_DomainHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Domain_destroy.cast());

  static Domain? _fromHandle(RT_DomainHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Domain._objectTypeOf(handle)) {
      case _DomainType.codedValueDomain:
        return CodedValueDomain._withHandle(handle);
      case _DomainType.inheritedDomain:
        return InheritedDomain._withHandle(handle);
      case _DomainType.rangeDomain:
        return RangeDomain._withHandle(handle);
      case _DomainType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _DomainType _objectTypeOf(RT_DomainHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_getObjectType(handle, errorHandler);
    });
    return _DomainType._fromCoreValue(coreValue);
  }

  _DomainType get _objectType => Domain._objectTypeOf(_handle);

  Domain._withHandle(RT_DomainHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Domain_created(_handle);
    }
  }

  /// The field type of the domain.
  FieldType get fieldType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_getFieldType(_handle, errorHandler);
    });
    return FieldType._fromCoreValue(coreValue);
  }

  /// The name of the domain.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Domain.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Domain_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Domain._fromHandle(objectHandle)!;
  }

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Domain) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_equals(_handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Domain_hash(_handle, errorHandler);
    });
  }
}

/// An object that describes a domain to be created.
final class DomainDescription implements ffi.Finalizable {
  final RT_DomainDescriptionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.DomainDescription_destroy.cast());

  static DomainDescription? _fromHandle(RT_DomainDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (DomainDescription._objectTypeOf(handle)) {
      case _DomainDescriptionType.codedValueDomainDescription:
        return CodedValueDomainDescription._withHandle(handle);
      case _DomainDescriptionType.rangeDomainDescription:
        return RangeDomainDescription._withHandle(handle);
      case _DomainDescriptionType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _DomainDescriptionType _objectTypeOf(
      RT_DomainDescriptionHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DomainDescription_getObjectType(
          handle, errorHandler);
    });
    return _DomainDescriptionType._fromCoreValue(coreValue);
  }

  _DomainDescriptionType get _objectType =>
      DomainDescription._objectTypeOf(_handle);

  DomainDescription._withHandle(RT_DomainDescriptionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DomainDescription_created(_handle);
    }
  }

  /// The field type of the domain to be created.
  ///
  /// Specifies the field type of the domain. Valid field types are
  /// [FieldType.int16], [FieldType.int32], [FieldType.float32],
  /// [FieldType.float64], and [FieldType.date]. Additionally, for
  /// [CodedValueDomainDescription], [FieldType.text] is valid.
  FieldType get fieldType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DomainDescription_getFieldType(
          _handle, errorHandler);
    });
    return FieldType._fromCoreValue(coreValue);
  }

  set fieldType(FieldType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DomainDescription_setFieldType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The name of the domain to be created.
  ///
  /// Specifies the name of the domain. The domain name must be non-empty,
  /// consist only of alphanumeric characters and underscores, and cannot start
  /// with a number or an underscore.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DomainDescription_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_DomainDescription_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// An enumeration of [DomainDescription] types.
enum _DomainDescriptionType {
  /// An unknown type.
  unknown,

  /// A coded value domain description.
  codedValueDomainDescription,

  /// A range domain description.
  rangeDomainDescription;

  factory _DomainDescriptionType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return codedValueDomainDescription;
      case 2:
        return rangeDomainDescription;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case codedValueDomainDescription:
        return 0;
      case rangeDomainDescription:
        return 2;
    }
  }
}

/// An enumeration of [Domain] types.
enum _DomainType {
  /// An unknown type.
  unknown,

  /// A coded value domain.
  codedValueDomain,

  /// An inherited domain.
  inheritedDomain,

  /// A range domain.
  rangeDomain;

  factory _DomainType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return codedValueDomain;
      case 1:
        return inheritedDomain;
      case 2:
        return rangeDomain;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case codedValueDomain:
        return 0;
      case inheritedDomain:
        return 1;
      case rangeDomain:
        return 2;
    }
  }
}

/// An enumeration of available drawing tools.
enum DrawingTool {
  /// An unknown type.
  unknown,

  /// Auto complete polygon.
  autoCompletePolygon,

  /// A circle.
  circle,

  /// A down arrow.
  downArrow,

  /// An ellipse.
  ellipse,

  /// A free hand.
  freeHand,

  /// A left arrow.
  leftArrow,

  /// A line.
  line,

  /// None.
  none,

  /// A point.
  point,

  /// A polygon.
  polygon,

  /// A rectangle.
  rectangle,

  /// A right arrow.
  rightArrow,

  /// A text.
  text,

  /// A triangle.
  triangle,

  /// An up arrow.
  upArrow;

  factory DrawingTool._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return autoCompletePolygon;
      case 1:
        return circle;
      case 2:
        return downArrow;
      case 3:
        return ellipse;
      case 4:
        return freeHand;
      case 5:
        return leftArrow;
      case 6:
        return line;
      case 7:
        return none;
      case 8:
        return point;
      case 9:
        return polygon;
      case 10:
        return rectangle;
      case 11:
        return rightArrow;
      case 12:
        return text;
      case 13:
        return triangle;
      case 14:
        return upArrow;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case autoCompletePolygon:
        return 0;
      case circle:
        return 1;
      case downArrow:
        return 2;
      case ellipse:
        return 3;
      case freeHand:
        return 4;
      case leftArrow:
        return 5;
      case line:
        return 6;
      case none:
        return 7;
      case point:
        return 8;
      case polygon:
        return 9;
      case rectangle:
        return 10;
      case rightArrow:
        return 11;
      case text:
        return 12;
      case triangle:
        return 13;
      case upArrow:
        return 14;
    }
  }
}

/// The various types of edits.
enum EditOperation {
  /// An unknown operation.  Normally the result when an error occurs.
  unknown,

  /// An add operation.
  add,

  /// An update operation.
  update,

  /// A delete operation.
  delete;

  factory EditOperation._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return add;
      case 1:
        return update;
      case 2:
        return delete;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case add:
        return 0;
      case update:
        return 1;
      case delete:
        return 2;
    }
  }
}

/// An object that represents the results of an attempt to push an update to a
/// service.
final class EditResult implements ffi.Finalizable {
  final RT_EditResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.EditResult_destroy.cast());

  static EditResult? _fromHandle(RT_EditResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (EditResult._objectTypeOf(handle)) {
      case _EditResultType.editResult:
        return EditResult._withHandle(handle);
      case _EditResultType.featureEditResult:
        return FeatureEditResult._withHandle(handle);
      case _EditResultType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _EditResultType _objectTypeOf(RT_EditResultHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditResult_getObjectType(handle, errorHandler);
    });
    return _EditResultType._fromCoreValue(coreValue);
  }

  _EditResultType get _objectType => EditResult._objectTypeOf(_handle);

  EditResult._withHandle(RT_EditResultHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_EditResult_getError(handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.EditResult_created(_handle);
    }
  }

  /// True if the attempt to edit resulted in any errors.
  bool get completedWithErrors {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditResult_getCompletedWithErrors(
          _handle, errorHandler);
    });
  }

  /// The type of the operation applied to the row.
  EditOperation get editOperation {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditResult_getEditOperation(_handle, errorHandler);
    });
    return EditOperation._fromCoreValue(coreValue);
  }

  /// The any error information about the edit.
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// The global id of the row that was edited.
  ///
  /// When returned as a result of geodatabase sync
  /// ([GeodatabaseSyncTask.syncGeodatabaseWithSyncDirection] then
  /// [SyncGeodatabaseJob.result]) in a [SyncLayerResult] this property may
  /// return an empty string indicating a more general error with features in
  /// this table rather than an error specific to a single feature edit.
  String get globalId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditResult_getGlobalId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The object id of the row that was edited.
  int get objectId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EditResult_getObjectId(_handle, errorHandler);
    });
  }
}

/// The various types of edit results.
enum _EditResultType {
  /// An unknown result type.  Normally the result when an error occurs.
  unknown,

  /// An edit operation on a feature.
  featureEditResult,

  /// A generic edit operation result.
  editResult;

  factory _EditResultType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return featureEditResult;
      case 1:
        return editResult;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case featureEditResult:
        return 0;
      case editResult:
        return 1;
    }
  }
}

/// A representation of a real-world geographic entity.
///
/// Features are composed of both a geometry (point, polyline, or polygon) and
/// attributes. The geometry represents the location and shape of the real-world
/// entity; the attributes (key-value pairs) represent the fields and values
/// that describe the entity. Examples of features include roads, fire hydrants,
/// and property boundaries. Applications can access features from a feature
/// layer or a feature collection to visualize the feature's geographic and
/// attribute information, execute spatial queries, perform analyses, or make
/// edits to the feature's data directly. Feature attribute values can be
/// changed, but attribute definitions cannot be added, deleted, or modified.
///
/// Features are typically persisted in a data source (such as a feature
/// service, geodatabase, shapefile, GeoJSON file, or GeoPackage) and have a
/// common attribute schema. Features can also be stored directly in a feature
/// collection in a map or scene. A feature collection groups logically related
/// tables of features that may have different schema, geometry types, and
/// symbology. See [FeatureCollectionLayer] for more information.
///
/// [Feature] is the base class for [ArcGISFeature]. ArcGIS features are stored
/// in ArcGIS specific data sources such as [GeodatabaseFeatureTable] and
/// [ServiceFeatureTable].
final class Feature
    implements GeoElement, _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_FeatureHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Feature_destroyInstance.cast());

  static Feature? _fromHandle(RT_FeatureHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Feature._instanceCache.instanceWith(handle);
  }

  static _FeatureObjectType _objectTypeOf(RT_FeatureHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_getObjectType(handle, errorHandler);
    });
    return _FeatureObjectType._fromCoreValue(coreValue);
  }

  _FeatureObjectType get _objectType => Feature._objectTypeOf(_handle);

  Feature._withHandle(RT_FeatureHandle handle)
      : _attributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Feature_getAttributes(handle, errorHandler);
          });
          return dictionaryHandle.toMap();
        }),
        _featureTable = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Feature_getFeatureTable(handle, errorHandler);
          });
          return FeatureTable._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Feature_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _geometryOrAttributesChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Feature_setGeometryOrAttributesChangedCallback(
              _handle,
              bindings.addresses.asyncFeatureChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Feature_setGeometryOrAttributesChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );

    _onGeometryOrAttributesChanged.listen((featureChangeType) {
      if (featureChangeType == _FeatureChangeType.attributes) {
        _attributes.invalidateCache();
      }
    });
  }

  late final StreamController<_FeatureChangeType>
      _geometryOrAttributesChangedStreamController;

  /// Invokes the callback when the geometry changed or attributes indirectly
  /// changed. Direct changes to an attribute will not trigger this event but
  /// indirect changes (e.g. via a call to [Feature.refresh]) will.
  Stream<_FeatureChangeType> get _onGeometryOrAttributesChanged =>
      _geometryOrAttributesChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _FeatureFactory(), kind: 'Feature');

  @override
  Map<String, dynamic> get attributes => _attributes.value;

  final Memoized<_DictionaryMap<String, dynamic>> _attributes;

  /// The [FeatureTable] that this feature belongs to.
  FeatureTable? get featureTable => _featureTable.value;

  final Memoized<FeatureTable?> _featureTable;

  @override
  Geometry? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_getGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  @override
  set geometry(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Feature_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_getInstanceId(_handle, errorHandler);
    });
  }

  /// True if the feature has been added to the table, otherwise false.
  bool get _isAddedToTable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_getIsAddedToTable(_handle, errorHandler);
    });
  }

  @override
  ArcGISPoint? _computeCalloutLocation(
      {required ArcGISPoint? tapLocation,
      required ArcGISMapViewController? arcGISMapView}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_computeCalloutLocation(
          _handle,
          tapLocation?._handle ?? ffi.nullptr,
          arcGISMapView?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Resets the attributes and geometry to the values in the data source.
  ///
  /// Discards any in-memory changes to the feature that have not been applied
  /// to its table, and reloads the feature's geometry and all attributes.
  ///
  /// Return Value: true if the geometry or attributes were updated; false
  /// otherwise.
  bool refresh() {
    final result = _refresh();
    _attributes.invalidateCache();
    return result;
  }

  bool _refresh() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Feature_refresh(_handle, errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeFeatureChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return _FeatureChangeType._fromCoreValue(coreValue);
        }();
        _geometryOrAttributesChangedStreamController.add(event);
      default:
        logger.f('Feature unhandled asyncType $asyncType');
    }
  }
}

final class _FeatureFactory
    implements _InstanceFactory<Feature, RT_FeatureHandle> {
  @override
  Feature createInstance({required RT_FeatureHandle handle}) {
    switch (Feature._objectTypeOf(handle)) {
      case _FeatureObjectType.arcGISFeature:
        return ArcGISFeature._withHandle(handle);
      case _FeatureObjectType.feature:
        return Feature._withHandle(handle);
      case _FeatureObjectType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  @override
  void destroyHandle(RT_FeatureHandle handle) {
    bindings.Feature_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_FeatureHandle handle) {
    return runtimecore.RT_Feature_getInstanceId(handle, ffi.nullptr);
  }
}

/// The type of change for `_FeatureChangedEvent`.
enum _FeatureChangeType {
  /// Geometry changed.
  geometry,

  /// One or more attributes indirectly changed.
  attributes,

  /// The geometry changed and one or more attributes indirectly changed.
  attributesAndGeometry;

  factory _FeatureChangeType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return geometry;
      case 2:
        return attributes;
      case 3:
        return attributesAndGeometry;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case geometry:
        return 1;
      case attributes:
        return 2;
      case attributesAndGeometry:
        return 3;
    }
  }
}

/// A feature collection represents a lightweight collection of features that
/// can be saved in a map or portal item.
///
/// A feature collection is typically used to hold features with mixed geometry
/// or unstructured data. The features are stored in feature collection tables,
/// where all the features that belong to a table share the same attribute
/// schema (fields), geometry type, and spatial reference. The feature
/// collection groups these different feature tables together so that you can
/// display and manage them in a single layer.
///
/// There are a number of ways to create a feature collection:
///
/// * You can build a feature collection in ArcGIS Online by
/// [creating a sketch layer](https://doc.arcgis.com/en/arcgis-online/create-maps/create-sketch-layers-mv.htm)
/// and saving it as part of the map. The sketch layer may contain points,
/// lines, polygons, and associated text to describe things in the map. Because
/// they have different schema and geometry types, these features are stored in
/// several distinct feature collection tables.
/// * You can import features into ArcGIS Online from files, such as CSV or
/// shapefiles, and save them in a separate [PortalItem] (of type
/// [PortalItemType.featureCollection]).
/// * You can create a [FeatureCollection] programmatically by constructing an
/// empty [FeatureCollectionTable] and adding features to the table.
///
/// If you need to share the feature collection between several maps or scenes,
/// it is best to store it as a separate portal item. If you need to make
/// frequent (near real-time) edits to features in a collection, consider
/// storing these in a feature service instead, because the feature collection
/// is not refreshed until the map or portal item is reloaded. If features are
/// used by a single map or are not subject to frequent updates, it might be
/// best to store them directly in the map. Edits made to features stored in a
/// map will be saved when the map is saved. Edits made to features stored in a
/// portal item (and loaded into a map, for example) must be explicitly saved to
/// the original portal item.
///
/// To render the features in a map or scene, construct a
/// [FeatureCollectionLayer] using the [FeatureCollection] and add the layer to
/// the collection of operational layers.
final class FeatureCollection
    with JsonSerializable, Loadable
    implements _CallbackReceiver, ffi.Finalizable {
  final RT_FeatureCollectionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureCollection_destroy.cast());

  static FeatureCollection? _fromHandle(RT_FeatureCollectionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureCollection._withHandle(handle);
  }

  FeatureCollection._withHandle(RT_FeatureCollectionHandle handle)
      : _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollection_getItem(
                handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureCollection_setItem(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _tables = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollection_getTables(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureCollection_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureCollection_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureCollection_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureCollection_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureCollection_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Create a feature collection object.
  factory FeatureCollection() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollection_create(errorHandler);
    });
    return FeatureCollection._withHandle(handle);
  }

  /// Creates a feature collection object from a [PortalItem].
  ///
  /// Parameters:
  /// - `item` — An [Item] (only [PortalItem] are supported).
  factory FeatureCollection.withItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollection_createWithItem(
          item._handle, errorHandler);
    });
    return FeatureCollection._withHandle(handle);
  }

  /// Creates a feature collection object from a set of feature collection
  /// tables.
  ///
  /// Parameters:
  /// - `tables` — A [List] of [FeatureCollectionTable].
  factory FeatureCollection.withTables(List<FeatureCollectionTable> tables) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreTables =
        tables.toMutableArray(valueType: _ElementType.featureCollectionTable);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollection_createWithTables(
          coreTables._handle, errorHandler);
    });
    final FeatureCollection object = FeatureCollection._withHandle(handle);
    object._tables.value.setCache(tables);
    return object;
  }

  /// The item the feature collection has been created from.
  ///
  /// This is only available if the [FeatureCollection] is associated with a
  /// [PortalItem]. This is the case if the [FeatureCollection] had been created
  /// from an item using [FeatureCollection.withItem] or if the
  /// [FeatureCollection] had been previously saved as a [PortalItem].
  Item? get item => _item.value;

  set item(Item? value) => _item.value = value;

  final Memoized<Item?> _item;

  /// The feature collection tables of a feature collection.
  List<FeatureCollectionTable> get tables => _tables.value;

  final Memoized<_MutableArrayList<FeatureCollectionTable>> _tables;

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollection_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory FeatureCollection.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_FeatureCollection_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return FeatureCollection._fromHandle(objectHandle)!;
  }

  factory FeatureCollection.fromJson(Map<String, dynamic> json) {
    return FeatureCollection.fromJsonString(jsonEncode(json));
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollection_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureCollection_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureCollection_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureCollection_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _item.invalidateCache();
    _tables.invalidateCache();
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
        logger.f('FeatureCollection unhandled asyncType $asyncType');
    }
  }
}

/// A layer that can visualize a feature collection.
///
/// A feature collection groups logically-related tables of features even though
/// they may have different schema, geometry types, and symbology. A feature
/// collection layer allows multiple tables with different schemas to be managed
/// as a group.
///
/// Functional characteristics
///
/// Sketch information (called Map Notes in ArcGIS Online), may contain points,
/// lines, polygons, and associated text to describe things in the map. Because
/// they have different schema and geometry types, these features are stored in
/// several distinct tables. A feature collection layer allows these tables to
/// be rendered and managed as a group.
///
/// A feature collection can be saved in the map or as a stand-alone portal
/// item. If you need to share the feature collection between several maps, it's
/// best to store it as a separate portal item. If you need to make frequent
/// (near real-time) edits to features in a collection, consider storing these
/// in a feature service instead, because the feature collection is not
/// refreshed until the map or portal item is reloaded. If features are used by
/// a single map or are not subject to frequent updates, it might be best to
/// store them directly in the map. Edits made to features stored in a map will
/// be saved when the map is saved. Edits made to features stored in a portal
/// item (and loaded into a map, for example) must be explicitly saved to the
/// original portal item.
///
/// Performance characteristics
///
/// Feature collection layers are designed to display a moderate amount of
/// feature data (hundreds or thousands of features). They are ideal for sharing
/// data that is not subject to frequent updates among several clients.
///
/// As full feature information is cached locally in a geodatabase and features
/// are drawn natively, this layer type offers excellent display performance
/// when zooming and panning the map, within the extent of cached features.
///
/// Downloading features to the device may require extensive network usage and
/// local device storage space. After the features are present on the client,
/// the app no longer needs to make requests for the data. App memory usage
/// increases with the number and complexity of the features in the collection.
final class FeatureCollectionLayer extends Layer {
  static FeatureCollectionLayer? _fromHandle(
      RT_FeatureCollectionLayerHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Layer._instanceCache.instanceWith(handle);
  }

  FeatureCollectionLayer._withHandle(super.handle)
      : _featureCollection = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollectionLayer_getFeatureCollection(
                handle, errorHandler);
          });
          return FeatureCollection._fromHandle(objectHandle)!;
        }),
        _layers = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollectionLayer_getLayers(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// Creates a new feature collection layer object.
  ///
  /// Parameters:
  /// - `featureCollection` — The feature collection to initialize this layer
  /// with.
  factory FeatureCollectionLayer.withFeatureCollection(
      FeatureCollection featureCollection) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionLayer_createWithFeatureCollection(
          featureCollection._handle, errorHandler);
    });
    final FeatureCollectionLayer object =
        Layer._instanceCache.instanceWith(handle);
    object._featureCollection.cache(featureCollection);
    return object;
  }

  /// The feature collection associated with this layer.
  FeatureCollection get featureCollection => _featureCollection.value;

  final Memoized<FeatureCollection> _featureCollection;

  /// The feature layers associated with this layer.
  List<FeatureLayer> get layers => _layers.value;

  final Memoized<_ArrayList<FeatureLayer>> _layers;
}

/// A feature collection table represents an individual feature table in a
/// [FeatureCollection].
///
/// A [FeatureCollectionTable] consists of a feature definition (table schema)
/// and a set of features that match that feature definition. You can obtain a
/// [FeatureCollectionTable] from an existing [FeatureCollection.tables]
/// collection or you can create a new [FeatureCollectionTable] programmatically
/// in your app.
///
/// To create a new [FeatureCollectionTable], you can use a constructor that
/// defines a set of fields, the geometry type, and spatial reference, and then
/// populate it by adding new features. Alternatively, you can create a new
/// [FeatureCollectionTable] from a [FeatureSet], such as the
/// [FeatureQueryResult] returned from a [FeatureTable.queryFeatures].
///
/// To render the features in a map or scene, add the [FeatureCollectionTable]
/// to a [FeatureCollection.tables] collection, construct a
/// [FeatureCollectionLayer] from the [FeatureCollection], and add it to the map
/// or scene's collection of operational layers. To specify the
/// [FeatureCollectionTable] symbology, just apply a renderer to the
/// [FeatureCollectionTable.renderer]. If required, you can override this
/// symbology on a per-feature basis using the
/// [FeatureCollectionTable.setSymbolOverride].
final class FeatureCollectionTable extends FeatureTable implements FeatureSet {
  static FeatureCollectionTable? _fromHandle(
      RT_FeatureCollectionTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  FeatureCollectionTable._withHandle(super.handle)
      : _layerInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollectionTable_getLayerInfo(
                handle, errorHandler);
          });
          return ArcGISFeatureLayerInfo._fromHandle(objectHandle);
        }),
        _renderer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureCollectionTable_getRenderer(
                handle, errorHandler);
          });
          return Renderer._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FeatureCollectionTable_setRenderer(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates an empty [FeatureCollectionTable] from the specified fields,
  /// geometry type, spatial reference. The table can contain z and m values.
  ///
  /// Parameters:
  /// - `fields` — A [List] of type [Field]. Contents of the [List] will be
  /// copied. Can be null.
  /// - `geometryType` — The type of geometry that will be held in this table.
  /// Can be [GeometryType.unknown].
  /// - `spatialReference` — The spatial reference of the features that will be
  /// held in this table. Can be null as long as geometry_type is
  /// [GeometryType.unknown].
  /// - `hasZ` — Boolean specifying whether the table supports geometries with Z
  /// values.
  /// - `hasM` — Boolean specifying whether the table supports geometries with M
  /// values.
  factory FeatureCollectionTable(
      {required List<Field> fields,
      required GeometryType geometryType,
      required SpatialReference? spatialReference,
      bool hasZ = false,
      bool hasM = false}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFields = fields.toMutableArray(valueType: _ElementType.field);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionTable_createWithZM(
          coreFields._handle,
          geometryType.coreValue,
          spatialReference?._handle ?? ffi.nullptr,
          hasZ,
          hasM,
          errorHandler);
    });
    final FeatureCollectionTable object =
        FeatureTable._instanceCache.instanceWith(handle);
    object._fields.value.setCache(fields);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a [FeatureCollectionTable] populated from the specified
  /// [FeatureSet].
  ///
  /// The [FeatureCollectionTable] will be populated with the contents of the
  /// [FeatureSet]. Note that this constructor may take some time to complete
  /// depending on how many features are in the feature set.
  ///
  /// Parameters:
  /// - `featureSet` — An object that implements the [FeatureSet].
  factory FeatureCollectionTable.withFeatureSet(FeatureSet featureSet) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFeatureSet = _ElementExtension.fromDartValue(featureSet);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionTable_createWithFeatureSet(
          coreFeatureSet._handle, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  /// Creates a [FeatureCollectionTable] populated from the specified
  /// [GeoElement] collection.
  ///
  /// The geometry type and spatial reference will be inferred from the
  /// geo-elements passed in. Note that this constructor may take some time to
  /// complete depending on how many geo-elements are passed in.
  ///
  /// Parameters:
  /// - `geoElements` — A [List] of objects that implement the [GeoElement].
  /// Contents of the [List] will be copied.
  /// - `fields` — A [List] of type [Field]. Contents of the [List] will be
  /// copied. Can be null.
  factory FeatureCollectionTable.withGeoElements(
      {required List<GeoElement> geoElements, required List<Field> fields}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeoElements =
        geoElements.toMutableArray(valueType: _ElementType.variant);
    final coreFields = fields.toMutableArray(valueType: _ElementType.field);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionTable_createWithGeoElements(
          coreGeoElements._handle, coreFields._handle, errorHandler);
    });
    final FeatureCollectionTable object =
        FeatureTable._instanceCache.instanceWith(handle);
    object._fields.value.setCache(fields);
    return object;
  }

  /// The layer info of the feature collection table.
  ArcGISFeatureLayerInfo? get layerInfo => _layerInfo.value;

  final Memoized<ArcGISFeatureLayerInfo?> _layerInfo;

  /// The renderer for the feature collection table.
  Renderer? get renderer => _renderer.value;

  set renderer(Renderer? value) => _renderer.value = value;

  final Memoized<Renderer?> _renderer;

  /// Gets the symbol override for the given feature in the feature collection
  /// table.
  ///
  /// Parameters:
  /// - `feature` — The feature to retrieve the symbol override for.
  ///
  /// Return Value: An [ArcGISSymbol]. null is returned if an error occurs.
  ArcGISSymbol? getSymbolOverride({required Feature feature}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionTable_getSymbolOverride(
          _handle, feature._handle, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle);
  }

  /// Sets the symbol override for the given feature in the feature collection
  /// table.
  ///
  /// Parameters:
  /// - `feature` — The feature to set the symbol override for.
  /// - `symbol` — The symbol. Can be null.
  void setSymbolOverride(
      {required Feature feature, required ArcGISSymbol? symbol}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureCollectionTable_setSymbolOverride(_handle,
          feature._handle, symbol?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  @override
  Iterable<Feature> features() {
    final iteratorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureCollectionTable_iterator(
          _handle, errorHandler);
    });
    return iteratorHandle.toIterable();
  }
}

/// An object that represents the results of an attempt to push a feature update
/// to a feature service.
final class FeatureEditResult extends EditResult {
  static FeatureEditResult? _fromHandle(RT_FeatureEditResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureEditResult._withHandle(handle);
  }

  FeatureEditResult._withHandle(super.handle)
      : _attachmentResults = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureEditResult_getAttachmentResults(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// A list of edit results for any attachment changes.
  List<EditResult> get attachmentResults => _attachmentResults.value;

  final Memoized<_ArrayList<EditResult>> _attachmentResults;
}

/// The different types of available features.
enum _FeatureObjectType {
  /// An unknown feature table type.
  unknown,

  /// An ArcGIS Service feature.
  arcGISFeature,

  /// A feature.
  feature;

  factory _FeatureObjectType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return arcGISFeature;
      case 1:
        return feature;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case arcGISFeature:
        return 0;
      case feature:
        return 1;
    }
  }
}

/// An object that represents the results of a feature query.
final class FeatureQueryResult implements FeatureSet, ffi.Finalizable {
  final RT_FeatureQueryResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureQueryResult_destroy.cast());

  static FeatureQueryResult? _fromHandle(RT_FeatureQueryResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureQueryResult._withHandle(handle);
  }

  FeatureQueryResult._withHandle(RT_FeatureQueryResultHandle handle)
      : _fields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureQueryResult_getFields(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureQueryResult_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureQueryResult_created(_handle);
    }
  }

  @override
  List<Field> get fields => _fields.value;

  final Memoized<_ArrayList<Field>> _fields;

  @override
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureQueryResult_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// True if the query resulted in a larger number of features than what the
  /// transfer limit supports.
  bool get isTransferLimitExceeded {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureQueryResult_getIsTransferLimitExceeded(
          _handle, errorHandler);
    });
  }

  @override
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  @override
  Iterable<Feature> features() {
    final iteratorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureQueryResult_iterator(_handle, errorHandler);
    });
    return iteratorHandle.toIterable();
  }
}

/// The feature request mode for a service feature table. It determines (1)
/// whether features are cached locally (for quicker access by map and scene
/// layers) and (2) whether queries are performed on the local cache or on the
/// server.
enum FeatureRequestMode {
  /// Indicates the feature table has not been loaded and the mode has yet to be
  /// set.
  undefined,

  /// The features are requested from the server as they are needed, in response
  /// to user or developer interaction with the layer (pan, zoom). Features are
  /// cached in the local table for the duration of the session. Queries are
  /// executed on the local cache or (if requested features are not resident in
  /// the cache) on the server. This mode is the default.
  ///
  /// In this mode, features have a minimum set of attributes, and feature
  /// geometries have no m-values even if m-values are defined by the service.
  /// This is an optimization for faster rendering. To access all attributes or
  /// access geometries that contain m-values, the features you get from a query
  /// must be loaded. You can load them yourself or request that the query
  /// method return them already loaded (see [QueryFeatureFields.loadAll]). For
  /// more information, see the class description for [ServiceFeatureTable].
  onInteractionCache,

  /// The features are always requested from the server and are never cached.
  /// This mode ensures that you are working against the latest data, but it has
  /// a high network bandwidth since it goes to the server for all interactions
  /// (pans, zooms, selects, or queries).
  ///
  /// In this mode, features have a minimum set of attributes, and feature
  /// geometries have no m-values even if m-values are defined by the service.
  /// This is an optimization for faster rendering. To access all attributes or
  /// access geometries that contain m-values, the features you get from a query
  /// must be loaded. You can load them yourself or request that the query
  /// method return them already loaded (see [QueryFeatureFields.loadAll]). For
  /// more information, see the class description for [ServiceFeatureTable].
  onInteractionNoCache,

  /// The features are requested from the server by an explicit call to
  /// [ServiceFeatureTable.populateFromService], which populates the local
  /// cache. Queries performed on the table will be executed locally.
  ///
  /// In this mode, the features have all fields defined by the [List] of
  /// [String] you pass to [ServiceFeatureTable.populateFromService].
  manualCache;

  factory FeatureRequestMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return undefined;
      case 1:
        return onInteractionCache;
      case 2:
        return onInteractionNoCache;
      case 3:
        return manualCache;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case undefined:
        return 0;
      case onInteractionCache:
        return 1;
      case onInteractionNoCache:
        return 2;
      case manualCache:
        return 3;
    }
  }
}

/// An interface for feature sets.
///
/// This interface encapsulates some common read-only operations that could be
/// applied to various sets of features.
abstract interface class FeatureSet {
  /// The fields of the feature set.
  List<Field> get fields;

  /// The geometry type stored in this feature set.
  GeometryType get geometryType;

  /// The spatial reference of the feature set.
  SpatialReference? get spatialReference;

  /// Returns the feature iterator.
  ///
  /// Return Value: An [Iterable] that returns [Feature] types.
  Iterable<Feature> features();
}

/// A feature subtype describes a subset of features in an [ArcGISFeatureTable]
/// that share the same integer attribute value.
///
/// Feature subtypes categorize features in a dataset based on the value of an
/// integer attribute. A subtype can define different default values or domains
/// for fields. For example, city streets in a feature table could be
/// categorized into three feature subtypes: local streets, collector streets,
/// and arterial streets. Feature subtypes can also be used with utility
/// networks to represent asset groups.
///
/// If [ArcGISFeatureTable.featureSubtypes] contains one or more
/// [FeatureSubtype], you can use
/// `SubtypeFeatureLayer.SubtypeFeatureLayer(ArcGISFeatureTable)` to create a
/// `SubtypeFeatureLayer`. You can then obtain a sublayer for each of the
/// feature sub types from `SubtypeFeatureLayer.subtypeSublayers`. Each
/// `SubtypeSublayer` allows you to configure different layer properties, such
/// as opacity, renderer, and scale, for each [FeatureSubtype]. This is
/// particularly useful for data, such as utility networks, in which many
/// different network elements are grouped into a single subtype feature layer.
///
/// If you build an editing application, you can use
/// [ArcGISFeatureTable.createFeatureWithSubtype] to create a new feature with
/// the specified feature subtype. The [FeatureSubtype.prototypeAttributes] will
/// ensure that a default set of attribute values are applied to the
/// [ArcGISFeature] and the [FeatureSubtype.domains] are utilized.
final class FeatureSubtype implements ffi.Finalizable {
  final RT_FeatureSubtypeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureSubtype_destroy.cast());

  static FeatureSubtype? _fromHandle(RT_FeatureSubtypeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureSubtype._withHandle(handle);
  }

  FeatureSubtype._withHandle(RT_FeatureSubtypeHandle handle)
      : _code = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureSubtype_getCode(handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _domains = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureSubtype_getDomains(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _fieldOverrides = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureSubtype_getFieldOverrides(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _prototypeAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureSubtype_getPrototypeAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureSubtype_created(_handle);
    }
  }

  /// The feature subtype's code.
  dynamic get code => _code.value;

  final Memoized<dynamic> _code;

  /// The domains associated with this feature subtype.
  Map<String, Domain> get domains => _domains.value;

  final Memoized<_UnmodifiableDictionaryMap<String, Domain>> _domains;

  /// The fields defined for this feature subtype.
  ///
  /// A subset of [FeatureTable.fields] relevant to this feature subtype. This
  /// collection of [Field] may override properties defined in the
  /// [FeatureTable.fields]. For example, [Field.alias] and [Field.domain].
  List<Field> get fieldOverrides => _fieldOverrides.value;

  final Memoized<_ArrayList<Field>> _fieldOverrides;

  /// The name of the feature subtype.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureSubtype_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The prototype attributes associated with this feature subtype.
  Map<String, dynamic> get prototypeAttributes => _prototypeAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>>
      _prototypeAttributes;
}

/// A table of features that typically represent real-world objects such as fire
/// hydrants, roads, and forests.
///
/// This is the base class for a number of different feature tables, such as
/// [ServiceFeatureTable], [FeatureCollectionTable], and
/// [GeoPackageFeatureTable].
///
/// The records in a feature table must all have geometry (shape and location)
/// or have no geometry (just attribute values). If the records have geometry
/// ([FeatureTable.hasGeometry] is true), you can display the features by
/// creating a [FeatureLayer] from the feature table and adding the feature
/// layer to the [ArcGISMap] or `ArcGISScene`'s collection of operational layers
/// ([GeoModel.operationalLayers]).
///
/// [FeatureTable] provides methods for spatial and attribute querying (for
/// example, [FeatureTable.queryFeatures]), and methods to add, update, and
/// delete features (such as [FeatureTable.addFeature],
/// [FeatureTable.updateFeature], and [FeatureTable.deleteFeature]).
final class FeatureTable
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_FeatureTableHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.FeatureTable_destroyInstance.cast());

  static FeatureTable? _fromHandle(RT_FeatureTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  static _FeatureTableType _objectTypeOf(RT_FeatureTableHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getObjectType(handle, errorHandler);
    });
    return _FeatureTableType._fromCoreValue(coreValue);
  }

  _FeatureTableType get _objectType => FeatureTable._objectTypeOf(_handle);

  FeatureTable._withHandle(RT_FeatureTableHandle handle)
      : _fields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTable_getFields(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _layer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTable_getLayer(handle, errorHandler);
          });
          return Layer._fromHandle(objectHandle);
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTable_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureTable_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureTable_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureTable_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureTable_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_FeatureTable_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache =
      _InstanceCache(factory: _FeatureTableFactory(), kind: 'FeatureTable');

  /// A user-friendly name that can be displayed in the UI (for example, in a
  /// Table of Contents).
  ///
  /// If the table is displayed with a [FeatureLayer], the
  /// [FeatureTable.displayName] is used as the [Layer.name].
  ///
  /// The default value is [FeatureTable.tableName].
  String get displayName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getDisplayName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set displayName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureTable_setDisplayName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The geographic extent of features within the table.
  ///
  /// This is calculated differently for specific types and modes of feature
  /// tables:
  ///
  /// * [ServiceFeatureTable]. If the feature request mode is
  /// [FeatureRequestMode.manualCache] the service feature table will return the
  /// extent of the features which have been cached. All other modes will return
  /// the extent of the layer/table defined by the service (from
  /// [ArcGISFeatureLayerInfo.extent]). This can be used to determine the extent
  /// within which data can be edited.
  ///
  /// * [GeodatabaseFeatureTable]. This returns the extent of the features which
  /// have been cached. This extent can grow as features are added or edited,
  /// but not shrink.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// The collection of [Field] objects representing the fields of the feature
  /// table.
  List<Field> get fields => _fields.value;

  final Memoized<_ArrayList<Field>> _fields;

  /// The type of geometry of the features stored in this table.
  ///
  /// If [FeatureTable.hasGeometry] is false, then the geometry type is
  /// [GeometryType.unknown].
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getGeometryType(_handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// True if the feature table supports geographic features, false otherwise.
  bool get hasGeometry {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getHasGeometry(_handle, errorHandler);
    });
  }

  /// True if the feature table supports geometries with M values, false
  /// otherwise.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getHasM(_handle, errorHandler);
    });
  }

  /// True if the feature table supports geometries with Z values, false
  /// otherwise.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getHasZ(_handle, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getInstanceId(_handle, errorHandler);
    });
  }

  /// True if this feature table is editable, false otherwise.
  ///
  /// Underlying file permissions (for subclasses such as
  /// `ShapefileFeatureTable` and [GeodatabaseFeatureTable]) can be changed
  /// while the feature table is open. In these cases the value of this property
  /// may not be accurate.
  bool get isEditable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getIsEditable(_handle, errorHandler);
    });
  }

  /// The layer that displays this table, if any.
  ///
  /// The [Layer] type depends on how the feature table is created. For example,
  /// a [Layer] will be an `AnnotationLayer` if the [FeatureTable] is created
  /// from a table that supports annotation. See [Layer] for more information
  /// about the supported layer types.
  ///
  /// The layer will be null if the feature table does not contain spatial
  /// features (where [FeatureTable.hasGeometry] is false).
  Layer? get layer => _layer.value;

  final Memoized<Layer?> _layer;

  /// The number of features in the table.
  ///
  /// If all the features are stored in the local table, for example with a
  /// [GeodatabaseFeatureTable] or a `ShapefileFeatureTable`, then the
  /// [FeatureTable.numberOfFeatures] will return the full number of features.
  ///
  /// If the table is created from a service, for example, [ServiceFeatureTable]
  /// or `WfsFeatureTable`, the [FeatureTable.numberOfFeatures] will only return
  /// the number of features in the local table cache. You need to populate the
  /// local table cache to return a value for [FeatureTable.numberOfFeatures].
  /// Do this by rendering the features in an [ArcGISMap] or `ArcGISScene` with
  /// a [FeatureLayer], or by querying the feature table. Consider the feature
  /// table's [FeatureRequestMode] in both cases. See [ServiceFeatureTable] or
  /// `WfsFeatureTable` for more information. If you want to return the full
  /// number of features in the service, execute
  /// [FeatureTable.queryFeatureCount] and pass "1=1" to the
  /// [QueryParameters.whereClause].
  int get numberOfFeatures {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getNumberOfFeatures(
          _handle, errorHandler);
    });
  }

  /// The spatial reference of the table.
  ///
  /// A spatial reference defines how the coordinates of a feature's [Geometry]
  /// correspond to locations in the real world. For more information, see the
  /// [SpatialReference] class or the
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// documentation.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The name of the table in the source dataset.
  String get tableName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getTableName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Adds a feature to the table.
  ///
  /// Adding a feature that contains a [Geometry] causes the geometry to become
  /// simplified. This may change a single part geometry to a multipart
  /// geometry, or round off X, Y, Z, and M coordinate values that are above the
  /// resolution set by the [SpatialReference].
  ///
  /// Adding a feature to a [GeodatabaseFeatureTable] in a stand-alone mobile
  /// geodatabase created with ArcGIS Pro is not supported when the table
  /// participates in a controller dataset, such as a utility network or parcel
  /// fabric. Use [FeatureTable.canAdd] to determine if this operation is
  /// allowed.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> addFeature(Feature feature) {
    return _addFeature(feature)
        .then((_) => feature._attributes.invalidateCache());
  }

  /// Cancelable version of [addFeature]. See that method for more information.
  CancelableOperation<void> addFeatureCancelable(Feature feature) {
    return _addFeatureCancelable(feature)
        .then((_) => feature._attributes.invalidateCache());
  }

  Future<void> _addFeature(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_addFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _addFeatureCancelable(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_addFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Adds a collection of features to the table.
  ///
  /// Parameters:
  /// - `features` — A [List] of [Feature]. Contents of the [List] are copied.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> addFeatures(List<Feature> features) {
    return _addFeatures(features).then((_) {
      for (final feature in features) {
        feature._attributes.invalidateCache();
      }
    });
  }

  /// Cancelable version of [addFeatures]. See that method for more information.
  CancelableOperation<void> addFeaturesCancelable(List<Feature> features) {
    return _addFeaturesCancelable(features).then((_) {
      for (final feature in features) {
        feature._attributes.invalidateCache();
      }
    });
  }

  Future<void> _addFeatures(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_addFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _addFeaturesCancelable(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_addFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Determines whether you can add new features to the table.
  ///
  /// Although this method may state that the table allows new features to be
  /// added, the application may not be licensed to permit this. For example, a
  /// user cannot add features to a secured feature table if the application is
  /// licensed at the Lite level ([LicenseLevel.lite]).
  ///
  /// Return Value: True if you can add features to the table, false otherwise.
  bool canAdd() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_canAdd(_handle, errorHandler);
    });
  }

  /// Determines whether you can delete the feature from the table.
  ///
  /// Although this method may state that the table allows the feature to be
  /// deleted, the application may not be licensed to permit this. For example,
  /// a user cannot delete features from a secured feature table if the
  /// application is licensed at the Lite level ([LicenseLevel.lite]).
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: True if the feature can be deleted, false if the feature
  /// can't be deleted or an error occurred.
  bool canDelete({required Feature feature}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_canDelete(
          _handle, feature._handle, errorHandler);
    });
  }

  /// Determines whether you can edit the geometry field in a table.
  ///
  /// Although this method may state that the table allows geometry fields to be
  /// edited, the application may not be licensed to permit this. For example, a
  /// user cannot update geometry in a secured feature table if the application
  /// is licensed at the Lite level ([LicenseLevel.lite]).
  ///
  /// Return Value: True if you can edit the geometry field, false if you can't
  /// edit the geometry field or an error occurred.
  bool canEditGeometry() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_canEditGeometry(_handle, errorHandler);
    });
  }

  /// Determines whether you can update the feature in the table.
  ///
  /// Although this method may state that the table allows the feature to be
  /// updated, the application may not be licensed to permit this. For example,
  /// a user cannot update features in a secured feature table if the
  /// application is licensed at the Lite level ([LicenseLevel.lite]).
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: True if the feature can be updated, false if the feature
  /// can't be updated or an error occurred.
  bool canUpdate({required Feature feature}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_canUpdate(
          _handle, feature._handle, errorHandler);
    });
  }

  /// Creates a new feature with the provided attribute values and, optionally,
  /// geometry.
  ///
  /// The new feature is only available in memory at this point. Execute
  /// [FeatureTable.addFeature] to commit the new [Feature] to the table.
  ///
  /// Parameters:
  /// - `attributes` — The attributes.
  /// - `geometry` — The geometry.
  ///
  /// Return Value: A [Feature].
  Feature createFeature(
      {Map<String, dynamic> attributes = const {}, Geometry? geometry}) {
    final coreAttributes = attributes.toDictionary(
        keyType: _ElementType.string, valueType: _ElementType.variant);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_createFeatureWithAttributes(
          _handle,
          coreAttributes._handle,
          geometry?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return Feature._fromHandle(objectHandle)!;
  }

  /// Deletes a feature from the table.
  ///
  /// Deleting a feature from a [GeodatabaseFeatureTable] in a stand-alone
  /// mobile geodatabase created with ArcGIS Pro is not supported when the table
  /// participates in a controller dataset, such as a utility network or parcel
  /// fabric. Use [FeatureTable.canDelete] to determine if this operation is
  /// allowed.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> deleteFeature(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_deleteFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [deleteFeature]. See that method for more
  /// information.
  CancelableOperation<void> deleteFeatureCancelable(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_deleteFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Deletes a collection of features from the table.
  ///
  /// Parameters:
  /// - `features` — A [List] of [Feature]. Contents of the [List] are copied.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> deleteFeatures(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_deleteFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [deleteFeatures]. See that method for more
  /// information.
  CancelableOperation<void> deleteFeaturesCancelable(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_deleteFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Retrieves the field with the given name.
  ///
  /// Parameters:
  /// - `fieldName` — Name of the field.
  ///
  /// Return Value: A [Field].
  Field? getField({required String fieldName}) {
    final coreFieldName = _CString(fieldName);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getField(
          _handle, coreFieldName.bytes, errorHandler);
    });
    return Field._fromHandle(objectHandle);
  }

  /// Determines the minimum bounding envelope that contains features satisfying
  /// the provided query parameters.
  ///
  /// If no features meet the query criteria, an empty envelope is returned.
  ///
  /// Parameters:
  /// - `queryParameters` — The parameters of the query.
  ///
  /// Return Value: A task that represents the asynchronous query of feature
  /// extent. The value of the task result contains an [Envelope] object.
  Future<Envelope> queryExtent({required QueryParameters queryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryExtent(
          _handle, queryParameters._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsEnvelope()!);
  }

  /// Cancelable version of [queryExtent]. See that method for more information.
  CancelableOperation<Envelope> queryExtentCancelable(
      {required QueryParameters queryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryExtent(
          _handle, queryParameters._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsEnvelope()!);
  }

  /// Determines the count of features that satisfy the provided query
  /// parameters.
  ///
  /// Parameters:
  /// - `queryParameters` — The parameters of the query.
  ///
  /// Return Value: A task that represents the asynchronous query of feature
  /// count. The value of the task result contains a uint64_t.
  Future<int> queryFeatureCount({required QueryParameters queryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryFeatureCount(
          _handle, queryParameters._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsInt()!);
  }

  /// Cancelable version of [queryFeatureCount]. See that method for more
  /// information.
  CancelableOperation<int> queryFeatureCountCancelable(
      {required QueryParameters queryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryFeatureCount(
          _handle, queryParameters._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsInt()!);
  }

  /// Submits a query against the table.
  ///
  /// Parameters:
  /// - `parameters` — Options for controlling the operation.
  ///
  /// Return Value: A [Future] that returns a [FeatureQueryResult] type.
  Future<FeatureQueryResult> queryFeatures(
      {required QueryParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryFeatures(
          _handle, parameters._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [queryFeatures]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> queryFeaturesCancelable(
      {required QueryParameters parameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryFeatures(
          _handle, parameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Calculates values for the requested statistics.
  ///
  /// Statistics query parameters may also define fields on which results are
  /// grouped or sorted.
  ///
  /// Parameters:
  /// - `statisticsQueryParameters` — The parameters that define the statistics,
  /// fields, and features to be used for the query.
  ///
  /// Return Value: A task that represents the asynchronous query statistics
  /// operation. The value of the task result contains a [StatisticsQueryResult]
  /// object.
  Future<StatisticsQueryResult> queryStatistics(
      {required StatisticsQueryParameters statisticsQueryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryStatistics(
          _handle, statisticsQueryParameters._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsStatisticsQueryResult()!);
  }

  /// Cancelable version of [queryStatistics]. See that method for more
  /// information.
  CancelableOperation<StatisticsQueryResult> queryStatisticsCancelable(
      {required StatisticsQueryParameters statisticsQueryParameters}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_queryStatistics(
          _handle, statisticsQueryParameters._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsStatisticsQueryResult()!);
  }

  /// Updates a feature in the table.
  ///
  /// If you update a feature that contains a [Geometry], the geometry becomes
  /// simplified. This may change a single part geometry to a multipart
  /// geometry, or round X, Y, Z, and M coordinate values that are above the
  /// resolution set by the [SpatialReference].
  ///
  /// Updating a feature from a [GeodatabaseFeatureTable] in a stand-alone
  /// mobile geodatabase created with ArcGIS Pro is not supported when the table
  /// participates in a controller dataset, such as a utility network or parcel
  /// fabric. Use [FeatureTable.canUpdate] to determine if this operation is
  /// allowed.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> updateFeature(Feature feature) {
    return _updateFeature(feature)
        .then((_) => feature._attributes.invalidateCache());
  }

  /// Cancelable version of [updateFeature]. See that method for more
  /// information.
  CancelableOperation<void> updateFeatureCancelable(Feature feature) {
    return _updateFeatureCancelable(feature)
        .then((_) => feature._attributes.invalidateCache());
  }

  Future<void> _updateFeature(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_updateFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _updateFeatureCancelable(Feature feature) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_updateFeature(
          _handle, feature._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Updates a collection of features in the table.
  ///
  /// Parameters:
  /// - `features` — A [List] of [Feature]. Contents of the [List] are copied.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> updateFeatures(List<Feature> features) {
    return _updateFeatures(features).then((_) {
      for (final feature in features) {
        feature._attributes.invalidateCache();
      }
    });
  }

  /// Cancelable version of [updateFeatures]. See that method for more
  /// information.
  CancelableOperation<void> updateFeaturesCancelable(List<Feature> features) {
    return _updateFeaturesCancelable(features).then((_) {
      for (final feature in features) {
        feature._attributes.invalidateCache();
      }
    });
  }

  Future<void> _updateFeatures(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_updateFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _updateFeaturesCancelable(List<Feature> features) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_updateFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureTable_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureTable_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FeatureTable_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _fields.invalidateCache();
    _layer.invalidateCache();
    _spatialReference.invalidateCache();
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
        logger.f('FeatureTable unhandled asyncType $asyncType');
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FeatureTable) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTable_hash(_handle, errorHandler);
    });
  }
}

final class _FeatureTableFactory
    implements _InstanceFactory<FeatureTable, RT_FeatureTableHandle> {
  @override
  FeatureTable createInstance({required RT_FeatureTableHandle handle}) {
    switch (FeatureTable._objectTypeOf(handle)) {
      case _FeatureTableType.featureCollectionTable:
        return FeatureCollectionTable._withHandle(handle);
      case _FeatureTableType.featureTable:
        return FeatureTable._withHandle(handle);
      case _FeatureTableType.geoPackageFeatureTable:
        return GeoPackageFeatureTable._withHandle(handle);
      case _FeatureTableType.geodatabaseFeatureTable:
        return GeodatabaseFeatureTable._withHandle(handle);
      case _FeatureTableType.serviceFeatureTable:
        return ServiceFeatureTable._withHandle(handle);
      case _FeatureTableType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as FeatureTable');
        return FeatureTable._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_FeatureTableHandle handle) {
    bindings.FeatureTable_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_FeatureTableHandle handle) {
    return runtimecore.RT_FeatureTable_getInstanceId(handle, ffi.nullptr);
  }
}

/// The edit results of a specific [FeatureTable].
final class FeatureTableEditResult implements ffi.Finalizable {
  final RT_FeatureTableEditResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.FeatureTableEditResult_destroy.cast());

  static FeatureTableEditResult? _fromHandle(
      RT_FeatureTableEditResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTableEditResult._withHandle(handle);
  }

  FeatureTableEditResult._withHandle(RT_FeatureTableEditResultHandle handle)
      : _editResults = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTableEditResult_getEditResults(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _featureTable = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTableEditResult_getFeatureTable(
                handle, errorHandler);
          });
          return FeatureTable._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureTableEditResult_created(_handle);
    }
  }

  /// The collection of edit results for the layer.
  List<FeatureEditResult> get editResults => _editResults.value;

  final Memoized<_ArrayList<FeatureEditResult>> _editResults;

  /// The feature table that was edited.
  FeatureTable get featureTable => _featureTable.value;

  final Memoized<FeatureTable> _featureTable;
}

/// The different types of available feature tables.
enum _FeatureTableType {
  /// An unknown feature table type.
  unknown,

  /// A Feature Table.
  featureTable,

  /// An ArcGIS Service Feature Table.
  serviceFeatureTable,

  /// An ArcGIS Geodatabase Feature Table.
  geodatabaseFeatureTable,

  /// A Feature Collection Table.
  featureCollectionTable,

  /// A Shapefile Table.
  shapefileFeatureTable,

  /// A GeoPackage Feature Table.
  geoPackageFeatureTable,

  /// A WFS Feature Table.
  wfsFeatureTable,

  /// An OGC Feature Collection Table.
  ogcFeatureCollectionTable;

  factory _FeatureTableType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return featureTable;
      case 1:
        return serviceFeatureTable;
      case 2:
        return geodatabaseFeatureTable;
      case 3:
        return featureCollectionTable;
      case 4:
        return shapefileFeatureTable;
      case 5:
        return geoPackageFeatureTable;
      case 6:
        return wfsFeatureTable;
      case 7:
        return ogcFeatureCollectionTable;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case featureTable:
        return 0;
      case serviceFeatureTable:
        return 1;
      case geodatabaseFeatureTable:
        return 2;
      case featureCollectionTable:
        return 3;
      case shapefileFeatureTable:
        return 4;
      case geoPackageFeatureTable:
        return 5;
      case wfsFeatureTable:
        return 6;
      case ogcFeatureCollectionTable:
        return 7;
    }
  }
}

/// A feature template defines the default attribute values for the fields of a
/// newly created [ArcGISFeature] and suggests a type of drawing tool to sketch
/// the feature's geometry.
///
/// The owner of the ArcGIS feature service can define one or more feature
/// templates when they publish the service. These are held within the
/// "Templates" tag of the ArcGIS feature service's REST Services Directory.
/// Each template has a name, description, suggested drawing tool, and a list of
/// attributes with their initial values (called prototype). You can obtain the
/// feature service's collection of feature templates from the
/// [ArcGISFeatureTable.featureTemplates]. Alternatively, if you are using a
/// [FeatureType], you can obtain its templates from [FeatureType.templates].
/// Use [ArcGISFeatureTable.createFeatureWithTemplate] to create a feature with
/// the feature template.
///
/// If you are building an editing application, you can present users with a
/// list of feature templates. Upon choosing a template, the app can create a
/// feature with the attributes populated with their default values and present
/// geometry sketching tools to match the [FeatureTemplate.drawingTool].
final class FeatureTemplate implements ffi.Finalizable {
  final RT_FeatureTemplateHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureTemplate_destroy.cast());

  static FeatureTemplate? _fromHandle(RT_FeatureTemplateHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTemplate._withHandle(handle);
  }

  FeatureTemplate._withHandle(RT_FeatureTemplateHandle handle)
      : _prototypeAttributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureTemplate_getPrototypeAttributes(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureTemplate_created(_handle);
    }
  }

  /// The description of the feature template.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTemplate_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The type of drawing tool that could be used to draw this feature in an
  /// editing application.
  DrawingTool get drawingTool {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTemplate_getDrawingTool(
          _handle, errorHandler);
    });
    return DrawingTool._fromCoreValue(coreValue);
  }

  /// The name of the feature template.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureTemplate_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The default attribute values used when creating a feature.
  Map<String, dynamic> get prototypeAttributes => _prototypeAttributes.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>>
      _prototypeAttributes;
}

/// A feature type defines the domains and feature templates that are used to
/// create a new feature.
///
/// A feature type is used to ensure that appropriate attribute values are
/// captured when a new feature is created. A [FeatureType] can specify the
/// domains for the attribute values and can provide a template that populates
/// the feature with initial values. For example, a roads layer may contain
/// different types of roads, such as main roads, city streets, and unpaved
/// tracks. The owner could set up a feature type named 'main road' to ensure
/// that new features are only populated with attribute values appropriate for a
/// 'main road', and so on.
///
/// The owner of the ArcGIS Feature Service defines the feature types when they
/// publish the service. They are held within the "Types" tag of the ArcGIS
/// feature service's REST Services Directory. Each type has an ID, a name, a
/// set of domains and a set of templates. You can obtain the collection of
/// feature types by using [ArcGISFeatureTable.featureTypes]. Use
/// [ArcGISFeatureTable.createFeatureWithType] to create a feature with the
/// feature type.
///
/// If you are building an editing application, you can present users with a
/// list of feature types. Upon choosing a feature type, the app can populate
/// the feature's attribute values with the
/// [FeatureTemplate.prototypeAttributes] and ensure that any attributes in the
/// user interface correspond to the [FeatureType.domains].
final class FeatureType implements ffi.Finalizable {
  final RT_FeatureTypeHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FeatureType_destroy.cast());

  static FeatureType? _fromHandle(RT_FeatureTypeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureType._withHandle(handle);
  }

  FeatureType._withHandle(RT_FeatureTypeHandle handle)
      : _domains = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureType_getDomains(handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _id = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureType_getId(handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue()!;
        }),
        _templates = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FeatureType_getTemplates(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FeatureType_created(_handle);
    }
  }

  /// The domains associated with this feature type.
  Map<String, Domain> get domains => _domains.value;

  final Memoized<_UnmodifiableDictionaryMap<String, Domain>> _domains;

  /// The id of the feature type.
  dynamic get id => _id.value;

  final Memoized<dynamic> _id;

  /// The name of the feature type.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FeatureType_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The feature templates associated with this feature type.
  List<FeatureTemplate> get templates => _templates.value;

  final Memoized<_ArrayList<FeatureTemplate>> _templates;
}

/// An object that defines a field.
final class Field implements ffi.Finalizable {
  final RT_FieldHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Field_destroy.cast());

  static Field? _fromHandle(RT_FieldHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Field._withHandle(handle);
  }

  Field._withHandle(RT_FieldHandle handle)
      : _domain = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Field_getDomain(handle, errorHandler);
          });
          return Domain._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Field_created(_handle);
    }
  }

  /// Creates a new field object with the following parameters.
  ///
  /// Parameters:
  /// - `type` — Defines the type of field.
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  /// - `length` — Length of the field.
  /// - `domain` — Domain for the field. Can be null.
  /// - `isEditable` — True if the field is editable.
  /// - `isNullable` — True if the field is nullable.
  factory Field(
      {required FieldType type,
      required String name,
      required String alias,
      required int length,
      required Domain? domain,
      required bool isEditable,
      required bool isNullable}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createWith(
          type.coreValue,
          coreName.bytes,
          coreAlias.bytes,
          length,
          domain?._handle ?? ffi.nullptr,
          isEditable,
          isNullable,
          errorHandler);
    });
    final Field object = Field._withHandle(handle);
    object._domain.cache(domain);
    return object;
  }

  /// Creates a new [FieldType.int64] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.bigInt({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createBigInt(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.date] field object with the following parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.date({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createDate(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.dateOnly] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.dateOnly({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createDateOnly(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.float64] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.double({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createDouble(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.float32] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.float({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createFloat(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.int32] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.longInt({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createLongInt(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.int16] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.shortInt({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createShortInt(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.text] field object with the following parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  /// - `length` — Length of the field.
  factory Field.text(
      {required String name, required String alias, required int length}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createText(
          coreName.bytes, coreAlias.bytes, length, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.timeOnly] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.timeOnly({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createTimeOnly(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// Creates a new [FieldType.timestampOffset] field object with the following
  /// parameters.
  ///
  /// Use this method to create a field. The field will be editable and
  /// nullable.
  ///
  /// Parameters:
  /// - `name` — Name of the field.
  /// - `alias` — Alias of the field.
  factory Field.timestampOffset({required String name, required String alias}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreAlias = _CString(alias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_createTimestampOffset(
          coreName.bytes, coreAlias.bytes, errorHandler);
    });
    return Field._withHandle(handle);
  }

  /// The field's alias.
  String get alias {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getAlias(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The field's domain.
  Domain? get domain => _domain.value;

  final Memoized<Domain?> _domain;

  /// The field as not being editable.
  bool get isEditable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getEditable(_handle, errorHandler);
    });
  }

  /// True if the field is nullable.
  bool get isNullable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getNullable(_handle, errorHandler);
    });
  }

  /// The length of the field.
  int get length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getLength(_handle, errorHandler);
    });
  }

  /// The field's name.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The field's data type.
  FieldType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_getFieldType(_handle, errorHandler);
    });
    return FieldType._fromCoreValue(coreValue);
  }

  /// Populates the data members of this object from a JSON string.
  ///
  /// Parameters:
  /// - `json` — The JSON string.
  ///
  /// Return Value: A [Field].
  static Field? fromJson(String json) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreJSON = _CString(json);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_fromJSON(coreJSON.bytes, errorHandler);
    });
    return Field._fromHandle(objectHandle);
  }

  /// Serializes this object to a JSON string.
  ///
  /// Return Value: A [String].
  String toJson() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Field_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// An object that describes a [Field] to be created.
///
/// Creation of fields and tables is currently only supported on mobile
/// geodatabases, either created in ArcGIS Pro or via [Geodatabase.create].
final class FieldDescription implements ffi.Finalizable {
  final RT_FieldDescriptionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.FieldDescription_destroy.cast());

  static FieldDescription? _fromHandle(RT_FieldDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FieldDescription._withHandle(handle);
  }

  FieldDescription._withHandle(RT_FieldDescriptionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.FieldDescription_created(_handle);
    }
  }

  /// Creates a new field description object with the specified name and type.
  ///
  /// Parameters:
  /// - `name` — The field's name.
  /// - `fieldType` — The field's data type.
  factory FieldDescription(
      {required String name, required FieldType fieldType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_createWithNameAndType(
          coreName.bytes, fieldType.coreValue, errorHandler);
    });
    return FieldDescription._withHandle(handle);
  }

  /// The field's alias.
  ///
  /// The default value is an empty string.
  String get alias {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getAlias(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set alias(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setAlias(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The name of the domain to use on this field.
  ///
  /// The domain must already exist in the geodatabase (see
  /// [Geodatabase.createDomain]). The default value of an empty string
  /// indicates that no domain should be used.
  String get domainName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getDomainName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set domainName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setDomainName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// True if the field is editable.
  ///
  /// The default value is true.
  bool get editable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getEditable(_handle, errorHandler);
    });
  }

  set editable(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setEditable(_handle, value, errorHandler);
    });
  }

  /// The field's data type.
  ///
  /// The default is [FieldType.unknown], and must be set to a valid type.
  FieldType get fieldType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getFieldType(
          _handle, errorHandler);
    });
    return FieldType._fromCoreValue(coreValue);
  }

  set fieldType(FieldType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setFieldType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The length of the field.
  ///
  /// The default value is 0. This only applies to text fields.
  int get length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getLength(_handle, errorHandler);
    });
  }

  set length(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setLength(_handle, value, errorHandler);
    });
  }

  /// The field's name.
  ///
  /// Field names must be non-empty, consist only of alphanumeric characters and
  /// underscores, and cannot start with a number or an underscore.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set name(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// True if the field is nullable.
  ///
  /// The default value is true.
  bool get nullable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_FieldDescription_getNullable(_handle, errorHandler);
    });
  }

  set nullable(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_FieldDescription_setNullable(_handle, value, errorHandler);
    });
  }
}

/// The different types of a row value variant.
enum FieldType {
  /// An unknown type.
  unknown,

  /// A 16-bit integer value.
  int16,

  /// A 32-bit integer value.
  int32,

  /// A 64-bit integer value.
  int64,

  /// A GUID value.
  guid,

  /// A float value.
  float32,

  /// A double value.
  float64,

  /// A date time value.
  date,

  /// A string value.
  text,

  /// An object id value.
  oid,

  /// A global id value.
  globalId,

  /// A blob value.
  blob,

  /// A geometry value.
  geometry,

  /// A raster value.
  raster,

  /// An XML value.
  xml,

  /// A date only value.
  dateOnly,

  /// A time only value.
  timeOnly,

  /// A timestamp offset value.
  timestampOffset;

  factory FieldType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return int16;
      case 1:
        return int32;
      case 2:
        return int64;
      case 3:
        return guid;
      case 4:
        return float32;
      case 5:
        return float64;
      case 6:
        return date;
      case 7:
        return text;
      case 8:
        return oid;
      case 9:
        return globalId;
      case 10:
        return blob;
      case 11:
        return geometry;
      case 12:
        return raster;
      case 13:
        return xml;
      case 14:
        return dateOnly;
      case 15:
        return timeOnly;
      case 16:
        return timestampOffset;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case int16:
        return 0;
      case int32:
        return 1;
      case int64:
        return 2;
      case guid:
        return 3;
      case float32:
        return 4;
      case float64:
        return 5;
      case date:
        return 6;
      case text:
        return 7;
      case oid:
        return 8;
      case globalId:
        return 9;
      case blob:
        return 10;
      case geometry:
        return 11;
      case raster:
        return 12;
      case xml:
        return 13;
      case dateOnly:
        return 14;
      case timeOnly:
        return 15;
      case timestampOffset:
        return 16;
    }
  }
}

/// A GeoPackage file (.gpkg) that can contain multiple datasets of geographic
/// features, non-spatial tabular data, and raster dataset that conform to the
/// OGC GeoPackage format.
///
/// A GeoPackage is an open, standards-based, platform-independent, portable,
/// self-describing, compact format for transferring geospatial information. It
/// is a platform-independent SQLite database file that contains the GeoPackage
/// data and metadata tables. See
/// [GeoPackage Encoding Standard](https://www.ogc.org/standard/geopackage/) for
/// more information.
final class GeoPackage
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_GeoPackageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeoPackage_destroyInstance.cast());

  static GeoPackage? _fromHandle(RT_GeoPackageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeoPackage._instanceCache.instanceWith(handle);
  }

  GeoPackage._withHandle(RT_GeoPackageHandle handle)
      : _geoPackageFeatureTables = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoPackage_getGeoPackageFeatureTables(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoPackage_getPath(handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeoPackage_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoPackage_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoPackage_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoPackage_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoPackage_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  static final _instanceCache =
      _InstanceCache(factory: _GeoPackageFactory(), kind: 'GeoPackage');

  /// Creates a GeoPackage from the GeoPackage file (.gpkg) at the given path.
  ///
  /// Parameters:
  /// - `fileUri` — Path to a GeoPackage file (.gpkg).
  factory GeoPackage.withFileUri(Uri fileUri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoPackage_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    final GeoPackage object = GeoPackage._instanceCache.instanceWith(handle);
    object._fileUri.cache(fileUri);
    return object;
  }

  /// The path to the GeoPackage file (.gpkg).
  Uri get fileUri => _fileUri.value;

  final Memoized<Uri> _fileUri;

  /// The immutable collection of geopackage feature tables contained in the
  /// GeoPackage.
  List<GeoPackageFeatureTable> get geoPackageFeatureTables =>
      _geoPackageFeatureTables.value;

  final Memoized<_ArrayList<GeoPackageFeatureTable>> _geoPackageFeatureTables;

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoPackage_getInstanceId(_handle, errorHandler);
    });
  }

  /// Closes a GeoPackage.
  ///
  /// Before you close a GeoPackage you should remove all references to the data
  /// it contains, such as removing the feature layer from a map and releasing
  /// the [GeoPackageFeatureTable]. Attempts to access a GeoPackage after it is
  /// closed will fail, resulting in an error.
  ///
  /// After closing a GeoPackage, the underlying files it references can be
  /// deleted or moved.
  void close() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoPackage_close(_handle, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoPackage_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoPackage_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoPackage_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoPackage_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _geoPackageFeatureTables.invalidateCache();
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
        logger.f('GeoPackage unhandled asyncType $asyncType');
    }
  }
}

final class _GeoPackageFactory
    implements _InstanceFactory<GeoPackage, RT_GeoPackageHandle> {
  @override
  GeoPackage createInstance({required RT_GeoPackageHandle handle}) {
    return GeoPackage._withHandle(handle);
  }

  @override
  void destroyHandle(RT_GeoPackageHandle handle) {
    bindings.GeoPackage_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_GeoPackageHandle handle) {
    return runtimecore.RT_GeoPackage_getInstanceId(handle, ffi.nullptr);
  }
}

/// A dataset in a [GeoPackage] containing features or non-spatial records.
///
/// A GeoPackageFeatureTable supports core [GeoPackage] geometry types and
/// represents them as [ArcGISPoint], [Multipoint], [Polyline], or [Polygon].
/// The GeoPackage specification supports a geometry collection type (storing a
/// variety of core geometry types in a single table). For these tables, the
/// first geometry type found in the collection is rendered.
///
/// You can query the dataset using attribute or spatial criteria, and if
/// permitted, also edit the data. If the dataset contains geographic features
/// you can display them on a map using a [FeatureLayer].
final class GeoPackageFeatureTable extends FeatureTable {
  static GeoPackageFeatureTable? _fromHandle(
      RT_GeoPackageFeatureTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  GeoPackageFeatureTable._withHandle(super.handle)
      : _geoPackage = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoPackageFeatureTable_getGeoPackage(
                handle, errorHandler);
          });
          return GeoPackage._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// A description of the GeoPackage feature table.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoPackageFeatureTable_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The [GeoPackage] from which the feature table was loaded.
  GeoPackage? get geoPackage => _geoPackage.value;

  final Memoized<GeoPackage?> _geoPackage;
}

/// A mobile geodatabase containing geographic data and non-spatial tables.
///
/// [Geodatabase] is used to open and access the contents of a mobile
/// geodatabase (.geodatabase file) that can contain geographic features,
/// non-spatial tabular data, and data such as attachments, utility networks,
/// field domain definitions, contingent values, and relationships between
/// layers/tables.
///
/// Geodatabases can contain one or more geodatabase feature tables. You can
/// create a layer from a [GeodatabaseFeatureTable] tables, as follows:
/// * A [FeatureLayer] from any table returned by
/// [Geodatabase.geodatabaseFeatureTables] that contains point, polyline, or
/// polygon features. Check that [FeatureTable.hasGeometry] is true.
/// * An `AnnotationLayer` from any table returned by
/// `Geodatabase.geodatabaseAnnotationTables`.
/// * A `DimensionLayer` from any table returned by
/// `Geodatabase.geodatabaseDimensionTables`.
///
/// You can generate a mobile geodatabase file from an ArcGIS feature service
/// and downloaded it to a device using offline workflows offered by the
/// [GeodatabaseSyncTask] and the [OfflineMapTask]. Apps can then operate
/// offline to view and edit the features in these geodatabases. If the
/// geodatabases are enabled for synchronization with the original feature
/// service, edits can be synchronized when connectivity is restored.
///
/// Mobile geodatabase files can also be created with ArcGIS Pro. These
/// geodatabases can be used offline but they do not support synchronization
/// with the original feature service. See
/// [Build offline applications](https://developers.arcgis.com/documentation/mapping-apis-and-services/offline/)
/// for more information.
final class Geodatabase
    with Loadable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_GeodatabaseHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.Geodatabase_destroyInstance.cast());

  static Geodatabase? _fromHandle(RT_GeodatabaseHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Geodatabase._instanceCache.instanceWith(handle);
  }

  Geodatabase._withHandle(RT_GeodatabaseHandle handle)
      : _domains = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geodatabase_getDomains(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _geodatabaseFeatureTables = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geodatabase_getGeodatabaseFeatureTables(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _fileUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geodatabase_getPath(handle, errorHandler);
          });
          return stringHandle.toFileUri()!;
        }),
        _serviceUri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geodatabase_getServiceURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        _syncId = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geodatabase_getSyncId(handle, errorHandler);
          });
          return Guid._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Geodatabase_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _transactionStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setTransactionStatusChangedCallback(
              _handle,
              bindings.addresses.asyncGeodatabaseTransactionStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setTransactionStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Geodatabase_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<bool> _transactionStatusChangedStreamController;

  /// Sets the callback to invoke when a transaction starts or completes on the
  /// geodatabase.
  Stream<bool> get onTransactionStatusChanged =>
      _transactionStatusChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _GeodatabaseFactory(), kind: 'Geodatabase');

  /// Creates a geodatabase object with the given path.
  ///
  /// If the specified path points to a stand-alone mobile geodatabase created
  /// with ArcGIS Pro and contains a controller dataset, such as a utility
  /// network or parcel fabric, the feature tables on this geodatabase are
  /// read-only. The presence of utility networks can be checked using
  /// `Geodatabase.utilityNetworks`.
  ///
  /// Parameters:
  /// - `fileUri` — Path to geodatabase (including .geodatabase file extension).
  factory Geodatabase.withFileUri(Uri fileUri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createWithPath(
          coreFileUri.bytes, errorHandler);
    });
    final Geodatabase object = Geodatabase._instanceCache.instanceWith(handle);
    object._fileUri.cache(fileUri);
    return object;
  }

  /// A collection of the domains that exist in the geodatabase.
  ///
  /// The collection will be empty if the geodatabase is not loaded.
  List<Domain> get domains => _domains.value;

  final Memoized<_ArrayList<Domain>> _domains;

  /// The path to the geodatabase.
  Uri get fileUri => _fileUri.value;

  final Memoized<Uri> _fileUri;

  /// The geometry that was used to generate the sync-enabled geodatabase.
  ///
  /// If the geodatabase was created using the [GenerateGeodatabaseJob], the
  /// geometry matches the [GenerateGeodatabaseParameters.extent]. If the
  /// geodatabase was created using the [GenerateOfflineMapJob], the geometry
  /// reflects the [GenerateOfflineMapParameters.areaOfInterest]. If the
  /// geodatabase was downloaded as part of a [PreplannedMapArea], this property
  /// will match the geometry used by the web map author when the offline map
  /// area was created. See
  /// [Build offline applications](https://developers.arcgis.com/documentation/mapping-apis-and-services/offline/)
  /// for more information on taking data offline.
  ///
  /// Edits made to a sync-enabled [Geodatabase] must intersect this geometry.
  /// If an edit is made outside this extent, or area of interest, it will be
  /// rejected.
  ///
  /// This property is null if the geodatabase was authored using ArcGIS Pro or
  /// if the [Geodatabase]. loadStatus is not [LoadStatus.loaded].
  Geometry? get generateGeodatabaseGeometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getGenerateGeodatabaseGeometry(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  /// A collection of [GeodatabaseFeatureTable] from the geodatabase that
  /// contain geometries, such as points, lines or polygons.
  ///
  /// Feature tables in this array are read-only when the geodatabase is a
  /// stand-alone mobile geodatabase created with ArcGIS Pro and tables
  /// participate in a controller dataset, such as a utility network or parcel
  /// fabric. The presence of utility networks can be checked using
  /// `Geodatabase.utilityNetworks`.
  ///
  /// The collection will be empty if the geodatabase is not loaded.
  List<GeodatabaseFeatureTable> get geodatabaseFeatureTables =>
      _geodatabaseFeatureTables.value;

  final Memoized<_ArrayList<GeodatabaseFeatureTable>> _geodatabaseFeatureTables;

  /// True if a transaction is active on the geodatabase, false otherwise.
  ///
  /// A transaction manages a series of geodatabase edits as a single unit of
  /// work. You can start a transaction by calling
  /// [Geodatabase.beginTransaction]. All edits made after this call are part of
  /// the transaction.
  ///
  /// A geodatabase transaction stays active until you end it by calling
  /// [Geodatabase.commitTransaction] or [Geodatabase.rollbackTransaction].
  /// [Geodatabase.commitTransaction] saves all edits in the transaction to the
  /// geodatabase and ends the transaction. [Geodatabase.rollbackTransaction]
  /// discards all edits in the transaction and ends the transaction.
  ///
  /// If the app unexpectedly disconnects from the database, any active
  /// transaction will be rolled back. If the app crashes, or the user closes
  /// the app without saving edits, the transaction will be rolled back and the
  /// edits discarded.
  bool get inTransaction {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getInTransaction(_handle, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getInstanceId(_handle, errorHandler);
    });
  }

  /// True if the geodatabase was originally downloaded from a sync-enabled
  /// ArcGIS feature service, false otherwise.
  ///
  /// A sync-enabled geodatabase can be requested from an ArcGIS feature service
  /// using the [GenerateGeodatabaseJob] or the [GenerateOfflineMapJob]. It can
  /// also be downloaded as part of a [PreplannedMapArea]. See
  /// [GeodatabaseSyncTask] and [OfflineMapTask] for more information.
  ///
  /// If true, the geodatabase's data can be synchronized with its original
  /// ArcGIS feature service.
  bool get isSyncEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getIsSyncEnabled(_handle, errorHandler);
    });
  }

  /// The minimum server generation number for the geodatabase.
  ///
  /// Server generation numbers indicate the state of a geodatabase (or
  /// individual layers) with respect to changes which have been synced with the
  /// online service. The number increases as new changes from the online
  /// feature service are synced to the local geodatabase.
  ///
  /// If the [Geodatabase.syncModel] is [SyncModel.geodatabase], the value will
  /// indicate the server generation number for the entire geodatabase. If the
  /// [Geodatabase.syncModel] is [SyncModel.layer], the value will be the lowest
  /// server generation number for all of the layers in the geodatabase. This
  /// property will be -1 if the geodatabase does not support sync
  /// ([SyncModel.none]).
  ///
  /// This property will be -1 until the geodatabase is [LoadStatus.loaded].
  ///
  /// Note that this property is only required when using advanced workflows to
  /// manually apply pre-generated changes and not when performing a sync
  /// directly against the online service.
  int get minServerGeneration {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getMinServerGeneration(
          _handle, errorHandler);
    });
  }

  /// The service URL from which the geodatabase was obtained.
  Uri? get serviceUri => _serviceUri.value;

  final Memoized<Uri?> _serviceUri;

  /// The sync ID of the geodatabase.
  ///
  /// Sync ID is available if [Geodatabase.isSyncEnabled] is true. The sync ID
  /// is the same as the replica ID described in the REST documentation. It is
  /// used by the geodatabase's service to uniquely identify the geodatabase
  /// when carrying out sync operations. It is also used to unregister the
  /// geodatabase using the
  /// GeodatabaseSyncTask.unregisterGeodatabaseAsync(GUID).
  Guid? get syncId => _syncId.value;

  final Memoized<Guid?> _syncId;

  /// The sync model defining how datasets within the geodatabase are
  /// synchronized with the originating ArcGIS feature service.
  ///
  /// Sync model only applies to the geodatabase if [Geodatabase.isSyncEnabled]
  /// is true.
  SyncModel get syncModel {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getSyncModel(_handle, errorHandler);
    });
    return SyncModel._fromCoreValue(coreValue);
  }

  /// Starts a transaction on the geodatabase.
  ///
  /// This method starts a new transaction on the geodatabase. The transaction
  /// fails to begin if another transaction is already active. A geodatabase
  /// cannot be synchronized while a transaction is active.
  ///
  /// Transactions can be started and stopped on any thread. Any edits that take
  /// place after a call to [Geodatabase.beginTransaction] but before a call to
  /// either [Geodatabase.commitTransaction] or
  /// [Geodatabase.rollbackTransaction] will be considered part of that
  /// transaction, no matter what thread made the edit.
  void beginTransaction() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_beginTransaction(_handle, errorHandler);
    });
  }

  /// Closes the connection to the geodatabase.
  ///
  /// You should stop using the geodatabase before you close it. For example,
  /// you should terminate geodatabase synchronization, remove feature layers
  /// from maps, and release the feature tables. Any attempt to access the
  /// geodatabase after it is closed will fail, resulting in an error. After
  /// closing a geodatabase, you can delete the geodatabase file from the
  /// device.
  void close() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_close(_handle, errorHandler);
    });
  }

  /// Commits the edits in the transaction to the geodatabase.
  ///
  /// Commits the edits in the current transaction to the geodatabase. This will
  /// also end the transaction. An error will be thrown if a transaction has not
  /// been started on the geodatabase.
  ///
  /// Transactions can be started and stopped on any thread. Any edits that take
  /// place after a call to [Geodatabase.beginTransaction] but before a call to
  /// either [Geodatabase.commitTransaction] or
  /// [Geodatabase.rollbackTransaction] will be considered part of that
  /// transaction, no matter what thread made the edit.
  void commitTransaction() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_commitTransaction(_handle, errorHandler);
    });
  }

  /// Creates an empty mobile geodatabase at the specified path.
  ///
  /// The path must be non-empty, available, allow read/write access, and end in
  /// ".geodatabase". If any of these restrictions are violated, the task will
  /// not succeed and a task error will be set.
  ///
  /// Parameters:
  /// - `fileUri` — The path at which the mobile geodatabase is created.
  ///
  /// Return Value: A [Future] that returns a [Geodatabase] in a loaded state,
  /// if one was able to be created at the specified path.
  static Future<Geodatabase> create({required Uri fileUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createAsync(
          coreFileUri.bytes, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsGeodatabase()!);
  }

  /// Cancelable version of [create]. See that method for more information.
  static CancelableOperation<Geodatabase> createCancelable(
      {required Uri fileUri}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFileUri = _CString(fileUri.toFilePath());
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createAsync(
          coreFileUri.bytes, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsGeodatabase()!);
  }

  /// Creates a new domain in the geodatabase.
  ///
  /// Creating domains is only supported in mobile geodatabases (either created
  /// in Pro or via [Geodatabase.create]). The [FieldType] of the domain cannot
  /// be unknown. The domain name must not already exist in the geodatabase. For
  /// additional domain name constraints, see [DomainDescription.name].
  ///
  /// Parameters:
  /// - `domainDescription` — The description of the domain to create.
  ///
  /// Return Value: A [Future] that returns a [Domain] if one was able to be
  /// created.
  Future<Domain> createDomain({required DomainDescription domainDescription}) {
    return _createDomain(domainDescription: domainDescription).then((domain) {
      _domains.invalidateCache();
      return domain;
    });
  }

  /// Cancelable version of [createDomain]. See that method for more
  /// information.
  CancelableOperation<Domain> createDomainCancelable(
      {required DomainDescription domainDescription}) {
    return _createDomainCancelable(domainDescription: domainDescription)
        .then((domain) {
      _domains.invalidateCache();
      return domain;
    });
  }

  Future<Domain> _createDomain({required DomainDescription domainDescription}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createDomainAsync(
          _handle, domainDescription._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsDomain()!);
  }

  CancelableOperation<Domain> _createDomainCancelable(
      {required DomainDescription domainDescription}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createDomainAsync(
          _handle, domainDescription._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsDomain()!);
  }

  /// Creates a new table in the geodatabase.
  ///
  /// Creating tables is only supported in mobile geodatabases (either created
  /// in Pro or via [Geodatabase.create]). The table name must not already exist
  /// in the geodatabase. For additional table name constraints, see
  /// [TableDescription.tableName].
  ///
  /// Parameters:
  /// - `tableDescription` — The description of the table to create.
  ///
  /// Return Value: A [Future] that returns a [GeodatabaseFeatureTable] in a
  /// loaded state, if one was able to be created.
  Future<GeodatabaseFeatureTable> createTable(
      {required TableDescription tableDescription}) {
    return _createTable(tableDescription: tableDescription).then((table) {
      _geodatabaseFeatureTables.invalidateCache();
      return table;
    });
  }

  /// Cancelable version of [createTable]. See that method for more information.
  CancelableOperation<GeodatabaseFeatureTable> createTableCancelable(
      {required TableDescription tableDescription}) {
    return _createTableCancelable(tableDescription: tableDescription)
        .then((table) {
      _geodatabaseFeatureTables.invalidateCache();
      return table;
    });
  }

  Future<GeodatabaseFeatureTable> _createTable(
      {required TableDescription tableDescription}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createTableAsync(
          _handle, tableDescription._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsGeodatabaseFeatureTable()!);
  }

  CancelableOperation<GeodatabaseFeatureTable> _createTableCancelable(
      {required TableDescription tableDescription}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_createTableAsync(
          _handle, tableDescription._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsGeodatabaseFeatureTable()!);
  }

  /// Deletes the domain with the specified name from the geodatabase.
  ///
  /// Deleting domains is only supported in mobile geodatabases (either created
  /// in Pro or via [Geodatabase.create]). The domain with the specified name
  /// must exist in the geodatabase. The domain must not be in use by any fields
  /// in existing tables.
  ///
  /// Parameters:
  /// - `domainName` — The name of the domain to delete.
  ///
  /// Return Value: A [Future] with no return value. If there is no error, the
  /// domain was deleted successfully.
  Future<void> deleteDomain({required String domainName}) {
    return _deleteDomain(domainName: domainName)
        .then((_) => _domains.invalidateCache());
  }

  /// Cancelable version of [deleteDomain]. See that method for more
  /// information.
  CancelableOperation<void> deleteDomainCancelable(
      {required String domainName}) {
    return _deleteDomainCancelable(domainName: domainName)
        .then((_) => _domains.invalidateCache());
  }

  Future<void> _deleteDomain({required String domainName}) {
    final coreDomainName = _CString(domainName);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_deleteDomainAsync(
          _handle, coreDomainName.bytes, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _deleteDomainCancelable(
      {required String domainName}) {
    final coreDomainName = _CString(domainName);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_deleteDomainAsync(
          _handle, coreDomainName.bytes, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Deletes an existing table from the geodatabase.
  ///
  /// Deleting tables is only supported in mobile geodatabases created in ArcGIS
  /// Pro or using [Geodatabase.create]. Attempting further use of a deleted
  /// table, such as rendering it in a feature layer or querying it, may result
  /// in errors.
  ///
  /// Parameters:
  /// - `tableName` — The name of the table to delete.
  ///
  /// Return Value: A [Future] with no return value. If there is no error, the
  /// table was deleted successfully.
  Future<void> deleteTable({required String tableName}) {
    return _deleteTable(tableName: tableName)
        .then((_) => _geodatabaseFeatureTables.invalidateCache());
  }

  /// Cancelable version of [deleteTable]. See that method for more information.
  CancelableOperation<void> deleteTableCancelable({required String tableName}) {
    return _deleteTableCancelable(tableName: tableName)
        .then((_) => _geodatabaseFeatureTables.invalidateCache());
  }

  Future<void> _deleteTable({required String tableName}) {
    final coreTableName = _CString(tableName);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_deleteTableAsync(
          _handle, coreTableName.bytes, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  CancelableOperation<void> _deleteTableCancelable(
      {required String tableName}) {
    final coreTableName = _CString(tableName);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_deleteTableAsync(
          _handle, coreTableName.bytes, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Gets a feature table from the geodatabase containing point, line, or
  /// polygon features, as specified by the given tableName.
  ///
  /// Parameters:
  /// - `tableName` — The name of the geodatabase feature table containing
  /// point, line, or polygon features.
  ///
  /// Return Value: If the specified table contains annotation or dimension
  /// feature data, then no table is returned.
  GeodatabaseFeatureTable? getGeodatabaseFeatureTable(
      {required String tableName}) {
    final coreTableName = _CString(tableName);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getGeodatabaseFeatureTable(
          _handle, coreTableName.bytes, errorHandler);
    });
    return GeodatabaseFeatureTable._fromHandle(objectHandle);
  }

  /// Gets a feature table from the geodatabase containing point, line or
  /// polygon features, as specified by the given feature service layer ID.
  ///
  /// The feature table returned is read-only when the geodatabase is a
  /// stand-alone mobile geodatabase created with ArcGIS Pro and the table
  /// participates in a controller dataset, such as a utility network or parcel
  /// fabric. The presence of utility networks can be checked using
  /// `Geodatabase.utilityNetworks`.
  ///
  /// Parameters:
  /// - `serviceLayerId` — The service layer ID of the geodatabase feature table
  /// containing point, line or polygon features.
  ///
  /// Return Value: If the given layer ID matches a table in the geodatabase
  /// containing annotation or dimension feature data, then no table is
  /// returned.
  GeodatabaseFeatureTable? getGeodatabaseFeatureTableByServiceLayerId(
      {required int serviceLayerId}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_Geodatabase_getGeodatabaseFeatureTableByServiceLayerId(
              _handle, serviceLayerId, errorHandler);
    });
    return GeodatabaseFeatureTable._fromHandle(objectHandle);
  }

  /// True if the geodatabase has local edits, false otherwise.
  ///
  /// If the geodatabase was created by ArcGIS Pro, this method returns false
  /// because there is no concept of uploading or applying edits. If you want to
  /// determine which tables have local edits, examine
  /// [GeodatabaseFeatureTable.hasLocalEditsSince].
  ///
  /// Return Value: true if it has local edits, false otherwise.
  bool hasLocalEdits() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_hasLocalEdits(_handle, errorHandler);
    });
  }

  /// Rollback the edits in the transaction from the geodatabase.
  ///
  /// Discards the edits in the current transaction from the geodatabase. This
  /// will also end the transaction. An error will be thrown if a transaction
  /// has not been started on the geodatabase.
  ///
  /// Transactions can be started and stopped on any thread. Any edits that take
  /// place after a call to [Geodatabase.beginTransaction] but before a call to
  /// either [Geodatabase.commitTransaction] or
  /// [Geodatabase.rollbackTransaction] will be considered part of that
  /// transaction, no matter what thread made the edit.
  void rollbackTransaction() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_rollbackTransaction(_handle, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geodatabase_getLoadStatus(_handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Geodatabase_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _domains.invalidateCache();
    _geodatabaseFeatureTables.invalidateCache();
    _fileUri.invalidateCache();
    _serviceUri.invalidateCache();
    _syncId.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeGeodatabaseTransactionStatusChangedEvent:
        final event = () {
          return message[2] as bool;
        }();
        _transactionStatusChangedStreamController.add(event);
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
        logger.f('Geodatabase unhandled asyncType $asyncType');
    }
  }
}

final class _GeodatabaseFactory
    implements _InstanceFactory<Geodatabase, RT_GeodatabaseHandle> {
  @override
  Geodatabase createInstance({required RT_GeodatabaseHandle handle}) {
    return Geodatabase._withHandle(handle);
  }

  @override
  void destroyHandle(RT_GeodatabaseHandle handle) {
    bindings.Geodatabase_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_GeodatabaseHandle handle) {
    return runtimecore.RT_Geodatabase_getInstanceId(handle, ffi.nullptr);
  }
}

/// An interface for geodatabase dataset.
///
/// Describes common part of functionality for all geodatabase datasets.
/// Supports types of geodatabase datasets presents in [GeodatabaseDatasetType]
/// enum.
abstract interface class GeodatabaseDataset {
  /// The geodatabase.
  ///
  /// Instance of geodatabase.
  Geodatabase? get geodatabase;

  /// The name of geodatabase dataset.
  ///
  /// The geodatabase dataset's name.
  String get name;

  /// The type of geodatabase dataset.
  GeodatabaseDatasetType get type;
}

/// The types of geodatabase datasets.
enum GeodatabaseDatasetType {
  /// Unknown geodatabase dataset type.
  unknown,

  /// A [TransportationNetworkDataset].
  transportationNetworkDataset;

  factory GeodatabaseDatasetType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return transportationNetworkDataset;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case transportationNetworkDataset:
        return 0;
    }
  }
}

/// A feature table stored in a Geodatabase.
///
/// For mobile geodatabases created by ArcGIS Pro, renderer information isn't
/// stored in the geodatabase. A default renderer is therefore used to display
/// mobile geodatabase feature tables in a feature layer. In most cases, this
/// default should be replaced with a custom renderer.
final class GeodatabaseFeatureTable extends ArcGISFeatureTable {
  static GeodatabaseFeatureTable? _fromHandle(
      RT_GeodatabaseFeatureTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  GeodatabaseFeatureTable._withHandle(super.handle)
      : _geodatabase = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodatabaseFeatureTable_getGeodatabase(
                handle, errorHandler);
          });
          return Geodatabase._fromHandle(objectHandle);
        }),
        super._withHandle();

  /// Creates a new geodatabase feature table object from the specified table
  /// and relationship info.
  ///
  /// Parameters:
  /// - `table` — The table from which to create a new table.
  /// - `relationshipInfo` — The relationship info specifying which table to
  /// create.
  factory GeodatabaseFeatureTable.fromTable(
      {required GeodatabaseFeatureTable table,
      required RelationshipInfo relationshipInfo}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseFeatureTable_createFromTable(
          table._handle, relationshipInfo._handle, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  /// The geodatabase from the geodatabase feature table.
  Geodatabase? get geodatabase => _geodatabase.value;

  final Memoized<Geodatabase?> _geodatabase;

  /// Checks if the geodatabase feature table has local edits since a specific
  /// date.
  ///
  /// Parameters:
  /// - `date` — The date.
  ///
  /// Return Value: true if it does have local edits, false otherwise.
  bool hasLocalEditsSince({required DateTime date}) {
    final coreDate = date.toArcGIS();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodatabaseFeatureTable_hasLocalEditsSince(
          _handle, coreDate._handle, errorHandler);
    });
  }
}

/// An object that specifies an inherited domain that specifies the valid values
/// for a [Field].
final class InheritedDomain extends Domain {
  static InheritedDomain? _fromHandle(RT_InheritedDomainHandle handle) {
    if (handle == ffi.nullptr) return null;
    return InheritedDomain._withHandle(handle);
  }

  InheritedDomain._withHandle(super.handle) : super._withHandle();
}

/// An object that represents a pending feature edit specifying its edit
/// operation and most recent edit time.
final class LocalFeatureEdit implements ffi.Finalizable {
  final RT_LocalFeatureEditHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LocalFeatureEdit_destroy.cast());

  static LocalFeatureEdit? _fromHandle(RT_LocalFeatureEditHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocalFeatureEdit._withHandle(handle);
  }

  LocalFeatureEdit._withHandle(RT_LocalFeatureEditHandle handle)
      : _editDateTime = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocalFeatureEdit_getEditDateTime(
                handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _feature = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocalFeatureEdit_getFeature(
                handle, errorHandler);
          });
          return Feature._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocalFeatureEdit_created(_handle);
    }
  }

  /// The date and time when the most recent edit occurred.
  DateTime get editDateTime => _editDateTime.value;

  final Memoized<DateTime> _editDateTime;

  /// The edited feature.
  Feature get feature => _feature.value;

  final Memoized<Feature> _feature;

  /// The type of the feature edit.
  ///
  /// A newly added feature will keep the [EditOperation.add] edit operation
  /// even if it has been updated since being added.
  EditOperation get operation {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocalFeatureEdit_getOperation(
          _handle, errorHandler);
    });
    return EditOperation._fromCoreValue(coreValue);
  }
}

/// An object that represents the [LocalFeatureEdit] results in ascending order
/// based on edit time.
final class LocalFeatureEditsResult implements ffi.Finalizable {
  final RT_LocalFeatureEditsResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.LocalFeatureEditsResult_destroy.cast());

  static LocalFeatureEditsResult? _fromHandle(
      RT_LocalFeatureEditsResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocalFeatureEditsResult._withHandle(handle);
  }

  LocalFeatureEditsResult._withHandle(RT_LocalFeatureEditsResultHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocalFeatureEditsResult_created(_handle);
    }
  }

  /// Returns the feature edit iterator.
  ///
  /// Return Value: An [Iterable] that returns [LocalFeatureEdit] objects.
  Iterable<LocalFeatureEdit> iterator() {
    final iteratorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocalFeatureEditsResult_iterator(
          _handle, errorHandler);
    });
    return iteratorHandle.toIterable();
  }
}

/// An object that represents an ordering in a query's order by clause.
final class OrderBy implements ffi.Finalizable {
  final RT_OrderByHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.OrderBy_destroy.cast());

  static OrderBy? _fromHandle(RT_OrderByHandle handle) {
    if (handle == ffi.nullptr) return null;
    return OrderBy._withHandle(handle);
  }

  OrderBy._withHandle(RT_OrderByHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.OrderBy_created(_handle);
    }
  }

  /// Creates a new order by object.
  ///
  /// Parameters:
  /// - `fieldName` — Name of the field.
  /// - `sortOrder` — The order.
  factory OrderBy(
      {String fieldName = '', SortOrder sortOrder = SortOrder.ascending}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFieldName = _CString(fieldName);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OrderBy_createWith(
          coreFieldName.bytes, sortOrder.coreValue, errorHandler);
    });
    return OrderBy._withHandle(handle);
  }

  /// The field name of the field being ordered by.
  String get fieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OrderBy_getFieldName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set fieldName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OrderBy_setFieldName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The order that should be applied.
  ///
  /// [SortOrder.ascending] if an error occurs.
  SortOrder get sortOrder {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_OrderBy_getSortOrder(_handle, errorHandler);
    });
    return SortOrder._fromCoreValue(coreValue);
  }

  set sortOrder(SortOrder value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_OrderBy_setSortOrder(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// Controls which attributes are included in the features returned by
/// [ServiceFeatureTable.queryFeaturesWithFieldOptions] or
/// [ServiceFeatureTable.queryRelatedFeaturesWithFieldOptions].
enum QueryFeatureFields {
  /// Includes only the object id and global id in the ArcGISFeatures of the
  /// query result. The features are returned with no other attributes. The
  /// geometry returned by this request does not include m-values, even if they
  /// are defined in the feature service.
  idsOnly,

  /// Includes the minimum set of attributes in the ArcGISFeatures of the query
  /// result. The geometry returned by this request does not include m-values,
  /// even if they are defined in the feature service.
  minimum,

  /// Includes all available attributes in the ArcGISFeatures of the query
  /// result. This constant loads the features returned by the query, which
  /// makes all attributes available. The geometry returned by this request
  /// includes m-values if defined in the feature service.
  loadAll;

  factory QueryFeatureFields._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return idsOnly;
      case 1:
        return minimum;
      case 2:
        return loadAll;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case idsOnly:
        return 0;
      case minimum:
        return 1;
      case loadAll:
        return 2;
    }
  }
}

/// Parameters to perform a query on a dataset.
///
/// These parameters provide attribute, spatial, and temporal criteria that you
/// can use to filter features. You can define attribute criteria using a
/// standard SQL expression based on the available attribute fields, spatial
/// criteria using a geometry and a spatial relationship (such as within,
/// contains, intersect), or temporal filters using a single date/time, or a
/// range. You can also control how the results are sorted and whether to return
/// geometry.
///
/// In addition to querying features in a table, you can also use these
/// parameters to count specific features, calculate the extent of features,
/// select features in layers, and populate service-based tables. If the query
/// method produces a set of features, they are returned in a
/// [FeatureQueryResult].
///
/// Different query parameter objects are available to query data sources such
/// as related features ([RelatedQueryParameters]), statistical information
/// ([StatisticsQueryParameters]), and portals (`PortalQueryParameters`).
/// Specialized query parameters also exist for working with utility networks
/// and routing.
final class QueryParameters implements ffi.Finalizable {
  final RT_QueryParametersHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.QueryParameters_destroy.cast());

  static QueryParameters? _fromHandle(RT_QueryParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return QueryParameters._withHandle(handle);
  }

  QueryParameters._withHandle(RT_QueryParametersHandle handle)
      : _objectIds = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getObjectIds(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _orderByFields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getOrderByFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        __outFields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getOutFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _outSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getOutSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_QueryParameters_setOutSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _timeExtent = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getTimeExtent(
                handle, errorHandler);
          });
          return TimeExtent._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_QueryParameters_setTimeExtent(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        __urlParameters = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_QueryParameters_getURLParameters(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.QueryParameters_created(_handle);
    }
  }

  /// Creates a new query parameters object.
  factory QueryParameters() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_create(errorHandler);
    });
    return QueryParameters._withHandle(handle);
  }

  /// The geometry used to filter the results.
  ///
  /// The geometry that (along with the [QueryParameters.spatialRelationship])
  /// defines features to be included in the query.
  Geometry? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set geometry(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The maximum allowable offset.
  double get maxAllowableOffset {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getMaxAllowableOffset(
          _handle, errorHandler);
    });
  }

  set maxAllowableOffset(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setMaxAllowableOffset(
          _handle, value, errorHandler);
    });
  }

  /// The maximum number of features the query should return.
  ///
  /// For consistent ordering of results when using pagination, provide a value
  /// for [QueryParameters.orderByFields]. Note that if you provide a maximum
  /// features value to support paging of results, you must also set a
  /// [QueryParameters.resultOffset] value. Otherwise, the result may contain
  /// local features in place of server features if they satisfy the query. To
  /// ensure strict paging of server features, specify both maximum features and
  /// [QueryParameters.resultOffset].
  int get maxFeatures {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getMaxFeatures(
          _handle, errorHandler);
    });
  }

  set maxFeatures(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setMaxFeatures(
          _handle, value, errorHandler);
    });
  }

  /// The object ids of the features to query for.
  List<int> get objectIds => _objectIds.value;

  final Memoized<_MutableArrayList<int>> _objectIds;

  /// The fields by which query results will be ordered.
  ///
  /// Results can be sorted by one or more fields. Each [OrderBy] instance
  /// includes a field name and whether to sort by that field in ascending or
  /// descending order. If a service-based table is being queried it must
  /// support advanced queries.
  List<OrderBy> get orderByFields => _orderByFields.value;

  final Memoized<_MutableArrayList<OrderBy>> _orderByFields;

  /// A [List] of the fields that are used for sending to the query service on a
  /// feature server.
  List<String> get _outFields => __outFields.value;

  final Memoized<_MutableArrayList<String>> __outFields;

  /// The spatial reference of the feature results' geometry.
  ///
  /// If not specified, geometries are returned in the spatial reference of the
  /// service.
  SpatialReference? get outSpatialReference => _outSpatialReference.value;

  set outSpatialReference(SpatialReference? value) =>
      _outSpatialReference.value = value;

  final Memoized<SpatialReference?> _outSpatialReference;

  /// The starting offset of results to fetch. This is useful for paging through
  /// results.
  ///
  /// For consistent ordering of results when using pagination, you should also
  /// provide a value for the [QueryParameters.orderByFields]. Note that if you
  /// provide a result offset to support paging of results, you must also set a
  /// [QueryParameters.maxFeatures] value. Otherwise, the result offset is
  /// ignored.
  int get resultOffset {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getResultOffset(
          _handle, errorHandler);
    });
  }

  set resultOffset(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setResultOffset(
          _handle, value, errorHandler);
    });
  }

  /// True if geometry values are returned in the results, otherwise false.
  ///
  /// This is needed when you want to display the features on a map or a scene.
  /// When querying non-spatial data, results do not include geometry.
  bool get returnGeometry {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getReturnGeometry(
          _handle, errorHandler);
    });
  }

  set returnGeometry(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setReturnGeometry(
          _handle, value, errorHandler);
    });
  }

  /// The spatial relationship that (along with the [QueryParameters.geometry])
  /// defines features to be included in the query.
  ///
  /// The default spatial relationship is [SpatialRelationship.intersects].
  SpatialRelationship get spatialRelationship {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getSpatialRelationship(
          _handle, errorHandler);
    });
    return SpatialRelationship._fromCoreValue(coreValue);
  }

  set spatialRelationship(SpatialRelationship value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setSpatialRelationship(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// A span of time used to query features in a time-aware feature layer.
  ///
  /// You can apply a temporal filter on any [FeatureLayer] that supports time
  /// filtering ([FeatureLayer.supportsTimeFiltering]). Set the
  /// [TimeExtent.startTime] and [TimeExtent.endTime] to query features across a
  /// span of time. A single point in time can be queried by setting them to the
  /// same time value.
  ///
  /// By default, this value is null and no time criteria is applied by the
  /// query.
  TimeExtent? get timeExtent => _timeExtent.value;

  set timeExtent(TimeExtent? value) => _timeExtent.value = value;

  final Memoized<TimeExtent?> _timeExtent;

  /// A map of URL parameters that are used for sending to the query service on
  /// a Feature server.
  Map<String, String> get _urlParameters => __urlParameters.value;

  final Memoized<_UnmodifiableDictionaryMap<String, String>> __urlParameters;

  /// The attribute expression that defines features to be included in the
  /// query.
  ///
  /// The where clause should follow standard SQL syntax similar to that
  /// discussed in the document
  /// [SQL reference for query expressions used in ArcGIS](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-940733A1-D6D1-4200-B290-24CA2E1056D4)
  ///
  /// If the where clause includes dates, they must be correctly formatted based
  /// on the geodatabase datasource used in the service. Refer to
  /// [Dates and time](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-85C03D85-F4A5-48FC-8E8C-3F79919430DB)
  /// for date formats expected by different data sources.
  ///
  /// [ArcGISFeatureTable] objects expect that any [FieldType.globalId] or
  /// [FieldType.guid] parameters in the where clause are formatted as:
  /// '{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}'. All characters are uppercase,
  /// wrapped in curly braces and surrounded by single quotes.
  ///
  /// If the where clause is used to populate an `OgcFeatureCollectionTable`,
  /// you can use a CQL2-TEXT or CQL2-JSON string as defined in the document
  /// [OGC API - Features - Part3](https://docs.opengeospatial.org/DRAFTS/19-079r1.html).
  String get whereClause {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_QueryParameters_getWhereClause(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set whereClause(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_QueryParameters_setWhereClause(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// An object that specifies a range of valid values for a [Field].
final class RangeDomain extends Domain {
  static RangeDomain? _fromHandle(RT_RangeDomainHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RangeDomain._withHandle(handle);
  }

  RangeDomain._withHandle(super.handle)
      : _maxValue = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RangeDomain_getMaxValue(handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        _minValue = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RangeDomain_getMinValue(handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue();
        }),
        super._withHandle();

  /// The range domain's maximum value.
  dynamic get maxValue => _maxValue.value;

  final Memoized<dynamic> _maxValue;

  /// The range domain's minimum value.
  dynamic get minValue => _minValue.value;

  final Memoized<dynamic> _minValue;
}

/// An object that describes a [RangeDomain] to be created.
///
/// Creation of domains is currently only supported on mobile geodatabases,
/// either created in ArcGIS Pro or via [Geodatabase.create].
final class RangeDomainDescription extends DomainDescription {
  static RangeDomainDescription? _fromHandle(
      RT_RangeDomainDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RangeDomainDescription._withHandle(handle);
  }

  RangeDomainDescription._withHandle(super.handle)
      : _maxValue = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RangeDomainDescription_getMaxValue(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue()!;
        }, setter: (value) {
          final coreValue = _ElementExtension.fromDartValue(value);
          _withThrowingErrorHandler((errorHandler) {
            runtimecore
                .RT_RangeDomainDescription_setMaxValueCorrectingFieldType(
                    handle, coreValue._handle, errorHandler);
          });
        }),
        _minValue = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RangeDomainDescription_getMinValue(
                handle, errorHandler);
          });
          return elementHandle.toElement()?.getDartValue()!;
        }, setter: (value) {
          final coreValue = _ElementExtension.fromDartValue(value);
          _withThrowingErrorHandler((errorHandler) {
            runtimecore
                .RT_RangeDomainDescription_setMinValueCorrectingFieldType(
                    handle, coreValue._handle, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a new range domain description object with the specified name and
  /// values.
  ///
  /// Parameters:
  /// - `name` — The range domain's name.
  /// - `fieldType` — The range domain's field type.
  /// - `minValue` — The range domain's minimum value.
  /// - `maxValue` — The range domain's maximum value.
  factory RangeDomainDescription(
      {required String name,
      required FieldType fieldType,
      required dynamic minValue,
      required dynamic maxValue}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final coreMinValue = _ElementExtension.fromDartValue(minValue);
    final coreMaxValue = _ElementExtension.fromDartValue(maxValue);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RangeDomainDescription_createCorrectingFieldType(
          coreName.bytes,
          fieldType.coreValue,
          coreMinValue._handle,
          coreMaxValue._handle,
          errorHandler);
    });
    final RangeDomainDescription object =
        RangeDomainDescription._withHandle(handle);
    object._minValue.cache(minValue);
    object._maxValue.cache(maxValue);
    return object;
  }

  /// The range domain's maximum value.
  ///
  /// For fields that utilize a range domain, the field type must match the type
  /// of the min and max values.
  dynamic get maxValue => _maxValue.value;

  set maxValue(dynamic value) => _maxValue.value = value;

  final Memoized<dynamic> _maxValue;

  /// The range domain's minimum value.
  ///
  /// For fields that utilize a range domain, the field type must match the type
  /// of the minimum and maximum values.
  dynamic get minValue => _minValue.value;

  set minValue(dynamic value) => _minValue.value = value;

  final Memoized<dynamic> _minValue;
}

/// Contains the features that have been returned from a related tables query.
///
/// Instances of this class represents the result of related queries. A
/// prerequisite for querying related features is that all the participating
/// tables must be part of a map, as either feature layers or non-spatial
/// tables. An array of instances are returned, one per related table containing
/// features related to the queried feature. This class has methods that can be
/// used to iterate over the collection of related features.
final class RelatedFeatureQueryResult implements FeatureSet, ffi.Finalizable {
  final RT_RelatedFeatureQueryResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.RelatedFeatureQueryResult_destroy.cast());

  static RelatedFeatureQueryResult? _fromHandle(
      RT_RelatedFeatureQueryResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RelatedFeatureQueryResult._withHandle(handle);
  }

  RelatedFeatureQueryResult._withHandle(
      RT_RelatedFeatureQueryResultHandle handle)
      : _feature = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedFeatureQueryResult_getFeature(
                handle, errorHandler);
          });
          return ArcGISFeature._fromHandle(objectHandle);
        }),
        _relatedTable = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedFeatureQueryResult_getRelatedTable(
                handle, errorHandler);
          });
          return ArcGISFeatureTable._fromHandle(objectHandle);
        }),
        _relationshipInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedFeatureQueryResult_getRelationshipInfo(
                handle, errorHandler);
          });
          return RelationshipInfo._fromHandle(objectHandle);
        }),
        _fields = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedFeatureQueryResult_getFields(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedFeatureQueryResult_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RelatedFeatureQueryResult_created(_handle);
    }
  }

  /// The feature for which related features were queried.
  ArcGISFeature? get feature => _feature.value;

  final Memoized<ArcGISFeature?> _feature;

  @override
  List<Field> get fields => _fields.value;

  final Memoized<_ArrayList<Field>> _fields;

  @override
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedFeatureQueryResult_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  /// True if the query resulted in a larger number of features than what the
  /// transfer limit supports.
  ///
  /// Many ArcGIS services only return up to 1000 features even if the query
  /// matched more features. When that happens for the query that produces this
  /// result, this property is true.
  bool get isTransferLimitExceeded {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_RelatedFeatureQueryResult_getIsTransferLimitExceeded(
              _handle, errorHandler);
    });
  }

  /// The related table for this query result.
  ///
  /// There can be more than one instance of the same table or layer on the map
  /// with different scale level visibility, definition expression, and so on.
  /// All such instances share the same RelationshipInfo with the table the
  /// query operation is called on. In such cases, results from all such
  /// instances are returned, and the relatedTable property is used to
  /// distinguish between them.
  ArcGISFeatureTable? get relatedTable => _relatedTable.value;

  final Memoized<ArcGISFeatureTable?> _relatedTable;

  /// Relationship info.
  ///
  /// If more than one related table were queried, multiple results are
  /// returned, each with its RelationshipInfo.
  RelationshipInfo? get relationshipInfo => _relationshipInfo.value;

  final Memoized<RelationshipInfo?> _relationshipInfo;

  @override
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  @override
  Iterable<Feature> features() {
    final iteratorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedFeatureQueryResult_iterator(
          _handle, errorHandler);
    });
    return iteratorHandle.toIterable();
  }
}

/// Parameters to perform a related query on an [ArcGISFeatureTable].
///
/// When querying related features, all participating tables must be included in
/// the same [ArcGISMap] or `ArcGISScene`, as either feature layers or
/// non-spatial tables. The query that uses these parameters will load these
/// related tables.
///
/// [RelatedQueryParameters] lets you specify:
/// * Details about the relationship to be queried.
/// * A where clause used to filter features from the related table.
/// * How to sort the results.
/// * Whether to return geometry within the results.
final class RelatedQueryParameters implements ffi.Finalizable {
  final RT_RelatedQueryParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.RelatedQueryParameters_destroy.cast());

  static RelatedQueryParameters? _fromHandle(
      RT_RelatedQueryParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return RelatedQueryParameters._withHandle(handle);
  }

  RelatedQueryParameters._withHandle(RT_RelatedQueryParametersHandle handle)
      : _orderByFields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedQueryParameters_getOrderByFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _relationshipInfo = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_RelatedQueryParameters_getRelationshipInfo(
                handle, errorHandler);
          });
          return RelationshipInfo._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_RelatedQueryParameters_setRelationshipInfo(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.RelatedQueryParameters_created(_handle);
    }
  }

  /// Creates related query parameters with the specified relationship
  /// information.
  ///
  /// Parameters:
  /// - `relationshipInfo` — The relationship information between related
  /// tables.
  factory RelatedQueryParameters.withRelationshipInfo(
      RelationshipInfo relationshipInfo) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedQueryParameters_createWithRelationshipInfo(
          relationshipInfo._handle, errorHandler);
    });
    final RelatedQueryParameters object =
        RelatedQueryParameters._withHandle(handle);
    object._relationshipInfo.cache(relationshipInfo);
    return object;
  }

  /// The maximum number of features the query should return.
  ///
  /// For consistent ordering of results when using pagination, provide a value
  /// for [RelatedQueryParameters.orderByFields]. Note that if you provide a
  /// maximum features value to support paging of results, you must also set a
  /// [QueryParameters.resultOffset] value. Otherwise, the result may contain
  /// local features in place of server features if they satisfy the query. To
  /// ensure strict paging of server features, specify both maximum features and
  /// [RelatedQueryParameters.resultOffset].
  int get maxFeatures {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedQueryParameters_getMaxFeatures(
          _handle, errorHandler);
    });
  }

  set maxFeatures(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RelatedQueryParameters_setMaxFeatures(
          _handle, value, errorHandler);
    });
  }

  /// The collection of order by objects that indicates how to sort the results.
  ///
  /// Results can be sorted by one or more fields. Each order by instance
  /// includes a field name and whether to sort by that field in ascending or
  /// descending order. If a service-based table is being queried it must
  /// support advanced queries.
  List<OrderBy> get orderByFields => _orderByFields.value;

  final Memoized<_MutableArrayList<OrderBy>> _orderByFields;

  /// The relationship information used to define the tables to use for this
  /// query.
  RelationshipInfo get relationshipInfo => _relationshipInfo.value;

  set relationshipInfo(RelationshipInfo value) =>
      _relationshipInfo.value = value;

  final Memoized<RelationshipInfo> _relationshipInfo;

  /// The starting offset of results to fetch. This is useful for paging through
  /// results.
  ///
  /// For consistent ordering of results when using pagination, you should also
  /// provide a value for the [RelatedQueryParameters.orderByFields]. Note that
  /// if you provide a result offset to support paging of results, you must also
  /// set a [RelatedQueryParameters.maxFeatures] value. Otherwise, the result
  /// offset is ignored.
  int get resultOffset {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedQueryParameters_getResultOffset(
          _handle, errorHandler);
    });
  }

  set resultOffset(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RelatedQueryParameters_setResultOffset(
          _handle, value, errorHandler);
    });
  }

  /// True if geometry values are returned in the results, otherwise false.
  ///
  /// This is needed when you want to display the features on a map or a scene.
  /// When querying non-spatial data, results do not include geometry.
  bool get returnGeometry {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedQueryParameters_getReturnGeometry(
          _handle, errorHandler);
    });
  }

  set returnGeometry(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RelatedQueryParameters_setReturnGeometry(
          _handle, value, errorHandler);
    });
  }

  /// The where clause to apply to the destination table.
  ///
  /// The where clause should follow standard SQL syntax similar to that
  /// discussed in the document
  /// [SQL reference for query expressions used in ArcGIS](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-940733A1-D6D1-4200-B290-24CA2E1056D4).
  ///
  /// If the where clause includes dates, they must be correctly formatted based
  /// on the geodatabase datasource used in the service. Refer to
  /// [Dates and time](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-85C03D85-F4A5-48FC-8E8C-3F79919430DB)
  /// for date formats expected by different data sources.
  ///
  /// [ArcGISFeatureTable] objects expect that any [FieldType.globalId] or
  /// [FieldType.guid] parameters in the where clause are formatted as:
  /// '{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}'. All characters are uppercase,
  /// wrapped in curly braces and surrounded by single quotes.
  String get whereClause {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_RelatedQueryParameters_getWhereClause(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set whereClause(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_RelatedQueryParameters_setWhereClause(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// The various constraint violations that may occur when relating two features.
enum RelationshipConstraintViolationType {
  /// There are no constraint violations.
  none,

  /// Cardinality of the given feature is violated.
  cardinality,

  /// The given feature is an orphaned destination feature in a composite
  /// relationship. Note: Orphaned destination feature in a simple relationship
  /// is not considered a violation.
  orphaned;

  factory RelationshipConstraintViolationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return cardinality;
      case 2:
        return orphaned;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case cardinality:
        return 1;
      case orphaned:
        return 2;
    }
  }
}

/// A table of features that typically represent real-world objects created from
/// an ArcGIS feature service.
///
/// An instance of this class represents the dataset of an individual layer or
/// table in an ArcGIS map or feature service. The map or feature service may be
/// hosted in the cloud on ArcGIS Online, or on-premises on an ArcGIS Server. To
/// access these services you may need to provide authentication in your
/// application.
///
/// You can construct a [ServiceFeatureTable] directly from the feature service
/// using its URI or [PortalItem]. Alternatively, you can obtain a
/// [ServiceFeatureTable] from a [FeatureLayer] or a [FeatureTable] that is part
/// of an [ArcGISMap] or `ArcGISScene`. You can also obtain a
/// [ServiceFeatureTable] directly from its service geodatabase using
/// `ServiceGeodatabase.getTable(int64)`.
///
/// The [ServiceFeatureTable] adopts the loadable pattern so many of its
/// properties are initialized asynchronously after connecting to the service.
/// For more information, see [Loadable].
///
/// Display
///
/// If the [FeatureTable.hasGeometry] is true, you can display the features in
/// an [ArcGISMap] or `ArcGISScene`. To do this create a [FeatureLayer] from the
/// feature table and add it to the map or scene's collection of operational
/// layers ([GeoModel.operationalLayers]). Spatial features are requested in the
/// [SpatialReference] that matches the [ArcGISMap] or `ArcGISScene` and are
/// displayed using the [ArcGISSymbol] information defined by the map or feature
/// service. Query You can query the data in the ServiceFeatureTable based on
/// SQL expressions and/or spatial relationships. Use the [QueryParameters]
/// object to define your spatial or attribute query and pass it to the
/// [ServiceFeatureTable.queryFeaturesWithFieldOptions] method. If the service
/// feature table is related to any other tables that are part of the map or
/// scene, use the [ServiceFeatureTable.queryRelatedFeaturesWithFieldOptions]
/// method to query the related tables. For more information, see
/// [RelatedQueryParameters]. Edit A [ServiceFeatureTable] can have editable
/// attribute fields, feature templates ([FeatureTemplate]), feature types
/// ([FeatureType]), and editing capabilities defined in
/// [ArcGISFeatureLayerInfo.capabilities]. You can create, delete, and update
/// data in the local cache depending upon whether the service allows those
/// operations, who owns the data, and what ownership-based access control
/// policies are in place. Permission to edit the data is managed by the author
/// of the feature service. Explore [FeatureTable.isEditable],
/// [FeatureTable.canAdd], [FeatureTable.canUpdate], and
/// [FeatureTable.canDelete] for information on what is permitted. If the
/// service supports attachments ([ArcGISFeatureTable.hasAttachments]), you can
/// also view and potentially edit the attachments. If you want to apply your
/// edits to the feature service, you must call the
/// `ServiceGeodatabase.applyEditsAsync()` method on the
/// `ServiceFeatureTable.serviceGeodatabase`. This will ensure that the table
/// and any tables involved in geodatabase behavior are updated. Areas that have
/// geodatabase behavior include:
///     * Composite relationships
///     * Annotation feature layers
///     * Utility network association deletion semantics
///     * Attribute rules
///
/// Contingent Values The [ServiceFeatureTable] supports querying and editing
/// contingent values. See
/// `ArcGISFeatureTable.getContingentValues(ArcGISFeature, String)` for more
/// information.
///
/// Offline If you wish to adopt an offline workflow, you can take areas of a
/// [ServiceFeatureTable] offline using the [GeodatabaseSyncTask]. If you wish
/// to take an [ArcGISMap] offline use the [OfflineMapTask]. See
/// [Build offline applications](https://developers.arcgis.com/documentation/mapping-apis-and-services/offline/)
/// for more information.
///
/// Feature Request Mode The [FeatureRequestMode] determines whether
/// ServiceFeatureTable features are cached locally (for quicker access by map
/// and scene layers) and whether queries are performed on the local cache or on
/// the server. Consider which of these 3 modes is appropriate for your
/// application:
///
/// * [FeatureRequestMode.onInteractionCache] - User interactions (pan or zoom)
/// with the [ArcGISMapViewController] or `SceneView` request features from the
/// server and cache them locally for the duration of the session. Subsequent
/// interactions with the [ArcGISMapViewController] or `SceneView` will refresh
/// this local cache. Queries are executed on the local cache or (if requested
/// features are not resident in the cache) on the server. If the network
/// connection is lost then the application can still operate with the local
/// cache. This is the default mode.
///
/// * [FeatureRequestMode.onInteractionNoCache] - Your application will display
/// or query features directly from the server. They are not cached locally.
/// This mode ensures that you are working against the latest data, but it has a
/// high network bandwidth since it goes to the server for all interactions
/// (pans, zooms, selects, or queries).
///
/// * [FeatureRequestMode.manualCache] - Your application must explicitly call
/// [ServiceFeatureTable.populateFromService] to query the feature service and
/// cache the resulting features in the [ServiceFeatureTable]. All queries are
/// made against this local cache. You must adopt this mode for tables that
/// contain non-spatial records (see [FeatureTable.hasGeometry]).
final class ServiceFeatureTable extends ArcGISFeatureTable
    implements ApiKeyResource {
  static ServiceFeatureTable? _fromHandle(RT_ServiceFeatureTableHandle handle) {
    if (handle == ffi.nullptr) return null;
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  ServiceFeatureTable._withHandle(super.handle)
      : _item = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceFeatureTable_getItem(
                handle, errorHandler);
          });
          return Item._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ServiceFeatureTable_getURI(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle();

  /// Creates a new service feature table object from the specified table and
  /// relationship information.
  ///
  /// Parameters:
  /// - `table` — The table from which to create a new table.
  /// - `relationshipInfo` — The relationship information specifying which table
  /// to create.
  factory ServiceFeatureTable.fromTable(ServiceFeatureTable table,
      {required RelationshipInfo relationshipInfo}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_createFromTable(
          table._handle, relationshipInfo._handle, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  /// Creates a new service feature table object from an ArcGIS feature service
  /// or feature layer portal item.
  ///
  /// If the portal item is a feature service, the [ServiceFeatureTable] will be
  /// created from the first layer on the service. If the portal item is a
  /// feature layer, the [ServiceFeatureTable] will be created from the feature
  /// layer.
  ///
  /// Parameters:
  /// - `item` — An ArcGIS feature service or feature layer [PortalItem].
  factory ServiceFeatureTable.withFeatureLayerItem(Item item) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_createWithFeatureLayerItem(
          item._handle, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  /// Creates a new service feature table object from a feature service portal
  /// item.
  ///
  /// Parameters:
  /// - `item` — An ArcGIS feature service [PortalItem].
  /// - `layerId` — The layer id of an individual layer in the ArcGIS feature
  /// service represented by the [Item].
  factory ServiceFeatureTable.withItem(Item item, {required int layerId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_createWithItem(
          item._handle, layerId, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  /// Creates a new service feature table object from a given URI.
  ///
  /// Parameters:
  /// - `uri` — The URI of an individual layer or table in an ArcGIS map or
  /// feature service.
  factory ServiceFeatureTable.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_createFromURI(
          coreURI.bytes, errorHandler);
    });
    return FeatureTable._instanceCache.instanceWith(handle);
  }

  @override
  String get apiKey {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getAPIKey(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  set apiKey(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setAPIKey(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The factor used to calculate a buffered extent around the current visible
  /// area when requesting features from a service.
  ///
  /// New features are requested from the service if the visible area of the
  /// [ArcGISMapViewController] exceeds the buffered extent. A change in the
  /// visible area can result from any user interaction with the
  /// [ArcGISMapViewController], such as a pan or zoom action. The buffer factor
  /// is applied when the [FeatureRequestMode] is in either
  /// [FeatureRequestMode.onInteractionCache] or
  /// [FeatureRequestMode.onInteractionNoCache].
  ///
  /// The default value is 2 (twice the current extent). The maximum value is
  /// 10. If it is set to 0 or 1, the buffered extent will equal the visible map
  /// area.
  double get bufferFactor {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getBufferFactor(
          _handle, errorHandler);
    });
  }

  set bufferFactor(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setBufferFactor(
          _handle, value, errorHandler);
    });
  }

  /// An expression (SQL where clause) to filter features queried in this table.
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
      return runtimecore.RT_ServiceFeatureTable_getDefinitionExpression(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set definitionExpression(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setDefinitionExpression(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Max level of feature tile drill down for.
  ///
  /// -1 means the hardcoded value.
  int get _drillDownMaxLevel {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getDrillDownMaxLevel(
          _handle, errorHandler);
    });
  }

  set _drillDownMaxLevel(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setDrillDownMaxLevel(
          _handle, value, errorHandler);
    });
  }

  /// Defines when features and non-spatial records are requested from the
  /// feature service.
  ///
  /// The default mode is [FeatureRequestMode.onInteractionCache].
  FeatureRequestMode get featureRequestMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getFeatureRequestMode(
          _handle, errorHandler);
    });
    return FeatureRequestMode._fromCoreValue(coreValue);
  }

  set featureRequestMode(FeatureRequestMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setFeatureRequestMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The service geodatabase version name.
  ///
  /// This property is populated if the [ServiceFeatureTable] is provided by a
  /// layer or a table in a web map or if the [ServiceFeatureTable] is created
  /// using `ServiceGeodatabase.getTable(int64)`.
  ///
  /// The default geodatabase version has the string value "sde.DEFAULT".
  String get geodatabaseVersion {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getGeodatabaseVersion(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set geodatabaseVersion(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setGeodatabaseVersion(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The [Item] that defines the service feature table.
  Item? get item => _item.value;

  final Memoized<Item?> _item;

  /// Maximum number of features returned by a query. Used for testing feature
  /// tiles.
  ///
  /// Set 0 to come back to server limitations.
  int get _maxRecordCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_getMaxRecordCount(
          _handle, errorHandler);
    });
  }

  set _maxRecordCount(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setMaxRecordCount(
          _handle, value, errorHandler);
    });
  }

  /// The URI of the service feature table.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// Uploads any changes to the local table to the feature service.
  ///
  /// [ServiceFeatureTable.applyEdits] is meant to be used for single table
  /// workflows or tables without geodatabase behavior (see below). If an edit
  /// on this table can cause an edit to another table due to geodatabase
  /// behavior, it is highly recommended to use
  /// `ServiceGeodatabase.applyEditsAsync()` instead to prevent data
  /// inconsistency, so that dependent edits are all applied or none are (if an
  /// error occurs).
  ///
  /// For example, when tables have a composite relationship, applying the
  /// delete of a destination feature in a composite relationship deletion will
  /// only delete the destination feature on the server, therefore causing
  /// inconsistency in the data.
  ///
  /// Areas which have geodatabase behavior:
  /// * Composite relationships
  /// * Annotation feature layers
  /// * Utility network association deletion semantics
  /// * Attribute rules
  ///
  /// Return Value: A [Future] that returns a [List] containing
  /// [FeatureEditResult] types.
  Future<List<FeatureEditResult>> applyEdits() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_applyEdits(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [applyEdits]. See that method for more information.
  CancelableOperation<List<FeatureEditResult>> applyEditsCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_applyEdits(
          _handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Clears cached data.
  ///
  /// Parameters:
  /// - `keepLocalEdits` — True if you need to retain edits in the local cache.
  void clearCache({required bool keepLocalEdits}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_clearCache(
          _handle, keepLocalEdits, errorHandler);
    });
  }

  /// Loads all attributes and geometries for features that have not been loaded
  /// and fetches attributes and geometries for previously loaded features.
  ///
  /// Features returned from [ServiceFeatureTable.queryFeaturesWithFieldOptions]
  /// or [ServiceFeatureTable.queryRelatedFeaturesWithFieldOptions] may be in
  /// the minimally loaded state (minimum attributes required for rendering and
  /// no m-values). To load all attributes, pass a mutable array of the features
  /// to this method.
  ///
  /// Any feature requested, but not returned, by the server will have its
  /// object id cleared (set to an invalid negative value) to indicate it is no
  /// longer associated with the service feature table.
  ///
  /// After calling this method, any non-applied edits on the table will be
  /// lost.
  ///
  /// This method will not refresh feature attachments. Use
  /// [ArcGISFeature.fetchAttachments] to retrieve attachments.
  ///
  /// All features loaded or refreshed by this method will have m-values if
  /// defined by the service. Note that an m-value may be NaN.
  ///
  /// Parameters:
  /// - `features` — The features to be loaded or refreshed.
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> loadOrRefreshFeatures({required List<Feature> features}) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_loadOrRefreshFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [loadOrRefreshFeatures]. See that method for more
  /// information.
  CancelableOperation<void> loadOrRefreshFeaturesCancelable(
      {required List<Feature> features}) {
    final coreFeatures =
        features.toMutableArray(valueType: _ElementType.feature);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_loadOrRefreshFeatures(
          _handle, coreFeatures._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }

  /// Queries the feature service and places the resulting features in the local
  /// table, which is cached for the duration of the session. The
  /// [ServiceFeatureTable] must have its
  /// [ServiceFeatureTable.featureRequestMode] set to
  /// [FeatureRequestMode.manualCache].
  ///
  /// This method is useful for non-geographic data. It's also helpful when you
  /// want to avoid accessing the service for a feature whose geometry is in the
  /// current extent of the map or scene.
  ///
  /// Specifying null or an empty [List] for outfields results in the minimum
  /// set of fields being used to populate the local table. This is the same set
  /// of fields described for [FeatureRequestMode.onInteractionCache] or
  /// [FeatureRequestMode.onInteractionNoCache].
  ///
  /// Parameters:
  /// - `parameters` — Options for controlling the operation.
  /// - `clearCache` — True, if you want to clear the local cache before
  /// populating the local table. False, if you want to append the features to
  /// the local table.
  /// - `outFields` — A [List] containing [String]. Each string is the name of a
  /// field to be used when populating the cache. If the array contains the
  /// single element "*", then all fields will be used. If the ObjectID field
  /// string name is not provided as part of the [List], no features will be
  /// returned for this method.
  ///
  /// Return Value: A [Future] that returns a [FeatureQueryResult] type.
  Future<FeatureQueryResult> populateFromService(
      {required QueryParameters parameters,
      required bool clearCache,
      required List<String> outFields}) {
    final coreOutFields =
        outFields.toMutableArray(valueType: _ElementType.string);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_populateFromService(_handle,
          parameters._handle, clearCache, coreOutFields._handle, errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [populateFromService]. See that method for more
  /// information.
  CancelableOperation<FeatureQueryResult> populateFromServiceCancelable(
      {required QueryParameters parameters,
      required bool clearCache,
      required List<String> outFields}) {
    final coreOutFields =
        outFields.toMutableArray(valueType: _ElementType.string);
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_populateFromService(_handle,
          parameters._handle, clearCache, coreOutFields._handle, errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Queries features from this table's cache and/or from the feature service
  /// used to create this table.
  ///
  /// If the request mode of the table is [FeatureRequestMode.manualCache], then
  /// the query is always performed on the local table.
  ///
  /// If the mode is [FeatureRequestMode.onInteractionCache], then the query is
  /// performed on the local cache, provided that the geometries of the features
  /// are within an extent that has been cached; otherwise, the query is
  /// performed on the server.
  ///
  /// If the mode is [FeatureRequestMode.onInteractionNoCache], the query is
  /// always performed on the server.
  ///
  /// [QueryFeatureFields] controls which fields will be included with the
  /// returned features. The options are:
  ///
  /// * If the service feature table [FeatureRequestMode] is onInteractionCache
  /// or onInteractionNoCache, the table will initially contains features with a
  /// minimum set of attribute required for rendering. To access all the
  /// feature's attributes you must load the features
  /// [QueryFeatureFields.loadAll] automatically loads the returned features
  /// into the local table and makes all attributes available.
  ///
  /// * If the service feature table [FeatureRequestMode] is manualCache, the
  /// table will contain the fields that you specified when calling
  /// [ServiceFeatureTable.populateFromService]
  ///
  /// Note that you can query any attribute defined by the feature service's
  /// table. If the attribute is not in the set of attributes in your local
  /// table, the query will be performed on the server.
  ///
  /// Parameters:
  /// - `parameters` — Options for controlling the operation.
  /// - `queryFeatureFields` — Options for controlling what fields are in the
  /// features of the query result.
  ///
  /// Return Value: A [Future] that returns a [FeatureQueryResult] type.
  Future<FeatureQueryResult> queryFeaturesWithFieldOptions(
      {required QueryParameters parameters,
      required QueryFeatureFields queryFeatureFields}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_queryFeaturesWithFieldOptions(
          _handle,
          parameters._handle,
          queryFeatureFields.coreValue,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Cancelable version of [queryFeaturesWithFieldOptions]. See that method for
  /// more information.
  CancelableOperation<FeatureQueryResult>
      queryFeaturesWithFieldOptionsCancelable(
          {required QueryParameters parameters,
          required QueryFeatureFields queryFeatureFields}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_queryFeaturesWithFieldOptions(
          _handle,
          parameters._handle,
          queryFeatureFields.coreValue,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsFeatureQueryResult()!);
  }

  /// Queries for related features in this service feature table using the
  /// provided parameters and query feature fields. See
  /// [ServiceFeatureTable.queryFeaturesWithFieldOptions] for more details.
  ///
  /// Parameters:
  /// - `feature` — The feature for which to query related features.
  /// - `parameters` — The related query parameters.
  /// - `queryFeatureFields` — Enumeration indicating which fields to return
  /// from the query.
  ///
  /// Return Value: A [Future] that returns a [List] of objects of
  /// [RelatedFeatureQueryResult] type.
  Future<List<RelatedFeatureQueryResult>> queryRelatedFeaturesWithFieldOptions(
      {required ArcGISFeature feature,
      required RelatedQueryParameters parameters,
      required QueryFeatureFields queryFeatureFields}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ServiceFeatureTable_queryRelatedFeaturesWithFieldOptions(
              _handle,
              feature._handle,
              parameters._handle,
              queryFeatureFields.coreValue,
              errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [queryRelatedFeaturesWithFieldOptions]. See that
  /// method for more information.
  CancelableOperation<List<RelatedFeatureQueryResult>>
      queryRelatedFeaturesWithFieldOptionsCancelable(
          {required ArcGISFeature feature,
          required RelatedQueryParameters parameters,
          required QueryFeatureFields queryFeatureFields}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_ServiceFeatureTable_queryRelatedFeaturesWithFieldOptions(
              _handle,
              feature._handle,
              parameters._handle,
              queryFeatureFields.coreValue,
              errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Sets the username of the service feature table.
  ///
  /// The username is used for OBAC and editor tracking purposes.
  ///
  /// Parameters:
  /// - `username` — The username.
  void _setUsername(String username) {
    final coreUsername = _CString(username);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ServiceFeatureTable_setUsername(
          _handle, coreUsername.bytes, errorHandler);
    });
  }

  /// Undoes all of the local edits since the last server acknowledgment.
  ///
  /// [ServiceFeatureTable.undoLocalEdits] is meant to be used for single table
  /// workflows or tables without geodatabase behavior (see below). If the
  /// service which the table belongs to has geodatabase behavior (see below),
  /// it is highly recommended to use
  /// `ServiceGeodatabase.undoLocalEditsAsync()`. Undoing edits in one table can
  /// cause data inconsistencies between the local cache and the service if
  /// [ServiceFeatureTable.undoLocalEdits] is used.
  ///
  /// For example, when tables have a composite relationship, undoing only the
  /// origin feature would violate the composite relationship rule that an
  /// origin and destination feature must be either deleted together or not at
  /// all.
  ///
  /// Areas which have geodatabase behavior:
  /// * Composite relationships
  /// * Annotation feature layers
  /// * Utility network association deletion semantics
  /// * Attribute rules
  ///
  /// Return Value: A [Future] that has no return value.
  Future<void> undoLocalEdits() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_undoLocalEdits(
          _handle, errorHandler);
    });
    return taskHandle.toFuture((_) {});
  }

  /// Cancelable version of [undoLocalEdits]. See that method for more
  /// information.
  CancelableOperation<void> undoLocalEditsCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ServiceFeatureTable_undoLocalEdits(
          _handle, errorHandler);
    });
    return taskHandle.toCancelableOperation((_) {});
  }
}

/// The various ways a query result can be ordered by.
enum SortOrder {
  /// Sort the query results in an ascending order.
  ascending,

  /// Sort the query results in a descending order.
  descending;

  factory SortOrder._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return ascending;
      case 1:
        return descending;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case ascending:
        return 0;
      case descending:
        return 1;
    }
  }
}

/// The various operators for spatially relating geometries.
enum SpatialRelationship {
  /// An unknown value. Normally the result when an error occurs.
  unknown,

  /// Relate operator.
  relate,

  /// Equals operator.
  equals,

  /// Disjoint operator.
  disjoint,

  /// Intersects operator.
  intersects,

  /// Touches operator.
  touches,

  /// Crosses operator.
  crosses,

  /// Within operator.
  within,

  /// Contains operator.
  contains,

  /// Overlaps operator.
  overlaps,

  /// Envelope intersects operator.
  envelopeIntersects,

  /// Index intersects operator.
  indexIntersects;

  factory SpatialRelationship._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 0:
        return relate;
      case 1:
        return equals;
      case 2:
        return disjoint;
      case 3:
        return intersects;
      case 4:
        return touches;
      case 5:
        return crosses;
      case 6:
        return within;
      case 7:
        return contains;
      case 8:
        return overlaps;
      case 9:
        return envelopeIntersects;
      case 10:
        return indexIntersects;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case relate:
        return 0;
      case equals:
        return 1;
      case disjoint:
        return 2;
      case intersects:
        return 3;
      case touches:
        return 4;
      case crosses:
        return 5;
      case within:
        return 6;
      case contains:
        return 7;
      case overlaps:
        return 8;
      case envelopeIntersects:
        return 9;
      case indexIntersects:
        return 10;
    }
  }
}

/// Represents a type used for defining a statistic to be queried for in the
/// table.
final class StatisticDefinition implements ffi.Finalizable {
  final RT_StatisticDefinitionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.StatisticDefinition_destroy.cast());

  static StatisticDefinition? _fromHandle(RT_StatisticDefinitionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return StatisticDefinition._withHandle(handle);
  }

  StatisticDefinition._withHandle(RT_StatisticDefinitionHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.StatisticDefinition_created(_handle);
    }
  }

  /// Creates a statistic definition. A statistic definition must specify a
  /// field name and statistic type. Optionally, you can provide a name for the
  /// output statistic result.
  ///
  /// Parameters:
  /// - `onFieldName` — The name of the field in the table containing values to
  /// be used for the statistic.
  /// - `statisticType` — The statistic to calculate.
  /// - `outputAlias` — The optional name for this statistic in the results.
  factory StatisticDefinition(
      {required String onFieldName,
      required StatisticType statisticType,
      String outputAlias = ''}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreOnFieldName = _CString(onFieldName);
    final coreOutputAlias = _CString(outputAlias);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticDefinition_createWith(
          coreOnFieldName.bytes,
          statisticType.coreValue,
          coreOutputAlias.bytes,
          errorHandler);
    });
    return StatisticDefinition._withHandle(handle);
  }

  /// The name of the field in the table containing values to be used for the
  /// statistic.
  String get onFieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticDefinition_getOnFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set onFieldName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticDefinition_setOnFieldName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The name for this statistic in the results.
  ///
  /// If an output alias is not specified, a default name that identifies the
  /// statistic type and input field name will be used for the result.
  String get outputAlias {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticDefinition_getOutputAlias(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set outputAlias(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticDefinition_setOutputAlias(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The statistic to calculate.
  StatisticType get statisticType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticDefinition_getStatisticType(
          _handle, errorHandler);
    });
    return StatisticType._fromCoreValue(coreValue);
  }

  set statisticType(StatisticType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticDefinition_setStatisticType(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// Represents a value within the [StatisticsQueryResult] iterator.
final class StatisticRecord implements ffi.Finalizable {
  final RT_StatisticRecordHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.StatisticRecord_destroy.cast());

  static StatisticRecord? _fromHandle(RT_StatisticRecordHandle handle) {
    if (handle == ffi.nullptr) return null;
    return StatisticRecord._withHandle(handle);
  }

  StatisticRecord._withHandle(RT_StatisticRecordHandle handle)
      : _group = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_StatisticRecord_getGroup(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _statistics = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_StatisticRecord_getStatistics(
                handle, errorHandler);
          });
          return dictionaryHandle.toUnmodifiableMap();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.StatisticRecord_created(_handle);
    }
  }

  /// The dictionary of GroupBy fields (if any were specified) and their
  /// associated values.
  ///
  /// The returned dictionary maps the GroupBy fields in the
  /// [StatisticsQueryParameters] to the group values. The type of value depends
  /// on the type of the GroupBy field.
  Map<String, dynamic> get group => _group.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>> _group;

  /// The dictionary of statistics values returned in the query result.
  Map<String, dynamic> get statistics => _statistics.value;

  final Memoized<_UnmodifiableDictionaryMap<String, dynamic>> _statistics;
}

/// An enumeration that represents the various statistics that can be calculated
/// for values in a field in a table.
enum StatisticType {
  /// Returns the average for all non-null values in a column.
  average,

  /// Returns the number of non-null values in a column.
  count,

  /// Returns the maximum value found within a column.
  maximum,

  /// Returns the minimum value found within a column.
  minimum,

  /// Returns the standard deviation of the values within a column.
  standardDeviation,

  /// Returns the sum of all non-null values within a column.
  sum,

  /// Returns the variance of the values within a column.
  variance;

  factory StatisticType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return average;
      case 1:
        return count;
      case 2:
        return maximum;
      case 3:
        return minimum;
      case 4:
        return standardDeviation;
      case 5:
        return sum;
      case 6:
        return variance;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case average:
        return 0;
      case count:
        return 1;
      case maximum:
        return 2;
      case minimum:
        return 3;
      case standardDeviation:
        return 4;
      case sum:
        return 5;
      case variance:
        return 6;
    }
  }
}

/// Parameters to perform a statistical query on a [FeatureTable].
///
/// Perform statistical analyses such as average, count, maximum, and standard
/// deviation on a feature table by defining a [StatisticType] on a
/// [StatisticDefinition]. Use a combination of attribute, spatial, and temporal
/// criteria to filter the features to be analyzed. If no filters are defined,
/// all features in the table are included in the statistical query. You can
/// also control how to group the results.
final class StatisticsQueryParameters implements ffi.Finalizable {
  final RT_StatisticsQueryParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.StatisticsQueryParameters_destroy.cast());

  static StatisticsQueryParameters? _fromHandle(
      RT_StatisticsQueryParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return StatisticsQueryParameters._withHandle(handle);
  }

  StatisticsQueryParameters._withHandle(
      RT_StatisticsQueryParametersHandle handle)
      : _groupByFieldNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_StatisticsQueryParameters_getGroupByFieldNames(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _orderByFields = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_StatisticsQueryParameters_getOrderByFields(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _statisticDefinitions = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_StatisticsQueryParameters_getStatisticDefinitions(
                    handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _timeExtent = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_StatisticsQueryParameters_getTimeExtent(
                handle, errorHandler);
          });
          return TimeExtent._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_StatisticsQueryParameters_setTimeExtent(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.StatisticsQueryParameters_created(_handle);
    }
  }

  /// Creates statistics query parameters using one or more
  /// [StatisticDefinition].
  ///
  /// Parameters:
  /// - `statisticDefinitions` — A [List] containing [StatisticDefinition]
  /// instances.
  factory StatisticsQueryParameters(
      {required List<StatisticDefinition> statisticDefinitions}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreStatisticDefinitions = statisticDefinitions.toMutableArray(
        valueType: _ElementType.statisticDefinition);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticsQueryParameters_createWith(
          coreStatisticDefinitions._handle, errorHandler);
    });
    final StatisticsQueryParameters object =
        StatisticsQueryParameters._withHandle(handle);
    object._statisticDefinitions.value.setCache(statisticDefinitions);
    return object;
  }

  /// The geometry used to filter the results.
  ///
  /// The geometry that (along with the
  /// [StatisticsQueryParameters.spatialRelationship]) defines features to be
  /// included in the statistical query.
  Geometry? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticsQueryParameters_getGeometry(
          _handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  set geometry(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticsQueryParameters_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The fields by which statistical query results will be grouped.
  List<String> get groupByFieldNames => _groupByFieldNames.value;

  final Memoized<_MutableArrayList<String>> _groupByFieldNames;

  /// The fields by which statistical query results will be ordered.
  ///
  /// Results can be sorted by one or more fields. Each [OrderBy] instance
  /// includes a field name and whether to sort by that field in ascending or
  /// descending order. If a service-based table is being queried it must
  /// support advanced queries.
  List<OrderBy> get orderByFields => _orderByFields.value;

  final Memoized<_MutableArrayList<OrderBy>> _orderByFields;

  /// The spatial relationship that (along with the
  /// [StatisticsQueryParameters.geometry]) defines features to be included in
  /// the query.
  ///
  /// The default spatial relationship is [SpatialRelationship.intersects].
  SpatialRelationship get spatialRelationship {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticsQueryParameters_getSpatialRelationship(
          _handle, errorHandler);
    });
    return SpatialRelationship._fromCoreValue(coreValue);
  }

  set spatialRelationship(SpatialRelationship value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticsQueryParameters_setSpatialRelationship(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The definition of statistics (input field, output name, statistic type) to
  /// include in the statistical query of a table.
  List<StatisticDefinition> get statisticDefinitions =>
      _statisticDefinitions.value;

  final Memoized<_MutableArrayList<StatisticDefinition>> _statisticDefinitions;

  /// The time extent that defines features to be included in the statistics
  /// query.
  ///
  /// A combination of attribute, spatial, and temporal criteria can be used to
  /// filter the features evaluated in a statistical query. If no filters are
  /// defined, all features in the table are included in the query.
  TimeExtent? get timeExtent => _timeExtent.value;

  set timeExtent(TimeExtent? value) => _timeExtent.value = value;

  final Memoized<TimeExtent?> _timeExtent;

  /// The attribute expression that defines features to be included in the
  /// statistics query.
  ///
  /// The where clause should follow standard SQL syntax similar to that
  /// discussed in the document
  /// [SQL reference for query expressions used in ArcGIS](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-940733A1-D6D1-4200-B290-24CA2E1056D4).
  ///
  /// If the where clause includes dates, they must be correctly formatted based
  /// on the geodatabase datasource used in the service. Refer to
  /// [Dates and time](https://pro.arcgis.com/en/pro-app/latest/help/mapping/navigation/sql-reference-for-elements-used-in-query-expressions.htm#GUID-85C03D85-F4A5-48FC-8E8C-3F79919430DB)
  /// for date formats expected by different data sources.
  ///
  /// [ArcGISFeatureTable] objects expect that any [FieldType.globalId] or
  /// [FieldType.guid] parameters in the where clause are formatted as:
  /// '{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}'. All characters are uppercase,
  /// wrapped in curly braces and surrounded by single quotes.
  String get whereClause {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticsQueryParameters_getWhereClause(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set whereClause(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_StatisticsQueryParameters_setWhereClause(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// Represents a type that contains the results of a statistics query.
final class StatisticsQueryResult implements ffi.Finalizable {
  final RT_StatisticsQueryResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.StatisticsQueryResult_destroy.cast());

  static StatisticsQueryResult? _fromHandle(
      RT_StatisticsQueryResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return StatisticsQueryResult._withHandle(handle);
  }

  StatisticsQueryResult._withHandle(RT_StatisticsQueryResultHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.StatisticsQueryResult_created(_handle);
    }
  }

  /// Returns the statistic records iterator.
  ///
  /// Return Value: An [Iterable] that returns [StatisticRecord].
  Iterable<StatisticRecord> statisticRecords() {
    final iteratorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_StatisticsQueryResult_iterator(
          _handle, errorHandler);
    });
    return iteratorHandle.toIterable();
  }
}

/// An object that describes a [GeodatabaseFeatureTable] to be created.
///
/// Creation of fields and tables is currently only supported on mobile
/// geodatabases, either created in ArcGIS Pro or via [Geodatabase.create].
final class TableDescription implements ffi.Finalizable {
  final RT_TableDescriptionHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.TableDescription_destroy.cast());

  static TableDescription? _fromHandle(RT_TableDescriptionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TableDescription._withHandle(handle);
  }

  TableDescription._withHandle(RT_TableDescriptionHandle handle)
      : _fieldDescriptions = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableDescription_getFieldDescriptions(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TableDescription_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TableDescription_setSpatialReference(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TableDescription_created(_handle);
    }
  }

  /// Creates a new table description object with the specified name.
  ///
  /// Parameters:
  /// - `name` — The table's name.
  factory TableDescription({required String name}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_createWithName(
          coreName.bytes, errorHandler);
    });
    return TableDescription._withHandle(handle);
  }

  /// Creates a new table description object with the specified name, spatial
  /// reference, and geometry type.
  ///
  /// Parameters:
  /// - `name` — The field's name.
  /// - `spatialReference` — The table's spatial reference.
  /// - `geometryType` — The table's geometry type.
  factory TableDescription.spatial(
      {required String name,
      required SpatialReference spatialReference,
      required GeometryType geometryType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreName = _CString(name);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_createSpatialWithName(
          coreName.bytes,
          spatialReference._handle,
          geometryType.coreValue,
          errorHandler);
    });
    return TableDescription._withHandle(handle);
  }

  /// A [List] of [FieldDescription] objects that represent the descriptions of
  /// the fields to be created.
  ///
  /// If no ObjectID field is provided, one will be automatically added.
  List<FieldDescription> get fieldDescriptions => _fieldDescriptions.value;

  final Memoized<_MutableArrayList<FieldDescription>> _fieldDescriptions;

  /// The type of geometry to be used by features in the table.
  ///
  /// The default geometry type is [GeometryType.unknown] and represents a
  /// non-spatial table. When setting a known geometry type, the spatial
  /// reference also needs to be specified via the
  /// [TableDescription.spatialReference] property.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  set geometryType(GeometryType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableDescription_setGeometryType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// True if the features should support attachments.
  ///
  /// The default value is false. Enabling attachments requires a GlobalID
  /// field.
  bool get hasAttachments {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_getHasAttachments(
          _handle, errorHandler);
    });
  }

  set hasAttachments(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableDescription_setHasAttachments(
          _handle, value, errorHandler);
    });
  }

  /// True if the feature geometries should contain M values.
  ///
  /// The default value is false.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_getHasM(_handle, errorHandler);
    });
  }

  set hasM(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableDescription_setHasM(_handle, value, errorHandler);
    });
  }

  /// True if the feature geometries should contain Z values.
  ///
  /// The default value is false.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_getHasZ(_handle, errorHandler);
    });
  }

  set hasZ(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableDescription_setHasZ(_handle, value, errorHandler);
    });
  }

  /// The spatial reference to be used by feature geometries in the table.
  ///
  /// The default spatial reference is null and represents a non-spatial table.
  /// When setting to a non-null spatial reference, the geometry type also needs
  /// to be specified via the [TableDescription.geometryType] property.
  SpatialReference? get spatialReference => _spatialReference.value;

  set spatialReference(SpatialReference? value) =>
      _spatialReference.value = value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The table's name.
  ///
  /// The table name must be non-empty, consist only of alphanumeric characters
  /// and underscores, and cannot start with a number or an underscore.
  String get tableName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TableDescription_getTableName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set tableName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TableDescription_setTableName(
          _handle, coreValue.bytes, errorHandler);
    });
  }
}

/// A transportation network dataset of a map or scene stored in a mobile map or
/// scene package.
///
/// A transportation network, such as a street, pedestrian, or railroad network,
/// models networks that typically permit travel in both directions. Map and
/// scene authors can use ArcGIS Pro to create a mobile map or scene package
/// that includes transportation networks. For more information, see
/// [Create a mobile map package](https://pro.arcgis.com/en/pro-app/latest/tool-reference/data-management/create-mobile-map-package.htm)
/// or
/// [Author a mobile scene package](https://pro.arcgis.com/en/pro-app/latest/help/mapping/map-authoring/author-for-arcgis-runtime.htm).
///
/// If you create a map or scene from one of these packages, you can obtain its
/// [TransportationNetworkDataset] from the read-only collection of
/// [GeoModel.transportationNetworks]. To perform a route, closest facility, or
/// service area network analysis on the transportation network, you construct
/// the respective [RouteTask], [ClosestFacilityTask], or [ServiceAreaTask],
/// using this [TransportationNetworkDataset].
final class TransportationNetworkDataset
    implements GeodatabaseDataset, ffi.Finalizable {
  final RT_TransportationNetworkDatasetHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.TransportationNetworkDataset_destroy.cast());

  static TransportationNetworkDataset? _fromHandle(
      RT_TransportationNetworkDatasetHandle handle) {
    if (handle == ffi.nullptr) return null;
    return TransportationNetworkDataset._withHandle(handle);
  }

  TransportationNetworkDataset._withHandle(
      RT_TransportationNetworkDatasetHandle handle)
      : _geodatabase = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TransportationNetworkDataset_getGeodatabase(
                handle, errorHandler);
          });
          return Geodatabase._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.TransportationNetworkDataset_created(_handle);
    }
  }

  /// Alias of transportation network dataset.
  String get alias {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TransportationNetworkDataset_getAlias(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  Geodatabase? get geodatabase => _geodatabase.value;

  final Memoized<Geodatabase?> _geodatabase;

  @override
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TransportationNetworkDataset_getName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  @override
  GeodatabaseDatasetType get type {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TransportationNetworkDataset_getType(
          _handle, errorHandler);
    });
    return GeodatabaseDatasetType._fromCoreValue(coreValue);
  }
}
