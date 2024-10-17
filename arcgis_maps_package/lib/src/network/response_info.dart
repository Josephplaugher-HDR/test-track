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

/// The response information returned from an HTTP request made via
/// [ArcGISHttpClient.get()] or [ArcGISHttpClient.post()].
class ResponseInfo {
  /// The HTTP status code returned by the server.
  int get statusCode => _statusCode;

  /// The headers returned by the server.
  Map<String, List<String>> get headers => _headers.map;

  /// The body of the response.
  Uint8List get data => _data;

  ResponseInfo._({required int statusCode, required Headers headers})
      : _statusCode = statusCode,
        _headers = headers,
        _data = _emptyData;

  static ResponseInfo _fromClientResponse(_ClientResponse clientResponse) {
    final userData = clientResponse.response!.data;
    final requestContext =
        _ClientReferenceManager.getDartObject(userData) as _RequestContext;
    final responseInfo = requestContext.responseInfo!;
    responseInfo._data = clientResponse.data;
    return responseInfo;
  }

  final int _statusCode;

  final Headers _headers;

  Uint8List _data;
}
