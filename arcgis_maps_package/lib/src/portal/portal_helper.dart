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

class _PortalHelper with _RestLoader {
  late final Portal _portal;
  late final PortalConnection _connection;
  late final _Sharing _sharing;
  PortalUser? _user;

  Future<List<Basemap>> basemaps() async {
    if (_loadStatus != LoadStatus.loaded) await _portal.load();
    return _fetchBasemapsFrom(_portal.portalInfo!.basemapGalleryGroupQuery);
  }

  Future<List<Basemap>> developerBasemaps() async {
    if (_loadStatus != LoadStatus.loaded) await _portal.load();
    return _fetchBasemapsFrom(
        _portal.portalInfo!.developerBasemapGalleryGroupQuery);
  }

  Future<List<PortalItem>> fetchStyles() async {
    if (_loadStatus != LoadStatus.loaded) await _portal.load();
    return _fetchItemsFromGroupQuery(
      _portal.portalInfo!.stylesGroupQuery,
      limit: 25,
    );
  }

  Future<PortalQueryResultSet<PortalGroup>> findGroups(
      {required PortalQueryParameters parameters}) async {
    final queryResults =
        await _queryPortal(_sharing.communityGroups, parameters);

    final portalGroups = queryResults.resultsJson
        .map((result) => PortalGroup._withJson(_portal, result))
        .toList();

    return PortalQueryResultSet._(
      nextQueryParameters: queryResults.nextQueryParameters,
      queryParameters: parameters,
      results: portalGroups,
      totalResults: queryResults.totalResults,
    );
  }

  Future<PortalQueryResultSet<PortalItem>> findItems(
      {required PortalQueryParameters parameters}) async {
    final queryResults = await _queryPortal(_sharing.search, parameters);

    final portalItems = queryResults.resultsJson
        .map((result) => PortalItem.withJson(
              jsonEncode(result),
              portal: _portal,
            )!)
        .toList();

    return PortalQueryResultSet._(
      nextQueryParameters: queryResults.nextQueryParameters,
      queryParameters: parameters,
      results: portalItems,
      totalResults: queryResults.totalResults,
    );
  }

  PortalConnection get connection => _connection;

  PortalUser? get user => _user;

  void init(Portal portal, PortalConnection connection) {
    _portal = portal;
    _connection = connection;
    _sharing = _Sharing(_portal.uri);
    _portal._onPortalInfoRequest.listen(_onPortalInfoRequest);
  }

  void _onPortalInfoRequest(_) async {
    try {
      await _portal.load();
      _portal._setPortalInfoOrError(
        portalInfo: _portal.portalInfo,
        userDefinedError: null,
      );
    } catch (error) {
      _portal._setPortalInfoOrError(
        portalInfo: null,
        userDefinedError:
            _ClientReferenceManager.generateClientReferenceFromDartObject(
                error),
      );
    }
  }

  Future<PortalGroup?> _groupForQuery(String query) async {
    assert(_loadStatus == LoadStatus.loaded);

    if (query.isEmpty) return null;

    final groupQueryParameters = PortalQueryParameters(
      query: query,
      limit: 1,
    );
    final resultSet = await findGroups(parameters: groupQueryParameters);
    if (resultSet.results.isEmpty) return null;

    return resultSet.results.first;
  }

  Future<List<PortalItem>> _fetchItemsFrom(
      PortalQueryParameters parameters) async {
    assert(_loadStatus == LoadStatus.loaded);

    var items = <PortalItem>[];
    PortalQueryParameters? nextQueryParameters = parameters;
    while (nextQueryParameters != null) {
      final resultSet = await findItems(parameters: nextQueryParameters);
      items.addAll(resultSet.results);
      nextQueryParameters = resultSet.nextQueryParameters;
    }

    return List.unmodifiable(items);
  }

  Future<List<PortalItem>> _fetchItemsFromGroupQuery(String groupQuery,
      {int limit = PortalQueryParameters.limitMaximum}) async {
    final group = await _groupForQuery(groupQuery);
    if (group == null) return [];

    final queryParameters = PortalQueryParameters(
      query: 'group:${group.groupId}',
      limit: limit,
    );

    return _fetchItemsFrom(queryParameters);
  }

  Future<List<Basemap>> _fetchBasemapsFrom(String groupQuery) async {
    final group = await _groupForQuery(groupQuery);
    if (group == null) return [];

    final webMapType =
        PortalItem._portalItemTypeToString(type: PortalItemType.webMap);

    final queryParameters = PortalQueryParameters(
      query: 'group:${group.groupId}',
      filter: 'type:"$webMapType"',
      limit: PortalQueryParameters.limitMaximum,
    );

    final items = await _fetchItemsFrom(queryParameters);
    return items.map(Basemap.withItem).toList();
  }

  Future<_QueryResults> _queryPortal(
      Uri uri, PortalQueryParameters parameters) async {
    if (_loadStatus != LoadStatus.loaded) await _portal.load();

    final queryParameters = parameters._queryParameters(
        organizationId: _portal.portalInfo!.organizationId);

    final response = await _RestLoader.sendRequest(
      requestContext: _RequestContext(
        uri: uri.appendingQueryParameters(queryParameters),
      ),
      authenticationMode: _authenticationMode,
    );
    final jsonString = utf8.decode(response.data);
    final json = jsonDecode(jsonString);

    return _QueryResults(
      parameters,
      nextStartIndex: json['nextStart'] as int? ?? -1,
      resultsJson: json['results'] as List? ?? [],
      totalResults: json['total'] as int? ?? 0,
    );
  }

  // _RestLoader mixin.

  @override
  Uri get _restUri => _sharing.portalSelf;

  @override
  _ArcGISAuthenticationMode get _authenticationMode =>
      _connection == PortalConnection.anonymous
          ? _ArcGISAuthenticationMode.conditionallyAllowed
          : _ArcGISAuthenticationMode.required_;

  @override
  StreamController<LoadStatus> get _loadableStatus =>
      _portal._loadStatusChangedStreamController;

  @override
  StreamController<ArcGISException?> get _loadableDone =>
      _portal._doneLoadingStreamController;

  @override
  void _restResponseReceived(_ClientResponse response) {
    final portalInfoJsonString = utf8.decode(response.data);
    final portalInfo = PortalInfo._withPortal(_portal, portalInfoJsonString);
    _portal._portalInfo.cache(portalInfo);

    final userJson = portalInfo._portalInfoHelper._userJson;
    if (userJson.isNotEmpty) _user = PortalUser._withJson(_portal, userJson);
  }
}

final class _QueryResults {
  PortalQueryParameters? nextQueryParameters;
  final int nextStartIndex;
  final List<dynamic> resultsJson;
  final int totalResults;

  _QueryResults(
    PortalQueryParameters parameters, {
    required this.nextStartIndex,
    required this.resultsJson,
    required this.totalResults,
  }) {
    if (resultsJson.isNotEmpty && nextStartIndex != -1) {
      nextQueryParameters = parameters.withNextStartIndex(nextStartIndex);
    }
  }
}
