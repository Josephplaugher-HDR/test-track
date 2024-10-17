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

class _ClientReferenceManager {
  /// This map holds onto Objects associated with a ClientReference
  /// Storing them here ensures they do not go out of scope and provides a way
  /// to retrieve the object from the void* used by the runtime.
  static final Map<int, Object> _referredObjects = HashMap();

  /// Call this to get the Object associated with a ClientReference
  /// userData Pointer
  static Object? getDartObject(ffi.Pointer<ffi.Void> userData) {
    return _referredObjects[userData.address];
  }

  /// Only call this when notified that the ClientReference has been released
  static void removeDartObject(ffi.Pointer<ffi.Void> userData) {
    final value = _referredObjects.remove(userData.address);
    if (value == null) {
      logger.w(
          '_ClientReferenceManager.removeDartObject: expected client reference not found');
    }
  }

  /// Generates a ClientReference object based on the provided dataObject. The
  /// dataObject is stored as a value in a the _referredObjects Map with the
  /// identityHashCode as the key so the object will not be garbage collected
  /// until the runtime is done with it.
  static _ClientReference generateClientReferenceFromDartObject(
      Object dartObject) {
    final hashCode = identityHashCode(dartObject);
    final clientReference = _ClientReference.fromClientData(
        ffi.Pointer<ffi.Void>.fromAddress(hashCode));
    _referredObjects[hashCode] = dartObject;
    return clientReference;
  }
}
