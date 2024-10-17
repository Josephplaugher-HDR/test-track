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

part of '../arcgis_maps.dart';

/// An interface for reading and writing JSON.
///
/// This interface will be used when an Object needs to be read or written to JSON. These methods return a specific object and not
/// the interface [JsonSerializable]. Objects implementing this interface have the ability to persist custom data to
/// the JSON output. This custom data is stored as a [Map] where the keys are strings that represent properties on
/// the Object, and the values are strings that represent the JSON value for that corresponding property.
/// Any custom data that causes malformed JSON when the Object is persisted will not be included in the JSON output.
/// For example, if a key from the custom data matches a property on the Object and both were written out to JSON,
/// it would result in malformed JSON. So in this example, the key in the custom data causing the malformed JSON would not be persisted.
mixin JsonSerializable<T> {
  // factory methods can't be defined in a mixin - define these manually
  // factory T.fromJsonString(String jsonString);
  // factory T.fromJson(Map<String, dynamic> json) => T.fromJsonString(jsonEncode(json));

  /// Returns a JSON representation of this Object as a [String].
  String toJsonString();

  /// Returns a JSON representation of this Object in the data type used by [jsonDecode].
  Map<String, dynamic> toJson() => jsonDecode(toJsonString());
}
