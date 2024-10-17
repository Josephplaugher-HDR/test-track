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

/// Results of a query on a portal.
final class PortalQueryResultSet<T> {
  /// The query parameters for the next set of results based on the next start index.
  ///
  /// This is automatically generated if there are any more results left to be retrieved. This property is null
  /// if there are no more results for the next page.
  final PortalQueryParameters? nextQueryParameters;

  /// The query parameters that was used to make the search.
  final PortalQueryParameters queryParameters;

  /// The results of the query.
  final List<T> results;

  /// The total number of results irrespective of the paging.
  final int totalResults;

  PortalQueryResultSet._({
    this.nextQueryParameters,
    required this.queryParameters,
    required this.results,
    required this.totalResults,
  });
}
