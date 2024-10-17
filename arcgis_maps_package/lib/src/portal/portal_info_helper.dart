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

class _PortalInfoHelper {
  late final PortalAccess _access;
  late final String _basemapGalleryGroupQuery;
  late final bool _canSearchPublic;
  late final bool _canSharePublic;
  late final String _developerBasemapGalleryGroupQuery;
  late final LoadableImage? _organizationBanner;
  late final String _organizationDescription;
  late final String _organizationId;
  late final String _organizationName;
  late final String _organizationSubdomain;
  late final Portal _portal;
  late final String _portalName;
  late final LoadableImage? _portalThumbnail;
  late final String _stylesGroupQuery;
  late final bool _supportsOAuth;
  late final LoadableImage? _thumbnail;
  late final Map<String, dynamic> _userJson;

  void init(Portal portal, String portalInfoJson) {
    _portal = portal;
    final json = jsonDecode(portalInfoJson);
    _access = json.containsKey('access')
        ? PortalItem._portalAccessFromString(access: json['access'])
        : PortalAccess.public;
    _basemapGalleryGroupQuery = json['basemapGalleryGroupQuery'] ?? '';
    _canSearchPublic = json['canSearchPublic'] as bool? ?? true;
    _canSharePublic = json['canSharePublic'] as bool? ?? false;
    _developerBasemapGalleryGroupQuery =
        json['devBasemapGalleryGroupQuery'] ?? '';
    final organizationBannerUri =
        portal._portalHelper._sharing.portalSelfBanner;
    _organizationBanner = LoadableImage._withUri(uri: organizationBannerUri);
    _organizationDescription = json['description'] ?? '';
    _organizationId = json['id'] ?? '';
    _organizationName = json['name'] ?? '';
    _organizationSubdomain = json['urlKey'] ?? '';
    _portalName = json['portalName'] ?? '';
    final portalThumbnailFile = json['portalThumbnail'] ?? '';
    if (portalThumbnailFile.isNotEmpty) {
      final portalThumbnailUri =
          portal._portalHelper._sharing.portalSelfResource(portalThumbnailFile);
      _portalThumbnail = LoadableImage._withUri(uri: portalThumbnailUri);
    } else {
      _portalThumbnail = null;
    }
    _stylesGroupQuery = json['stylesGroupQuery'] ?? '';
    _supportsOAuth = json['supportsOAuth'] as bool? ?? false;
    final thumbnailFile = json['thumbnail'] ?? '';
    if (thumbnailFile.isNotEmpty) {
      final thumbnailUri =
          portal._portalHelper._sharing.portalSelfResource(thumbnailFile);
      _thumbnail = LoadableImage._withUri(uri: thumbnailUri);
    } else {
      _thumbnail = null;
    }
    _userJson = json['user'] ?? {};
  }
}
