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

final class _ArrayList<E extends Object> extends ListBase<E> {
  final _Array<E> _array;
  final List<E?> _cache;

  _ArrayList(_Array<E> array)
      : _array = array,
        _cache = List.filled(array.size, null);

  @override
  E operator [](int index) {
    RangeError.checkValueInInterval(index, 0, length - 1, 'index');

    final value = _cache[index];
    if (value != null) {
      return value;
    }

    final coreValue = _array.at(position: index);
    if (coreValue == null) {
      throw StateError('Underlying element is null');
    }
    _cache[index] = coreValue;
    return coreValue;
  }

  @override
  void operator []=(int index, E value) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  int get length => _cache.length;

  @override
  set length(int length) {
    throw UnsupportedError('Cannot change the length of an unmodifiable list');
  }

  @override
  void add(E value) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  bool remove(Object? value) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void insert(int index, E element) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  E removeAt(int index) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  E removeLast() {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void fillRange(int start, int end, [E? fill]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// Sets the cache to the given values.
  ///
  /// Use when the values of the mutable array are known ahead of time, such as
  /// when they are provided via a constructor parameter.
  void setCache(Iterable<E> values) {
    assert(values.length <= _cache.length);
    _cache.setAll(0, values);
  }
}
