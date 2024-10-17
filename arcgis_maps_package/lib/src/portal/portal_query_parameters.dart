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

/// Defines a query on a portal.
///
/// To query a portal for items or groups, use [Portal.findItems] or [Portal.findGroups].
final class PortalQueryParameters {
  /// The default limit for the number of results to be returned in each result set.
  static const int limitDefault = 10;

  /// The maximum limit for the number of results to be returned in each result set.
  static const int limitMaximum = 100;

  /// Structured filtering is accomplished by specifying a field name followed by a colon
  /// and the term you are searching for with double quotation marks.
  String filter;

  /// The maximum number of results to be returned in each result set. Defaults to 10.
  /// The maximum allowed value is 100. Use along with [startIndex] to paginate the results.
  int limit;

  /// The query string specified for the search.
  ///
  /// See [ArcGIS REST APIs](https://developers.arcgis.com/rest/users-groups-and-items/search-reference.htm)
  /// for information on query syntax.
  final String query;

  /// Whether public items outside the organization may be included in the search results. Defaults to true.
  bool searchPublic;

  /// A string containing one or more fields names, comma separated, specifying the field(s) to sort the results by.
  ///
  /// Sort field names are case-insensitive. Supported field names are "title", "created", "type", "owner", "modified",
  /// "avgrating", "numratings", "numcomments", and "numviews".
  String sortField;

  /// The order of osrting. Defaults to [PortalQuerySortOrder.ascending].
  PortalQuerySortOrder sortOrder;

  /// The result number of the first entry in the result set response. The index number is 1-based. Defaults to 1.
  /// Use along with [limit] to paginate the results.
  int startIndex;

  PortalQueryParameters({
    required this.query,
    this.filter = '',
    this.limit = limitDefault,
    this.searchPublic = true,
    this.sortField = '',
    this.sortOrder = PortalQuerySortOrder.ascending,
    this.startIndex = 1,
  });

  /// Returns a copy of this [PortalQueryParameters] with startIndex replaced by [nextStartIndex].
  PortalQueryParameters withNextStartIndex(int nextStartIndex) {
    return PortalQueryParameters(
      query: query,
      filter: filter,
      limit: limit,
      searchPublic: searchPublic,
      sortField: sortField,
      sortOrder: sortOrder,
      startIndex: nextStartIndex,
    );
  }

  Map<String, String> _queryParameters({required String organizationId}) {
    var q = query;
    if (!searchPublic) {
      if (organizationId.isNotEmpty && !q.toLowerCase().contains('orgid:')) {
        q = q.isEmpty
            ? 'orgid:$organizationId'
            : '$q AND orgid:$organizationId';
      }
    }

    final params = {'q': q};

    if (startIndex != 1) {
      params['start'] = startIndex.toString();
    }
    if (limit != limitDefault) {
      params['num'] = limit.clamp(1, limitMaximum).toString();
    }
    if (filter.isNotEmpty) {
      params['filter'] = filter;
    }
    if (sortField.isNotEmpty) {
      params['sortField'] = sortField;
      if (sortOrder != PortalQuerySortOrder.ascending) {
        params['sortOrder'] = 'desc';
      }
    }

    return params;
  }
}
