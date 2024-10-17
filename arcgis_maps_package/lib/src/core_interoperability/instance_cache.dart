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

/// A type that can create and destroy cacheable instances of a class.
abstract interface class _InstanceFactory<T extends _InstanceId, H> {
  /// Creates an instance of the class with the given handle.
  T createInstance({required H handle});

  /// Destroys the given handle.
  void destroyHandle(H handle);
  int identifierOfInstanceWithHandle(H handle);
}

/// Caches instances of a class that implements [_InstanceId].
final class _InstanceCache<T extends _InstanceId, H,
    F extends _InstanceFactory<T, H>> {
  final F factory;
  final String kind;
  final Map<int, WeakReference<T>> _storage = HashMap();

  _InstanceCache({required this.factory, required this.kind}) {
    _instanceCacheRegistry[kind] = WeakReference(this);
  }

  /// Returns an instance with the given handle.
  ///
  /// The returned instance will either be one retrieved from the cache or newly
  /// created and inserted into the cache.
  R instanceWith<R extends T>(H handle) {
    final instanceId = factory.identifierOfInstanceWithHandle(handle);
    final existingInstance = _storage[instanceId]?.target;
    if (existingInstance != null) {
      factory.destroyHandle(handle);
      if (logger.debugInstanceCache) {
        print('existingInstance: $kind $instanceId');
      }
      return existingInstance as R;
    } else {
      final newInstance = factory.createInstance(handle: handle);
      _storage[instanceId] = WeakReference(newInstance);
      if (logger.debugInstanceCache) {
        print('newInstance: $kind $instanceId');
      }
      return newInstance as R;
    }
  }

  /// Adds the given instance to the cache. If the item already exists in the
  /// cache it will not be added again.
  ///
  /// This method is used by handrolled subclasses that do not have native
  /// Runtime Core handles to add items to an instance cache.
  void addInstance<R extends T>(R instance) {
    final instanceId = instance._instanceId;
    final existingInstance = _storage[instanceId]?.target;
    if (existingInstance == null) {
      _storage[instanceId] = WeakReference(instance);
      if (logger.debugInstanceCache) {
        print('added instance: $kind $instanceId');
      }
    }
  }

  /// Removes the instance with the given identifier from the cache, if it
  /// exists.
  void removeInstance({required int identifier}) {
    if (logger.debugInstanceCache) {
      print('removeInstance: $kind $identifier');
    }
    final removedValue = _storage.remove(identifier);
    if (removedValue == null) {
      logger.w('removeInstance: expected $kind $identifier not found');
    }
  }
}

final _instanceCacheRegistry = HashMap<String, WeakReference<_InstanceCache>>();
