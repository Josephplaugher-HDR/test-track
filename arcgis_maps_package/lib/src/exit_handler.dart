//
// COPYRIGHT © 2024 Esri
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

final _exitHandler = _ExitHandler();

/// Register with this class to perform special handling at app exit. App exit bypasses
/// the normal "dispose" mechanism, so any problematic tear-down has to be handled
/// separately here.
/// One kind of problematic tear-down is that some core "Destroy" functions can
/// potentially emit C API events that are not safe to do after the Flutter runtime
/// has been torn down. Registering event subscriptions here ensures that they are
/// cancelled before the "Destroy" functions run.
class _ExitHandler {
  void registerSubscription(StreamSubscription subscription) {
    _subscriptions[identityHashCode(subscription)] =
        WeakReference(subscription);
  }

  void unregisterSubscription(StreamSubscription subscription) {
    _subscriptions.remove(identityHashCode(subscription));
  }

  _ExitHandler() {
    _appLifecycleListener = AppLifecycleListener(
      // onExitRequested called on desktop platforms
      onExitRequested: () {
        _onExit();
        return Future.value(ui.AppExitResponse.exit);
      },
      // onDetach called on mobile platforms
      onDetach: _onExit,
    );
  }

  void _onExit() {
    for (final subscription in _subscriptions.values) {
      subscription.target?.cancel();
    }
    _subscriptions.clear();
  }

  final _subscriptions = HashMap<int, WeakReference<StreamSubscription>>();

  late final AppLifecycleListener _appLifecycleListener; // ignore: unused_field
}
