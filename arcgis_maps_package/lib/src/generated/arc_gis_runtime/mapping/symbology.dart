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

part of '../../../../arcgis_maps.dart';

/// The list of possible font weights.
///
/// Enum to represent weight of font supported by ArcGIS Server.
enum ArcGISFontWeight {
  /// The text is made bold.
  bold,

  /// No alteration is made to the text.
  normal;

  factory ArcGISFontWeight._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return bold;
      case 1:
        return normal;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case bold:
        return 0;
      case normal:
        return 1;
    }
  }
}

/// A symbol defines the appearance of features and graphics that are displayed
/// in a [GeoViewController].
///
/// [ArcGISSymbol] is the base class for a number of different symbols, such as
/// [MarkerSymbol], [LineSymbol], [FillSymbol] abd `MultilayerSymbol`, which are
/// sub-classes for more specialized symbols.
///
/// You can specify the symbology of a single graphic using [Graphic.symbol].
/// Alternatively, you can create a [Renderer] that contains a collection of
/// symbols and rules. Each rule determines which symbol is applied to a graphic
/// or feature depending on its attribute values. To symbolize graphics, apply a
/// renderer to the [GraphicsOverlay], and to symbolize features, apply the
/// renderer to [FeatureLayer].
///
/// There are two models for defining symbols in your map: simple and advanced
/// (multilayer). In general, simple symbols are single-layer symbols that
/// provide basic representations, such as marker, line, fill, text, or picture.
/// Advanced symbols are composed of one or several layers that can be defined
/// individually and combined to create complex representations.
///
/// These are described as follows:
/// * Simple symbols follow the web map specification and you work with them
/// through the simple symbol classes. These are also the symbols you get from
/// web maps or from feature services when advanced symbology is turned off.
/// Simple symbols can be created for points ([MarkerSymbol]), lines
/// ([LineSymbol]), and polygons ([FillSymbol]). Each of the simple symbol types
/// provides an enumeration of predefined styles that can be applied to the
/// symbol.
/// * Advanced symbols, accessed through multilayer symbol classes, follow the
/// ArcGIS Pro symbol model. These symbols come from feature services (that use
/// advanced symbology), mobile style files, the dictionary renderer, and mobile
/// map packages. You can also build your own advanced symbols for points,
/// lines, and polygons.
///
/// Simple symbology is the symbology of the web map. When authoring maps in
/// ArcGIS Pro as web maps, your multilayer symbols will be converted to simple
/// symbols. In general, point symbols are converted to picture marker symbols
/// optimized for the web, and line and polygon symbols are simplified while
/// representing the original symbol as closely as possible. If you are
/// authoring a feature service from ArcGIS Pro or ArcGIS Desktop, however, both
/// the original symbols and the simplified symbols are stored. This allows
/// clients that support advanced symbols to render the features as originally
/// symbolized, while those that do not support advanced symbols (such as ArcGIS
/// Online Map Viewer) can use the simple symbols for display. Having both sets
/// of symbols allows you to retain the advanced symbology where available and
/// still share the feature service as widely as possible.
///
/// If your app works primarily with web maps that you want to look the same
/// throughout the platform, your app should use the simple symbols API.
/// Otherwise, make sure your users understand that advanced symbols render
/// slightly differently on clients that don't support advanced symbology.
///
/// If your maps are used only with this API and ArcGIS Pro, you can use
/// advanced symbols exclusively. When rendered by this API, advanced symbols
/// are vectorized. This allows them to scale better on devices with high
/// resolution screens.
///
/// You can set [LoadSettings.useAdvancedSymbology] to control whether the map
/// uses advanced symbols (when available) or always renders with simple
/// symbols.
///
/// A swatch is an image that is used to display this symbol. Properties of a
/// swatch include:
///
/// * Height, length of image from bottom to top side.
/// * Width, length of image from left to right side.
/// * Dots Per Inch (dpi), the resolution of the image.
/// * Color, interior color of the image.
/// * Geometry, shape of the image.
///
/// Depending on the [Geometry] of a [Graphic] or [Feature] different types of
/// symbols will be used.
final class ArcGISSymbol
    with JsonSerializable
    implements _InstanceId, ffi.Finalizable {
  final RT_SymbolHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Symbol_destroyInstance.cast());

  static ArcGISSymbol? _fromHandle(RT_SymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  static _SymbolType _objectTypeOf(RT_SymbolHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_getObjectType(handle, errorHandler);
    });
    return _SymbolType._fromCoreValue(coreValue);
  }

  _SymbolType get _objectType => ArcGISSymbol._objectTypeOf(_handle);

  ArcGISSymbol._withHandle(RT_SymbolHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Symbol_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _ArcGISSymbolFactory(), kind: 'Symbol');

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_getInstanceId(_handle, errorHandler);
    });
  }

  /// Clones the [ArcGISSymbol].
  ///
  /// Return Value: A new [ArcGISSymbol] with the same values as the current
  /// [ArcGISSymbol].
  ArcGISSymbol clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_clone(_handle, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle)!;
  }

  /// Creates a swatch image using the provided width, height, screen scale, and
  /// optional background color.
  ///
  /// This method will scale the symbol up or down in order to fit it in to the
  /// desired width and height of the swatch.
  ///
  /// Parameters:
  /// - `screenScale` — The number of pixels per DIP (sometimes referred to as
  /// screen density or device pixel ratio). This value is used to scale
  /// symbology when rendering the swatch. The value should be set appropriately
  /// in order to render swatches at the correct scale for a given display.
  /// Note: Picture marker symbols without a set width or height are not scaled
  /// by screen scale, as unset width and height are taken to mean "render at
  /// native pixel scale".
  /// - `size` — The size of the swatch in device-independent pixels (DIPs).
  /// - `backgroundColor` — The background color of the swatch. Can be null, in
  /// which case a transparent background is used.
  ///
  /// Return Value: A [Future]. An [ArcGISImage] is returned asynchronously by
  /// the task. A null is returned if an error occurs or if the symbol is a
  /// 3D-specific symbol such as `ModelSceneSymbol` or `MultilayerMeshSymbol`.
  Future<ArcGISImage> createSwatch(
      {required double screenScale,
      Size? size,
      Color backgroundColor = Colors.transparent}) {
    final coreBackgroundColor = backgroundColor.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_createSwatchCombined(_handle, screenScale,
          size, coreBackgroundColor._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsArcGISImage()!);
  }

  /// Cancelable version of [createSwatch]. See that method for more
  /// information.
  CancelableOperation<ArcGISImage> createSwatchCancelable(
      {required double screenScale,
      Size? size,
      Color backgroundColor = Colors.transparent}) {
    final coreBackgroundColor = backgroundColor.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_createSwatchCombined(_handle, screenScale,
          size, coreBackgroundColor._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsArcGISImage()!);
  }

  /// Creates a swatch image using the provided geometry, width, height, screen
  /// scale, and optional background color.
  ///
  /// Parameters:
  /// - `screenScale` — The number of pixels per DIP (sometimes referred to as
  /// screen density or device pixel ratio). This value is used to scale
  /// symbology when rendering the swatch. The value should be set appropriately
  /// in order to render swatches at the correct scale for a given display.
  /// Note: Picture marker symbols without a set width or height are not scaled
  /// by screen scale, as unset width and height are taken to mean "render at
  /// native pixel scale".
  /// - `size` — The size of the swatch in device-independent pixels (DIPs).
  /// - `geometry` — The geometry of the symbol to be drawn in the swatch image.
  /// The specified geometry is in DIPs, with the point {0,0} located at the
  /// center of the swatch image. The X-axis increases towards the right side of
  /// the swatch image. The Y-axis increases towards the top of the swatch
  /// image. For example: when creating a swatch for a [MarkerSymbol],
  /// specifying a geometry of {10,10} will draw the marker
  /// 10 DIPs up and to the right of the center of the swatch. The geometry type
  /// ([ArcGISPoint], [Polyline], [Polygon]) should correspond to the symbol
  /// type ([MarkerSymbol], [LineSymbol], [FillSymbol]). The geometry's spatial
  /// reference is ignored.
  /// - `backgroundColor` — The background color of the swatch. Can be null, in
  /// which case a transparent background is used.
  ///
  /// Return Value: A [Future]. An [ArcGISImage] is returned asynchronously by
  /// the task. A null is returned if an error occurs or if the symbol is a
  /// 3D-specific symbol such as `ModelSceneSymbol` or `MultilayerMeshSymbol`.
  Future<ArcGISImage> createSwatchWithGeometry(
      {required double screenScale,
      required Size size,
      required Geometry geometry,
      Color backgroundColor = Colors.transparent}) {
    final coreBackgroundColor = backgroundColor.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_createSwatchWithGeometryCombined(
          _handle,
          screenScale,
          size,
          geometry._handle,
          coreBackgroundColor._handle,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsArcGISImage()!);
  }

  /// Cancelable version of [createSwatchWithGeometry]. See that method for more
  /// information.
  CancelableOperation<ArcGISImage> createSwatchWithGeometryCancelable(
      {required double screenScale,
      required Size size,
      required Geometry geometry,
      Color backgroundColor = Colors.transparent}) {
    final coreBackgroundColor = backgroundColor.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_createSwatchWithGeometryCombined(
          _handle,
          screenScale,
          size,
          geometry._handle,
          coreBackgroundColor._handle,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsArcGISImage()!);
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ArcGISSymbol.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Symbol_fromJSON(jsonCString.bytes, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle)!;
  }

  factory ArcGISSymbol.fromJson(Map<String, dynamic> json) {
    return ArcGISSymbol.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArcGISSymbol) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_equals(_handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Symbol_getHash(_handle, errorHandler);
    });
  }
}

