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

extension on RT_StringHandle {
  Uri? toFileUri() {
    if (this != ffi.nullptr) {
      final path = toDartString();
      return Uri.file(path);
    } else {
      return null;
    }
  }

  Uri? toUri() {
    if (this != ffi.nullptr) {
      final uri = toDartString();
      return Uri.parse(uri);
    } else {
      return null;
    }
  }
}
