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

/// A registered user of the portal or organization.
///
/// A portal may have users who are unaffiliated with an organization or users
/// who are part of an organization. Users sign in to the portal and create and
/// share content which is organized into items ([PortalItem]). Users can
/// create and join groups ([PortalGroup]) and share items with groups. This
/// makes the items visible and accessible to other members of the group. Users
/// could be in different roles including administrators, publishers and
/// information workers. Administrators can add users to their organizations and
/// have access to all content within the organization. All users can create web
/// maps based on combining services that they have access to and can register
/// services running on external servers. Publishers within an organization can
/// in addition to user privileges create hosted services based on data files
/// that they upload.
final class PortalUser with Loadable, _RestLoader {
  /// Determines if other users can search for this user's name to find
  /// content and groups owned by this user and to invite this user to join
  /// their groups.
  late final PortalAccess access;

  /// The email of the user.
  late final String email;

  /// The full name of the user.
  late final String fullName;

  /// The portal to which the user belongs.
  final Portal portal;

  /// The thumbnail image of the user.
  ///
  /// If it is "null", there is no image. Otherwise, the image needs to be
  /// loaded using [LoadableImage.load].
  late final LoadableImage? thumbnail;

  /// The description of the user.
  late final String userDescription;

  /// The username of the user.
  late final String username;

  PortalUser(this.portal, this.username) {
    if (username.isEmpty) {
      throw ArgumentError.value(username, 'username', 'Cannot be empty');
    }

    _setupLoadable();
  }

  PortalUser._withJson(this.portal, Map<String, dynamic> json) {
    _setupLoadable();
    username = json['username'] ?? '';
    _parseJson(json);
    _loadStatus = LoadStatus.loaded;
  }

  void _setupLoadable() {
    _loadStatusChangedStreamController = StreamController.broadcast();
    _doneLoadingStreamController = StreamController.broadcast();
  }

  void _parseJson(Map<String, dynamic> json) {
    access = json.containsKey('access')
        ? PortalItem._portalAccessFromString(access: json['access'])
        : PortalAccess.private;
    email = json['email'] ?? '';
    fullName = json['fullName'] ?? '';
    final thumbnailFile = json['thumbnail'] ?? '';
    if (thumbnailFile.isNotEmpty) {
      final uri = portal._portalHelper._sharing
          .communityUserThumbnail(username, thumbnailFile);
      thumbnail = LoadableImage._withUri(uri: uri);
    } else {
      thumbnail = null;
    }
    userDescription = json['description'] ?? '';
  }

  // _RestLoader mixin for loading a PortalUser by username.

  @override
  Uri get _restUri => portal._portalHelper._sharing.communityUser(username);

  @override
  _ArcGISAuthenticationMode get _authenticationMode =>
      portal._portalHelper._connection == PortalConnection.anonymous
          ? _ArcGISAuthenticationMode.conditionallyAllowed
          : _ArcGISAuthenticationMode.required_;

  @override
  StreamController<LoadStatus> get _loadableStatus =>
      _loadStatusChangedStreamController;

  @override
  StreamController<ArcGISException?> get _loadableDone =>
      _doneLoadingStreamController;

  @override
  void _restResponseReceived(_ClientResponse response) {
    final jsonString = utf8.decode(response.data);
    final json = jsonDecode(jsonString);
    _parseJson(json);
  }
}
