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

class _IterableForArcGISIterator<E extends Object> extends Iterable<E> {
  final _IteratorForArcGISIterator<E> _iterator;

  @override
  Iterator<E> get iterator {
    try {
      _iterator.reset();
    } catch (e) {
      // some core iterators can't be reset and will only work one time
    }
    return _iterator;
  }

  _IterableForArcGISIterator._withHandle(handle)
      : _iterator = _IteratorForArcGISIterator<E>._withHandle(handle);
}