final class _ArcGISSymbolFactory
    implements _InstanceFactory<ArcGISSymbol, RT_SymbolHandle> {
  @override
  ArcGISSymbol createInstance({required RT_SymbolHandle handle}) {
    switch (ArcGISSymbol._objectTypeOf(handle)) {
      case _SymbolType.compositeSymbol:
        return CompositeSymbol._withHandle(handle);
      case _SymbolType.pictureFillSymbol:
        return PictureFillSymbol._withHandle(handle);
      case _SymbolType.pictureMarkerSymbol:
        return PictureMarkerSymbol._withHandle(handle);
      case _SymbolType.simpleFillSymbol:
        return SimpleFillSymbol._withHandle(handle);
      case _SymbolType.simpleLineSymbol:
        return SimpleLineSymbol._withHandle(handle);
      case _SymbolType.simpleMarkerSymbol:
        return SimpleMarkerSymbol._withHandle(handle);
      case _SymbolType.textSymbol:
        return TextSymbol._withHandle(handle);
      case _SymbolType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as ArcGISSymbol');
        return ArcGISSymbol._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_SymbolHandle handle) {
    bindings.Symbol_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_SymbolHandle handle) {
    return runtimecore.RT_Symbol_getInstanceId(handle, ffi.nullptr);
  }
}

/// A class break object used to categorize a group of values that fall within a
/// range of values.
///
/// The [ClassBreak] is used to categorize a group of values that fall within a
/// range defined by [ClassBreak.minValue] and [ClassBreak.maxValue] properties.
/// A value is determined to be within this range if it is greater than the
/// [ClassBreak.minValue] but less than or equal to the [ClassBreak.maxValue].
/// When written as an algebraic equation, it would look like
/// ([ClassBreak.minValue] < value <= [ClassBreak.maxValue]).
///
///  For example, assume you wanted to create a set of [ClassBreak] categories
/// based on the following integers (0, 0, 1, 1, 2, 4, 6, 6, 7, 10).
///
///  The following table would be helpful in defining the [ClassBreak] range
/// settings <table> <tr> <th>categorized group of values</th> <th>count</th>
/// <th>label</th> <th>minValue</th> <th>maxValue</th> </tr> <tr> <th>0</th>
/// <th>2</th> <th>none</th> <th>-1</th> <th>0</th> </tr> <tr> <th>1-2</th>
/// <th>3</th> <th>one to two</th> <th>0</th> <th>2</th> </tr> <tr> <th>3-5</th>
/// <th>1</th> <th>three to five</th> <th>2</th> <th>5</th> </tr> <tr>
/// <th>6-10</th> <th>4</th> <th>six to ten</th> <th>5</th> <th>10</th> </tr>
/// </table>
final class ClassBreak
    with JsonSerializable
    implements _InstanceId, ffi.Finalizable {
  final RT_ClassBreakHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.ClassBreak_destroyInstance.cast());

  static ClassBreak? _fromHandle(RT_ClassBreakHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ClassBreak._instanceCache.instanceWith(handle);
  }

  ClassBreak._withHandle(RT_ClassBreakHandle handle)
      : _alternateSymbols = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClassBreak_getAlternateSymbols(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _symbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClassBreak_getSymbol(handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClassBreak_setSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ClassBreak_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _ClassBreakFactory(), kind: 'ClassBreak');

  /// Creates a new class break object with alternate symbols.
  ///
  /// A class break can have alternate symbols to the primary symbol. Alternate
  /// symbols allow you to tailor the visualization of class break at different
  /// scales by selecting different symbol for different scales. Alternate
  /// symbols are supported only when class break's primary symbol and other
  /// symbols in alternate symbol list are of type `MultilayerSymbol` and have
  /// `SymbolReferenceProperties` defining valid min max scales at which the
  /// symbol becomes visible. Renderer will pick only one symbol at a given map
  /// scale. If primary symbol's scale range falls within the map's scale,
  /// primary symbol is used. If not, then symbols in alternate symbols list are
  /// iterated through and first symbol matching the current map scale is picked
  /// for rendering. A symbol becomes visible if the map scale is less than or
  /// equal to symbol's minimum scale and greater than symbol's maximum scale.
  /// For more information about Scale-based symbol classes and alternate
  /// symbols, see
  /// [Use scale-based symbol classes](https://pro.arcgis.com/en/pro-app/latest/help/mapping/layer-properties/scale-based-symbol-classes.htm).
  ///
  /// Parameters:
  /// - `description` — A description of the class break. "Cities with a
  /// population under 100,000", for example.
  /// - `label` — A label for the class break. "0 - 100000", for example.
  /// - `minValue` — The minimum value of the range that defines the break.
  /// - `maxValue` — The maximum value of the range that defines the break.
  /// - `symbol` — A symbol used to represent elements in the class break.
  /// - `alternateSymbols` — The alternate symbols for the class break. Only
  /// `MultilayerSymbol` are supported as alternates.
  factory ClassBreak(
      {String description = '',
      String label = '',
      double minValue = double.nan,
      double maxValue = double.nan,
      ArcGISSymbol? symbol,
      List<ArcGISSymbol> alternateSymbols = const []}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDescription = _CString(description);
    final coreLabel = _CString(label);
    final coreAlternateSymbols =
        alternateSymbols.toArray(valueType: _ElementType.symbol);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_createWithAlternateSymbols(
          coreDescription.bytes,
          coreLabel.bytes,
          minValue,
          maxValue,
          symbol?._handle ?? ffi.nullptr,
          coreAlternateSymbols._handle,
          errorHandler);
    });
    final ClassBreak object = ClassBreak._instanceCache.instanceWith(handle);
    object._symbol.cache(symbol);
    object._alternateSymbols.value.setCache(alternateSymbols);
    return object;
  }

  /// The alternate symbols for the class break's primary symbol. Symbols in
  /// this list should be of type `MultilayerSymbol` and must have
  /// `SymbolReferenceProperties` set with valid minimum and maximum scale at
  /// which symbol becomes visible. Renderer will pick only one symbol at a
  /// given map scale. If primary symbol's scale range falls within the map's
  /// scale, primary symbol is used. If not, then symbols in alternate symbols
  /// list are iterated through and first symbol matching the current map scale
  /// is picked for rendering. A symbol becomes visible if the map scale is less
  /// than or equal to symbol's minimum scale and greater than symbol's maximum
  /// scale.
  List<ArcGISSymbol> get alternateSymbols => _alternateSymbols.value;

  final Memoized<_MutableArrayList<ArcGISSymbol>> _alternateSymbols;

  /// A description of the class break. "Cities with a population under
  /// 100,000", for example.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreak_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getInstanceId(_handle, errorHandler);
    });
  }

  /// A label for the class break. "0 - 100000", for example.
  String get label {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getLabel(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set label(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreak_setLabel(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The maximum value of the range that defines the break.
  double get maxValue {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getMaxValue(_handle, errorHandler);
    });
  }

  set maxValue(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreak_setMaxValue(_handle, value, errorHandler);
    });
  }

  /// The minimum value of the range that defines the break.
  double get minValue {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getMinValue(_handle, errorHandler);
    });
  }

  set minValue(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreak_setMinValue(_handle, value, errorHandler);
    });
  }

  /// A symbol used to represent elements in the class break.
  ArcGISSymbol? get symbol => _symbol.value;

  set symbol(ArcGISSymbol? value) => _symbol.value = value;

  final Memoized<ArcGISSymbol?> _symbol;

  /// Clones the [ClassBreak].
  ///
  /// Return Value: A new [ClassBreak] with the same values as the current
  /// [ClassBreak].
  ClassBreak clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_clone(_handle, errorHandler);
    });
    return ClassBreak._fromHandle(objectHandle)!;
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory ClassBreak.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_ClassBreak_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return ClassBreak._fromHandle(objectHandle)!;
  }

  factory ClassBreak.fromJson(Map<String, dynamic> json) {
    return ClassBreak.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ClassBreak) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreak_getHash(_handle, errorHandler);
    });
  }
}

final class _ClassBreakFactory
    implements _InstanceFactory<ClassBreak, RT_ClassBreakHandle> {
  @override
  ClassBreak createInstance({required RT_ClassBreakHandle handle}) {
    return ClassBreak._withHandle(handle);
  }

  @override
  void destroyHandle(RT_ClassBreakHandle handle) {
    bindings.ClassBreak_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_ClassBreakHandle handle) {
    return runtimecore.RT_ClassBreak_getInstanceId(handle, ffi.nullptr);
  }
}

/// A class breaks renderer is a renderer that classifies numeric data into two
/// or more ranges of values to create a visualization.
///
/// A class breaks renderer contains a collection of ranges (or class breaks).
/// Each [ClassBreak] has a [ClassBreak.minValue], [ClassBreak.maxValue], and a
/// unique [ClassBreak.symbol]. The ranges reflect a specific
/// [RendererClassificationMethod], such as equal interval, natural breaks,
/// quantile, standard deviation and manual classification.
///
/// [ClassBreaksRenderer] contains properties for setting the field that the
/// class breaks refer to and also for controlling normalization. It also
/// defines a default label and symbol to display for values that don't fall
/// within any of the class breaks. You can add or remove a [ClassBreak] from
/// this renderer via the [ClassBreaksRenderer.classBreaks] collection.
///
/// Class breaks can be defined as continuous, where the minimum value of a
/// break is defined by the maximum value of the previous class break. For
/// continuous class breaks only the max value needs to be set on each
/// [ClassBreak].
///
/// For discontinuous class breaks, set both a min and a max value in each
/// [ClassBreak].
final class ClassBreaksRenderer extends Renderer {
  static ClassBreaksRenderer? _fromHandle(RT_ClassBreaksRendererHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Renderer._instanceCache.instanceWith(handle);
  }

