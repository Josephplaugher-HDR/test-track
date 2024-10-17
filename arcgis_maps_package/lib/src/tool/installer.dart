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
import 'package:http/http.dart' as http;

final class Installer {
  final String packageUrl;
  final Directory packageDirectory;
  final Directory destinationDirectory;
  final String expectedBuildLabel;
  late String basename;

  Installer({
    required this.packageUrl,
    required this.packageDirectory,
    required this.destinationDirectory,
    required this.expectedBuildLabel,
  }) {
    assert(packageUrl.endsWith('.tar.gz'));
  }

  Installer.fromLocalPackage({
    required this.packageDirectory,
    required this.destinationDirectory,
    this.packageUrl = '',
    this.expectedBuildLabel = '',
  });

  Future<void> downloadAndUnpackTarball({bool quiet = false}) async {
    final packageUri = Uri.parse(packageUrl);
    final filename = packageUri.pathSegments.last;
    basename = filename.split('.').first;

    final packagePath = '${packageDirectory.absolute.path}/$basename';

    var needsInstall = true;
    if (FileSystemEntity.typeSync(packagePath) !=
        FileSystemEntityType.notFound) {
      final buildLabelFile = File('$packagePath/prebuild_label.txt');
      if (buildLabelFile.existsSync()) {
        final buildLabel = buildLabelFile.readAsStringSync();
        if (buildLabel == expectedBuildLabel) {
          needsInstall = false;
        }
      }

      if (needsInstall) {
        if (!quiet) print('Deleting $packagePath');
        Directory(packagePath).deleteSync(recursive: true);
      }
    }

    if (needsInstall) {
      if (!quiet) print('Installing $basename from $packageUri');

      final request = http.Request('GET', packageUri);
      final streamedResponse = await request.send();
      if (streamedResponse.statusCode != 200) {
        streamedResponse.stream.drain();
        throw HttpException(
            'Failed to download $packageUri (${streamedResponse.statusCode})');
      }

      final tmp = Directory.systemTemp.createTempSync('arcgis_maps_');
      final archiveFile = File('${tmp.absolute.path}/$filename');
      final sink = archiveFile.openWrite();
      await sink.addStream(streamedResponse.stream);
      sink.close();

      const executable = '/usr/bin/tar';
      final arguments = ['xzf', archiveFile.absolute.path];
      var result = await Process.run(executable, arguments,
          workingDirectory: packageDirectory.absolute.path);
      if (result.exitCode != 0) {
        throw ProcessException(executable, arguments,
            'tar failed: ${result.stderr}', result.exitCode);
      }

      tmp.deleteSync(recursive: true);
    } else {
      if (!quiet) {
        print(
            '$basename was already downloaded. (Delete $packagePath if you need to reinstall.)');
      }
    }
  }

  Future<void> install({bool quiet = false}) async {
    if (packageUrl.isNotEmpty) {
      await downloadAndUnpackTarball(quiet: quiet);
    } else {
      basename = 'arcgis_maps_core';
    }

    // set up local link to package

    link(basename,
        from: destinationDirectory.absolute.path,
        to: packageDirectory.absolute.path);

    // set up android symlinks

    final androidMainDirectory =
        Directory('${destinationDirectory.absolute.path}/android/app/src/main');
    if (androidMainDirectory.existsSync()) {
      final toDirectory =
          Directory('${destinationDirectory.absolute.path}/$basename/android');

      for (final arch in toDirectory
          .listSync()
          .map((e) => e.absolute.path.split(Platform.pathSeparator).last)
          .where((a) => a != 'assets')) {
        final fromDirectory = await Directory(
                '${androidMainDirectory.absolute.path}/jniLibs/$arch')
            .create(recursive: true);
        final from = fromDirectory.absolute.path;
        final to = Uri(pathSegments: [
          '..',
          '..',
          '..',
          '..',
          '..',
          '..',
          basename,
          'android',
          arch,
        ]).toFilePath();
        link('libruntimecore.so', from: from, to: to);
        link('libarcgis_maps_ffi.so', from: from, to: to);
      }
    }

    if (!quiet) print('Install completed.');
  }

  void link(String target, {required String from, required String to}) {
    final link = Link('$from${Platform.pathSeparator}$target');
    if (link.existsSync()) link.deleteSync();

    try {
      link.createSync('$to${Platform.pathSeparator}$target');
    } on FileSystemException catch (e) {
      if (Platform.isWindows && e.osError?.errorCode == 1314) {
        // 1314 is ERROR_PRIVILEGE_NOT_HELD
        print(
            'Could not create a symlink. Either run this step in an elevated "Administrator" command prompt, or go to "Settings > Update & Security > For developers" and turn on "Developer Mode".');
      }
      rethrow;
    }
  }
}
