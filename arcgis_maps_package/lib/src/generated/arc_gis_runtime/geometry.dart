//
// COPYRIGHT © 2024 ESRI
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

// AUTO GENERATED FILE, DO NOT EDIT.

// ignore_for_file: unused_element, unused_field

part of '../../../arcgis_maps.dart';

/// Defines an angular unit of measurement.
///
/// The angular unit class is derived from the unit class.
final class AngularUnit extends Unit {
  static AngularUnit? _fromHandle(RT_AngularUnitHandle handle) {
    if (handle == ffi.nullptr) return null;
    return AngularUnit._withHandle(handle);
  }

  AngularUnit._withHandle(super.handle) : super._withHandle();

  /// Creates a unit given its known id.
  ///
  /// Parameters:
  /// - `unitId` — The known id of the unit.
  factory AngularUnit({required AngularUnitId unitId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_create(unitId.coreValue, errorHandler);
    });
    return AngularUnit._withHandle(handle);
  }

  /// The [AngularUnitId] of the given angular unit.
  ///
  /// If an error occurs then [AngularUnitId.other] is returned.
  AngularUnitId get angularUnitId {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_getAngularUnitId(_handle, errorHandler);
    });
    return AngularUnitId._fromCoreValue(coreValue);
  }

  /// Converts a value in another UOM into this UOM.
  ///
  /// Parameters:
  /// - `fromUnit` — The UOM to convert from.
  /// - `angle` — The value to convert.
  ///
  /// Return Value: The value in the this UOM or NAN if the conversion fails.
  double convertFrom({required AngularUnit fromUnit, required double angle}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_convertFrom(
          _handle, fromUnit._handle, angle, errorHandler);
    });
  }

  /// Converts a value in this UOM into another UOM.
  ///
  /// Parameters:
  /// - `toUnit` — The UOM to convert to.
  /// - `angle` — The value to convert.
  ///
  /// Return Value: The value in the target UOM or NAN if the conversion fails.
  double convertTo({required AngularUnit toUnit, required double angle}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_convertTo(
          _handle, toUnit._handle, angle, errorHandler);
    });
  }

  /// Converts a radian value to this UOM.
  ///
  /// Parameters:
  /// - `radians` — The value to convert.
  ///
  /// Return Value: The value in this UOM or NAN if the conversion fails.
  double fromRadians(double radians) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_fromRadians(
          _handle, radians, errorHandler);
    });
  }

  /// Converts a value in this UOM to radians.
  ///
  /// Parameters:
  /// - `angle` — The value to convert.
  ///
  /// Return Value: The value in radians or NAN if the conversion fails.
  double toRadians({required double angle}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AngularUnit_toRadians(_handle, angle, errorHandler);
    });
  }
}

/// Defines a list of the most commonly-used angular units of measurement.
///
/// These values can be used to create instances of [AngularUnit], as an
/// alternative to using well-known IDs (WKIDs). In addition to the units in
/// this enumeration, you can also use less commonly-used units, by passing a
/// WKID of an angular unit to the inherited [Unit.fromWkid] factory method. The
/// function [Unit.wkid] returns the WKID of the unit.
enum AngularUnitId {
  /// Indicates that the unit of angular measurement is a custom unit, or is a
  /// unit not listed in the enumerated type. This value may be returned from an
  /// AngularUnit created from a WKID of a less commonly used unit of
  /// measurement that does not have an equivalent value in this enumeration.
  other,

  /// Indicates an angular measurement in degrees. This unit has a WKID of 9102.
  degrees,

  /// Indicates an angular measurement in grads. This unit has a WKID of 9105.
  grads,

  /// Indicates an angular measurement in minutes, equal to one-sixtieth of a
  /// degree. This unit has a WKID of 9103.
  minutes,

  /// Indicates an angular measurement in radians. This unit has a WKID of 9101.
  radians,

  /// Indicates an angular measurement in seconds, equal to one-sixtieth of a
  /// minute. This unit has a WKID of 9104.
  seconds;

  factory AngularUnitId._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return other;
      case 9102:
        return degrees;
      case 9105:
        return grads;
      case 9103:
        return minutes;
      case 9101:
        return radians;
      case 9104:
        return seconds;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case other:
        return 0;
      case degrees:
        return 9102;
      case grads:
        return 9105;
      case minutes:
        return 9103;
      case radians:
        return 9101;
      case seconds:
        return 9104;
    }
  }
}

/// A location defined by x and y (and optionally z) coordinates.
///
/// [ArcGISPoint] geometries represent discrete locations or entities, such as a
/// geocoded house address, the location of a water meter in a water utility
/// network, or a moving vehicle. Larger geographic entities (such as cities)
/// are often represented as points on small-scale maps. Points can be used as
/// the geometry of features and graphics and are often used to construct more
/// complex geometries. They are also used in a [Viewpoint] to define the center
/// of the display.
///
/// Points store a single set of x,y coordinates that define a location
/// (longitude and latitude, for example), and a [SpatialReference]. Points can
/// optionally have an [ArcGISPoint.z] (elevation or altitude) and
/// [ArcGISPoint.m] (measure) attributes.
///
/// For points defined with a geographic spatial reference, the x-coordinate is
/// the longitude (east or west), and the y-coordinate is the latitude (north or
/// south). When geographic coordinates are represented in strings, points are
/// generally written using the form "(latitude, longitude)", where the
/// y-coordinate comes before the x-coordinate. Latitude values south of the
/// equator and longitude values west of the prime meridian are expressed as
/// negative numbers.
///
/// Use [CoordinateFormatter] to convert a latitude and longitude formatted
/// string directly to an [ArcGISPoint]. The coordinate formatter can also
/// return a latitude and longitude formatted string from an existing
/// [ArcGISPoint]. Other coordinate notations, such as Military Grid Reference
/// System (MGRS) and United States National Grid (USNG) are also supported.
///
/// Points are based upon the parent [Geometry] class. The geometry class is
/// immutable which means that you can not change its shape once it is created.
/// If you need to modify a point once it has been created, use the
/// [PointBuilder] class instead. The [GeometryBuilder.toGeometry] method
/// provides you with the point object.
final class ArcGISPoint extends Geometry {
  static ArcGISPoint? _fromHandle(RT_PointHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISPoint._withHandle(handle);
  }

  ArcGISPoint._withHandle(super.handle) : super._withHandle();

  /// Creates a point with an x, y, z, m and a spatial reference.
  ///
  /// The minimum z-value is -6,356,752 meters, which is the approximate radius
  /// of the earth (the WGS 84 datum semi-minor axis). The maximum z-value is
  /// 55,000,000 meters.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate for the point.
  /// - `y` — The y-coordinate for the point.
  /// - `z` — The z-coordinate for the point.
  /// - `m` — The m-value for the point.
  /// - `spatialReference` — The spatial reference for the point.
  factory ArcGISPoint(
      {required double x,
      required double y,
      double? z,
      double? m,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Point_createCombined(
          x, y, z, m, spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final ArcGISPoint object = ArcGISPoint._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// An optional coordinate to define a measure value for the point.
  ///
  /// M-values are used in linear referencing scenarios and may represent things
  /// like mile markers along a highway. Like z-values, every geometry can
  /// optionally store m-values with the point coordinates that comprise it. The
  /// default m-value is NaN. If an m-value is specified when a geometry is
  /// created, the new geometry has m-values ([Geometry.hasM] is true). Note
  /// that when you get m-values back from a geometry, the default value of NAN
  /// is returned for vertices that do not have m-values. A geometry with
  /// m-values is sometimes known as an m-aware geometry.
  double? get m {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Point_getMNullable(_handle, errorHandler);
    });
  }

  /// The x-coordinate for the point.
  ///
  /// Returns NAN if an error occurs.
  double get x {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Point_getX(_handle, errorHandler);
    });
  }

  /// The y-coordinate for the point.
  ///
  /// Returns NAN if an error occurs.
  double get y {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Point_getY(_handle, errorHandler);
    });
  }

  /// The z-coordinate for the point.
  ///
  /// Geometries can have z-values, indicating values along the z-axis, which is
  /// perpendicular to both the x-axis and y-axis. Z-values indicate height
  /// above or depth below a surface, or an absolute elevation. For example,
  /// z-values are used to draw the locations of geometries in a `SceneView`.
  /// Note that geometries are not considered true 3D shapes and are draped onto
  /// surfaces in the view, or in some cases, drawn in a single plane by using
  /// z-values. Z-values are stored on [ArcGISPoint] and [Envelope]. Since
  /// [Multipoint], [Polyline], and [Polygon] are created from a collection of
  /// [ArcGISPoint], all types of geometry can have z-values.
  ///
  /// Whether or not a geometry has z-values is determined when the geometry is
  /// created; if you use a method that has a z-value parameter, the new
  /// geometry has z-values ([Geometry.hasZ] is true). If you create geometries
  /// using constructors that take z-value parameters, or if you pass into the
  /// constructor points or segments that have z-values, the new geometry has
  /// z-values. A [Geometry] with z-values is sometimes known as a z-aware
  /// geometry.
  ///
  /// It may be that not all vertices in your geometry have a z-value defined.
  /// NAN is a valid z-value used to indicate an unknown z-value. However, the
  /// default z-value is 0. When you get z-values from a geometry that does not
  /// have z-values, the default is 0. Check the [Geometry.hasZ] to determine
  /// whether a z-value of 0 means that there are no z-values in the geometry or
  /// that the z-value in the geometry's coordinates really is 0.
  double? get z {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Point_getZNullable(_handle, errorHandler);
    });
  }
}

/// Defines an area unit of measurement.
///
/// The area unit class is derived from the unit class.
final class AreaUnit extends Unit {
  static AreaUnit? _fromHandle(RT_AreaUnitHandle handle) {
    if (handle == ffi.nullptr) return null;
    return AreaUnit._withHandle(handle);
  }

  AreaUnit._withHandle(super.handle) : super._withHandle();

  /// Creates a unit given its known id.
  ///
  /// Parameters:
  /// - `unitId` — The known id of the unit.
  factory AreaUnit({required AreaUnitId unitId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_create(unitId.coreValue, errorHandler);
    });
    return AreaUnit._withHandle(handle);
  }

  /// Creates an area unit given a linear unit.
  ///
  /// Creates a unit given a linear unit.
  ///
  /// Parameters:
  /// - `linearUnit` — The linear unit.
  factory AreaUnit.fromLinearUnit(LinearUnit linearUnit) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_createFromLinearUnit(
          linearUnit._handle, errorHandler);
    });
    return AreaUnit._withHandle(handle);
  }

  /// The [AreaUnitId] of the given Area unit.
  ///
  /// If an error occurs then [AreaUnitId.other] is returned.
  AreaUnitId get areaUnitId {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_getAreaUnitId(_handle, errorHandler);
    });
    return AreaUnitId._fromCoreValue(coreValue);
  }

  /// Converts a value in another UOM into this UOM.
  ///
  /// Parameters:
  /// - `fromUnit` — The UOM to convert from.
  /// - `area` — The value to convert.
  ///
  /// Return Value: The value in the this UOM or NAN if the conversion fails.
  double convertFrom({required AreaUnit fromUnit, required double area}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_convertFrom(
          _handle, fromUnit._handle, area, errorHandler);
    });
  }

  /// Converts a value in this UOM into another UOM.
  ///
  /// Parameters:
  /// - `toUnit` — The UOM to convert to.
  /// - `area` — The value to convert.
  ///
  /// Return Value: The value in the target UOM or NAN if the conversion fails.
  double convertTo({required AreaUnit toUnit, required double area}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_convertTo(
          _handle, toUnit._handle, area, errorHandler);
    });
  }

  /// Converts a square meter value to this UOM.
  ///
  /// Parameters:
  /// - `area` — The value to convert.
  ///
  /// Return Value: The value in this UOM or NAN if the conversion fails.
  double fromSquareMeters(double area) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_fromSquareMeters(
          _handle, area, errorHandler);
    });
  }

  /// Converts a value in this UOM to square meters.
  ///
  /// Parameters:
  /// - `area` — The value to convert.
  ///
  /// Return Value: The value in square meters or NAN if the conversion fails.
  double toSquareMeters({required double area}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_AreaUnit_toSquareMeters(
          _handle, area, errorHandler);
    });
  }
}

/// Defines a list of the most commonly-used units of area measurement. These
/// values can be used to create instances of [AreaUnit], as an alternative to
/// using well-known IDs (WKIDs). In addition to the units in this enumeration,
/// you can also use less commonly-used units, by passing a WKID of an area unit
/// to the inherited [Unit.fromWkid] factory method. The function [Unit.wkid]
/// returns the WKID of the unit.
enum AreaUnitId {
  /// Indicates that the unit of area measurement is a custom unit, or a unit
  /// not listed in the enumerated type. This value may be returned from an
  /// AreaUnit created from a WKID of a less commonly used unit of measurement
  /// that does not have an equivalent value in this enumeration.
  other,

  /// Indicates an area measurement in acres. This unit has a WKID of 109402.
  acres,

  /// Indicates an area measurement in hectares. This unit has a WKID of 109401.
  hectares,

  /// Indicates an area measurement in square centimeters. This unit has a WKID
  /// of 109451.
  squareCentimeters,

  /// Indicates an area measurement in square decimeters. This unit has a WKID
  /// of 109450.
  squareDecimeters,

  /// Indicates an area measurement in square feet. This unit has a WKID of
  /// 109405.
  squareFeet,

  /// Indicates an area measurement in square kilometers. This unit has a WKID
  /// of 109414.
  squareKilometers,

  /// Indicates an area measurement in square meters. This unit has a WKID of
  /// 109404.
  squareMeters,

  /// Indicates an area measurement in square millimeters. This unit has a WKID
  /// of 109452.
  squareMillimeters,

  /// Indicates an area measurement in square statute miles. This unit has a
  /// WKID of 109439.
  squareMiles,

  /// Indicates an area measurement in square yards. This unit has a WKID of
  /// 109442.
  squareYards;

  factory AreaUnitId._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return other;
      case 109402:
        return acres;
      case 109401:
        return hectares;
      case 109451:
        return squareCentimeters;
      case 109450:
        return squareDecimeters;
      case 109405:
        return squareFeet;
      case 109414:
        return squareKilometers;
      case 109404:
        return squareMeters;
      case 109452:
        return squareMillimeters;
      case 109439:
        return squareMiles;
      case 109442:
        return squareYards;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case other:
        return 0;
      case acres:
        return 109402;
      case hectares:
        return 109401;
      case squareCentimeters:
        return 109451;
      case squareDecimeters:
        return 109450;
      case squareFeet:
        return 109405;
      case squareKilometers:
        return 109414;
      case squareMeters:
        return 109404;
      case squareMillimeters:
        return 109452;
      case squareMiles:
        return 109439;
      case squareYards:
        return 109442;
    }
  }
}

/// Converts between Points and formatted coordinate notation strings such as
/// decimal degrees; degrees, minutes, and seconds; U.S. National Grid (USNG);
/// and Military Grid Reference System (MGRS).
abstract final class CoordinateFormatter {
  /// Parses a coordinate in Global Area Reference System (GARS) notation, and
  /// returns a Point representing that location.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the GARS string. If no spatial reference is
  /// provided, it is assumed the GARS string is referenced to WGS 84. The GARS
  /// string must not contain any whitespace.
  /// <table>
  /// <tr><th>GARS notation examples
  /// <tr><td>354ND
  /// <tr><td>354ND22
  /// </table>
  /// Returns null on error, including when the given string is not valid GARS
  /// notation.
  ///
  /// Parameters:
  /// - `coordinates` — The GARS notation string for the coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the GARS coordinate.
  /// - `garsConversionMode` — Select whether the returned point's location
  /// represents the south-west corner of the GARS cell the coordinate lies
  /// within, or its center.
  ///
  /// Return Value: A point with the location from the GARS string in the
  /// spatial reference provided.
  static ArcGISPoint fromGars(
      {required String coordinates,
      required SpatialReference? spatialReference,
      required GarsConversionMode garsConversionMode}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromGARS(
          coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          garsConversionMode.coreValue,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Parses a coordinate in World Geographic Reference System (GEOREF)
  /// notation, and returns a Point representing that location.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the GEOREF string. If no spatial reference is
  /// provided, it is assumed the GEOREF string is referenced to WGS 84. The
  /// GEOREF string may contain leading and trailing whitespace.
  /// <table>
  /// <tr><th>GEOREF notation examples
  /// <tr><td>MKML5056
  /// <tr><td>MKML50285665
  /// </table>
  /// Returns null on error, including when the given string is not valid GEOREF
  /// notation.
  ///
  /// Parameters:
  /// - `coordinates` — The GEOREF notation string for the coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the GEOREF coordinate.
  ///
  /// Return Value: A point with the location from the GEOREF string in the
  /// spatial reference provided.
  static ArcGISPoint fromGeoRef(
      {required String coordinates,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromGeoRef(
          coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Parses a coordinate in latitude-longitude notation, and returns a Point
  /// representing that location. The coordinate may use decimal degrees,
  /// degrees and decimal minutes, or degrees, minutes, and seconds format.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the latitude-longitude string. If no spatial
  /// reference is provided, it is assumed the latitude-longitude coordinates
  /// are referenced to WGS 84.
  /// <table>
  /// <caption>Supported characters</caption>
  /// <tr><th>Symbol             <th>Character <th>Name                        <th>Unicode number <th>HTML code
  /// <tr><td rowspan="7">Degree <td>*         <td>Asterisk                    <td>U+002A         <td>&#42;
  /// <tr>                       <td>^         <td>Circumflex Accent           <td>U+005E         <td>&#94;
  /// <tr>                       <td>~         <td>Tilde                       <td>U+007E         <td>&#126;
  /// <tr>                       <td>°         <td>Degree Sign                 <td>U+00B0         <td>&#176;
  /// <tr>                       <td>º         <td>Masculine Ordinal Indicator <td>U+00BA         <td>&#186;
  /// <tr>                       <td>˚         <td>Ring Above                  <td>U+02DA         <td>&#730;
  /// <tr>                       <td>⁰         <td>Superscript Zero            <td>U+2070         <td>&#8304;
  /// <tr><td rowspan="3">Minute <td>'         <td>Apostrophe                  <td>U+0027         <td>&#39;
  /// <tr>                       <td>’         <td>Right Single Quotation Mark <td>U+2019         <td>&#8127;
  /// <tr>                       <td>′         <td>Prime                       <td>U+2032         <td>&#8242;
  /// <tr><td rowspan="4">Second <td>"         <td>Quotation Mark              <td>U+0022         <td>&#34;
  /// <tr>                       <td>˝         <td>Double Acute Accent         <td>U+02DD         <td>&#733;
  /// <tr>                       <td>”         <td>Right Double Quotation Mark <td>U+201D         <td>&#8221;
  /// <tr>                       <td>″         <td>Double Prime                <td>U+2033         <td>&#8243;
  /// </table>
  /// The latitude-longitude string may contain leading and trailing whitespace,
  /// and may also contain a space, comma, or vertical bar symbol to separate
  /// the latitude from the longitude. It may also contain the characters 'N',
  /// 'S', 'E' and 'W', or use a minus (-) symbol to indicate the hemisphere of
  /// each value.
  /// <table>
  /// <tr><th>Latitude-longitude notation examples
  /// <tr><td>55 56 39.123N 003 09 43.034W
  /// <tr><td>55°56′39″N 3°09′43″W
  /// <tr><td>55~56.65205', -003~09.71723'
  /// <tr><td>55.9442008* | -3.1619539*
  /// </table>
  /// Returns null on error, including when the given string cannot be
  /// interpreted.
  ///
  /// Parameters:
  /// - `coordinates` — The latitude-longitude notation string for the
  /// coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the latitude-longitude coordinate.
  ///
  /// Return Value: A point with the location from the coordinate string in the
  /// spatial reference provided.
  static ArcGISPoint fromLatitudeLongitude(
      {required String coordinates,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromLatitudeLongitude(
          coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Parses a coordinate in Military Grid Reference System (MGRS) notation, and
  /// returns a Point representing that location.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the MGRS string. If no spatial reference is
  /// provided, it is assumed the MGRS string is referenced to WGS 84. For an
  /// explanation of the different modes for interpreting an MGRS notation
  /// string, please see [MgrsConversionMode]. Note that the choice between zone
  /// 01 and 60 has no impact when reading from an MGRS notation string. The
  /// MGRS string can contain leading and trailing whitespace and can have
  /// whitespace between the grid zone designator, the 100km square identifier,
  /// and the numerical eastings and northings.
  /// <table>
  /// <tr><th>MGRS notation examples
  /// <tr><td>30UVG898998
  /// <tr><td>30UVG 89885 99877
  /// </table>
  /// Returns null on error, including when the given string is not valid MGRS
  /// notation.
  ///
  /// Parameters:
  /// - `coordinates` — The MGRS notation string for the coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the MGRS coordinate.
  /// - `mgrsConversionMode` — The mode used by the given MGRS coordinates.
  ///
  /// Return Value: A point with the location from the MGRS string in the
  /// spatial reference provided.
  static ArcGISPoint fromMgrs(
      {required String coordinates,
      required SpatialReference? spatialReference,
      required MgrsConversionMode mgrsConversionMode}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromMGRS(
          coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          mgrsConversionMode.coreValue,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Parses a coordinate in United States National Grid (USNG) notation, and
  /// returns a Point representing that location.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the USNG string. If no spatial reference is
  /// provided and the USNG string is suffixed with "(NAD 27)", it is assumed
  /// the USNG string is referenced to NAD 27. If no spatial reference is
  /// provided and no such suffix exists, it is assumed the USNG string is
  /// referenced to WGS 84. The USNG string can contain leading and trailing
  /// whitespace and can have whitespace between the grid zone designator, the
  /// 100km square identifier and the numerical eastings and northings.
  /// <table>
  /// <tr><th>USNG notation examples
  /// <tr><td>13TFJ 23 59
  /// <tr><td>13TFJ2374159574
  /// </table>
  /// Returns null on error, including when the given string is not valid USNG
  /// notation.
  ///
  /// Parameters:
  /// - `coordinates` — The USNG notation string for the coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the USNG coordinate.
  ///
  /// Return Value: A point with the location from the USNG string in the
  /// spatial reference provided.
  static ArcGISPoint fromUsng(
      {required String coordinates,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromUSNG(coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Parses a coordinate in Universal Transverse Mercator (UTM) notation, and
  /// returns a Point representing that location.
  ///
  /// The spatial reference provided must have an ellipsoid and datum matching
  /// those used by the source of the UTM string. If no spatial reference is
  /// provided, it is assumed the UTM string is referenced to WGS 84. The UTM
  /// string can contain leading and trailing whitespace and can have whitespace
  /// between the zone and latitude designator and the numerical eastings and
  /// northings.
  /// <table>
  /// <tr><th>UTM notation examples
  /// <tr><td>30U 489885 6199877
  /// <tr><td>30U4898856199877
  /// <tr><td>30N 489885 6199877 (using N/S indicator)
  /// <tr><td>489885.32,6199877.36,30U (this form supports sub-meter precision)
  /// </table>
  /// Returns null on error, including when the given string is not valid UTM
  /// notation.
  ///
  /// Parameters:
  /// - `coordinates` — The UTM notation string for the coordinate.
  /// - `spatialReference` — A spatial reference that defines the datum and
  /// ellipsoid referenced by the UTM coordinate.
  /// - `utmConversionMode` — The latitude notation scheme used by the given UTM
  /// coordinate, either a latitudinal band, or a hemisphere designator.
  ///
  /// Return Value: A point with the location from the UTM string in the spatial
  /// reference provided.
  static ArcGISPoint fromUtm(
      {required String coordinates,
      required SpatialReference? spatialReference,
      required UtmConversionMode utmConversionMode}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreCoordinates = _CString(coordinates);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_fromUTM(
          coreCoordinates.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          utmConversionMode.coreValue,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Returns a formatted coordinate in Global Area Reference System (GARS)
  /// notation representing the given point's location.
  ///
  /// The point must have a spatial reference. Returns null on error.
  ///
  /// Parameters:
  /// - `point` — The location to be represented in GARS notation.
  ///
  /// Return Value: A GARS notation string representing the GARS cell containing
  /// the given point.
  static String toGars({required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toGARS(
          point._handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns a formatted coordinate in World Geographic Reference System
  /// (GEOREF) notation representing the given point's location.
  ///
  /// The precision value controls the number of digits used to represent the
  /// fractional part of coordinate's latitude and longitude, expressed in
  /// minutes. For example:
  /// | precision | Example output         | Angular precision | Approx precision* |
  /// | ---------- | ---------------------- | ----------------- | -----------------|
  /// | 0         | MKML5056               | 1min              | 2km |
  /// | 1         | MKML5056               | 1min              | 2km |
  /// | 2         | MKML5056               | 1min              | 2km |
  /// | 3         | MKML502566             | 0.1min            | 200m |
  /// | 4         | MKML50285665           | 0.01min           | 20m |
  /// | 5         | MKML5028256652         | 0.001min          | 2m |
  ///
  /// At the equator to 1 significant figure. The 'precision' should be in the
  /// interval \[0, 9]. The point must have a spatial reference. Returns null on
  /// error.
  ///
  /// Parameters:
  /// - `point` — The location to be represented in GEOREF notation.
  /// - `precision` — The precision with which to represent the coordinate.
  ///
  /// Return Value: A GEOREF notation string representing the position of the
  /// given point.
  static String toGeoRef({required ArcGISPoint point, required int precision}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toGeoRef(
          point._handle, precision, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns a formatted coordinate in latitude-longitude notation representing
  /// the given point's location.
  ///
  /// The latitude-longitude string contains a space separating the latitude
  /// from the longitude value, and the characters 'N' or 'S', and 'E' and 'W',
  /// to indicate the hemisphere of each value. The string also contains spaces
  /// separating the components (degrees, minutes, seconds) of each value. The
  /// precision of the output is controlled by both the 'format' and
  /// 'decimal_places' parameters. For example: decimal_places | format |
  /// Example output | Angular precision | Approx precision* -------------- |
  /// ------------------------------------------------- |
  /// ---------------------------- | ----------------- | -----------------
  /// 0 | [LatitudeLongitudeFormat.decimalDegrees] | 056N 0003W | 1deg | 100km
  /// 1 | [LatitudeLongitudeFormat.decimalDegrees] | 55.9N 003.2W | 0.1deg |
  /// 10km
  /// 2 | [LatitudeLongitudeFormat.decimalDegrees] | 55.94N 003.16W | 0.01deg |
  /// 1km
  /// 3 | [LatitudeLongitudeFormat.decimalDegrees] | 55.944N 003.162W | 0.001deg
  /// | 100m
  /// 0 | [LatitudeLongitudeFormat.degreesDecimalMinutes] | 55 057N 003 010W |
  /// 1min | 2km
  /// 1 | [LatitudeLongitudeFormat.degreesDecimalMinutes] | 55 56.7N 003 09.7W |
  /// 0.1min | 200m
  /// 2 | [LatitudeLongitudeFormat.degreesDecimalMinutes] | 55 56.65N 003 09.72W
  /// | 0.01min | 20m
  /// 3 | [LatitudeLongitudeFormat.degreesDecimalMinutes] | 55 56.650N 003
  /// 09.717W | 0.001min | 2m
  /// 0 | [LatitudeLongitudeFormat.degreesMinutesSeconds] | 55 56 039N 003 09
  /// 043W | 1sec | 30m
  /// 1 | [LatitudeLongitudeFormat.degreesMinutesSeconds] | 55 56 39.1N 003 09
  /// 43.0W | 0.1sec | 3m
  /// 2 | [LatitudeLongitudeFormat.degreesMinutesSeconds] | 55 56 39.12N 003 09
  /// 43.03W | 0.01sec | 300mm
  /// 3 | [LatitudeLongitudeFormat.degreesMinutesSeconds] | 55 56 39.123N 003 09
  /// 43.034W | 0.001sec | 30mm
  ///
  /// At the equator to 1 significant figure. 'decimal_places' should be in the
  /// interval \[0, 16]. The point must have a spatial reference. Returns null
  /// on error.
  ///
  /// Parameters:
  /// - `point` — The location to be represented as a formatted
  /// latitude-longitude string.
  /// - `format` — The mode to use when formatting the latitude-longitude
  /// string.
  /// - `decimalPlaces` — The number of decimal places to use.
  ///
  /// Return Value: A string representing the latitude-longitude of the given
  /// point.
  static String toLatitudeLongitude(
      {required ArcGISPoint point,
      required LatitudeLongitudeFormat format,
      required int decimalPlaces}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toLatitudeLongitude(
          point._handle, format.coreValue, decimalPlaces, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns a formatted coordinate in Military Grid Reference System (MGRS)
  /// notation representing the given point's location.
  ///
  /// For an explanation of the different modes for interpreting an MGRS
  /// notation string, please see [MgrsConversionMode]. Note that the choice
  /// between zone 01 and 60 has an impact only when generating the MGRS
  /// notation string for a point with longitude of exactly 180deg. The
  /// precision value controls the number of digits used to represent each
  /// numerical easting and northing value within the MGRS string. For example:
  /// precision | add_spaces | Example output | Approx precision ---------- |
  /// ---------- | ------------------ | ----------------
  /// 0         | false      | 30UVG              | 100km
  /// 1         | false      | 30UVG89            | 10km
  /// 2         | false      | 30UVG8999          | 1km
  /// 3         | false      | 30UVG898998        | 100m
  /// 4         | false      | 30UVG89889988      | 10m
  /// 5         | false      | 30UVG8988499881    | 1m
  /// 0         | true       | 30U VG             | 100km
  /// 1         | true       | 30U VG 8 9         | 10km
  /// 2         | true       | 30U VG 89 99       | 1km
  /// 3         | true       | 30U VG 898 998     | 100m
  /// 4         | true       | 30U VG 8988 9988   | 10m
  /// 5         | true       | 30U VG 89884 99881 | 1m
  ///
  /// The 'precision' should be in the interval \[0, 8]. The point must have a
  /// spatial reference. Returns null on error.
  ///
  /// Parameters:
  /// - `point` — The location to be represented in MGRS notation.
  /// - `mgrsConversionMode` — The mode to use for the returned MGRS notation
  /// string.
  /// - `precision` — The precision with which to represent the coordinate.
  /// - `addSpaces` — If false, the generated string contains no spaces. If
  /// true, a space separates the grid zone designator, the 100km square
  /// identifier, and the numerical easting and northing values.
  ///
  /// Return Value: An MGRS notation string representing the position of the
  /// given point.
  static String toMgrs(
      {required ArcGISPoint point,
      required MgrsConversionMode mgrsConversionMode,
      required int precision,
      required bool addSpaces}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toMGRS(point._handle,
          mgrsConversionMode.coreValue, precision, addSpaces, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns a formatted coordinate in United States National Grid (USNG)
  /// notation representing the given point's location.
  ///
  /// The precision value controls the number of digits used to represent each
  /// numerical easting and northing value within the USNG string. For example:
  ///
  /// precision | add_spaces | Example output         | Approx precision
  /// ---------- | ---------- | ---------------------- | ----------------
  /// 0         | false      | 13TFJ                  | 100km
  /// 1         | false      | 13TFJ25                | 10km
  /// 2         | false      | 13TFJ2359              | 1km
  /// 3         | false      | 13TFJ237595            | 100m
  /// 4         | false      | 13TFJ23745951          | 10m
  /// 5         | false      | 13TFJ2374359512        | 1m
  /// 0         | true       | 13T FJ                 | 100km
  /// 1         | true       | 13T FJ 2 5             | 10km
  /// 2         | true       | 13T FJ 23 59           | 1km
  /// 3         | true       | 13T FJ 237 595         | 100m
  /// 4         | true       | 13T FJ 2374 5951       | 10m
  /// 5         | true       | 13T FJ 23743 59512     | 1m
  ///
  /// If the point's [SpatialReference] is NAD 27, then a suffix is added to the
  /// end of the formatted string. For example:
  ///
  /// precision | add_spaces | Example output         | Approx precision
  /// ---------- | ---------- | ---------------------- | ----------------
  /// 4       | false      | 13TFJ23795929 (NAD 27) | 10m
  /// 2       | true       | 13T FJ 23 59 (NAD 27)  | 1km
  ///
  /// When the point's spatial reference is based on NAD 27. The 'precision'
  /// should be in the interval \[0, 8]. The point must have a spatial
  /// reference. Returns null on error.
  ///
  /// Parameters:
  /// - `point` — The coordinate to be represented in MGRS notation.
  /// - `precision` — The precision with which to represent the coordinate.
  /// - `addSpaces` — If false, the generated string contains no spaces. If
  /// true, a space separates the grid zone designator, the 100km square
  /// identifier, and the numerical easting and northing values.
  ///
  /// Return Value: A USNG notation string representing the position of the
  /// given point.
  static String toUsng(
      {required ArcGISPoint point,
      required int precision,
      required bool addSpaces}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toUSNG(
          point._handle, precision, addSpaces, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// Returns a formatted coordinate in Universal Transverse Mercator (UTM)
  /// notation representing the given point's location.
  ///
  /// Example output for a point in the southern hemisphere: utm_conversion_mode
  /// | add_spaces | Example output --------------------------------------------
  /// | ------------------- | -------------------
  /// [UtmConversionMode.latitudeBandIndicators] | false | 30U4898846199881
  /// [UtmConversionMode.latitudeBandIndicators] | true | 30U 489884 6199881
  /// [UtmConversionMode.northSouthIndicators] | false | 30N4898846199881
  /// [UtmConversionMode.northSouthIndicators] | true | 30N 489884 6199881
  ///
  /// The point must have a spatial reference. Returns null on error.
  ///
  /// Parameters:
  /// - `point` — The coordinate to be represented in UTM notation.
  /// - `utmConversionMode` — The latitude notation scheme to use in the
  /// returned UTM notation string, either a latitudinal band, or a hemisphere
  /// designator.
  /// - `addSpaces` — If false, the generated string contains no spaces. If
  /// true, a space separates the UTM zone and latitude designator, and each
  /// numerical easting and northing value.
  ///
  /// Return Value: A UTM notation string representing the position of the given
  /// point.
  static String toUtm(
      {required ArcGISPoint point,
      required UtmConversionMode utmConversionMode,
      required bool addSpaces}) {
    _initializeArcGISEnvironmentIfNeeded();
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CoordinateFormatter_toUTM(
          point._handle, utmConversionMode.coreValue, addSpaces, errorHandler);
    });
    return stringHandle.toDartString();
  }
}

/// A cubic Bezier curve for use in a multipart geometry.
final class CubicBezierSegment extends Segment {
  static CubicBezierSegment? _fromHandle(RT_CubicBezierSegmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return CubicBezierSegment._withHandle(handle);
  }

  CubicBezierSegment._withHandle(super.handle) : super._withHandle();

  /// Creates a bezier segment based on a start and end point and two control
  /// points at tangents to the start and end points.
  ///
  /// The spatial reference parameter is used if the points have a null spatial
  /// reference. If more than one spatial reference is supplied (as a parameter
  /// or as a property of an [ArcGISPoint] parameter), they must all be equal.
  ///
  /// The z-value and m-value of the start and end points (if present) are used
  /// in the [CubicBezierSegment]. The z-value and m-value of the control points
  /// (if present) are ignored.
  ///
  /// Parameters:
  /// - `startPoint` — The start point of the segment.
  /// - `controlPoint1` — A point tangent to the start of the segment.
  /// - `controlPoint2` — A point tangent to the end of the segment.
  /// - `endPoint` — The end point of the segment.
  /// - `spatialReference` — A spatial reference to use for the segment if the
  /// points do not have spatial references set.
  factory CubicBezierSegment(
      {required ArcGISPoint startPoint,
      required ArcGISPoint controlPoint1,
      required ArcGISPoint controlPoint2,
      required ArcGISPoint endPoint,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CubicBezierSegment_create(
          startPoint._handle,
          controlPoint1._handle,
          controlPoint2._handle,
          endPoint._handle,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final CubicBezierSegment object = CubicBezierSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// A point tangent to the start of the segment.
  ArcGISPoint get controlPoint1 {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CubicBezierSegment_getControlPoint1(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// A point tangent to the end of the segment.
  ArcGISPoint get controlPoint2 {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CubicBezierSegment_getControlPoint2(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }
}

/// Represents a function to convert between two coordinate systems.
///
/// This is the base class for classes used to transform coordinates between
/// spatial references that have different datums. The inverse of the datum
/// transformation, used to transform in the opposite direction, may be accessed
/// using a member function.
///
/// A datum transformation has a name property intended to be suitable for
/// display, such as when displaying a list of available transformations to an
/// end user.
///
/// You can get a list of suitable transformations for a given input and output
/// spatial reference using methods of the [TransformationCatalog] class. Some
/// transformations require that certain Projection Engine data files be present
/// on the local file system. The property
/// [DatumTransformation.isMissingProjectionEngineFiles] indicates whether any
/// of the files are missing. The complete list of necessary files is available
/// using the [GeographicTransformationStep.projectionEngineFilenames] or
/// [HorizontalVerticalTransformationStep.projectionEngineFilenames] properties.
///
/// In order for any Projection Engine files to be found, the data location must
/// be set first using the [TransformationCatalog.projectionEngineDirectory]
/// property.
///
/// A datum transformation object is immutable.
final class DatumTransformation implements ffi.Finalizable {
  final RT_DatumTransformationHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.DatumTransformation_destroy.cast());

  static DatumTransformation? _fromHandle(RT_DatumTransformationHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (DatumTransformation._objectTypeOf(handle)) {
      case _DatumTransformationType.geographicTransformation:
        return GeographicTransformation._withHandle(handle);
      case _DatumTransformationType.horizontalVerticalTransformation:
        return HorizontalVerticalTransformation._withHandle(handle);
    }
  }

  static _DatumTransformationType _objectTypeOf(
      RT_DatumTransformationHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DatumTransformation_getObjectType(
          handle, errorHandler);
    });
    return _DatumTransformationType._fromCoreValue(coreValue);
  }

  _DatumTransformationType get _objectType =>
      DatumTransformation._objectTypeOf(_handle);

  DatumTransformation._withHandle(RT_DatumTransformationHandle handle)
      : _inputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DatumTransformation_getInputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _outputSpatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_DatumTransformation_getOutputSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.DatumTransformation_created(_handle);
    }
  }

  /// The input [SpatialReference].
  SpatialReference? get inputSpatialReference => _inputSpatialReference.value;

  final Memoized<SpatialReference?> _inputSpatialReference;

  /// True if the dataset needed by the Projection Engine is missing from the
  /// local file system.
  bool get isMissingProjectionEngineFiles {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_DatumTransformation_getIsMissingProjectionEngineFiles(
              _handle, errorHandler);
    });
  }

  /// The name of the datum transformation.
  ///
  /// For multi-step transformations, the name contains the concatenated names
  /// of each step's transformation, separated by a plus sign '+'. If the
  /// transformation is inverted, the name starts with a tilde (~).
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DatumTransformation_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The output [SpatialReference].
  SpatialReference? get outputSpatialReference => _outputSpatialReference.value;

  final Memoized<SpatialReference?> _outputSpatialReference;

  /// Returns the inverse of this datum transformation.
  ///
  /// Return Value: A [DatumTransformation] representing the inverse, or null if
  /// an inverse for this data transformation does not exist.
  DatumTransformation getInverse() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_DatumTransformation_getInverse(
          _handle, errorHandler);
    });
    return DatumTransformation._fromHandle(objectHandle)!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DatumTransformation) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_DatumTransformation_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_DatumTransformation_getHash(_handle, errorHandler);
    });
  }
}

/// Indicates the instantiated concrete datum transformation.
enum _DatumTransformationType {
  /// Represents a [GeographicTransformation] instance.
  geographicTransformation,

  /// Represents a [HorizontalVerticalTransformation] instance.
  horizontalVerticalTransformation;

  factory _DatumTransformationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return geographicTransformation;
      case 2:
        return horizontalVerticalTransformation;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case geographicTransformation:
        return 1;
      case horizontalVerticalTransformation:
        return 2;
    }
  }
}

/// An elliptic arc segment for use in a multipart geometry.
///
/// An elliptic arc is the portion of the boundary of a 2D ellipse that connects
/// two points.
final class EllipticArcSegment extends Segment {
  static EllipticArcSegment? _fromHandle(RT_EllipticArcSegmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return EllipticArcSegment._withHandle(handle);
  }

  EllipticArcSegment._withHandle(super.handle) : super._withHandle();

  /// Creates an [EllipticArcSegment] that is a partial circle shape from the
  /// center point and radius of the embedded circle, and the start and central
  /// angle around that circle.
  ///
  /// The z-value and m-value of the center point (if present) are ignored. Use
  /// `EllipticArcSegment.circularEllipticArcWithStartEndAndInterior` to create
  /// a circular [EllipticArcSegment] with end points with z-value and/or
  /// m-value.
  ///
  /// Parameters:
  /// - `centerPoint` — The center point of the embedded circle.
  /// - `radius` — The distance from the center of the embedded circle to its
  /// perimeter.
  /// - `startAngle` — The parametric angle in radians of the start of the arc
  /// relative to the major axis of the embedded ellipse.
  /// - `centralAngle` — The parametric angle in radians measuring the span of
  /// the arc from [EllipticArcSegment.startAngle] to
  /// [EllipticArcSegment.endAngle].
  /// - `spatialReference` — The spatial reference of the new segment.
  factory EllipticArcSegment.circularEllipticArcWithCenterRadiusAndAngles(
      {required ArcGISPoint centerPoint,
      required double radius,
      required double startAngle,
      required double centralAngle,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_EllipticArcSegment_createCircularEllipticArcWithCenterRadiusAndAngles(
              centerPoint._handle,
              radius,
              startAngle,
              centralAngle,
              spatialReference?._handle ?? ffi.nullptr,
              errorHandler);
    });
    final EllipticArcSegment object = EllipticArcSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an [EllipticArcSegment] from start, end, and interior points that
  /// is a partial circle shape.
  ///
  /// The z-value and m-value of the start and end points (if present) are used
  /// in the circular [EllipticArcSegment]. The z-value and m-value of the
  /// interior point (if present) are ignored.
  ///
  /// Parameters:
  /// - `startPoint` — The start point of the segment.
  /// - `endPoint` — The end point of the segment.
  /// - `interiorPoint` — A point along the circular arc, between the start and
  /// end points.
  /// - `spatialReference` — The spatial reference of the new segment.
  factory EllipticArcSegment.circularEllipticArcWithStartEndAndInterior(
      {required ArcGISPoint startPoint,
      required ArcGISPoint endPoint,
      required ArcGISPoint interiorPoint,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_EllipticArcSegment_createCircularEllipticArcWithStartEndAndInterior(
              startPoint._handle,
              endPoint._handle,
              interiorPoint._handle,
              spatialReference?._handle ?? ffi.nullptr,
              errorHandler);
    });
    final EllipticArcSegment object = EllipticArcSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an elliptic arc based on parameters that define an ellipse and the
  /// portion of that ellipse that defines the arc.
  ///
  /// The spatial reference parameter is used if the center point parameter has
  /// a null spatial reference. If both spatial references are supplied, they
  /// must be equal.
  ///
  /// The z-value and m-value of the center point (if present) are ignored. Use
  /// [EllipticArcSegment.withStartAndEndpoints] to create an
  /// [EllipticArcSegment] with end points with z-value and/or m-value.
  ///
  /// Parameters:
  /// - `centerPoint` — The center point of the embedded ellipse.
  /// - `rotationAngle` — The angle in radians by which the major axis of the
  /// embedded ellipse is rotated from the x-axis.
  /// - `semiMajorAxis` — The length of the semi-major axis of the embedded
  /// ellipse in the units of the spatial reference.
  /// - `minorMajorRatio` — The ratio of the length of the semi-minor axis to
  /// the length of the semi-major axis of the embedded ellipse.
  /// - `startAngle` — The parametric angle in radians of the start of the arc
  /// relative to the major axis of the embedded ellipse.
  /// - `centralAngle` — The parametric angle in radians measuring the span of
  /// the arc from [EllipticArcSegment.startAngle] to
  /// [EllipticArcSegment.endAngle].
  /// - `spatialReference` — A spatial reference to use for the segment if the
  /// center point parameter does not have a spatial reference set.
  factory EllipticArcSegment.withCenter(
      {required ArcGISPoint centerPoint,
      required double rotationAngle,
      required double semiMajorAxis,
      required double minorMajorRatio,
      required double startAngle,
      required double centralAngle,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_createWithCenter(
          centerPoint._handle,
          rotationAngle,
          semiMajorAxis,
          minorMajorRatio,
          startAngle,
          centralAngle,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final EllipticArcSegment object = EllipticArcSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an elliptic arc segment from the given start and end points, and
  /// other parameters that define an ellipse.
  ///
  /// The z-value and m-value of the start and end points (if present) are used
  /// in the [EllipticArcSegment].
  ///
  /// To maintain the given startPoint and endPoint in the new segment, the
  /// other parameters may be adjusted if required. Such adjustments are made
  /// according to the [Scalable Vector Graphics 1.1
  /// Specification, Appendix F.6.5](https://www.w3.org/TR/SVG11/implnote.html#ArcConversionEndpointToCenter).
  /// If these cannot be adjusted sufficiently, an arc represented with a
  /// straight line is returned.
  ///
  /// Parameters:
  /// - `startPoint` — The start point of the segment.
  /// - `endPoint` — The end point of the segment.
  /// - `rotationAngle` — The angle in radians by which the major axis of the
  /// embedded ellipse is rotated from the x-axis.
  /// - `isMinor` — True if [EllipticArcSegment.centralAngle] of the segment is
  /// less than PI.
  /// - `isCounterClockwise` — True if the direction of the segment, from start
  /// point to end point, proceeds in a counterclockwise direction, otherwise
  /// false.
  /// - `semiMajorAxis` — The length of the semi-major axis of the embedded
  /// ellipse in the units of the spatial reference.
  /// - `minorMajorRatio` — The ratio of the length of the semi-minor axis to
  /// the length of the semi-major axis of the embedded ellipse.
  /// - `spatialReference` — A spatial reference to use for the segment if the
  /// points do not have spatial references set.
  factory EllipticArcSegment.withStartAndEndpoints(
      {required ArcGISPoint startPoint,
      required ArcGISPoint endPoint,
      required double rotationAngle,
      required bool isMinor,
      required bool isCounterClockwise,
      required double semiMajorAxis,
      required double minorMajorRatio,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_createWithStartAndEndpoints(
          startPoint._handle,
          endPoint._handle,
          rotationAngle,
          isMinor,
          isCounterClockwise,
          semiMajorAxis,
          minorMajorRatio,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final EllipticArcSegment object = EllipticArcSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The center point of the ellipse that this segment is defined upon.
  ArcGISPoint get centerPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getCenterPoint(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The parametric angle in radians measuring the span of the arc from
  /// [EllipticArcSegment.startAngle] to [EllipticArcSegment.endAngle].
  ///
  /// A positive value corresponds to a counterclockwise arc sweep.
  ///
  /// This value is always between -2*PI and 2*PI, these limits indicating this
  /// arc forms a complete ellipse in either clockwise or counterclockwise
  /// direction.
  double get centralAngle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getCentralAngle(
          _handle, errorHandler);
    });
  }

  /// The parametric angle in radians of the end of the arc relative to the
  /// major axis of the embedded ellipse.
  ///
  /// A positive value corresponds to a counterclockwise rotation from the major
  /// axis.
  double get endAngle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getEndAngle(
          _handle, errorHandler);
    });
  }

  /// Indicates if this arc is a portion of the boundary of a 2D circle.
  ///
  /// An elliptic arc is circular if the ellipse upon which it is based is a
  /// circle, meaning the lengths of its major and minor axes are equal.
  ///
  /// Use `EllipticArcSegment.circularEllipticArcWithCenterRadiusAndAngles` and
  /// `EllipticArcSegment.circularEllipticArcWithStartEndAndInterior` to create
  /// circular arcs.
  bool get isCircular {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getIsCircular(
          _handle, errorHandler);
    });
  }

  /// Indicates if the direction of the segment, from start point to end point,
  /// proceeds in a counterclockwise direction.
  bool get isCounterClockwise {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getIsCounterClockwise(
          _handle, errorHandler);
    });
  }

  /// The ratio of the length of the semi-minor axis to the semi-major axis.
  double get minorMajorRatio {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getMinorMajorRatio(
          _handle, errorHandler);
    });
  }

  /// The angle in radians by which the major axis of the ellipse this segment
  /// is based upon is rotated from the x-axis.
  double get rotationAngle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getRotationAngle(
          _handle, errorHandler);
    });
  }

  /// The length of the longer of the two axes of the ellipse upon which this
  /// arc is based.
  ///
  /// The semi-major axis always lies on the line between 0 and PI radians.
  ///
  /// The length is in the units of the spatial reference.
  double get semiMajorAxis {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getSemiMajorAxis(
          _handle, errorHandler);
    });
  }

  /// The length of the shorter of the two axes of the ellipse upon which this
  /// arc is based.
  ///
  /// The semi-minor axis always lies on the line between PI/2 and 3*PI/2
  /// radians.
  ///
  /// The length is in the units of the spatial reference.
  double get semiMinorAxis {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getSemiMinorAxis(
          _handle, errorHandler);
    });
  }

  /// The parametric angle in radians of the start of the arc relative to the
  /// major axis of the embedded ellipse.
  ///
  /// A positive value corresponds to a counterclockwise rotation from the major
  /// axis.
  double get startAngle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EllipticArcSegment_getStartAngle(
          _handle, errorHandler);
    });
  }
}

