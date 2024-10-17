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

/// Collections of fully populated [PortalGroup] objects can be obtained by calling the [Portal.findGroups],
/// [Portal.fetchFeaturedGroups], and [PortalItem.fetchGroups] methods, and from the
/// [PortalUser.groups] property. The load status of such objects is [LoadStatus.loaded].
///
/// Alternatively, a [PortalGroup] object can be constructed using [PortalGroup.PortalGroup(Portal, String)]
/// if the group ID is known. In this case the load status is initially [LoadStatus.notLoaded]
/// and the object needs to be loaded to populate its properties.
///
/// The portal group owner is automatically an administrator and is returned in the list of admins.
/// The access property determines the visibility of the group to other users. If the group is
/// private, no one except the administrators and the members of the group can see it. If the group is
/// shared with an organization, then all members of the organization can see the group.
///
/// Administrators can invite, add to, and remove members from a group, and also update and delete
/// the group. The administrator for an organization may also reassign the group to another
/// member of the organization. Group members may leave the group. Authenticated users may
/// apply to join a group.
final class PortalGroup with Loadable, _RestLoader {
  /// The identifier of the group.
  late final String groupId;

  /// The portal to which the group belongs.
  final Portal portal;

  // The group title.
  late final String title;

  /// Constructor for use when the group ID is known.
  PortalGroup({required this.portal, required this.groupId}) {
    _setupLoadable();
  }

  PortalGroup._withJson(this.portal, Map<String, dynamic> json) {
    _setupLoadable();
    groupId = json['id'] ?? '';
    _parseJson(json);
    _loadStatus = LoadStatus.loaded;
  }

  void _setupLoadable() {
    _loadStatusChangedStreamController = StreamController.broadcast();
    _doneLoadingStreamController = StreamController.broadcast();
  }

  void _parseJson(Map<String, dynamic> json) {
    title = json['title'] ?? '';
  }

  // _RestLoader mixin for loading a PortalGroup by groupId.

  @override
  Uri get _restUri => portal._portalHelper._sharing.communityGroup(groupId);

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
