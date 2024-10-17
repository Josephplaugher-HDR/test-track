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

part of '../../../arcgis_maps.dart';

class _UnmodifiableDictionaryMap<K extends Object, V> extends MapBase<K, V> {
  final _Dictionary<K, V> _dictionary;
  final _cache = HashMap<K, V?>();

  _UnmodifiableDictionaryMap(_Dictionary<K, V> dictionary)
      : _dictionary = dictionary;

  /// Sets the cache to the given values.
  ///
  /// Use when the values of the mutable array are known ahead of time, such as
  /// when they are provided via a constructor parameter.
  void setCache(Map<K, V> values) {
    for (final key in values.keys) {
      if (_dictionary.contains(key: key)) {
        _cache[key] = values[key];
      }
    }
  }

  // Properties

  @override
  Iterable<MapEntry<K, V>> get entries =>
      keys.map((key) => MapEntry(key, this[key] as V));

  @override
  bool get isEmpty => _dictionary.isEmpty();

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  Iterable<K> get keys => _dictionary.keys;

  @override
  int get length => _dictionary.size;

  @override
  Iterable<V> get values => keys.map((key) => this[key] as V);

  // Methods

  @override
  void addAll(Map<K, V> other) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  bool containsKey(Object? key) =>
      (key is K) ? _dictionary.contains(key: key) : false;

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  V? remove(Object? key) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  // Operators

  @override
  V? operator [](Object? key) {
    if (key is K) {
      if (_cache.containsKey(key)) {
        return _cache[key];
      } else {
        final value = _dictionary.at(key: key);
        _cache[key] = value;
        return value;
      }
    } else {
      return null;
    }
  }

  @override
  void operator []=(K key, V value) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }
}
