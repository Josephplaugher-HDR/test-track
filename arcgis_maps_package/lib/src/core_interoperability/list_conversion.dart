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

extension on RT_ArrayHandle {
  _ArrayList<E> toList<E extends Object>() {
    final array = _Array<E>._withHandle(this);
    return _ArrayList(array);
  }
}

extension on List {
  /// Returns an array with the elements of this list.
  _Array toArray({required _ElementType valueType}) {
    final builder = _Array.createBuilder(valueType: valueType);
    for (final value in this) {
      builder.add(value: value);
    }
    return builder.moveToArray();
  }

  /// Returns a mutable array with the elements of this list.
  _MutableArray toMutableArray({required _ElementType valueType}) {
    final mutableArray = _MutableArray(valueType);
    for (final value in this) {
      mutableArray.add(value);
    }
    return mutableArray;
  }
}

extension on RT_VectorHandle {
  _MutableArrayList<E> toList<E extends Object>() {
    final mutableArray = _MutableArray<E>._withHandle(this);
    return _MutableArrayList(mutableArray);
  }
}
