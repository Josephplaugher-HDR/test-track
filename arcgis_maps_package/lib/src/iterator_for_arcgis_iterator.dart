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

part of '../arcgis_maps.dart';

class _IteratorForArcGISIterator<E extends Object> implements Iterator<E> {
  final _ArcGISIterator<E> _iterator;

  E? _current;

  @override
  E get current {
    if (_current == null) throw StateError('No element');
    return _current!;
  }

  @override
  bool moveNext() {
    if (_iterator.hasNext()) {
      _current = _iterator.next();
      return true;
    } else {
      _current = null;
      return false;
    }
  }

  void reset() => _iterator.reset();

  _IteratorForArcGISIterator._withHandle(handle)
      : _iterator = _ArcGISIterator<E>._withHandle(handle);
}
