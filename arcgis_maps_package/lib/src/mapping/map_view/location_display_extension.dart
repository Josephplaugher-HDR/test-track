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

part of '../../../arcgis_maps.dart';

extension on LocationDisplay {
  Future<void> configureSymbols(double devicePixelRatio) async {
    final symbolFutures = <Future>[];

    symbolFutures.add(ArcGISImage.fromScaledAsset(
      'packages/arcgis_maps/assets/LocationDisplay.png',
      devicePixelScale: devicePixelRatio,
    ).then((defaultImg) {
      final defaultSymbol = PictureMarkerSymbol.withImage(defaultImg);
      defaultSymbol.height = 28;
      defaultSymbol.width = 28;
      this.defaultSymbol = defaultSymbol;
    }));

    symbolFutures.add(ArcGISImage.fromScaledAsset(
      'packages/arcgis_maps/assets/LocationDisplayAcquiring.png',
      devicePixelScale: devicePixelRatio,
    ).then((acquiringImg) {
      final acquiringSymbol = PictureMarkerSymbol.withImage(acquiringImg);
      acquiringSymbol.height = 28;
      acquiringSymbol.width = 28;
      this.acquiringSymbol = acquiringSymbol;
    }));

    symbolFutures.add(ArcGISImage.fromScaledAsset(
      'packages/arcgis_maps/assets/LocationDisplayCourse.png',
      devicePixelScale: devicePixelRatio,
    ).then((courseImg) {
      final courseSymbol = PictureMarkerSymbol.withImage(courseImg);
      courseSymbol.height = 28;
      courseSymbol.width = 28;
      this.courseSymbol = courseSymbol;
    }));

    symbolFutures.add(ArcGISImage.fromScaledAsset(
      'packages/arcgis_maps/assets/LocationDisplayCompass.png',
      devicePixelScale: devicePixelRatio,
    ).then((headingElement) {
      final headingSymbol = PictureMarkerSymbol.withImage(headingElement);
      headingSymbol.height = 28;
      headingSymbol.width = 28;
      this.headingSymbol = headingSymbol;
    }));

    await Future.wait(symbolFutures);
  }
}
