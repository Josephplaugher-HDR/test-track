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

import 'arcgis_maps_bindings_generated.dart';
import 'runtimecore.dart';
import 'dart:ffi' as ffi;
import 'dart:io';

const String _libName = 'arcgis_maps_ffi';

/// The dynamic library in which the symbols for [ArcGISMapsBindings] can be found.
final ffi.DynamicLibrary _bindingsLibrary = () {
  // runtimecore must be initialized before bindings
  runtimecore;

  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    if (Platform.isMacOS) {
      return ffi.DynamicLibrary.open(
          'arcgis_maps_core/macos/arcgis_maps_ffi.xcframework/macos-arm64_x86_64/arcgis_maps_ffi.framework/arcgis_maps_ffi');
    }
  }

  if (Platform.isMacOS) {
    return ffi.DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isIOS) {
    return ffi.DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return ffi.DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return ffi.DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in the bindings library.
final ArcGISMapsBindings bindings = () {
  final bindings = ArcGISMapsBindings(_bindingsLibrary);

  final dartApiStatus =
      bindings.InitDartApiDL(ffi.NativeApi.initializeApiDLData);
  if (dartApiStatus != 0) {
    throw UnsupportedError('Could not initialize Dart API: $dartApiStatus');
  }

  return bindings;
}();
