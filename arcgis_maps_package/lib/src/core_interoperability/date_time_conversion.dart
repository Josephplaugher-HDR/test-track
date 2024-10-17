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

extension on RT_DateTimeHandle {
  /// Returns a [DateTime] instance from this handle.
  DateTime? toDateTime() => _ArcGISDateTime._fromHandle(this)?.toDart();
}

extension on _ArcGISDateTime {
  /// Returns a [DateTime] instance equivalent to this date time.
  DateTime toDart() => dateTimeForArcGISMilliseconds(toUnixMilliseconds());
}

extension on DateTime {
  /// Returns a [_ArcGISDateTime] instance equivalent to this date time.
  _ArcGISDateTime toArcGIS() =>
      _ArcGISDateTime.fromUnixMilliseconds(arcGISMillisecondsFor(this));
}

const _dateTimeMillisecondsMin = -8640000000000000;
const _dateTimeMillisecondsMax = 8640000000000000;
final _arcGISMillisecondsMin = _ArcGISDateTime.min().toUnixMilliseconds();
final _arcGISMillisecondsMax = _ArcGISDateTime.max().toUnixMilliseconds();

/// @nodoc
@visibleForTesting
int arcGISMillisecondsFor(DateTime dateTime) {
  final ms = dateTime.millisecondsSinceEpoch;
  switch (ms) {
    case _dateTimeMillisecondsMin:
      return _arcGISMillisecondsMin;
    case _dateTimeMillisecondsMax:
      return _arcGISMillisecondsMax;
    default:
      return ms;
  }
}

/// @nodoc
@visibleForTesting
DateTime dateTimeForArcGISMilliseconds(int milliseconds) {
  return DateTime.fromMillisecondsSinceEpoch(
      milliseconds.clamp(_dateTimeMillisecondsMin, _dateTimeMillisecondsMax),
      isUtc: true);
}
