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

/// Helper class for working with the Sharing API of a Portal.
/// https://developers.arcgis.com/rest/users-groups-and-items/working-with-users-groups-and-items.htm
class _Sharing {
  final Uri sharingUri;

  Uri get community => sharingUri.appendingPathSegments(['community']);
  Uri get communityUsers => community.appendingPathSegments(['users']);
  Uri communityUser(String username) =>
      communityUsers.appendingPathSegments([username]);
  Uri communityUserInfo(String username) =>
      communityUser(username).appendingPathSegments(['info']);
  Uri communityUserThumbnail(String username, String thumbnailFile) =>
      communityUserInfo(username).appendingPathSegments([thumbnailFile]);

  Uri get communityGroups => community.appendingPathSegments(['groups']);
  Uri communityGroup(String groupId) =>
      communityGroups.appendingPathSegments([groupId]);

  Uri get portals => sharingUri.appendingPathSegments(['portals']);
  Uri get portalSelf => portals.appendingPathSegments(['self']);
  Uri get portalSelfResources =>
      portalSelf.appendingPathSegments(['resources']);
  Uri get portalSelfBanner =>
      portalSelfResources.appendingPathSegments(['banner.png']);
  Uri portalSelfResource(String filename) =>
      portalSelfResources.appendingPathSegments([filename]);

  Uri get search => sharingUri.appendingPathSegments(['search']);

  _Sharing(Uri portalUri)
      : sharingUri =
            portalUri.serverContext.appendingPathSegments(['sharing', 'rest']);
}
