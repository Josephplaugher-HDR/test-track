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

part of '../../arcgis_maps.dart';

/// Helper mixin for loading data from a REST endpoint (for use with Loadable).
mixin _RestLoader {
  /// Send a request to the REST endpoint with the standard parameters.
  static Future<_ClientResponse> sendRequest({
    required _RequestContext requestContext,
    required _ArcGISAuthenticationMode authenticationMode,
  }) {
    requestContext.uri = requestContext.uri.appendingQueryParameters({
      'culture': _callbackRelay.currentLocale,
    }).withJson();

    return ArcGISHttpClient._sendRequest(
      requestContext: requestContext,
      authenticationMode: authenticationMode,
    );
  }

  /// Provide the URI of the REST endpoint.
  Uri get _restUri;

  /// Provide the authentication mode to use when connecting to the server.
  _ArcGISAuthenticationMode get _authenticationMode;

  /// Provide the stream controller to report the load status.
  StreamController<LoadStatus> get _loadableStatus;

  /// Provide the stream controller to report when loading is done.
  StreamController<ArcGISException?> get _loadableDone;

  /// Process the response.
  void _restResponseReceived(_ClientResponse response);

  var _loadStatus = LoadStatus.notLoaded;
  _RequestContext? _requestContext;

  void _setLoadStatus(LoadStatus loadStatus) {
    _loadStatus = loadStatus;
    _loadableStatus.add(_loadStatus);
  }

  void _setDone(ArcGISException? error) {
    _loadableDone.add(error);
  }

  int _coreLoadStatus() => _loadStatus.coreValue;

  void _coreLoad() {
    if (_loadStatus == LoadStatus.loaded) {
      _setDone(null);
      return;
    }

    _setLoadStatus(LoadStatus.loading);

    _requestContext = _RequestContext(uri: _restUri);
    sendRequest(
      requestContext: _requestContext!,
      authenticationMode: _authenticationMode,
    ).then((response) {
      _restResponseReceived(response);
      _setLoadStatus(LoadStatus.loaded);
      _setDone(null);
    }).catchError((error) {
      var e = error as ArcGISException;
      if (e.wrappedException != null && e.wrappedException is ArcGISException) {
        e = e.wrappedException as ArcGISException;
      }
      _setLoadStatus(LoadStatus.failedToLoad);
      _setDone(e);
    });
  }

  void _coreRetryLoad() => _coreLoad();

  void _coreCancelLoad() {
    if (_loadStatus != LoadStatus.loading) return;

    _requestContext?.cancelToken.cancel();
  }
}
