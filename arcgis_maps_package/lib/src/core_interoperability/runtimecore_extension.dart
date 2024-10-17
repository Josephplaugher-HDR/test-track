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

// ignore_for_file: non_constant_identifier_names

part of '../../arcgis_maps.dart';

extension on RuntimecoreBindings {
  RT_TaskHandle RT_ArcGISFeatureTable_queryRelatedFeatureCountCombined(
    RT_ArcGISFeatureTableHandle this_handle,
    RT_ArcGISFeatureHandle feature,
    RT_RelatedQueryParametersHandle parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (parameters != ffi.nullptr) {
      return RT_ArcGISFeatureTable_queryRelatedFeatureCountWithParameters(
        this_handle,
        feature,
        parameters,
        error_handler,
      );
    } else {
      return RT_ArcGISFeatureTable_queryRelatedFeatureCount(
        this_handle,
        feature,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_ArcGISFeatureTable_queryRelatedFeaturesCombined(
    RT_ArcGISFeatureTableHandle this_handle,
    RT_ArcGISFeatureHandle feature,
    RT_RelatedQueryParametersHandle parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (parameters != ffi.nullptr) {
      return RT_ArcGISFeatureTable_queryRelatedFeaturesWithParameters(
        this_handle,
        feature,
        parameters,
        error_handler,
      );
    } else {
      return RT_ArcGISFeatureTable_queryRelatedFeatures(
        this_handle,
        feature,
        error_handler,
      );
    }
  }

  RT_ArcGISMapImageSublayerHandle RT_ArcGISMapImageSublayer_createCombined(
    int id,
    RT_SublayerSourceHandle sublayer_source,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (sublayer_source != ffi.nullptr) {
      return RT_ArcGISMapImageSublayer_createWithIdAndSublayerSource(
        id,
        sublayer_source,
        error_handler,
      );
    } else {
      return RT_ArcGISMapImageSublayer_createWithId(
        id,
        error_handler,
      );
    }
  }

  RT_BasemapHandle RT_Basemap_createWithStyleCombined(
    int basemap_style,
    RT_BasemapStyleParametersHandle basemap_style_parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (basemap_style_parameters != ffi.nullptr) {
      return RT_Basemap_createWithStyleAndParameters(
        basemap_style,
        basemap_style_parameters,
        error_handler,
      );
    } else {
      return RT_Basemap_createWithStyle(
        basemap_style,
        error_handler,
      );
    }
  }

  RT_BookmarkHandle RT_Bookmark_createCombined(
    ffi.Pointer<ffi.Char> name,
    RT_ViewpointHandle viewpoint,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (viewpoint != ffi.nullptr) {
      return RT_Bookmark_createWith(
        name,
        viewpoint,
        error_handler,
      );
    } else {
      final handle = RT_Bookmark_create(
        error_handler,
      );
      if (handle != ffi.nullptr) {
        RT_Bookmark_setName(
          handle,
          name,
          error_handler,
        );
      }
      return handle;
    }
  }

  RT_CodedValueDomainDescriptionHandle
      RT_CodedValueDomainDescription_createCorrectingFieldType(
    ffi.Pointer<ffi.Char> name,
    int field_type,
    RT_ArrayHandle values,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (_fieldTypeNeedsCorrection(field_type)) {
      final correctedArray =
          _correctedCodedValueDescriptionArray(values, field_type);
      return RT_CodedValueDomainDescription_createWithNameTypeAndValues(
        name,
        field_type,
        correctedArray._handle,
        error_handler,
      );
    } else {
      return RT_CodedValueDomainDescription_createWithNameTypeAndValues(
        name,
        field_type,
        values,
        error_handler,
      );
    }
  }

  RT_DownloadPreplannedOfflineMapParametersHandle
      RT_DownloadPreplannedOfflineMapParameters_createCombined(
    RT_PreplannedMapAreaHandle preplanned_map_area,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (preplanned_map_area != ffi.nullptr) {
      return RT_DownloadPreplannedOfflineMapParameters_createWithPreplannedMapArea(
        preplanned_map_area,
        error_handler,
      );
    } else {
      return RT_DownloadPreplannedOfflineMapParameters_create(
        error_handler,
      );
    }
  }

  RT_EnvelopeHandle RT_Envelope_createWithCenterPointCombined(
    RT_PointHandle center,
    double width,
    double height,
    double? depth,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (depth != null) {
      return RT_Envelope_createWithCenterPointAndDepth(
        center,
        width,
        height,
        depth,
        error_handler,
      );
    } else {
      return RT_Envelope_createWithCenterPoint(
        center,
        width,
        height,
        error_handler,
      );
    }
  }

  double? RT_Envelope_getMMaxNullable(
    RT_EnvelopeHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasM(this_handle, error_handler)) {
      return RT_Envelope_getMMax(this_handle, error_handler);
    } else {
      return null;
    }
  }

  double? RT_Envelope_getMMinNullable(
    RT_EnvelopeHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasM(this_handle, error_handler)) {
      return RT_Envelope_getMMin(this_handle, error_handler);
    } else {
      return null;
    }
  }

  double? RT_Envelope_getZMaxNullable(
    RT_EnvelopeHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasZ(this_handle, error_handler)) {
      return RT_Envelope_getZMax(this_handle, error_handler);
    } else {
      return null;
    }
  }