  ClassBreaksRenderer._withHandle(super.handle)
      : _backgroundFillSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClassBreaksRenderer_getBackgroundFillSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClassBreaksRenderer_setBackgroundFillSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _classBreaks = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClassBreaksRenderer_getClassBreaks(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _defaultSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_ClassBreaksRenderer_getDefaultSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_ClassBreaksRenderer_setDefaultSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a new class breaks renderer with the given class breaks applied to
  /// the given field.
  ///
  /// Parameters:
  /// - `fieldName` — The field name that the class breaks apply to.
  /// - `classBreaks` — The collection of class breaks to apply to the given
  /// field.
  factory ClassBreaksRenderer(
      {String fieldName = '', List<ClassBreak> classBreaks = const []}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFieldName = _CString(fieldName);
    final coreClassBreaks =
        classBreaks.toMutableArray(valueType: _ElementType.classBreak);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_createWith(
          coreFieldName.bytes, coreClassBreaks._handle, errorHandler);
    });
    final ClassBreaksRenderer object =
        Renderer._instanceCache.instanceWith(handle);
    object._classBreaks.value.setCache(classBreaks);
    return object;
  }

  /// The renderer's background fill symbol.
  ArcGISSymbol? get backgroundFillSymbol => _backgroundFillSymbol.value;

  set backgroundFillSymbol(ArcGISSymbol? value) =>
      _backgroundFillSymbol.value = value;

  final Memoized<ArcGISSymbol?> _backgroundFillSymbol;

  /// The collection of class breaks which define each range in this renderer.
  List<ClassBreak> get classBreaks => _classBreaks.value;

  final Memoized<_MutableArrayList<ClassBreak>> _classBreaks;

  /// The renderer's classification method.
  ///
  /// [RendererClassificationMethod.manual] if an error occurs.
  RendererClassificationMethod get classificationMethod {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getClassificationMethod(
          _handle, errorHandler);
    });
    return RendererClassificationMethod._fromCoreValue(coreValue);
  }

  /// The label used for the default symbol.
  String get defaultLabel {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getDefaultLabel(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set defaultLabel(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setDefaultLabel(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The default symbol for values that don't fall within any of the class
  /// breaks.
  ArcGISSymbol? get defaultSymbol => _defaultSymbol.value;

  set defaultSymbol(ArcGISSymbol? value) => _defaultSymbol.value = value;

  final Memoized<ArcGISSymbol?> _defaultSymbol;

  /// The name of the field that the class breaks apply to.
  String get fieldName {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getFieldName(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set fieldName(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setFieldName(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The minimum value of the first class break if the renderer uses continuous
  /// class breaks.
  ///
  /// This will set the minimum value of the first class break in a renderer
  /// containing continuous class breaks where each [ClassBreak] does not define
  /// a minimum value. In this case the minimum value of each break will be the
  /// maximum value of the preceding one. As the first class break has no class
  /// break before it, this value will define its minimum.
  double get minValue {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getMinValue(
          _handle, errorHandler);
    });
  }

  set minValue(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setMinValue(
          _handle, value, errorHandler);
    });
  }

  /// The renderer's normalization field.
  ///
  /// This field will be used to normalize the data when the
  /// [ClassBreaksRenderer.normalizationType] is set to
  /// [RendererNormalizationType.byField]
  String get normalizationField {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getNormalizationField(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set normalizationField(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setNormalizationField(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The renderer's normalization total.
  ///
  /// This field is the normalization total when
  /// [ClassBreaksRenderer.normalizationType] is set to
  /// [RendererNormalizationType.byPercentOfTotal]. This means that the minimum
  /// and maximum values in each class break are defined as percentages of this
  /// total.
  double get normalizationTotal {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getNormalizationTotal(
          _handle, errorHandler);
    });
  }

  set normalizationTotal(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setNormalizationTotal(
          _handle, value, errorHandler);
    });
  }

  /// The renderer's normalization type.
  ///
  /// If this property is not [RendererNormalizationType.none], then the class
  /// breaks contain a normalized min/max value instead of the actual value. In
  /// this case, the type will indicate the way in which the value in the field
  /// should be normalized before comparing with the class breaks.
  ///
  /// The default value is [RendererNormalizationType.none].
  ///
  /// [RendererNormalizationType.none] if an error occurs.
  RendererNormalizationType get normalizationType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ClassBreaksRenderer_getNormalizationType(
          _handle, errorHandler);
    });
    return RendererNormalizationType._fromCoreValue(coreValue);
  }

  set normalizationType(RendererNormalizationType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ClassBreaksRenderer_setNormalizationType(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// Defines a set of symbols that make up a single symbol.
///
/// A composite symbol contains a collection of symbols that can be used to
/// compose a more complex symbol.
final class CompositeSymbol extends ArcGISSymbol {
  static CompositeSymbol? _fromHandle(RT_CompositeSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  CompositeSymbol._withHandle(super.handle)
      : _symbols = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_CompositeSymbol_getSymbols(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a composite symbol using a collection of symbols.
  ///
  /// Parameters:
  /// - `symbols` — Collection of symbols.
  factory CompositeSymbol({List<ArcGISSymbol> symbols = const []}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreSymbols = symbols.toMutableArray(valueType: _ElementType.symbol);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_CompositeSymbol_createWithSymbols(
          coreSymbols._handle, errorHandler);
    });
    final CompositeSymbol object =
        ArcGISSymbol._instanceCache.instanceWith(handle);
    object._symbols.value.setCache(symbols);
    return object;
  }

  /// The collection of symbols contained in the composite symbol.
  List<ArcGISSymbol> get symbols => _symbols.value;

  final Memoized<_MutableArrayList<ArcGISSymbol>> _symbols;
}

/// A fill symbol defines the appearance of features and graphics that are based
/// on polygon geometries such as countries, provinces, or habitats.
///
/// [FillSymbol] is the base class for different symbols, such as
/// [SimpleFillSymbol] and [PictureFillSymbol]. A [FillSymbol] can also be used
/// in combination with a [LineSymbol] to add an outline to the fill symbol.
///
/// You can specify the symbology of a single graphic using [Graphic.symbol].
/// Alternatively, you can create a [Renderer] that contains a collection of
/// symbols and rules. Each rule determines which symbol is applied to a graphic
/// or feature depending on its attribute values. To symbolize graphics, apply a
/// renderer to the [GraphicsOverlay], and to symbolize features, apply the
/// renderer to [FeatureLayer].
final class FillSymbol extends ArcGISSymbol {
  static FillSymbol? _fromHandle(RT_FillSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  FillSymbol._withHandle(super.handle)
      : _color = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FillSymbol_getColor(handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FillSymbol_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _outline = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_FillSymbol_getOutline(handle, errorHandler);
          });
          return LineSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_FillSymbol_setOutline(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// The interior color of the fill symbol.
  Color get color => _color.value;

  set color(Color value) => _color.value = value;

  final Memoized<Color> _color;

  /// A line, with a specific color and width, to be applied to the fill symbol.
  LineSymbol? get outline => _outline.value;

  set outline(LineSymbol? value) => _outline.value = value;

  final Memoized<LineSymbol?> _outline;
}

/// The list of possible font decorations.
///
/// Enum to represent decoration of font supported by ArcGIS Server.
enum FontDecoration {
  /// A line is drawn through the text.
  lineThrough,

  /// No decoration is made to the text.
  none,

  /// The text is underlined.
  underline;

  factory FontDecoration._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return lineThrough;
      case 1:
        return none;
      case 2:
        return underline;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case lineThrough:
        return 0;
      case none:
        return 1;
      case underline:
        return 2;
    }
  }
}

/// The list of possible font styles.
///
/// Enum to represent style of font supported by ArcGIS Server.
enum FontStyle {
  /// The text is italicized.
  italic,

  /// No alteration is made to the text.
  normal,

  /// The text is obliqued.
  oblique;

  factory FontStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return italic;
      case 1:
        return normal;
      case 2:
        return oblique;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case italic:
        return 0;
      case normal:
        return 1;
      case oblique:
        return 2;
    }
  }
}

/// The list of possible horizontal alignments.
///
/// Specifies how a text symbol should be horizontally aligned.
enum HorizontalAlignment {
  /// The text is center aligned.
  center,

  /// The text is justified.
  justify,

  /// The text is left aligned.
  left,

  /// The text is right aligned.
  right;

  factory HorizontalAlignment._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return center;
      case 1:
        return justify;
      case 2:
        return left;
      case 3:
        return right;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case center:
        return 0;
      case justify:
        return 1;
      case left:
        return 2;
      case right:
        return 3;
    }
  }
}

/// A base class for line symbols used to symbolize graphics and features
/// (collectively referred to as geoelements) that have polyline geometry.
///
/// Symbols describe how graphics and features look on a map. Different symbols
/// are used with different geometry types. Line symbols are used to display
/// graphics and features that are based on polyline geometries such as
/// boundaries, transportation routes and utility pipelines. Line symbols can
/// also be used as an outline for fill symbols ([FillSymbol.outline]) and
/// marker symbols ([SimpleMarkerSymbol.outline]).
final class LineSymbol extends ArcGISSymbol {
  static LineSymbol? _fromHandle(RT_LineSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  LineSymbol._withHandle(super.handle)
      : _color = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LineSymbol_getColor(handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LineSymbol_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        super._withHandle();

  /// True if the line symbol is drawn with anti-aliasing, false otherwise.
  bool get antiAlias {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSymbol_getAntiAlias(_handle, errorHandler);
    });
  }

  set antiAlias(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LineSymbol_setAntiAlias(_handle, value, errorHandler);
    });
  }

  /// The color of the line symbol.
  ///
  /// When getting the color (or tint color) from a symbol, the consensus value
  /// (for all layers) is reported. If there is no consensus (one or more layers
  /// have different colors), a null value is reported for the color. Likewise,
  /// setting a value for color on a symbol will apply that color to all layers
  /// the symbol contains.
  ///
  /// If you don't want changes to the symbol color to propagate to some of the
  /// symbol layers it contains, you can lock the color (or tint color) for
  /// those layers. If a symbol layer is color-locked, changes to the parent
  /// symbol will not affect the symbol layer. This also means that the layer
  /// will not be considered when determining a consensus color for the symbol
  /// as a whole.
  ///
  /// The default value is light gray.
  Color get color => _color.value;

  set color(Color value) => _color.value = value;

  final Memoized<Color> _color;

  /// The thickness of the line symbol outline in device-independent pixels
  /// (DIPs).
  ///
  /// The default value is 1.0.
  double get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LineSymbol_getWidth(_handle, errorHandler);
    });
  }

  set width(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LineSymbol_setWidth(_handle, value, errorHandler);
    });
  }
}

/// A base class for marker symbols used to display graphics and features
/// (collectively referred to as geoelements) that have points or multipoint
/// geometry.
///
/// Symbols describe how graphics and features look on a map. Different symbols
/// are used with different geometry types. Marker symbols are used to display
/// graphics and features that are based on point or multipoint geometries such
/// as cities, a route destination, or fire hydrants. Subclasses of this class
/// represent specific types of marker symbols such as [SimpleMarkerSymbol],
/// [PictureMarkerSymbol], or [TextSymbol].
///
/// You can specify the following two types of offsets:
///
/// * Offset the visible symbol from the symbol's point geometry.
/// * Offset a callout's leader line from the symbol's point geometry.
///
/// For each offset, you can specify an x-offset and a y-offset in device
/// independent pixels (DIPs) using a Cartesian coordinate system. For example,
/// if you specify a callout x-offset of -5.0, the callout's leader line will
/// offset to the left along the x-axis by five points.
///
/// By default, the center of a [PictureMarkerSymbol.image] is placed at the
/// [ArcGISPoint] location. If the image is a pushpin, for example, you may want
/// the needle of the pushpin to end at the [ArcGISPoint] location. In this
/// situation, you need to offset the symbol to make the needle's end coincide
/// with that [ArcGISPoint] location.
///
/// You can control the rotation of the marker symbol using the
/// [MarkerSymbol.angle]. However, you must also consider whether this rotation
/// is relative to the map or screen ([MarkerSymbol.angleAlignment]).
final class MarkerSymbol extends ArcGISSymbol {
  static MarkerSymbol? _fromHandle(RT_MarkerSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  MarkerSymbol._withHandle(super.handle) : super._withHandle();

  /// The angle (in degrees) that the marker symbol is rotated by.
  ///
  /// The marker symbol can be rotated relative to the map or the screen,
  /// depending on the [MarkerSymbol.angleAlignment].
  double get angle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getAngle(_handle, errorHandler);
    });
  }

  set angle(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setAngle(_handle, value, errorHandler);
    });
  }

  /// Indicates whether the marker symbol is rotated relative to the screen or
  /// map.
  ///
  /// If the value is [SymbolAngleAlignment.arcGISMap], the marker symbol is
  /// rotated relative to the map and will be affected by the map's rotation. If
  /// the value is [SymbolAngleAlignment.screen], the marker symbol is rotated
  /// relative to the user's screen and is unaffected by the map's rotation.
  ///
  /// When the [GraphicsOverlay.renderingMode] is
  /// [GraphicsRenderingMode.static], each [MarkerSymbol] is aligned with the
  /// [ArcGISMapViewController]. If the [ArcGISMapViewController] rotates, every
  /// marker symbol on the [ArcGISMap] will stay in the same orientation as the
  /// [ArcGISMapViewController]. Even if you set [MarkerSymbol.angle] and
  /// [MarkerSymbol.angleAlignment], they are not respected when the
  /// [GraphicsRenderingMode] is set to static.
  ///
  /// When the [GraphicsOverlay.renderingMode] is set to
  /// [GraphicsRenderingMode.dynamic], each [MarkerSymbol] rotates independently
  /// of an [ArcGISMapViewController] rotation. If you set [MarkerSymbol.angle]
  /// and [MarkerSymbol.angleAlignment], they are respected.
  ///
  /// The default value is [SymbolAngleAlignment.screen].
  SymbolAngleAlignment get angleAlignment {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getAngleAlignment(
          _handle, errorHandler);
    });
    return SymbolAngleAlignment._fromCoreValue(coreValue);
  }

  set angleAlignment(SymbolAngleAlignment value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setAngleAlignment(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The callout leader's X offset relative to the marker symbol.
  double get leaderOffsetX {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getLeaderOffsetX(
          _handle, errorHandler);
    });
  }

  set leaderOffsetX(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setLeaderOffsetX(
          _handle, value, errorHandler);
    });
  }

  /// The callout leader's Y offset relative to the marker symbol.
  double get leaderOffsetY {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getLeaderOffsetY(
          _handle, errorHandler);
    });
  }

  set leaderOffsetY(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setLeaderOffsetY(
          _handle, value, errorHandler);
    });
  }

  /// The offset X of the marker symbol relative to the graphic or feature's
  /// point geometry.
  double get offsetX {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getOffsetX(_handle, errorHandler);
    });
  }

  set offsetX(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setOffsetX(_handle, value, errorHandler);
    });
  }

  /// The offset Y of the marker symbol relative to the graphic or feature's
  /// point geometry.
  double get offsetY {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MarkerSymbol_getOffsetY(_handle, errorHandler);
    });
  }

  set offsetY(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MarkerSymbol_setOffsetY(_handle, value, errorHandler);
    });
  }
}

