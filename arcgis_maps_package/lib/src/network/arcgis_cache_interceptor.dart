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

class _ArcGISCacheInterceptor extends DioCacheInterceptor {
  static final qualifiedNoCacheRegExp =
      RegExp(r'^(no-cache)(="[-,\s\da-zA-Z]+")$');

  _ArcGISCacheInterceptor({required super.options});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // For the 'cache-control' header, DioCacheInterceptor does not properly handle
    // the 'no-cache' directive with parameters. For example 'no-cache="Set-Cookies"'
    // This will strip the parameters from 'no-cache' before continuing with DioCacheInterceptor
    // An issue has been filed with DioCacheInterceptor: https://github.com/llfbandit/dio_cache_interceptor/issues/158
    // When the issue is fixed, this interceptor can be removed.
    final values = response.headers['cache-control'];
    if (values != null) {
      for (final value in values) {
        final match = qualifiedNoCacheRegExp.firstMatch(value);
        if (match != null) {
          response.headers.remove('cache-control', value);
          response.headers.add('cache-control', match.group(1)!);
        }
      }
    }

    super.onResponse(response, handler);
  }
}
