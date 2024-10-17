//
// COPYRIGHT © 2023 Esri
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

extension on Location {
  Future<void> _authorizeLocationServices() async {
    bool isLocationEnabled = await serviceEnabled();
    if (!isLocationEnabled) {
      isLocationEnabled = await requestService();
      if (!isLocationEnabled) {
        throw ArcGISException._(
            message: 'Location services are not enabled on this device.');
      }
    }

    var permission = await hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await requestPermission();
      if (permission == PermissionStatus.denied) {
        throw ArcGISException._(
            message: 'Location service permission has been denied.');
      }
    }

    // If denied forever, we cannot ask for permission
    if (permission == PermissionStatus.deniedForever) {
      throw ArcGISException._(
          message: 'Location service permission has been permanently denied.');
    }
  }
}