/// Uses an image to fill the shape of graphic and feature polygons with a
/// repeating pattern.
///
/// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
/// not supported.
final class PictureFillSymbol extends FillSymbol
    with Loadable
    implements _CallbackReceiver {
  static PictureFillSymbol? _fromHandle(RT_PictureFillSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  PictureFillSymbol._withHandle(super.handle)
      : _image = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PictureFillSymbol_getImage(
                handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PictureFillSymbol_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureFillSymbol_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureFillSymbol_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureFillSymbol_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureFillSymbol_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a picture fill symbol object.
  factory PictureFillSymbol() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_create(errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// Creates a picture fill symbol object with the given image.
  ///
  /// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
  /// not supported.
  ///
  /// Parameters:
  /// - `image` — The image.
  factory PictureFillSymbol.withImage(ArcGISImage image) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_createWithImage(
          image._handle, errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// Creates a picture fill symbol object from an image URL.
  ///
  /// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
  /// not supported.
  ///
  /// Parameters:
  /// - `uri` — URL of the image.
  factory PictureFillSymbol.withUri(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// The rotation angle of the picture fill symbol in degrees.
  ///
  /// The angle will rotate the symbol about its center relative to north. A
  /// positive value rotates the symbol clockwise, a negative value rotates the
  /// symbol anti-clockwise. The default value is 0.0.
  double get angle {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getAngle(_handle, errorHandler);
    });
  }

  set angle(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setAngle(_handle, value, errorHandler);
    });
  }

  /// The height of the picture fill symbol in device-independent pixels (DIPs).
  ///
  /// The height of the symbol spanning from the bottom to the top of the image.
  /// The default value is 0.0. You can use this property to override the height
  /// of the symbol. Note that if you set the [PictureFillSymbol.height] or
  /// [PictureFillSymbol.width] to 0.0, then the picture fill symbol will adopt
  /// the height and width of the loaded [PictureFillSymbol.image].
  double get height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getHeight(_handle, errorHandler);
    });
  }

  set height(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setHeight(_handle, value, errorHandler);
    });
  }

  /// The image used for the picture fill symbol to fill the polygon geometries.
  ArcGISImage? get image => _image.value;

  final Memoized<ArcGISImage?> _image;

  /// The horizontal offset of the picture fill symbol.
  double get offsetX {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getOffsetX(_handle, errorHandler);
    });
  }

  set offsetX(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setOffsetX(_handle, value, errorHandler);
    });
  }

  /// The vertical offset of the picture fill symbol.
  double get offsetY {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getOffsetY(_handle, errorHandler);
    });
  }

  set offsetY(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setOffsetY(_handle, value, errorHandler);
    });
  }

  /// The opacity for the picture fill symbol.
  ///
  /// The value ranges from 0.0 (fully transparent) to 1.0 (opaque). The default
  /// value is 1.0.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getOpacity(_handle, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setOpacity(_handle, value, errorHandler);
    });
  }

  /// The horizontal scaling of the picture fill symbol.
  ///
  /// The default value is 1.0.
  double get scaleX {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getScaleX(_handle, errorHandler);
    });
  }

  set scaleX(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setScaleX(_handle, value, errorHandler);
    });
  }

  /// The vertical scaling of the picture fill symbol.
  ///
  /// The default value is 1.0.
  double get scaleY {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getScaleY(_handle, errorHandler);
    });
  }

  set scaleY(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setScaleY(_handle, value, errorHandler);
    });
  }

  /// The URL of the picture fill symbol.
  ///
  /// The URL is the address location of where the image is being stored. This
  /// address can come from an online source or from a locally stored location.
  /// In order to use a [PictureFillSymbol] from a URL, the symbol must be
  /// loaded asynchronously. Any properties that are changed while this symbol
  /// is loading will persist once the image has loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The width of the picture fill symbol in device-independent pixels (DIPs).
  ///
  /// The width of the symbol spanning from the left to the right side of the
  /// image. The default value is 0.0. You can use this property to override the
  /// width of the symbol. Note that if you set the [PictureFillSymbol.height]
  /// or [PictureFillSymbol.width] to 0.0, then the picture fill symbol will
  /// adopt the height and width of the loaded [PictureFillSymbol.image].
  double get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getWidth(_handle, errorHandler);
    });
  }

  set width(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_setWidth(_handle, value, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureFillSymbol_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureFillSymbol_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _image.invalidateCache();
    _uri.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLoadableDoneLoadingEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _doneLoadingStreamController.add(event);
      case AsyncType.asyncTypeLoadableLoadStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LoadStatus._fromCoreValue(coreValue);
        }();
        _loadStatusChangedStreamController.add(event);
      default:
        logger.f('PictureFillSymbol unhandled asyncType $asyncType');
    }
  }
}

/// Uses an image to symbolize graphics and features that have point or
/// multipoint geometry.
///
/// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
/// not supported.
final class PictureMarkerSymbol extends MarkerSymbol
    with Loadable
    implements _CallbackReceiver {
  static PictureMarkerSymbol? _fromHandle(RT_PictureMarkerSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  PictureMarkerSymbol._withHandle(super.handle)
      : _image = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PictureMarkerSymbol_getImage(
                handle, errorHandler);
          });
          return ArcGISImage._fromHandle(objectHandle);
        }),
        _uri = Memoized(getter: () {
          final stringHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_PictureMarkerSymbol_getURL(
                handle, errorHandler);
          });
          return stringHandle.toUri();
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _doneLoadingStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureMarkerSymbol_setDoneLoadingCallback(
              _handle,
              bindings.addresses.asyncLoadableDoneLoadingEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureMarkerSymbol_setDoneLoadingCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _loadStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureMarkerSymbol_setLoadStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLoadableLoadStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_PictureMarkerSymbol_setLoadStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  /// Creates a picture marker symbol.
  factory PictureMarkerSymbol() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_create(errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// Creates a picture marker symbol with the given image.
  ///
  /// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
  /// not supported.
  ///
  /// Parameters:
  /// - `image` — The image.
  factory PictureMarkerSymbol.withImage(ArcGISImage image) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_createWithImage(
          image._handle, errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// Creates a picture marker symbol from an image URL.
  ///
  /// Supported image formats are BMP, GIF, ICO, JPEG, and PNG. Animated GIF is
  /// not supported.
  ///
  /// Parameters:
  /// - `uri` — URL of the image.
  factory PictureMarkerSymbol.withUrl(Uri uri) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreURI = _CString(uri.toString());
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_createWithURL(
          coreURI.bytes, errorHandler);
    });
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  /// The height of the picture marker symbol in device-independent pixels
  /// (DIPs).
  ///
  /// The height of the symbol spanning from the bottom to the top of the image.
  /// The default value is 0.0. You can use this property to override the height
  /// of the symbol. Note that if you set the [PictureMarkerSymbol.height] or
  /// [PictureMarkerSymbol.width] to 0.0, then the picture fill symbol will
  /// adopt the height and width of the loaded [PictureMarkerSymbol.image].
  double get height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_getHeight(
          _handle, errorHandler);
    });
  }

  set height(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_setHeight(
          _handle, value, errorHandler);
    });
  }

  /// The image used to visualize this picture marker symbol.
  ArcGISImage? get image => _image.value;

  final Memoized<ArcGISImage?> _image;

  /// The opacity for the picture marker symbol.
  ///
  /// The value ranges from 0.0 (fully transparent) to 1.0 (opaque). The default
  /// value is 1.0.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_getOpacity(
          _handle, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_setOpacity(
          _handle, value, errorHandler);
    });
  }

  /// The URL of the picture marker symbol.
  ///
  /// The URL is the address location of where the image is being stored. This
  /// address can come from an online source or from a locally stored location.
  /// In order to use a [PictureMarkerSymbol] from a URL, the symbol must be
  /// loaded asynchronously. Any properties that are changed while this symbol
  /// is loading will persist once the image has loaded.
  Uri? get uri => _uri.value;

  final Memoized<Uri?> _uri;

  /// The width of the picture marker symbol.
  ///
  /// The width of the symbol spanning from the left to the right side of the
  /// image. The default value is 0.0. You can use this property to override the
  /// width of the symbol. Note that if you set the [PictureMarkerSymbol.height]
  /// or [PictureMarkerSymbol.width] to 0.0, then the picture fill symbol will
  /// adopt the height and width of the loaded [PictureMarkerSymbol.image].
  double get width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_getWidth(_handle, errorHandler);
    });
  }

  set width(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_setWidth(_handle, value, errorHandler);
    });
  }

  @override
  int _coreLoadStatus() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_PictureMarkerSymbol_getLoadStatus(
          _handle, errorHandler);
    });
  }

  @override
  void _coreLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_load(_handle, errorHandler);
    });
  }

  @override
  void _coreRetryLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_retryLoad(_handle, errorHandler);
    });
  }

  @override
  void _coreCancelLoad() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_PictureMarkerSymbol_cancelLoad(_handle, errorHandler);
    });
  }

  @override
  void _doneLoading(ArcGISException? e) {
    _image.invalidateCache();
    _uri.invalidateCache();
    super._doneLoading(e);
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLoadableDoneLoadingEvent:
        final event = () {
          final errorHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_ErrorHandle;
          return errorHandle.toArcGISException();
        }();
        _doneLoadingStreamController.add(event);
      case AsyncType.asyncTypeLoadableLoadStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LoadStatus._fromCoreValue(coreValue);
        }();
        _loadStatusChangedStreamController.add(event);
      default:
        logger.f('PictureMarkerSymbol unhandled asyncType $asyncType');
    }
  }
}

