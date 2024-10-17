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

/// A context object for an HTTP request, which is passed in and out of core
/// via a ClientReference. The cancelToken can be used to cancel the request.
class _RequestContext {
  Uri uri;
  Object? data;
  Uri? destinationFileUri;
  Map<String, String>? parameters;
  RequestInfo? requestInfo;
  HttpOperation? operation;
  final cancelToken = CancelToken();
  bool wantsResponseInfo;
  ResponseInfo? responseInfo;

  _RequestContext({
    required this.uri,
    this.destinationFileUri,
    this.data,
    this.parameters,
    this.requestInfo,
    this.operation,
    this.wantsResponseInfo = false,
  }) {
    requestInfo?.requestCancelToken?._cancelToken = cancelToken;
  }
}

extension on _ClientReference {
  _RequestContext get requestContext {
    return _ClientReferenceManager.getDartObject(data) as _RequestContext;
  }
}