/// A geometry that represents a rectangular shape.
///
/// An [Envelope] is an axis-aligned box described by the coordinates of the
/// lower left corner and the coordinates of the upper right corner. They are
/// commonly used to represent the spatial extent covered by layers or other
/// geometries, or to define an area of interest. They can be used as the
/// geometry for a graphic and as an input for many spatial operations. Although
/// they both represent a geographic area, an [Envelope] is distinct from a
/// [Polygon], and they cannot always be used interchangeably.
///
/// New instances of [Envelope] are defined by specifying a minimum and maximum
/// x-coordinate and minimum and maximum y-coordinate, and a [SpatialReference].
/// Optionally, a minimum and maximum z-value can be specified to define the
/// depth of the envelope.
final class Envelope extends Geometry {
  static Envelope? _fromHandle(RT_EnvelopeHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Envelope._withHandle(handle);
  }

  Envelope._withHandle(super.handle) : super._withHandle();

  /// Creates an envelope from a center point and a width, height, and depth.
  ///
  /// The spatial reference of the resulting envelope comes from the center
  /// point.
  ///
  /// Parameters:
  /// - `center` — The center point for the envelope.
  /// - `width` — The width of the envelope around the center point.
  /// - `height` — The height of the envelope around the center point.
  /// - `depth` — The depth of the envelope around the center point.
  factory Envelope.fromCenter(ArcGISPoint center,
      {required double width, required double height, double? depth}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithCenterPointCombined(
          center._handle, width, height, depth, errorHandler);
    });
    return Envelope._withHandle(handle);
  }

  /// Creates an envelope from any two points.
  ///
  /// The spatial reference of the points must be the same. The spatial
  /// reference of the result envelope comes from the points. If the values for
  /// min parameters are bigger than max parameters then they are re-ordered.
  /// The resulting envelope always has min less than or equal to max.
  ///
  /// Parameters:
  /// - `a` — The minimal values for the envelope.
  /// - `b` — The maximum values for the envelope.
  factory Envelope.fromPoints(ArcGISPoint a, ArcGISPoint b) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithPoints(
          a._handle, b._handle, errorHandler);
    });
    return Envelope._withHandle(handle);
  }

  /// Creates an envelope based on the x,y coordinates with a spatial reference.
  ///
  /// If the values for min parameters are bigger than max parameters then they
  /// are re-ordered. The resulting envelope always has min less than or equal
  /// to max.
  ///
  /// Parameters:
  /// - `xMin` — The minimal x-value.
  /// - `yMin` — The minimal y-value.
  /// - `xMax` — The maximum x-value.
  /// - `yMax` — The maximum y-value.
  /// - `spatialReference` — The spatial reference for the envelope.
  factory Envelope.fromXY(
      {required double xMin,
      required double yMin,
      required double xMax,
      required double yMax,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithXYSpatialReference(xMin, yMin,
          xMax, yMax, spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final Envelope object = Envelope._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an envelope based on the x, y and m values with a spatial
  /// reference.
  ///
  /// If the values for min parameters are bigger than max parameters then they
  /// are re-ordered. The resulting envelope always has min less than or equal
  /// to max.
  ///
  /// Parameters:
  /// - `xMin` — The minimal x-value.
  /// - `yMin` — The minimal y-value.
  /// - `xMax` — The maximum x-value.
  /// - `yMax` — The maximum y-value.
  /// - `mMin` — The minimal m-value.
  /// - `mMax` — The maximum m-value.
  /// - `spatialReference` — The spatial reference for the envelope.
  factory Envelope.fromXYM(
      {required double xMin,
      required double yMin,
      required double xMax,
      required double yMax,
      required double mMin,
      required double mMax,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithMSpatialReference(
          xMin,
          yMin,
          xMax,
          yMax,
          mMin,
          mMax,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final Envelope object = Envelope._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an envelope based on x, y, and z values with the spatial
  /// reference.
  ///
  /// If the values for min parameters are bigger than max parameters then they
  /// are re-ordered. The resulting envelope always has min less than or equal
  /// to max.
  ///
  /// Parameters:
  /// - `xMin` — The minimal x-value.
  /// - `yMin` — The minimal y-value.
  /// - `xMax` — The maximum x-value.
  /// - `yMax` — The maximum y-value.
  /// - `zMin` — The minimal z-value.
  /// - `zMax` — The maximum z-value.
  /// - `spatialReference` — The spatial reference for the envelope.
  factory Envelope.fromXYZ(
      {required double xMin,
      required double yMin,
      required double xMax,
      required double yMax,
      required double zMin,
      required double zMax,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithXYZSpatialReference(
          xMin,
          yMin,
          xMax,
          yMax,
          zMin,
          zMax,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final Envelope object = Envelope._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates an envelope based on the x, y, z and m values with a spatial
  /// reference.
  ///
  /// If the values for min parameters are bigger than max parameters then they
  /// are re-ordered. The resulting envelope always has min less than or equal
  /// to max.
  ///
  /// Parameters:
  /// - `xMin` — The minimal x-value.
  /// - `yMin` — The minimal y-value.
  /// - `xMax` — The maximum x-value.
  /// - `yMax` — The maximum y-value.
  /// - `zMin` — The minimal z-value.
  /// - `zMax` — The maximum z-value.
  /// - `mMin` — The minimal m-value.
  /// - `mMax` — The maximum m-value.
  /// - `spatialReference` — The spatial reference for the envelope.
  factory Envelope.fromXYZM(
      {required double xMin,
      required double yMin,
      required double xMax,
      required double yMax,
      required double zMin,
      required double zMax,
      required double mMin,
      required double mMax,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_createWithZMSpatialReference(
          xMin,
          yMin,
          xMax,
          yMax,
          zMin,
          zMax,
          mMin,
          mMax,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final Envelope object = Envelope._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The center point for the envelope.
  ///
  /// Creates a new Point.
  ArcGISPoint get center {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getCenter(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The depth (ZMax - ZMin) for the envelope.
  ///
  /// A 2D envelope has zero depth. Returns NAN if the envelope is empty or if
  /// an error occurs.
  double get depth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getDepth(_handle, errorHandler);
    });
  }

  /// The height for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getHeight(_handle, errorHandler);
    });
  }

  /// The m maximum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double? get mMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getMMaxNullable(_handle, errorHandler);
    });
  }

  /// The m minimum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double? get mMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getMMinNullable(_handle, errorHandler);
    });
  }

  /// The width for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getWidth(_handle, errorHandler);
    });
  }

  /// The x maximum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get xMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getXMax(_handle, errorHandler);
    });
  }

  /// The x minimum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get xMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getXMin(_handle, errorHandler);
    });
  }

  /// The y maximum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get yMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getYMax(_handle, errorHandler);
    });
  }

  /// The y minimum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double get yMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getYMin(_handle, errorHandler);
    });
  }

  /// The z maximum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double? get zMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getZMaxNullable(_handle, errorHandler);
    });
  }

  /// The z minimum value for the envelope.
  ///
  /// Returns NAN if an error occurs.
  double? get zMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Envelope_getZMinNullable(_handle, errorHandler);
    });
  }
}

/// The envelope builder allows you to create and modify envelope geometries
/// incrementally.
///
/// Envelope geometries are immutable and cannot be changed directly once
/// created. Use the constructors to define minimum and maximum x,y coordinates,
/// z and m values, and a [SpatialReference]. Once set, the [SpatialReference]
/// cannot be changed. Use [GeometryBuilder.toGeometry] to return the new
/// [Envelope] from the builder.
final class EnvelopeBuilder extends GeometryBuilder {
  static EnvelopeBuilder? _fromHandle(RT_EnvelopeBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return EnvelopeBuilder._withHandle(handle);
  }

  EnvelopeBuilder._withHandle(super.handle) : super._withHandle();

  /// Creates an envelope builder from a center point and a width, height, and
  /// depth.
  ///
  /// Parameters:
  /// - `center` — The center point for the envelope.
  /// - `width` — The width of the envelope around the center point.
  /// - `height` — The height of the envelope around the center point.
  /// - `depth` — The depth of the envelope around the center point.
  factory EnvelopeBuilder.fromCenter(ArcGISPoint center,
      {required double width, required double height, double? depth}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_createFromCenterPointCombined(
          center._handle, width, height, depth, errorHandler);
    });
    return EnvelopeBuilder._withHandle(handle);
  }

  /// Creates an envelope builder from the specified [Envelope].
  ///
  /// The [SpatialReference] of the new envelope builder will match that of the
  /// given [Envelope]. Use this constructor in workflows that create a modified
  /// version of an existing geometry.
  ///
  /// Parameters:
  /// - `envelope` — The envelope.
  factory EnvelopeBuilder.fromEnvelope(Envelope? envelope) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_createFromEnvelope(
          envelope?._handle ?? ffi.nullptr, errorHandler);
    });
    return EnvelopeBuilder._withHandle(handle);
  }

  /// Creates an envelope builder.
  ///
  /// Parameters:
  /// - `spatialReference` — The builder's spatial reference.
  factory EnvelopeBuilder.fromSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_createFromSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final EnvelopeBuilder object = EnvelopeBuilder._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The center point of the [Envelope] being constructed.
  ArcGISPoint get center {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getCenter(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The depth of the [Envelope] being constructed.
  ///
  /// This is the difference between the minimum and maximum z values. A 2D
  /// envelope has zero depth.
  double get depth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getDepth(_handle, errorHandler);
    });
  }

  /// The height of the [Envelope] being constructed.
  ///
  /// This is the difference between the minimum and maximum y coordinates.
  double get height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getHeight(_handle, errorHandler);
    });
  }

  /// The m maximum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get mMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getMMax(_handle, errorHandler);
    });
  }

  set mMax(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setMMax(_handle, value, errorHandler);
    });
  }

  /// The m minimum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get mMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getMMin(_handle, errorHandler);
    });
  }

  set mMin(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setMMin(_handle, value, errorHandler);
    });
  }

  /// The width of the [Envelope] being constructed.
  ///
  /// This is the difference between the minimum and maximum x coordinates.
  double get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getWidth(_handle, errorHandler);
    });
  }

  /// The x maximum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get xMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getXMax(_handle, errorHandler);
    });
  }

  set xMax(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setXMax(_handle, value, errorHandler);
    });
  }

  /// The x minimum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get xMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getXMin(_handle, errorHandler);
    });
  }

  set xMin(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setXMin(_handle, value, errorHandler);
    });
  }

  /// The y maximum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get yMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getYMax(_handle, errorHandler);
    });
  }

  set yMax(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setYMax(_handle, value, errorHandler);
    });
  }

  /// The y minimum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get yMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getYMin(_handle, errorHandler);
    });
  }

  set yMin(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setYMin(_handle, value, errorHandler);
    });
  }

  /// The z maximum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get zMax {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getZMax(_handle, errorHandler);
    });
  }

  set zMax(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setZMax(_handle, value, errorHandler);
    });
  }

  /// The z minimum value of the [Envelope] being constructed.
  ///
  /// Returns NAN if an error occurs.
  double get zMin {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_getZMin(_handle, errorHandler);
    });
  }

  set zMin(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setZMin(_handle, value, errorHandler);
    });
  }

  /// Adjusts the envelope to be within the bounds of its spatial reference's
  /// extent.
  ///
  /// Return Value: An envelope object adjusted for wraparound or null if an
  /// error occurs.
  Envelope _adjustForWrapAround() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_EnvelopeBuilder_adjustForWrapAround(
          _handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle)!;
  }

  /// Centers the envelope at the specified point.
  ///
  /// The point's spatial reference must be the same as the envelope builder's.
  ///
  /// Parameters:
  /// - `point` — The point to center on.
  void centerAt({required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_centerAt(
          _handle, point._handle, errorHandler);
    });
  }

  /// Adjust the envelope's aspect ratio to match the ratio of the given width
  /// and height.
  ///
  /// The operation preserves the center of the envelope and only increases
  /// either height or width, not both. If the new width would be greater than
  /// the old, the width is changed and the height remains the same. If the new
  /// width would be less than or equal to the old, the height is changed and
  /// the width remains the same.
  ///
  /// Parameters:
  /// - `width` — A width.
  /// - `height` — A height.
  void changeAspectRatio({required double width, required double height}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_changeAspectRatio(
          _handle, width, height, errorHandler);
    });
  }

  /// Expands the envelope at the anchor point by the given factor.
  ///
  /// A factor of less than 1.0 shrinks the envelope and greater than 1.0
  /// expands it.
  ///
  /// Parameters:
  /// - `factor` — The factor to scale the envelope by.
  /// - `anchor` — The point at which to anchor the expansion. If null,
  /// [EnvelopeBuilder.center] is used as the anchor point.
  void expandBy(double factor, {ArcGISPoint? anchor}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_expandCombined(
          _handle, factor, anchor?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Adjusts the envelope's x-values to be within the bounds of the assigned
  /// spatial reference.
  void _normalize() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_normalize(_handle, errorHandler);
    });
  }

  /// Normalizes the envelope to the passed in envelope.
  ///
  /// Parameters:
  /// - `envelope` — The envelope to normalize against.
  void _normalizeToEnvelope({required Envelope envelope}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_normalizeToEnvelope(
          _handle, envelope._handle, errorHandler);
    });
  }

  /// Moves the builder's envelope geometry by the given offsets in the x and y
  /// dimension.
  ///
  /// Parameters:
  /// - `offsetX` — The number of units to move the envelope on the x axis.
  /// - `offsetY` — The number of units to move the envelope on the y axis.
  void offsetBy({required double offsetX, required double offsetY}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_offsetBy(
          _handle, offsetX, offsetY, errorHandler);
    });
  }

  /// Set the m-values for the envelope.
  ///
  /// Parameters:
  /// - `mMin` — The m minimum value for the envelope.
  /// - `mMax` — The m maximum value for the envelope.
  void setM({required double mMin, required double mMax}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setM(_handle, mMin, mMax, errorHandler);
    });
  }

  /// Set the x,y coordinates for the envelope.
  ///
  /// Parameters:
  /// - `xMin` — The x minimum value for the envelope.
  /// - `yMin` — The y minimum value for the envelope.
  /// - `xMax` — The x maximum value for the envelope.
  /// - `yMax` — The y maximum value for the envelope.
  void setXY(
      {required double xMin,
      required double yMin,
      required double xMax,
      required double yMax}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setXY(
          _handle, xMin, yMin, xMax, yMax, errorHandler);
    });
  }

  /// Set the z-values for the envelope.
  ///
  /// Parameters:
  /// - `zMin` — The z minimum value for the envelope.
  /// - `zMax` — The z maximum value for the envelope.
  void setZ({required double zMin, required double zMax}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_setZ(_handle, zMin, zMax, errorHandler);
    });
  }

  /// Finds the union of the builder's envelope and the specified envelope and
  /// updates the envelope builder with the result.
  ///
  /// Parameters:
  /// - `envelope` — Another envelope to union with.
  void unionWithEnvelope({required Envelope envelope}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_unionWithEnvelope(
          _handle, envelope._handle, errorHandler);
    });
  }

  /// Finds the union of the builder's envelope and the specified point and
  /// updates the envelope builder with the result.
  ///
  /// Parameters:
  /// - `point` — A point to union with.
  void unionWithPoint({required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_EnvelopeBuilder_unionWithPoint(
          _handle, point._handle, errorHandler);
    });
  }
}

