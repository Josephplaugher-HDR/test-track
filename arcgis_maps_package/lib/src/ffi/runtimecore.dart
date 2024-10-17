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

import 'runtimecore_bindings_generated.dart';
import 'dart:ffi' as ffi;
import 'dart:io';

const String _runtimecoreName = 'runtimecore';

/// The dynamic library in which the symbols for [RuntimecoreBindings] can be found.
final ffi.DynamicLibrary _runtimecoreLibrary = () {
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    if (Platform.isMacOS) {
      return ffi.DynamicLibrary.open(
          'arcgis_maps_core/macos/lib$_runtimecoreName.dylib');
    }
  }

  if (Platform.isMacOS) {
    return ffi.DynamicLibrary.open('lib$_runtimecoreName.dylib');
  }
  if (Platform.isIOS) {
    final iosFrameworkName =
        _runtimecoreName[0].toUpperCase() + _runtimecoreName.substring(1);
    return ffi.DynamicLibrary.open(
        '$iosFrameworkName.framework/$iosFrameworkName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return ffi.DynamicLibrary.open('lib$_runtimecoreName.so');
  }
  if (Platform.isWindows) {
    return ffi.DynamicLibrary.open('$_runtimecoreName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in the runtimecore library.
final RuntimecoreBindings runtimecore = () {
  final bindings = RuntimecoreBindings(_runtimecoreLibrary);
  return bindings;
}();