/// A base class for renderers that use a collection of one or more symbols to
/// display features in a [Layer] or graphics in a [GraphicsOverlay].
///
/// If the renderer contains more than a single symbol, it uses the rules to
/// determine the symbol to apply to each geoelement, based on one or several
/// attribute values. There are three basic types of renderers:
/// * [SimpleRenderer] - simple renderers use a single symbol for all
/// geoelements.
/// * [UniqueValueRenderer] - unique value renders define a different symbol for
/// each unique value of an attribute.
/// * [ClassBreaksRenderer] - class break renderers define a different symbol
/// for each range of numeric values.
///
/// To symbolize and display the geoelements, apply the renderer to the
/// [FeatureLayer.renderer], the [GraphicsOverlay.renderer], or the
/// `ArcGISSceneLayer.renderer`.
///
/// A [GraphicsOverlay] can contain graphics with different geometry dimensions,
/// such as an [ArcGISPoint] and [Polygon]. A [Renderer], however, can only
/// provide symbols with one geometry dimension. Therefore, if you apply a
/// renderer to a graphics overlay, only graphics with the specified geometry
/// dimension are displayed. All other graphics are not visible.
///
/// If you apply an [ArcGISSymbol] directly to a graphic, the symbol displays in
/// preference to the [GraphicsOverlay.renderer].
///
/// For raster data, rendering is handled by a `RasterRenderer`.
final class Renderer
    with JsonSerializable
    implements _InstanceId, ffi.Finalizable {
  final RT_RendererHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Renderer_destroyInstance.cast());

  static Renderer? _fromHandle(RT_RendererHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Renderer._instanceCache.instanceWith(handle);
  }

  static _RendererType _objectTypeOf(RT_RendererHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getObjectType(handle, errorHandler);
    });
    return _RendererType._fromCoreValue(coreValue);
  }

  _RendererType get _objectType => Renderer._objectTypeOf(_handle);

  Renderer._withHandle(RT_RendererHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Renderer_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _RendererFactory(), kind: 'Renderer');

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getInstanceId(_handle, errorHandler);
    });
  }

  /// The expression describing how attributes values are translated into a
  /// rotation to be applied to the [GeoElement].
  ///
  /// When an attribute name is specified in the rotation expression, it is
  /// enclosed in square brackets, for example: \[Rotation].
  String get rotationExpression {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getRotationExpression(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set rotationExpression(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Renderer_setRotationExpression(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// Indicates whether the rotation calculated from the
  /// [Renderer.rotationExpression] is interpreted as arithmetic or geographic.
  ///
  /// The options are:
  /// * [RotationType.arithmetic] - rotation is along the x-axis, with positive
  /// rotation being counter-clockwise.
  /// * [RotationType.geographic] - rotation is along the y-axis, with positive
  /// rotation being clockwise.
  ///
  /// [RotationType.arithmetic] if an error occurs.
  RotationType get rotationType {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getRotationType(_handle, errorHandler);
    });
    return RotationType._fromCoreValue(coreValue);
  }

  set rotationType(RotationType value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Renderer_setRotationType(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// Clones the [Renderer].
  ///
  /// Return Value: A new [Renderer] with the same values as the current
  /// [Renderer].
  Renderer clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_clone(_handle, errorHandler);
    });
    return Renderer._fromHandle(objectHandle)!;
  }

  /// Returns the symbol that is used to visualize the given feature with
  /// override attributes from the renderer.
  ///
  /// If applyAttributeOverrides is set to true, this method will get the symbol
  /// from the renderer and override the symbol properties with the overrides
  /// available on the renderer. These include visual variable size, color,
  /// opacity and rotation. If the override expression or attributes contain any
  /// information not known to either the renderer or observation (such as
  /// "scale"), that override will not be applied. If the override attributes
  /// are applied successfully, a symbol with overridden properties will be
  /// returned otherwise the original symbol will be returned.
  ///
  /// If the renderer is a `DictionaryRenderer` and its associated
  /// `DictionarySymbolStyle` references a style file hosted on ArcGIS Online or
  /// an ArcGIS Enterprise portal (also referred to as a web style), this method
  /// returns null. If the layer has rendered and the symbol is already drawn on
  /// the view, this method returns a valid `MultilayerSymbol`. If you want to
  /// get the symbol before the layer is rendered, use
  /// `DictionarySymbolStyle.getSymbolAsync(Dictionary<String, Object>)`.
  ///
  /// Parameters:
  /// - `feature` — The feature.
  /// - `applyAttributeOverrides` — boolean value if set to true applies the
  /// override attributes from renderer.
  ///
  /// Return Value: An [ArcGISSymbol].
  ArcGISSymbol? symbolForFeature(
      {required Feature feature, bool applyAttributeOverrides = false}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getSymbolForFeatureWithAttributeOverrides(
          _handle, feature._handle, applyAttributeOverrides, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle);
  }

  /// Returns the symbol that is used to visualize the given graphic with
  /// override attributes from the renderer.
  ///
  /// If applyAttributeOverrides is set to true, this method will get the symbol
  /// from the renderer and override the symbol properties with the overrides
  /// available on the renderer. These include visual variable size, color,
  /// opacity and rotation. If the override expression or attributes contain any
  /// information not known to either the renderer or observation (such as
  /// "scale"), that override will not be applied. If the override attributes
  /// are applied successfully, a symbol with overridden properties will be
  /// returned otherwise the original symbol will be returned.
  ///
  /// If the renderer is a `DictionaryRenderer` and its associated
  /// `DictionarySymbolStyle` references a style file hosted on ArcGIS Online or
  /// an ArcGIS Enterprise portal (also referred to as a web style), this method
  /// returns null. If the layer has rendered and the symbol is already drawn on
  /// the view, this method returns a valid `MultilayerSymbol`. If you want to
  /// get the symbol before the layer is rendered, use
  /// `DictionarySymbolStyle.getSymbolAsync(Dictionary<String, Object>)`.
  ///
  /// Parameters:
  /// - `graphic` — The graphic.
  /// - `applyAttributeOverrides` — Boolean value if set to true applies the
  /// override attributes from renderer.
  ///
  /// Return Value: An [ArcGISSymbol].
  ArcGISSymbol? symbolForGraphic(
      {required Graphic graphic, bool applyAttributeOverrides = false}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getSymbolForGraphicWithAttributeOverrides(
          _handle, graphic._handle, applyAttributeOverrides, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle);
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Renderer.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Renderer_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Renderer._fromHandle(objectHandle)!;
  }

  factory Renderer.fromJson(Map<String, dynamic> json) {
    return Renderer.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Renderer) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_Renderer_getHash(_handle, errorHandler);
    });
  }
}

final class _RendererFactory
    implements _InstanceFactory<Renderer, RT_RendererHandle> {
  @override
  Renderer createInstance({required RT_RendererHandle handle}) {
    switch (Renderer._objectTypeOf(handle)) {
      case _RendererType.classBreaksRenderer:
        return ClassBreaksRenderer._withHandle(handle);
      case _RendererType.simpleRenderer:
        return SimpleRenderer._withHandle(handle);
      case _RendererType.uniqueValueRenderer:
        return UniqueValueRenderer._withHandle(handle);
      case _RendererType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w('An object of unsupported type is being treated as Renderer');
        return Renderer._withHandle(handle);
    }
  }

  @override
  void destroyHandle(RT_RendererHandle handle) {
    bindings.Renderer_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_RendererHandle handle) {
    return runtimecore.RT_Renderer_getInstanceId(handle, ffi.nullptr);
  }
}

/// The classification method used to generate class breaks.
enum RendererClassificationMethod {
  /// Defined interval classification.
  definedInterval,

  /// Equal interval classification.
  equalInterval,

  /// Geometrical interval classification.
  geometricalInterval,

  /// Natural breaks classification.
  naturalBreaks,

  /// Quantile classification.
  quantile,

  /// Standard deviation classification.
  standardDeviation,

  /// Manual classification.
  manual;

  factory RendererClassificationMethod._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return definedInterval;
      case 1:
        return equalInterval;
      case 2:
        return geometricalInterval;
      case 3:
        return naturalBreaks;
      case 4:
        return quantile;
      case 5:
        return standardDeviation;
      case 6:
        return manual;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case definedInterval:
        return 0;
      case equalInterval:
        return 1;
      case geometricalInterval:
        return 2;
      case naturalBreaks:
        return 3;
      case quantile:
        return 4;
      case standardDeviation:
        return 5;
      case manual:
        return 6;
    }
  }
}

/// The different types of normalization.
enum RendererNormalizationType {
  /// Normalize by field.
  byField,

  /// Normalize by a log.
  byLog,

  /// Normalize by percent of total.
  byPercentOfTotal,

  /// Do not normalize.
  none;

  factory RendererNormalizationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return byField;
      case 1:
        return byLog;
      case 2:
        return byPercentOfTotal;
      case 3:
        return none;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case byField:
        return 0;
      case byLog:
        return 1;
      case byPercentOfTotal:
        return 2;
      case none:
        return 3;
    }
  }
}

/// The different types of renderers.
enum _RendererType {
  /// A class break renderer object.
  classBreaksRenderer,

  /// A dictionary renderer object.
  dictionaryRenderer,

  /// A simple renderer object.
  simpleRenderer,

  /// A unique value renderer object.
  uniqueValueRenderer,

  /// An unsupported renderer.
  unsupportedRenderer,

  /// A heatmap renderer.
  heatmapRenderer,

  /// An unknown renderer type. Normally indicates an exception has occurred if
  /// this value is returned.
  unknown;

  factory _RendererType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return classBreaksRenderer;
      case 1:
        return dictionaryRenderer;
      case 2:
        return simpleRenderer;
      case 3:
        return uniqueValueRenderer;
      case 4:
        return unsupportedRenderer;
      case 5:
        return heatmapRenderer;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case classBreaksRenderer:
        return 0;
      case dictionaryRenderer:
        return 1;
      case simpleRenderer:
        return 2;
      case uniqueValueRenderer:
        return 3;
      case unsupportedRenderer:
        return 4;
      case heatmapRenderer:
        return 5;
      case unknown:
        return -1;
    }
  }
}

