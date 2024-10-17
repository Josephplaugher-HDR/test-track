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

import 'dart:convert';
import 'dart:io';
import 'package:package_config/package_config.dart';

final class Config {
  static Future<Map<String, dynamic>> installConfig() async {
    final packageConfig = await findPackageConfig(Directory.current);
    if (packageConfig == null) {
      throw Exception('Could not find package config.');
    }

    var path = packageConfig.packages
        .where((p) => p.name == 'arcgis_maps')
        .first
        .root
        .toFilePath();
    if (path.endsWith('/')) path = path.substring(0, path.length - 1);
    final file = File('$path/install.json');
    var json = jsonDecode(await file.readAsString());
    json['path'] = path;
    return json;
  }

  Config._();
}