/// Indicates the location of a point relative to a GARS cell.
enum GarsConversionMode {
  /// Represents a GARS cell by the coordinate of its south-west corner.
  lowerLeft,

  /// Represents a GARS cell by the coordinate of its center.
  center;

  factory GarsConversionMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return lowerLeft;
      case 1:
        return center;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case lowerLeft:
        return 0;
      case center:
        return 1;
    }
  }
}

/// The required parameters for calling [GeometryEngine.ellipseGeodesic].
///
/// The parameters needed when calling GeometryEngine's ellipseGeodesic method.
final class GeodesicEllipseParameters implements ffi.Finalizable {
  final RT_GeodesicEllipseParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeodesicEllipseParameters_destroy.cast());

  static GeodesicEllipseParameters? _fromHandle(
      RT_GeodesicEllipseParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeodesicEllipseParameters._withHandle(handle);
  }

  GeodesicEllipseParameters._withHandle(
      RT_GeodesicEllipseParametersHandle handle)
      : _angularUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodesicEllipseParameters_getAngularUnit(
                handle, errorHandler);
          });
          return AngularUnit._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeodesicEllipseParameters_setAngularUnit(
                handle, value._handle, errorHandler);
          });
        }),
        _linearUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodesicEllipseParameters_getLinearUnit(
                handle, errorHandler);
          });
          return LinearUnit._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeodesicEllipseParameters_setLinearUnit(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeodesicEllipseParameters_created(_handle);
    }
  }

  /// Creates a new [GeodesicEllipseParameters] object with the given values.
  ///
  /// Parameters:
  /// - `axisDirection` — The direction of the major axis of the ellipse as an
  /// angle in the given angular unit.
  /// - `angularUnit` — The angular unit of measure. If null degrees are
  /// assumed.
  /// - `center` — The center of the ellipse.
  /// - `linearUnit` — The linear unit of measure. If null meters are assumed.
  /// - `maxPointCount` — The max number of vertices in the ellipse.
  /// - `maxSegmentLength` — The max segment length of the result approximation
  /// in the given linear unit.
  /// - `geometryType` — The type of output geometry required, must be one of
  /// [GeometryType.polyline], [GeometryType.polygon], or
  /// [GeometryType.multipoint].
  /// - `semiAxis1Length` — The length of the semi-major or semi-minor axis of
  /// the ellipse in the given linear unit.
  /// - `semiAxis2Length` — The length of the semi-major or semi-minor axis of
  /// the ellipse in the given linear unit.
  factory GeodesicEllipseParameters(
      {double axisDirection = 0.0,
      AngularUnit? angularUnit,
      ArcGISPoint? center,
      LinearUnit? linearUnit,
      int maxPointCount = 10,
      double maxSegmentLength = 0.0,
      GeometryType geometryType = GeometryType.polygon,
      double semiAxis1Length = 0.0,
      double semiAxis2Length = 0.0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_createWith(
          axisDirection,
          angularUnit?._handle ?? ffi.nullptr,
          center?._handle ?? ffi.nullptr,
          linearUnit?._handle ?? ffi.nullptr,
          maxPointCount,
          maxSegmentLength,
          geometryType.coreValue,
          semiAxis1Length,
          semiAxis2Length,
          errorHandler);
    });
    return GeodesicEllipseParameters._withHandle(handle);
  }

  /// The unit of measure for [GeodesicEllipseParameters.axisDirection].
  ///
  /// By default, the angular unit is degrees.
  AngularUnit get angularUnit => _angularUnit.value;

  set angularUnit(AngularUnit value) => _angularUnit.value = value;

  final Memoized<AngularUnit> _angularUnit;

  /// The direction of the major axis of the ellipse as an angle, in
  /// [GeodesicEllipseParameters.angularUnit].
  double get axisDirection {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getAxisDirection(
          _handle, errorHandler);
    });
  }

  set axisDirection(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setAxisDirection(
          _handle, value, errorHandler);
    });
  }

  /// The center of the ellipse.
  ArcGISPoint? get center {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getCenter(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set center(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setCenter(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The type of the output geometry.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  set geometryType(GeometryType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setGeometryType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The unit of measure for [GeodesicEllipseParameters.semiAxis1Length],
  /// [GeodesicEllipseParameters.semiAxis2Length], and
  /// [GeodesicEllipseParameters.maxSegmentLength].
  ///
  /// By default, the linear unit is meters.
  LinearUnit get linearUnit => _linearUnit.value;

  set linearUnit(LinearUnit value) => _linearUnit.value = value;

  final Memoized<LinearUnit> _linearUnit;

  /// The max number of vertices in the ellipse.
  int get maxPointCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getMaxPointCount(
          _handle, errorHandler);
    });
  }

  set maxPointCount(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setMaxPointCount(
          _handle, value, errorHandler);
    });
  }

  /// The max segment length of the result, in
  /// [GeodesicEllipseParameters.linearUnit].
  double get maxSegmentLength {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getMaxSegmentLength(
          _handle, errorHandler);
    });
  }

  set maxSegmentLength(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setMaxSegmentLength(
          _handle, value, errorHandler);
    });
  }

  /// The length of the semi-major or semi-minor axis of the ellipse, in
  /// [GeodesicEllipseParameters.linearUnit].
  double get semiAxis1Length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getSemiAxis1Length(
          _handle, errorHandler);
    });
  }

  set semiAxis1Length(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setSemiAxis1Length(
          _handle, value, errorHandler);
    });
  }

  /// The length of the semi-major or semi-minor axis of the ellipse, in
  /// [GeodesicEllipseParameters.linearUnit].
  double get semiAxis2Length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicEllipseParameters_getSemiAxis2Length(
          _handle, errorHandler);
    });
  }

  set semiAxis2Length(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicEllipseParameters_setSemiAxis2Length(
          _handle, value, errorHandler);
    });
  }
}

/// The required parameters for calling [GeometryEngine.sectorGeodesic].
///
/// The parameters needed when calling GeometryEngine's sectorGeodesic method.
final class GeodesicSectorParameters implements ffi.Finalizable {
  final RT_GeodesicSectorParametersHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeodesicSectorParameters_destroy.cast());

  static GeodesicSectorParameters? _fromHandle(
      RT_GeodesicSectorParametersHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeodesicSectorParameters._withHandle(handle);
  }

  GeodesicSectorParameters._withHandle(RT_GeodesicSectorParametersHandle handle)
      : _angularUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodesicSectorParameters_getAngularUnit(
                handle, errorHandler);
          });
          return AngularUnit._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeodesicSectorParameters_setAngularUnit(
                handle, value._handle, errorHandler);
          });
        }),
        _linearUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodesicSectorParameters_getLinearUnit(
                handle, errorHandler);
          });
          return LinearUnit._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeodesicSectorParameters_setLinearUnit(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeodesicSectorParameters_created(_handle);
    }
  }

  /// Creates a new [GeodesicSectorParameters] object with the given values.
  ///
  /// Parameters:
  /// - `axisDirection` — The direction of the major axis of the ellipse as an
  /// angle in the given angular unit.
  /// - `angularUnit` — The angular unit of measure. If null degrees are
  /// assumed.
  /// - `center` — The center of the ellipse.
  /// - `linearUnit` — The linear unit of measure. If null meters are assumed.
  /// - `maxPointCount` — The max number of vertices in the ellipse.
  /// - `maxSegmentLength` — The max segment length of the result approximation
  /// in the given linear unit.
  /// - `geometryType` — The type of output geometry.
  /// - `sectorAngle` — The sweep angle of the sector in angular_unit.
  /// - `semiAxis1Length` — The length of the semi-major or semi-minor axis of
  /// the ellipse in the given linear unit.
  /// - `semiAxis2Length` — The length of the semi-major or semi-minor axis of
  /// the ellipse in the given linear unit.
  /// - `startDirection` — The direction of starting radius of the sector as an
  /// angle in angular_unit.
  factory GeodesicSectorParameters(
      {double axisDirection = 0.0,
      AngularUnit? angularUnit,
      ArcGISPoint? center,
      LinearUnit? linearUnit,
      int maxPointCount = 10,
      double maxSegmentLength = 0.0,
      GeometryType geometryType = GeometryType.polygon,
      double sectorAngle = 0.0,
      double semiAxis1Length = 0.0,
      double semiAxis2Length = 0.0,
      double startDirection = 0.0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_createWith(
          axisDirection,
          angularUnit?._handle ?? ffi.nullptr,
          center?._handle ?? ffi.nullptr,
          linearUnit?._handle ?? ffi.nullptr,
          maxPointCount,
          maxSegmentLength,
          geometryType.coreValue,
          sectorAngle,
          semiAxis1Length,
          semiAxis2Length,
          startDirection,
          errorHandler);
    });
    return GeodesicSectorParameters._withHandle(handle);
  }

  /// The unit of measure for [GeodesicSectorParameters.axisDirection],
  /// [GeodesicSectorParameters.sectorAngle], and
  /// [GeodesicSectorParameters.startDirection].
  ///
  /// By default, the angular unit is degrees.
  AngularUnit get angularUnit => _angularUnit.value;

  set angularUnit(AngularUnit value) => _angularUnit.value = value;

  final Memoized<AngularUnit> _angularUnit;

  /// The direction of the major axis of the ellipse as an angle in
  /// [GeodesicSectorParameters.angularUnit].
  double get axisDirection {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getAxisDirection(
          _handle, errorHandler);
    });
  }

  set axisDirection(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setAxisDirection(
          _handle, value, errorHandler);
    });
  }

  /// The center of the ellipse.
  ArcGISPoint? get center {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getCenter(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  set center(ArcGISPoint? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setCenter(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The type of the output geometry.
  GeometryType get geometryType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getGeometryType(
          _handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  set geometryType(GeometryType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setGeometryType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The unit of measure for [GeodesicSectorParameters.semiAxis1Length],
  /// [GeodesicSectorParameters.semiAxis2Length], and
  /// [GeodesicSectorParameters.maxSegmentLength].
  ///
  /// By default, the linear unit is meters.
  LinearUnit get linearUnit => _linearUnit.value;

  set linearUnit(LinearUnit value) => _linearUnit.value = value;

  final Memoized<LinearUnit> _linearUnit;

  /// The max number of vertices in the ellipse.
  int get maxPointCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getMaxPointCount(
          _handle, errorHandler);
    });
  }

  set maxPointCount(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setMaxPointCount(
          _handle, value, errorHandler);
    });
  }

  /// The max segment length of the result, in
  /// [GeodesicSectorParameters.linearUnit].
  double get maxSegmentLength {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getMaxSegmentLength(
          _handle, errorHandler);
    });
  }

  set maxSegmentLength(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setMaxSegmentLength(
          _handle, value, errorHandler);
    });
  }

  /// The sweep angle of the sector, in [GeodesicSectorParameters.angularUnit].
  /// The sweep angle goes clockwise from the starting radius.
  double get sectorAngle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getSectorAngle(
          _handle, errorHandler);
    });
  }

  set sectorAngle(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setSectorAngle(
          _handle, value, errorHandler);
    });
  }

  /// The length of the semi-major or semi-minor axis of the ellipse, in
  /// [GeodesicSectorParameters.linearUnit].
  double get semiAxis1Length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getSemiAxis1Length(
          _handle, errorHandler);
    });
  }

  set semiAxis1Length(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setSemiAxis1Length(
          _handle, value, errorHandler);
    });
  }

  /// The length of the semi-major or semi-minor axis of the ellipse, in
  /// [GeodesicSectorParameters.linearUnit].
  double get semiAxis2Length {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getSemiAxis2Length(
          _handle, errorHandler);
    });
  }

  set semiAxis2Length(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setSemiAxis2Length(
          _handle, value, errorHandler);
    });
  }

  /// The direction of starting radius of the sector as an angle, in
  /// [GeodesicSectorParameters.angularUnit].
  double get startDirection {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodesicSectorParameters_getStartDirection(
          _handle, errorHandler);
    });
  }

  set startDirection(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeodesicSectorParameters_setStartDirection(
          _handle, value, errorHandler);
    });
  }
}

/// The different types of geodetic curves.
enum GeodeticCurveType {
  /// A geodesic line (shortest path along two points on the ellipsoid).
  geodesic,

  /// A rhumb line (loxodrome).
  loxodrome,

  /// A great elliptic.
  greatElliptic,

  /// A normal section.
  normalSection,

  /// The segment shape is preserved in the projection where it is defined.
  shapePreserving;

  factory GeodeticCurveType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return geodesic;
      case 1:
        return loxodrome;
      case 2:
        return greatElliptic;
      case 3:
        return normalSection;
      case 4:
        return shapePreserving;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case geodesic:
        return 0;
      case loxodrome:
        return 1;
      case greatElliptic:
        return 2;
      case normalSection:
        return 3;
      case shapePreserving:
        return 4;
    }
  }
}

/// The returned results of calling [GeometryEngine.distanceGeodetic].
///
/// The results of calling GeometryEngine's distanceGeodetic methods.
final class GeodeticDistanceResult implements ffi.Finalizable {
  final RT_GeodeticDistanceResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeodeticDistanceResult_destroy.cast());

  static GeodeticDistanceResult? _fromHandle(
      RT_GeodeticDistanceResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeodeticDistanceResult._withHandle(handle);
  }

  GeodeticDistanceResult._withHandle(RT_GeodeticDistanceResultHandle handle)
      : _azimuthUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodeticDistanceResult_getAzimuthUnit(
                handle, errorHandler);
          });
          return AngularUnit._fromHandle(objectHandle)!;
        }),
        _distanceUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeodeticDistanceResult_getDistanceUnit(
                handle, errorHandler);
          });
          return LinearUnit._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeodeticDistanceResult_created(_handle);
    }
  }

  /// Output azimuth at point 1 towards point 2, in the angular unit that was
  /// used as a parameter when calling [GeometryEngine.distanceGeodetic].
  /// (clockwise angle between tangent vector at point1 in the direction of the
  /// curve towards point2 and meridian passing through the point1).
  double get azimuth1 {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodeticDistanceResult_getAzimuth1(
          _handle, errorHandler);
    });
  }

  /// Output azimuth at point 2 towards point 1, in the angular unit that was
  /// used as a parameter when calling [GeometryEngine.distanceGeodetic].
  /// (clockwise angle between tangent vector at point2 in the direction of the
  /// curve towards point2 and meridian passing through the point2).
  double get azimuth2 {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodeticDistanceResult_getAzimuth2(
          _handle, errorHandler);
    });
  }

  /// The unit of measure for azimuth1 and azimuth2.
  AngularUnit get azimuthUnit => _azimuthUnit.value;

  final Memoized<AngularUnit> _azimuthUnit;

  /// The geodetic distance from the two input points, in the linear unit used
  /// as a parameter when calling [GeometryEngine.distanceGeodetic].
  double get distance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeodeticDistanceResult_getDistance(
          _handle, errorHandler);
    });
  }

  /// The unit of measure for distance.
  LinearUnit get distanceUnit => _distanceUnit.value;

  final Memoized<LinearUnit> _distanceUnit;
}

/// Used to transform coordinates of geometries between spatial references that
/// have two different geographic coordinate systems.
///
/// Each geographic transformation has an input and an output spatial reference.
/// The transformation operates on the horizontal (geographic) datums in each
/// spatial reference.
///
/// The inverse of the geographic transformation, if any, used to transform in
/// the opposite direction, may be accessed using a member function.
///
/// A geographic transformation can be constructed from a single geographic
/// transformation step object, or from a list of geographic transformation
/// steps objects that are chained together. Most transformations between
/// spatial references that do not share the WGS 1984 datum use WGS 1984 as an
/// intermediate datum. Thus, it is common to create a geographic transformation
/// object with two geographic transformation steps: first to transform from the
/// datum in the input spatial reference to WGS 1984, and then from WGS 1984 to
/// the output spatial reference's datum. There are a limited number of
/// transformations directly between two non-WGS84 datums, such as WKID 4461,
/// which is NAD_1983_HARN_To_NAD_1983_NSRS2007_1. These do not need WGS 1984 as
/// an intermediate datum.
///
/// In most cases, you do not need to construct your own
/// [GeographicTransformation]. You can get a list of suitable transformations
/// for a given input and output spatial reference using one of the functions on
/// the transformation catalog class.
///
/// A geographic transformation object is immutable.
final class GeographicTransformation extends DatumTransformation {
  static GeographicTransformation? _fromHandle(
      RT_GeographicTransformationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeographicTransformation._withHandle(handle);
  }

  GeographicTransformation._withHandle(super.handle)
      : _steps = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeographicTransformation_getSteps(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// Create a single step transformation.
  ///
  /// Parameters:
  /// - `step` — A [GeographicTransformationStep] instance.
  factory GeographicTransformation.withStep(GeographicTransformationStep step) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformation_createWithStep(
          step._handle, errorHandler);
    });
    return GeographicTransformation._withHandle(handle);
  }

  /// Create a multi-step transformation from one or more
  /// [GeographicTransformationStep] instances.
  ///
  /// Use this when the multi-step transformation is known in advance. The
  /// output of each step should match the input of the following step. Then,
  /// you can use the new multi-step transformation where you would use a
  /// single-step transformation.
  ///
  /// Parameters:
  /// - `steps` — A [List] containing [GeographicTransformationStep] instances.
  factory GeographicTransformation.withSteps(
      List<GeographicTransformationStep> steps) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreSteps =
        steps.toArray(valueType: _ElementType.geographicTransformationStep);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformation_createWithSteps(
          coreSteps._handle, errorHandler);
    });
    final GeographicTransformation object =
        GeographicTransformation._withHandle(handle);
    object._steps.value.setCache(steps);
    return object;
  }

  /// The array of geographic transformation steps that define this geographic
  /// transformation.
  List<GeographicTransformationStep> get steps => _steps.value;

  final Memoized<_ArrayList<GeographicTransformationStep>> _steps;
}

/// Represents a step in the process of transforming between datums.
///
/// Each geographic transformation step can be constructed from a well-known ID
/// (WKID) that represents a geographic transformation. Because the Projection
/// Engine supports thousands of transformations, WKIDs are not presented in the
/// SDK as enumerations. Instead, they are documented in the developers guide.
///
/// The list of supported WKIDs includes a transformation from every supported
/// datum to WGS 1984. Additionally, there is more limited list of
/// transformations directly between two non-WGS84 datums, such as
/// 4461, which is NAD_1983_HARN_To_NAD_1983_NSRS2007_1.
///
/// Transformations with more than one step typically go via WGS84, with one
/// forward and one inverse geographic transformation chained together to get
/// the required geographic coordinates.
///
/// A geographic transformation step object is immutable.
final class GeographicTransformationStep implements ffi.Finalizable {
  final RT_GeographicTransformationStepHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GeographicTransformationStep_destroy.cast());

  static GeographicTransformationStep? _fromHandle(
      RT_GeographicTransformationStepHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GeographicTransformationStep._withHandle(handle);
  }

  GeographicTransformationStep._withHandle(
      RT_GeographicTransformationStepHandle handle)
      : _projectionEngineFilenames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_GeographicTransformationStep_getProjectionEngineFilenames(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeographicTransformationStep_created(_handle);
    }
  }

  /// Creates a new [GeographicTransformationStep] instance from a well-known
  /// text string.
  ///
  /// Parameters:
  /// - `wkText` — The well-known text of the geographic transformation step to
  /// create.
  factory GeographicTransformationStep.withWkText(String wkText) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWkText = _CString(wkText);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_createWithWKText(
          coreWkText.bytes, errorHandler);
    });
    return GeographicTransformationStep._withHandle(handle);
  }

  /// Creates a new [GeographicTransformationStep] instance from a well-known
  /// ID.
  ///
  /// Occasionally, WKIDs may change, and older codes may be deprecated in favor
  /// of a new code. Both old (deprecated) and new (latest) WKIDs continue to
  /// work for instantiation, as long as they are supported by the Projection
  /// Engine. The [GeographicTransformationStep.wkid] property returns the new
  /// (latest) WKID code.
  ///
  /// Parameters:
  /// - `wkid` — The well-known ID of the geographic transformation step to
  /// create.
  factory GeographicTransformationStep.withWkid(int wkid) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_createWithWKID(
          wkid, errorHandler);
    });
    return GeographicTransformationStep._withHandle(handle);
  }

  /// True if this geographic transformation step instance is an inverted
  /// transformation.
  ///
  /// Transformations have a specific direction that is indicated by the
  /// [GeographicTransformationStep.wkText] value. An inverted transformation is
  /// used to transform geometries in the opposite direction to that indicated
  /// by the well-known text. [GeographicTransformation] has
  /// [DatumTransformation.inputSpatialReference] and
  /// [DatumTransformation.outputSpatialReference] properties that respect the
  /// inverse value of the contained transformation(s).
  ///
  /// This API supports a large number of transformation WKIDs, including
  /// transformations from every supported datum to the World Geodetic System
  /// 1984 (WGS84) datum. To transform coordinates between two non-WGS84 datums,
  /// typically one forward and one inverse [GeographicTransformationStep] are
  /// added to a [GeographicTransformation], to get the required inputs and
  /// outputs.
  bool get isInverse {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_getIsInverse(
          _handle, errorHandler);
    });
  }

  /// True if any files needed by the Projection Engine for this geographic
  /// transformation step are missing from the local file system.
  bool get isMissingProjectionEngineFiles {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeographicTransformationStep_getIsMissingProjectionEngineFiles(
              _handle, errorHandler);
    });
  }

  /// A list of the Projection Engine files required to support this geographic
  /// transformation step.
  ///
  /// Each name in the list includes the full path. Projection Engine datasets
  /// are used in grid-based transforms.
  List<String> get projectionEngineFilenames =>
      _projectionEngineFilenames.value;

  final Memoized<_ArrayList<String>> _projectionEngineFilenames;

  /// The well-known text of this geographic transformation step instance.
  ///
  /// This value does not respect the [GeographicTransformationStep.isInverse]
  /// property.
  String get wkText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_getWKText(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The well-known ID, or 0 if the transformation in this step does not have a
  /// well-known ID.
  ///
  /// Occasionally, WKIDs may change, and an older code may be deprecated in
  /// favor of a new code. This property returns the new (latest) WKID code.
  int get wkid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_getWKID(
          _handle, errorHandler);
    });
  }

  /// Returns the inverse of this geographic transformation step or null if the
  /// transformation is not invertible.
  ///
  /// Return Value: A [GeographicTransformationStep] representing the inverse or
  /// null if an inverse does not exist.
  GeographicTransformationStep getInverse() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_getInverse(
          _handle, errorHandler);
    });
    return GeographicTransformationStep._fromHandle(objectHandle)!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeographicTransformationStep) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_GeographicTransformationStep_getHash(
          _handle, errorHandler);
    });
  }
}

/// Base class for all classes that represent geometric shapes.
///
/// [Geometry] is the base class for two-dimensional (x,y) and three-dimensional
/// (x,y,z) geometries, such as [ArcGISPoint], [Multipoint], [Polyline],
/// [Polygon], and [Envelope]. It represents real-world objects by defining a
/// shape at a specific geographic location, and is used throughout the API to
/// represent the shapes of features and graphics, layer extents, viewpoints,
/// and GPS locations. It is also used to define the inputs and outputs for
/// spatial analysis and geoprocessing operations, and to measure distances and
/// areas.
///
/// All types of geometry have the following characteristics:
/// * A [SpatialReference] indicating the coordinate system used by its
/// coordinates.
/// * Can be empty, indicating that they have no specific location or shape.
/// * May have z-values and/or m-values to define elevation and measures,
/// respectively.
/// * Can be converted to and from JSON to be persisted or to be exchanged
/// directly with REST services.
///
/// Immutability
///
/// Most geometries are created and not changed for their lifetime. Examples
/// include features created to be stored in a geodatabase or read from a
/// non-editable layer, and features returned from tasks such as a spatial
/// query, geocode operation, network trace, or geoprocessing task. Immutable
/// geometries (geometries that cannot be changed) offer important benefits to
/// your app. They are inherently thread-safe, help prevent inadvertent changes,
/// and allow for certain performance optimizations.
///
/// If you want to modify the shape of a [Geometry] there are two options
/// available:
/// * [GeometryBuilder]. Use a geometry builder if you want to incrementally
/// reshape a geometry. If you want to reshape a [Polygon], for example, then
/// pass the polygon to a [PolygonBuilder]. The polygon builder copies the
/// polygon and provides methods to add, update, and delete the polygon parts
/// and segment vertices. The geometry builder represents the state of a
/// geometry under modification, and you can obtain it at any time using
/// [GeometryBuilder.toGeometry].
/// * `GeometryEditor`. Use a geometry editor if you want to allow the user to
/// interactively modify an existing geometry. Start the `GeometryEditor` by
/// passing the geometry to `GeometryEditor.start(Geometry)`. The start method
/// signals to the geometry editor to start capturing user interaction with the
/// map through mouse or touch gestures.
///
/// Note that the [GeometryEngine] offers a range of topological and spatial
/// transformations that can create a new geometry from an existing geometry.
/// The [GeometryEngine] allows you to perform actions on an existing geometry,
/// such as a buffer, cut, clip, densify, or project, to produce a new output
/// geometry. See [GeometryEngine] to explore various supported geometric
/// operations.
///
/// Coordinate units
///
/// The coordinates that define a geometry are only meaningful in the context of
/// the geometry's [SpatialReference]. The vertices and spatial reference
/// together allow your app to translate a real-world object from its location
/// on the Earth to its location on your map or scene.
///
/// In some cases, a geometry's spatial reference may not be set. For example, a
/// [Graphic] that does not have a spatial reference is drawn using the same
/// spatial reference as the [GeoViewController] to which it was added. If the
/// coordinates are in a different spatial reference, the graphics may not
/// display in the correct location, or at all.
///
/// When using [GeometryBuilder] to create a [Polyline] or [Polygon] from a
/// collection of [ArcGISPoint], you don't need to set the spatial reference of
/// every point before you add it to the builder, as it is assigned the spatial
/// reference of the builder itself. In most other cases, such as when using a
/// geometry in geometry operations or when editing a feature table,
/// [Geometry.spatialReference] must be set.
///
/// Spatial reference and projection
///
/// Changing the coordinates of a geometry to have the same shape and location
/// represented using a different [SpatialReference] is known as "projection" or
/// sometimes as "reprojection". Because geometries are immutable, they do not
/// have any member methods that project, transform, or otherwise modify their
/// content.
final class Geometry with JsonSerializable implements ffi.Finalizable {
  final RT_GeometryHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Geometry_destroy.cast());

  static Geometry? _fromHandle(RT_GeometryHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Geometry._objectTypeOf(handle)) {
      case GeometryType.point:
        return ArcGISPoint._withHandle(handle);
      case GeometryType.envelope:
        return Envelope._withHandle(handle);
      case GeometryType.multipoint:
        return Multipoint._withHandle(handle);
      case GeometryType.polygon:
        return Polygon._withHandle(handle);
      case GeometryType.polyline:
        return Polyline._withHandle(handle);
      case GeometryType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static GeometryType _objectTypeOf(RT_GeometryHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getObjectType(handle, errorHandler);
    });
    return GeometryType._fromCoreValue(coreValue);
  }

  GeometryType get _objectType => Geometry._objectTypeOf(_handle);

  Geometry._withHandle(RT_GeometryHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Geometry_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Geometry_created(_handle);
    }
  }

  /// Indicates the dimensionality of a [Geometry], relating to the number of
  /// spatial dimensions in which the geometry may have a size.
  ///
  /// You can use [Geometry.dimension] to work out what kind of symbol can be
  /// applied to a specific type of geometry. For example, [ArcGISPoint] and
  /// [Multipoint] are both zero-dimensional point geometries, and both can be
  /// displayed using a type of [MarkerSymbol]. [Polygon] and [Envelope] are
  /// both 2-dimensional area geometries that can be displayed using a type of
  /// [FillSymbol].
  ///
  /// Returns [GeometryDimension.unknown] if an error occurs.
  GeometryDimension get dimension {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getDimension(_handle, errorHandler);
    });
    return GeometryDimension._fromCoreValue(coreValue);
  }

  /// The minimum enclosing bounding-box (or [Envelope]) that covers the
  /// geometry.
  Envelope get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle)!;
  }

  /// True if this geometry contains curve segments, false otherwise.
  ///
  /// ArcGIS software supports polygon and polyline geometries that contain
  /// curve segments (where [Segment.isCurve] is true, sometimes known as true
  /// curves or nonlinear segments). Curves may be present in certain types of
  /// data, such as Mobile Map Packages (MMPK) or geometry JSON. When connecting
  /// to ArcGIS feature services that support curves (see
  /// [ArcGISFeatureServiceInfo.supportsTrueCurve]), this API retrieves
  /// densified versions of curve feature geometries by default.
  ///
  /// If a polygon or polyline geometry contains curve segments, this property
  /// returns true. You can use curve segments when using a [MultipartBuilder]
  /// to create or edit polygon and polyline geometries, and also get curve
  /// segments when iterating through the segments of existing [Multipart]
  /// geometries when this property returns true. You can also choose to return
  /// true curves from feature services by using
  /// [ArcGISEnvironment.serviceCurveGeometryMode].
  bool get hasCurves {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getHasCurves(_handle, errorHandler);
    });
  }

  /// True if the geometry has m values (measure values), false otherwise.
  ///
  /// M is a vertex value that is stored with the geometry. These values
  /// typically represent non-spatial measurements or attributes.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getHasM(_handle, errorHandler);
    });
  }

  /// True if the geometry has z-coordinate values, false otherwise.
  ///
  /// Only 3D geometries contain z-coordinate values. These values typically
  /// represent elevation, height, or depth.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getHasZ(_handle, errorHandler);
    });
  }

  /// True if the geometry is empty, false otherwise.
  ///
  /// A geometry is empty if it does not have valid geographic coordinates, even
  /// if the [SpatialReference] is specified. An empty [Geometry] is a valid
  /// object that has no location in space.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getIsEmpty(_handle, errorHandler);
    });
  }

  /// The spatial reference for this geometry.
  ///
  /// This can be null if the geometry is not associated with a
  /// [SpatialReference].
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// This indicates the type of geometrical shape it can represent, such as [Envelope], [Point] or [Polygon].
  ///
  /// Returns [GeometryType.unknown] if an error occurs.
  GeometryType get geometryType => _objectType;

  /// Checks if two geometries are approximately the same within the given
  /// tolerance.
  ///
  /// This function performs a lightweight comparison of two geometries that
  /// might be useful when writing test code. It uses the tolerance to compare
  /// each of x, y, and any other values the geometries possess (such as z or m)
  /// independently in the manner: abs(value1 - value2) <= tolerance. The single
  /// tolerance value is used even if the x, y, z or m units differ. This
  /// function does not respect modular arithmetic of spatial references which
  /// wrap around, so longitudes of -180 and +180 degrees are considered to
  /// differ by 360 degrees.
  ///
  /// Returns true if the difference of each is within the tolerance and all
  /// other properties of the geometries are exactly equal (such as spatial
  /// reference and vertex count). Returns false if an error occurs.
  ///
  /// For topological equality, use a relational operator such as
  /// [GeometryEngine.equals].
  ///
  /// Parameters:
  /// - `right` — The second geometry.
  /// - `tolerance` — The tolerance.
  ///
  /// Return Value: True if the geometries are equal, within the tolerance,
  /// otherwise false.
  bool equalsWithTolerance(
      {required Geometry right, required double tolerance}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_equalsWithTolerance(
          _handle, right._handle, tolerance, errorHandler);
    });
  }

  /// Creates a geometry from an ArcGIS JSON geometry representation.
  ///
  /// [Geometry] can be serialized and de-serialized to and from JSON. The
  /// [ArcGIS REST API documentation](https://developers.arcgis.com/documentation/common-data-types/geometry-objects.htm)
  /// describes the JSON representation of geometry objects. You can use this
  /// encoding and decoding mechanism to exchange geometries with REST Web
  /// services or to store them in text files.
  ///
  /// Parameters:
  /// - `inputJson` — JSON representation of geometry.
  /// - `spatialReference` — The geometry's spatial reference.
  ///
  /// Return Value: Geometry converted from a JSON String.
  static Geometry? fromJsonWithSpatialReference(
      {required String inputJson,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreInputJson = _CString(inputJson);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_fromJSONWithSpatialReference(
          coreInputJson.bytes,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  @override
  String toString() => toJsonString();

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Geometry.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Geometry_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Geometry) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Geometry_getHash(_handle, errorHandler);
    });
  }
}