/// The list of possible rotation types.
///
/// Controls the origin and direction of rotation for a symbol.
enum RotationType {
  /// The symbol is rotated from East in a counterclockwise direction where East
  /// is the 0 degrees axis.
  arithmetic,

  /// The symbol is rotated from North in a clockwise direction where North is
  /// the 0 degrees axis.
  geographic;

  factory RotationType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arithmetic;
      case 1:
        return geographic;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arithmetic:
        return 0;
      case geographic:
        return 1;
    }
  }
}

/// Uses predefined patterns and colors to symbolize graphics and features that
/// have polygon geometry.
///
/// Simple fill symbols can fill the interior of polygons using predefined fill
/// patterns such as [SimpleFillSymbolStyle.backwardDiagonal],
/// [SimpleFillSymbolStyle.vertical], [SimpleFillSymbolStyle.horizontal] and
/// [SimpleFillSymbolStyle.cross], as well as [SimpleFillSymbolStyle.solid]
/// colors. These symbols can have an optional outline, which is defined by
/// [SimpleLineSymbol].
final class SimpleFillSymbol extends FillSymbol {
  static SimpleFillSymbol? _fromHandle(RT_SimpleFillSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  SimpleFillSymbol._withHandle(super.handle) : super._withHandle();

  /// Creates a simple fill symbol object with a color, style and outline.
  ///
  /// Parameters:
  /// - `style` — The type of simple fill symbol to create.
  /// - `color` — The color of the simple fill symbol.
  /// - `outline` — The outline of the simple fill symbol.
  factory SimpleFillSymbol(
      {SimpleFillSymbolStyle style = SimpleFillSymbolStyle.solid,
      Color color = const Color(0xFFD3D3D3),
      LineSymbol? outline}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreColor = color.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleFillSymbol_createWith(style.coreValue,
          coreColor._handle, outline?._handle ?? ffi.nullptr, errorHandler);
    });
    final SimpleFillSymbol object =
        ArcGISSymbol._instanceCache.instanceWith(handle);
    object._color.cache(color);
    object._outline.cache(outline);
    return object;
  }

  /// The style of the simple fill symbol.
  ///
  /// [SimpleFillSymbolStyle.solid] if an error occurs.
  SimpleFillSymbolStyle get style {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleFillSymbol_getStyle(_handle, errorHandler);
    });
    return SimpleFillSymbolStyle._fromCoreValue(coreValue);
  }

  set style(SimpleFillSymbolStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleFillSymbol_setStyle(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The list of possible simple fill symbol styles.
///
/// This is used to determine the style of the simple fill symbol.
enum SimpleFillSymbolStyle {
  /// Fills with backward diagonal lines.
  backwardDiagonal,

  /// Fills with horizontal and vertical lines.
  cross,

  /// Fills with forward and backward diagonal lines.
  diagonalCross,

  /// Fills with forward diagonal lines.
  forwardDiagonal,

  /// Fills with horizontal lines.
  horizontal,

  /// No fill.
  null_,

  /// Solid fill.
  solid,

  /// Fills with vertical lines.
  vertical;

  factory SimpleFillSymbolStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return backwardDiagonal;
      case 1:
        return cross;
      case 2:
        return diagonalCross;
      case 3:
        return forwardDiagonal;
      case 4:
        return horizontal;
      case 5:
        return null_;
      case 6:
        return solid;
      case 7:
        return vertical;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case backwardDiagonal:
        return 0;
      case cross:
        return 1;
      case diagonalCross:
        return 2;
      case forwardDiagonal:
        return 3;
      case horizontal:
        return 4;
      case null_:
        return 5;
      case solid:
        return 6;
      case vertical:
        return 7;
    }
  }
}

/// Uses predefined patterns and colors to symbolize graphics and features that
/// have polyline geometry.
///
/// Simple line symbols display graphics using predefined line style patterns
/// such as [SimpleLineSymbolStyle.solid], [SimpleLineSymbolStyle.dash], or
/// [SimpleLineSymbolStyle.dot].
final class SimpleLineSymbol extends LineSymbol {
  static SimpleLineSymbol? _fromHandle(RT_SimpleLineSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  SimpleLineSymbol._withHandle(super.handle) : super._withHandle();

  /// Creates a simple line symbol object with a style, color, width, and line
  /// end marker.
  ///
  /// Parameters:
  /// - `style` — The type of simple line symbol to create.
  /// - `color` — The color of the simple line symbol.
  /// - `width` — The width of the simple line symbol.
  /// - `markerStyle` — The style of simple line symbol end marker(s).
  /// - `markerPlacement` — The placement of simple line symbol end marker(s).
  factory SimpleLineSymbol(
      {SimpleLineSymbolStyle style = SimpleLineSymbolStyle.solid,
      Color color = const Color(0xFFD3D3D3),
      double width = 1.0,
      SimpleLineSymbolMarkerStyle markerStyle =
          SimpleLineSymbolMarkerStyle.none,
      SimpleLineSymbolMarkerPlacement markerPlacement =
          SimpleLineSymbolMarkerPlacement.end}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreColor = color.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleLineSymbol_createWithMarkerStyleAndPlacement(
          style.coreValue,
          coreColor._handle,
          width,
          markerStyle.coreValue,
          markerPlacement.coreValue,
          errorHandler);
    });
    final SimpleLineSymbol object =
        ArcGISSymbol._instanceCache.instanceWith(handle);
    object._color.cache(color);
    return object;
  }

  /// The simple line symbol end marker placement of the simple line symbol.
  SimpleLineSymbolMarkerPlacement get markerPlacement {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleLineSymbol_getMarkerPlacement(
          _handle, errorHandler);
    });
    return SimpleLineSymbolMarkerPlacement._fromCoreValue(coreValue);
  }

  set markerPlacement(SimpleLineSymbolMarkerPlacement value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleLineSymbol_setMarkerPlacement(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The simple line symbol end marker style of the simple line symbol.
  SimpleLineSymbolMarkerStyle get markerStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleLineSymbol_getMarkerStyle(
          _handle, errorHandler);
    });
    return SimpleLineSymbolMarkerStyle._fromCoreValue(coreValue);
  }

  set markerStyle(SimpleLineSymbolMarkerStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleLineSymbol_setMarkerStyle(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The style of the simple line symbol.
  ///
  /// [SimpleLineSymbolStyle.solid] if an error occurs.
  SimpleLineSymbolStyle get style {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleLineSymbol_getStyle(_handle, errorHandler);
    });
    return SimpleLineSymbolStyle._fromCoreValue(coreValue);
  }

  set style(SimpleLineSymbolStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleLineSymbol_setStyle(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The list of possible marker placements on a simple line symbol.
///
/// Controls the placement of markers on a simple line symbol, if any.
enum SimpleLineSymbolMarkerPlacement {
  /// A marker is placed at the beginning of the simple line symbol.
  begin,

  /// A marker is placed at the end of the simple line symbol.
  end,

  /// A marker is placed at both the beginning and end of the simple line
  /// symbol.
  beginAndEnd;

  factory SimpleLineSymbolMarkerPlacement._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return begin;
      case 1:
        return end;
      case 2:
        return beginAndEnd;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case begin:
        return 0;
      case end:
        return 1;
      case beginAndEnd:
        return 2;
    }
  }
}

/// The list of possible marker styles to place on a simple line symbol.
///
/// Controls the style of marker placed at the end of a simple line symbol, if
/// any.
enum SimpleLineSymbolMarkerStyle {
  /// No markers are placed at the end of the simple line symbol.
  none,

  /// Arrow marker(s) placed at the beginning, end, or beginning and end of the
  /// simple line symbol depending on the associated value of
  /// [SimpleLineSymbolMarkerPlacement].
  arrow;

  factory SimpleLineSymbolMarkerStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return none;
      case 1:
        return arrow;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case none:
        return 0;
      case arrow:
        return 1;
    }
  }
}

/// The list of possible simple line symbol styles.
///
/// This is used to determine the style of the simple line symbol.
enum SimpleLineSymbolStyle {
  /// Dash line.
  dash,

  /// Dash dot line.
  dashDot,

  /// Dash dot dot line.
  dashDotDot,

  /// Dot line.
  dot,

  /// Invisible line.
  null_,

  /// Solid line.
  solid,

  /// Dash line with long dash.
  longDash,

  /// Dash dot line with long dash.
  longDashDot,

  /// Dash line with short gaps.
  shortDash,

  /// Dash dot line with short gaps.
  shortDashDot,

  /// Dash dot dot line with short gaps.
  shortDashDotDot,

  /// Dot line with short gaps.
  shortDot;

  factory SimpleLineSymbolStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return dash;
      case 1:
        return dashDot;
      case 2:
        return dashDotDot;
      case 3:
        return dot;
      case 4:
        return null_;
      case 5:
        return solid;
      case 6:
        return longDash;
      case 7:
        return longDashDot;
      case 8:
        return shortDash;
      case 9:
        return shortDashDot;
      case 10:
        return shortDashDotDot;
      case 11:
        return shortDot;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case dash:
        return 0;
      case dashDot:
        return 1;
      case dashDotDot:
        return 2;
      case dot:
        return 3;
      case null_:
        return 4;
      case solid:
        return 5;
      case longDash:
        return 6;
      case longDashDot:
        return 7;
      case shortDash:
        return 8;
      case shortDashDot:
        return 9;
      case shortDashDotDot:
        return 10;
      case shortDot:
        return 11;
    }
  }
}

