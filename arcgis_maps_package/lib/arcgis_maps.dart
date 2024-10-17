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

/// ArcGIS Maps SDK for Flutter
///
/// Beta notice:
///
/// During the beta period, please be aware that only a portion of the functionality
/// you can find in other ArcGIS SDKs has been made available in the SDK for Flutter. You
/// may find references to classes, methods, or properties that are not yet implemented.
/// We are working to expand the feature set. Please visit the
/// [Early Adopter](https://earlyadopter.esri.com/) website to provide feedback on what
/// functional areas are necessary for your use case, which will help us prioritize them.
///
/// Basic usage:
/// ```dart
/// class BasicExample extends StatelessWidget {
///   const BasicExample({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: ArcGISMapView(
///         controllerProvider: () {
///           return ArcGISMapView.createController()
///            ..arcGISMap = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISStreets);
///         },
///         onTap: (localPosition) => print(localPosition),
///       ),
///     );
///   }
/// }
/// ```
/// Start by adding an [ArcGISMapView] to your widget tree. Supply callbacks to handle
/// events. Then, configure the [ArcGISMapViewController] by setting the
/// [ArcGISMapViewController.arcGISMap] and other properties.
///
/// The [ArcGISMapView] Widget can only be used within a Widget that has a bounded size.
/// Using it with unbounded size will cause the application to throw an exception. For
/// example, to use an [ArcGISMapView] within a [Column] (which would give it unbounded
/// size), you could wrap the [ArcGISMapView] in an [Expanded] to provide it proper
/// bounds.
///
/// Remember to supply your apiKey via [ArcGISEnvironment.apiKey].
library arcgis_maps;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:async/async.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_date;
import 'package:intl/intl.dart' as intl;
import 'package:location/location.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:url_launcher/url_launcher.dart';

import 'src/ffi/arcgis_maps_bindings_generated.dart';
import 'src/ffi/arcgis_maps_ffi.dart';
import 'src/ffi/runtimecore.dart';
import 'src/ffi/runtimecore_bindings_generated.dart';
import 'src/handle_tracker.dart';
import 'src/logger.dart';
import 'src/memoized.dart';

part 'src/arcgis_authentication_challenge_handler.dart';
part 'src/arcgis_environment.dart';
part 'src/arcgis_environment_callback_receiver.dart';
part 'src/arcgis_exception.dart';
part 'src/arcgis_map_view.dart';
part 'src/arcgis_map_view_interaction_options.dart';
part 'src/attribution_bar_widget.dart';
part 'src/authentication_challenge_queue.dart';
part 'src/authentication_oauth_handler.dart';
part 'src/byte_array_buffer.dart';
part 'src/callback_relay.dart';
part 'src/client_reference_manager.dart';
part 'src/core_interoperability/array_list.dart';
part 'src/core_interoperability/byte_array_conversion.dart';
part 'src/core_interoperability/color_conversion.dart';
part 'src/core_interoperability/coordinate_conversion.dart';
part 'src/core_interoperability/date_time_conversion.dart';
part 'src/core_interoperability/device_orientation_conversion.dart';
part 'src/core_interoperability/dictionary_conversion.dart';
part 'src/core_interoperability/dictionary_map.dart';
part 'src/core_interoperability/element_conversion.dart';
part 'src/core_interoperability/error_conversion.dart';
part 'src/core_interoperability/future_conversion.dart';
part 'src/core_interoperability/instance_cache.dart';
part 'src/core_interoperability/iterable_for_arcgis_iterator.dart';
part 'src/core_interoperability/iterator_conversion.dart';
part 'src/core_interoperability/list_conversion.dart';
part 'src/core_interoperability/mutable_array_list.dart';
part 'src/core_interoperability/runtimecore_extension.dart';
part 'src/core_interoperability/string_conversion.dart';
part 'src/core_interoperability/unmodifiable_dictionary_map.dart';
part 'src/core_interoperability/uri_conversion.dart';
part 'src/error_handler.dart';
part 'src/exit_handler.dart';
part 'src/ffi/ffi_generated.dart';
part 'src/generated/arc_gis_runtime.dart';
part 'src/generated/arc_gis_runtime/arc_gis_services.dart';
part 'src/generated/arc_gis_runtime/authentication.dart';
part 'src/generated/arc_gis_runtime/data.dart';
part 'src/generated/arc_gis_runtime/geometry.dart';
part 'src/generated/arc_gis_runtime/location.dart';
part 'src/generated/arc_gis_runtime/map_view.dart';
part 'src/generated/arc_gis_runtime/mapping.dart';
part 'src/generated/arc_gis_runtime/mapping/layers.dart';
part 'src/generated/arc_gis_runtime/mapping/layers/vector_tiles.dart';
part 'src/generated/arc_gis_runtime/mapping/reduction.dart';
part 'src/generated/arc_gis_runtime/mapping/symbology.dart';
part 'src/generated/arc_gis_runtime/portal.dart';
part 'src/generated/arc_gis_runtime/security.dart';
part 'src/generated/arc_gis_runtime/tasks.dart';
part 'src/generated/arc_gis_runtime/tasks/export_vector_tiles.dart';
part 'src/generated/arc_gis_runtime/tasks/geocode.dart';
part 'src/generated/arc_gis_runtime/tasks/geodatabase.dart';
part 'src/generated/arc_gis_runtime/tasks/network_analysis.dart';
part 'src/generated/arc_gis_runtime/tasks/offline_map_task.dart';
part 'src/generated/arc_gis_runtime/tasks/tile_cache.dart';
part 'src/generated/standard.dart';
part 'src/interaction_options.dart';
part 'src/iterator_for_arcgis_iterator.dart';
part 'src/json_serializable.dart';
part 'src/loadable.dart';
part 'src/location/location_authorization_extension.dart';
part 'src/location/location_data_extension.dart';
part 'src/location/system_location_data_source.dart';
part 'src/map_gesture_handler.dart';
part 'src/mapping/map_view/location_display_extension.dart';
part 'src/mapping/url_utils.dart';
part 'src/network/arcgis_cache_interceptor.dart';
part 'src/network/arcgis_http_client.dart';
part 'src/network/request_cancel_token.dart';
part 'src/network/request_context.dart';
part 'src/network/request_info.dart';
part 'src/network/response_info.dart';
part 'src/network/user_agent.dart';
part 'src/portal/portal_connection.dart';
part 'src/portal/portal_group.dart';
part 'src/portal/portal_helper.dart';
part 'src/portal/portal_info_helper.dart';
part 'src/portal/portal_query_parameters.dart';
part 'src/portal/portal_query_result_set.dart';
part 'src/portal/portal_query_sort_order.dart';
part 'src/portal/portal_user.dart';
part 'src/portal/rest_loader.dart';
part 'src/portal/sharing.dart';
part 'src/synchronous_responder.dart';
part 'src/test/test_extensions.dart';
part 'src/view_metrics.dart';