/// Geometry builders allow you to create and modify geometries incrementally.
///
/// This is the base class for a range of geometry builders, such as a
/// [PointBuilder], [PolylineBuilder] and [PolygonBuilder]. Each [GeometryType]
/// has a corresponding type of builder. You can create and modify polygons with
/// [PolygonBuilder], envelopes with [EnvelopeBuilder], and so on. Use a
/// geometry builder in editing workflows where you need to build up or edit
/// geometry one vertex at a time, for example, when you need to add or edit a
/// vertex from a custom streaming GIS data source. You can either create an
/// empty geometry builder and build up the shape of a [Geometry], or you can
/// create a geometry builder with an existing [Geometry] and modify it.
///
/// When you construct the builder, you can explicitly set its
/// [SpatialReference] or you can construct the builder with a geometry and the
/// builder will adopt the [Geometry.spatialReference]. Once set, the
/// [SpatialReference] cannot be changed. The [SpatialReference] of any geometry
/// or coordinates added to the builder must be compatible with the
/// [SpatialReference] of the builder, as they will not be reprojected. The
/// [SpatialReference] of a geometry added to the builder can be null, in which
/// case the object is assumed to have the same [SpatialReference] as the
/// builder it is added to.
///
/// There are other ways to create and edit geometries. If you know all the
/// geometry coordinates up front, then you can use geometry constructors, such
/// as [Polygon], to create the geometry. If you are going to create a new
/// geometry as a result of a topological operation, such as the buffer
/// operation, then explore the [GeometryEngine]. If you want your app users to
/// interactively create or edit geometries in the user interface then use the
/// `GeometryEditor`.
final class GeometryBuilder implements ffi.Finalizable {
  final RT_GeometryBuilderHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeometryBuilder_destroy.cast());

  static GeometryBuilder? _fromHandle(RT_GeometryBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (GeometryBuilder._objectTypeOf(handle)) {
      case _GeometryBuilderType.envelopeBuilder:
        return EnvelopeBuilder._withHandle(handle);
      case _GeometryBuilderType.multipointBuilder:
        return MultipointBuilder._withHandle(handle);
      case _GeometryBuilderType.pointBuilder:
        return PointBuilder._withHandle(handle);
      case _GeometryBuilderType.polygonBuilder:
        return PolygonBuilder._withHandle(handle);
      case _GeometryBuilderType.polylineBuilder:
        return PolylineBuilder._withHandle(handle);
      case _GeometryBuilderType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _GeometryBuilderType _objectTypeOf(RT_GeometryBuilderHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getObjectType(handle, errorHandler);
    });
    return _GeometryBuilderType._fromCoreValue(coreValue);
  }

  _GeometryBuilderType get _objectType =>
      GeometryBuilder._objectTypeOf(_handle);

  GeometryBuilder._withHandle(RT_GeometryBuilderHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeometryBuilder_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeometryBuilder_created(_handle);
    }
  }

  /// The extent for the geometry being constructed in the geometry builder.
  Envelope get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle)!;
  }

  /// True if the geometry builder currently contains any curve segments, false
  /// otherwise.
  ///
  /// ArcGIS software supports polygon and polyline geometries that contain
  /// curve segments (where [Segment.isCurve] is true, sometimes known as true
  /// curves or nonlinear segments). Curves may be present in certain types of
  /// data, such as Mobile Map Packages (MMPKs), or geometry JSON.
  ///
  /// You can use curves in a [MultipartBuilder]. New segment types, such as
  /// [CubicBezierSegment] and [EllipticArcSegment], represent types of curve
  /// that can be added to polygon and polyline geometries.
  bool get hasCurves {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getHasCurves(_handle, errorHandler);
    });
  }

  /// True if the geometry builder supports geometries with m values, false
  /// otherwise.
  ///
  /// M values are often referred to as measures, and are used in linear
  /// referencing workflows on linear datasets. NaN is a valid m value. If true,
  /// m values are stored for each vertex of the constructed Geometry.
  /// Geometries with m values are created by using setters or constructors that
  /// take an m value as a parameter.
  bool get hasM {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getHasM(_handle, errorHandler);
    });
  }

  /// True if the geometry builder supports geometries with z values, false
  /// otherwise.
  ///
  /// Z values are generally used as a z coordinate, indicating height or
  /// elevation. NaN is a valid z value. If true, z values are stored for each
  /// vertex of the constructed Geometry. Geometries with z values are created
  /// by using setters or constructors that take a z value as a parameter.
  bool get hasZ {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getHasZ(_handle, errorHandler);
    });
  }

  /// True if no coordinates have been added to this geometry builder, false
  /// otherwise.
  ///
  /// An empty geometry builder may have a valid [SpatialReference], even
  /// without coordinates.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getIsEmpty(_handle, errorHandler);
    });
  }

  /// True if the geometry builder contains sufficient points to show a valid
  /// graphical sketch, false otherwise.
  ///
  /// This can be used as an initial lightweight check to see if the current
  /// state of a builder produces a non-empty geometry. For example, it may be
  /// used to enable or disable functionality in an editing user interface. The
  /// exact requirements vary depending on the type of geometry produced by the
  /// builder:
  /// * A [PointBuilder] must contain non-NaN x,y coordinates
  /// * A [MultipointBuilder] must contain at least one valid [ArcGISPoint]
  /// * An [EnvelopeBuilder] must contain non-NaN minimum and maximum x,y
  /// coordinates
  /// * A [PolylineBuilder] must contain at least one [MutablePart]. Each
  /// [MutablePart] it contains must have:
  ///   * At least two valid points, or
  ///   * At least one [Segment] where [Segment.isCurve] is true
  /// * A [PolygonBuilder] must contain at least one [MutablePart]. Each
  /// [MutablePart] it contains must have:
  ///   * At least three valid points, or
  ///   * At least one [Segment] where [Segment.isCurve] is true
  ///
  /// Note that this is not equivalent to topological simplicity, which is
  /// enforced by [GeometryEngine.simplify] and checked using
  /// [GeometryEngine.isSimple]. Geometries must be topologically simple to be
  /// successfully saved in a geodatabase or used in some service operations.
  ///
  /// It does not check the spatial reference and returns false if an error
  /// occurs.
  bool get isSketchValid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_getIsSketchValid(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the geometry.
  ///
  /// Once set, the [SpatialReference] of the geometry builder cannot be
  /// changed. Ensure that all objects added to the builder have a compatible
  /// [SpatialReference].
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Creates a geometry builder with the specified geometry as a starting point
  /// for further modification.
  ///
  /// Geometries with curves are supported.
  ///
  /// Parameters:
  /// - `geometry` — The geometry to use as the starting point for further
  /// modifications.
  ///
  /// Return Value: A new geometry builder.
  static GeometryBuilder createFromGeometry({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_createFromGeometry(
          geometry._handle, errorHandler);
    });
    return GeometryBuilder._fromHandle(objectHandle)!;
  }

  /// Creates an empty geometry builder which builds geometries of the specified
  /// [GeometryType].
  ///
  /// Parameters:
  /// - `geometryType` — The builder's geometry type.
  /// - `spatialReference` — The builder's spatial reference.
  ///
  /// Return Value: A new geometry builder.
  static GeometryBuilder createFromGeometryTypeAndSpatialReference(
      {required GeometryType geometryType,
      required SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeometryBuilder_createFromGeometryTypeAndSpatialReference(
              geometryType.coreValue,
              spatialReference?._handle ?? ffi.nullptr,
              errorHandler);
    });
    return GeometryBuilder._fromHandle(objectHandle)!;
  }

  /// Replaces the geometry currently stored in the geometry builder with the
  /// new geometry.
  ///
  /// This method can be used as an alternative to creating a new builder from
  /// an existing geometry. Note that this does not update the spatial reference
  /// of the builder and the builder geometry is cleared if the geometry is
  /// null. Geometries with curves are supported.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  void replaceGeometry({required Geometry? geometry}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeometryBuilder_replaceGeometry(
          _handle, geometry?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// Returns the geometry this geometry builder is constructing or modifying.
  ///
  /// Return Value: A geometry. This is passed to geometry functions.
  Geometry toGeometry() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryBuilder_toGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }
}

/// The different types of geometry builders.
///
/// Each of the different supported geometry builder types. Can get the type by
/// calling [GeometryBuilder._objectType].
enum _GeometryBuilderType {
  /// Point builder to which produces point geometry.
  pointBuilder,

  /// Envelope builder to which produces envelope geometry.
  envelopeBuilder,

  /// Polyline builder to which produces polyline geometry.
  polylineBuilder,

  /// Polygon builder to which produces polygon geometry.
  polygonBuilder,

  /// Multipoint builder to which produces multipoint geometry.
  multipointBuilder,

  /// An unknown geometry builder.
  unknown;

  factory _GeometryBuilderType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return pointBuilder;
      case 2:
        return envelopeBuilder;
      case 3:
        return polylineBuilder;
      case 4:
        return polygonBuilder;
      case 5:
        return multipointBuilder;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case pointBuilder:
        return 1;
      case envelopeBuilder:
        return 2;
      case polylineBuilder:
        return 3;
      case polygonBuilder:
        return 4;
      case multipointBuilder:
        return 5;
      case unknown:
        return -1;
    }
  }
}

/// Indicates the dimensionality of a [Geometry], relating to the number of
/// spatial dimensions in which the geometry may have a size.
enum GeometryDimension {
  /// The geometry is a point or multipoint.
  point,

  /// The geometry is a curve.
  curve,

  /// The geometry has an area.
  area,

  /// The geometry has a volume.
  volume,

  /// Unknown geometry dimensions.
  unknown;

  factory GeometryDimension._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return point;
      case 1:
        return curve;
      case 2:
        return area;
      case 3:
        return volume;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case point:
        return 0;
      case curve:
        return 1;
      case area:
        return 2;
      case volume:
        return 3;
      case unknown:
        return -1;
    }
  }
}

