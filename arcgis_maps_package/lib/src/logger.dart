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

import 'package:logger/logger.dart';

class ArcGISLogger extends Logger {
  var debugErrorHandler = false;
  var debugCallbackRelay = false;
  var debugSyncHandler = false;
  var debugInstanceCache = false;

  ArcGISLogger({super.filter, super.printer, super.output, super.level});
}

var logger = ArcGISLogger(
  printer: ArcGISPrinter(),
  filter: DevelopmentFilter(), // print only in debug mode
  // filter: ProductionFilter(), // print in debug or release mode
  output: ConsoleOutput(), // output to console
);

// Set a minimum log level
// Logger.level = Level.warning;

// Available levels:
// logger.t('trace');
// logger.d('debug');
// logger.i('info');
// logger.w('warning');
// logger.e('error');
// logger.f('fatal');

final class ArcGISPrinter extends SimplePrinter {
  @override
  List<String> log(LogEvent event) {
    return super.log(event).map((str) {
      // remove the date from the timestamp
      return str.replaceFirst(RegExp(r'TIME: \d{4}-\d{2}-\d{2}T'), '');
    }).toList();
  }

  ArcGISPrinter() : super(printTime: true, colors: false);
}
