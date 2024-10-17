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

extension on LocationData {
  ArcGISLocation toArcGISLocation() {
    final horizontalAccuracy =
        (accuracy == null || accuracy! < 0.0) ? 0.0 : accuracy!;
    final vertAccuracy = (verticalAccuracy == null || verticalAccuracy! < 0.0)
        ? 0.0
        : verticalAccuracy!;

    final int? timeMsInt = time?.round();
    final DateTime? timestamp = (timeMsInt == null)
        ? null
        : DateTime.fromMillisecondsSinceEpoch(timeMsInt);

    final bool isLastKnown;
    if (timestamp == null) {
      isLastKnown = false;
    } else {
      const testDuration = Duration(seconds: 30);
      isLastKnown = timestamp.difference(DateTime.now()) > testDuration;
    }

    final position = _calculatePosition(vertAccuracy > 0.0);

    return ArcGISLocation(
      timestamp: timestamp,
      position: position,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: vertAccuracy,
      speed: speed ?? 0.0,
      course: heading ?? 0.0,
      isLastKnown: isLastKnown,
    );
  }

  ArcGISPoint _calculatePosition(bool hasVerticalAccuracy) {
    if (hasVerticalAccuracy) {
      int verticalWkid;
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS) {
        // Apple vertical SpatialReference is EGM2008_Geoid. wkid: 3855
        verticalWkid = 3855;
      } else {
        // Android vertical SR is WGS84 Elipsoid, wkid: 115700
        verticalWkid = 115700;
      }

      return ArcGISPoint(
        x: longitude ?? 0.0,
        y: latitude ?? 0.0,
        z: altitude,
        spatialReference: SpatialReference(
          wkid: 4326,
          verticalWkid: verticalWkid,
        ),
      );
    }

    // vertical accuracy not supported
    return ArcGISPoint(
      x: longitude ?? 0.0,
      y: latitude ?? 0.0,
      spatialReference: SpatialReference.wgs84,
    );
  }
}
