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

extension on Uri {
  Uri get serverContext {
    return _UrlUtils.getServerContext(uri: this);
  }

  Uri appendingPathSegments(List<String> segments) {
    return replace(pathSegments: pathSegments + segments);
  }

  Uri appendingQueryParameters(Map<String, String> parameters) {
    return replace(queryParameters: {...queryParameters, ...parameters});
  }

  Uri withJson() => appendingQueryParameters({'f': 'json'});
}