/// Uses a color and marker shape to symbolize graphics and features that have
/// point or multipoint geometry.
///
/// Simple marker symbols display graphics and features (collectively referred
/// to as geoelements) using predefined markers such as circle and cross. These
/// symbols can have an optional outline, which is defined as a
/// [SimpleLineSymbol].
final class SimpleMarkerSymbol extends MarkerSymbol {
  static SimpleMarkerSymbol? _fromHandle(RT_SimpleMarkerSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  SimpleMarkerSymbol._withHandle(super.handle)
      : _color = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SimpleMarkerSymbol_getColor(
                handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_SimpleMarkerSymbol_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _outline = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SimpleMarkerSymbol_getOutline(
                handle, errorHandler);
          });
          return SimpleLineSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_SimpleMarkerSymbol_setOutline(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a simple marker symbol with the given properties.
  ///
  /// Parameters:
  /// - `style` — Indicates the type of simple marker symbol to create.
  /// - `color` — The color of the simple marker symbol.
  /// - `size` — The size of the simple marker symbol in device independent
  /// pixels (DIPs).
  factory SimpleMarkerSymbol(
      {SimpleMarkerSymbolStyle style = SimpleMarkerSymbolStyle.circle,
      Color color = const Color(0xFFD3D3D3),
      double size = 8.0}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreColor = color.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleMarkerSymbol_createWith(
          style.coreValue, coreColor._handle, size, errorHandler);
    });
    final SimpleMarkerSymbol object =
        ArcGISSymbol._instanceCache.instanceWith(handle);
    object._color.cache(color);
    return object;
  }

  /// The color for the simple marker symbol.
  Color get color => _color.value;

  set color(Color value) => _color.value = value;

  final Memoized<Color> _color;

  /// The outline of the simple marker symbol.
  SimpleLineSymbol? get outline => _outline.value;

  set outline(SimpleLineSymbol? value) => _outline.value = value;

  final Memoized<SimpleLineSymbol?> _outline;

  /// The size of the simple marker symbol in device independent pixels (DIPs).
  double get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleMarkerSymbol_getSize(_handle, errorHandler);
    });
  }

  set size(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleMarkerSymbol_setSize(_handle, value, errorHandler);
    });
  }

  /// The style of the simple marker symbol, such as circle, cross, or diamond.
  ///
  /// [SimpleMarkerSymbolStyle.circle] if an error occurs.
  SimpleMarkerSymbolStyle get style {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleMarkerSymbol_getStyle(_handle, errorHandler);
    });
    return SimpleMarkerSymbolStyle._fromCoreValue(coreValue);
  }

  set style(SimpleMarkerSymbolStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleMarkerSymbol_setStyle(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The list of possible simple marker symbol styles.
///
/// This is used to determine the style of the simple marker symbol.
enum SimpleMarkerSymbolStyle {
  /// The marker is a circle.
  circle,

  /// The marker is a cross.
  cross,

  /// The marker is a diamond.
  diamond,

  /// The marker is a square.
  square,

  /// The marker is a triangle.
  triangle,

  /// The marker is a diagonal cross.
  x;

  factory SimpleMarkerSymbolStyle._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return circle;
      case 1:
        return cross;
      case 2:
        return diamond;
      case 3:
        return square;
      case 4:
        return triangle;
      case 5:
        return x;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case circle:
        return 0;
      case cross:
        return 1;
      case diamond:
        return 2;
      case square:
        return 3;
      case triangle:
        return 4;
      case x:
        return 5;
    }
  }
}

/// A simple renderer uses a single [ArcGISSymbol] to draw all features and
/// graphics.
///
/// The same symbol is used for all graphics in a graphics overlay and all
/// features in a feature layer, regardless of their attribute values.
final class SimpleRenderer extends Renderer {
  static SimpleRenderer? _fromHandle(RT_SimpleRendererHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Renderer._instanceCache.instanceWith(handle);
  }

  SimpleRenderer._withHandle(super.handle)
      : _symbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SimpleRenderer_getSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_SimpleRenderer_setSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a new simple renderer with the given symbol.
  ///
  /// Parameters:
  /// - `symbol` — The symbol.
  factory SimpleRenderer({ArcGISSymbol? symbol}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleRenderer_createWithSymbol(
          symbol?._handle ?? ffi.nullptr, errorHandler);
    });
    final SimpleRenderer object = Renderer._instanceCache.instanceWith(handle);
    object._symbol.cache(symbol);
    return object;
  }

  /// The description of this renderer.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleRenderer_getDescription(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleRenderer_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The renderer's label.
  String get label {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SimpleRenderer_getLabel(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set label(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_SimpleRenderer_setLabel(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The symbol of this renderer.
  ArcGISSymbol? get symbol => _symbol.value;

  set symbol(ArcGISSymbol? value) => _symbol.value = value;

  final Memoized<ArcGISSymbol?> _symbol;
}

/// The list of possible symbol angle alignment types.
///
/// Marker symbol alignment when map is rotated.
enum SymbolAngleAlignment {
  /// Marker top edge always aligned with map north.
  arcGISMap,

  /// Marker top edge always aligned with screen top edge.
  screen;

  factory SymbolAngleAlignment._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISMap;
      case 1:
        return screen;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISMap:
        return 0;
      case screen:
        return 1;
    }
  }
}

/// The list of possible symbol types.
///
/// This is used to determine the symbol type.
enum _SymbolType {
  /// Simple fill symbol.
  simpleFillSymbol,

  /// Simple line symbol.
  simpleLineSymbol,

  /// Simple marker symbol.
  simpleMarkerSymbol,

  /// Picture marker symbol.
  pictureMarkerSymbol,

  /// Text symbol.
  textSymbol,

  /// Simple marker scene symbol.
  simpleMarkerSceneSymbol,

  /// Model marker symbol.
  modelSceneSymbol,

  /// Distance composite symbol.
  distanceCompositeSceneSymbol,

  /// Unsupported symbol.
  unsupportedSymbol,

  /// Composite symbol.
  compositeSymbol,

  /// Picture Fill Symbol.
  pictureFillSymbol,

  /// Multilayer Point Symbol.
  multilayerPointSymbol,

  /// Multilayer Polyline Symbol.
  multilayerPolylineSymbol,

  /// Multilayer Polygon Symbol.
  multilayerPolygonSymbol,

  /// Multilayer Mesh Symbol.
  multilayerMeshSymbol,

  /// Unknown symbol type.
  unknown;

  factory _SymbolType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return simpleFillSymbol;
      case 1:
        return simpleLineSymbol;
      case 2:
        return simpleMarkerSymbol;
      case 3:
        return pictureMarkerSymbol;
      case 4:
        return textSymbol;
      case 5:
        return simpleMarkerSceneSymbol;
      case 6:
        return modelSceneSymbol;
      case 7:
        return distanceCompositeSceneSymbol;
      case 8:
        return unsupportedSymbol;
      case 9:
        return compositeSymbol;
      case 10:
        return pictureFillSymbol;
      case 11:
        return multilayerPointSymbol;
      case 12:
        return multilayerPolylineSymbol;
      case 13:
        return multilayerPolygonSymbol;
      case 14:
        return multilayerMeshSymbol;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case simpleFillSymbol:
        return 0;
      case simpleLineSymbol:
        return 1;
      case simpleMarkerSymbol:
        return 2;
      case pictureMarkerSymbol:
        return 3;
      case textSymbol:
        return 4;
      case simpleMarkerSceneSymbol:
        return 5;
      case modelSceneSymbol:
        return 6;
      case distanceCompositeSceneSymbol:
        return 7;
      case unsupportedSymbol:
        return 8;
      case compositeSymbol:
        return 9;
      case pictureFillSymbol:
        return 10;
      case multilayerPointSymbol:
        return 11;
      case multilayerPolylineSymbol:
        return 12;
      case multilayerPolygonSymbol:
        return 13;
      case multilayerMeshSymbol:
        return 14;
      case unknown:
        return -1;
    }
  }
}

/// Defines how text is displayed using characteristics such as font, size,
/// color, and position.
///
/// To display text in an [ArcGISMapViewController] or `SceneView`, create a
/// [TextSymbol]. Specify whether a string or attribute value is displayed by
/// the [TextSymbol.text]. Define the appearance and position of the text using
/// [TextSymbol.color], [TextSymbol.size], [TextSymbol.fontStyle], or
/// [TextSymbol.verticalAlignment], for example. Position the text by applying
/// it to a [Graphic] based on any type of geometry - point, multipoint,
/// polyline, or polygon. Add the graphic to the [GraphicsOverlay.graphics]
/// collection and add the [GraphicsOverlay] to the [ArcGISMapViewController] or
/// `SceneView` collection of graphics overlays.
///
/// [TextSymbol] is also used to define the appearance of layer and grid based
/// labels:
/// * Layers such as [FeatureLayer], `ArcGISSceneLayer`, or `DynamicEntityLayer`
/// contain label definitions that specify how labels are displayed. You can use
/// `LabelDefinition.textSymbol` to define a label appearance within a scale
/// range. To display these labels, add a collection of these label definitions
/// to a layer.
/// * [ArcGISMapViewController] can display a coordinate system grid with
/// specific label styles at different resolutions. You can define the
/// appearance of these labels using [Grid.setTextSymbol].
final class TextSymbol extends MarkerSymbol {
  static TextSymbol? _fromHandle(RT_TextSymbolHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISSymbol._instanceCache.instanceWith(handle);
  }

