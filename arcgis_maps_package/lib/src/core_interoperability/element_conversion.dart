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

extension on RT_ElementHandle {
  /// Returns an instance of [_Element] created with this handle or `null` if
  /// this handle is null.
  _Element? toElement() {
    if (this != ffi.nullptr) {
      return _Element._withHandle(this);
    } else {
      return null;
    }
  }

  // Correct this Element based on the expected FieldType. Ints in Dart are normally
  // int64 but may need to be int16 or int32 depending on the field type. Likewise,
  // doubles are normally float64 but may need to be float32.
  void correctFieldType(int fieldTypeCoreValue) {
    final fieldType = _fieldTypeForCoreValue(fieldTypeCoreValue);
    switch (fieldType) {
      case FieldType.int16:
        final value = runtimecore.RT_Element_getValueAsInt64(this, ffi.nullptr);
        runtimecore.RT_Element_setValueFromInt16(this, value, ffi.nullptr);
      case FieldType.int32:
        final value = runtimecore.RT_Element_getValueAsInt64(this, ffi.nullptr);
        runtimecore.RT_Element_setValueFromInt32(this, value, ffi.nullptr);
      case FieldType.float32:
        final value =
            runtimecore.RT_Element_getValueAsFloat64(this, ffi.nullptr);
        runtimecore.RT_Element_setValueFromFloat32(this, value, ffi.nullptr);
      default:
    }
  }
}

// Returns a new _Array of CodedValueDescription with each value corrected by
// correctFieldType() above.
_Array<CodedValueDescription> _correctedCodedValueDescriptionArray(
    RT_ArrayHandle values, int fieldTypeCoreValue) {
  assert(_fieldTypeNeedsCorrection(fieldTypeCoreValue));
  assert(runtimecore.RT_Array_getValueType(values, ffi.nullptr) ==
      _ElementType.codedValueDescription.coreValue);

  final arrayBuilder = _Array.createBuilder<CodedValueDescription>(
      valueType: _ElementType.codedValueDescription);

  for (var i = 0; i < runtimecore.RT_Array_getSize(values, ffi.nullptr); i++) {
    final elementHandle = runtimecore.RT_Array_at(values, i, ffi.nullptr);
    final element = _Element._fromHandle(elementHandle)!;

    final codedValueDescription = element.getValueAsCodedValueDescription()!;
    final valueHandle = runtimecore.RT_CodedValueDescription_getValue(
        codedValueDescription._handle, ffi.nullptr);
    valueHandle.correctFieldType(fieldTypeCoreValue);
    runtimecore.RT_CodedValueDescription_setValue(
        codedValueDescription._handle, valueHandle, ffi.nullptr);
    runtimecore.RT_Element_destroy(valueHandle, ffi.nullptr);
    codedValueDescription._value.invalidateCache();

    arrayBuilder.add(value: codedValueDescription);
  }

  return arrayBuilder.moveToArray();
}

FieldType _fieldTypeForCoreValue(int fieldTypeCoreValue) =>
    FieldType.values.firstWhere(
      (value) => value.coreValue == fieldTypeCoreValue,
      orElse: () => FieldType.unknown,
    );

bool _fieldTypeNeedsCorrection(int fieldTypeCoreValue) {
  final fieldType = _fieldTypeForCoreValue(fieldTypeCoreValue);
  return fieldType == FieldType.int16 ||
      fieldType == FieldType.int32 ||
      fieldType == FieldType.float32;
}
