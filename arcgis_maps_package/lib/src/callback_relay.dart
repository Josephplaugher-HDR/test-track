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

abstract class _CallbackReceiver {
  void _processCallback(List message);
}

class _CallbackRelay with WidgetsBindingObserver implements _CallbackReceiver {
  static String _localeString(List<Locale>? locales) {
    if (locales == null || locales.isEmpty) {
      return _SynchronousResponder._defaultLanguage;
    }
    return locales.first.toString().replaceAll('_', '-');
  }

  _CallbackRelay() {
    _finalizer = Finalizer((code) {
      if (logger.debugCallbackRelay) logger.d('callback finalizing $code');
      _connected.remove(code);
    });

    final userData = register(this);

    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    widgetsBinding.addObserver(this); // for didChangeLocales
    currentLocale = _localeString(widgetsBinding.platformDispatcher.locales);

    _asynchronousReceivePort.listen(_receiveCallback);

    _synchronousReceivePort = _SynchronousResponder.spawn(
      locale: currentLocale,
      asynchronousSendPort: _asynchronousReceivePort.sendPort,
      relayUserData: userData,
    );
    // _SynchronousResponder will give us a ReceivePort to listen for messages from
    // it. The first message will be a SendPort we can use to send messages to it.
    _synchronousReceivePort.listen((message) {
      if (_synchronousSendPort == null) {
        _synchronousSendPort = message as SendPort;
        _synchronousReady.complete();
      }
    });
  }

  void _receiveCallback(message) {
    assert(message.length >= 2);
    final userData = ffi.Pointer<ffi.Void>.fromAddress(message[1] as int);
    final callbackReceiver = lookup(userData);
    if (callbackReceiver != null) {
      if (callbackReceiver is _CallbackReceiver) {
        callbackReceiver._processCallback(message);
      } else {
        logger.f('callback target was not a callback receiver: $message');
      }
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) async {
    currentLocale = _localeString(locales);
    await _synchronousReady.future;
    _synchronousSendPort!.send(['updateLocale', currentLocale]);
  }

  ffi.Pointer<ffi.Void> register(Object callbackReceiver) {
    int code = identityHashCode(callbackReceiver);
    if (!_connected.containsKey(code)) {
      _connected[code] = WeakReference(callbackReceiver);
      if (logger.debugCallbackRelay) {
        logger.d('callback register ${callbackReceiver.runtimeType} $code');
      }
      _finalizer.attach(callbackReceiver, code);
    }
    return ffi.Pointer<ffi.Void>.fromAddress(code);
  }

  Object? lookup(ffi.Pointer<ffi.Void> userData) {
    int code = userData.address;
    if (_connected.containsKey(code)) {
      final callbackReceiver = _connected[code]!.target;
      if (callbackReceiver != null) {
        return callbackReceiver;
      } else {
        logger.w('stale receiver $code');
      }
    } else {
      logger.w('unknown receiver $code');
    }
    return null;
  }

  @override
  void _processCallback(List message) {
    assert(message.length >= 2);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeCallbackRelayInstanceDestroyed:
        assert(message.length == 4);
        final kind = message[2] as String;
        final instanceId = message[3] as int;
        _instanceDestroyed(kind, instanceId);
      default:
        logger.f('_CallbackRelay unhandled asyncType $asyncType');
    }
  }

  void _instanceDestroyed(String kind, int instanceId) {
    if (_instanceCacheRegistry.containsKey(kind)) {
      final instanceCache = _instanceCacheRegistry[kind]!.target;
      if (instanceCache != null) {
        instanceCache.removeInstance(identifier: instanceId);
      } else {
        logger.w('_instanceDestroyed: stale instanceCache $kind');
      }
    } else {
      logger.w('_instanceDestroyed: unknown instanceCache $kind');
    }
  }

  String currentLocale = 'en-US';
  final _asynchronousReceivePort = ReceivePort();
  late final ReceivePort _synchronousReceivePort;
  SendPort? _synchronousSendPort;
  final _synchronousReady = Completer();

  final Map<int, WeakReference<Object>> _connected = HashMap();

  late Finalizer<int> _finalizer;
}
