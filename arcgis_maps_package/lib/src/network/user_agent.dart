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

/// @nodoc
class UserAgent {
  @visibleForTesting
  static Future<String> userAgent({
    String? sdkIdentifier,
    String? osIdentifier,
    String? appIdentifier,
  }) async {
    const sdkName = 'ArcGISMaps-Flutter';
    _initializeArcGISEnvironmentIfNeeded();

    var sdkVersion = _correspondingBuildLabel;
    var os = Platform.operatingSystem;
    var osVersion = Platform.operatingSystemVersion;

    sdkVersion = sdkVersion
        .replaceFirst(RegExp(r'\.\d+$'), '') // remove build number
        .replaceFirst(RegExp(r'\.0$'), ''); // remove patch number if 0
    osVersion = osVersion
        .replaceFirst(RegExp(r'^Version '), '') // remove leading 'Version '
        .replaceFirst(RegExp(r'\([^)]*\)'), '') // remove info in parentheses
        .trim();
    sdkIdentifier ??= '$sdkName/$sdkVersion';

    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      os += ' ${androidInfo.version.release};';
      os += ' ${androidInfo.model};';
      if (androidInfo.supported64BitAbis.isNotEmpty) {
        os += ' ${androidInfo.supported64BitAbis[0]}';
      }
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      os += ' ${iosInfo.systemVersion}:';
      os += ' ${iosInfo.utsname.machine}';
    } else if (Platform.isMacOS) {
      // When running unit tests, we need to mock DeviceInfo (to avoid loading its plugin)
      final macOsInfo = (Platform.environment.containsKey('FLUTTER_TEST'))
          ? MacOsDeviceInfo.fromMap({
              'computerName': 'mockComputerName',
              'hostName': 'Darwin',
              'arch': 'arm64',
              'model': 'MacBookPro18,1',
              'kernelVersion':
                  'Darwin Kernel Version 22.6.0: Mon Feb 19 19:45:09 PST 2024; root:xnu-8796.141.3.704.6~1/RELEASE_ARM64_T6000',
              'osRelease': 'Version 13.6.6 (Build 22G630)',
              'majorVersion': 13,
              'minorVersion': 6,
              'patchVersion': 6,
              'activeCPUs': 10,
              'memorySize': 34359738368,
              'cpuFrequency': 1,
              'systemGUID': '"88888888-BBBB-AAAA-0000-121212121212"',
            })
          : await deviceInfo.macOsInfo;
      final releaseVersion =
          macOsInfo.osRelease.replaceFirst(RegExp(r'\(Build \w+\)'), '').trim();
      final model = macOsInfo.model;
      os += ' $releaseVersion; $model';
    } else {
      os += ' non-supported platform';
    }
    if (ArcGISEnvironment.getLicense().licenseLevel == LicenseLevel.developer) {
      os += '; devmode';
    }
    osIdentifier ??= os;

    final packageInfo = await _packageInfoCompleter.future;
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    appIdentifier ??= '$appName/$version';

    return '$sdkIdentifier ($osIdentifier) $appIdentifier';
  }
}
