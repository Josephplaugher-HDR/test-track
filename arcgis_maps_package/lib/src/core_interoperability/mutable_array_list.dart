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

class _MutableArrayList<E extends Object> extends ListBase<E> {
  final _MutableArray<E> _mutableArray;
  final List<E?> _cache;

  _MutableArrayList(_MutableArray<E> mutableArray)
      : _mutableArray = mutableArray,
        _cache = List.filled(mutableArray.size, null, growable: true);

  @override
  E operator [](int index) {
    RangeError.checkValueInInterval(index, 0, length - 1, 'index');

    final value = _cache[index];
    if (value != null) {
      return value;
    }

    final coreValue = _mutableArray.at(index);
    if (coreValue == null) {
      throw StateError('Underlying element is null');
    }
    _cache[index] = coreValue;
    return coreValue;
  }

  @override
  void operator []=(int index, E value) {
    RangeError.checkValueInInterval(index, 0, length - 1, 'index');
    _mutableArray.remove(index);
    _mutableArray.insert(index, value);
    _cache[index] = value;
  }

  @override
  int get length => _cache.length;

  @override
  set length(int length) {
    throw UnsupportedError('Elements cannot be null');
  }

  @override
  void add(E value) {
    final index = _mutableArray.add(value);
    _cache.insert(index, value);
  }

  @override
  void addAll(Iterable<E> iterable) {
    if (iterable is _MutableArrayList<E>) {
      final expectedSize = _cache.length + iterable._cache.length;
      final newSize = _mutableArray.addArray(iterable._mutableArray);
      assert(newSize == expectedSize);
      for (final element in iterable) {
        _cache.add(element);
      }
    } else {
      for (final element in iterable) {
        add(element);
      }
    }
  }

  @override
  bool remove(Object? value) {
    final index = indexOf(value);
    if (index == -1) {
      return false;
    }
    removeAt(index);
    return true;
  }

  @override
  void clear() {
    _mutableArray.removeAll();
    _cache.clear();
  }

  @override
  void insert(int index, E element) {
    RangeError.checkValueInInterval(index, 0, length, 'index');
    _mutableArray.insert(index, element);
    _cache.insert(index, element);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError('Use insert()');
  }

  @override
  E removeAt(int index) {
    RangeError.checkValueInInterval(index, 0, length - 1, 'index');
    final result = this[index];
    _mutableArray.remove(index);
    _cache.removeAt(index);
    return result;
  }

  @override
  E removeLast() {
    if (length == 0) {
      throw StateError('No element');
    }
    return removeAt(length - 1);
  }

  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Use removeAt()');
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError('Use removeAt()');
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError('Use removeAt()');
  }

  @override
  void fillRange(int start, int end, [E? fill]) {
    throw UnsupportedError('Duplicates not allowed');
  }

  /// Sets the cache to the given values.
  ///
  /// Use when the values of the mutable array are known ahead of time, such as
  /// when they are provided via a constructor parameter.
  void setCache(Iterable<E> values) {
    assert(values.length <= _cache.length);
    _cache.setAll(0, values);
  }

  void resetCache() {
    _cache.fillRange(0, _cache.length);
  }
}