  TextSymbol._withHandle(super.handle)
      : _backgroundColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TextSymbol_getBackgroundColor(
                handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TextSymbol_setBackgroundColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _color = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TextSymbol_getColor(handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TextSymbol_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _haloColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TextSymbol_getHaloColor(handle, errorHandler);
          });
          return colorHandle.toColor();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TextSymbol_setHaloColor(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _outlineColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_TextSymbol_getOutlineColor(
                handle, errorHandler);
          });
          return colorHandle.toColor();
        }, setter: (value) {
          final coreValue = value?.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_TextSymbol_setOutlineColor(
                handle, coreValue?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle();

  /// Creates a text symbol with the given size, text, and color along with the
  /// horizontal and vertical alignment relative to the mid-point of this
  /// symbol.
  ///
  /// Parameters:
  /// - `text` — The text to be displayed.
  /// - `color` — The color of the text symbol.
  /// - `size` — The size of the text symbol.
  /// - `horizontalAlignment` — The horizontal alignment of the text.
  /// - `verticalAlignment` — The vertical alignment of the text.
  factory TextSymbol(
      {String text = '',
      Color color = const Color(0xFF000000),
      double size = 8.0,
      HorizontalAlignment horizontalAlignment = HorizontalAlignment.center,
      VerticalAlignment verticalAlignment = VerticalAlignment.middle}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreText = _CString(text);
    final coreColor = color.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_createWith(
          coreText.bytes,
          coreColor._handle,
          size,
          horizontalAlignment.coreValue,
          verticalAlignment.coreValue,
          errorHandler);
    });
    final TextSymbol object = ArcGISSymbol._instanceCache.instanceWith(handle);
    object._color.cache(color);
    return object;
  }

  /// The color for the text symbol background.
  ///
  /// The default value is transparent.
  Color get backgroundColor => _backgroundColor.value;

  set backgroundColor(Color value) => _backgroundColor.value = value;

  final Memoized<Color> _backgroundColor;

  /// The color for the text symbol.
  ///
  /// The default value is black.
  Color get color => _color.value;

  set color(Color value) => _color.value = value;

  final Memoized<Color> _color;

  /// The type of font decoration for the text symbol.
  ///
  /// The default value is [FontDecoration.none]. [FontDecoration.none] if an
  /// error occurs.
  FontDecoration get fontDecoration {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getFontDecoration(_handle, errorHandler);
    });
    return FontDecoration._fromCoreValue(coreValue);
  }

  set fontDecoration(FontDecoration value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setFontDecoration(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The font family of the text symbol.
  ///
  /// This can be as specific as 'arial' or as generic as 'sans-serif', for
  /// example.
  String get fontFamily {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getFontFamily(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set fontFamily(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setFontFamily(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The font style of the text symbol.
  ///
  /// The default value is [FontStyle.normal]. Returns [FontStyle.normal] if an
  /// error occurs.
  FontStyle get fontStyle {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getFontStyle(_handle, errorHandler);
    });
    return FontStyle._fromCoreValue(coreValue);
  }

  set fontStyle(FontStyle value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setFontStyle(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The font weight of the text symbol.
  ///
  /// Font weight describes how thick or thin characters in text are displayed.
  /// The default value is [ArcGISFontWeight.normal]. Returns
  /// [ArcGISFontWeight.normal] if an error occurs.
  ArcGISFontWeight get fontWeight {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getFontWeight(_handle, errorHandler);
    });
    return ArcGISFontWeight._fromCoreValue(coreValue);
  }

  set fontWeight(ArcGISFontWeight value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setFontWeight(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The color for the halo around the text symbol.
  ///
  /// The default value is transparent.
  Color? get haloColor => _haloColor.value;

  set haloColor(Color? value) => _haloColor.value = value;

  final Memoized<Color?> _haloColor;

  /// The size of the halo around the text symbol in device-independent pixels
  /// (DIPs).
  ///
  /// The default value is 0.0.
  double get haloWidth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getHaloWidth(_handle, errorHandler);
    });
  }

  set haloWidth(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setHaloWidth(_handle, value, errorHandler);
    });
  }

  /// The horizontal alignment of the text symbol relative to the symbol's
  /// mid-point location.
  ///
  /// The default value is [HorizontalAlignment.center]. Returns
  /// [HorizontalAlignment.center] if an error occurs.
  HorizontalAlignment get horizontalAlignment {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getHorizontalAlignment(
          _handle, errorHandler);
    });
    return HorizontalAlignment._fromCoreValue(coreValue);
  }

  set horizontalAlignment(HorizontalAlignment value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setHorizontalAlignment(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// If kerning needs to be enabled. It is disabled by default.
  ///
  /// Determines whether to adjust the spacing between characters in the text
  /// string.
  bool get kerningEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getKerningEnabled(_handle, errorHandler);
    });
  }

  set kerningEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setKerningEnabled(_handle, value, errorHandler);
    });
  }

  /// The color for the text symbol outline.
  Color? get outlineColor => _outlineColor.value;

  set outlineColor(Color? value) => _outlineColor.value = value;

  final Memoized<Color?> _outlineColor;

  /// The width of the text symbol outline in device-independent pixels (DIPs).
  ///
  /// The default value is 0.0.
  double get outlineWidth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getOutlineWidth(_handle, errorHandler);
    });
  }

  set outlineWidth(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setOutlineWidth(_handle, value, errorHandler);
    });
  }

  /// The font size of the text symbol.
  ///
  /// The default value is 8.0.
  double get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getSize(_handle, errorHandler);
    });
  }

  set size(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setSize(_handle, value, errorHandler);
    });
  }

  /// The text of the text symbol.
  ///
  /// The default value is an empty string.
  String get text {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getText(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set text(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setText(_handle, coreValue.bytes, errorHandler);
    });
  }

  /// The vertical alignment of the text symbol relative to the symbol's
  /// mid-point location.
  ///
  /// The default value is [VerticalAlignment.middle]. Returns
  /// [VerticalAlignment.middle] if an error occurs.
  VerticalAlignment get verticalAlignment {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_TextSymbol_getVerticalAlignment(
          _handle, errorHandler);
    });
    return VerticalAlignment._fromCoreValue(coreValue);
  }

  set verticalAlignment(VerticalAlignment value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_TextSymbol_setVerticalAlignment(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// A unique value object.
final class UniqueValue
    with JsonSerializable
    implements _InstanceId, ffi.Finalizable {
  final RT_UniqueValueHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.UniqueValue_destroyInstance.cast());

  static UniqueValue? _fromHandle(RT_UniqueValueHandle handle) {
    if (handle == ffi.nullptr) return null;
    return UniqueValue._instanceCache.instanceWith(handle);
  }

  UniqueValue._withHandle(RT_UniqueValueHandle handle)
      : _symbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_UniqueValue_getSymbol(handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_UniqueValue_setSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _values = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_UniqueValue_getValues(handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.UniqueValue_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _UniqueValueFactory(), kind: 'UniqueValue');

  /// Creates a new unique value (or unique combination of values) and a symbol
  /// used to display elements with this value in an [UniqueValueRenderer].
  ///
  /// Parameters:
  /// - `description` — A description of the unique value. "Parcels zoned for
  /// residential use", for example.
  /// - `label` — A label for the unique value. "Residential", for example.
  /// - `symbol` — A symbol used to represent elements with this unique value.
  /// - `values` — A [List] containing [dynamic] types that define a unique
  /// value or unique combination of values.
  factory UniqueValue(
      {String description = '',
      String label = '',
      ArcGISSymbol? symbol,
      List<Object> values = const []}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreDescription = _CString(description);
    final coreLabel = _CString(label);
    final coreValues = values.toMutableArray(valueType: _ElementType.variant);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_createWith(
          coreDescription.bytes,
          coreLabel.bytes,
          symbol?._handle ?? ffi.nullptr,
          coreValues._handle,
          errorHandler);
    });
    final UniqueValue object = UniqueValue._instanceCache.instanceWith(handle);
    object._symbol.cache(symbol);
    object._values.value.setCache(values);
    return object;
  }

  /// A description of the unique value. "Parcels zoned for residential use",
  /// for example.
  String get description {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_getDescription(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set description(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_UniqueValue_setDescription(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_getInstanceId(_handle, errorHandler);
    });
  }

  /// A label for the unique value. "Residential", for example.
  String get label {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_getLabel(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set label(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_UniqueValue_setLabel(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// A symbol used to represent elements with this unique value.
  ArcGISSymbol? get symbol => _symbol.value;

  set symbol(ArcGISSymbol? value) => _symbol.value = value;

  final Memoized<ArcGISSymbol?> _symbol;

  /// A [List] containing [dynamic] types that define a unique value or unique
  /// combination of values.
  List<Object> get values => _values.value;

  final Memoized<_MutableArrayList<Object>> _values;

  /// Clones the [UniqueValue].
  ///
  /// Return Value: A new [UniqueValue] with the same values as the current
  /// [UniqueValue].
  UniqueValue clone() {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_clone(_handle, errorHandler);
    });
    return UniqueValue._fromHandle(objectHandle)!;
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory UniqueValue.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_UniqueValue_fromJSON(
          jsonCString.bytes, errorHandler);
    });
    return UniqueValue._fromHandle(objectHandle)!;
  }

  factory UniqueValue.fromJson(Map<String, dynamic> json) {
    return UniqueValue.fromJsonString(jsonEncode(json));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UniqueValue) return false;
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_equals(
          _handle, other._handle, errorHandler);
    });
  }

  @override
  int get hashCode {
    return _withWarningErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValue_getHash(_handle, errorHandler);
    });
  }
}

final class _UniqueValueFactory
    implements _InstanceFactory<UniqueValue, RT_UniqueValueHandle> {
  @override
  UniqueValue createInstance({required RT_UniqueValueHandle handle}) {
    return UniqueValue._withHandle(handle);
  }

  @override
  void destroyHandle(RT_UniqueValueHandle handle) {
    bindings.UniqueValue_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_UniqueValueHandle handle) {
    return runtimecore.RT_UniqueValue_getInstanceId(handle, ffi.nullptr);
  }
}

/// A unique value renderer symbolizes geoelements with a distinct symbol for
/// each unique data value in an attribute.
///
/// A unique value renderer contains a collection of
/// [UniqueValueRenderer.uniqueValues]. Each [UniqueValue] has an
/// [UniqueValue.symbol] and a collection of [UniqueValue.values] to define a
/// value or combination of values.
///
/// This is typically used to visualize categories or data types. For example,
/// you can use a unique value renderer to symbolize zoning designations: yellow
/// for "Residential", purple for "Industrial", and green for both "Forests" and
/// "Open land".
final class UniqueValueRenderer extends Renderer {
  static UniqueValueRenderer? _fromHandle(RT_UniqueValueRendererHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Renderer._instanceCache.instanceWith(handle);
  }

  UniqueValueRenderer._withHandle(super.handle)
      : _defaultSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_UniqueValueRenderer_getDefaultSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_UniqueValueRenderer_setDefaultSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _fieldNames = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_UniqueValueRenderer_getFieldNames(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _uniqueValues = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_UniqueValueRenderer_getUniqueValues(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        super._withHandle();

  /// Creates a new unique value renderer object.
  ///
  /// Parameters:
  /// - `fieldNames` — A collection of the field names/attribute keys that the
  /// unique values apply to.
  /// - `uniqueValues` — A collection of unique values used by the renderer to
  /// select a symbol.
  /// - `defaultLabel` — The label used for the default symbol.
  /// - `defaultSymbol` — The default symbol for values that don't match any of
  /// the unique values.
  factory UniqueValueRenderer(
      {List<String> fieldNames = const [],
      List<UniqueValue> uniqueValues = const [],
      String defaultLabel = '',
      ArcGISSymbol? defaultSymbol}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreFieldNames =
        fieldNames.toMutableArray(valueType: _ElementType.string);
    final coreUniqueValues =
        uniqueValues.toMutableArray(valueType: _ElementType.uniqueValue);
    final coreDefaultLabel = _CString(defaultLabel);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValueRenderer_createWith(
          coreFieldNames._handle,
          coreUniqueValues._handle,
          coreDefaultLabel.bytes,
          defaultSymbol?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final UniqueValueRenderer object =
        Renderer._instanceCache.instanceWith(handle);
    object._fieldNames.value.setCache(fieldNames);
    object._uniqueValues.value.setCache(uniqueValues);
    object._defaultSymbol.cache(defaultSymbol);
    return object;
  }

  /// The label used for the default symbol.
  String get defaultLabel {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UniqueValueRenderer_getDefaultLabel(
          _handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set defaultLabel(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_UniqueValueRenderer_setDefaultLabel(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  /// The default symbol for values that don't match any of the unique values.
  ArcGISSymbol? get defaultSymbol => _defaultSymbol.value;

  set defaultSymbol(ArcGISSymbol? value) => _defaultSymbol.value = value;

  final Memoized<ArcGISSymbol?> _defaultSymbol;

  /// A collection of the field names/attribute keys that the unique values
  /// apply to.
  List<String> get fieldNames => _fieldNames.value;

  final Memoized<_MutableArrayList<String>> _fieldNames;

  /// A collection of unique values used by the renderer to select a symbol.
  List<UniqueValue> get uniqueValues => _uniqueValues.value;

  final Memoized<_MutableArrayList<UniqueValue>> _uniqueValues;
}

/// The list of possible vertical alignments.
///
/// Specifies how a text symbol should be vertically aligned.
enum VerticalAlignment {
  /// Baseline alignment.
  baseline,

  /// The text is bottom aligned.
  bottom,

  /// The text is middle aligned.
  middle,

  /// The text is top aligned.
  top;

  factory VerticalAlignment._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return baseline;
      case 1:
        return bottom;
      case 2:
        return middle;
      case 3:
        return top;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case baseline:
        return 0;
      case bottom:
        return 1;
      case middle:
        return 2;
      case top:
        return 3;
    }
  }
}
