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

/// An interface for loading metadata for an object.
///
/// A resource that is capable of loading its metadata asynchronously is referred to as a loadable.
/// It could represent a remote service or a dataset on disk. These methods return a specific object and not
/// the interface [Loadable].
mixin Loadable {
  /// The load status.
  LoadStatus get loadStatus => LoadStatus._fromCoreValue(_coreLoadStatus());

  Stream<ArcGISException?> get _onDoneLoading =>
      _doneLoadingStreamController.stream;

  /// A stream that reports changes to the [LoadStatus].
  Stream<LoadStatus> get onLoadStatusChanged =>
      _loadStatusChangedStreamController.stream;

  /// Loads the metadata for the object asynchronously.
  ///
  /// If loading fails, the Future completes with an error of type [ArcGISException].
  Future<void> load() {
    if (_doneLoadingCompleter == null) {
      _startCompleter();
      _coreLoad();
    }

    return _doneLoadingCompleter!.future;
  }

  /// Loads or retries loading metadata for the object asynchronously.
  ///
  /// Will retry loading the metadata if the object is failed to load. Will load the object if it is not loaded. Will not retry to load the object if the object is loaded.
  /// Will always call the done loading if this is called.
  Future<void> retryLoad() {
    if (_doneLoadingCompleter == null) {
      _startCompleter();
      _coreRetryLoad();
    }

    return _doneLoadingCompleter!.future;
  }

  /// Cancels loading metadata for the object.
  void cancelLoad() => _coreCancelLoad();

  int _coreLoadStatus();
  void _coreLoad();
  void _coreRetryLoad();
  void _coreCancelLoad();

  void _doneLoading(ArcGISException? e) {
    if (_doneLoadingCompleter == null) return;

    _loadError = e;
    if (e == null) {
      _doneLoadingCompleter!.complete();
    } else {
      _doneLoadingCompleter!.completeError(e);
    }

    _finishCompleter();
  }

  /// The load error.
  ArcGISException? get loadError {
    return _loadError;
  }

  void _startCompleter() {
    // a reference must be kept during completion to prevent garbage collection
    _completersInProgress[identityHashCode(this)] = this;
    _doneLoadingCompleter = Completer<void>();

    // Once subscribed, stay subscribed. (If we cancel and resubscribe, core
    // sends an event immediately upon resubscribing, but we only want the event
    // that fires after the load attempt completes.)
    _doneLoadingSubscription ??= _onDoneLoading.listen(_doneLoading);
  }

  void _finishCompleter() {
    _doneLoadingCompleter = null;
    _completersInProgress.remove(identityHashCode(this));
  }

  late final StreamController<ArcGISException?> _doneLoadingStreamController;
  late final StreamController<LoadStatus> _loadStatusChangedStreamController;

  ArcGISException? _loadError;
  StreamSubscription<ArcGISException?>? _doneLoadingSubscription;
  Completer<void>? _doneLoadingCompleter;
  static final Map<int, Object> _completersInProgress = HashMap();
}
