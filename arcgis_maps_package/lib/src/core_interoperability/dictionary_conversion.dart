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

extension on RT_DictionaryHandle {
  _DictionaryMap<K, V> toMap<K extends Object, V>() {
    final dictionary = _Dictionary<K, V>._withHandle(this);
    return _DictionaryMap<K, V>(dictionary);
  }

  _UnmodifiableDictionaryMap<K, V> toUnmodifiableMap<K extends Object, V>() {
    final dictionary = _Dictionary<K, V>._withHandle(this);
    return _UnmodifiableDictionaryMap<K, V>(dictionary);
  }
}

extension on Map {
  _Dictionary toDictionary(
      {required _ElementType keyType,
      _ElementType valueType = _ElementType.variant}) {
    // Runtime Dictionaries cannot have a key type of _ElementType.variant
    // Try to determine the actual key type by looking at the first key.
    if (keyType == _ElementType.variant) {
      if (length > 0) {
        final firstKeyElement = _ElementExtension.fromDartValue(keys.first);
        keyType = firstKeyElement._objectType;
      }
    }

    final dictionary = _Dictionary(keyType: keyType, valueType: valueType);

    for (final entry in entries) {
      dictionary.insert(key: entry.key, value: entry.value);
    }

    return dictionary;
  }
}