  double? RT_Envelope_getZMinNullable(
    RT_EnvelopeHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasZ(this_handle, error_handler)) {
      return RT_Envelope_getZMin(this_handle, error_handler);
    } else {
      return null;
    }
  }

  RT_EnvelopeBuilderHandle RT_EnvelopeBuilder_createFromCenterPointCombined(
    RT_PointHandle center,
    double width,
    double height,
    double? depth,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (depth != null) {
      return RT_EnvelopeBuilder_createFromCenterPointAndDepth(
        center,
        width,
        height,
        depth,
        error_handler,
      );
    } else {
      return RT_EnvelopeBuilder_createFromCenterPoint(
        center,
        width,
        height,
        error_handler,
      );
    }
  }

  void RT_EnvelopeBuilder_expandCombined(
    RT_EnvelopeBuilderHandle this_handle,
    double factor,
    RT_PointHandle anchor,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (anchor != ffi.nullptr) {
      return RT_EnvelopeBuilder_expandAtAnchor(
        this_handle,
        anchor,
        factor,
        error_handler,
      );
    } else {
      return RT_EnvelopeBuilder_expand(
        this_handle,
        factor,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_GeoView_identifyGraphicsOverlayWithMaxResultsNullable(
    RT_GeoViewHandle this_handle,
    RT_GraphicsOverlayHandle graphics_overlay,
    RT_Coordinate2D screen_point,
    double tolerance,
    int? maximum_results,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    return RT_GeoView_identifyGraphicsOverlayWithMaxResults(
      this_handle,
      graphics_overlay,
      screen_point,
      tolerance,
      false,
      maximum_results ?? -1,
      error_handler,
    );
  }

  RT_TaskHandle RT_GeoView_identifyGraphicsOverlaysWithMaxResultsNullable(
    RT_GeoViewHandle this_handle,
    RT_Coordinate2D screen_point,
    double tolerance,
    int? maximum_results_per_overlay,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    return RT_GeoView_identifyGraphicsOverlaysWithMaxResults(
      this_handle,
      screen_point,
      tolerance,
      false,
      maximum_results_per_overlay ?? -1,
      error_handler,
    );
  }

  RT_TaskHandle RT_GeoView_identifyLayerWithMaxResultsNullable(
    RT_GeoViewHandle this_handle,
    RT_LayerHandle layer,
    RT_Coordinate2D screen_point,
    double tolerance,
    int? maximum_results,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    return RT_GeoView_identifyLayerWithMaxResults(
      this_handle,
      layer,
      screen_point,
      tolerance,
      false,
      maximum_results ?? -1,
      error_handler,
    );
  }

  RT_TaskHandle RT_GeoView_identifyLayersWithMaxResultsNullable(
    RT_GeoViewHandle this_handle,
    RT_Coordinate2D screen_point,
    double tolerance,
    int? maximum_results_per_layer,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    return RT_GeoView_identifyLayersWithMaxResults(
      this_handle,
      screen_point,
      tolerance,
      false,
      maximum_results_per_layer ?? -1,
      error_handler,
    );
  }

  RT_TaskHandle RT_GeoView_setViewpointAsyncCombined(
    RT_GeoViewHandle this_handle,
    RT_ViewpointHandle viewpoint,
    double? duration_seconds,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (duration_seconds != null) {
      return RT_GeoView_setViewpointWithDurationAsync(
        this_handle,
        viewpoint,
        duration_seconds,
        error_handler,
      );
    } else {
      return RT_GeoView_setViewpointAsync(
        this_handle,
        viewpoint,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_LocatorTask_reverseGeocodeCombined(
    RT_LocatorTaskHandle this_handle,
    RT_PointHandle location,
    RT_ReverseGeocodeParametersHandle parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (parameters != ffi.nullptr) {
      return RT_LocatorTask_reverseGeocodeWithParameters(
        this_handle,
        location,
        parameters,
        error_handler,
      );
    } else {
      return RT_LocatorTask_reverseGeocode(
        this_handle,
        location,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_LocatorTask_suggestCombined(
    RT_LocatorTaskHandle this_handle,
    ffi.Pointer<ffi.Char> search_text,
    RT_SuggestParametersHandle parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (parameters != ffi.nullptr) {
      return RT_LocatorTask_suggestWithParameters(
        this_handle,
        search_text,
        parameters,
        error_handler,
      );
    } else {
      return RT_LocatorTask_suggest(
        this_handle,
        search_text,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_MapView_setViewpointCenterCombined(
    RT_MapViewHandle this_handle,
    RT_PointHandle center,
    double? scale,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (scale != null) {
      return RT_MapView_setViewpointCenterWithScaleAsync(
        this_handle,
        center,
        scale,
        error_handler,
      );
    } else {
      return RT_MapView_setViewpointCenterAsync(
        this_handle,
        center,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_MapView_setViewpointGeometryCombined(
    RT_MapViewHandle this_handle,
    RT_GeometryHandle bounding_geometry,
    double? padding_in_DIPs,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (padding_in_DIPs != null) {
      return RT_MapView_setViewpointGeometryWithPaddingAsync(
        this_handle,
        bounding_geometry,
        padding_in_DIPs,
        error_handler,
      );
    } else {
      return RT_MapView_setViewpointGeometryAsync(
        this_handle,
        bounding_geometry,
        error_handler,
      );
    }
  }

  RT_GenerateOfflineMapJobHandle RT_OfflineMapTask_generateOfflineMapCombined(
    RT_OfflineMapTaskHandle this_handle,
    RT_GenerateOfflineMapParametersHandle parameters,
    ffi.Pointer<ffi.Char> download_directory_path,
    RT_GenerateOfflineMapParameterOverridesHandle overrides,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (overrides != ffi.nullptr) {
      return RT_OfflineMapTask_generateOfflineMapWithParametersDownloadDirectoryParameterOverrides(
        this_handle,
        parameters,
        download_directory_path,
        overrides,
        error_handler,
      );
    } else {
      return RT_OfflineMapTask_generateOfflineMap(
        this_handle,
        parameters,
        download_directory_path,
        error_handler,
      );
    }
  }

  RT_PointHandle RT_Point_createCombined(
    double x,
    double y,
    double? z,
    double? m,
    RT_SpatialReferenceHandle spatial_reference,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (z != null && m != null) {
      return RT_Point_createWithZMSpatialReference(
        x,
        y,
        z,
        m,
        spatial_reference,
        error_handler,
      );
    } else if (z != null) {
      return RT_Point_createWithXYZSpatialReference(
        x,
        y,
        z,
        spatial_reference,
        error_handler,
      );
    } else if (m != null) {
      return RT_Point_createWithMSpatialReference(
        x,
        y,
        m,
        spatial_reference,
        error_handler,
      );
    } else {
      return RT_Point_createWithXYSpatialReference(
        x,
        y,
        spatial_reference,
        error_handler,
      );
    }
  }

  double? RT_Point_getMNullable(
    RT_GeometryHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasM(this_handle, error_handler)) {
      return RT_Point_getM(this_handle, error_handler);
    } else {
      return null;
    }
  }

  double? RT_Point_getZNullable(
    RT_GeometryHandle this_handle,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (RT_Geometry_getHasZ(this_handle, error_handler)) {
      return RT_Point_getZ(this_handle, error_handler);
    } else {
      return null;
    }
  }

  RT_RangeDomainDescriptionHandle
      RT_RangeDomainDescription_createCorrectingFieldType(
    ffi.Pointer<ffi.Char> name,
    int field_type,
    RT_ElementHandle min_value,
    RT_ElementHandle max_value,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    min_value.correctFieldType(field_type);
    max_value.correctFieldType(field_type);
    return RT_RangeDomainDescription_createWithNameTypeAndRange(
      name,
      field_type,
      min_value,
      max_value,
      error_handler,
    );
  }

  void RT_RangeDomainDescription_setMaxValueCorrectingFieldType(
    RT_RangeDomainDescriptionHandle this_handle,
    RT_ElementHandle max_value,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    int fieldTypeCoreValue =
        RT_DomainDescription_getFieldType(this_handle, ffi.nullptr);
    max_value.correctFieldType(fieldTypeCoreValue);
    return RT_RangeDomainDescription_setMaxValue(
      this_handle,
      max_value,
      error_handler,
    );
  }

  void RT_RangeDomainDescription_setMinValueCorrectingFieldType(
    RT_RangeDomainDescriptionHandle this_handle,
    RT_ElementHandle min_value,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    int fieldTypeCoreValue =
        RT_DomainDescription_getFieldType(this_handle, ffi.nullptr);
    min_value.correctFieldType(fieldTypeCoreValue);
    return RT_RangeDomainDescription_setMinValue(
      this_handle,
      min_value,
      error_handler,
    );
  }

  void RT_SimulatedLocationDataSource_setLocationsWithPolylineCombined(
    RT_SimulatedLocationDataSourceHandle this_handle,
    RT_PolylineHandle polyline,
    RT_SimulationParametersHandle parameters,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (parameters != ffi.nullptr) {
      return RT_SimulatedLocationDataSource_setLocationsWithPolylineAndParameters(
        this_handle,
        polyline,
        parameters,
        error_handler,
      );
    } else {
      return RT_SimulatedLocationDataSource_setLocationsWithPolyline(
        this_handle,
        polyline,
        error_handler,
      );
    }
  }

  RT_SimulationParametersHandle RT_SimulationParameters_createCombined(
    RT_DateTimeHandle start_time,
    double velocity,
    double horizontal_accuracy,
    double vertical_accuracy,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    final now = (start_time == ffi.nullptr) ? DateTime.now().toArcGIS() : null;

    return RT_SimulationParameters_createWithArguments(
      now?._handle ?? start_time,
      velocity,
      horizontal_accuracy,
      vertical_accuracy,
      error_handler,
    );
  }

  RT_TaskHandle RT_Symbol_createSwatchCombined(
    RT_SymbolHandle this_handle,
    double screen_scale,
    Size? size,
    RT_ColorHandle background_color,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    if (size != null) {
      return runtimecore.RT_Symbol_createSwatchWithImageSizeAsync(
        this_handle,
        size.width,
        size.height,
        screen_scale,
        background_color,
        error_handler,
      );
    } else {
      return runtimecore.RT_Symbol_createSwatchAsync(
        this_handle,
        background_color,
        screen_scale,
        error_handler,
      );
    }
  }

  RT_TaskHandle RT_Symbol_createSwatchWithGeometryCombined(
    RT_SymbolHandle this_handle,
    double screen_scale,
    Size size,
    RT_GeometryHandle geometry,
    RT_ColorHandle background_color,
    ffi.Pointer<RT_ErrorHandler> error_handler,
  ) {
    return RT_Symbol_createSwatchWithGeometryAsync(
      this_handle,
      size.width,
      size.height,
      screen_scale,
      background_color,
      geometry,
      error_handler,
    );
  }
}
