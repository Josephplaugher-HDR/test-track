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

extension on RT_TaskHandle {
  /// Returns a [Future] instance from this handle.
  Future<T> toFuture<T>(T Function(_Element element) valueFromElement) {
    final arcGISFuture = _ArcGISFuture._fromHandle(this)!;
    _futuresInProgress[identityHashCode(arcGISFuture)] = arcGISFuture;
    return arcGISFuture.onTaskCompleted.first.then((_) {
      final result = arcGISFuture.result(valueFromElement);
      _futuresInProgress.remove(identityHashCode(arcGISFuture));
      return result.asFuture;
    });
  }

  /// Returns a [CancelableOperation] instance from this handle.
  CancelableOperation<T> toCancelableOperation<T>(
      T Function(_Element element) valueFromElement) {
    final arcGISFuture = _ArcGISFuture._fromHandle(this)!;
    _futuresInProgress[identityHashCode(arcGISFuture)] = arcGISFuture;
    final future = arcGISFuture.onTaskCompleted.first.then((_) {
      final result = arcGISFuture.result(valueFromElement);
      _futuresInProgress.remove(identityHashCode(arcGISFuture));
      return result.asFuture;
    });
    return CancelableOperation.fromFuture(future,
        onCancel: arcGISFuture.cancel);
  }

  static final Map<int, Object> _futuresInProgress = HashMap();
}

extension on _ArcGISFuture {
  /// Returns the result of the future.
  ///
  /// If the future completed with an error, the result will be an
  /// [ErrorResult]. If the future completed successfully, the result will be
  /// a [ValueResult].
  Result<T> result<T>(T Function(_Element element) valueFromElement) {
    return Result<T>(() {
      final error = getError();
      if (error != null) {
        // Allow the core object to be garbage collected and its handle destroyed
        // so that any associated ClientReference can be released.
        error._releaseCoreHandle();
        throw error;
      }

      final element = valueElement;
      if (element != null) {
        return valueFromElement(element);
      } else if (T == () {}()) {
        // The 'get()' method returns 'nil' when the generic type is 'void'.
        // Since there was no error, we can assume success and just return
        // 'void'.
        return () {}() as T;
      } else {
        throw ArcGISException._(
            message:
                'ArcGIS future completed, but neither succeeded nor failed');
      }
    });
  }

  /// The value of the future as an element.
  _Element? get valueElement {
    final elementHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Task_get(_handle, errorHandler);
    });
    return _Element._fromHandle(elementHandle);
  }
}
