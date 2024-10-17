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

import 'dart:io';
import 'package:arcgis_maps/src/tool/config.dart';
import 'package:arcgis_maps/src/tool/installer.dart';

/// dart run arcgis_maps install
/// Downloads and installs arcgis_maps_core

void main(List<String> arguments) async {
  if (arguments.length != 1 || arguments[0] != 'install') {
    print('Usage: dart run arcgis_maps install');
    return;
  }

  try {
    final installConfig = await Config.installConfig();
    for (var requiredKey in ['baseUrl', 'release', 'build']) {
      if (!installConfig.containsKey(requiredKey)) {
        print('Missing required key "$requiredKey" in install.json');
        return;
      }
    }
    final baseUrl = installConfig['baseUrl']!;
    final release = installConfig['release']!;
    final build = installConfig['build']!;

    if (baseUrl.toString().isNotEmpty) {
      // fetch the tarball
      final packageUrl = baseUrl
              .replaceAll(RegExp(r'\$release'), release)
              .replaceAll(RegExp(r'\$build'), build) +
          '/arcgis_maps_core.tar.gz';

      final installer = Installer(
        packageUrl: packageUrl,
        packageDirectory: Directory(installConfig['path']),
        destinationDirectory: Directory.current,
        expectedBuildLabel: '$release.$build',
      );
      await installer.install();
    } else {
      // setup symlinks to local tarball
      final installer = Installer.fromLocalPackage(
        packageDirectory: Directory(installConfig['path']),
        destinationDirectory: Directory.current,
      );
      await installer.install();
    }
  } on HttpException catch (e) {
    print(
        'An error occurred while downloading the installation package. ${e.message}');
  } on ProcessException catch (e) {
    print(
        'An error occurred while extracting the installation package. ${e.message} (${e.errorCode})');
  } on Exception catch (e) {
    print('An unexpected error occurred. $e');
  }
}
