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

final _emptyData = Uint8List(0);

extension on _ByteArray {
  RT_ByteArray getByteArray() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ByteArray_getByteArray(_handle, errorHandler);
    });
  }

  Uint8List toDartList() =>
      size == 0 ? _emptyData : getByteArray().toDartList();
}

extension on RT_ByteArray {
  /// Returns a list with the bytes in this byte array.
  Uint8List toDartList() {
    final dataList = data.asTypedList(size);
    // Return a copy of the data list
    return Uint8List.fromList(dataList);
  }
}

extension on Uint8List {
  /// Returns a byte array with the bytes in this list.
  _ByteArrayWrapper toByteArrayWrapper() => _ByteArrayWrapper(this);
}

/// A memory managed Uint8 pointer.
final class _Uint8PointerWrapper implements ffi.Finalizable {
  static final _nativeFinalizer = ffi.NativeFinalizer(malloc.nativeFree);

  final ffi.Pointer<ffi.Uint8> data;
  final int count;

  /// Creates a pointer to an array of bytes in memory.
  _Uint8PointerWrapper.fromList(Uint8List list)
      : data = malloc.allocate<ffi.Uint8>(list.length),
        count = list.length {
    for (int index = 0; index < list.length; index++) {
      data[index] = list[index];
    }
    _nativeFinalizer.attach(this, data.cast(), externalSize: list.length);
  }
}

final class _ByteArrayWrapper {
  final _Uint8PointerWrapper? _data;
  late final _ByteArrayStruct _byteArray;

  RT_ByteArray get ref => _byteArray.ref;

  _ByteArrayWrapper(Uint8List list)
      : _data = _Uint8PointerWrapper.fromList(list) {
    _byteArray = _ByteArrayStruct(
      data: _data!.data,
      size: _data!.count,
    );
  }

  _ByteArrayWrapper.empty() : _data = null {
    _byteArray = _ByteArrayStruct.empty();
  }
}