/// Performs geometric operations such as spatial relationship tests,
/// reprojections, shape manipulations, topological query and analysis
/// operations on [Geometry] objects.
///
/// Capabilities include:
/// * Create new geometries from others with [GeometryEngine.buffer],
/// [GeometryEngine.clip] and [GeometryEngine.union].
/// * Test spatial relationships between geometries such as
/// [GeometryEngine.intersects] and [GeometryEngine.contains].
/// * Find the [GeometryEngine.nearestCoordinate] or
/// [GeometryEngine.nearestVertex] between geometries.
/// * Reproject a geometry to another [SpatialReference] using
/// [GeometryEngine.project].
/// * Calculate area and length using [GeometryEngine.area] and
/// [GeometryEngine.length], or the geodetic equivalents
/// ([GeometryEngine.bufferGeodetic] and [GeometryEngine.lengthGeodetic]) that
/// account for the curvature of the earth.
///
/// [GeometryEngine] generally operates in two dimensions; operations do not
/// account for z-values unless documented as such for a specific method (for
/// example [GeometryEngine.project] transforms z-values in some cases).
///
/// [GeometryEngine] provides both planar (Euclidean) and geodetic versions of
/// many operations. Be aware that methods named with only the operation are the
/// planar versions ([GeometryEngine.buffer], for example), while the geodetic
/// equivalent has "Geodetic" appended to the name (for example
/// [GeometryEngine.bufferGeodetic]).
///
/// Planar methods are suitable for data with a projected coordinate system,
/// especially for local, large-scale areas. Geodetic methods are better suited
/// to data with a geographic spatial reference (see
/// [SpatialReference.isGeographic]), especially for large-area, small-scale
/// use.
///
/// Most [GeometryEngine] methods require inputs to have equivalent spatial
/// references. The methods which have more than one geometry parameter, or have
/// a separate spatial reference parameter which could conflict with that of the
/// geometry, will throw if the spatial references are not equivalent.
/// Exceptions to this rule (for example [GeometryEngine.rotate] are highlighted
/// in the method documentation.
abstract final class GeometryEngine {
  /// Calculates the area of the given geometry.
  ///
  /// This planar measurement uses 2D Cartesian mathematics to compute the area.
  /// It is based upon the [SpatialReference] of the input geometry. If the
  /// input geometry does not use an 'area preserving' spatial reference, the
  /// result can be inaccurate. You have two options available to calculate a
  /// more accurate result:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent, [GeometryEngine.areaGeodetic].
  ///
  /// Geometry must be topologically correct to accurately calculate area.
  /// Polygons that are self-intersecting or that have inconsistent ring
  /// orientations may produce inaccurate area values. In some cases, area
  /// values for polygons with incorrect topology may be negative. Geometries
  /// returned by ArcGIS Server services are always topologically correct. To
  /// ensure that polygons constructed or modified programmatically are
  /// topologically consistent, however, it's best to simplify the input
  /// geometry using [GeometryEngine.simplify] before you call this method.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The area of the given geometry in the same units as the
  /// geometry's spatial reference system.
  static double area({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_area(geometry._handle, errorHandler);
    });
  }

  /// Calculates the geodetic area of the given geometry using a geodetic curve.
  ///
  /// Calculating area using a
  /// [geodetic measurement](https://developers.arcgis.com/documentation/glossary/geodetic-measurement/)
  /// accounts for the curvature of the earth's surface. Using geodetic
  /// algorithms to calculate areas and distances provides a highly accurate way
  /// to obtain measurements of geographic features, typically superior to that
  /// returned by the [GeometryEngine.area] method, which provides a
  /// [planar measurement](https://developers.arcgis.com/documentation/glossary/planar-measurement/)
  /// that can introduce distortion depending on the [SpatialReference] the
  /// geometry is in.
  ///
  /// Geometry must be topologically correct to accurately calculate area.
  /// Polygons that are self-intersecting or that have inconsistent ring
  /// orientations may produce inaccurate area values. In some cases, area
  /// values for polygons with incorrect topology may be negative. Geometries
  /// returned by ArcGIS Server services are always topologically correct. To
  /// ensure that polygons constructed or modified programmatically are
  /// topologically consistent, however, it's best to simplify the input
  /// geometry using [GeometryEngine.simplify] before you call this method.
  ///
  /// Supports true curves, calculating the result by densifying curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `unit` — The unit of measure for the return value. If null, the default
  /// unit is meters squared.
  /// - `curveType` — The type of curve to calculate the geodetic area.
  ///
  /// Return Value: The calculated geodetic area in the requested unit.
  static double areaGeodetic(
      {required Geometry geometry,
      AreaUnit? unit,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_areaGeodetic(geometry._handle,
          unit?._handle ?? ffi.nullptr, curveType.coreValue, errorHandler);
    });
  }

  /// Fills the closed gaps between polygons using polygon boundaries and
  /// polylines as the boundary for the new polygons.
  ///
  /// The new polygons are created in the closed empty areas bounded by the
  /// edges of the existing polygon boundaries and the new boundary polylines.
  /// The newly created polygons do not overlap any existing polygons or
  /// polylines, and the boundary of a new polygon must contain at least one
  /// edge from the polylines. Only polygons that intersect the input polylines
  /// participate in the operation, so it makes sense to prefilter the input
  /// accordingly.
  ///
  /// All geometries in the existingBoundaries collection must have an area.
  /// They must be polygons or envelopes.
  ///
  /// All geometries in newBoundaries collection must be polylines.
  ///
  /// Parameters:
  /// - `existingBoundaries` — The polygons.
  /// - `newBoundaries` — The polylines.
  ///
  /// Return Value: The new polygons that were created. If either
  /// existingBoundaries or newBoundaries is empty, returns an empty array.
  static List<Polygon> autoComplete(
      {required List<Polygon> existingBoundaries,
      required List<Polyline> newBoundaries}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreExistingBoundaries =
        existingBoundaries.toMutableArray(valueType: _ElementType.geometry);
    final coreNewBoundaries =
        newBoundaries.toMutableArray(valueType: _ElementType.geometry);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_autoComplete(
          coreExistingBoundaries._handle,
          coreNewBoundaries._handle,
          errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Calculates the boundary of the given geometry.
  ///
  /// For [ArcGISPoint] - returns an empty geometry. Points have no boundary.
  /// For [Multipoint] - returns an empty geometry. Points have no boundary. For
  /// [Polyline] - returns a multipoint containing the end points of the
  /// polyline's parts. For [Polygon] - returns a polyline describing its outer
  /// and inner rings.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The boundary of the given geometry.
  static Geometry boundary({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_boundary(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Creates a buffer polygon at the specified distance around the given
  /// geometry. This is a planar buffer operation. Use
  /// [GeometryEngine.bufferGeodetic] to produce geodetic buffers.
  ///
  /// This planar measurement uses 2D Cartesian mathematics to compute the
  /// buffer area. It is based upon the [SpatialReference] of the input
  /// geometry. If the input geometry does not use an 'area preserving' spatial
  /// reference, the result can be inaccurate. You have two options available to
  /// calculate a more accurate result:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent, [GeometryEngine.bufferGeodetic].
  ///
  /// Supports true curves as input, producing a densified curve as output where
  /// applicable.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `distance` — The distance to buffer the geometry. It must be in the same
  /// units as the geometry's spatial reference.
  ///
  /// Return Value: A polygon object that represents a buffer at the desired
  /// distance relative to the given geometry.
  static Polygon buffer(
      {required Geometry geometry, required double distance}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_buffer(
          geometry._handle, distance, errorHandler);
    });
    return Polygon._fromHandle(objectHandle)!;
  }

  /// Creates a buffer or buffers relative to the given collection of
  /// geometries. This is a planar buffer operation. Use
  /// [GeometryEngine.bufferGeodetic] to produce geodetic buffers.
  ///
  /// This planar measurement uses 2D Cartesian mathematics to compute the
  /// buffer areas. It is based upon the [SpatialReference] of the input
  /// geometries. If the input geometries do not use an 'area preserving'
  /// spatial reference, the results can be inaccurate. You have two options
  /// available to calculate a more accurate results:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent,
  /// [GeometryEngine.bufferGeodeticCollection].
  ///
  /// If unionResult is true, the output collection contains a single result. If
  /// geometries is empty, an empty array is returned.
  ///
  /// Supports true curves as input, producing a densified curve as output where
  /// applicable.
  ///
  /// This method allows you to create different-sized buffers for each input in
  /// a geometry collection using corresponding values in a distance collection.
  /// Typically, there's a one-to-one correspondence of input geometries to the
  /// input buffer distances. However, you may have fewer input buffer distances
  /// than input geometries. In that case, the last distance value in the buffer
  /// distances collection is applied to the remaining geometries. If needed,
  /// you could also specify a single buffer value in the input buffer distances
  /// collection to apply to all items in the input geometries collection.
  ///
  /// Parameters:
  /// - `geometries` — A collection of geometries.
  /// - `distances` — The distance to buffer each geometry, expressed as a
  /// [List] of double. If the size of the distances collection is less than the
  /// number of geometries, the last distance value is used for the rest of
  /// geometries.
  /// - `unionResult` — Returns a single geometry that buffers all the
  /// geometries (true), or one buffer for each in the given collection (false).
  ///
  /// Return Value: A collection of polygons representing buffers at the defined
  /// distance(s) relative to the input geometries.
  static List<Polygon> bufferCollection(
      {required List<Geometry> geometries,
      required List<double> distances,
      required bool unionResult}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeometries =
        geometries.toMutableArray(valueType: _ElementType.geometry);
    final coreDistances =
        distances.toMutableArray(valueType: _ElementType.float64);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_bufferCollection(
          coreGeometries._handle,
          coreDistances._handle,
          unionResult,
          errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Creates a buffer polygon at the specified distance around the given
  /// geometry, calculated using a geodetic curve.
  ///
  /// Geodetic buffers account for the actual shape of the earth. Distances are
  /// calculated between points on a curved surface (the geoid) as opposed to
  /// points on a flat surface (the Cartesian plane).
  ///
  /// Negative distance can be used to create a buffer inside a [Polygon] or an
  /// [Envelope]. Using a negative buffer distance shrinks the geometry's
  /// boundary by the distance specified. Note that if the negative buffer
  /// distance is large enough, the geometry may collapse to an empty polygon.
  ///
  /// Supports true curves as input, and may produce a densified curve as
  /// output.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `distance` — The distance to buffer the geometry.
  /// - `distanceUnit` — The unit of measure for the distance.
  /// - `maxDeviation` — The maximum deviation between points. If NaN then a
  /// maximum deviation of up to 0.2% of the buffer distance, with a maximum of
  /// 0.01 meters, aiming to give an output geometry with a smooth boundary.
  /// - `curveType` — The [GeodeticCurveType] used to calculate the buffer.
  ///
  /// Return Value: The geodetic buffer.
  static Polygon bufferGeodetic(
      {required Geometry geometry,
      required double distance,
      LinearUnit? distanceUnit,
      required double maxDeviation,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_bufferGeodetic(
          geometry._handle,
          distance,
          distanceUnit?._handle ?? ffi.nullptr,
          maxDeviation,
          curveType.coreValue,
          errorHandler);
    });
    return Polygon._fromHandle(objectHandle)!;
  }

  /// Creates and returns a geodetic buffer or buffers relative to the given
  /// collection of geometries.
  ///
  /// Geodetic buffers account for the actual shape of the earth. Distances are
  /// calculated between points on a curved surface (the geoid) as opposed to
  /// points on a flat surface (the Cartesian plane).
  ///
  /// Negative distance can be used to create buffers inside polygons. Using a
  /// negative buffer distance shrinks the polygons' boundaries by the distance
  /// specified. Note that if the negative buffer distance is large enough,
  /// polygons may collapse to empty geometries.
  ///
  /// Parameters:
  /// - `geometries` — A collection of geometries.
  /// - `distances` — The distance to buffer each geometry, expressed as a
  /// [List] of double. If the size of the distances array is less than the
  /// number of geometries, the last distance value is used for the rest of
  /// geometries.
  /// - `distanceUnit` — The unit of measure for the distance.
  /// - `maxDeviation` — The maximum deviation between points. If NaN then a
  /// maximum deviation of up to 0.2% of the buffer distance, with a maximum of
  /// 0.01 meters, aiming to give an output geometry with a smooth boundary.
  /// - `curveType` — The [GeodeticCurveType] used to calculate the buffer.
  /// - `unionResult` — Return a single geometry that buffers all the geometries
  /// (true), or one buffer for each in the given collection (false).
  ///
  /// Return Value: A collection of polygon geometries that represent a geodetic
  /// buffer at the desired distance(s) relative to the given geometries. If
  /// 'unionResult' is true, the resulting collection contains a single polygon.
  /// If geometries is empty, returns an empty array.
  static List<Polygon> bufferGeodeticCollection(
      {required List<Geometry> geometries,
      required List<double> distances,
      LinearUnit? distanceUnit,
      required double maxDeviation,
      required GeodeticCurveType curveType,
      required bool unionResult}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeometries =
        geometries.toMutableArray(valueType: _ElementType.geometry);
    final coreDistances =
        distances.toMutableArray(valueType: _ElementType.float64);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_bufferGeodeticCollection(
          coreGeometries._handle,
          coreDistances._handle,
          distanceUnit?._handle ?? ffi.nullptr,
          maxDeviation,
          curveType.coreValue,
          unionResult,
          errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Constructs the portion of a geometry that intersects an envelope.
  ///
  /// If the [Geometry] intersects the [Envelope], the portion of the [Geometry]
  /// contained within the [Envelope] is returned. If no part of the [Geometry]
  /// lies within the [Envelope], an empty [Geometry] is returned. If the
  /// [Geometry] lies completely within the [Envelope], the entire [Geometry] is
  /// returned.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The geometry to be clipped by the given envelope.
  /// - `envelope` — The envelope that clips the given geometry.
  ///
  /// Return Value: A geometry object that represents the portion of a geometry
  /// that intersects an envelope.
  static Geometry clip(
      {required Geometry geometry, required Envelope envelope}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_clip(
          geometry._handle, envelope._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Returns an [Envelope] representing the minimum extent that encloses both
  /// geometry1 and geometry2.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: The maximum extent of the two given geometries.
  static Envelope combineExtents(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_combineExtents(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle)!;
  }

  /// Returns an [Envelope] representing the minimum extent that encloses all
  /// geometries in the given collection.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometries` — A collection of geometries.
  ///
  /// Return Value: The maximum extent of the geometries in the collection.
  static Envelope combineExtentsCollection(
      {required List<Geometry> geometries}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeometries =
        geometries.toMutableArray(valueType: _ElementType.geometry);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_combineExtentsCollection(
          coreGeometries._handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle)!;
  }

  /// Tests if geometry1 contains geometry2.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if geometry1 contains geometry2, false otherwise.
  static bool contains(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_contains(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Calculates the minimum bounding geometry (convex hull) that completely
  /// encloses the given geometry.
  ///
  /// The convex hull is the minimal bounding geometry that encloses the input
  /// geometry, such that all outer angles are convex. If you imagine a rubber
  /// band stretched around the input geometry, the rubber band takes the shape
  /// of the convex hull.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The minimum bounding geometry that completely encloses the
  /// given geometry.
  static Geometry convexHull({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_convexHull(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Calculates the minimum bounding geometry (convex hull) for the geometries
  /// in the given collection.
  ///
  /// If merge is true, returns a single convex hull that encloses all the
  /// geometries in the collection as a single geometry in an array. If merge is
  /// false, returns the minimum bounding geometry that completely encloses each
  /// of the geometries in the given collection as an array of geometries. If
  /// geometries is empty, returns an empty array.
  ///
  /// Parameters:
  /// - `geometries` — A collection of geometries.
  /// - `merge` — True indicates that a single convex hull geometry is
  /// calculated that encloses all the geometries in the collection. False
  /// indicates that one convex hull geometry is calculated for each geometry in
  /// the collection.
  ///
  /// Return Value: The minimum bounding geometry that completely encloses the
  /// geometries in the given collection.
  static List<Geometry> convexHullCollection(
      {required List<Geometry> geometries, required bool merge}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeometries =
        geometries.toMutableArray(valueType: _ElementType.geometry);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_convexHullCollection(
          coreGeometries._handle, merge, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Return the point at the given distance along the line.
  ///
  /// If distance is less than or equal to zero, the point returned is
  /// coincident with the start of the line. If distance is greater than or
  /// equal to the line's length, the point returned is coincident with the end
  /// of the line. If the line has multiple parts, and the distance falls
  /// exactly on a boundary between two parts, the returned point will be
  /// coincident with either the end of one part or the start of the next, but
  /// which one is undetermined.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `polyline` — The polyline from which the point is created.
  /// - `distance` — The distance along the polyline where the point is created,
  /// using the units of the polyline.
  ///
  /// Return Value: The point at the given distance along the line.
  static ArcGISPoint createPointAlong(
      {required Polyline polyline, required double distance}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_createPointAlong(
          polyline._handle, distance, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Test if geometry1 crosses geometry2.
  ///
  /// Two polylines cross if their intersection contains only points, and at
  /// least one of the points of intersection is internal to both polylines. A
  /// polyline and polygon cross if a connected part of the polyline is partly
  /// inside and partly outside the polygon. A polyline and polygon cross if
  /// they share a polyline in common on the interior of the polygon, which is
  /// not equal to the entire polyline. The target and join features must be
  /// either polylines or polygons.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: true if geometry1 crosses geometry2, false otherwise.
  static bool crosses(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_crosses(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Cuts the 'geometry' into parts with the 'cutter' [Polyline].
  ///
  /// When a [Polyline] or [Polygon] is cut, it is split where it intersects the
  /// cutter [Polyline]. The cut parts are output as a collection of geometries.
  /// All left cuts are grouped together in the first [Geometry], all right cuts
  /// are grouped in the second [Geometry], any uncut parts are output as
  /// separate geometries.
  ///
  /// If the input polyline is not simple, then the operation will be performed
  /// on a simplified copy of the polyline. There is no need for you to call any
  /// simplify method. If there were no cuts then an empty [List] is returned.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The input [Geometry] to be cut.
  /// - `cutter` — The [Polyline] used to divide the geometry into pieces where
  /// they cross the cutter.
  ///
  /// Return Value: A [List] of [Geometry].
  static List<Geometry> cut(
      {required Geometry geometry, required Polyline cutter}) {
    _initializeArcGISEnvironmentIfNeeded();
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_cut(
          geometry._handle, cutter._handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Densifies the input geometry by inserting additional vertices along the
  /// geometry at an interval defined by maxSegmentLength.
  ///
  /// Additional vertices are not inserted on segments of the input [Envelope],
  /// [Polygon], or [Polyline] that are shorter than maxSegmentLength.
  ///
  /// Supports true curves as input, producing a densified curve as output where
  /// applicable.
  ///
  /// Parameters:
  /// - `geometry` — An [Envelope], [Polygon], or [Polyline] geometry.
  /// - `maxSegmentLength` — The maximum distance between vertices when the
  /// input geometry is densified. The linear unit is assumed to be that of the
  /// input geometry's spatial reference (decimal degrees for a geometry with a
  /// geographic spatial reference, meters for geometry with a Mercator spatial
  /// reference, and so on). Use [SpatialReference.unit] to determine the unit
  /// used by a specific spatial reference.
  ///
  /// Return Value: The densified geometry.
  static Geometry densify(
      {required Geometry geometry, required double maxSegmentLength}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_densify(
          geometry._handle, maxSegmentLength, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Densifies the input geometry by creating additional vertices along the
  /// geometry, using a geodetic curve.
  ///
  /// Parameters:
  /// - `geometry` — A geometry to densify.
  /// - `maxSegmentLength` — The maximum distance between vertices when the
  /// input geometry is densified, in the given linear units.
  /// - `lengthUnit` — The unit of measure for the maximum segment length. If
  /// null, meters are assumed.
  /// - `curveType` — The type of curve to calculate.
  ///
  /// Return Value: The geodetic densified geometry.
  static Geometry densifyGeodetic(
      {required Geometry geometry,
      required double maxSegmentLength,
      LinearUnit? lengthUnit,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_densifyGeodetic(
          geometry._handle,
          maxSegmentLength,
          lengthUnit?._handle ?? ffi.nullptr,
          curveType.coreValue,
          errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Constructs the set-theoretic difference between two geometries.
  ///
  /// This method returns a geometry consisting of the parts of geometry1 that
  /// are not in geometry2. It performs a spatial subtraction from the two input
  /// geometries. The order of the two input geometry arguments produces
  /// different results if they are switched. Think of the difference equation
  /// as:
  ///
  /// A (Difference) B != B (Difference) A
  ///
  /// Use [GeometryEngine.symmetricDifference] to get the parts that are in
  /// either geometry, but not in both.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — The second geometry of dimension equal to or greater than
  /// the elements of the first geometry.
  ///
  /// Return Value: A new geometry object that represents the difference of the
  /// two given input geometries.
  static Geometry difference(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_difference(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Tests if the two geometries are disjoint.
  ///
  /// Geometries are disjoint if their boundaries or interiors do not intersect.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if the two geometries are disjoint, false otherwise.
  static bool disjoint(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_disjoint(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Calculates the simple planar (Euclidean) distance between two geometries.
  ///
  /// This planar measurement uses 2D Cartesian mathematics to compute the
  /// distance. It is based upon the [SpatialReference] of the input geometries.
  /// If the input geometries do not use an 'distance preserving' spatial
  /// reference, the result can be inaccurate. You have two options available to
  /// calculate a more accurate result:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent, [GeometryEngine.distanceGeodetic].
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: The distance between the two geometries in the same units as
  /// the geometry's spatial reference.
  static double distance(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_distance(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Calculates the geodetic distance between two given points and calculates
  /// the azimuth at both points for the geodetic curve that connects the
  /// points.
  ///
  /// Parameters:
  /// - `point1` — A point object.
  /// - `point2` — Another point object.
  /// - `distanceUnit` — The linear unit of measure for the returned results.
  /// - `azimuthUnit` — The angular unit of measure for the returned results.
  /// - `curveType` — The type of curve to calculate.
  ///
  /// Return Value: A structure containing the distance and the azimuth at both
  /// points for the geodetic curve that connects them.
  static GeodeticDistanceResult distanceGeodetic(
      {required ArcGISPoint point1,
      required ArcGISPoint point2,
      LinearUnit? distanceUnit,
      AngularUnit? azimuthUnit,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_distanceGeodetic(
          point1._handle,
          point2._handle,
          distanceUnit?._handle ?? ffi.nullptr,
          azimuthUnit?._handle ?? ffi.nullptr,
          curveType.coreValue,
          errorHandler);
    });
    return GeodeticDistanceResult._fromHandle(objectHandle)!;
  }

  /// Constructs a geodesic ellipse centered on a specific point.
  ///
  /// Constructs a geodesic ellipse centered on the specified point. It returns
  /// a piecewise approximation of a geodesic ellipse (or geodesic circle, if
  /// [GeodesicEllipseParameters.semiAxis1Length] =
  /// [GeodesicEllipseParameters.semiAxis2Length]) consisting of [LineSegment]
  /// objects.
  ///
  /// If this method is used to generate a polygon or a polyline, the result may
  /// have more than one path, depending on the size of the ellipse and its
  /// position relative to the horizon of the coordinate system. When the method
  /// generates a polyline or a multipoint, the result vertices lie on the
  /// boundary of the ellipse. When a polygon is generated, the interior of the
  /// polygon is the interior of the ellipse, however the boundary of the
  /// polygon may contain segments from the spatial reference horizon, or from
  /// the geographic coordinate system extent.
  ///
  /// If the smaller axis is zero, the ellipse will degenerate to a line
  /// segment, a point, or an empty geometry (depending on the larger axis and
  /// output type). Otherwise, if [GeodesicEllipseParameters.maxPointCount] <
  /// 10, the number of vertices will default to 10. Supported output geometry
  /// types are [Polygon], [Polyline], add [Multipoint].
  ///
  /// Parameters:
  /// - `parameters` — Various parameters needed to construct the ellipse.
  ///
  /// Return Value: The geodesic ellipse described by the parameters.
  static Geometry ellipseGeodesic(
      {required GeodesicEllipseParameters parameters}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_ellipseGeodesic(
          parameters._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Tests if two geometries are equal.
  ///
  /// The geometries are equal if they have the same spatial reference systems,
  /// geometry type, points and occupy the same space. For a more strict
  /// comparison of the two geometries use [Geometry.==].
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if the two geometries are equal, false otherwise.
  static bool equals(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_equals(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Extends a polyline using a polyline as the extender using the type of
  /// extension specified with extendOptions.
  ///
  /// The output polyline has the first and last segment of each path extended
  /// to the extender if the segments can be interpolated to intersect the
  /// extender. In the case that the segments can be extended to multiple
  /// segments of the extender, the shortest extension is chosen. Only end
  /// points for paths that are not shared by the end points of other paths are
  /// extended. If the polyline cannot be extended by the input extender, then
  /// null is returned.
  ///
  /// Parameters:
  /// - `polyline` — The polyline to be extended.
  /// - `extender` — The polyline to extend to.
  /// - `extendOptions` — The flag for the type of extend operation to perform.
  ///
  /// Return Value: The extended polyline, or null if polyline could not be
  /// extended.
  static Polyline? extend(
      {required Polyline polyline,
      required Polyline extender,
      required GeometryExtendOptions extendOptions}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_extend(polyline._handle,
          extender._handle, extendOptions.coreValue, errorHandler);
    });
    return Polyline._fromHandle(objectHandle);
  }

  /// Finds the location on the line nearest the input point, expressed as the
  /// fraction along the line's total geodesic length, if the point is within
  /// the specified distance from the closest location on the line.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `line` — The line to locate the point's distance along its length.
  /// - `point` — The point to locate.
  /// - `tolerance` — The maximum distance that a point is allowed to be from
  /// the line, in the units of the [SpatialReference]. If the tolerance is -1,
  /// the fraction of the closest location on the line is always returned as
  /// long as the point lies between the two ends of the polyline. If the
  /// distance from the point to the closest location on the line is greater
  /// than the tolerance, or the tolerance is -1 and the point does not lie
  /// between the two ends of the polyline, NAN is returned.
  ///
  /// Return Value: The length along the line nearest the input point, expressed
  /// as the fraction of the line's length between 0.0 and 1.0, or NAN if the
  /// point is outside the tolerance.
  static double fractionAlong(
      {required Polyline line,
      required ArcGISPoint point,
      required double tolerance}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_fractionAlong(
          line._handle, point._handle, tolerance, errorHandler);
    });
  }

  /// Generalizes the given geometry by removing vertices based on the
  /// Douglas-Poiker algorithm.
  ///
  /// [ArcGISPoint] and [Multipoint] geometries are left unchanged. [Envelope]
  /// is converted to a [Polygon] and then generalized.
  ///
  /// Supports true curves as input, producing a densified curve as output where
  /// applicable.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `maxDeviation` — The maximum distance that the generalized geometry can
  /// deviate from the original, in the same units as the geometry's spatial
  /// reference system.
  /// - `removeDegenerateParts` — True if degenerate parts of the resulting
  /// geometry that are undesired for drawing are removed, false otherwise.
  ///
  /// Return Value: The geometry object that represents the generalization of
  /// the input geometry.
  static Geometry generalize(
      {required Geometry geometry,
      required double maxDeviation,
      required bool removeDegenerateParts}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_generalize(
          geometry._handle, maxDeviation, removeDegenerateParts, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Calculates the intersection of two geometries.
  ///
  /// The result has the same dimensionality as the lower dimensionality of the
  /// two intersecting geometries. If there is no intersection with this
  /// dimensionality, returns an empty geometry. For example, the intersection
  /// of two polygons (geometries with area, so they have dimensionality of 2)
  /// or, say, a polygon and an envelope (also an area) is a polygon. Similarly,
  /// the intersection of a polyline (a line, so dimensionality of 1) and
  /// another polyline is always a polyline. Therefore when computing the
  /// intersection of polylines, this function does not return points where they
  /// cross, but rather lines of overlap. If there are no lines of overlap, an
  /// empty polyline is returned even if the input lines cross. To obtain all
  /// intersections, irrespective of dimensionality, see
  /// [GeometryEngine.intersections].
  ///
  /// Returns an empty geometry if the two input geometries do not intersect.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: A geometry object that represents the intersection of the
  /// given geometries.
  static Geometry intersection(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_intersection(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Calculates the intersection of two geometries.
  ///
  /// The returned collection contains one geometry of each dimension for which
  /// there are intersections. For example, if both inputs are polylines, the
  /// collection contains at most two geometries: the first a multipoint
  /// containing the points at which the lines cross, and the second a polyline
  /// containing the lines of overlap. If a crossing point lies within a line of
  /// overlap, only the line of overlap is present. The result set is not
  /// self-intersecting. If there are no crossing points or there are no lines
  /// of overlap, the respective geometry is not present in the returned
  /// collection. If the input geometries do not intersect, the resulting
  /// collection is empty. The table below shows, for each combination of pairs
  /// of input geometry types, the types of geometry that are contained within
  /// the returned collection if there are intersections of that type.
  /// <table>
  /// <caption>Set of potential output geometry types for pairs of input geometry types</caption>
  /// <tr><th>Input type       <th>Point/Multipoint <th>Polyline             <th>Polygon/Envelope
  /// <tr><th>Point/Multipoint <td>Multipoint       <td>Multipoint           <td>Multipoint
  /// <tr><th>Polyline         <td>Multipoint       <td>Multipoint, Polyline <td>Multipoint, Polyline
  /// <tr><th>Polygon/Envelope <td>Multipoint       <td>Multipoint, Polyline <td>Multipoint, Polyline, Polygon
  /// </table>
  /// The geometries in the returned collection are sorted by ascending
  /// dimensionality. For example, multipoint (dimension 0) then polyline
  /// (dimension 1) then polygon (dimension 2) for the intersection of two
  /// geometries with area that have intersections of those types.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: A collection of geometry objects that represent the
  /// intersection of the given geometries.
  static List<Geometry> intersections(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_intersections(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Tests if two geometries intersect each other.
  ///
  /// A geometry intersects another geometry if it shares any portion of its
  /// geometry with the other geometry feature. If either geometry contain, is
  /// within, crosses, touches, or overlaps the other geometry, they intersect.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if the two geometries intersect, false otherwise.
  static bool intersects(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_intersects(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Test if the geometry is topologically simple.
  ///
  /// [ArcGISPoint] geometry is always simple.
  ///
  /// [Multipoint] geometries cannot have any points with exactly equal x and y.
  ///
  /// [Polyline] geometries cannot have degenerate segments. When the polyline
  /// has no z, the degenerate segments are those that have a length in the xy
  /// plane less than or equal to the tolerance. When the polyline has z, the
  /// degenerate segments are those that are shorter than the tolerance in the
  /// xy plane, and the change in the z-value along the segment is less than or
  /// equal to the z-tolerance.
  ///
  /// [Polygon] geometries are considered simple if the following is true:
  /// * Exterior rings are clockwise, and interior rings (holes) are
  /// counterclockwise.
  /// * Rings can touch other rings in a finite number of points.
  /// * Rings can be self-tangent in a finite number of points.
  /// * No segment length is zero.
  /// * Each path contains at least three non-equal vertices.
  /// * No empty paths allowed.
  /// * Order of rings does not matter.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The geometry object.
  ///
  /// Return Value: True if the geometry object is simple, false otherwise.
  static bool isSimple({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_isSimple(
          geometry._handle, errorHandler);
    });
  }

  /// Calculates an interior point for the given polygon. This point can be used
  /// by clients to place a label for the polygon.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `polygon` — A polygon object.
  ///
  /// Return Value: A geometry object that represents the intersection of the
  /// given geometries.
  static ArcGISPoint labelPoint({required Polygon polygon}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_labelPoint(
          polygon._handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Calculates the length of the given geometry.
  ///
  /// This planar measurement uses 2D Cartesian mathematics to compute the
  /// length. It is based upon the [SpatialReference] of the input geometry. If
  /// the input geometry is not using an 'distance preserving' spatial
  /// reference, the result can be inaccurate. You have two options available to
  /// calculate a more accurate result:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent, [GeometryEngine.lengthGeodetic].
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The length of the given geometry.
  static double length({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_length(
          geometry._handle, errorHandler);
    });
  }

  /// Calculates the geodetic length of the geometry.
  ///
  /// Supports true curves, calculating the result by densifying curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `lengthUnit` — The unit of measure for the returned value. If null,
  /// meters are assumed.
  /// - `curveType` — The type of curve to calculate.
  ///
  /// Return Value: The geodetic length of the given geometry.
  static double lengthGeodetic(
      {required Geometry geometry,
      LinearUnit? lengthUnit,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_lengthGeodetic(
          geometry._handle,
          lengthUnit?._handle ?? ffi.nullptr,
          curveType.coreValue,
          errorHandler);
    });
  }

  /// Moves the provided geometry by the specified distances along the x-axis
  /// and y-axis.
  ///
  /// Planar measurements of distance can be extremely inaccurate if using an
  /// unsuitable spatial reference. Ensure that you understand the potential for
  /// error with the geometry's spatial reference. If you need to calculate more
  /// accurate results, consider using a different spatial reference. For input
  /// geometries with a geographic spatial reference, consider projecting to an
  /// appropriate projected coordinate system before attempting to move them, as
  /// the distance represented by angular units of measure will differ depending
  /// on the geometry's location on the earth. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// for more information.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The geometry to move.
  /// - `deltaX` — The distance to move the geometry along the x-axis, in the
  /// units of the given geometry's spatial reference.
  /// - `deltaY` — The distance to move the geometry along the y-axis, in the
  /// units of the given geometry's spatial reference.
  ///
  /// Return Value: A new geometry based on moving the given geometry by the
  /// given delta values.
  static Geometry move(
      {required Geometry geometry,
      required double deltaX,
      required double deltaY}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_move(
          geometry._handle, deltaX, deltaY, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Moves each point in the point collection in a specified direction by a
  /// geodetic distance.
  ///
  /// The returned collection is in the same order as the input, but with new
  /// points at their destination locations. Specifying a negative distance
  /// moves points in the opposite direction from azimuth.
  ///
  /// Parameters:
  /// - `pointCollection` — A [List] of [ArcGISPoint] geometries. Contents of
  /// the [List] are copied.
  /// - `distance` — The distance to move the points.
  /// - `distanceUnit` — The unit of measure for distance. If null, meters are
  /// assumed.
  /// - `azimuth` — The azimuth angle of the direction for the points.
  /// - `azimuthUnit` — The angular unit of measure for azimuth. If null,
  /// degrees are assumed.
  /// - `curveType` — The type of curve to calculate.
  ///
  /// Return Value: A new collection of points moved by the given distance from
  /// the input collection.
  static List<ArcGISPoint> moveGeodetic(
      {required List<ArcGISPoint> pointCollection,
      required double distance,
      LinearUnit? distanceUnit,
      required double azimuth,
      AngularUnit? azimuthUnit,
      required GeodeticCurveType curveType}) {
    _initializeArcGISEnvironmentIfNeeded();
    final corePointCollection =
        pointCollection.toMutableArray(valueType: _ElementType.geometry);
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_moveGeodetic(
          corePointCollection._handle,
          distance,
          distanceUnit?._handle ?? ffi.nullptr,
          azimuth,
          azimuthUnit?._handle ?? ffi.nullptr,
          curveType.coreValue,
          errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Determines the nearest point in the input geometry to the input point
  /// using a simple planar measurement.
  ///
  /// Input geometry of type [Envelope] is not supported. To find the nearest
  /// coordinate on an [Envelope], convert it to a [Polygon] first using
  /// [GeometryEngine.boundary].
  ///
  /// If the specified geometry is a polyline or polygon the nearest coordinate
  /// is the closest point in a segment that comprises geometry; it may not
  /// necessarily be the closest vertex of a segment. If you want to obtain the
  /// closest vertex in the polyline or polygon use the
  /// [GeometryEngine.nearestVertex] method instead.
  ///
  /// This calculation uses 2D Cartesian mathematics to compute the nearest
  /// coordinate. It is based upon the [SpatialReference] of the input
  /// geometries. If the input geometries do not use an 'distance preserving'
  /// spatial reference, the result can be inaccurate. You have two options
  /// available to calculate a more accurate result:
  ///
  ///   * Use a different spatial reference. Use the [GeometryEngine.project]
  /// method to project the geometry to a projected coordinate system that is
  /// better suited for area calculations. See
  /// [Spatial references](https://developers.arcgis.com/documentation/spatial-references/)
  /// and
  /// [Supported map projections](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/list-of-supported-map-projections.htm)
  /// for more information.
  ///   * Use the geodetic equivalent,
  /// [GeometryEngine.nearestCoordinateGeodetic].
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `point` — The point of interest.
  ///
  /// Return Value: A [ProximityResult] containing the results of the operation.
  /// This is null if the input geometry is empty. [ProximityResult.distance] is
  /// zero if the point lies inside an input polygon, polyline, or envelope.
  static ProximityResult? nearestCoordinate(
      {required Geometry geometry, required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_nearestCoordinate(
          geometry._handle, point._handle, errorHandler);
    });
    return ProximityResult._fromHandle(objectHandle);
  }

  /// Determines the nearest point in the input geometry to the input point, by
  /// using a shape preserving geodetic approximation of the input geometry.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object on which to calculate the nearest
  /// coordinate to the point parameter.
  /// - `point` — The point from which to calculate the nearest coordinate on
  /// the geometry parameter.
  /// - `maxDeviation` — The maximum distance that the geodetic geometry can
  /// deviate from the original, in the units of the deviationUnit parameter.
  /// - `deviationUnit` — The unit of measure for the maxDeviation parameter. If
  /// null, the units of maxDeviation are assumed to be meters.
  ///
  /// Return Value: A [ProximityResult] containing the results of the operation,
  /// where the [ProximityResult.distance] is returned in meters. Returns null
  /// if the input geometry is empty. [ProximityResult.distance] is zero if the
  /// point lies inside an input polygon, polyline, or envelope.
  static ProximityResult? nearestCoordinateGeodetic(
      {required Geometry geometry,
      required ArcGISPoint point,
      required double maxDeviation,
      LinearUnit? deviationUnit}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_nearestCoordinateGeodetic(
          geometry._handle,
          point._handle,
          maxDeviation,
          deviationUnit?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ProximityResult._fromHandle(objectHandle);
  }

  /// Returns a [ProximityResult] that describes the nearest vertex in the input
  /// geometry to the input point.
  ///
  /// Input geometry of type [Envelope] is not supported. To find the nearest
  /// vertex on an [Envelope], convert it to a [Polygon] first.
  ///
  /// If the specified geometry is a polyline or polygon, the nearest vertex is
  /// the closest ending position of the line segment that comprises the
  /// geometry. It may not necessarily be the closest point of the line segment.
  /// If you want to obtain the closest point in the polyline or polygon use
  /// [GeometryEngine.nearestCoordinate].
  ///
  /// Input geometries with true curves (where [Geometry.hasCurves] is true) are
  /// supported, although curve segments do not affect the return value.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `point` — The point of interest.
  ///
  /// Return Value: A struct containing the results of the operation.
  static ProximityResult? nearestVertex(
      {required Geometry geometry, required ArcGISPoint point}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_nearestVertex(
          geometry._handle, point._handle, errorHandler);
    });
    return ProximityResult._fromHandle(objectHandle);
  }

  /// Normalizes the input geometry so that it does not intersect the
  /// antimeridian. This may be necessary when wrap around is enabled on the
  /// map.
  ///
  /// Normalization is used when a geometry intersects the minimum or maximum
  /// meridian of the spatial reference, or when the geometry is completely
  /// outside of the meridian range. You may wish to use this method to
  /// normalize geometries before passing them to methods that require
  /// coordinates within the spatial reference domain, for example geodatabase
  /// editing methods or geocoding services.
  ///
  /// Use this method when editing geometries on a map that has wraparound
  /// enabled. For example, if you pan west across the dateline several times
  /// and then add new features to a map, the coordinates of the newly added
  /// features would correspond to the frame of the map and be incorrectly
  /// outside of the spatial reference's maximum extent. Use this method to
  /// normalize the geometry coordinates into the correct range.
  ///
  /// The geometry's spatial reference must be a pannable projected coordinate
  /// system (PCS) or a geographic coordinate system (GCS). A pannable PCS is a
  /// rectangular PCS where the x-coordinate range corresponds to a 360-degree
  /// range on the defining GCS. A GCS is always pannable.
  ///
  /// If geometry or its spatial reference are empty, an empty geometry is
  /// returned. If the geometry's spatial reference is not pannable, the input
  /// geometry is returned. If the geometry is a non-empty envelope, this method
  /// returns a polygon.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The normalized geometry.
  static Geometry? normalizeCentralMeridian({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_normalizeCentralMeridian(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  /// Creates an offset version of the input geometry.
  ///
  /// The offset operation creates a geometry that is a constant distance from
  /// the input geometry. It is similar to buffering, but produces a one-sided
  /// result. If distance > 0, then the offset geometry is constructed to the
  /// right of the input geometry, otherwise it is constructed to the left. For
  /// a simple polygon, the orientation of outer rings is clockwise and for
  /// inner rings it is counterclockwise. So the "right side" of a simple
  /// polygon is always its inside. The bevelRatio is multiplied by the offset
  /// distance and the result determines how far a mitered offset intersection
  /// can be from the input curve before it is beveled.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `distance` — The offset distance for the new geometry.
  /// - `offsetType` — The offset type the resulting geometry.
  /// - `bevelRatio` — The ratio used to produce a bevel join instead of a miter
  /// join (used only when the offset type is Miter).
  /// - `flattenError` — The maximum distance of the resulting segments compared
  /// to the true circular arc (used only when the offset type if round).
  ///
  /// Return Value: The offset geometry object.
  static Geometry offset(
      {required Geometry geometry,
      required double distance,
      required GeometryOffsetType offsetType,
      required double bevelRatio,
      required double flattenError}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_offset(geometry._handle, distance,
          offsetType.coreValue, bevelRatio, flattenError, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Tests if two geometries overlap.
  ///
  /// Two geometries overlap when they have the same dimension and when their
  /// intersection result is a geometry of the same dimension. If the
  /// intersection result is a geometry with a lesser dimension than the input
  /// geometries, the method returns false. For example, two input polygons must
  /// return a polygon to overlap. If two polygons intersect each other at
  /// exactly one point, then no overlap has occurred because the intersection
  /// result is a point, whose dimension is zero.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if the two geometries overlap, false otherwise.
  static bool overlaps(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_overlaps(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Projects the given geometry from its current spatial reference system into
  /// the given output spatial reference system, applying the datum
  /// transformation provided.
  ///
  /// Use this overload to project a geometry if the difference between the
  /// input geometry's [SpatialReference] and the outputSpatialReference
  /// involves a change of datum, and you do not wish to use the default datum
  /// transformation used by [GeometryEngine.project].
  ///
  /// Supports true curves. Projecting curves located at poles and coordinate
  /// system horizons using the ArcGIS Maps API may give results that differ
  /// slightly from other ArcGIS software. This is because it uses a different
  /// geometry projection function.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  /// - `outputSpatialReference` — The spatial reference system to project to.
  /// - `datumTransformation` — The datum transformation that describes how
  /// coordinates are converted from one coordinate system to another.
  ///
  /// Return Value: The geometry projected into the given SpatialReference. If
  /// the input geometry has a null SpatialReference, no projection occurs;
  /// instead, an identical geometry with the given SpatialReference is
  /// returned.
  static Geometry project(Geometry geometry,
      {required SpatialReference outputSpatialReference,
      DatumTransformation? datumTransformation}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_projectWithTransformation(
          geometry._handle,
          outputSpatialReference._handle,
          datumTransformation?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Test if the two geometries are related using a custom relation.
  ///
  /// You can test for a custom spatial relationship by defining your own
  /// relation. For example, you can create a relation that tests if two
  /// geometries intersect and touch.
  ///
  /// The Dimensionally Extended 9 Intersection Model (DE-9IM) matrix relation
  /// (encoded as a string) is a custom spatial relationship type used to test
  /// the relationship of two geometries. See
  /// [Custom spatial relationships](https://pro.arcgis.com/en/pro-app/latest/help/data/validating-data/custom-spatial-relationships.htm)
  /// for more information about the DE-9IM model and how the relationship
  /// string patterns are constructed.
  ///
  /// For example, each of the following DE-9IM string codes are valid for
  /// testing whether a polygon geometry completely contains a line geometry:
  /// "TTTFFTFFT" (Boolean), "T*****FF*" (ignore irrelevant intersections), or
  /// "102FF*FF*" (dimension form). Each returns the same result.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  /// - `relation` — The DE-9IM string to be evaluated. This must be nine
  /// characters long and only contain the characters TF*012.
  ///
  /// Return Value: True if the two geometries have the given relationship,
  /// false otherwise.
  static bool relate(
      {required Geometry geometry1,
      required Geometry geometry2,
      required String relation}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreRelation = _CString(relation);
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_relate(geometry1._handle,
          geometry2._handle, coreRelation.bytes, errorHandler);
    });
  }

  /// Return a copy of the given geometry with its m-values removed.
  ///
  /// If the given geometry has no m-values, the given geometry is returned. The
  /// resulting geometry has a [Geometry.hasM] value of false.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  ///
  /// Return Value: A copy of the given geometry with its m-values removed.
  static Geometry removeM({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_removeM(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Return a copy of the given geometry with its z-coordinate removed.
  ///
  /// If the given geometry has no z-values, the given geometry is returned. The
  /// resulting geometry has a [Geometry.hasZ] value of false.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  ///
  /// Return Value: A copy of the given geometry with its z-coordinates removed.
  static Geometry removeZ({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_removeZ(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Return a copy of the given geometry with its z-coordinates and m-values
  /// removed.
  ///
  /// If the given geometry has no z-coordinates and no m-values, the given
  /// geometry is returned. The resulting geometry has both [Geometry.hasZ] and
  /// [Geometry.hasM] values of false.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  ///
  /// Return Value: A copy of the given geometry with both its z-coordinates and
  /// m-values removed.
  static Geometry removeZAndM({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_removeZAndM(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Reshape polygons or polylines with a single path polyline.
  ///
  /// Performs the reshape operation on a polygon or polyline using a single
  /// path polyline as the reshaper. The output geometry takes the shape of the
  /// Multi_path where it first intersects the reshaper to the last
  /// intersection. The first and last intersection points of the reshaper are
  /// chosen closest to the end points of the reshaper in the case that multiple
  /// intersections are found. For polygons, only individual paths can be
  /// reshaped. However, polylines can be reshaped across paths. If the geometry
  /// cannot be reshaped by the input reshaper, then null is returned.
  ///
  /// Parameters:
  /// - `geometry` — The polygon or polyline to be reshaped.
  /// - `reshaper` — The single path polyline reshaper.
  ///
  /// Return Value: The reshaped polygon or polyline, or null if geometry could
  /// not be reshaped.
  static Multipart? reshape(
      {required Multipart geometry, required Polyline reshaper}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_reshape(
          geometry._handle, reshaper._handle, errorHandler);
    });
    return Multipart._fromHandle(objectHandle);
  }

  /// Rotates the geometry by the specified angle of rotation around the
  /// provided origin point.
  ///
  /// The angle of rotation is used in the form of the modulo of 360 degrees;
  /// for example rotating by
  /// 540 degrees is equivalent to rotating the geometry by 180 degrees. A
  /// positive value corresponds to a counterclockwise rotation.
  ///
  /// The [GeometryType] of the returned geometry is the same as the input
  /// geometry, except for an input [Envelope] which returns a [Polygon] result.
  ///
  /// If the origin [ArcGISPoint] has a different [SpatialReference] to that of
  /// the geometry parameter, the point will be reprojected before the geometry
  /// is rotated, using the default transformation.
  ///
  /// Rotating an [ArcGISPoint] using the same location for the origin parameter
  /// returns an [ArcGISPoint] with the same values as the input.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The geometry to rotate.
  /// - `angle` — The angle by which to rotate the geometry, counterclockwise,
  /// in degrees.
  /// - `origin` — The center of rotation. If null, or [Geometry.isEmpty] is
  /// true, the center of the extent of the given geometry is used.
  ///
  /// Return Value: A new geometry constructed by rotating the input geometry by
  /// the specified angle of rotation around the provided origin point.
  static Geometry rotate(
      {required Geometry geometry,
      required double angle,
      ArcGISPoint? origin}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_rotate(geometry._handle, angle,
          origin?._handle ?? ffi.nullptr, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Scales the given geometry by the specified factors from the specified
  /// origin point.
  ///
  /// If the origin [ArcGISPoint] has a different [SpatialReference] than that
  /// of the geometry parameter, the point will be reprojected before the
  /// geometry is scaled, using the default transformation.
  ///
  /// Scaling an [ArcGISPoint] using the same location for the origin parameter
  /// returns an [ArcGISPoint] with the same values as the input.
  ///
  /// Positive scale factors greater than 1 increase the size of the
  /// `GeometryEditor.geometry`, and positive factors between 0 and 1 reduce the
  /// size of the geometry. 0 or negative scale factors produce a geometry
  /// reflected across the axes of the origin point. Negative factors less than
  /// -1 both reflect and increase the size of the geometry, and negative
  /// factors between -1 and 0 both reflect and reduce the size of the geometry.
  /// Scale factors of -1 reflect the geometry across the axes of the origin
  /// point without changing the size.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — The geometry to scale.
  /// - `scaleX` — The scale factor along the x-axis. It can be positive or
  /// negative. It cannot be a non-numeric value.
  /// - `scaleY` — The scale factor along the y-axis. It can be positive or
  /// negative. It cannot be a non-numeric value.
  /// - `origin` — The point around which the geometry will be scaled. If null,
  /// or [Geometry.isEmpty] is true, the center of the extent of the geometry
  /// parameter is used.
  ///
  /// Return Value: A new geometry constructed by scaling the input geometry by
  /// the specified factors from the specified origin point.
  static Geometry scale(
      {required Geometry geometry,
      required double scaleX,
      required double scaleY,
      ArcGISPoint? origin}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_scale(geometry._handle, scaleX,
          scaleY, origin?._handle ?? ffi.nullptr, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Constructs a geodesic sector defined by a geodesic arc and 2 radii.
  ///
  /// Creates a sector as a polygon, polyline, or multipoint geometry. A
  /// geodesic sector is defined by a geodesic elliptical arc and two radii
  /// extending from the center point of the arc to the points where they each
  /// intersect the arc. The arc is a portion of an ellipse. The ellipse is
  /// defined by a center point, the lengths of its semi-major and semi-minor
  /// axes, and the direction of its semi-major axis. The first radius of the
  /// sector is defined by the start direction angle relative to the direction
  /// of the semi-major axis. The second radius is the sum of the start
  /// direction and the sector angle.
  ///
  /// The new geometry consists of a series of [LineSegment] objects.
  ///
  /// Parameters:
  /// - `parameters` — Specifies the parameters for constructing the sector.
  ///
  /// Return Value: A geometry representing the geodesic sector.
  static Geometry sectorGeodesic(
      {required GeodesicSectorParameters parameters}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_sectorGeodesic(
          parameters._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Return a copy of a geometry with the supplied m-value.
  ///
  /// If the given geometry already has m-values, they are replaced within the
  /// resulting geometry by the supplied value. The resulting geometry has a
  /// [Geometry.hasM] value of true.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  /// - `m` — The m-value.
  ///
  /// Return Value: A copy of the given geometry with its m-values set to the
  /// supplied value.
  static Geometry setM({required Geometry geometry, required double m}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_setM(
          geometry._handle, m, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Return a copy of a geometry with the supplied z-coordinate.
  ///
  /// If the given geometry already has z-coordinates, they are replaced within
  /// the resulting geometry by the supplied value. The resulting geometry has a
  /// [Geometry.hasZ] value of true.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  /// - `z` — The z-coordinate.
  ///
  /// Return Value: A copy of the given geometry with its z-coordinates set to
  /// the supplied value.
  static Geometry setZ({required Geometry geometry, required double z}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_setZ(
          geometry._handle, z, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Return a copy of a geometry with the supplied z-coordinate and m-value.
  ///
  /// If the given geometry already has z-coordinates or m-values, they are
  /// replaced in the resulting geometry by the supplied values. The resulting
  /// geometry has both [Geometry.hasZ] and [Geometry.hasM] values of true.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry.
  /// - `z` — The z-coordinate.
  /// - `m` — The m-value.
  ///
  /// Return Value: A copy of the given geometry with its z-coordinates and
  /// m-values set to the supplied values.
  static Geometry setZAndM(
      {required Geometry geometry, required double z, required double m}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_setZAndM(
          geometry._handle, z, m, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Simplifies the given geometry to make it topologically consistent
  /// according to its geometry type.
  ///
  /// This method rectifies polygons that may be self-intersecting or contain
  /// incorrect ring orientations.
  ///
  /// Geometries must be topologically correct to perform topological
  /// operations. Polygons that are self-intersecting or that have inconsistent
  /// ring orientations may produce inaccurate results. To ensure that polygons
  /// constructed or modified programmatically are topologically consistent it's
  /// best to simplify their geometry using this method. Geometries returned by
  /// ArcGIS Server services are always topologically correct.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry` — A geometry object.
  ///
  /// Return Value: The simplified geometry.
  static Geometry simplify({required Geometry geometry}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_simplify(
          geometry._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Calculates the symmetric difference (exclusive or) of the two geometries.
  ///
  /// Symmetric difference obtains those parts of the two input geometries that
  /// do not overlap. If you want to perform a more atomic-level difference
  /// operation where the spatial subtraction of two input geometries might look
  /// different if the order of the geometries were switched, consider using
  /// [GeometryEngine.difference].
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: The symmetric difference of the two geometries.
  static Geometry symmetricDifference(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_symmetricDifference(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Test if the two geometries have at least one boundary point in common, but
  /// no interior points.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if the two geometries touch, false otherwise.
  static bool touches(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_touches(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }

  /// Calculates the union of the two geometries.
  ///
  /// The union combines those parts of the two geometries which overlap into a
  /// single geometry.
  ///
  /// Returns all parts of the two input geometries combined into a single
  /// geometry. The order of the input parameters is irrelevant. If the two
  /// geometries have different dimensionality, the geometry with the higher
  /// dimensionality is returned. For example, a polygon is returned if the
  /// given geometries are [Polygon] and [ArcGISPoint].
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: The union of the two geometries.
  static Geometry union(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_union(
          geometry1._handle, geometry2._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Calculates the union of a collection of geometries.
  ///
  /// The union combines those parts of the input geometries which overlap into
  /// a single geometry.
  ///
  /// If the collection contains geometries of differing dimensionality, the
  /// geometry with the higher dimensionality is returned. For example, a
  /// polygon is returned if the given a collection contains polygons,
  /// polylines, and points.
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometries` — A collection of geometries.
  ///
  /// Return Value: The union of all the geometries in the given collection.
  static Geometry unionCollection({required List<Geometry> geometries}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreGeometries =
        geometries.toMutableArray(valueType: _ElementType.geometry);
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_unionCollection(
          coreGeometries._handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle)!;
  }

  /// Tests if geometry1 is within geometry2.
  ///
  /// Returns true if geometry1 lies in the interior of geometry2. The boundary
  /// and interior of the geometry1 is not allowed to intersect the exterior of
  /// the geometry2 and the geometry1 may not equal the geometry2.
  ///
  /// This spatial relationship test is based on the Dimensionally Extended 9
  /// Intersection Model (DE-9IM) developed by Clementini, et al., and is
  /// discussed further in the web pages:
  /// [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM) and
  /// [Spatial relationships](https://developers.arcgis.com/documentation/mapping-apis-and-services/spatial-analysis/geometry-analysis/spatial-relationship/).
  ///
  /// Supports true curves.
  ///
  /// Parameters:
  /// - `geometry1` — A geometry object.
  /// - `geometry2` — Another geometry object.
  ///
  /// Return Value: True if geometry1 is within geometry2, false otherwise.
  static bool within(
      {required Geometry geometry1, required Geometry geometry2}) {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeometryEngine_within(
          geometry1._handle, geometry2._handle, errorHandler);
    });
  }
}

/// Flags for the type of extend operation to perform.
enum GeometryExtendOptions {
  /// By default, extension considers both ends of paths. The old ends remain
  /// and new points are added at the extended ends. The new points have
  /// attributes that are extrapolated from adjacent existing segments.
  default_,

  /// If an extension is performed at an end, relocate the end point to the new
  /// position instead of leaving the old point and adding a new point at the
  /// new position.
  relocateEnds,

  /// If an extension is performed at an end, do not extrapolate the
  /// end-segment's attributes for the new point. Instead, make its attributes
  /// the same as the current end. Incompatible with
  /// [GeometryExtendOptions.noEndAttributes].
  keepEndAttributes,

  /// If an extension is performed at an end, do not extrapolate the
  /// end-segment's attributes for the new point. Instead, make its attributes
  /// be empty. Incompatible with [GeometryExtendOptions.keepEndAttributes].
  noEndAttributes,

  /// Do not extend the 'from' end of any path.
  doNotExtendFromStartPoint,

  /// Do not extend the 'to' end of any path.
  doNotExtendFromEndPoint;

  factory GeometryExtendOptions._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return default_;
      case 1:
        return relocateEnds;
      case 2:
        return keepEndAttributes;
      case 4:
        return noEndAttributes;
      case 8:
        return doNotExtendFromStartPoint;
      case 16:
        return doNotExtendFromEndPoint;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case default_:
        return 0;
      case relocateEnds:
        return 1;
      case keepEndAttributes:
        return 2;
      case noEndAttributes:
        return 4;
      case doNotExtendFromStartPoint:
        return 8;
      case doNotExtendFromEndPoint:
        return 16;
    }
  }
}

/// The different types of geometry offset joints.
enum GeometryOffsetType {
  /// Refers to a mitered joint type.
  mitered,

  /// Refers to a bevelled joint type.
  bevelled,

  /// Refers to a rounded joint type.
  rounded,

  /// Refers to a squared joint type.
  squared;

  factory GeometryOffsetType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return mitered;
      case 1:
        return bevelled;
      case 2:
        return rounded;
      case 3:
        return squared;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case mitered:
        return 0;
      case bevelled:
        return 1;
      case rounded:
        return 2;
      case squared:
        return 3;
    }
  }
}

/// The different types of geometries.
///
/// Each of the different supported geometry types. Can get the type by calling
/// [Geometry._objectType].
enum GeometryType {
  /// Point geometry.
  point,

  /// Envelope geometry.
  envelope,

  /// Polyline geometry.
  polyline,

  /// Polygon geometry.
  polygon,

  /// Multipoint geometry.
  multipoint,

  /// An unknown geometry type.
  unknown;

  factory GeometryType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return point;
      case 2:
        return envelope;
      case 3:
        return polyline;
      case 4:
        return polygon;
      case 5:
        return multipoint;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case point:
        return 1;
      case envelope:
        return 2;
      case polyline:
        return 3;
      case polygon:
        return 4;
      case multipoint:
        return 5;
      case unknown:
        return -1;
    }
  }
}

/// Used to transform coordinates of z-aware geometries between spatial
/// references that have different geographic and/or vertical coordinate
/// systems.
///
/// A HorizontalVerticalTransformation is an ordered list of
/// [HorizontalVerticalTransformationStep] objects. Each
/// HorizontalVerticalTransformation has an input and an output
/// [SpatialReference], and this HorizontalVerticalTransformation object can be
/// used to convert coordinates between the horizontal (geographic) and vertical
/// datums of these spatial references using the series of steps it contains.
/// Use the [GeometryEngine.project] method to transform the coordinates of a
/// specific [Geometry].
///
/// A horizontal transformation step is not needed when the input and output
/// spatial references have the same underlying geographic coordinate systems. A
/// vertical transformation is not needed if both datums (for ellipsoidal
/// heights) or vertical datums (for gravity-related heights) are the same. To
/// transform coordinates only between different horizontal (geographic)
/// coordinate systems, you can use a [GeographicTransformation] instead.
///
/// The inverse of this transformation, used to transform in the opposite
/// direction, is returned from the [DatumTransformation.getInverse] method.
///
/// A HorizontalVerticalTransformation can be constructed from a single
/// [HorizontalVerticalTransformationStep] object, or from a number of
/// transformation step objects that are chained together.
///
/// You can get a list of suitable transformations for a given input and output
/// spatial reference using one of the methods on the [TransformationCatalog]
/// class.
///
/// Some transformations require that certain Projection Engine data files be
/// present on the local file system, and vertical transformation steps are
/// especially likely to use such files, which can be very large in size. The
/// [DatumTransformation.isMissingProjectionEngineFiles] property indicates
/// whether any of the files are missing. The complete list of necessary files
/// for each specific step is available using the
/// [HorizontalVerticalTransformationStep.projectionEngineFilenames] property.
///
/// A HorizontalVerticalTransformation object is immutable.
final class HorizontalVerticalTransformation extends DatumTransformation {
  static HorizontalVerticalTransformation? _fromHandle(
      RT_HorizontalVerticalTransformationHandle handle) {
    if (handle == ffi.nullptr) return null;
    return HorizontalVerticalTransformation._withHandle(handle);
  }

  HorizontalVerticalTransformation._withHandle(super.handle)
      : _steps = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_HorizontalVerticalTransformation_getSteps(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        super._withHandle();

  /// Create a single step transformation.
  ///
  /// Parameters:
  /// - `step` — A [HorizontalVerticalTransformationStep] instance.
  factory HorizontalVerticalTransformation.withStep(
      HorizontalVerticalTransformationStep step) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformation_createWithStep(
          step._handle, errorHandler);
    });
    return HorizontalVerticalTransformation._withHandle(handle);
  }

  /// Create a multi-step transformation from one or more
  /// [HorizontalVerticalTransformationStep] instances.
  ///
  /// Use this constructor to create a horizontal-vertical transformation that
  /// has multiple steps. The output [SpatialReference] of each step should
  /// match the input [SpatialReference] of the following step.
  ///
  /// Parameters:
  /// - `steps` — A [List] containing [HorizontalVerticalTransformationStep]
  /// instances.
  factory HorizontalVerticalTransformation.withSteps(
      List<HorizontalVerticalTransformationStep> steps) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreSteps = steps.toArray(
        valueType: _ElementType.horizontalVerticalTransformationStep);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformation_createWithSteps(
          coreSteps._handle, errorHandler);
    });
    final HorizontalVerticalTransformation object =
        HorizontalVerticalTransformation._withHandle(handle);
    object._steps.value.setCache(steps);
    return object;
  }

  /// The array of transformation steps that define this transformation.
  List<HorizontalVerticalTransformationStep> get steps => _steps.value;

  final Memoized<_ArrayList<HorizontalVerticalTransformationStep>> _steps;
}

/// Represents a step in the process of transforming between horizontal and/or
/// vertical datums.
///
/// Each [HorizontalVerticalTransformationStep] can be constructed from a
/// well-known ID (WKID) that represents a horizontal (geographic) or a vertical
/// transformation. This API supports thousands of predefined transformations,
/// and all the supported WKIDs are documented in the 'Coordinate systems and
/// transformations' topic in the developers guide.
///
/// One or more [HorizontalVerticalTransformationStep] objects are combined into
/// a [HorizontalVerticalTransformation] object, and can then be used to control
/// how coordinates are transformed in a [GeometryEngine.project] method call.
///
/// A [HorizontalVerticalTransformationStep] object is immutable.
final class HorizontalVerticalTransformationStep implements ffi.Finalizable {
  final RT_HorizontalVerticalTransformationStepHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.HorizontalVerticalTransformationStep_destroy.cast());

  static HorizontalVerticalTransformationStep? _fromHandle(
      RT_HorizontalVerticalTransformationStepHandle handle) {
    if (handle == ffi.nullptr) return null;
    return HorizontalVerticalTransformationStep._withHandle(handle);
  }

  HorizontalVerticalTransformationStep._withHandle(
      RT_HorizontalVerticalTransformationStepHandle handle)
      : _projectionEngineFilenames = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_HorizontalVerticalTransformationStep_getProjectionEngineFilenames(
                    handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.HorizontalVerticalTransformationStep_created(_handle);
    }
  }

  /// Creates a new [HorizontalVerticalTransformationStep] instance from a
  /// well-known text string.
  ///
  /// Parameters:
  /// - `wkText` — The well-known text of the transformation step to create.
  factory HorizontalVerticalTransformationStep.withWkText(String wkText) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWkText = _CString(wkText);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_HorizontalVerticalTransformationStep_createWithWKText(
              coreWkText.bytes, errorHandler);
    });
    return HorizontalVerticalTransformationStep._withHandle(handle);
  }

  /// Creates a new [HorizontalVerticalTransformationStep] instance from a
  /// well-known ID.
  ///
  /// Occasionally, WKIDs may change, and older codes may be deprecated in favor
  /// of a new code. Both old (deprecated) and new (latest) WKIDs continue to
  /// work for instantiation, as long as they are supported by the Projection
  /// Engine. The [HorizontalVerticalTransformationStep.wkid] property returns
  /// the new (latest) WKID code.
  ///
  /// Parameters:
  /// - `wkid` — The well-known ID of the transformation step to create.
  factory HorizontalVerticalTransformationStep.withWkid(int wkid) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_createWithWKID(
          wkid, errorHandler);
    });
    return HorizontalVerticalTransformationStep._withHandle(handle);
  }

  /// True if this transformation step instance is an inverted transformation.
  ///
  /// Transformations have a specific direction that is indicated by the
  /// [HorizontalVerticalTransformationStep.wkText] value. An inverted
  /// transformation is used to transform geometries in the opposite direction
  /// to that indicated by the well-known text.
  /// [HorizontalVerticalTransformationStep] has
  /// [DatumTransformation.inputSpatialReference] and
  /// [DatumTransformation.outputSpatialReference] properties that respect the
  /// inverse value of the contained transformation(s).
  bool get isInverse {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_getIsInverse(
          _handle, errorHandler);
    });
  }

  /// True if any files needed by the Projection Engine for this transformation
  /// step are missing from the local file system.
  bool get isMissingProjectionEngineFiles {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_HorizontalVerticalTransformationStep_getIsMissingProjectionEngineFiles(
              _handle, errorHandler);
    });
  }

  /// A list of the Projection Engine files required to support this
  /// transformation step.
  ///
  /// Each name in the list includes the full path. Projection Engine datasets
  /// are used in grid-based transforms.
  List<String> get projectionEngineFilenames =>
      _projectionEngineFilenames.value;

  final Memoized<_ArrayList<String>> _projectionEngineFilenames;

  /// The well-known text of this transformation step instance.
  String get wkText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_getWKText(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The well-known ID or 0 if the transformation in this step does not have a
  /// well-known ID.
  ///
  /// Occasionally, WKIDs may change, and an older code may be deprecated in
  /// favor of a new code. This property returns the new (latest) WKID code.
  int get wkid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_getWKID(
          _handle, errorHandler);
    });
  }

  /// Returns the inverse of this transformation step or null if the
  /// transformation is not invertible.
  ///
  /// Return Value: A [HorizontalVerticalTransformationStep] representing the
  /// inverse or null if an inverse does not exist.
  HorizontalVerticalTransformationStep getInverse() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_getInverse(
          _handle, errorHandler);
    });
    return HorizontalVerticalTransformationStep._fromHandle(objectHandle)!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HorizontalVerticalTransformationStep) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_HorizontalVerticalTransformationStep_getHash(
          _handle, errorHandler);
    });
  }
}

/// Represents a single part of a multipart geometry (polygon or polyline).
///
/// A collection of [Segment] objects that together represent a part in a
/// [Multipart] geometry. You can also access the [ArcGISPoint] objects that
/// represent the vertices of the geometry (that is, the ends of each segment),
/// using point-based helpers such as [ImmutablePart.getPoint].
///
/// Prior to v100.12, the only supported segment type was [LineSegment]. If the
/// underlying geometry contained curve segments ([Geometry.hasCurves] is true)
/// then the curve information was lost when iterating through the segments in
/// that part.
///
/// From v100.12, curve segments may be returned from
/// [ImmutablePart.getSegment]. A part may contain a mix of linear and curve
/// segments.
final class ImmutablePart implements ffi.Finalizable {
  final RT_ImmutablePartHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ImmutablePart_destroy.cast());

  static ImmutablePart? _fromHandle(RT_ImmutablePartHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ImmutablePart._withHandle(handle);
  }

  ImmutablePart._withHandle(RT_ImmutablePartHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ImmutablePart_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ImmutablePart_created(_handle);
    }
  }

  /// The end point of the last segment in the part. Returns null if the
  /// collection is empty.
  ArcGISPoint? get endPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getEndPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Indicates if the part contains any curve segments.
  ///
  /// Prior to v100.12, if this property returned true, there was no way to
  /// access the curve segment information contained by the part. Retrieving the
  /// [Segment] instances of the part would return only [LineSegment] instances.
  ///
  /// From v100.12, when this property returns true, curve segments may be
  /// returned from [ImmutablePart.getSegment]. A part may contain a mix of
  /// linear and curve segments.
  bool get hasCurves {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getHasCurves(_handle, errorHandler);
    });
  }

  /// Indicates if the part contains no segments.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getIsEmpty(_handle, errorHandler);
    });
  }

  /// The count of points in the part.
  ///
  /// The points in the part are the start and end points of segments. Segments
  /// can share a point if the end point of one segment matches the start point
  /// of the next.
  int get pointCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getPointCount(_handle, errorHandler);
    });
  }

  /// The count of segments in the part.
  int get segmentCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getSegmentCount(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the immutable part.
  ///
  /// If the collection does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The start point of the first segment in the part. Returns null if the
  /// collection is empty.
  ArcGISPoint? get startPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getStartPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// For a segment at a specified segment_index the method returns the point
  /// index of the segment's end point.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A point index
  int getEndPointIndexFromSegmentIndex({required int segmentIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getEndPointIndexFromSegmentIndex(
          _handle, segmentIndex, errorHandler);
    });
  }

  /// Returns a point at a specified point index.
  ///
  /// The points in the part are the start and end points of segments. Segments
  /// can share a point if the end point of one segment matches the start point
  /// of the next.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: An [ArcGISPoint].
  ArcGISPoint getPoint({required int pointIndex}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getPoint(
          _handle, pointIndex, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Returns all the points that are the vertexes of the part.
  ///
  /// Return Value: A collections of points in the immutable part.
  ImmutablePointCollection getPoints() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getPoints(_handle, errorHandler);
    });
    return ImmutablePointCollection._fromHandle(objectHandle)!;
  }

  /// Gets a segment at a specified segment index.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A [Segment].
  Segment getSegment({required int segmentIndex}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getSegment(
          _handle, segmentIndex, errorHandler);
    });
    return Segment._fromHandle(objectHandle)!;
  }

  /// Converts from a point index to a segment index that uses the given point
  /// as an end point. If the point is not an end point then -1 is returned.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: The segment index containing the end point. If the point
  /// index is not an end point, then -1 is returned.
  int getSegmentIndexFromEndPointIndex({required int pointIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getSegmentIndexFromEndPointIndex(
          _handle, pointIndex, errorHandler);
    });
  }

  /// Converts from a point index to a segment index that uses the given point
  /// as a start point. If the point is not a start point, then -1 is returned.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: The segment index containing the start point. If point is
  /// not a start point, then -1 is returned.
  int getSegmentIndexFromStartPointIndex({required int pointIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getSegmentIndexFromStartPointIndex(
          _handle, pointIndex, errorHandler);
    });
  }

  /// For a segment at a specified segment_index the method returns the point
  /// index of the segment's start point.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A point index
  int getStartPointIndexFromSegmentIndex({required int segmentIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePart_getStartPointIndexFromSegmentIndex(
          _handle, segmentIndex, errorHandler);
    });
  }
}

/// Represents immutable collection of parts for a polygon or polyline geometry.
/// Each part is a collection of segments.
///
/// Polygons and polyline can have multiple disjoint parts. Each part is
/// represented by an [ImmutablePart]. A part is composed of segments
/// representing the edge of the polygon or polyline.
final class ImmutablePartCollection implements ffi.Finalizable {
  final RT_ImmutablePartCollectionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ImmutablePartCollection_destroy.cast());

  static ImmutablePartCollection? _fromHandle(
      RT_ImmutablePartCollectionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ImmutablePartCollection._withHandle(handle);
  }

  ImmutablePartCollection._withHandle(RT_ImmutablePartCollectionHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ImmutablePartCollection_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ImmutablePartCollection_created(_handle);
    }
  }

  /// Indicates if the immutable part collection contains no parts.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePartCollection_getIsEmpty(
          _handle, errorHandler);
    });
  }

  /// The number of parts in the immutable part collection.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePartCollection_getSize(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the immutable part collection.
  ///
  /// If the collection does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Returns a part at the specified index in the immutable part collection. A
  /// part is represented by an immutable collection of segments.
  ///
  /// Parameters:
  /// - `index` — Position to retrieve the part.
  ///
  /// Return Value: the immutable part at the specified part index.
  ImmutablePart getPart({required int index}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePartCollection_getPart(
          _handle, index, errorHandler);
    });
    return ImmutablePart._fromHandle(objectHandle)!;
  }

  /// Retrieves the position of the given part in the immutable part collection.
  ///
  /// Parameters:
  /// - `immutablePart` — The part you want to find.
  ///
  /// Return Value: The position of the part in the collection, -1 otherwise.
  int indexOf({required ImmutablePart immutablePart}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePartCollection_indexOf(
          _handle, immutablePart._handle, errorHandler);
    });
  }
}

/// Represents an immutable collection of points.
///
/// This collection is used to represent the content of a [Multipoint] geometry.
final class ImmutablePointCollection implements ffi.Finalizable {
  final RT_ImmutablePointCollectionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ImmutablePointCollection_destroy.cast());

  static ImmutablePointCollection? _fromHandle(
      RT_ImmutablePointCollectionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ImmutablePointCollection._withHandle(handle);
  }

  ImmutablePointCollection._withHandle(RT_ImmutablePointCollectionHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ImmutablePointCollection_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ImmutablePointCollection_created(_handle);
    }
  }

  /// Indicates if the immutable point collection contains no points.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePointCollection_getIsEmpty(
          _handle, errorHandler);
    });
  }

  /// The number of points in the collection.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePointCollection_getSize(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the immutable point collection.
  ///
  /// If the collection does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Returns a point at the specified index in the collection.
  ///
  /// Parameters:
  /// - `index` — The position in the collection.
  ///
  /// Return Value: The point at the specified position in the collection.
  ArcGISPoint getPoint({required int index}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePointCollection_getPoint(
          _handle, index, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Retrieves the position of the point in the immutable point collection. The
  /// first point that is equal to the supplied point is returned.
  ///
  /// Parameters:
  /// - `point` — The point to find.
  ///
  /// Return Value: The position of the point in the collection, -1 otherwise.
  int indexOf({required ArcGISPoint point}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ImmutablePointCollection_indexOf(
          _handle, point._handle, errorHandler);
    });
  }
}

/// Supported formats for representing latitude-longitude geographical
/// coordinates as a string.
enum LatitudeLongitudeFormat {
  /// The geographical coordinates are represented in decimal degrees.
  decimalDegrees,

  /// The geographical coordinates are represented in degrees and decimal
  /// minutes.
  degreesDecimalMinutes,

  /// The geographical coordinates are represented in degrees and minutes and
  /// decimal seconds.
  degreesMinutesSeconds;

  factory LatitudeLongitudeFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return decimalDegrees;
      case 1:
        return degreesDecimalMinutes;
      case 2:
        return degreesMinutesSeconds;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case decimalDegrees:
        return 0;
      case degreesDecimalMinutes:
        return 1;
      case degreesMinutesSeconds:
        return 2;
    }
  }
}

/// A line segment represents a straight line from its start to end point. It is
/// derived from a segment object.
final class LineSegment extends Segment {
  static LineSegment? _fromHandle(RT_LineSegmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LineSegment._withHandle(handle);
  }

  LineSegment._withHandle(super.handle) : super._withHandle();

  /// Creates a line segment based on two points and a spatial reference.
  ///
  /// Use this method to create a line segment representing a straight line
  /// between two points. The spatial reference parameter is used if the points
  /// have a null spatial reference. If more than one spatial reference is
  /// supplied (as a parameter or as a property of an [ArcGISPoint] parameter),
  /// they must all be equal.
  ///
  /// Parameters:
  /// - `startPoint` — The start point.
  /// - `endPoint` — The end point.
  /// - `spatialReference` — A spatial reference.
  factory LineSegment(
      {required ArcGISPoint startPoint,
      required ArcGISPoint endPoint,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSegment_createWithSpatialReference(
          startPoint._handle,
          endPoint._handle,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final LineSegment object = LineSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a line segment based on coordinates.
  ///
  /// Use this method to create a line segment representing a straight line
  /// between two points.
  ///
  /// Parameters:
  /// - `xStart` — The X coordinate of start point.
  /// - `yStart` — The Y coordinate of start point.
  /// - `xEnd` — The X coordinate of end point.
  /// - `yEnd` — The Y coordinate of end point.
  /// - `spatialReference` — A spatial reference.
  factory LineSegment.fromXY(
      {required double xStart,
      required double yStart,
      required double xEnd,
      required double yEnd,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSegment_createWithXYSpatialReference(
          xStart,
          yStart,
          xEnd,
          yEnd,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final LineSegment object = LineSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a line segment based on 3D coordinates and a spatial reference.
  ///
  /// Use this method to create a line segment representing a straight line
  /// between two points.
  ///
  /// Parameters:
  /// - `xStart` — The X coordinate of start point.
  /// - `yStart` — The Y coordinate of start point.
  /// - `zStart` — The Z coordinate of start point.
  /// - `xEnd` — The X coordinate of end point.
  /// - `yEnd` — The Y coordinate of end point.
  /// - `zEnd` — The Z coordinate of end point.
  /// - `spatialReference` — A spatial reference.
  factory LineSegment.fromXYZ(
      {required double xStart,
      required double yStart,
      required double zStart,
      required double xEnd,
      required double yEnd,
      required double zEnd,
      SpatialReference? spatialReference}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSegment_createWithXYZSpatialReference(
          xStart,
          yStart,
          zStart,
          xEnd,
          yEnd,
          zEnd,
          spatialReference?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final LineSegment object = LineSegment._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a line segment of the specified length and angle from a given
  /// start point.
  ///
  /// Use this method to create a line segment. The represents a straight line
  /// between two points. the spatial reference of the point is used to
  /// determine the segment's spatial reference. The angle is specified in
  /// radians relative to the X axis The length is in the units of the spatial
  /// reference.
  ///
  /// Parameters:
  /// - `startPoint` — The start point of the line segment.
  /// - `angleRadians` — The angle of the line relative to the X axis. Units are
  /// radians.
  /// - `length` — The length of the line.
  factory LineSegment.lineAtAngleFromStartPoint(
      {required ArcGISPoint startPoint,
      required double angleRadians,
      required double length}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSegment_createLineAtAngleFromStartPoint(
          startPoint._handle, angleRadians, length, errorHandler);
    });
    return LineSegment._withHandle(handle);
  }
}

/// Defines a linear unit of measurement.
///
/// The linear unit class is derived from the unit class.
final class LinearUnit extends Unit {
  static LinearUnit? _fromHandle(RT_LinearUnitHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LinearUnit._withHandle(handle);
  }

  LinearUnit._withHandle(super.handle) : super._withHandle();

  /// Creates a unit given its known id.
  ///
  /// Parameters:
  /// - `unitId` — The known id of the unit.
  factory LinearUnit({required LinearUnitId unitId}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_create(unitId.coreValue, errorHandler);
    });
    return LinearUnit._withHandle(handle);
  }

  /// Creates a linear unit given an area unit.
  ///
  /// Creates a unit given an area unit.
  ///
  /// Parameters:
  /// - `areaUnit` — The area unit.
  factory LinearUnit.fromAreaUnit(AreaUnit areaUnit) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_createFromAreaUnit(
          areaUnit._handle, errorHandler);
    });
    return LinearUnit._withHandle(handle);
  }

  /// The [LinearUnitId] of the given Linear unit.
  ///
  /// If an error occurs then [LinearUnitId.other] is returned.
  LinearUnitId get linearUnitId {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_getLinearUnitId(_handle, errorHandler);
    });
    return LinearUnitId._fromCoreValue(coreValue);
  }

  /// Converts a value in another UOM into this UOM.
  ///
  /// Parameters:
  /// - `fromUnit` — The UOM to convert from.
  /// - `value` — The value to convert.
  ///
  /// Return Value: The value in this UOM or NAN if the conversion fails.
  double convertFrom({required LinearUnit fromUnit, required double value}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_convertFrom(
          _handle, fromUnit._handle, value, errorHandler);
    });
  }

  /// Converts a value in this UOM into another UOM.
  ///
  /// Parameters:
  /// - `toUnit` — The UOM to convert to.
  /// - `value` — The value to convert.
  ///
  /// Return Value: The value in the target UOM or NAN if the conversion fails.
  double convertTo({required LinearUnit toUnit, required double value}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_convertTo(
          _handle, toUnit._handle, value, errorHandler);
    });
  }

  /// Converts a meter value to this UOM.
  ///
  /// Parameters:
  /// - `value` — The value to convert.
  ///
  /// Return Value: The value in this UOM or NAN if the conversion fails.
  double fromMeters(double value) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_fromMeters(_handle, value, errorHandler);
    });
  }

  /// Converts a value in this UOM to meters.
  ///
  /// Parameters:
  /// - `value` — The value to convert.
  ///
  /// Return Value: The value in meters or NAN if the conversion fails.
  double toMeters({required double value}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LinearUnit_toMeters(_handle, value, errorHandler);
    });
  }
}

/// Defines a list of the most commonly-used units of linear measurement.
///
/// These values can be used to create instances [Unit], as an alternative to
/// using well-known IDs (WKIDs). In addition to the units in this enumeration,
/// you can also use less commonly-used units, by passing a WKID of a linear
/// unit to the inherited [Unit.fromWkid] factory method. The function
/// [Unit.wkid] returns the WKID of the unit.
enum LinearUnitId {
  /// Indicates that the unit of linear measurement is a custom unit, or a unit
  /// that is not listed in the enumerated type. This value may be returned from
  /// a [LinearUnit] created from a WKID of a less commonly used unit of
  /// measurement that does not have an equivalent value in this enumeration.
  other,

  /// Indicates a linear measurement in centimeters. This unit has a WKID of
  /// 1033.
  centimeters,

  /// Indicates a linear measurement in feet. This unit has a WKID of 9002.
  feet,

  /// Indicates a linear measurement in inches. This unit has a WKID of 109008.
  inches,

  /// Indicates a linear measurement in kilometers. This unit has a WKID of
  /// 9036.
  kilometers,

  /// Indicates a linear measurement in meters. This unit has a WKID of 9001.
  meters,

  /// Indicates a linear measurement in statute miles. This unit has a WKID of
  /// 9093.
  miles,

  /// Indicates a linear measurement in millimeters. This unit has a WKID of
  /// 1025.
  millimeters,

  /// Indicates a linear measurement in nautical miles. This unit has a WKID of
  /// 9030.
  nauticalMiles,

  /// Indicates a linear measurement in yards. This unit has a WKID of 9096.
  yards;

  factory LinearUnitId._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return other;
      case 1033:
        return centimeters;
      case 9002:
        return feet;
      case 109008:
        return inches;
      case 9036:
        return kilometers;
      case 9001:
        return meters;
      case 9093:
        return miles;
      case 1025:
        return millimeters;
      case 9030:
        return nauticalMiles;
      case 9096:
        return yards;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case other:
        return 0;
      case centimeters:
        return 1033;
      case feet:
        return 9002;
      case inches:
        return 109008;
      case kilometers:
        return 9036;
      case meters:
        return 9001;
      case miles:
        return 9093;
      case millimeters:
        return 1025;
      case nauticalMiles:
        return 9030;
      case yards:
        return 9096;
    }
  }
}

/// Determines the lettering scheme and treatment of coordinates at 180 degrees
/// longitude when converting MGRS coordinates.
enum MgrsConversionMode {
  /// The choice of MGRS lettering scheme is based on the datum and ellipsoid of
  /// the spatial reference provided. Spatial references with new datums (e.g.
  /// WGS 84) assume new lettering scheme (AA scheme). This is equivalent to
  /// [MgrsConversionMode.new180InZone60]. Spatial references with older datums
  /// (e.g. Clarke 1866, Bessel 1841, Clarke 1880) assume old lettering scheme
  /// (AL scheme). This is equivalent to [MgrsConversionMode.old180InZone60].
  /// When converted, points with longitude of exactly 180deg are placed in zone
  /// 60.
  automatic,

  /// The MGRS notation uses the new lettering scheme (AA scheme) and, when
  /// converted, places points with longitude of 180deg in zone 01.
  new180InZone01,

  /// The MGRS notation uses the new lettering scheme (AA scheme) and, when
  /// converted, places points with longitude of 180deg in zone 60.
  new180InZone60,

  /// The MGRS notation uses the old lettering scheme (AL scheme) and, when
  /// converted, places points with longitude of 180deg in zone 01.
  old180InZone01,

  /// The MGRS notation uses the old lettering scheme (AL scheme) and, when
  /// converted, places points with longitude of 180deg in zone 60.
  old180InZone60;

  factory MgrsConversionMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return automatic;
      case 1:
        return new180InZone01;
      case 2:
        return new180InZone60;
      case 3:
        return old180InZone01;
      case 4:
        return old180InZone60;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case automatic:
        return 0;
      case new180InZone01:
        return 1;
      case new180InZone60:
        return 2;
      case old180InZone01:
        return 3;
      case old180InZone60:
        return 4;
    }
  }
}

/// Defines common members for polyline and polygon multipart geometries.
///
/// Multipart geometries are based upon the parent [Geometry] class. The
/// geometry class is immutable which means that you cannot change its shape
/// once it is created. If you need to modify a multipart once it has been
/// created, use the [MultipartBuilder] class instead. The
/// [GeometryBuilder.toGeometry] method provides you with the base geometry
/// object.
///
/// A multipart geometry is comprised of a collection of shapes (of the same
/// type) that is managed as a single geometry. A classic example is a set of
/// islands that represent a single country or state. The individual island
/// shapes are distinct, but ArcGIS considers it a single geometry.
///
/// [Polygon] and [Polyline] inherit from multipart, which in turn inherits from
/// [Geometry]. Multipart provides access to the geometry's
/// [ImmutablePartCollection] via the [Multipart.parts] property. Each
/// [ImmutablePart] in the collection is a collection of [Segment] objects. You
/// can iterate through the segments or points in each part.
final class Multipart extends Geometry {
  static Multipart? _fromHandle(RT_MultipartHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Geometry._objectTypeOf(handle)) {
      case GeometryType.polygon:
        return Polygon._withHandle(handle);
      case GeometryType.polyline:
        return Polyline._withHandle(handle);
      case GeometryType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w('An object of unsupported type is being treated as Multipart');
        return Multipart._withHandle(handle);
    }
  }

  Multipart._withHandle(super.handle)
      : _parts = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Multipart_getParts(handle, errorHandler);
          });
          return ImmutablePartCollection._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// The parts for the multipart.
  ///
  /// This is a copy and the any changes must be set.
  ImmutablePartCollection get parts => _parts.value;

  final Memoized<ImmutablePartCollection> _parts;
}

/// The multipart builders allow you to create and modify geometries made up of
/// multiple parts, such as [Polyline] and [Polygon].
///
/// This is a base class for the geometry multipart builders, such as
/// [PolylineBuilder] or [PolygonBuilder].
final class MultipartBuilder extends GeometryBuilder {
  static MultipartBuilder? _fromHandle(RT_MultipartBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (GeometryBuilder._objectTypeOf(handle)) {
      case _GeometryBuilderType.polygonBuilder:
        return PolygonBuilder._withHandle(handle);
      case _GeometryBuilderType.polylineBuilder:
        return PolylineBuilder._withHandle(handle);
      case _GeometryBuilderType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as MultipartBuilder');
        return MultipartBuilder._withHandle(handle);
    }
  }

  MultipartBuilder._withHandle(super.handle)
      : _parts = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MultipartBuilder_getParts(
                handle, errorHandler);
          });
          return MutablePartCollection._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MultipartBuilder_setParts(
                handle, value._handle, errorHandler);
          });
        }),
        super._withHandle();

  /// New parts for the multipart builder.
  ///
  /// The collection of parts for the multipart builder. Changes to the
  /// collection are reflected in the multipart builder.
  MutablePartCollection get parts => _parts.value;

  set parts(MutablePartCollection value) => _parts.value = value;

  final Memoized<MutablePartCollection> _parts;

  /// Adds a new point to the end of the last part of the multipart.
  ///
  /// If there are no parts then an initial part is created and the point added
  /// to that. The point becomes the end point of a line segment in the part.
  ///
  /// Parameters:
  /// - `point` — The point to add.
  ///
  /// Return Value: the point index of the new point in the last part
  int addPoint(ArcGISPoint point) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MultipartBuilder_addPoint(
          _handle, point._handle, errorHandler);
    });
  }

  /// Adds a new point to the end of the last part of the multipart.
  ///
  /// If there are no parts then an initial part is created and the point added
  /// to that. The point becomes the end point of a line segment in the part.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the point to add.
  /// - `y` — The y-coordinate of the point to add.
  ///
  /// Return Value: The point index of the new point in the last part.
  int addPointXY({required double x, required double y}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MultipartBuilder_addPointXY(
          _handle, x, y, errorHandler);
    });
  }

  /// Adds a new point to the end of the last part of the multipart.
  ///
  /// If there are no parts then an initial part is created and the point added
  /// to that. The point becomes the end point of a line segment in the part.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the point to add.
  /// - `y` — The y-coordinate of the point to add.
  /// - `z` — The z-coordinate of the point to add.
  ///
  /// Return Value: the point index of the new point in the last part
  int addPointXYZ({required double x, required double y, required double z}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MultipartBuilder_addPointXYZ(
          _handle, x, y, z, errorHandler);
    });
  }
}

/// An ordered collection of points that can be managed as a single geometry.
///
/// [Multipoint] geometries represent an ordered collection of points. They can
/// be used as the geometry of features and graphics, or as input or output for
/// spatial operations. For features that consist of a very large number of
/// points that share the same set of attribute values, multipoints may be more
/// efficient to store and analyze in a geodatabase compared to using multiple
/// point features.
///
/// A [Multipoint] is composed of a single read-only collection of
/// [ArcGISPoint]. Use [MultipointBuilder] to build a multipoint one point at a
/// time or to modify an existing [Multipoint].
final class Multipoint extends Geometry {
  static Multipoint? _fromHandle(RT_MultipointHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Multipoint._withHandle(handle);
  }

  Multipoint._withHandle(super.handle)
      : _points = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Multipoint_getPoints(handle, errorHandler);
          });
          return ImmutablePointCollection._fromHandle(objectHandle)!;
        }),
        super._withHandle();

  /// The read-only collection of points for the multipoint.
  ///
  /// Use [MultipointBuilder] to build a multipoint one point at a time or to
  /// modify the points that compose an existing [Multipoint].
  ImmutablePointCollection get points => _points.value;

  final Memoized<ImmutablePointCollection> _points;
}

/// The multipoint builder allows you to create and modify multipoint
/// geometries.
///
/// Multipoint geometries represent an ordered collection of points. They can be
/// used as the geometry of features and graphics, or as input or output for
/// spatial operations. For features that consist of a very large number of
/// points that share the same set of attribute values, multipoints may be more
/// efficient to store and analyze in a geodatabase compared to using multiple
/// point features.
///
/// A [Multipoint] is composed of a single read-only [ArcGISPoint] collection.
/// Use [GeometryBuilder.toGeometry] to return the [Multipoint] from the
/// [MultipointBuilder].
final class MultipointBuilder extends GeometryBuilder {
  static MultipointBuilder? _fromHandle(RT_MultipointBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MultipointBuilder._withHandle(handle);
  }

  MultipointBuilder._withHandle(super.handle)
      : _points = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MultipointBuilder_getPoints(
                handle, errorHandler);
          });
          return MutablePointCollection._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MultipointBuilder_setPoints(
                handle, value._handle, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a multipoint builder from the specified [Multipoint].
  ///
  /// The [SpatialReference] of the multipoint point builder will match that of
  /// the specified [Multipoint].
  ///
  /// Parameters:
  /// - `multipoint` — A multipoint object.
  factory MultipointBuilder.fromMultipoint(Multipoint? multipoint) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MultipointBuilder_createFromMultipoint(
          multipoint?._handle ?? ffi.nullptr, errorHandler);
    });
    return MultipointBuilder._withHandle(handle);
  }

  /// Creates an empty multipoint builder with the specified [SpatialReference].
  ///
  /// The [SpatialReference] cannot be changed after instantiation.
  ///
  /// Parameters:
  /// - `spatialReference` — The builder's spatial reference.
  factory MultipointBuilder.fromSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MultipointBuilder_createFromSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final MultipointBuilder object = MultipointBuilder._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// A mutable collection of points from the multipoint builder.
  ///
  /// Use this collection to add points to or remove points from the builder.
  MutablePointCollection get points => _points.value;

  set points(MutablePointCollection value) => _points.value = value;

  final Memoized<MutablePointCollection> _points;
}

/// Represents a single part of a multipart builder.
///
/// Multipart builder is the base class of [PolygonBuilder] or
/// [PolylineBuilder]. A part is made up of a collection of segments making the
/// edge of the multipart. Additionally access and modified using the points
/// (vertexes) of segments is available. Adjacent segments which share an end
/// point and a start point are connected and the shared vertex is not
/// duplicated when accessing points. The mutable part can represent gaps
/// between one end point and an adjacent start. However, this is only
/// recommended as a temporary state while modifying a multipart builder, when
/// using [GeometryBuilder.toGeometry] the gaps are closed with line segments.
///
/// Prior to v100.12, the only supported segment type was [LineSegment].
///
/// From v100.12, curve segments can be added to a [MutablePart] and used build
/// polygon and polyline geometries. A part may contain a mix of linear and
/// curve segments.
final class MutablePart implements ffi.Finalizable {
  final RT_MutablePartHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.MutablePart_destroy.cast());

  static MutablePart? _fromHandle(RT_MutablePartHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MutablePart._withHandle(handle);
  }

  MutablePart._withHandle(RT_MutablePartHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MutablePart_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.MutablePart_created(_handle);
    }
  }

  /// Creates a part with a specified spatial reference.
  ///
  /// Parameters:
  /// - `spatialReference` — A spatial reference object, can be null.
  factory MutablePart.withSpatialReference(SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_createWithSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final MutablePart object = MutablePart._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The end point of the last segment in the part. Returns null if the
  /// collection is empty.
  ArcGISPoint? get endPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getEndPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Indicates if the part contains any curve segments.
  ///
  /// Prior to v100.12, only [LineSegment] linear segments were available to be
  /// added to mutable parts when building geometries.
  ///
  /// From v100.12, geometry builders support curve segments. This property
  /// returns true if any segments where [Segment.isCurve] is true have been
  /// added to the part.
  bool get hasCurves {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getHasCurves(_handle, errorHandler);
    });
  }

  /// Indicates if the part contains no segments.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getIsEmpty(_handle, errorHandler);
    });
  }

  /// The count of points in the part.
  ///
  /// The points in the part are the start and end points of segments. Segments
  /// can share a point if the end point of one segment matches the start point
  /// of the next.
  int get pointCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getPointCount(_handle, errorHandler);
    });
  }

  /// The count of segments in the part.
  int get segmentCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getSegmentCount(_handle, errorHandler);
    });
  }

  /// The spatial reference for the part.
  ///
  /// If the mutable_part does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The start point of the first segment in the part. Returns null if the
  /// collection is empty.
  ArcGISPoint? get startPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getStartPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Add a new point to the end of the part. A new line segment is added to
  /// connect the new point to the previous.
  ///
  /// The points in the part are the start and end points of segments. A new
  /// line segment is added to connect the new point to the previous point. If
  /// this is the first point in an empty segment, a single closed segment is
  /// added using the same start and end point. Adding a second point updates
  /// this line segment to gain a distinct end point. Adding subsequent points
  /// adds new line segments.
  ///
  /// Parameters:
  /// - `point` — The point to add.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred then -1 is returned.
  int addPoint(ArcGISPoint point) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_addPoint(
          _handle, point._handle, errorHandler);
    });
  }

  /// Add a new point to the end of the part by specifying the points x,y
  /// coordinates. A new line segment is added to connect the new point to the
  /// previous.
  ///
  /// The points in the part are the start and end points of segments. A new
  /// line segment is added to connect the new point to the previous point. If
  /// this is the first point in an empty segment, a single closed segment is
  /// added using the same start and end point. Adding a second point updates
  /// this line segment to gain a distinct end point. Adding subsequent points
  /// adds new line segments.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred, then -1 is returned.
  int addPointXY({required double x, required double y}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_addPointXY(_handle, x, y, errorHandler);
    });
  }

  /// Add a new point to the end of the part by specifying the points x,y,z
  /// coordinates. A new line segment is added to connect the new point to the
  /// previous.
  ///
  /// The points in the part are the start and end points of segments. A new
  /// line segment is added to connect the new point to the previous point. If
  /// this is the first point in an empty segment, a single closed segment is
  /// added using the same start and end point. Adding a second point updates
  /// this line segment to gain a distinct end point. Adding subsequent points
  /// adds new line segments.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  /// - `z` — The z-coordinate of the new point.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred then -1 is returned.
  int addPointXYZ({required double x, required double y, required double z}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_addPointXYZ(
          _handle, x, y, z, errorHandler);
    });
  }

  /// Add segment to the end of the part.
  ///
  /// A new segment is added to the end. If the start point of the segment
  /// matches the previous end point, the segment shares this point. The count
  /// of points increases by 1 if the segment connects, or 2 points if it is
  /// disconnected. A more efficient way to add a [LineSegment] to a part is to
  /// use one of the point addition methods. For example
  /// [MutablePart.addPointXY].
  ///
  /// Parameters:
  /// - `segment` — The segment.
  ///
  /// Return Value: the segment index where the segment was added. If an error
  /// occurred, then -1 is returned.
  int addSegment(Segment segment) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_addSegment(
          _handle, segment._handle, errorHandler);
    });
  }

  /// For a segment at a specified segment_index the method returns the point
  /// index of the segment's end point.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A point index
  int getEndPointIndexFromSegmentIndex({required int segmentIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getEndPointIndexFromSegmentIndex(
          _handle, segmentIndex, errorHandler);
    });
  }

  /// Returns a point at a specified point index.
  ///
  /// The points in the part are the start and end points of segments. Segments
  /// can share a point if the end point of one segment matches the start point
  /// of the next.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: An [ArcGISPoint].
  ArcGISPoint getPoint({required int pointIndex}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getPoint(
          _handle, pointIndex, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Returns all the points that are the vertexes of the part.
  ///
  /// This is a copy of the points in the mutable part.
  ///
  /// Return Value: The immutable collections of points.
  ImmutablePointCollection getPoints() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getPoints(_handle, errorHandler);
    });
    return ImmutablePointCollection._fromHandle(objectHandle)!;
  }

  /// Gets a segment at a specified segment index.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A [Segment].
  Segment getSegment({required int segmentIndex}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getSegment(
          _handle, segmentIndex, errorHandler);
    });
    return Segment._fromHandle(objectHandle)!;
  }

  /// Converts from a point index to a segment index that uses the given point
  /// as an end point. If the point is not an end point, then -1 is returned.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: The segment index containing the end point or max size_t if
  /// the segment is not found.
  int getSegmentIndexFromEndPointIndex({required int pointIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getSegmentIndexFromEndPointIndex(
          _handle, pointIndex, errorHandler);
    });
  }

  /// Converts from a point index to a segment index that uses the given point
  /// as a start point. If the point is not a start point, then -1 is returned.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  ///
  /// Return Value: The segment index containing the start point. If point is
  /// not a start point, then -1 is returned.
  int getSegmentIndexFromStartPointIndex({required int pointIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getSegmentIndexFromStartPointIndex(
          _handle, pointIndex, errorHandler);
    });
  }

  /// For a segment at a specified segment_index the method returns the point
  /// index of the segment's start point.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  ///
  /// Return Value: A point index
  int getStartPointIndexFromSegmentIndex({required int segmentIndex}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePart_getStartPointIndexFromSegmentIndex(
          _handle, segmentIndex, errorHandler);
    });
  }

  /// Inserts a point into the part at the specified point index. Line segments
  /// are added to connect the point to adjacent segments.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection. The points in the part are
  /// the start and end points of segments. An existing segment connection the
  /// point before or after the point index is removed. Inserting a new point
  /// inserts new line segments connecting the adjacent points.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `point` — The point to insert.
  void insertPoint({required int pointIndex, required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_insertPoint(
          _handle, pointIndex, point._handle, errorHandler);
    });
  }

  /// Inserts a point specified by its x,y coordinates into the part at the
  /// specified point index. Line segments are added to connect the point to
  /// adjacent segments.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection. The points in the part are
  /// the start and end points of segments. An existing segment connection the
  /// point before or after the point index is removed. Inserting a new point
  /// inserts new line segments connecting the adjacent points.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  void insertPointXY(
      {required int pointIndex, required double x, required double y}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_insertPointXY(
          _handle, pointIndex, x, y, errorHandler);
    });
  }

  /// Inserts a point specified by its x,y,z coordinate into the part at the
  /// specified point index. Line segments are added to connect the point to
  /// adjacent segments.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection. The points in the part are
  /// the start and end points of segments. An existing segment connection the
  /// point before or after the point index is removed. Inserting a new point
  /// inserts new line segments connecting the adjacent points.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  /// - `z` — The z-coordinate of the new point.
  void insertPointXYZ(
      {required int pointIndex,
      required double x,
      required double y,
      required double z}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_insertPointXYZ(
          _handle, pointIndex, x, y, z, errorHandler);
    });
  }

  /// Inserts a segment into the part at the specified index.
  ///
  /// The new segment is inserted at the specified segment_index. This index may
  /// be equal to the segment count which is equivalent to adding to the end of
  /// the collection. The number of points in the part increases to connect in
  /// the new segment.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  /// - `segment` — The segment to insert.
  void insertSegment({required int segmentIndex, required Segment segment}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_insertSegment(
          _handle, segmentIndex, segment._handle, errorHandler);
    });
  }

  /// Remove all segments from the part.
  ///
  /// After calling this method the part is empty.
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_removeAll(_handle, errorHandler);
    });
  }

  /// Removes a point from the part. Segments connecting to this point are
  /// removed and the gap filled with a new line segment.
  ///
  /// The points in the part are the start and end points of segments. Removing
  /// a point can remove the two adjacent segments. A new line segment
  /// reconnects the gap.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  void removePoint({required int pointIndex}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_removePoint(_handle, pointIndex, errorHandler);
    });
  }

  /// Remove a segment at the specified index from the part.
  ///
  /// If the segment connected to adjacent segments, then after a segment is
  /// removed a gap can be left behind.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  void removeSegment({required int segmentIndex}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_removeSegment(
          _handle, segmentIndex, errorHandler);
    });
  }

  /// Replace a point in the part at the specified point index. Segments that
  /// use this point are changed.
  ///
  /// The points in the part correspond to start and end points of segments.
  /// Setting a new point affects 1 or 2 segments using the point at the
  /// specified index. The type of affected segment(s) ([LineSegment],
  /// [CubicBezierSegment] or [EllipticArcSegment]) remains the same.
  ///
  /// For affected cubic bezier segments, the shape of the curve may change
  /// because the control points remain the same, as does the unchanged start or
  /// end point location. For elliptic arc segments, the arc parameters are
  /// adjusted enough to ensure the unchanged start or end point location
  /// remains the same.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `point` — The point.
  void setPoint({required int pointIndex, required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_setPoint(
          _handle, pointIndex, point._handle, errorHandler);
    });
  }

  /// Replaces a segment at the specified index in the part.
  ///
  /// The points of the part can change if the input segment is not coincident
  /// with the start and end points of the segment that's being replaced.
  ///
  /// Parameters:
  /// - `segmentIndex` — Zero-based index of the segment.
  /// - `segment` — The segment to be set into the collection.
  void setSegment({required int segmentIndex, required Segment segment}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePart_setSegment(
          _handle, segmentIndex, segment._handle, errorHandler);
    });
  }
}

/// A collection object that can be changed containing parts for a geometry.
/// Each part is represented by a [MutablePart].
final class MutablePartCollection implements ffi.Finalizable {
  final RT_MutablePartCollectionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.MutablePartCollection_destroy.cast());

  static MutablePartCollection? _fromHandle(
      RT_MutablePartCollectionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MutablePartCollection._withHandle(handle);
  }

  MutablePartCollection._withHandle(RT_MutablePartCollectionHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MutablePartCollection_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.MutablePartCollection_created(_handle);
    }
  }

  /// Creates a mutable part collection with a specified spatial reference.
  ///
  /// Parameters:
  /// - `spatialReference` — A spatial reference object, can be null.
  factory MutablePartCollection.withSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_createWithSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final MutablePartCollection object =
        MutablePartCollection._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Indicates if the mutable part collection contains no parts.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_getIsEmpty(
          _handle, errorHandler);
    });
  }

  /// The number of parts in the collection.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_getSize(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the mutable part collection.
  ///
  /// If the collection does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Add a new part to the end of the mutable part collection.
  ///
  /// Parameters:
  /// - `mutablePart` — The part to add.
  ///
  /// Return Value: the index where the part was added. If an error occurred,
  /// then -1 is returned.
  int addPart({required MutablePart mutablePart}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_addPart(
          _handle, mutablePart._handle, errorHandler);
    });
  }

  /// Returns a part at the specified index in the collection.
  ///
  /// Parameters:
  /// - `index` — The position in the collection.
  ///
  /// Return Value: The part at the specified position in the collection.
  MutablePart getPart({required int index}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_getPart(
          _handle, index, errorHandler);
    });
    return MutablePart._fromHandle(objectHandle)!;
  }

  /// Retrieves the position of the segment in the mutable part collection. The
  /// first segment that is equal to the supplied segment is returned.
  ///
  /// Parameters:
  /// - `mutablePart` — The part to find.
  ///
  /// Return Value: The position of the segment in the collection, -1 otherwise.
  int indexOf({required MutablePart mutablePart}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePartCollection_indexOf(
          _handle, mutablePart._handle, errorHandler);
    });
  }

  /// Inserts a part into the mutable part collection at the specified part
  /// index.
  ///
  /// The part index can be equal to the part count and this is equivalent to
  /// adding a part to the end of the collection.
  ///
  /// Parameters:
  /// - `index` — Zero-based index of the part.
  /// - `mutablePart` — The part to insert.
  void insertPart({required int index, required MutablePart mutablePart}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePartCollection_insertPart(
          _handle, index, mutablePart._handle, errorHandler);
    });
  }

  /// Remove all parts from the mutable part collection.
  ///
  /// After calling this method the mutable part collection is empty.
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePartCollection_removeAll(_handle, errorHandler);
    });
  }

  /// Removes a part from the mutable part collection.
  ///
  /// Parameters:
  /// - `index` — Zero-based index of the part.
  void removePart({required int index}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePartCollection_removePart(
          _handle, index, errorHandler);
    });
  }

  /// Replace a part in the mutable part collection at the specified part index.
  ///
  /// Parameters:
  /// - `index` — Zero-based index of the part.
  /// - `mutablePart` — Collection of segments representing the part.
  void setPart({required int index, required MutablePart mutablePart}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePartCollection_setPart(
          _handle, index, mutablePart._handle, errorHandler);
    });
  }
}

/// A collection object that can be changed containing points.
///
/// Contains a collection of points that can be changed.
final class MutablePointCollection implements ffi.Finalizable {
  final RT_MutablePointCollectionHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.MutablePointCollection_destroy.cast());

  static MutablePointCollection? _fromHandle(
      RT_MutablePointCollectionHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MutablePointCollection._withHandle(handle);
  }

  MutablePointCollection._withHandle(RT_MutablePointCollectionHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MutablePointCollection_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.MutablePointCollection_created(_handle);
    }
  }

  /// Creates a mutable point collection with a specified spatial reference.
  ///
  /// Parameters:
  /// - `spatialReference` — A spatial reference object, can be null.
  factory MutablePointCollection.withSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_createWithSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final MutablePointCollection object =
        MutablePointCollection._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Indicates if the mutable point collection contains no points.
  bool get isEmpty {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_getIsEmpty(
          _handle, errorHandler);
    });
  }

  /// The number of points in the collection.
  int get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_getSize(
          _handle, errorHandler);
    });
  }

  /// The spatial reference for the mutable point collection.
  ///
  /// If the collection does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// Add a new point to the end of the mutable point collection.
  ///
  /// Parameters:
  /// - `point` — The point to add.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred, then -1 is returned.
  int addPoint(ArcGISPoint point) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_addPoint(
          _handle, point._handle, errorHandler);
    });
  }

  /// Add a new point to the end of the mutable point collection by specifying
  /// the points x,y coordinates.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred, then -1 is returned.
  int addPointXY({required double x, required double y}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_addPointXY(
          _handle, x, y, errorHandler);
    });
  }

  /// Add a new point to the end of the mutable point collection by specifying
  /// the points x,y,z coordinates.
  ///
  /// Parameters:
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  /// - `z` — The z coordinate of the new point.
  ///
  /// Return Value: the point index where the point was added. If an error
  /// occurred, then -1 is returned.
  int addPointXYZ({required double x, required double y, required double z}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_addPointXYZ(
          _handle, x, y, z, errorHandler);
    });
  }

  /// Add a new points to the end of the mutable point collection.
  ///
  /// Parameters:
  /// - `points` — The new points to add.
  void addPoints(MutablePointCollection points) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_addPoints(
          _handle, points._handle, errorHandler);
    });
  }

  /// Add a new points to the end of the mutable point collection.
  ///
  /// Parameters:
  /// - `points` — The new points to add.
  void addPointsFromImmutable({required ImmutablePointCollection points}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_addPointsFromImmutable(
          _handle, points._handle, errorHandler);
    });
  }

  /// Returns a point at the specified index in the collection.
  ///
  /// Parameters:
  /// - `index` — The position in the collection.
  ///
  /// Return Value: The point at the specified position in the collection.
  ArcGISPoint getPoint({required int index}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_getPoint(
          _handle, index, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Retrieves the position of the point in the mutable point collection. The
  /// first point that is equal to the supplied point is returned.
  ///
  /// Parameters:
  /// - `point` — The point to find.
  ///
  /// Return Value: The position of the point in the collection, -1 otherwise.
  int indexOf({required ArcGISPoint point}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MutablePointCollection_indexOf(
          _handle, point._handle, errorHandler);
    });
  }

  /// Inserts a point into the mutable point collection at the specified point
  /// index.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `point` — The point to insert.
  void insertPoint({required int pointIndex, required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_insertPoint(
          _handle, pointIndex, point._handle, errorHandler);
    });
  }

  /// Inserts a point specified by its x,y coordinates into the mutable point
  /// collection at the specified point index.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  void insertPointXY(
      {required int pointIndex, required double x, required double y}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_insertPointXY(
          _handle, pointIndex, x, y, errorHandler);
    });
  }

  /// Inserts a point specified by its x,y,z coordinate into the mutable point
  /// collection at the specified point index.
  ///
  /// The point index can be equal to the point count and this is equivalent to
  /// adding a point to the end of the collection.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `x` — The x-coordinate of the new point.
  /// - `y` — The y-coordinate of the new point.
  /// - `z` — The z-coordinate of the new point.
  void insertPointXYZ(
      {required int pointIndex,
      required double x,
      required double y,
      required double z}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_insertPointXYZ(
          _handle, pointIndex, x, y, z, errorHandler);
    });
  }

  /// Remove all points from the mutable point collection.
  ///
  /// After calling this method the mutable point collection is empty.
  void removeAll() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_removeAll(_handle, errorHandler);
    });
  }

  /// Removes a point from the mutable point collection.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  void removePoint({required int pointIndex}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_removePoint(
          _handle, pointIndex, errorHandler);
    });
  }

  /// Replace a point in the mutable point collection at the specified point
  /// index.
  ///
  /// Parameters:
  /// - `pointIndex` — Zero-based index of the point.
  /// - `point` — The point.
  void setPoint({required int pointIndex, required ArcGISPoint point}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MutablePointCollection_setPoint(
          _handle, pointIndex, point._handle, errorHandler);
    });
  }
}

/// The point builder allows you to create and modify point geometries
/// incrementally.
///
/// Point geometries are immutable and cannot be changed directly once created.
/// The [PointBuilder] has a number of constructors to allow you to create a new
/// point, or you can edit an existing point using [PointBuilder.setXY] or
/// [PointBuilder.offsetBy]. Use [GeometryBuilder.toGeometry] to return the new
/// [ArcGISPoint] from the builder.
final class PointBuilder extends GeometryBuilder {
  static PointBuilder? _fromHandle(RT_PointBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PointBuilder._withHandle(handle);
  }

  PointBuilder._withHandle(super.handle) : super._withHandle();

  /// Creates a point builder from the specified point.
  ///
  /// The [SpatialReference] of the new point builder will match that of the
  /// specified [ArcGISPoint].
  ///
  /// Parameters:
  /// - `point` — The point object.
  factory PointBuilder.fromPoint(ArcGISPoint? point) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_createFromPoint(
          point?._handle ?? ffi.nullptr, errorHandler);
    });
    return PointBuilder._withHandle(handle);
  }

  /// Creates an empty point builder with the specified [SpatialReference].
  ///
  /// The [SpatialReference] cannot be changed after instantiation.
  ///
  /// Parameters:
  /// - `spatialReference` — The builder's spatial reference.
  factory PointBuilder.fromSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_createFromSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final PointBuilder object = PointBuilder._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// The m-value for the point.
  ///
  /// Will return NAN if an error occurs.
  double get m {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_getM(_handle, errorHandler);
    });
  }

  set m(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_setM(_handle, value, errorHandler);
    });
  }

  /// The x-coordinate for the point.
  ///
  /// Will return NAN if an error occurs.
  double get x {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_getX(_handle, errorHandler);
    });
  }

  set x(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_setX(_handle, value, errorHandler);
    });
  }

  /// The y-coordinate for the point.
  ///
  /// Will return NAN if an error occurs.
  double get y {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_getY(_handle, errorHandler);
    });
  }

  set y(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_setY(_handle, value, errorHandler);
    });
  }

  /// The z-coordinate for the point.
  ///
  /// The minimum z-coordinate is -6,356,752 meters, which is the approximate
  /// radius of the earth (the WGS 84 datum semi-minor axis). The maximum
  /// z-coordinate is 55,000,000 meters. Will return NAN if an error occurs.
  double get z {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PointBuilder_getZ(_handle, errorHandler);
    });
  }

  set z(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_setZ(_handle, value, errorHandler);
    });
  }

  /// Adjusts the points's x-coordinate to be within the bounds of the assigned
  /// spatial reference.
  void _normalize() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_normalize(_handle, errorHandler);
    });
  }

  /// Normalizes the point to the passed in envelope.
  ///
  /// Parameters:
  /// - `envelope` — The envelope to normalize against.
  void _normalizeToEnvelope({required Envelope envelope}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_normalizeToEnvelope(
          _handle, envelope._handle, errorHandler);
    });
  }

  /// Normalizes the point for wraparound.
  ///
  /// Parameters:
  /// - `target` — The target point within the spatial reference's bounds to
  /// normalize to.
  void _normalizeToPointClosestTo({required ArcGISPoint target}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_normalizeToPointClosestTo(
          _handle, target._handle, errorHandler);
    });
  }

  /// Offsets the point by the given offsets for the x and y dimension.
  ///
  /// Parameters:
  /// - `offsetX` — The number of units to move the point on the x axis.
  /// - `offsetY` — The number of units to move the point on the y axis.
  void offsetBy({required double offsetX, required double offsetY}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_offsetBy(
          _handle, offsetX, offsetY, errorHandler);
    });
  }

  /// Sets the x,y coordinates of a point.
  ///
  /// Parameters:
  /// - `x` — The new x-coordinate value for the point.
  /// - `y` — The new y-coordinate value for the point.
  void setXY({required double x, required double y}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PointBuilder_setXY(_handle, x, y, errorHandler);
    });
  }
}

/// A multipart shape used to represent an area.
///
/// Polygon geometries represent the shape and location of areas, for example, a
/// country, island, or a lake. A polygon can be used as the geometry of
/// features and graphics, or as input or output of tasks or geoprocessing
/// operations, such as the output of a drive-time analysis or a
/// [GeometryEngine.buffer] operation.
///
/// Each part of a multipart polygon is a series of connected [Segment] objects
/// forming a closed ring. Each part must not cross any other part, but may lie
/// completely inside or outside another part. For example, a polygon
/// representing the state of Hawaii would comprise eight disjoint parts, one
/// representing each island. A polygon representing the country of South
/// Africa, which completely surrounds the enclave of Lesotho, would comprise
/// two parts, one contained inside the other.
///
/// Polygon is similar to [Polyline] in that they are both composed of a series
/// of connected segments. Like [Polyline], the polygon class is a [Multipart],
/// which provides members for iterating the segments and points of each part in
/// a polygon. Unlike parts in a [Polyline], however, each part of a polygon
/// defines a closed area, so the end point of the last segment in the part is
/// always in the same location as the start point of the first segment, forming
/// a closed boundary.
///
/// When defining a polygon part, there is no need to explicitly close it by
/// repeating the start point as the last point. Polygon parts are always
/// interpreted as enclosed areas by this API. However, you may need to simplify
/// a polygon created with this API before storing it in a geodatabase or using
/// it in geometry operations that rely on topological consistency. Interior
/// rings to make donut polygons should be counter-clockwise in direction to
/// have the correct topology.
///
/// If there is ever a doubt about the topological correctness of a polygon,
/// call the [GeometryEngine.simplify] method to correct any issues. This is
/// especially true if you pass a polygon to ArcGIS Server for a geoprocessing
/// task to avoid any ArcGIS Server errors being thrown or to rectify polygons
/// that may be self-intersecting, have rings which are partially contained in
/// each other, or contain incorrect ring orientations.
///
/// Polygons are based upon the parent [Geometry] class. The geometry object is
/// immutable which means that you can not change its shape once it is created.
/// If you need to create a new polygon or modify it once it has been created,
/// use the [PolygonBuilder] class.
///
/// A polygon can be used as the geometry of a [Feature] or [Graphic]. To obtain
/// the geometry on these objects, use [GeoElement.geometry].
final class Polygon extends Multipart {
  static Polygon? _fromHandle(RT_PolygonHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Polygon._withHandle(handle);
  }

  Polygon._withHandle(super.handle) : super._withHandle();

  /// Creates a polyline containing paths for all the rings in this polygon.
  ///
  /// Return Value: A polyline.
  Polyline toPolyline() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Polygon_toPolyline(_handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle)!;
  }
}

/// The polygon builder allows you to create and modify [Polygon] geometries
/// incrementally.
///
/// Polygon geometries are immutable and cannot be changed directly once
/// created. A polygon is a closed area shape defined by one or more parts. Each
/// part in a polygon is a connected sequence of [Segment] instances that start
/// and end at the same point (a closed ring). If a polygon has more than one
/// ring, the rings may be separate from one another or they may nest inside one
/// another, but they should not overlap. Note: interior rings, to make donut
/// polygons, should be counter-clockwise in direction to be topology correct.
/// If there is ever a doubt about the topological correctness of a polygon,
/// call [GeometryEngine.simplify] to correct any issues.
///
/// The polygon builder allows you to change the contents of the shape using the
/// [MutablePartCollection] that you can access from the
/// [MultipartBuilder.parts]. Each [MutablePart], in this
/// [MutablePartCollection], comprises a collection of segments that make edges
/// of the [MutablePart]. You can add or remove a [MutablePart] from the
/// [MutablePartCollection], or you can create a new or edit the segment
/// vertices of an existing [MutablePart]. Use [GeometryBuilder.toGeometry] to
/// return the new [Polygon] from the builder.
final class PolygonBuilder extends MultipartBuilder {
  static PolygonBuilder? _fromHandle(RT_PolygonBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PolygonBuilder._withHandle(handle);
  }

  PolygonBuilder._withHandle(super.handle) : super._withHandle();

  /// Creates a new polygon builder by copying the parts from the specified
  /// [Polygon].
  ///
  /// The [SpatialReference] of the new polygon builder will match that of the
  /// given [Polygon]. Use this constructor in workflows that create a modified
  /// version of an existing geometry. Polygons with curves are supported.
  ///
  /// Parameters:
  /// - `polygon` — A polygon used to initialize the new builder.
  factory PolygonBuilder.fromPolygon(Polygon? polygon) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBuilder_createFromPolygon(
          polygon?._handle ?? ffi.nullptr, errorHandler);
    });
    return PolygonBuilder._withHandle(handle);
  }

  /// Creates a new empty polygon builder with the specified [SpatialReference].
  ///
  /// The [SpatialReference] cannot be changed after instantiation.
  ///
  /// Parameters:
  /// - `spatialReference` — The builder's spatial reference.
  factory PolygonBuilder.fromSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBuilder_createFromSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final PolygonBuilder object = PolygonBuilder._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }

  /// Creates a polyline with the values in the polygon builder.
  ///
  /// Return Value: A polyline.
  Polyline toPolyline() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolygonBuilder_toPolyline(_handle, errorHandler);
    });
    return Polyline._fromHandle(objectHandle)!;
  }
}

/// A multipart shape used to represent a linear feature.
///
/// Polyline geometries represent the shape and location of linear features,
/// such as a street in a road network, a contour line representing an elevation
/// value, or a hiking trail. A polyline can be used to define geometry for
/// features and graphics, or as input or output for tasks or geoprocessing
/// operations, such as the output of a network trace.
///
/// A polyline can be used as the geometry of a [Feature] or [Graphic]. To
/// obtain the geometry on these objects, use [GeoElement.geometry].
///
/// A polyline is composed of a series of connected segments, where each
/// [Segment] defines a continuous line between a start and an end point. You
/// can define a new polyline from a collection of [ArcGISPoint] objects to
/// create a series of straight [LineSegment] objects connecting the points you
/// specified. You can use [PolylineBuilder] to build a polyline one point at a
/// time, or to modify an existing polyline.
///
/// A polyline can have multiple parts. Each part is a series of connected
/// segments, but the parts can be disjoint, for example, a polyline
/// representing a street that ends, and starts again a block later. Parts can
/// also intersect at one or more points (or vertices), for example, a polyline
/// representing a river and its tributaries.
///
/// Polylines inherit from [Multipart], which provides members for iterating the
/// segments and points of each part in a polyline.
///
/// Polylines are based upon the parent [Geometry] class which is immutable,
/// meaning you can not change its shape once it is created. If you need to
/// modify a polyline once it has been created, use the [PolylineBuilder] class.
final class Polyline extends Multipart {
  static Polyline? _fromHandle(RT_PolylineHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Polyline._withHandle(handle);
  }

  Polyline._withHandle(super.handle) : super._withHandle();
}

/// The polyline builder allows you to create and modify [Polyline] geometries
/// incrementally.
///
/// Polyline geometries are immutable and cannot be changed directly once
/// created. The polyline builder allows you to change the contents of the shape
/// by using the mutable [MutablePartCollection] that is accessible from
/// [MultipartBuilder.parts]. Each [MutablePart], in the collection, comprises a
/// collection of segments that make the [MutablePart]. You can add or remove a
/// [MutablePart] from the [MutablePartCollection], or you can create a new or
/// edit the segment vertices of an existing [MutablePart]. Use
/// [GeometryBuilder.toGeometry] to return the new [Polyline] from the builder.
final class PolylineBuilder extends MultipartBuilder {
  static PolylineBuilder? _fromHandle(RT_PolylineBuilderHandle handle) {
    if (handle == ffi.nullptr) return null;
    return PolylineBuilder._withHandle(handle);
  }

  PolylineBuilder._withHandle(super.handle) : super._withHandle();

  /// Creates a new polyline builder by copying the parts from the specified
  /// [Polyline].
  ///
  /// The [SpatialReference] of the new polyline builder will match that of the
  /// given [Polyline]. Use this constructor in workflows that create a modified
  /// version of an existing geometry, for example feature or graphic editing
  /// workflows. Polylines with curves are supported.
  ///
  /// Parameters:
  /// - `polyline` — A polyline object.
  factory PolylineBuilder.fromPolyline(Polyline? polyline) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBuilder_createFromPolyline(
          polyline?._handle ?? ffi.nullptr, errorHandler);
    });
    return PolylineBuilder._withHandle(handle);
  }

  /// Creates a new empty polyline builder with the specified
  /// [SpatialReference].
  ///
  /// The [SpatialReference] cannot be changed after instantiation
  ///
  /// Parameters:
  /// - `spatialReference` — The builder's spatial reference.
  factory PolylineBuilder.fromSpatialReference(
      SpatialReference? spatialReference) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PolylineBuilder_createFromSpatialReference(
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
    final PolylineBuilder object = PolylineBuilder._withHandle(handle);
    object._spatialReference.cache(spatialReference);
    return object;
  }
}

/// The returned results of calling [GeometryEngine.nearestCoordinate] and
/// [GeometryEngine.nearestVertex].
final class ProximityResult implements ffi.Finalizable {
  final RT_ProximityResultHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ProximityResult_destroy.cast());

  static ProximityResult? _fromHandle(RT_ProximityResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ProximityResult._withHandle(handle);
  }

  ProximityResult._withHandle(RT_ProximityResultHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ProximityResult_created(_handle);
    }
  }

  /// The point found.
  ArcGISPoint get coordinate {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ProximityResult_getCoordinate(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// The result distance.
  double get distance {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ProximityResult_getDistance(_handle, errorHandler);
    });
  }

  /// The index of the part in which the point was found.
  ///
  /// Returned index value should be checked against [ProximityResult.npos] for
  /// validity.
  int get partIndex {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ProximityResult_getPartIndex(_handle, errorHandler);
    });
  }

  /// The index of the point that was found within its part.
  ///
  /// Returned index value should be checked against [ProximityResult.npos] for
  /// validity.
  int get pointIndex {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ProximityResult_getPointIndex(
          _handle, errorHandler);
    });
  }

  /// Returns a value indicating a bad index.
  ///
  /// Return Value: A size_t.
  static int npos() {
    _initializeArcGISEnvironmentIfNeeded();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ProximityResult_npos(errorHandler);
    });
  }
}

/// A segment represents an edge of a multipart geometry, connecting a start to
/// an end point.
///
/// A segment describes a continuous line between a start location and an end
/// location. ArcGIS software supports both linear segments (represented by
/// [LineSegment]) and curve segments (represented by [CubicBezierSegment] and
/// [EllipticArcSegment]).
///
/// [GeometryEngine.densify] can translate curve segments into multiple
/// [LineSegment] instances to approximate the curve.
///
/// Every [ImmutablePart] in a [Multipart] geometry is a collection of [Segment]
/// instances, where the end of one segment is at exactly the same location as
/// the start of the following segment. [Multipart] geometries can be composed
/// from and decomposed into their constituent segments if required.
///
/// Because a single location is shared by adjacent segments, a single
/// [ArcGISPoint] object is used to represent the shared location when you
/// iterate through the points in a part. As a result, when iterating through
/// the points in a part of a polyline or polygon, there is one more point than
/// the number of segments in that same part.
///
/// Segments are immutable so you cannot change a segment's shape once it is
/// created. For workflows that involve geometry editing, create a new segment
/// with the properties you require.
///
/// From v100.12, curve segments are supported in geometry editing workflows.
/// You can add curve segments to a [MultipartBuilder], and if a geometry has
/// curves ([Geometry.hasCurves] is true) then curve segments are returned where
/// applicable from the [ImmutablePart] collections that comprise the multipart
/// geometry. Curve and linear segments can be mixed together in the same
/// geometry.
final class Segment implements ffi.Finalizable {
  final RT_SegmentHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Segment_destroy.cast());

  static Segment? _fromHandle(RT_SegmentHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Segment._objectTypeOf(handle)) {
      case _SegmentType.cubicBezierSegment:
        return CubicBezierSegment._withHandle(handle);
      case _SegmentType.ellipticArcSegment:
        return EllipticArcSegment._withHandle(handle);
      case _SegmentType.lineSegment:
        return LineSegment._withHandle(handle);
      case _SegmentType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _SegmentType _objectTypeOf(RT_SegmentHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getObjectType(handle, errorHandler);
    });
    return _SegmentType._fromCoreValue(coreValue);
  }

  _SegmentType get _objectType => Segment._objectTypeOf(_handle);

  Segment._withHandle(RT_SegmentHandle handle)
      : _spatialReference = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Segment_getSpatialReference(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Segment_created(_handle);
    }
  }

  /// The end point of the segment.
  ArcGISPoint get endPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getEndPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  /// Indicates is a segment is closed, it has a matching start and end point.
  bool get isClosed {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getIsClosed(_handle, errorHandler);
    });
  }

  /// False if the object is a [LineSegment]; true otherwise.
  ///
  /// Prior to v100.12, only [LineSegment] instances were supported when
  /// creating new geometries using a [MultipartBuilder] or iterating the
  /// [Segment] instances in an existing [Multipart] geometry.
  ///
  /// From v100.12, you can add curve segments ([CubicBezierSegment],
  /// [EllipticArcSegment]) when using a [MultipartBuilder], and get them back
  /// from an existing [Multipart] geometry when [Geometry.hasCurves] is true.
  bool get isCurve {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getIsCurve(_handle, errorHandler);
    });
  }

  /// The spatial reference for the segment.
  ///
  /// If the segment does not have a spatial reference null is returned.
  SpatialReference? get spatialReference => _spatialReference.value;

  final Memoized<SpatialReference?> _spatialReference;

  /// The start point of the segment.
  ArcGISPoint get startPoint {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getStartPoint(_handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle)!;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Segment) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Segment_getHash(_handle, errorHandler);
    });
  }
}

/// The different types of segments.
///
/// Each of the different supported segment types. The segment type can be
/// accessed by calling [Segment._objectType].
enum _SegmentType {
  /// An unknown segment.
  unknown,

  /// Line segment.
  lineSegment,

  /// Cubic bezier curve segment.
  cubicBezierSegment,

  /// Elliptic arc curve segment.
  ellipticArcSegment;

  factory _SegmentType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case -1:
        return unknown;
      case 1:
        return lineSegment;
      case 2:
        return cubicBezierSegment;
      case 3:
        return ellipticArcSegment;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case unknown:
        return -1;
      case lineSegment:
        return 1;
      case cubicBezierSegment:
        return 2;
      case ellipticArcSegment:
        return 3;
    }
  }
}

/// The spatial reference specifies how geometry coordinates relate to
/// real-world space.
///
/// Instances of this class represent a specific coordinate system identified by
/// a well-known ID (WKID) number or well-known text (WKT) string. There are two
/// broad classes of coordinate systems:
///  * Geographic coordinate systems use a 3-dimensional spherical surface to
/// define locations on the earth.
///  * Projected coordinate systems use a flat, 2-dimensional surface. See
/// https://developers.arcgis.com/documentation/spatial-references/ for more
/// information about spatial references.
///
/// [SpatialReference] ensures that you can accurately view, query, and analyze
/// the layers of a [GeoModel].
///
/// The spatial reference value is available from a map or scene after loading
/// has completed, and is immutable. If you want to set this value for a new map
/// or scene, use the [ArcGISMap.new] or `Scene.Scene(SceneViewTilingScheme)`
/// constructors.
final class SpatialReference with JsonSerializable implements ffi.Finalizable {
  final RT_SpatialReferenceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.SpatialReference_destroy.cast());

  static SpatialReference? _fromHandle(RT_SpatialReferenceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SpatialReference._withHandle(handle);
  }

  SpatialReference._withHandle(RT_SpatialReferenceHandle handle)
      : _baseGeographic = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SpatialReference_getBaseGeographic(
                handle, errorHandler);
          });
          return SpatialReference._fromHandle(objectHandle);
        }),
        _unit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SpatialReference_getUnit(
                handle, errorHandler);
          });
          return Unit._fromHandle(objectHandle)!;
        }),
        _verticalUnit = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SpatialReference_getVerticalUnit(
                handle, errorHandler);
          });
          return LinearUnit._fromHandle(objectHandle);
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SpatialReference_created(_handle);
    }
  }

  /// The Web Mercator spatial reference.
  static final SpatialReference webMercator = () {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle =
        runtimecore.RT_SpatialReference_webMercator(ffi.nullptr);
    return SpatialReference._fromHandle(objectHandle)!;
  }();

  /// The WGS84 spatial reference.
  static final SpatialReference wgs84 = () {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = runtimecore.RT_SpatialReference_WGS84(ffi.nullptr);
    return SpatialReference._fromHandle(objectHandle)!;
  }();

  /// Creates a spatial reference based on WKID for the horizontal coordinate
  /// system and vertical coordinate system.
  ///
  /// The method creates a spatial reference that has both horizontal and
  /// vertical coordinate systems. When the vertical WKID is 0, the method is
  /// equivalent to calling `SpatialReference.new`, and does not define a
  /// vertical coordinate system part.
  ///
  /// Parameters:
  /// - `wkid` — The well-known ID of the horizontal coordinate system. Must be
  /// a positive value.
  /// - `verticalWkid` — The well-known ID of the vertical coordinate system.
  /// Must be a non negative value.
  factory SpatialReference({required int wkid, int verticalWkid = 0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_createVerticalWKID(
          wkid, verticalWkid, errorHandler);
    });
    return SpatialReference._withHandle(handle);
  }

  /// Creates a spatial reference based on well-known text.
  ///
  /// Parameters:
  /// - `wkText` — The well-known text of the spatial reference to create.
  factory SpatialReference.fromWkText(String wkText) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreWkText = _CString(wkText);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_createFromWKText(
          coreWkText.bytes, errorHandler);
    });
    return SpatialReference._withHandle(handle);
  }

  /// If the given spatial reference is a projected coordinate system, then this
  /// returns the geographic coordinate system of that system.
  ///
  /// If the spatial reference is a projected coordinate system, then a spatial
  /// reference object representing the underlying geographic coordinate system
  /// is returned. Every projected coordinate system has an underlying
  /// geographic coordinate system. If the spatial reference is a geographic
  /// coordinate system, then a reference to itself is returned. If the spatial
  /// reference is a local spatial reference, a null is returned with an error.
  SpatialReference? get baseGeographic => _baseGeographic.value;

  final Memoized<SpatialReference?> _baseGeographic;

  /// True if spatial reference has a vertical coordinate system set; false
  /// otherwise.
  ///
  /// A spatial reference can optionally include a definition for a vertical
  /// coordinate system (VCS), which can be used to interpret the z-values of a
  /// geometry. A VCS defines linear units of measure, the origin of z-values,
  /// and whether z-values are "positive up" (representing heights above a
  /// surface) or "positive down" (indicating that values are depths below a
  /// surface).
  ///
  /// A [SpatialReference] may have a VCS set, for example by calling the
  /// [SpatialReference.new] constructor. [SpatialReference.verticalWkid],
  /// [SpatialReference.wkText], and [SpatialReference.verticalUnit] provide
  /// more information about the specific VCS set on this instance.
  ///
  /// VCSs are used when projecting geometries using a
  /// [HorizontalVerticalTransformation].
  bool get hasVertical {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getHasVertical(
          _handle, errorHandler);
    });
  }

  /// True if spatial reference is a Geographic Coordinate System.
  bool get isGeographic {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getIsGeographic(
          _handle, errorHandler);
    });
  }

  /// True if coordinate system is horizontally pannable.
  bool get isPannable {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getIsPannable(
          _handle, errorHandler);
    });
  }

  /// True if spatial reference is a Projected Coordinate System.
  bool get isProjected {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getIsProjected(
          _handle, errorHandler);
    });
  }

  /// The unit of measure for the horizontal coordinate system of this spatial
  /// reference.
  Unit get unit => _unit.value;

  final Memoized<Unit> _unit;

  /// The unit of measure for the vertical coordinate system of this spatial
  /// reference.
  ///
  /// Is null if [SpatialReference.hasVertical] is false.
  LinearUnit? get verticalUnit => _verticalUnit.value;

  final Memoized<LinearUnit?> _verticalUnit;

  /// The well-known ID for the vertical coordinate system (VCS), or 0 if the
  /// spatial reference has no VCS or has a custom VCS.
  int get verticalWkid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getVerticalWKID(
          _handle, errorHandler);
    });
  }

  /// The well-known text for the horizontal and vertical coordinate system.
  String get wkText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getWKText(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The well-known ID for the horizontal coordinate system, or 0 if the
  /// spatial reference has a custom horizontal coordinate system.
  int get wkid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getWKID(_handle, errorHandler);
    });
  }

  /// Calculate the grid convergence for a spatial reference at a given point.
  ///
  /// The grid convergence is the angle between True North and Grid North at a
  /// point on a map. The grid convergence can be used to convert a horizontal
  /// direction expressed as an azimuth in a geographic coordinate system
  /// (relative to True North) to a direction expressed as a bearing in a
  /// projected coordinate system (relative to Grid North), and vice versa.
  ///
  /// Sign convention
  ///
  /// The grid convergence returned by this method is positive when Grid North
  /// lies east of True North. The following formula demonstrates how to obtain
  /// a bearing (b) from an azimuth (a) using the grid convergence (c) returned
  /// by this method:
  ///
  /// b = a - c
  ///
  /// This sign convention is sometimes named the Gauss-Bomford convention.
  ///
  /// Other notes:
  /// * Returns 0 if the spatial reference is a geographic coordinate system
  /// * Returns NAN if the point is outside the projection's horizon or on error
  /// * If the point has no spatial reference, it is assumed to be in the given
  /// spatial reference
  /// * If the point's spatial reference differs from the spatial reference
  /// given, its location is transformed automatically to the given spatial
  /// reference
  ///
  /// Parameters:
  /// - `point` — The point.
  ///
  /// Return Value: The grid convergence in degrees.
  double getConvergenceAngle({required ArcGISPoint point}) {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getConvergenceAngle(
          _handle, point._handle, errorHandler);
    });
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory SpatialReference.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_SpatialReference_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return SpatialReference._fromHandle(objectHandle)!;
  }

  factory SpatialReference.fromJson(Map<String, dynamic> json) {
    return SpatialReference.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpatialReference) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_SpatialReference_getHash(_handle, errorHandler);
    });
  }
}

/// Allows discovery and management of the transformations used to convert
/// coordinates between different datums.
///
/// The transformation catalog class provides a mechanism for discovering
/// available [DatumTransformation] objects. You can retrieve the default
/// transformation used internally to convert coordinates, and find other
/// available transformations. An area of interest may be taken into account.
///
/// This class also allows you to set the location where Projection Engine data
/// files needed for some transformations are found on local storage. The
/// [TransformationCatalog.projectionEngineDirectory] property must be set at
/// process startup. Projection Engine data files are available in the
/// [downloads area of developers.arcgis.com](https://developers.arcgis.com/downloads/#pedata)
/// (requires login).
///
/// The default transformation used when reprojecting geometries is the most
/// suitable available transformation across the area covered by the input and
/// output spatial references. You can sometimes get a more suitable
/// transformation for work within a smaller area by specifying the extent of
/// your specific work area, using [TransformationCatalog.getTransformation].
abstract final class TransformationCatalog {
  /// The directory of the Projection Engine files on the local file system.
  ///
  /// This property should only be set upon process startup - a suitable point
  /// could be after license or license keys, but before any use of maps, maps
  /// views, scene views, or any other functionality that may involve geometry
  /// or projection functionality.
  ///
  /// Projection Engine data files are available in the [downloads area of
  /// developers.arcgis.com](https://developers.arcgis.com/downloads/#pedata)
  /// (requires login).
  static Uri? get projectionEngineDirectory {
    _initializeArcGISEnvironmentIfNeeded();
    return TransformationCatalog._projectionEngineDirectory.value;
  }

  static set projectionEngineDirectory(Uri? value) {
    _initializeArcGISEnvironmentIfNeeded();
    TransformationCatalog._projectionEngineDirectory.value = value;
  }

  static final _projectionEngineDirectory = Memoized(getter: () {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TransformationCatalog_getProjectionEngineDirectory(
          errorHandler);
    });
    return stringHandle.toFileUri();
  }, setter: (value) {
    final coreValue = value != null ? _CString(value.toFilePath()) : null;
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TransformationCatalog_setProjectionEngineDirectory(
          coreValue?.bytes ?? ffi.nullptr, errorHandler);
    });
  });

  /// Returns the best usable transformation used to transform between the input
  /// and output spatial references, taking into account the area of interest,
  /// if specified. Optionally disregards any vertical transformations.
  ///
  /// Use this method to determine whether or not any vertical coordinate
  /// systems set on the spatial reference parameters should be accounted for in
  /// the returned transformation. This method can be used to replicate the
  /// former (prior to version 100.9.0) behavior of the
  /// [TransformationCatalog.getTransformation] and
  /// [TransformationCatalog.getTransformation] methods:
  /// * Calling this method with 'ignoreVertical = false' is equivalent to
  /// calling [TransformationCatalog.getTransformation]
  /// * Calling this method with 'ignoreVertical = true' is equivalent to
  /// calling [TransformationCatalog.getTransformation] in releases prior to
  /// 100.9.0
  ///
  /// Parameters:
  /// - `inputSpatialReference` — The spatial reference to use as the input.
  /// - `outputSpatialReference` — The spatial reference to use as the output.
  /// - `areaOfInterest` — The bounding box of coordinates to be transformed, or
  /// null to consider the entire world extent.
  /// - `ignoreVertical` — True if [TransformationCatalog] should ignore any
  /// vertical coordinate system set on the inputSpatialReference or
  /// outputSpatialReference, and only consider horizontal (geographic)
  /// transformations; false otherwise.
  ///
  /// Return Value: A [DatumTransformation] instance that represents the best
  /// choice given the parameters. Always returns a usable transformation where
  /// [DatumTransformation.isMissingProjectionEngineFiles] is false. The
  /// specific type returned depends on the given value of the ignoreVertical
  /// parameter.
  ///
  /// Returns null if no transformation is required for the given input
  /// parameters, or if no usable transformation is available.
  static DatumTransformation? getTransformation(
      {required SpatialReference inputSpatialReference,
      required SpatialReference outputSpatialReference,
      Envelope? areaOfInterest,
      bool ignoreVertical = false}) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_TransformationCatalog_getTransformationWithAreaOfInterestAndIgnoreVertical(
              inputSpatialReference._handle,
              outputSpatialReference._handle,
              areaOfInterest?._handle ?? ffi.nullptr,
              ignoreVertical,
              errorHandler);
    });
    return DatumTransformation._fromHandle(objectHandle);
  }

  /// Returns a collection of transformations suitable for projecting between
  /// the input and output spatial references, taking into account the area of
  /// interest, if specified. Optionally checks for suitable vertical
  /// transformations.
  ///
  /// The collection is ordered in descending order by suitability, with the
  /// most suitable being first in the list. The given area of interest can
  /// affect the number and order of transformations returned.
  ///
  /// A geographic transformation is not needed when input and output spatial
  /// references have the same underlying geographic coordinate system, in which
  /// case an empty list is returned. A vertical transformation is not needed if
  /// both datums (for ellipsoidal heights) or vertical datums (for
  /// gravity-related heights) are the same. If neither type of transformation
  /// is needed, an empty collection is returned.
  ///
  /// Use this method to determine whether or not any vertical coordinate
  /// systems set on the spatial reference parameters should be accounted for in
  /// the returned list of transformations. This method can be used to replicate
  /// the former (prior to version 100.9.0) behavior of the
  /// [TransformationCatalog.getTransformationsBySuitability] and
  /// [TransformationCatalog.getTransformationsBySuitability] methods:
  /// * Calling this method with 'ignoreVertical = false' is equivalent to
  /// calling [TransformationCatalog.getTransformationsBySuitability]
  /// * Calling this method with 'ignoreVertical = true' is equivalent to
  /// calling [TransformationCatalog.getTransformationsBySuitability] in
  /// releases prior to 100.9.0
  ///
  /// Some transformations require a supporting Projection Engine (PE) dataset
  /// to function correctly. If this API cannot locate these datasets, the
  /// transformation is not usable, and
  /// [DatumTransformation.isMissingProjectionEngineFiles] is true. The list may
  /// include transformations like this. To use such transformations, ensure
  /// [TransformationCatalog.projectionEngineDirectory] is set correctly, and
  /// that the required dataset is available within that location. Use
  /// [GeographicTransformationStep.projectionEngineFilenames] and
  /// [HorizontalVerticalTransformationStep.projectionEngineFilenames] to
  /// determine the dataset required for a specific transformation instance.
  ///
  /// Parameters:
  /// - `inputSpatialReference` — The spatial reference to use as the input.
  /// - `outputSpatialReference` — The spatial reference to use as the output.
  /// - `areaOfInterest` — The bounding box of coordinates to be transformed, or
  /// null to consider the entire world extent.
  /// - `ignoreVertical` — True if [TransformationCatalog] should ignore any
  /// vertical coordinate systems set on the inputSpatialReference or
  /// outputSpatialReference, and only consider horizontal (geographic)
  /// transformations; false otherwise.
  ///
  /// Return Value: A collection of [DatumTransformation] objects suitable for
  /// the given parameters, ordered by suitability, or an empty collection if no
  /// transformation is required.
  static List<DatumTransformation> getTransformationsBySuitability(
      {required SpatialReference inputSpatialReference,
      required SpatialReference outputSpatialReference,
      Envelope? areaOfInterest,
      bool ignoreVertical = false}) {
    _initializeArcGISEnvironmentIfNeeded();
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_TransformationCatalog_getTransformationsBySuitabilityWithAreaOfInterestAndIgnoreVertical(
              inputSpatialReference._handle,
              outputSpatialReference._handle,
              areaOfInterest?._handle ?? ffi.nullptr,
              ignoreVertical,
              errorHandler);
    });
    return arrayHandle.toList();
  }
}

/// Defines a unit of measurement.
///
/// [Unit] is a base class for measurement classes such as [LinearUnit],
/// [AngularUnit], and [AreaUnit]. Many function parameters only accept specific
/// types of measurement to reduce the chance of accidental use of inappropriate
/// values, but some generic functions accept all unit types, such as for
/// translation from ID to text description.
///
/// [LinearUnit] - Projected coordinate systems define coordinates using linear
/// measurements, for example using meters or miles. They are also used to
/// return distance measurements, for example by some members of
/// [GeometryEngine].
///
/// [AngularUnit] - Geographic coordinate systems define coordinates using
/// angular measurements, for example using degrees or radians.
///
/// [AreaUnit] - Projected coordinate systems define area units for two
/// dimensional measurements such as the area enclosed by a ring, for example in
/// acres or square kilometers.
///
/// Linear, angular, and area units can be defined by using enumerations of the
/// most common units of measurement. They can also be defined by well-known ID
/// (WKID) or well-known text (WKText). Create the unit instances using the Unit
/// base class or the subtype, passing in the enumeration for a specific unit of
/// measurement.
///
/// Construction of related units are also supported so that if, for instance,
/// the LinearUnit (e.g. METERS) is known, then the corresponding AreaUnit (e.g.
/// SQUARE_METERS) can be created based on the LinearUnit.
///
/// Custom unit implementations are not supported.
///
/// Each instance of the various units types has properties for the unit name
/// (singular, plural, and abbreviated) and provides methods for unit conversion
/// between different units of measurement in the same category of measurement.
///
/// All unit names and abbreviations are returned in the English language.
/// Instances of unit are immutable.
final class Unit implements ffi.Finalizable {
  final RT_UnitHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Unit_destroy.cast());

  static Unit? _fromHandle(RT_UnitHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Unit._objectTypeOf(handle)) {
      case _UnitType.angularUnit:
        return AngularUnit._withHandle(handle);
      case _UnitType.areaUnit:
        return AreaUnit._withHandle(handle);
      case _UnitType.linearUnit:
        return LinearUnit._withHandle(handle);
      case _UnitType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _UnitType _objectTypeOf(RT_UnitHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getObjectType(handle, errorHandler);
    });
    return _UnitType._fromCoreValue(coreValue);
  }

  _UnitType get _objectType => Unit._objectTypeOf(_handle);

  Unit._withHandle(RT_UnitHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Unit_created(_handle);
    }
  }

  /// The abbreviation of the unit.
  ///
  /// The abbreviation for a specific unit.
  String get abbreviation {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getAbbreviation(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The display name of the unit.
  ///
  /// The display name for a specific unit.
  String get displayName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getDisplayName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The name of the unit.
  ///
  /// The name for a specific unit.
  String get name {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The display name of the unit.
  ///
  /// The display name for a specific unit.
  String get pluralDisplayName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getPluralDisplayName(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The well-known ID for the unit, or 0 for a custom unit.
  int get wkid {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_getWKID(_handle, errorHandler);
    });
  }

  /// Creates a unit given its well-known ID.
  ///
  /// Parameters:
  /// - `wkid` — The well-known ID of the unit.
  ///
  /// Return Value: A unit. Depending on the well-known ID given, this may be a
  /// [LinearUnit], [AngularUnit], or [AreaUnit].
  static Unit fromWkid(int wkid) {
    _initializeArcGISEnvironmentIfNeeded();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Unit_fromWKID(wkid, errorHandler);
    });
    return Unit._fromHandle(objectHandle)!;
  }
}

/// The different types of unit.
///
/// Each of different supported unit types. Can get the type by calling
/// [Unit._objectType].
enum _UnitType {
  /// A linear unit of measure.
  linearUnit,

  /// An angular unit of measure.
  angularUnit,

  /// An area unit of measure.
  areaUnit,

  /// An unknown unit type.
  unknown;

  factory _UnitType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return linearUnit;
      case 1:
        return angularUnit;
      case 2:
        return areaUnit;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case linearUnit:
        return 0;
      case angularUnit:
        return 1;
      case areaUnit:
        return 2;
      case unknown:
        return -1;
    }
  }
}

/// Determines how latitude is designated in UTM notation.
///
/// Within a single longitudinal zone within the UTM system, two points share
/// the same grid position: one in the northern hemisphere and one in the south.
/// Two schemes are used to resolve this ambiguity. In the first, the point is
/// designated a latitude band, identified with letters C through X (omitting I
/// and O). In the second, in place of the latitude band, a hemisphere indicator
/// (N or S) is used.
enum UtmConversionMode {
  /// The letter after the UTM zone number represents a latitudinal band (C
  /// through X, omitting I and O).
  latitudeBandIndicators,

  /// The letter after the UTM zone number represents a hemisphere (N or S).
  northSouthIndicators;

  factory UtmConversionMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return latitudeBandIndicators;
      case 1:
        return northSouthIndicators;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case latitudeBandIndicators:
        return 0;
      case northSouthIndicators:
        return 1;
    }
  }
}
