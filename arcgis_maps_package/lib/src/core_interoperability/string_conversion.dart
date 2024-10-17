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

part of '../../arcgis_maps.dart';

class _CString implements ffi.Finalizable {
  late final ffi.Pointer<ffi.Char> bytes;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.nativeFree.cast());

  _CString(String string) {
    final units = utf8.encode(string);
    final result = malloc<ffi.Uint8>(units.length + 1);
    final nativeString = result.asTypedList(units.length + 1);
    nativeString.setAll(0, units);
    nativeString[units.length] = 0;
    bytes = result.cast();
    _nativeFinalizer.attach(this, bytes.cast(), externalSize: units.length + 1);
  }
}

extension on RT_StringHandle {
  String toDartString() {
    // Strings are non-nullable by convention. So if core gives us null,
    // interpret that as an empty array.
    if (this == ffi.nullptr) {
      return '';
    }

    final cString = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_String_cStr(this, errorHandler);
    });
    final string = cString.cast<Utf8>().toDartString();

    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_String_destroy(this, errorHandler);
    });

    return string;
  }
}
