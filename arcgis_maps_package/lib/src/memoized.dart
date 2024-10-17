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

/// A value that is lazily computed and cached on first access.
base class Memoized<T> {
  /// The function that gets the value to be cached.
  final T Function() getter;

  /// The function that sets the value.
  void Function(T value)? setter;

  Memoized({required this.getter, this.setter});

  /// The cached value.
  T? _value;

  /// Whether the cached value is valid.
  bool _isValueCached = false;

  /// The memoized value.
  ///
  /// If the value has not been accessed before, will call the getter to compute
  /// the value.
  T get value {
    if (!_isValueCached) {
      cache(getter());
    }
    if (_value != null) {
      return _value!;
    } else {
      return null as T;
    }
  }

  set value(T value) {
    if (setter != null) {
      setter!(value);
      cache(value);
    } else {
      throw StateError('Missing setter');
    }
  }

  /// Caches the given value.
  void cache(T value) {
    _value = value;
    _isValueCached = true;
  }

  /// Removes the cached value. The value will be re-computed on the next time
  /// `value` is accessed.
  void invalidateCache() {
    _value = null;
    _isValueCached = false;
  }
}
