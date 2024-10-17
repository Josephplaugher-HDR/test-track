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

/// Control how the map view is moved between positions.
///
/// Controls how the map view is animated. To play with the easing functions:
/// https://easings.net/.
enum AnimationCurve {
  /// Move linear.
  linear,

  /// Move in quadratically.
  easeInQuad,

  /// Move out quadratically.
  easeOutQuad,

  /// Move in and out quadratically.
  easeInOutQuad,

  /// Move in cubicly.
  easeInCubic,

  /// Move out cubicly.
  easeOutCubic,

  /// Move in and out cubicly.
  easeInOutCubic,

  /// Move in quartic.
  easeInQuart,

  /// Move out quartic.
  easeOutQuart,

  /// Move in and out quartic.
  easeInOutQuart,

  /// Move in quintic.
  easeInQuint,

  /// Move out quintic.
  easeOutQuint,

  /// Move in and out quintic.
  easeInOutQuint,

  /// Move in sine.
  easeInSine,

  /// Move out sine.
  easeOutSine,

  /// Move in and out sine.
  easeInOutSine,

  /// Move in exponentially.
  easeInExpo,

  /// Move out exponentially.
  easeOutExpo,

  /// Move in and out exponentially.
  easeInOutExpo,

  /// Move in circularly.
  easeInCirc,

  /// Move out circularly.
  easeOutCirc,

  /// Move in and out circularly.
  easeInOutCirc;

  factory AnimationCurve._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return linear;
      case 1:
        return easeInQuad;
      case 2:
        return easeOutQuad;
      case 3:
        return easeInOutQuad;
      case 4:
        return easeInCubic;
      case 5:
        return easeOutCubic;
      case 6:
        return easeInOutCubic;
      case 7:
        return easeInQuart;
      case 8:
        return easeOutQuart;
      case 9:
        return easeInOutQuart;
      case 10:
        return easeInQuint;
      case 11:
        return easeOutQuint;
      case 12:
        return easeInOutQuint;
      case 13:
        return easeInSine;
      case 14:
        return easeOutSine;
      case 15:
        return easeInOutSine;
      case 16:
        return easeInExpo;
      case 17:
        return easeOutExpo;
      case 18:
        return easeInOutExpo;
      case 19:
        return easeInCirc;
      case 20:
        return easeOutCirc;
      case 21:
        return easeInOutCirc;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case linear:
        return 0;
      case easeInQuad:
        return 1;
      case easeOutQuad:
        return 2;
      case easeInOutQuad:
        return 3;
      case easeInCubic:
        return 4;
      case easeOutCubic:
        return 5;
      case easeInOutCubic:
        return 6;
      case easeInQuart:
        return 7;
      case easeOutQuart:
        return 8;
      case easeInOutQuart:
        return 9;
      case easeInQuint:
        return 10;
      case easeOutQuint:
        return 11;
      case easeInOutQuint:
        return 12;
      case easeInSine:
        return 13;
      case easeOutSine:
        return 14;
      case easeInOutSine:
        return 15;
      case easeInExpo:
        return 16;
      case easeOutExpo:
        return 17;
      case easeInOutExpo:
        return 18;
      case easeInCirc:
        return 19;
      case easeOutCirc:
        return 20;
      case easeInOutCirc:
        return 21;
    }
  }
}

/// Describes the rotation of the device.
///
/// Used to match the field of view of the `SceneView` to the field of view of a
/// camera lens using the lens characteristics and orientation.
enum _ArcGISDeviceOrientation {
  /// The device is in portrait mode, with the device held upright and the home
  /// button on the bottom.
  portrait,

  /// The device is in landscape mode, with the device held sideways and the
  /// home button on the left side.
  landscapeLeft,

  /// The device is in portrait mode, with the device held upside down and the
  /// home button on the top.
  reversePortrait,

  /// The device is in landscape mode, with the device held sideways and the
  /// home button on the right side.
  landscapeRight;

  factory _ArcGISDeviceOrientation._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return portrait;
      case 1:
        return landscapeLeft;
      case 2:
        return reversePortrait;
      case 3:
        return landscapeRight;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case portrait:
        return 0;
      case landscapeLeft:
        return 1;
      case reversePortrait:
        return 2;
      case landscapeRight:
        return 3;
    }
  }
}

/// A user interface control that displays two-dimensional (2D) geographic
/// content defined by an [ArcGISMap].
///
/// An [ArcGISMapViewController] is a user interface that displays [ArcGISMap]
/// layers and graphics in 2D. It controls the area (extent) of the [ArcGISMap]
/// that is visible and supports user interactions such as pan and zoom. A map
/// view also provides access to the underlying layer data in a map.
///
/// To display an [ArcGISMap], add an [ArcGISMapViewController] control to your
/// app and assign the map to it. This loads the map and its content, such as a
/// [Basemap] and collection of operational layers, and displays this content on
/// screen.
///
/// User interactions such as pan, zoom, rotate, and identify or selection are
/// supported in the [ArcGISMapViewController] using touch, mouse, keyboard or
/// pen/pencil. If required, you can override keys, clicks, and gestures to
/// provide a specific user experience.
///
/// The visible area ([Viewpoint]) of the [ArcGISMapViewController] is defined
/// by the visible extent the map. To determine the current visible area or the
/// center point and scale of an [ArcGISMapViewController], call
/// [GeoViewController.getCurrentViewpoint]. Make sure that any user-initiated
/// or programmatic navigation is complete before getting the current
/// [Viewpoint] by calling [GeoViewController.isNavigating].
///
/// You can programmatically set the visible area by specifying a viewpoint. For
/// example, [ArcGISMapViewController.setViewpointGeometry] sets the visible
/// area to the extent of a provided geometry, and
/// [ArcGISMapViewController.setViewpointCenter] centers the map view at a given
/// point. Any geometries passed to these methods are automatically projected to
/// match the [SpatialReference] of the map view's [ArcGISMap], if required.
///
/// In an MVC architecture, the [ArcGISMapViewController] represents the View
/// tier. The Model tier is represented by the [ArcGISMap] object which can
/// provide a collection of operational layers and a [Basemap]. You can only set
/// one [ArcGISMap] per [ArcGISMapViewController], but you can swap the
/// [ArcGISMapViewController.arcGISMap] with another when the application is
/// running.
///
/// See
/// [Map view](https://developers.arcgis.com/documentation/mapping-apis-and-services/maps/maps-2d/#map-view)
/// for more information.
final class ArcGISMapViewController extends GeoViewController
    implements _CallbackReceiver {
  static ArcGISMapViewController? _fromHandle(RT_MapViewHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ArcGISMapViewController._withHandle(handle);
  }

  ArcGISMapViewController._withHandle(super.handle)
      : _backgroundGrid = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapView_getBackgroundGrid(
                handle, errorHandler);
          });
          return BackgroundGrid._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MapView_setBackgroundGrid(
                handle, value._handle, errorHandler);
          });
        }),
        _grid = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapView_getGrid(handle, errorHandler);
          });
          return Grid._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MapView_setGrid(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _locationDisplay = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapView_getLocationDisplay(
                handle, errorHandler);
          });
          return LocationDisplay._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MapView_setLocationDisplay(
                handle, value._handle, errorHandler);
          });
        }),
        _arcGISMap = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapView_getMap(handle, errorHandler);
          });
          return ArcGISMap._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MapView_setMap(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        __viewInsets = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_MapView_getViewInsets(handle, errorHandler);
          });
          return Insets._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_MapView_setViewInsets(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        super._withHandle() {
    final userData = _callbackRelay.register(this);
    _rotationChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MapView_setRotationChangedCallback(
              _handle,
              bindings.addresses.asyncMapViewRotationChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MapView_setRotationChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _scaleChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MapView_setScaleChangedCallback(
              _handle,
              bindings.addresses.asyncMapViewScaleChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_MapView_setScaleChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<double> _rotationChangedStreamController;

  /// Invokes the callback when rotation of the [ArcGISMapViewController]
  /// changes.
  Stream<double> get onRotationChanged =>
      _rotationChangedStreamController.stream;

  late final StreamController<double> _scaleChangedStreamController;

  /// Invokes the callback when the scale of the [ArcGISMapViewController]
  /// changes.
  Stream<double> get onScaleChanged => _scaleChangedStreamController.stream;

  /// Create a map view for displaying a map.
  ///
  /// Creates map view for displaying a map. You need to connect a map to the
  /// map view before anything is draw.
  ///
  /// If using [_PulseThread.useGeoView] you must call
  /// [GeoViewController._resume] to start the pulse thread which starts the
  /// drawing and [GeoViewController._pause] to stop the pulse thread. There can
  /// only be 1 set of function callbacks for each map view. The options are:
  /// * initialization_completed - Called when map view is ready for you to
  /// start interacting with it
  /// * draw_requested - Called when map view requires a
  /// [GeoViewController._draw] to be called
  /// * start_drawing - Called when map view starts a new draw phase. Multiple
  /// draws can occur after this call but this will not be called again until
  /// completed_draw is called.
  /// * completed_draw - Called when map view is finished drawing in a draw
  /// phase. Multiple draws can occur before this call.
  ///
  /// Parameters:
  /// - `width` — The width of the viewport.
  /// - `height` — The height of the viewport.
  /// - `screenScale` — The number of pixels per DIP (sometimes referred to as
  /// screen density or device pixel ratio).
  /// - `pulse` — Determines if the map view owns the pulse or not.
  factory ArcGISMapViewController._(
      {required int width,
      required int height,
      required double screenScale,
      required _PulseThread pulse}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_create(
          width, height, screenScale, pulse.coreValue, errorHandler);
    });
    return ArcGISMapViewController._withHandle(handle);
  }

  /// True if the [ArcGISMapViewController] is panned automatically when the
  /// magnifier gets near the edge of the [ArcGISMapViewController], otherwise
  /// false.
  ///
  /// The default value is true.
  bool get allowMagnifierToPanMap {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getAllowMagnifierToPanMap(
          _handle, errorHandler);
    });
  }

  set allowMagnifierToPanMap(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setAllowMagnifierToPanMap(
          _handle, value, errorHandler);
    });
  }

  /// The map that the [ArcGISMapViewController] is displaying.
  ///
  /// If you assign an [ArcGISMap] to an [ArcGISMapViewController], the map, its
  /// [Basemap], and collection of operational layers automatically start to
  /// load. When loading completes, the layers and basemap are rendered in the
  /// map view.
  ///
  /// To validate the content of a map before you display it, call
  /// [GeoModel.load] to load the [ArcGISMap] into your app before you assign it
  /// to an [ArcGISMapViewController].
  ArcGISMap? get arcGISMap => _arcGISMap.value;

  set arcGISMap(ArcGISMap? value) => _arcGISMap.value = value;

  final Memoized<ArcGISMap?> _arcGISMap;

  /// The background grid that an [ArcGISMap] is displayed on top of.
  ///
  /// [BackgroundGrid] defines the color and context grid displayed in the
  /// [ArcGISMapViewController]. If an [ArcGISMapViewController.arcGISMap] has
  /// been assigned, the [ArcGISMap] displays on top of this background grid.
  ///
  /// If the [ArcGISMap] contains transparent areas, the [BackgroundGrid] may be
  /// visible within the [ArcGISMap.maxExtent] and you may wish to define a
  /// [BackgroundGrid.backgroundColor] appropriate to your map's symbology. If
  /// an [ArcGISMap] has an [ArcGISMap.backgroundColor], the
  /// [ArcGISMapViewController.backgroundGrid] is ignored.
  ///
  /// The default [BackgroundGrid] color is gray with black grid lines.
  BackgroundGrid get backgroundGrid => _backgroundGrid.value;

  set backgroundGrid(BackgroundGrid value) => _backgroundGrid.value = value;

  final Memoized<BackgroundGrid> _backgroundGrid;

  /// A coordinate system grid to display on top of the
  /// [ArcGISMapViewController].
  ///
  /// The [Grid] is a collection of horizontal and vertical lines which can be
  /// rendered over the top of an [ArcGISMapViewController] to help show the
  /// location of the current [Viewpoint]. Supported grids include Military Grid
  /// Reference System ([MgrsGrid]), United States National Grid ([UsngGrid]),
  /// Universal Transverse Mercator ([UtmGrid]), and a grid of latitude and
  /// longitude lines ([LatitudeLongitudeGrid]). You can configure these grids
  /// by toggling their visibility and modifying their default layout and
  /// appearance. A grid will not display in the [ArcGISMapViewController] until
  /// an [ArcGISMapViewController.arcGISMap] has been loaded.
  ///
  /// The default value is null.
  Grid? get grid => _grid.value;

  set grid(Grid? value) => _grid.value = value;

  final Memoized<Grid?> _grid;

  /// The location display manages and renders the device's current location on
  /// an [ArcGISMapViewController] using a data source, such as a GPS sensor.
  ///
  /// The device location is displayed as a blue, round symbol that is
  /// automatically refreshed by regular updates from the
  /// [LocationDisplay.dataSource]. Although the [LocationDisplay.dataSource]
  /// uses the device's location data source by default, you can configure it to
  /// use data sources such as NMEA, route tracker, indoors, and simulated data
  /// sources. For more information, see [LocationDataSource].
  ///
  /// Once the [ArcGISMapViewController.arcGISMap] has been assigned and loaded,
  /// call [LocationDisplay.start] to initiate location updates from the
  /// [LocationDataSource].
  ///
  /// Use the [LocationDisplay.autoPanMode] enumerations to build navigation or
  /// compass style apps. For example, adopt
  /// [LocationDisplayAutoPanMode.navigation] to build an app that pans the
  /// [ArcGISMapViewController] so that the current location symbol is shown
  /// near the bottom of the screen and the [ArcGISMapViewController] is aligned
  /// with the direction of travel. You can also customize the symbols that
  /// display the device's location, its heading, the accuracy of the signal and
  /// the acquiring signal.
  LocationDisplay get locationDisplay => _locationDisplay.value;

  set locationDisplay(LocationDisplay value) => _locationDisplay.value = value;

  final Memoized<LocationDisplay> _locationDisplay;

  /// True if the magnifier is enabled, otherwise false.
  ///
  /// This method can't be called until an [ArcGISMap] has been assigned to the
  /// [ArcGISMapViewController]. If called before the map view is ready or the
  /// initialization of default magnifier fails, an
  /// [ArcGISExceptionType.commonIllegalState] exception will occur.
  bool get magnifierEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getMagnifierEnabled(_handle, errorHandler);
    });
  }

  /// The magnifier zoom factor (2 by default)
  ///
  /// The zoom factor must be between 1 and 10 else an
  /// [ArcGISExceptionType.commonInvalidArgument] exception will occur.
  double get _magnifierZoomFactor {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getMagnifierZoomFactor(
          _handle, errorHandler);
    });
  }

  set _magnifierZoomFactor(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setMagnifierZoomFactor(
          _handle, value, errorHandler);
    });
  }

  /// The rotation angle of the [ArcGISMap] in degrees from its north-south
  /// direction.
  ///
  /// If the map has been rotated in a clockwise direction the rotation value is
  /// negative. If it has been rotated in a counterclockwise direction the value
  /// is positive. For example, if the rotation value is -90 the top of the
  /// [ArcGISMapViewController] will display an eastern part of the [ArcGISMap].
  ///
  /// Users can interactively rotate the map using the map view's keyboard,
  /// mouse or touch rotation gestures. You can rotate the map programmatically
  /// using methods that set the [Viewpoint], such as
  /// [ArcGISMapViewController.setViewpointRotation] or
  /// [GeoViewController.setViewpoint].
  double get rotation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getRotation(_handle, errorHandler);
    });
  }

  /// The scale of the [ArcGISMapViewController].
  ///
  /// The scale represents the relationship between a distance in the
  /// [ArcGISMapViewController] (on the screen) and the corresponding distance
  /// on the ground. For example, a scale of 100,000 indicates that one
  /// centimeter on the [ArcGISMapViewController] display equates to one
  /// kilometer on the ground.
  ///
  /// Users can interactively change the scale using the map view's zooming
  /// gestures. You can set the scale programmatically using methods that set
  /// the [Viewpoint], such as [ArcGISMapViewController.setViewpointScale].
  ///
  /// The value is NAN until the load status of the [ArcGISMap] is
  /// [LoadStatus.loaded] and the draw status of the [GeoViewController] is
  /// [DrawStatus.completed].
  double get scale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getScale(_handle, errorHandler);
    });
  }

  /// The size of each device-independent pixel (DIP) in map units.
  ///
  /// The represents the spatial resolution of the [ArcGISMapViewController].
  /// The value changes according to the [ArcGISMapViewController.scale] (it
  /// decreases as the user zooms in, for example).
  ///
  /// The value is NAN until the load status of the [ArcGISMap] is
  /// [LoadStatus.loaded] and the draw status of the [GeoViewController] is
  /// [DrawStatus.completed].
  double get unitsPerDip {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getUnitsPerDIP(_handle, errorHandler);
    });
  }

  /// The insets on the [ArcGISMapViewController] in device-independent pixels
  /// (DIP)
  ///
  /// [Insets] define the edges of the [ArcGISMapViewController] that may be
  /// obscured by other UI elements.
  Insets? get _viewInsets => __viewInsets.value;

  set _viewInsets(Insets? value) => __viewInsets.value = value;

  final Memoized<Insets?> __viewInsets;

  /// The map view's visible area.
  ///
  /// The visible area represents the portion of the [ArcGISMap] that is visible
  /// in the [ArcGISMapViewController]. When a new [ArcGISMap] is assigned to an
  /// [ArcGISMapViewController], the default value of the visible area is set
  /// from the [GeoModel.initialViewpoint].
  ///
  /// Users can interactively navigate the map to change the visible area, or
  /// you can programmatically change this using methods that set the
  /// [Viewpoint], such as [GeoViewController.setViewpoint].
  ///
  /// The visible area polygon always contains one ring with four vertices, each
  /// representing a corner of the map. It is a [Polygon] and not an [Envelope]
  /// because the map may be rotated and each corner of the map may contain
  /// unique x-y coordinates. Note that the visible area excludes the portion of
  /// the map obscured by the map view's attribution bar. As a result, the edges
  /// and center of the visible area may not coincide with the bounds and center
  /// of the [ArcGISMapViewController].
  Polygon? get visibleArea {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getVisibleArea(_handle, errorHandler);
    });
    return Polygon._fromHandle(objectHandle);
  }

  /// Indicates whether continuous panning across the international date line is
  /// enabled.
  ///
  /// By default, the [ArcGISMapViewController] attempts to wrap the [ArcGISMap]
  /// across the international date line for a continuous panning user
  /// experience. The eastern and western hemispheres wrap to form a continuous
  /// map, giving the impression that the map is endless.
  ///
  /// You can apply wraparound to an [ArcGISMapViewController] if certain
  /// conditions are met, as described in [WrapAroundMode.enabledWhenSupported].
  /// To remove the wraparound behavior set the value to
  /// [WrapAroundMode.disabled].
  ///
  /// If wraparound is enabled, geometries returned from
  /// [ArcGISMapViewController.visibleArea] may have coordinates outside the
  /// domain of the spatial reference of the map. Before using such geometries
  /// to perform spatial queries, address finding, or as feature geometries in a
  /// geodatabase, normalize them to lie within the spatial reference domain
  /// using [GeometryEngine.normalizeCentralMeridian].
  ///
  /// The default value is [WrapAroundMode.enabledWhenSupported].
  WrapAroundMode get wrapAroundMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_getWrapAroundMode(_handle, errorHandler);
    });
    return WrapAroundMode._fromCoreValue(coreValue);
  }

  set wrapAroundMode(WrapAroundMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setWrapAroundMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  final _magnifierEnabledChangedStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get _onMagnifierEnabledChanged =>
      _magnifierEnabledChangedStreamController.stream;

  set magnifierEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setMagnifierEnabled(_handle, value, errorHandler);
    });
    _magnifierEnabledChangedStreamController.add(value);
  }

  final _interactionOptions = ArcGISMapViewInteractionOptions();

  /// Options for controlling how user interactions behave.
  ArcGISMapViewInteractionOptions get interactionOptions => _interactionOptions;

  /// Check if the configured insets are still valid after resizing the view.
  ///
  /// Return Value: True if the insets are smaller than the current view size;
  /// false if they are equal to or larger.
  bool _areInsetsValidAfterResize() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_areInsetsValidAfterResize(
          _handle, errorHandler);
    });
  }

  /// Sets the map view magnifier invisible.
  ///
  /// This method can't be called until a map has been set to the map view by
  /// calling [ArcGISMapViewController.arcGISMap]. If called before the map view
  /// is ready, nothing will occur.
  void _hideMagnifier() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_hideMagnifier(_handle, errorHandler);
    });
  }

  /// For pan dragging around the map, non animated, relative in screen
  /// coordinates.
  ///
  /// Parameters:
  /// - `deltaX` — The delta x coordinate.
  /// - `deltaY` — The delta y coordinate.
  void _interactionDrag({required double deltaX, required double deltaY}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_interactionDrag(
          _handle, deltaX, deltaY, errorHandler);
    });
  }

  /// For pan fling gesture.
  ///
  /// Animated, relative pan animation.
  ///
  /// Parameters:
  /// - `deltaX` — The delta x coordinate.
  /// - `deltaY` — The delta y coordinate.
  void _interactionFlingAnimated(
      {required double deltaX, required double deltaY}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_interactionFlingAnimated(
          _handle, deltaX, deltaY, errorHandler);
    });
  }

  /// For touch rotating.
  ///
  /// Parameters:
  /// - `angleDegrees` — an angular value, in degrees.
  /// - `screenPoint` — The screen point.
  void _interactionRotate(
      {required double angleDegrees, required Offset screenPoint}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_interactionRotate(
          _handle, angleDegrees, coreScreenPoint.ref, errorHandler);
    });
  }

  /// Use location display anchor.
  ///
  /// Used to determine if animation should be stopped when using touch events.
  ///
  /// Return Value: true if anchor should be used, false otherwise.
  bool _interactionUseLocationDisplayAnchor() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_interactionUseLocationDisplayAnchor(
          _handle, errorHandler);
    });
  }

  /// For pinch zooming.
  ///
  /// For pinch zooming, this is a relative operation, zoom the map view by a
  /// relative factor, not absolute. Non-animated.
  ///
  /// Parameters:
  /// - `scale` — A scale to zoom to.
  /// - `screenPoint` — The screen point.
  void _interactionZoomToScale(
      {required double scale, required Offset screenPoint}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_interactionZoomToScale(
          _handle, scale, coreScreenPoint.ref, errorHandler);
    });
  }

  /// Converts a location in map coordinates to screen coordinates relative to
  /// the upper-left corner of the map view.
  ///
  /// The screen coordinates are in device-independent pixels (DIP) relative to
  /// the upper-left corner at position 0,0. The screen coordinates returned may
  /// lie outside the current map view bounds. For example, if a map of the
  /// world is zoomed in to the extent of Africa, a map location within South
  /// America would result in a screen coordinate that is outside the screens
  /// bounds.
  ///
  /// If the [WrapAroundMode] is enabled on the map view, this method returns
  /// the closest screen location matching the specified map location. If the
  /// map coordinate is in the visible area the method will return that screen
  /// coordinate, otherwise it will return the screen coordinate from the frame
  /// closest to the visible area.
  ///
  /// To call this method, assign a map to the map view, ensure that it is
  /// loaded and the draw status is [DrawStatus.completed].
  ///
  /// Parameters:
  /// - `arcGISMapPoint` — A location defined within the spatial reference of
  /// the map view.
  ///
  /// Return Value: An [Offset] for the screen in pixels. NAN for x and y if an
  /// error occurs.
  Offset locationToScreen({required ArcGISPoint arcGISMapPoint}) {
    final coordinate = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_locationToScreen(
          _handle, arcGISMapPoint._handle, errorHandler);
    });
    return coordinate.toOffset();
  }

  /// Converts screen coordinates relative to the upper-left corner of the map
  /// view to a location in map coordinates.
  ///
  /// To call this method, assign a map to the map view, ensure that it is
  /// loaded and the draw status is [DrawStatus.completed].
  ///
  /// Parameters:
  /// - `screen` — The screen coordinate, in pixels.
  ///
  /// Return Value: A point object. Null is returned if the map view's spatial
  /// reference is not yet known, for example, before the viewed map is loaded.
  ArcGISPoint? screenToLocation({required Offset screen}) {
    final coreScreen = screen.toArcGIS();
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_screenToLocation(
          _handle, coreScreen.ref, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Sets the mask and overlay images for the magnifier.
  ///
  /// Parameters:
  /// - `mask` — Image to be used for the mask.
  /// - `overlay` — Image to be used for the overlay.
  void _setMagnifierImages(
      {required ArcGISImage mask, required ArcGISImage overlay}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setMagnifierImages(
          _handle, mask._handle, overlay._handle, errorHandler);
    });
  }

  /// Sets the mask and overlay images for the magnifier and specifies their
  /// size in DIPs.
  ///
  /// The mask and overlay images will be scaled to fit the sizes specified by
  /// height and width. Passing 0 in for height or width indicates that no
  /// scaling should occur.
  ///
  /// Parameters:
  /// - `mask` — Image to be used for the mask.
  /// - `overlay` — Image to be used for the overlay.
  /// - `height` — The height of the image in DIPs. 0 indicates that no scaling
  /// should occur.
  /// - `width` — The width of the image in DIPs. 0 indicates that no scaling
  /// should occur.
  void _setMagnifierImagesWithSize(
      {required ArcGISImage mask,
      required ArcGISImage overlay,
      required double height,
      required double width}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_setMagnifierImagesWithSize(
          _handle, mask._handle, overlay._handle, height, width, errorHandler);
    });
  }

  /// Centers the map view at the provided center point and zooms to the given
  /// scale.
  ///
  /// Parameters:
  /// - `center` — The location at which to center the map view.
  /// - `scale` — The scale at which the map is displayed.
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointCenter(ArcGISPoint center, {double? scale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointCenterCombined(
          _handle, center._handle, scale, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointCenter]. See that method for more
  /// information.
  CancelableOperation<bool> setViewpointCenterCancelable(ArcGISPoint center,
      {double? scale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointCenterCombined(
          _handle, center._handle, scale, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Zooms and pans the map view to the extent of the provided geometry with
  /// additional padding.
  ///
  /// Parameters:
  /// - `boundingGeometry` — The geometry to zoom to.
  /// - `paddingInDiPs` — The minimum amount of padding around the bounding
  /// geometry in pixels.
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointGeometry(Geometry boundingGeometry,
      {double? paddingInDiPs}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointGeometryCombined(
          _handle, boundingGeometry._handle, paddingInDiPs, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointGeometry]. See that method for more
  /// information.
  CancelableOperation<bool> setViewpointGeometryCancelable(
      Geometry boundingGeometry,
      {double? paddingInDiPs}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointGeometryCombined(
          _handle, boundingGeometry._handle, paddingInDiPs, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Rotates the map view to the provided angle.
  ///
  /// The angle will be normalized between 0 and 360 degrees.
  ///
  /// Parameters:
  /// - `angleDegrees` — The degrees to rotate to (in counterclockwise
  /// direction).
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointRotation({required double angleDegrees}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointRotationAsync(
          _handle, angleDegrees, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointRotation]. See that method for more
  /// information.
  CancelableOperation<bool> setViewpointRotationCancelable(
      {required double angleDegrees}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointRotationAsync(
          _handle, angleDegrees, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Zooms the map view to the provided scale around its current center point.
  ///
  /// Parameters:
  /// - `scale` — The scale to zoom to. For example, 50000 is a scale of
  /// 1:50,000.
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointScale({required double scale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointScaleAsync(
          _handle, scale, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointScale]. See that method for more
  /// information.
  CancelableOperation<bool> setViewpointScaleCancelable(
      {required double scale}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointScaleAsync(
          _handle, scale, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Animates the display to the new viewpoint using the provided animation
  /// curve. The [AnimationCurve] defines the animation easing function.
  ///
  /// Parameters:
  /// - `viewpoint` — The visible area to display in the view.
  /// - `durationSeconds` — The time for the transition animation to complete,
  /// in seconds.
  /// - `curve` — The type of animation curve.
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointWithDurationAndCurve(
      {required Viewpoint viewpoint,
      required double durationSeconds,
      required AnimationCurve curve}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointWithDurationAndCurveAsync(
          _handle,
          viewpoint._handle,
          durationSeconds,
          curve.coreValue,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointWithDurationAndCurve]. See that method
  /// for more information.
  CancelableOperation<bool> setViewpointWithDurationAndCurveCancelable(
      {required Viewpoint viewpoint,
      required double durationSeconds,
      required AnimationCurve curve}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MapView_setViewpointWithDurationAndCurveAsync(
          _handle,
          viewpoint._handle,
          durationSeconds,
          curve.coreValue,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Displays the map view's magnifier at the given location.
  ///
  /// This method can't be called until a map has been set to the map view by
  /// calling [ArcGISMapViewController.arcGISMap]. If called before the map view
  /// is ready, nothing will occur.
  ///
  /// Parameters:
  /// - `coordinate` — screen coordinate.
  void _showMagnifierAt({required Offset coordinate}) {
    final coreCoordinate = coordinate.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_showMagnifierAt(
          _handle, coreCoordinate.ref, errorHandler);
    });
  }

  /// Displays the map view's magnifier at the given location with the offset.
  ///
  /// This method can't be called until a map has been set to the map view by
  /// calling [ArcGISMapViewController.arcGISMap]. If called before the map view
  /// is ready, nothing will occur.
  ///
  /// Parameters:
  /// - `coordinate` — screen coordinate.
  void _showMagnifierWithOffsetAt({required Offset coordinate}) {
    final coreCoordinate = coordinate.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_showMagnifierWithOffsetAt(
          _handle, coreCoordinate.ref, errorHandler);
    });
  }

  /// Stops all animations that are currently active.
  void _stopAnimations() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_stopAnimations(_handle, errorHandler);
    });
  }

  /// Stops pan animations that are currently active.
  void _stopPanAnimations() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MapView_stopPanAnimations(_handle, errorHandler);
    });
  }

  /// This function cleans up properties of this controller before garbage
  /// collection happens.
  @override
  void dispose() {
    arcGISMap = null;

    _backgroundGrid.invalidateCache();
    _arcGISMap.invalidateCache();
    _locationDisplay.invalidateCache();
    __viewInsets.invalidateCache();

    super.dispose();
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeMapViewRotationChangedEvent:
        _rotationChangedStreamController.add(rotation);
      case AsyncType.asyncTypeMapViewScaleChangedEvent:
        _scaleChangedStreamController.add(scale);
      default:
        super._processCallback(message);
    }
  }
}

/// A background grid defines the default color and context grid for display
/// behind a map or scene surface.
///
/// The background grid determines what an empty [ArcGISMapViewController] or
/// scene `Surface` looks like. An instance of this class can be used to set a
/// default backdrop that an [ArcGISMap] or `ArcGISScene` will display on top
/// of.
final class BackgroundGrid implements ffi.Finalizable {
  final RT_BackgroundGridHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.BackgroundGrid_destroy.cast());

  static BackgroundGrid? _fromHandle(RT_BackgroundGridHandle handle) {
    if (handle == ffi.nullptr) return null;
    return BackgroundGrid._withHandle(handle);
  }

  BackgroundGrid._withHandle(RT_BackgroundGridHandle handle)
      : _backgroundColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_BackgroundGrid_getColor(handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_BackgroundGrid_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _lineColor = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_BackgroundGrid_getGridLineColor(
                handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_BackgroundGrid_setGridLineColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.BackgroundGrid_created(_handle);
    }
  }

  /// Creates a background grid with the specified properties.
  ///
  /// Parameters:
  /// - `backgroundColor` — The color of the background.
  /// - `lineColor` — The color of the grid lines.
  /// - `lineWidth` — The width of the grid lines in device-independent pixels
  /// (DIP).
  /// - `size` — The size of the grid squares in device-independent pixels
  /// (DIP).
  factory BackgroundGrid(
      {Color backgroundColor = const Color(0xFFC0C0C0),
      Color lineColor = Colors.black,
      double lineWidth = 0.1,
      double size = 20}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreBackgroundColor = backgroundColor.toArcGIS();
    final coreLineColor = lineColor.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BackgroundGrid_createWith(
          coreBackgroundColor._handle,
          coreLineColor._handle,
          lineWidth,
          size,
          errorHandler);
    });
    final BackgroundGrid object = BackgroundGrid._withHandle(handle);
    object._backgroundColor.cache(backgroundColor);
    object._lineColor.cache(lineColor);
    return object;
  }

  /// The background color of the grid.
  ///
  /// The default value is gray - RGBA(192,192,192,255).
  Color get backgroundColor => _backgroundColor.value;

  set backgroundColor(Color value) => _backgroundColor.value = value;

  final Memoized<Color> _backgroundColor;

  /// True if grid lines are visible on the [BackgroundGrid.backgroundColor],
  /// false otherwise.
  ///
  /// In the context of [ArcGISMapViewController], this value indicates if the
  /// [BackgroundGrid.lineColor] is visible. In the context of `SceneView`, this
  /// value indicates if both the [BackgroundGrid.backgroundColor] and the
  /// [BackgroundGrid.lineColor] are visible. The default value is true.
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BackgroundGrid_getIsVisible(_handle, errorHandler);
    });
  }

  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_BackgroundGrid_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// The color of the grid lines.
  ///
  /// The default value is black - RGBA(0,0,0,255).
  Color get lineColor => _lineColor.value;

  set lineColor(Color value) => _lineColor.value = value;

  final Memoized<Color> _lineColor;

  /// The width of the grid lines in device-independent pixels (DIP).
  ///
  /// This value must be greater than or equal to 0. Setting the grid line width
  /// to 0 will make grid lines invisible. The default value is 0.1.
  double get lineWidth {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BackgroundGrid_getGridLineWidth(
          _handle, errorHandler);
    });
  }

  set lineWidth(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_BackgroundGrid_setGridLineWidth(
          _handle, value, errorHandler);
    });
  }

  /// The size of each grid square in device-independent pixels (DIP).
  ///
  /// The default value is 20 x 20 pixels.
  double get size {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_BackgroundGrid_getGridSize(_handle, errorHandler);
    });
  }

  set size(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_BackgroundGrid_setGridSize(_handle, value, errorHandler);
    });
  }
}

/// A simple object for a 2D coordinate.
///
/// This should map to native types for performance improvements. This should
/// not be exposed directly to the user.
final class _Coordinate implements ffi.Finalizable {
  final _struct = malloc<RT_Coordinate2D>();

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.nativeFree.cast());

  _Coordinate({required double x, required double y}) {
    _nativeFinalizer.attach(this, _struct.cast());
    _struct.ref.x = x;
    _struct.ref.y = y;
  }

  RT_Coordinate2D get ref => _struct.ref;
}

/// The graphics context for the GPU.
///
/// You must create this and pass it to the map view.
final class _Device implements ffi.Finalizable {
  final RT_DeviceHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Device_destroy.cast());

  static _Device? _fromHandle(RT_DeviceHandle handle) {
    if (handle == ffi.nullptr) return null;
    return _Device._withHandle(handle);
  }

  _Device._withHandle(RT_DeviceHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Device_created(_handle);
    }
  }

  /// Creates a Metal device for drawing.
  ///
  /// You must have a valid MTKView, MTLDevice and MTLCommandQueue and be on the
  /// main thread to create this. When the device is used you must be on the UI
  /// thread. You should make sure \[MTKView currentRenderPassDescriptor]
  /// returning a valid MTKRenderPassDescriptor when the metal device is being
  /// used.
  ///
  /// Parameters:
  /// - `arcGISMapDevice` — A MTLDevice interface -
  /// https://developer.apple.com/documentation/metal/mtldevice?language=objc.
  /// - `metalQueue` — A MTLCommandQueue interface -
  /// https://developer.apple.com/documentation/metal/mtlcommandqueue?language=objc.
  /// - `metalSurface` — A MTKView interface -
  /// https://developer.apple.com/documentation/metalkit/mtkview?language=objc.
  factory _Device.metal(
      {required ffi.Pointer<ffi.Void> arcGISMapDevice,
      required ffi.Pointer<ffi.Void> metalQueue,
      required ffi.Pointer<ffi.Void> metalSurface}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Device_createMetal(
          arcGISMapDevice, metalQueue, metalSurface, errorHandler);
    });
    return _Device._withHandle(handle);
  }

  /// Creates a Metal device for drawing.
  ///
  /// You must have a valid callback for querying a MTLRenderPassDescriptor,
  /// MTLDevice and MTLCommandQueue and be on the main thread to create this.
  /// When the device is used you must be on the UI thread. The callback must
  /// return a valid MTLRenderPassDescriptor.
  ///
  /// Parameters:
  /// - `arcGISMapDevice` — A MTLDevice interface -
  /// https://developer.apple.com/documentation/metal/mtldevice?language=objc.
  /// - `metalQueue` — A MTLCommandQueue interface -
  /// https://developer.apple.com/documentation/metal/mtlcommandqueue?language=objc.
  /// - `metalSurfaceCallback` — A callback for querying a
  /// MTLRenderPassDescriptor -
  /// https://developer.apple.com/documentation/metal/mtlrenderpassdescriptor?language=objc.
  factory _Device.metalWithCallback(
      {required ffi.Pointer<ffi.Void> arcGISMapDevice,
      required ffi.Pointer<ffi.Void> metalQueue,
      required ffi.Pointer<ffi.Void> metalSurfaceCallback}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Device_createMetalWithCallback(
          arcGISMapDevice, metalQueue, metalSurfaceCallback, errorHandler);
    });
    return _Device._withHandle(handle);
  }

  /// Creates an OpenGL device for drawing.
  ///
  /// You must have a valid OpenGL context and be on the same thread as the
  /// OpenGL context to create this. When the device is used you must be on the
  /// same thread as the OpenGL context.
  factory _Device.ogl() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Device_createOGL(errorHandler);
    });
    return _Device._withHandle(handle);
  }
}

/// The status of drawing in the [GeoViewController].
///
/// Use this status to determine whether the content of a view is still drawing
/// or drawing is completed. The drawing state of a [GeoViewController] can
/// either be [DrawStatus.inProgress] or [DrawStatus.completed].
///
/// For example, when using [GeoViewController.exportImage] to take a screen
/// capture of the view's visible area, you can use the draw status to determine
/// whether the [GeoViewController] content has been rendered.
///
/// If you need to ensure that an individual layer has loaded and is visible,
/// examine the [LayerViewState] returned by the
/// [GeoViewController.getLayerViewState] method.
enum DrawStatus {
  /// Drawing of the [GeoViewController] content is in progress.
  inProgress,

  /// Drawing of the [GeoViewController] content is complete.
  completed;

  factory DrawStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return inProgress;
      case 1:
        return completed;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case inProgress:
        return 0;
      case completed:
        return 1;
    }
  }
}

/// A base class for all views that can display geographic content.
///
/// Subclasses can display the content in either 2D ([ArcGISMapViewController])
/// or 3D (`SceneView`). In an MVC architecture, this class and its subclasses
/// represent the View tier. The Model tier is represented by [GeoModel], which
/// supplies the geographic content as a map ([ArcGISMap]) or a scene
/// (`ArcGISScene`).
///
/// [GeoViewController] contains all the common operations and events that apply
/// to displaying and working with maps and scenes. For example, you can change
/// the viewable area by setting a [Viewpoint], work with graphics in the
/// [GraphicsOverlay], and identify a [GeoElement] that displays in the view.
final class GeoViewController implements _CallbackReceiver, ffi.Finalizable {
  final RT_GeoViewHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.GeoView_destroy.cast());

  static GeoViewController? _fromHandle(RT_GeoViewHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (GeoViewController._objectTypeOf(handle)) {
      case _GeoViewType.arcGISMapView:
        return ArcGISMapViewController._withHandle(handle);
      case _GeoViewType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        logger.w(
            'An object of unsupported type is being treated as GeoViewController');
        return GeoViewController._withHandle(handle);
    }
  }

  static _GeoViewType _objectTypeOf(RT_GeoViewHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getObjectType(handle, errorHandler);
    });
    return _GeoViewType._fromCoreValue(coreValue);
  }

  _GeoViewType get _objectType => GeoViewController._objectTypeOf(_handle);

  GeoViewController._withHandle(RT_GeoViewHandle handle)
      : _graphicsOverlays = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoView_getGraphicsOverlays(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _labeling = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoView_getLabeling(handle, errorHandler);
          });
          return ViewLabelProperties._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeoView_setLabeling(
                handle, value._handle, errorHandler);
          });
        }),
        _selectionProperties = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GeoView_getSelectionProperties(
                handle, errorHandler);
          });
          return SelectionProperties._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GeoView_setSelectionProperties(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GeoView_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _attributionChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setAttributionChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewAttributionChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setAttributionChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _drawRequestedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setDrawRequestedCallback(
              _handle,
              bindings.addresses.asyncGeoViewDrawRequestedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setDrawRequestedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _drawStatusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setDrawStatusChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewDrawStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setDrawStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _layerViewStateChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setLayerViewStateChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewLayerViewStateChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setLayerViewStateChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _navigationChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setNavigationChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewNavigationChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setNavigationChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _spatialReferenceChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setSpatialReferenceChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewSpatialReferenceChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setSpatialReferenceChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _timeExtentChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setTimeExtentChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewTimeExtentChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setTimeExtentChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _viewpointChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setViewpointChangedCallback(
              _handle,
              bindings.addresses.asyncGeoViewViewpointChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_GeoView_setViewpointChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<String> _attributionChangedStreamController;

  /// Invokes the callback when the attribution text of the [GeoViewController]
  /// changes.
  Stream<String> get onAttributionChanged =>
      _attributionChangedStreamController.stream;

  late final StreamController<void> _drawRequestedStreamController;

  /// Called when the geo view requires a draw.
  Stream<void> get _onDrawRequested => _drawRequestedStreamController.stream;

  late final StreamController<DrawStatus> _drawStatusChangedStreamController;

  /// Invokes the callback when the draw status of the [GeoViewController]
  /// changes.
  Stream<DrawStatus> get onDrawStatusChanged =>
      _drawStatusChangedStreamController.stream;

  late final StreamController<({Layer layer, LayerViewState layerViewState})>
      _layerViewStateChangedStreamController;

  /// Invokes the callback when the layer view state of any layer in the
  /// [GeoViewController] changes.
  Stream<({Layer layer, LayerViewState layerViewState})>
      get onLayerViewStateChanged =>
          _layerViewStateChangedStreamController.stream;

  late final StreamController<bool> _navigationChangedStreamController;

  /// Invokes the callback when the navigation state of the [GeoViewController]
  /// changes.
  Stream<bool> get onNavigationChanged =>
      _navigationChangedStreamController.stream;

  late final StreamController<SpatialReference?>
      _spatialReferenceChangedStreamController;

  /// Invokes the callback when the spatial reference of the [GeoViewController]
  /// changes.
  Stream<SpatialReference?> get onSpatialReferenceChanged =>
      _spatialReferenceChangedStreamController.stream;

  late final StreamController<TimeExtent?> _timeExtentChangedStreamController;

  /// Invokes the callback when the time extent of the [GeoViewController]
  /// changes.
  Stream<TimeExtent?> get onTimeExtentChanged =>
      _timeExtentChangedStreamController.stream;

  late final StreamController<void> _viewpointChangedStreamController;

  /// Invokes the callback when the viewpoint of the [GeoViewController] has
  /// changed.
  Stream<void> get onViewpointChanged =>
      _viewpointChangedStreamController.stream;

  /// The attribution text for the data that is currently displayed in the
  /// [GeoViewController].
  ///
  /// Attribution text includes data providers or sources for layers and
  /// copyright text. The full attribution text is concatenated into a single
  /// string that is displayed in a banner along the bottom edge of the view.
  String get attributionText {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getAttributionText(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The current drawing status of the content displayed in the
  /// [GeoViewController].
  ///
  /// New content is drawn every time a user pans or zooms the view, or the app
  /// programmatically changes its visible area. There is a short delay before
  /// this drawing phase completes. You can use [GeoViewController.drawStatus]
  /// to detect whether this drawing phase is in progress or has completed. For
  /// example, you may want to take a screen capture of a view's visible area
  /// ([GeoViewController.exportImage]) when drawing is completed.
  DrawStatus get drawStatus {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getDrawStatus(_handle, errorHandler);
    });
    return DrawStatus._fromCoreValue(coreValue);
  }

  /// A collection of [GraphicsOverlay] objects used to display graphics on top
  /// of the view's content.
  ///
  /// To display graphics in the [GeoViewController], add the graphics to a
  /// [GraphicsOverlay] and add the [GraphicsOverlay] to this collection. The
  /// order of the [GraphicsOverlay] objects in the collection reflects their
  /// display order in the view. The first [GraphicsOverlay] in the collection
  /// is drawn beneath all other graphic overlays.
  ///
  /// This collection may be empty but is never null. You can't add duplicate
  /// [GraphicsOverlay] objects to the collection or use this graphics overlay
  /// collection in another [GeoViewController].
  ///
  /// Use methods such as [GeoViewController.identifyGraphicsOverlays], to
  /// identify graphics in this collection.
  List<GraphicsOverlay> get graphicsOverlays => _graphicsOverlays.value;

  final Memoized<_MutableArrayList<GraphicsOverlay>> _graphicsOverlays;

  /// Right geo view get height.
  int get _height {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getHeight(_handle, errorHandler);
    });
  }

  /// True if attribution text is visible in the [GeoViewController], false
  /// otherwise.
  bool get isAttributionTextVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getIsAttributionTextVisible(
          _handle, errorHandler);
    });
  }

  /// True if the user is currently interacting with the view.
  bool get _isInteracting {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getIsInteracting(_handle, errorHandler);
    });
  }

  set _isInteracting(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setIsInteracting(_handle, value, errorHandler);
    });
  }

  /// True if the [GeoViewController] is animating a viewpoint change or a
  /// navigation gesture is in progress, otherwise false.
  ///
  /// Indicates if the [Viewpoint] of a [GeoViewController] is currently
  /// changing. This can be due to a programmatic animated change to the
  /// [Viewpoint], or user interaction with the view, such as panning and
  /// zooming.
  bool get isNavigating {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getIsNavigating(_handle, errorHandler);
    });
  }

  /// True if continuous panning across the international date line is enabled
  /// in the [GeoViewController], false otherwise.
  ///
  /// By default, a [GeoViewController] attempts to wrap the [ArcGISMap] or
  /// `ArcGISScene` across the international date line for a continuous panning
  /// user experience. The eastern and western hemispheres wrap to form a
  /// continuous map, giving the impression that the map is endless.
  ///
  /// Wraparound display is always enabled for a `SceneView`.
  ///
  /// To disable wraparound behavior for an [ArcGISMapViewController] (or to
  /// reenable it), you can set the [ArcGISMapViewController.wrapAroundMode] to
  /// the appropriate value. Wraparound can only be applied to an
  /// [ArcGISMapViewController] if certain conditions are met, as described in
  /// [WrapAroundMode.enabledWhenSupported].
  ///
  /// If wraparound is enabled, geometries returned from
  /// [ArcGISMapViewController.visibleArea] may have coordinates outside the
  /// domain of the spatial reference of the map. Before using such geometries
  /// to perform spatial queries, address finding, or as feature geometries in a
  /// geodatabase, you must normalize them to lie within the spatial reference
  /// domain using [GeometryEngine.normalizeCentralMeridian].
  bool get isWrapAroundEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getIsWrapAroundEnabled(
          _handle, errorHandler);
    });
  }

  /// The view label properties.
  ///
  /// This property determines whether labels are created, added and animated
  /// for all of the layers and graphic overlays in the view.
  ///
  /// For example, you can prevent labels displaying in the [GeoViewController]
  /// if you set [ViewLabelProperties.isLabelingEnabled] to false. This
  /// overrides the labelsEnabled properties set on all layers and graphic
  /// overlays in the view. The default value of
  /// [ViewLabelProperties.isLabelingEnabled] is true.
  ViewLabelProperties get labeling => _labeling.value;

  set labeling(ViewLabelProperties value) => _labeling.value = value;

  final Memoized<ViewLabelProperties> _labeling;

  /// The selection properties for all graphic overlays and selectable layers
  /// within the [GeoViewController].
  ///
  /// You can use [SelectionProperties] to define the selection color for all
  /// graphic overlays and selectable layers within the [GeoViewController]. The
  /// default selection color is cyan.
  SelectionProperties get selectionProperties => _selectionProperties.value;

  set selectionProperties(SelectionProperties value) =>
      _selectionProperties.value = value;

  final Memoized<SelectionProperties> _selectionProperties;

  /// The spatial reference defines the coordinate system used by the map or
  /// scene in the [GeoViewController].
  ///
  /// The [SpatialReference] is used to relate map coordinates to locations in
  /// the real world. This property is available when the view's map or scene
  /// has been loaded.
  ///
  /// The value is null until the [GeoModel.loadStatus] is loaded and the
  /// [GeoViewController.drawStatus] is complete.
  SpatialReference? get spatialReference {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getSpatialReference(_handle, errorHandler);
    });
    return SpatialReference._fromHandle(objectHandle);
  }

  /// The current [TimeExtent] of the [GeoViewController].
  ///
  /// The [TimeExtent] defines how time-enabled data is displayed in the
  /// [GeoViewController]. Participating layers filter their data to only show
  /// data within the time extent set on the [GeoViewController] (see
  /// [TimeAware] for details). The range of the time extent includes the start
  /// and end values. For example, a feature at 10/24/2016 would be included in
  /// a time extent defined as 10/24/2016 - 11/14/2016). Time filtering is not
  /// enabled until a non-null time extent is set on the [GeoViewController].
  /// When the time extent is null on the [GeoViewController], no time filtering
  /// is applied and all content is rendered.
  TimeExtent? get timeExtent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getTimeExtent(_handle, errorHandler);
    });
    return TimeExtent._fromHandle(objectHandle);
  }

  set timeExtent(TimeExtent? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setTimeExtent(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The width of the geo view, in pixels.
  int get _width {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getWidth(_handle, errorHandler);
    });
  }

  final _isAttributionTextVisibleChangedStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get _onIsAttributionTextVisibleChanged =>
      _isAttributionTextVisibleChangedStreamController.stream;

  set isAttributionTextVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setIsAttributionTextVisible(
          _handle, value, errorHandler);
    });
    _isAttributionTextVisibleChangedStreamController.add(value);
  }

  /// Call in response to a draw requested or to force a redraw of the geo view.
  ///
  /// Parameters:
  /// - `device` — A device object.
  void _draw({required _Device device}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_draw(_handle, device._handle, errorHandler);
    });
  }

  /// Exports an image snapshot of the current [GeoViewController].
  ///
  /// The exported image contains the currently visible content of the
  /// [ArcGISMapViewController] or `SceneView`. Elements drawn on top of the
  /// [GeoViewController], such as callouts or popups, are not exported. You can
  /// check [GeoViewController.drawStatus] to confirm that drawing is complete
  /// before calling this method.
  ///
  /// Return Value: A task that returns the type [ArcGISImage].
  Future<ArcGISImage> exportImage() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_exportImageAsync(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsArcGISImage()!);
  }

  /// Cancelable version of [exportImage]. See that method for more information.
  CancelableOperation<ArcGISImage> exportImageCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_exportImageAsync(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsArcGISImage()!);
  }

  /// Cancel a gesture-based interaction on a `GeometryEditor` within the
  /// [GeoViewController].
  ///
  /// Calling this before completing a gesture-based interaction will abort any
  /// ongoing gesture-based interaction with a `GeometryEditor` within the
  /// [GeoViewController] without any changes being applied to the geometry.
  ///
  /// If there is no ongoing gesture-based interaction on a `GeometryEditor`
  /// within the [GeoViewController], this is a no-op.
  ///
  /// It is the wrapping API's responsibility to set
  /// [GeoViewController._isInteracting] to false when calling this method, if
  /// the API previously set this to true to start a geometry editor interaction
  /// (for example when calling
  /// [GeoViewController._geometryEditorInteractionDragStart]).
  void _geometryEditorInteractionCancel() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_geometryEditorInteractionCancel(
          _handle, errorHandler);
    });
  }

  /// Finish dragging a pointing device across a [GeoViewController] and
  /// potentially update the `GeometryEditor.geometry`.
  ///
  /// This call will apply the effect of moving the dragged
  /// `GeometryEditorElement`, visually simulated while the drag is ongoing, to
  /// the geometry.
  ///
  /// Expects to be preceded by a call to
  /// [GeoViewController._geometryEditorInteractionDragStart] which returns
  /// true. Otherwise, this is a no-op.
  ///
  /// To drag an element:
  ///
  /// - If call to [GeoViewController._geometryEditorInteractionDragStart]
  /// returns true:
  ///    - call [GeoViewController._geometryEditorInteractionDragMove] 0 or more
  /// times
  ///    - call [GeoViewController._geometryEditorInteractionDragEnd] once,
  /// applying the changes to the geometry
  /// - Else
  ///    - this drag isn't relevant to the `GeometryEditor`: consider panning
  /// the map instead
  ///
  /// Call [GeoViewController._geometryEditorInteractionCancel] to abort the
  /// drag at any time without applying changes to the sketch.
  ///
  /// It is the wrapping API's responsibility to set
  /// [GeoViewController._isInteracting] to false when calling this method,
  /// having previously set this property to true when calling
  /// [GeoViewController._geometryEditorInteractionDragStart].
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  void _geometryEditorInteractionDragEnd({required Offset screenPoint}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_geometryEditorInteractionDragEnd(
          _handle, coreScreenPoint.ref, errorHandler);
    });
  }

  /// Continue dragging a pointing device across a [GeoViewController].
  ///
  /// This call updates the visual simulation of the outcome of the ongoing
  /// drag, without applying changes to the geometry.
  ///
  /// Expects to be preceded by a call to
  /// [GeoViewController._geometryEditorInteractionDragStart] which returns
  /// true. Otherwise, this is a no-op.
  ///
  /// To drag an element:
  ///
  /// - If call to [GeoViewController._geometryEditorInteractionDragStart]
  /// returns true:
  ///    - call [GeoViewController._geometryEditorInteractionDragMove] 0 or more
  /// times
  ///    - call [GeoViewController._geometryEditorInteractionDragEnd] once,
  /// applying the changes to the geometry
  /// - Else
  ///    - this drag isn't relevant to the `GeometryEditor`: consider panning
  /// the map instead
  ///
  /// Call [GeoViewController._geometryEditorInteractionCancel] to abort the
  /// drag at any time without applying changes to the geometry.
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  void _geometryEditorInteractionDragMove({required Offset screenPoint}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_geometryEditorInteractionDragMove(
          _handle, coreScreenPoint.ref, errorHandler);
    });
  }

  /// Start dragging a pointing device across a [GeoViewController].
  ///
  /// To drag an element:
  ///
  /// - If call to [GeoViewController._geometryEditorInteractionDragStart]
  /// returns true:
  ///    - call [GeoViewController._geometryEditorInteractionDragMove] 0 or more
  /// times
  ///    - call [GeoViewController._geometryEditorInteractionDragEnd] once,
  /// applying the changes to the geometry
  /// - Else
  ///    - this drag isn't relevant to the `GeometryEditor`: consider panning
  /// the map instead
  ///
  /// Call [GeoViewController._geometryEditorInteractionCancel] to abort the
  /// drag at any time without applying changes to the geometry.
  ///
  /// It is the wrapping API's responsibility to set
  /// [GeoViewController._isInteracting] to true when calling this method. The
  /// API should then set this property back to false when calling
  /// [GeoViewController._geometryEditorInteractionDragEnd] or
  /// [GeoViewController._geometryEditorInteractionCancel].
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// - `interactionDevice` — The type of device used for interacting with the
  /// [GeoViewController], so that core can use an appropriate tolerance.
  ///
  /// Return Value: Returns true if starting a drag from the given [Offset] with
  /// the given [_InteractionDeviceType] will result in a
  /// `GeometryEditorElement` being dragged interactively. Otherwise returns
  /// false, indicating that the drag gesture is not relevant to the
  /// `GeometryEditor`.
  ///
  /// Examples of when this call will return false include:
  /// - There are no `GeometryEditorElement` objects in the view, i.e.
  /// `MapView.geometryEditor` is null.
  /// - The `GeometryEditor` is not editing, i.e. `GeometryEditor.isStarted`
  /// property is false.
  /// - The `GeometryEditor` is empty.
  /// - The drag was not started over a `GeometryEditorElement`, i.e. [Offset]
  /// was not within the tolerance of a `GeometryEditorElement`.
  /// - The drag was started over a `GeometryEditorElement` and
  /// `InteractionConfiguration.allowMovingSelectedElement` is false.
  /// - The drag was started over a non-selected `GeometryEditorElement` and
  /// `InteractionConfiguration.requireSelectionBeforeMove` is true.
  bool _geometryEditorInteractionDragStart(
      {required Offset screenPoint,
      required _InteractionDeviceType interactionDevice}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_geometryEditorInteractionDragStart(_handle,
          coreScreenPoint.ref, interactionDevice.coreValue, errorHandler);
    });
  }

  /// Long-press a [GeoViewController], potentially selecting a
  /// `GeometryEditorElement`.
  ///
  /// If a long press gesture occurs over a `GeometryEditorElement`, it will
  /// result in the element becoming (or remaining) selected. This behavior is
  /// conditional on the properties of `InteractionConfiguration`. A long press
  /// does not engage selection cycling. E.g. a long-press will not unselect an
  /// already-selected element in the way a single tap can.
  ///
  /// To use a long-press to drive a context menu (say), call:
  ///
  /// - If [GeoViewController._geometryEditorInteractionLongPress] returns true
  ///    - populate and display the context menu in the wrapping API, based the
  /// selection property of the `GeometryEditor`.
  /// - Else
  ///    - this long-press isn't relevant to the `GeometryEditor`: consider some
  /// alternative response to the long-press.
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// - `interactionDevice` — The type of device used for interacting with the
  /// [GeoViewController], so that core can use an appropriate tolerance.
  ///
  /// Return Value: Returns true if this long-press gesture occurs over a
  /// selectable `GeometryEditorElement`. Otherwise returns false, indicating
  /// that the long-press gesture is not relevant to the
  /// `GeometryEditorElement`.
  ///
  /// Examples of when this call will return false include:
  /// - There are no `GeometryEditorElement` objects in the view, i.e.
  /// `MapView.geometryEditor` is null
  /// - The `GeometryEditor` is not editing, i.e. `GeometryEditor.isStarted`
  /// property is false
  /// - The long-press was not started over a `GeometryEditorElement`, i.e.
  /// [Offset] was not within the tolerance for the [_InteractionDeviceType] of
  /// a `GeometryEditorElement`.
  /// - The long-press was started over a `GeometryEditorElement` and the
  /// element is not selectable, according to `InteractionConfiguration`.
  bool _geometryEditorInteractionLongPress(
      {required Offset screenPoint,
      required _InteractionDeviceType interactionDevice}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_geometryEditorInteractionLongPress(_handle,
          coreScreenPoint.ref, interactionDevice.coreValue, errorHandler);
    });
  }

  /// Move a pointing device outside of a [GeoViewController].
  ///
  /// This call will stop displaying any feedback symbols drawn by a previous
  /// call to [GeoViewController._geometryEditorInteractionMouseMove]. Call
  /// [GeoViewController._geometryEditorInteractionMouseMove] when the pointer
  /// reenters the view in order to start displaying appropriate feedbacks
  /// again.
  ///
  /// If not preceded by a call to
  /// [GeoViewController._geometryEditorInteractionMouseMove], this is a no-op.
  void _geometryEditorInteractionMouseExit() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_geometryEditorInteractionMouseExit(
          _handle, errorHandler);
    });
  }

  /// Move a pointing device across a [GeoViewController].
  ///
  /// This call will display appropriate feedback symbols on the view, depending
  /// on the state of the `GeometryEditor`, to help end users anticipate the
  /// effect of a subsequent tap interaction. For example, if a tap at the mouse
  /// move location will add a new vertex to a polyline geometry based on the
  /// current tool type and `InteractionConfiguration`, then
  /// `GeometryEditorStyle.feedbackVertexSymbol` and
  /// `GeometryEditorStyle.feedbackLineSymbol` are displayed to represent the
  /// potential new segment and vertex.
  ///
  /// Call [GeoViewController._geometryEditorInteractionMouseExit] when the
  /// pointer leaves the view in order to stop displaying these feedback
  /// symbols. Call [GeoViewController._geometryEditorInteractionMouseMove]
  /// again when the pointer reenters the view.
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// - `interactionDevice` — The type of device used for interacting with the
  /// [GeoViewController], so that core can use an appropriate tolerance.
  void _geometryEditorInteractionMouseMove(
      {required Offset screenPoint,
      required _InteractionDeviceType interactionDevice}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_geometryEditorInteractionMouseMove(_handle,
          coreScreenPoint.ref, interactionDevice.coreValue, errorHandler);
    });
  }

  /// Single tap in a [GeoViewController], potentially changing the selection
  /// within or adding a vertex to a geometry.
  ///
  /// A single tap gesture may be used for 2 different operations in the
  /// `GeometryEditor`:
  ///
  /// 1. Select (or cycle the selection of) a `GeometryEditorElement`, or
  /// 2. Add a new vertex to the geometry.
  ///
  /// Exact behavior depends on where the single tap occurs in relation to
  /// existing `GeometryEditorElement` objects and is conditional on the
  /// properties of `InteractionConfiguration`.
  ///
  /// Assuming the `InteractionConfiguration` permits it, if this tap occurs
  /// over an existing `GeometryEditorElement`, this call will select (or cycle
  /// the selection of) that element. Otherwise, this call will add a new vertex
  /// to the geometry.
  ///
  /// If this call returns false, it indicates the single tap is not relevant to
  /// the `GeometryEditor`. In this case, the caller is responsible for deciding
  /// how/whether to react to the single tap gesture in some other manner.
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// - `interactionDevice` — The type of device used for interacting with the
  /// [GeoViewController], so that core can use an appropriate tolerance.
  ///
  /// Return Value: Returns true if this single tap gesture results in either a
  /// selection change or vertex insertion within the `GeometryEditor`.
  /// Otherwise returns false, indicating that the tap gesture is not relevant
  /// to the `GeometryEditor`.
  ///
  /// Examples of when this call will return false include:
  /// - There are no `GeometryEditorElement` objects in the view, i.e.
  /// `MapView.geometryEditor` is null
  /// - The `GeometryEditor` is not editing, i.e. `GeometryEditor.isStarted`
  /// property is false
  /// - The single tap was not over a `GeometryEditorElement`, i.e. [Offset] was
  /// not within the tolerance for the [_InteractionDeviceType] of a
  /// `GeometryEditorElement`.
  /// - The single tap was over a `GeometryEditorElement` and the element is not
  /// selectable, according to `InteractionConfiguration`.
  bool _geometryEditorInteractionTap(
      {required Offset screenPoint,
      required _InteractionDeviceType interactionDevice}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_geometryEditorInteractionTap(_handle,
          coreScreenPoint.ref, interactionDevice.coreValue, errorHandler);
    });
  }

  /// Retrieves the current [Viewpoint] of the [GeoViewController].
  ///
  /// This takes into account the attribution bar if it is visible. See
  /// [GeoViewController.isAttributionTextVisible].
  ///
  /// Parameters:
  /// - `viewpointType` — The type of [Viewpoint].
  ///
  /// Return Value: A [Viewpoint].
  Viewpoint? getCurrentViewpoint({required ViewpointType viewpointType}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getCurrentViewpoint(
          _handle, viewpointType.coreValue, errorHandler);
    });
    return Viewpoint._fromHandle(objectHandle);
  }

  /// Retrieves the layer's state in the [GeoViewController].
  ///
  /// Parameters:
  /// - `layer` — A layer object to get the view state for.
  ///
  /// Return Value: A [LayerViewState].
  LayerViewState? getLayerViewState({required Layer layer}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_getLayerViewState(
          _handle, layer._handle, errorHandler);
    });
    return LayerViewState._fromHandle(objectHandle);
  }

  /// Informs the view that its size is valid and that it may proceed with
  /// rendering.
  ///
  /// This method delays rendering of the view, which means that it must be
  /// called for drawing to complete, assuming that the view's Map or Scene
  /// loads successfully.
  ///
  /// Once called, any pending rendering tasks (such as setting a Viewpoint on
  /// the view) are executed in the order that they were scheduled prior to
  /// calling this method.
  ///
  /// Interactions are ignored until this method has been called.
  void _hasValidSize() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_hasValidSize(_handle, errorHandler);
    });
  }

  /// Identifies a limited number of graphics in the specified graphics overlay,
  /// at the given screen point.
  ///
  /// As locations from user gestures are not always accurate to the exact
  /// pixel, you can define a tolerance for the identify operation. The
  /// tolerance parameter sets the radius of a circle, centered at the specified
  /// coordinates, in device-independent pixels (DIP). If the tolerance value is
  /// 0, identify performs the test at the specified coordinates. If it is
  /// greater than 0, identify tests inside the circle. For touch displays a
  /// value of 22 is recommended to cover an average finger tap. The maximum
  /// allowed value is 100 DIPs.
  ///
  /// The returnPopupsOnly parameter controls which properties are populated in
  /// the [IdentifyGraphicsOverlayResult] instance. If true, only
  /// `IdentifyGraphicsOverlayResult.popups` is populated. If the overlay does
  /// not have popups an error is returned. If false,
  /// [IdentifyGraphicsOverlayResult.geoElements],
  /// [IdentifyGraphicsOverlayResult.graphics], and
  /// `IdentifyGraphicsOverlayResult.popups` are populated, if the overlay has
  /// popups.
  ///
  /// Parameters:
  /// - `graphicsOverlay` — The graphics overlay in which to identify the
  /// graphics.
  /// - `screenPoint` — The screen coordinates to identify the graphics.
  /// - `tolerance` — A radius in device-independent pixels (DIP) that specifies
  /// how precise the identify operation should be.
  /// - `maximumResults` — The maximum number of graphics and/or popups returned
  /// in the [IdentifyGraphicsOverlayResult]. A value of 1 means that only the
  /// top-most graphic or popup will be identified. A value of null means that
  /// the number of results will not be limited.
  ///
  /// Return Value: A [Future] of [IdentifyGraphicsOverlayResult]
  Future<IdentifyGraphicsOverlayResult> identifyGraphicsOverlay(
      GraphicsOverlay graphicsOverlay,
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResults = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeoView_identifyGraphicsOverlayWithMaxResultsNullable(
              _handle,
              graphicsOverlay._handle,
              coreScreenPoint.ref,
              tolerance,
              maximumResults,
              errorHandler);
    });
    return taskHandle.toFuture(
        (element) => element.getValueAsIdentifyGraphicsOverlayResult()!);
  }

  /// Cancelable version of [identifyGraphicsOverlay]. See that method for more
  /// information.
  CancelableOperation<IdentifyGraphicsOverlayResult>
      identifyGraphicsOverlayCancelable(GraphicsOverlay graphicsOverlay,
          {required Offset screenPoint,
          required double tolerance,
          int? maximumResults = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeoView_identifyGraphicsOverlayWithMaxResultsNullable(
              _handle,
              graphicsOverlay._handle,
              coreScreenPoint.ref,
              tolerance,
              maximumResults,
              errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsIdentifyGraphicsOverlayResult()!);
  }

  /// Identifies a limited number of graphics in all graphics overlays, at the
  /// given screen point.
  ///
  /// As locations from user gestures are not always accurate to the exact
  /// pixel, you can define a tolerance for the identify operation. The
  /// tolerance parameter sets the radius of a circle, centered at the specified
  /// coordinates, in device-independent pixels (DIP). If the tolerance value is
  /// 0, identify performs the test at the specified coordinates. If it is
  /// greater than 0, identify tests inside the circle. For touch displays a
  /// value of 22 is recommended to cover an average finger tap. The maximum
  /// allowed value is 100 DIPs.
  ///
  /// The returnPopupsOnly parameter controls which properties are populated in
  /// the [IdentifyGraphicsOverlayResult] instance. If true, only
  /// `IdentifyGraphicsOverlayResult.popups` is populated. If the overlay does
  /// not have popups an error is returned. If false,
  /// [IdentifyGraphicsOverlayResult.geoElements],
  /// [IdentifyGraphicsOverlayResult.graphics], and
  /// `IdentifyGraphicsOverlayResult.popups` are populated, if the overlay has
  /// popups.
  ///
  /// Results are returned in a top-to-bottom order.
  ///
  /// Parameters:
  /// - `screenPoint` — The screen coordinates to identify the graphics.
  /// - `tolerance` — A radius in device-independent pixels (DIP) that specifies
  /// how precise the identify operation should be.
  /// - `maximumResultsPerOverlay` — The maximum number of graphics and/or
  /// popups returned in the [IdentifyGraphicsOverlayResult] per graphics
  /// overlay. A value of 1 means that only the top-most graphic or popup will
  /// be identified. A value of null means that the number of results will not
  /// be limited.
  ///
  /// Return Value: A [Future] of [List] of [IdentifyGraphicsOverlayResult]
  /// containing one entry for each overlay in the view. Each entry holds a
  /// [GraphicsOverlay], a [List] of [GeoElement], and a [List] of [Graphic].
  Future<List<IdentifyGraphicsOverlayResult>> identifyGraphicsOverlays(
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResultsPerOverlay = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeoView_identifyGraphicsOverlaysWithMaxResultsNullable(
              _handle,
              coreScreenPoint.ref,
              tolerance,
              maximumResultsPerOverlay,
              errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [identifyGraphicsOverlays]. See that method for more
  /// information.
  CancelableOperation<List<IdentifyGraphicsOverlayResult>>
      identifyGraphicsOverlaysCancelable(
          {required Offset screenPoint,
          required double tolerance,
          int? maximumResultsPerOverlay = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore
          .RT_GeoView_identifyGraphicsOverlaysWithMaxResultsNullable(
              _handle,
              coreScreenPoint.ref,
              tolerance,
              maximumResultsPerOverlay,
              errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// Identifies a limited number of geoelements in the specified layer or
  /// sublayer, at the given screen point.
  ///
  /// As locations from user gestures are not always accurate to the exact
  /// pixel, you can define a tolerance for the identify operation. The
  /// tolerance parameter sets the radius of a circle, centered at the specified
  /// coordinates, in device-independent pixels (DIP). If the tolerance value is
  /// 0, identify performs the test at the specified coordinates. If it is
  /// greater than 0, identify tests inside the circle. For touch displays a
  /// value of 22 is recommended to cover an average finger tap. The maximum
  /// allowed value is 100 DIPs.
  ///
  /// The result is returned in a single [IdentifyLayerResult] instance. If the
  /// returnPopupsOnly parameter is true only `IdentifyLayerResult.popups` is
  /// populated. If the layer does not have popups an error is returned. If the
  /// returnPopupsOnly parameter is false, both
  /// [IdentifyLayerResult.geoElements] and `IdentifyLayerResult.popups` are
  /// populated, if the layer has popups. [IdentifyLayerResult.geoElements] and
  /// `IdentifyLayerResult.popups` provide the results in a top-to-bottom order.
  ///
  /// Parameters:
  /// - `layer` — The layer in which to identify the geoelements.
  /// - `screenPoint` — The screen coordinates to identify the geoelements.
  /// - `tolerance` — A radius in device-independent pixels (DIP) that specifies
  /// how precise the identify operation should be.
  /// - `maximumResults` — The maximum number of geoelements and/or popups
  /// returned in the [IdentifyLayerResult]. A value of 1 means that only the
  /// top-most geoelement or popup will be identified. A value of null means
  /// that the number of results will not be limited.
  ///
  /// Return Value: A [Future] of [IdentifyLayerResult].
  Future<IdentifyLayerResult> identifyLayer(Layer layer,
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResults = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_identifyLayerWithMaxResultsNullable(
          _handle,
          layer._handle,
          coreScreenPoint.ref,
          tolerance,
          maximumResults,
          errorHandler);
    });
    return taskHandle
        .toFuture((element) => element.getValueAsIdentifyLayerResult()!);
  }

  /// Cancelable version of [identifyLayer]. See that method for more
  /// information.
  CancelableOperation<IdentifyLayerResult> identifyLayerCancelable(Layer layer,
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResults = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_identifyLayerWithMaxResultsNullable(
          _handle,
          layer._handle,
          coreScreenPoint.ref,
          tolerance,
          maximumResults,
          errorHandler);
    });
    return taskHandle.toCancelableOperation(
        (element) => element.getValueAsIdentifyLayerResult()!);
  }

  /// Identifies a limited number of geoelements at the given screen point, in
  /// each identifiable layer or sublayer in the [GeoViewController]'s
  /// [ArcGISMap] or `ArcGISScene`.
  ///
  /// As locations from user gestures are not always accurate to the exact
  /// pixel, you can define a tolerance for the identify operation. The
  /// tolerance parameter sets the radius of a circle, centered at the specified
  /// coordinates, in device-independent pixels (DIP). If the tolerance value is
  /// 0, identify performs the test at the specified coordinates. If it is
  /// greater than 0, identify tests inside the circle. For touch displays a
  /// value of 22 is recommended to cover an average finger tap. The maximum
  /// allowed value is 100 DIPs.
  ///
  /// The result is returned in a collection of [IdentifyLayerResult] to match
  /// the order of the [GeoViewController]'s [GeoModel.operationalLayers] or
  /// [GeoModel.operationalLayers] collection. If the returnPopupsOnly parameter
  /// is true only `IdentifyLayerResult.popups` is populated. If the layer does
  /// not have popups an error is returned. If the returnPopupsOnly parameter is
  /// false, both [IdentifyLayerResult.geoElements] and
  /// `IdentifyLayerResult.popups` are populated, if the layer has popups.
  /// [IdentifyLayerResult.geoElements] and `IdentifyLayerResult.popups` provide
  /// the results in a top-to-bottom order.
  ///
  /// Parameters:
  /// - `screenPoint` — The screen coordinates to identify the geoelements.
  /// - `tolerance` — A radius in device-independent pixels (DIP) that specifies
  /// how precise the identify operation should be.
  /// - `maximumResultsPerLayer` — The maximum number of geoelements and/or
  /// popups returned in the [IdentifyLayerResult] per layer or sublayer. A
  /// value of 1 means that only the top-most geoelement or popup will be
  /// identified. A value of null means that the number of results will not be
  /// limited.
  ///
  /// Return Value: A [Future] of [List] of [IdentifyLayerResult], containing
  /// one entry for each layer in the view that supports identify. Each entry
  /// contains a [Layer] and a [List] of elements of the type contained by the
  /// layer (for example, [Feature] for a [FeatureLayer]).
  Future<List<IdentifyLayerResult>> identifyLayers(
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResultsPerLayer = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_identifyLayersWithMaxResultsNullable(
          _handle,
          coreScreenPoint.ref,
          tolerance,
          maximumResultsPerLayer,
          errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsList()!);
  }

  /// Cancelable version of [identifyLayers]. See that method for more
  /// information.
  CancelableOperation<List<IdentifyLayerResult>> identifyLayersCancelable(
      {required Offset screenPoint,
      required double tolerance,
      int? maximumResultsPerLayer = 1}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_identifyLayersWithMaxResultsNullable(
          _handle,
          coreScreenPoint.ref,
          tolerance,
          maximumResultsPerLayer,
          errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsList()!);
  }

  /// When user double taps on geo view (and also triple taps, quadruple taps,
  /// etc).
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// The coordinate of the top left corner of the screen is 0,0. Units are in
  /// DIPs unless overridden by [ArcGISEnvironment._setScreenCoordinateType]
  /// - `zoomFactor` — The zoom amount on double-click/mouse-wheel.
  void _interactionZoomInAnimated(
      {required Offset screenPoint, required double zoomFactor}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_interactionZoomInAnimated(
          _handle, coreScreenPoint.ref, zoomFactor, errorHandler);
    });
  }

  /// When user two finger taps on devices to zoom out, or control+clicks on
  /// desktops to zoom out.
  ///
  /// Parameters:
  /// - `screenPoint` — The location of the interaction in screen coordinates.
  /// The coordinate of the top left corner of the screen is 0,0. Units are in
  /// DIPs unless overridden by [ArcGISEnvironment._setScreenCoordinateType]
  /// - `zoomFactor` — The zoom amount on double-click/mouse-wheel.
  void _interactionZoomOutAnimated(
      {required Offset screenPoint, required double zoomFactor}) {
    final coreScreenPoint = screenPoint.toArcGIS();
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_interactionZoomOutAnimated(
          _handle, coreScreenPoint.ref, zoomFactor, errorHandler);
    });
  }

  /// Queries if the rendering thread of the geo view has been paused.
  ///
  /// Return Value: true if it is paused, false otherwise.
  bool _isPaused() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_isPaused(_handle, errorHandler);
    });
  }

  /// Pauses the rendering thread of the geo view.
  ///
  /// Parameters:
  /// - `device` — A device object.
  /// - `resources` — A value indicating if resources should be retained or
  /// released.
  void _pause(
      {required _Device device,
      required _GraphicsHardwareResources resources}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_pause(
          _handle, device._handle, resources.coreValue, errorHandler);
    });
  }

  /// Sends a pulse to the geo view's rendering thread.
  void _pulse() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_pulse(_handle, errorHandler);
    });
  }

  /// Changes the screen dimensions of the geo view maintaining the current
  /// anchor point.
  ///
  /// Parameters:
  /// - `width` — The new width, in pixels.
  /// - `height` — The new height, in pixels.
  void _resize({required int width, required int height}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_resize(_handle, width, height, errorHandler);
    });
  }

  /// Resumes the rendering thread of the geo view.
  ///
  /// Parameters:
  /// - `device` — A device object.
  void _resume({required _Device device}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_resume(_handle, device._handle, errorHandler);
    });
  }

  /// Sets the [Viewpoint] of the [GeoViewController] to the
  /// [Bookmark.viewpoint].
  ///
  /// Parameters:
  /// - `bookmark` — The bookmark.
  ///
  /// Return Value: A [Future] of bool.
  Future<bool> setBookmark(Bookmark bookmark) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_setBookmarkAsync(
          _handle, bookmark._handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setBookmark]. See that method for more information.
  CancelableOperation<bool> setBookmarkCancelable(Bookmark bookmark) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_setBookmarkAsync(
          _handle, bookmark._handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Sets the nominal rate at which the geo view's pulse thread runs, thereby
  /// controlling maximum draw frame rate.
  ///
  /// This may only be called when the geo view's internal pulse is being used.
  /// An error is thrown otherwise.
  ///
  /// Parameters:
  /// - `pulsesPerSecond` — The nominal number of pulses per second.
  void _setPulseRate({required int pulsesPerSecond}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setPulseRate(
          _handle, pulsesPerSecond, errorHandler);
    });
  }

  /// Set screen scale of the Geo view. This can be used to react to changes in
  /// screen scale of the display the Geo view is rendering on, like when
  /// dragging an app from one display to another on a multi monitor system.
  ///
  /// Parameters:
  /// - `screenScale` — The number of pixels per DIP (sometimes referred to as
  /// screen density or device pixel ratio).
  void _setScreenScale(double screenScale) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setScreenScale(_handle, screenScale, errorHandler);
    });
  }

  /// Pan or zoom the [GeoViewController] to the specified [Viewpoint] location.
  ///
  /// Parameters:
  /// - `viewpoint` — The viewpoint.
  void setViewpoint(Viewpoint viewpoint) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GeoView_setViewpoint(
          _handle, viewpoint._handle, errorHandler);
    });
  }

  /// Pan or zoom the [GeoViewController] using animation to the specified
  /// [Viewpoint] location. Animation takes place over the specified duration.
  ///
  /// Parameters:
  /// - `viewpoint` — The viewpoint.
  /// - `duration` — The amount of time in seconds to move to the new viewpoint.
  /// If the duration is null, the default duration is used.
  ///
  /// Return Value: A [Future].
  Future<bool> setViewpointAnimated(Viewpoint viewpoint, {double? duration}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_setViewpointAsyncCombined(
          _handle, viewpoint._handle, duration, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [setViewpointAnimated]. See that method for more
  /// information.
  CancelableOperation<bool> setViewpointAnimatedCancelable(Viewpoint viewpoint,
      {double? duration}) {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GeoView_setViewpointAsyncCombined(
          _handle, viewpoint._handle, duration, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// This function cleans up properties of this controller before garbage
  /// collection happens. This function should be overriden by subclasses that
  /// have other properties that need to be cleaned up.
  @mustCallSuper
  void dispose() {
    _graphicsOverlays.invalidateCache();
    _labeling.invalidateCache();
    _selectionProperties.invalidateCache();
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeGeoViewAttributionChangedEvent:
        _attributionChangedStreamController.add(attributionText);
      case AsyncType.asyncTypeGeoViewDrawRequestedEvent:
        _drawRequestedStreamController.add(null);
      case AsyncType.asyncTypeGeoViewDrawStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return DrawStatus._fromCoreValue(coreValue);
        }();
        _drawStatusChangedStreamController.add(event);
      case AsyncType.asyncTypeGeoViewLayerViewStateChangedEvent:
        final layerParameter = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_LayerHandle;
          return Layer._fromHandle(objectHandle)!;
        }();
        final layerViewStateParameter = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[3] as int)
                  as RT_LayerViewStateHandle;
          return LayerViewState._fromHandle(objectHandle)!;
        }();
        final event =
            (layer: layerParameter, layerViewState: layerViewStateParameter);
        _layerViewStateChangedStreamController.add(event);
      case AsyncType.asyncTypeGeoViewNavigationChangedEvent:
        final event = () {
          return message[2] as bool;
        }();
        _navigationChangedStreamController.add(event);
      case AsyncType.asyncTypeGeoViewSpatialReferenceChangedEvent:
        _spatialReferenceChangedStreamController.add(spatialReference);
      case AsyncType.asyncTypeGeoViewTimeExtentChangedEvent:
        _timeExtentChangedStreamController.add(timeExtent);
      case AsyncType.asyncTypeGeoViewViewpointChangedEvent:
        _viewpointChangedStreamController.add(null);
      default:
        logger.f('GeoViewController unhandled asyncType $asyncType');
    }
  }
}

/// The type of GeoView.
///
/// Tells you what GeoView you are working with.
enum _GeoViewType {
  /// The GeoView is a map view.
  arcGISMapView,

  /// The GeoView is a scene view.
  arcGISSceneView,

  /// The GeoView is unknown. This is for error conditions.
  unknown;

  factory _GeoViewType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return arcGISMapView;
      case 1:
        return arcGISSceneView;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case arcGISMapView:
        return 0;
      case arcGISSceneView:
        return 1;
      case unknown:
        return -1;
    }
  }
}

/// A type of [GeoElement] that has a shape (geometry), symbol, and attributes
/// and can be displayed in a map view or scene view.
///
/// Graphics are used to represent temporary data that exists for the lifetime
/// of the application. For example, you can:
///
///   * Show updated locations for objects in the map view, such as moving
/// vehicles.
///   * Display results from an analysis, geocoding, or routing operation.
///   * Allow the user to draw temporary sketches on top of the map.
///   * Store user input, such as a set of route stops to visit.
///   * Show ad hoc text labels to describe things on the map.
///
/// To display a graphic, add it to a [GraphicsOverlay.graphics] collection and
/// add the graphics overlay to your map view or scene view.
///
/// Each graphic has a geometry describing its location and shape. To maximize
/// performance, the geometry should have the same [SpatialReference] as the map
/// view or scene view to which it is added. If the geometry has a different
/// [SpatialReference], it will be reprojected on-the-fly. This can be
/// computationally expensive when displaying a large number of graphics.
///
/// A graphic can have an associated [ArcGISSymbol] that defines the graphic's
/// appearance. Alternatively, the [GraphicsOverlay] can be assigned a
/// [Renderer] that determines the appearance of all graphics in the overlay. If
/// a graphic has an associated symbol, the symbol will override the overlay's
/// renderer for the graphic's display. The symbol used depends on the geometry
/// type associated with the graphic. A [MarkerSymbol] is used for [ArcGISPoint]
/// and [Multipoint] geometries, a [SimpleLineSymbol] for [Polyline] geometries,
/// and a [SimpleFillSymbol] for [Polygon] or [Envelope] geometries.
///
/// You can select or deselect graphics ([Graphic.isSelected]), change the
/// visibility of a graphic ([Graphic.isVisible]), and manage the order in which
/// they are displayed ([Graphic.zIndex]).
///
/// Each graphic can have a collection of attributes (as key-value pairs) to
/// provide more information.
final class Graphic implements GeoElement, _InstanceId, ffi.Finalizable {
  final RT_GraphicHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Graphic_destroyInstance.cast());

  static Graphic? _fromHandle(RT_GraphicHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Graphic._instanceCache.instanceWith(handle);
  }

  Graphic._withHandle(RT_GraphicHandle handle)
      : _attributes = Memoized(getter: () {
          final dictionaryHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Graphic_getAttributes(handle, errorHandler);
          });
          return dictionaryHandle.toMap();
        }),
        _symbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Graphic_getSymbol(handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_Graphic_setSymbol(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Graphic_created(_handle);
    }
  }

  static final _instanceCache =
      _InstanceCache(factory: _GraphicFactory(), kind: 'Graphic');

  /// Creates a graphic with the given geometry, attributes, and symbol.
  ///
  /// Parameters:
  /// - `geometry` — geometry. Can be null.
  /// - `attributes` — The attributes of the graphic. Can be null.
  /// - `symbol` — symbol. Can be null.
  factory Graphic(
      {Geometry? geometry,
      Map<String, dynamic> attributes = const {},
      ArcGISSymbol? symbol}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreAttributes = attributes.toDictionary(
        keyType: _ElementType.string, valueType: _ElementType.variant);
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_createWithGeometryAttributesAndSymbol(
          geometry?._handle ?? ffi.nullptr,
          coreAttributes._handle,
          symbol?._handle ?? ffi.nullptr,
          errorHandler);
    });
    final Graphic object = Graphic._instanceCache.instanceWith(handle);
    object._attributes.value.setCache(attributes);
    object._symbol.cache(symbol);
    return object;
  }

  @override
  Map<String, dynamic> get attributes => _attributes.value;

  final Memoized<_DictionaryMap<String, dynamic>> _attributes;

  @override
  Geometry? get geometry {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getGeometry(_handle, errorHandler);
    });
    return Geometry._fromHandle(objectHandle);
  }

  @override
  set geometry(Geometry? value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Graphic_setGeometry(
          _handle, value?._handle ?? ffi.nullptr, errorHandler);
    });
  }

  /// The graphics overlay the graphic is contained in. If the graphic is not
  /// contained in an overlay then null is returned.
  GraphicsOverlay? get graphicsOverlay {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getGraphicsOverlay(_handle, errorHandler);
    });
    return GraphicsOverlay._fromHandle(objectHandle);
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getInstanceId(_handle, errorHandler);
    });
  }

  /// True if the graphic is selected, false otherwise.
  bool get isSelected {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getIsSelected(_handle, errorHandler);
    });
  }

  set isSelected(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Graphic_setIsSelected(_handle, value, errorHandler);
    });
  }

  /// True if the graphic is visible, false otherwise.
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getIsVisible(_handle, errorHandler);
    });
  }

  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Graphic_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// Defines the graphic's appearance when displayed in a map view or scene
  /// view.
  ///
  /// For graphics to appear in a map view or scene view, they must have an
  /// [ArcGISSymbol] or be added to a graphics overlay that has a renderer
  /// assigned. An [ArcGISSymbol] defines the properties used to display the
  /// graphic, such as color, outline, size, and style. There are many different
  /// types of symbols, such as [SimpleMarkerSymbol], [SimpleLineSymbol], and
  /// [SimpleFillSymbol]. The symbol type must match the [GeometryType] of the
  /// graphic. For example, a [FillSymbol] is used with graphics that are based
  /// on polygon geometry. The rendering of a graphic's symbol takes precedence
  /// over the [Renderer] that may be set on the [GraphicsOverlay].
  ArcGISSymbol? get symbol => _symbol.value;

  set symbol(ArcGISSymbol? value) => _symbol.value = value;

  final Memoized<ArcGISSymbol?> _symbol;

  /// Defines the draw order of a graphic. Graphics with higher Z-index values
  /// are drawn on top of lower Z-index graphics.
  ///
  /// A graphic's Z-index is mostly relevant for display in a two-dimensional
  /// map view. For dynamic 3D rendering (in a scene view), graphic display
  /// order is determined by the distance to the camera rather than by Z-index.
  /// The Z-index is considered, however, when using static rendering in a scene
  /// view (draping graphics on the surface, in other words).
  ///
  /// If Z-index is not set, graphics will usually render in the order in which
  /// they were added to the graphics overlay, the first added is rendered first
  /// and subsequent ones on top. In rare cases, the rendering algorithm may
  /// change the display order to provide more efficient rendering. If ordering
  /// is important, set the Z-index explicitly on graphics. You can also place
  /// graphics of the same geometry type in their own graphics overlay and
  /// manage the order of the overlays in the [ArcGISMapViewController] or
  /// `SceneView`.
  int get zIndex {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_getZIndex(_handle, errorHandler);
    });
  }

  set zIndex(int value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Graphic_setZIndex(_handle, value, errorHandler);
    });
  }

  @override
  ArcGISPoint? _computeCalloutLocation(
      {required ArcGISPoint? tapLocation,
      required ArcGISMapViewController? arcGISMapView}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Graphic_computeCalloutLocation(
          _handle,
          tapLocation?._handle ?? ffi.nullptr,
          arcGISMapView?._handle ?? ffi.nullptr,
          errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Sets graphic geometry to an [ArcGISPoint] by specifying properties of the
  /// point rather than by passing a point instance.
  ///
  /// This function can be used to improve performance, as an alternative to
  /// instantiating a new [ArcGISPoint] and passing the instance to
  /// [Graphic.geometry].
  ///
  /// Parameters:
  /// - `x` — The point's X coordinate value.
  /// - `y` — The point's Y coordinate value.
  /// - `z` — The point's Z coordinate value. This parameter is ignored if the
  /// has_z parameter == false.
  /// - `m` — The point's M value. This parameter is ignored if the has_m
  /// parameter == false.
  /// - `hasZ` — True if the point has a Z coordinate value.
  /// - `hasM` — True if the point has an M value.
  /// - `spatialReference` — The point's spatial reference. If null the point
  /// will be treated as having the view spatial reference.
  void _setPointGeometry(
      {required double x,
      required double y,
      required double z,
      required double m,
      required bool hasZ,
      required bool hasM,
      required SpatialReference? spatialReference}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Graphic_setPointGeometry(_handle, x, y, z, m, hasZ, hasM,
          spatialReference?._handle ?? ffi.nullptr, errorHandler);
    });
  }
}

final class _GraphicFactory
    implements _InstanceFactory<Graphic, RT_GraphicHandle> {
  @override
  Graphic createInstance({required RT_GraphicHandle handle}) {
    return Graphic._withHandle(handle);
  }

  @override
  void destroyHandle(RT_GraphicHandle handle) {
    bindings.Graphic_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_GraphicHandle handle) {
    return runtimecore.RT_Graphic_getInstanceId(handle, ffi.nullptr);
  }
}

/// What should be done with graphic resources when the map view is in a paused
/// state.
///
/// Should graphic resources be recycled or not while the map view is in a
/// paused state. Recycling will decrease memory usage on the device.
enum _GraphicsHardwareResources {
  /// Give the graphics resources back to the device. This will decrease the
  /// amount of memory used. It will take time to resume and recreate the
  /// graphics resources. This is useful when the application is in the
  /// background.
  recycle,

  /// Continue to keep the graphic resources. This will keep memory at the
  /// current level. Resume will be faster because the graphic resources will
  /// not have to be recreated. This is useful when the application is pausing
  /// the map view and will return to it quickly.
  save;

  factory _GraphicsHardwareResources._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return recycle;
      case 1:
        return save;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case recycle:
        return 0;
      case save:
        return 1;
    }
  }
}

/// Manages a collection of graphics that can be displayed in a map view or
/// scene view.
///
/// Graphics overlays displays a collection of graphics on top of all the layers
/// (including reference layers) in a map view or scene view. Every map view or
/// scene view can contain a collection of graphics overlays
/// ([GeoViewController.graphicsOverlays]), and each graphics overlay can
/// contain a collection of graphics ([GraphicsOverlay.graphics]). The graphics
/// in the first [GraphicsOverlay] are drawn first, with subsequent
/// [GraphicsOverlay.graphics] on top. The [GraphicsOverlay.renderer] defines
/// the symbology of the [GraphicsOverlay.graphics] collection.
///
/// A graphic's [Graphic.zIndex] value defines its draw order within the
/// graphics overlay that contains it. The [Graphic.zIndex] value applies in a
/// map view and a scene view if the scene view drapes the graphics on the
/// surface (`SurfacePlacement.drapedFlat`). In other scene view rendering, the
/// graphic's display order is determined by the distance to the camera rather
/// than by Z-index.
///
/// If the [Graphic.zIndex] value is not set, graphics will render in the order
/// in which they were added to the graphics overlay. The first added is
/// rendered first and subsequent ones on top. In rare cases, the rendering
/// algorithm may change the display order to provide more efficient rendering.
/// If ordering is important, set the [Graphic.zIndex] explicitly on graphics.
///
/// To improve view responsiveness, you can set the
/// [GraphicsOverlay.renderingMode] to either of these options:
///
///   * [GraphicsRenderingMode.dynamic] - graphics are updated immediately as
/// the [GeoViewController] is panned or zoomed (default).
///   * [GraphicsRenderingMode.static] - graphics are updated once the pan or
/// zoom operation on the [GeoViewController] is finished. This is best for
/// rendering large numbers of graphics.
final class GraphicsOverlay implements _InstanceId, ffi.Finalizable {
  final RT_GraphicsOverlayHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.GraphicsOverlay_destroyInstance.cast());

  static GraphicsOverlay? _fromHandle(RT_GraphicsOverlayHandle handle) {
    if (handle == ffi.nullptr) return null;
    return GraphicsOverlay._instanceCache.instanceWith(handle);
  }

  GraphicsOverlay._withHandle(RT_GraphicsOverlayHandle handle)
      : _featureReduction = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GraphicsOverlay_getFeatureReduction(
                handle, errorHandler);
          });
          return FeatureReduction._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GraphicsOverlay_setFeatureReduction(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _graphics = Memoized(getter: () {
          final vectorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GraphicsOverlay_getGraphics(
                handle, errorHandler);
          });
          return vectorHandle.toList();
        }),
        _renderer = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_GraphicsOverlay_getRenderer(
                handle, errorHandler);
          });
          return Renderer._fromHandle(objectHandle);
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_GraphicsOverlay_setRenderer(
                handle, value?._handle ?? ffi.nullptr, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.GraphicsOverlay_created(_handle);
    }
  }

  static final _instanceCache = _InstanceCache(
      factory: _GraphicsOverlayFactory(), kind: 'GraphicsOverlay');

  /// Creates a graphics overlay object.
  factory GraphicsOverlay() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_create(errorHandler);
    });
    return GraphicsOverlay._instanceCache.instanceWith(handle);
  }

  /// Calculates and returns the extent of the [GraphicsOverlay.graphics]
  /// collection.
  ///
  /// The extent's [SpatialReference] is that of the [GeoViewController] that
  /// contains the overlay. If the overlay is not in a view, returns null. If
  /// the overlay is in a view but that view does not yet have a spatial
  /// reference, returns null. If the overlay is in a view with a spatial
  /// reference, but has no graphics, then an empty envelope will be returned.
  Envelope? get extent {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getExtent(_handle, errorHandler);
    });
    return Envelope._fromHandle(objectHandle);
  }

  /// Defines properties for dynamically aggregating and summarizing groups of
  /// graphics as the map scale and visible extent change.
  ///
  /// [FeatureReduction] is only supported for point graphics in dynamic
  /// rendering mode ([GraphicsRenderingMode.dynamic]) in 2D. [FeatureReduction]
  /// is ignored and will result in the original point graphics being rendered
  /// for a [GraphicsOverlay] that:
  ///   1. Uses static rendering mode.
  ///   2. Is added to a `SceneView`.
  ///   3. Uses an unsupported renderer for the
  /// `AggregationFeatureReduction.renderer`. See
  /// `AggregationFeatureReduction.renderer` for more info.
  ///
  /// If this property is explicitly set to null, [FeatureReduction] is removed
  /// from the [GraphicsOverlay].
  FeatureReduction? get featureReduction => _featureReduction.value;

  set featureReduction(FeatureReduction? value) =>
      _featureReduction.value = value;

  final Memoized<FeatureReduction?> _featureReduction;

  /// The modifiable collection of graphics in this graphics overlay.
  ///
  /// You can add or remove graphics from this collection to modify what is
  /// displayed in the [GeoViewController].
  ///
  /// If Z-index for graphics is not set, they usually render in the order in
  /// which they were added to the graphics overlay, the first added is rendered
  /// first and subsequent ones on top. In rare cases, the rendering algorithm
  /// may change the display order to provide more efficient rendering. If
  /// ordering is important, set the [Graphic.zIndex] explicitly on graphics.
  /// You can also place graphics of the same geometry type in their own
  /// graphics overlay and manage the order of the overlays in the view.
  ///
  /// The graphics property is initially empty and can never be null.
  List<Graphic> get graphics => _graphics.value;

  final Memoized<_MutableArrayList<Graphic>> _graphics;

  /// A string that identifies the graphics overlay in the
  /// [GeoViewController.graphicsOverlays] collection.
  ///
  /// You can give a graphics overlay an ID. If the collection of graphics
  /// overlays in a [GeoViewController] contains several graphics overlays, you
  /// can use the ID to find the one you need.
  ///
  /// The default value of id is an empty string. A graphics overlay's id does
  /// not need to be unique.
  String get id {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  set id(String value) {
    final coreValue = _CString(value);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setId(
          _handle, coreValue.bytes, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// True if the graphics overlay is visible, false otherwise.
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getIsVisible(_handle, errorHandler);
    });
  }

  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// True if labels are displayed for graphics in this graphics overlay, false
  /// otherwise.
  bool get labelsEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getLabelsEnabled(
          _handle, errorHandler);
    });
  }

  set labelsEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setLabelsEnabled(
          _handle, value, errorHandler);
    });
  }

  /// The maximum scale at which to display the graphics overlay. A small number
  /// allows the map to display the layer when zooming further in.
  ///
  /// This controls the maximum scale at which the graphics overlay is
  /// displayed. If the current map scale is smaller than the maximum scale,
  /// then this graphics overlay will not be displayed.
  ///
  /// A scale is usually referred to as 1:X, where X is the scale specified
  /// here. This value is the relative scale to the real world, where one inch
  /// on the screen is X inches in the real world. Note that this is only an
  /// approximation and is dependent on the map's projection that can add some
  /// distortion, as well as the system's reported DPI setting which doesn't
  /// necessarily match the actual DPI of the screen.
  ///
  /// The default value of this property is NaN which makes the layer unbounded
  /// by any scale.
  double get maxScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getMaxScale(_handle, errorHandler);
    });
  }

  set maxScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setMaxScale(_handle, value, errorHandler);
    });
  }

  /// The minimum scale at which to display the graphics overlay. A large number
  /// allows the map to display the layer when zooming further out.
  ///
  /// This controls the minimum scale at which the graphics overlay is
  /// displayed. If the current map scale is larger than the minimum scale, then
  /// this graphics overlay will not be displayed.
  ///
  /// A scale is usually referred to as 1:X, where X is the scale specified
  /// here. This value is the relative scale to the real world, where one inch
  /// on the screen is X inches in the real world. Note that this is only an
  /// approximation and is dependent on the map's projection that can add some
  /// distortion, as well as the system's reported DPI setting which doesn't
  /// necessarily match the actual DPI of the screen.
  ///
  /// The default value of this property is NaN which makes the layer unbounded
  /// by any scale.
  double get minScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getMinScale(_handle, errorHandler);
    });
  }

  set minScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setMinScale(_handle, value, errorHandler);
    });
  }

  /// The opacity for the graphics overlay.
  ///
  /// Must be a value between 0 and 1 with 1 being solid or opaque and 0 being
  /// transparent. The default opacity is 1.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getOpacity(_handle, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setOpacity(_handle, value, errorHandler);
    });
  }

  /// Defines how graphics in the overlay are symbolized when displayed.
  ///
  /// Symbols set on the individual graphics will override the renderer.
  Renderer? get renderer => _renderer.value;

  set renderer(Renderer? value) => _renderer.value = value;

  final Memoized<Renderer?> _renderer;

  /// The rendering mode used to display graphics in the overlay.
  ///
  /// For more efficient rendering of large numbers of graphics, set the
  /// rendering mode to [GraphicsRenderingMode.static]. In order to ensure map
  /// responsiveness, static rendering does not refresh the display while pan
  /// and zoom operations are in progress. The amount of graphics an overlay can
  /// handle in this mode is mainly limited by the system memory.
  GraphicsRenderingMode get renderingMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getRenderingMode(
          _handle, errorHandler);
    });
    return GraphicsRenderingMode._fromCoreValue(coreValue);
  }

  set renderingMode(GraphicsRenderingMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setRenderingMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// True if the graphic overlay's symbols and labels honor the map reference
  /// scale when displayed in a map view, false otherwise.
  ///
  /// If the map has a positive reference scale, and the overlay honors it, then
  /// symbols and labels will be drawn at their specified size when the viewing
  /// scale is the same as the reference scale. They will grow or shrink as the
  /// view zooms in or out to keep the symbol a fixed size on the map. If the
  /// map has no reference scale, the reference scale is zero, or
  /// [GraphicsOverlay.scaleSymbols] is false, the symbols and labels will be
  /// drawn at their fixed screen size.
  ///
  /// [GraphicsOverlay.scaleSymbols] only affects display in an
  /// [ArcGISMapViewController]. The symbols and labels will be displayed at
  /// fixed screen size in a `SceneView`.
  ///
  /// The default value is false.
  bool get scaleSymbols {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getScaleSymbols(
          _handle, errorHandler);
    });
  }

  set scaleSymbols(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_setScaleSymbols(
          _handle, value, errorHandler);
    });
  }

  /// Deselects all graphics in the graphics overlay.
  void clearSelection() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_clearSelection(_handle, errorHandler);
    });
  }

  /// Returns a collection of all the selected graphics in the graphics overlay.
  ///
  /// Return Value: A [List] of [Graphic]
  List<Graphic> getSelectedGraphics() {
    final arrayHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_GraphicsOverlay_getSelectedGraphics(
          _handle, errorHandler);
    });
    return arrayHandle.toList();
  }

  /// Selects the specified graphics.
  ///
  /// Any graphics that are not in the overlay will be ignored.
  ///
  /// Parameters:
  /// - `graphics` — The graphics to be selected.
  void selectGraphics({required List<Graphic> graphics}) {
    final coreGraphics =
        graphics.toMutableArray(valueType: _ElementType.graphic);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_selectGraphics(
          _handle, coreGraphics._handle, errorHandler);
    });
  }

  /// Unselects the specified graphics.
  ///
  /// Any graphics that are not in the overlay will be ignored.
  ///
  /// Parameters:
  /// - `graphics` — The graphics to be unselected.
  void unselectGraphics({required List<Graphic> graphics}) {
    final coreGraphics =
        graphics.toMutableArray(valueType: _ElementType.graphic);
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_GraphicsOverlay_unselectGraphics(
          _handle, coreGraphics._handle, errorHandler);
    });
  }
}

final class _GraphicsOverlayFactory
    implements _InstanceFactory<GraphicsOverlay, RT_GraphicsOverlayHandle> {
  @override
  GraphicsOverlay createInstance({required RT_GraphicsOverlayHandle handle}) {
    return GraphicsOverlay._withHandle(handle);
  }

  @override
  void destroyHandle(RT_GraphicsOverlayHandle handle) {
    bindings.GraphicsOverlay_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_GraphicsOverlayHandle handle) {
    return runtimecore.RT_GraphicsOverlay_getInstanceId(handle, ffi.nullptr);
  }
}

/// The different rendering modes for [GraphicsOverlay].
enum GraphicsRenderingMode {
  /// Dynamic rendering mode - the default. Update graphics as the map zooms and
  /// pans in an immediate mode.
  dynamic,

  /// Static rendering mode. Only update graphics between zoom and pan
  /// operations in a retained mode. Use this mode to handle large amount of
  /// graphics.
  static;

  factory GraphicsRenderingMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return dynamic;
      case 1:
        return static;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case dynamic:
        return 0;
      case static:
        return 1;
    }
  }
}

/// Grid is a base class for MGRSGrid, USNGGrid, UTMGrid and
/// LatitudeLongitudeGrid that represents the display of a coordinate system
/// grid on the map view.
///
/// It contains all of the common operations and properties that apply to
/// displaying and working with the different grids currently supported. This
/// includes toggling visibility and configuring layout and appearance
/// preferences.
final class Grid implements ffi.Finalizable {
  final RT_GridHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Grid_destroy.cast());

  static Grid? _fromHandle(RT_GridHandle handle) {
    if (handle == ffi.nullptr) return null;
    switch (Grid._objectTypeOf(handle)) {
      case _GridType.latitudeLongitudeGrid:
        return LatitudeLongitudeGrid._withHandle(handle);
      case _GridType.mgrsGrid:
        return MgrsGrid._withHandle(handle);
      case _GridType.usngGrid:
        return UsngGrid._withHandle(handle);
      case _GridType.utmGrid:
        return UtmGrid._withHandle(handle);
      case _GridType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
    }
  }

  static _GridType _objectTypeOf(RT_GridHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getObjectType(handle, errorHandler);
    });
    return _GridType._fromCoreValue(coreValue);
  }

  _GridType get _objectType => Grid._objectTypeOf(_handle);

  Grid._withHandle(RT_GridHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Grid_created(_handle);
    }
  }

  /// The visibility of the grid.
  bool get isVisible {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getIsVisible(_handle, errorHandler);
    });
  }

  set isVisible(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setIsVisible(_handle, value, errorHandler);
    });
  }

  /// The grid's text label offset from the edge of the map view in DIPS.
  double get labelOffset {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getLabelOffset(_handle, errorHandler);
    });
  }

  set labelOffset(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setLabelOffset(_handle, value, errorHandler);
    });
  }

  /// The positioning of the grid's labels.
  GridLabelPosition get labelPosition {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getLabelPosition(_handle, errorHandler);
    });
    return GridLabelPosition._fromCoreValue(coreValue);
  }

  set labelPosition(GridLabelPosition value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setLabelPosition(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The visibility of the grid's labels.
  bool get labelVisibility {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getLabelVisibility(_handle, errorHandler);
    });
  }

  set labelVisibility(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setLabelVisibility(_handle, value, errorHandler);
    });
  }

  /// The number of levels of resolution supported by the grid. The line and
  /// label style can be set for each of these resolution levels.
  ///
  /// The resolution of the displayed grid may adapt as the scale of the
  /// displayed map changes. This method returns the finite number of different
  /// resolutions that are available for this grid.
  int get levelCount {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getLevelCount(_handle, errorHandler);
    });
  }

  /// Returns the line symbol used for the grid lines at the given resolution
  /// level.
  ///
  /// Parameters:
  /// - `level` — The resolution level.
  ///
  /// Return Value: An [ArcGISSymbol]. Returns null on error.
  ArcGISSymbol getLineSymbol({required int level}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getLineSymbol(_handle, level, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle)!;
  }

  /// Get the text symbol used for the grid labels at the given resolution
  /// level.
  ///
  /// Parameters:
  /// - `level` — The resolution level.
  ///
  /// Return Value: An [ArcGISSymbol]. Returns null on error.
  ArcGISSymbol getTextSymbol({required int level}) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Grid_getTextSymbol(_handle, level, errorHandler);
    });
    return ArcGISSymbol._fromHandle(objectHandle)!;
  }

  /// Set the line symbol used for the grid lines at the given resolution level.
  ///
  /// Parameters:
  /// - `level` — The resolution level.
  /// - `lineSymbol` — The line symbol to use for the grid lines at the given
  /// resolution level.
  void setLineSymbol({required int level, required ArcGISSymbol lineSymbol}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setLineSymbol(
          _handle, level, lineSymbol._handle, errorHandler);
    });
  }

  /// Set the text symbol used for the grid labels at the given resolution
  /// level.
  ///
  /// Parameters:
  /// - `level` — The resolution level.
  /// - `textSymbol` — The text symbol to use for the grid labels at the given
  /// resolution level.
  void setTextSymbol({required int level, required ArcGISSymbol textSymbol}) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Grid_setTextSymbol(
          _handle, level, textSymbol._handle, errorHandler);
    });
  }
}

/// A positioning scheme to use when labeling a Grid.
enum GridLabelPosition {
  /// Labels anchored to a geographical position on the map view.
  geographic,

  /// 'Y' labels anchored to left of map view, 'X' labels anchored to bottom.
  bottomLeft,

  /// 'Y' labels anchored to right of map view, 'X' labels anchored to bottom.
  bottomRight,

  /// 'Y' labels anchored to left of map view, 'X' labels anchored to top.
  topLeft,

  /// 'Y' labels anchored to right of map view, 'X' labels anchored to top.
  topRight,

  /// 'Y' and 'X' labels in center of map view.
  center,

  /// Labels anchored to top, right, bottom, and left of map view.
  allSides;

  factory GridLabelPosition._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return geographic;
      case 1:
        return bottomLeft;
      case 2:
        return bottomRight;
      case 3:
        return topLeft;
      case 4:
        return topRight;
      case 5:
        return center;
      case 6:
        return allSides;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case geographic:
        return 0;
      case bottomLeft:
        return 1;
      case bottomRight:
        return 2;
      case topLeft:
        return 3;
      case topRight:
        return 4;
      case center:
        return 5;
      case allSides:
        return 6;
    }
  }
}

/// The type of Grid.
///
/// Tells you what Grid you are working with.
enum _GridType {
  /// The Grid is a [LatitudeLongitudeGrid].
  latitudeLongitudeGrid,

  /// The Grid is an [UtmGrid].
  utmGrid,

  /// The Grid is a [MgrsGrid].
  mgrsGrid,

  /// The Grid is an [UsngGrid].
  usngGrid,

  /// This value is returned from C_API functions returning [_GridType] when an
  /// error has occurred.
  unknown;

  factory _GridType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return latitudeLongitudeGrid;
      case 1:
        return utmGrid;
      case 2:
        return mgrsGrid;
      case 3:
        return usngGrid;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case latitudeLongitudeGrid:
        return 0;
      case utmGrid:
        return 1;
      case mgrsGrid:
        return 2;
      case usngGrid:
        return 3;
      case unknown:
        return -1;
    }
  }
}

/// Identify result containing an overlay and the identified geoelements of that
/// overlay.
///
/// You need to pass this object to identify result functions.
final class IdentifyGraphicsOverlayResult implements ffi.Finalizable {
  final RT_IdentifyGraphicsOverlayResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.IdentifyGraphicsOverlayResult_destroy.cast());

  static IdentifyGraphicsOverlayResult? _fromHandle(
      RT_IdentifyGraphicsOverlayResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return IdentifyGraphicsOverlayResult._withHandle(handle);
  }

  IdentifyGraphicsOverlayResult._withHandle(
      RT_IdentifyGraphicsOverlayResultHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyGraphicsOverlayResult_getError(
                handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _geoElements = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyGraphicsOverlayResult_getGeoElements(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _graphics = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyGraphicsOverlayResult_getGraphics(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _graphicsOverlay = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore
                .RT_IdentifyGraphicsOverlayResult_getGraphicsOverlay(
                    handle, errorHandler);
          });
          return GraphicsOverlay._fromHandle(objectHandle)!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.IdentifyGraphicsOverlayResult_created(_handle);
    }
  }

  /// The error that occurred during the identify operation, if there is one.
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// A list of identified geoelements.
  ///
  /// If there are no geoelement results in the overlay, an empty array is
  /// returned. This array may contain the identified graphics or identified
  /// aggregate geoelements if the overlay is enabled with
  /// `AggregationFeatureReduction`.
  List<GeoElement> get geoElements => _geoElements.value;

  final Memoized<_ArrayList<GeoElement>> _geoElements;

  /// The identify result's list of identified graphics.
  List<Graphic> get graphics => _graphics.value;

  final Memoized<_ArrayList<Graphic>> _graphics;

  /// The overlay identify result's overlay.
  GraphicsOverlay get graphicsOverlay => _graphicsOverlay.value;

  final Memoized<GraphicsOverlay> _graphicsOverlay;
}

/// Identify result containing a layer and the identified elements of that
/// layer.
///
/// You need to pass this object to identify result functions.
final class IdentifyLayerResult implements ffi.Finalizable {
  final RT_IdentifyLayerResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.IdentifyLayerResult_destroy.cast());

  static IdentifyLayerResult? _fromHandle(RT_IdentifyLayerResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return IdentifyLayerResult._withHandle(handle);
  }

  IdentifyLayerResult._withHandle(RT_IdentifyLayerResultHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyLayerResult_getError(
                handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _geoElements = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyLayerResult_getGeoElements(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _layerContent = Memoized(getter: () {
          final elementHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyLayerResult_getLayerContent(
                handle, errorHandler);
          });
          return _Element._withHandle(elementHandle).getDartValue();
        }),
        _sublayerResults = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_IdentifyLayerResult_getSublayerResults(
                handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.IdentifyLayerResult_created(_handle);
    }
  }

  /// The error that occurred during the identify operation, if there is one.
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// The identify result's list of identified graphics.
  ///
  /// If there are no geo element results at the layer level (for layers where
  /// geo element results are exposed in sublayer results), an empty array is
  /// returned. The array type depends on the type of objects contained in the
  /// layer and whether `AggregationFeatureReduction` is enabled on the layer.
  /// When `AggregationFeatureReduction` is enabled on the layer, array type
  /// will be either `AggregateGeoElement` or the [GeoElement] type contained in
  /// the layer. The function will always return an array containing objects
  /// that implement [GeoElement].
  List<GeoElement> get geoElements => _geoElements.value;

  final Memoized<_ArrayList<GeoElement>> _geoElements;

  /// If the transfer limit was exceeded for the identify results.
  bool get isTransferLimitExceeded {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_IdentifyLayerResult_getIsTransferLimitExceeded(
          _handle, errorHandler);
    });
  }

  /// The layer identify result's layer content (a [LayerContent]).
  ///
  /// The element will contain an object that implements [LayerContent]. This
  /// may be either an [ArcGISSublayer] or a [Layer].
  LayerContent get layerContent => _layerContent.value;

  final Memoized<LayerContent> _layerContent;

  /// The identify layer result's list of sub results.
  ///
  /// For layers that do not contain sublayers, this array will be empty.
  List<IdentifyLayerResult> get sublayerResults => _sublayerResults.value;

  final Memoized<_ArrayList<IdentifyLayerResult>> _sublayerResults;
}

/// An insets object.
///
/// This is used to control the active visible area, instructing a Map View to
/// ignore parts that may be obstructed by transparent / translucent GUI
/// elements and affecting the Map View's logical center, the reported
/// visibleArea, and the location display. The Insets may be invalidated if the
/// Map View is resized without the Insets being updated. APIs should call the
/// [ArcGISMapViewController._areInsetsValidAfterResize] to determine whether
/// the Insets are still valid and report invalid insets to the user in a
/// platform-appropriate manner. Invalid insets are simply ignored. Inset values
/// are in DIPs, not in pixels.
final class Insets implements ffi.Finalizable {
  final RT_InsetsHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Insets_destroy.cast());

  static Insets? _fromHandle(RT_InsetsHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Insets._withHandle(handle);
  }

  Insets._withHandle(RT_InsetsHandle handle) : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Insets_created(_handle);
    }
  }

  /// Create an immutable insets object.
  ///
  /// Parameters:
  /// - `left` — The inset from the left edge in DIPs.
  /// - `right` — The inset from the right edge in DIPs.
  /// - `top` — The inset from the top edge in DIPs.
  /// - `bottom` — The inset from the bottom edge in DIPs.
  factory Insets(
      {required double left,
      required double right,
      required double top,
      required double bottom}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_create(
          left, right, top, bottom, errorHandler);
    });
    return Insets._withHandle(handle);
  }

  /// The bottom parameter in insets.
  double get bottom {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_getBottom(_handle, errorHandler);
    });
  }

  set bottom(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Insets_setBottom(_handle, value, errorHandler);
    });
  }

  /// The left parameter in insets.
  double get left {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_getLeft(_handle, errorHandler);
    });
  }

  set left(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Insets_setLeft(_handle, value, errorHandler);
    });
  }

  /// The right parameter in insets.
  double get right {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_getRight(_handle, errorHandler);
    });
  }

  set right(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Insets_setRight(_handle, value, errorHandler);
    });
  }

  /// The top parameter in insets.
  double get top {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_getTop(_handle, errorHandler);
    });
  }

  set top(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_Insets_setTop(_handle, value, errorHandler);
    });
  }

  /// Determine if the insets are set to default values.
  ///
  /// Return Value: true if the inset of all 4 edges are 0; false otherwise.
  bool getIsEmpty() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Insets_getIsEmpty(_handle, errorHandler);
    });
  }
}

/// Indicates the type of pointing device used to interact with a
/// `GeometryEditor`, which determines the default tolerance used to identify
/// sketch elements within the [GeoViewController].
enum _InteractionDeviceType {
  /// User is interacting with the [GeoViewController] using a mouse.
  ///
  /// The default tolerance used to identify `GeometryEditor` elements is 5
  /// DIPs.
  mouse,

  /// User is interacting with the [GeoViewController] using touch.
  ///
  /// The default tolerance used to identify `GeometryEditor` elements is 15
  /// DIPs.
  touch,

  /// User is interacting with the [GeoViewController] using a stylus.
  ///
  /// The default tolerance used to identify `GeometryEditor` elements is 10
  /// DIPs.
  stylus;

  factory _InteractionDeviceType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return mouse;
      case 1:
        return touch;
      case 2:
        return stylus;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case mouse:
        return 0;
      case touch:
        return 1;
      case stylus:
        return 2;
    }
  }
}

/// A grid consisting of east-west lines of latitude and north-south lines of
/// longitude.
///
/// This class represents graticules--lines showing parallels of latitude and
/// meridians of longitude for the earth.
///
/// The position of the graticules are based on the WGS84 ellipsoid,
/// irrespective of the spatial reference used by the map view.
///
/// To display graticules, create a LatitudeLongitudeGrid and set it as the grid
/// property within the MapView.
///
/// LatitudeLongitudeGrid extends Grid, adding the label unit property.
final class LatitudeLongitudeGrid extends Grid {
  static LatitudeLongitudeGrid? _fromHandle(
      RT_LatitudeLongitudeGridHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LatitudeLongitudeGrid._withHandle(handle);
  }

  LatitudeLongitudeGrid._withHandle(super.handle) : super._withHandle();

  /// Constructs a grid consisting of east-west lines of latitude and
  /// north-south lines of longitude (also known as graticules).
  ///
  /// The grid is supported in spatial references which are continuously
  /// pannable or some polar spatial references. You can check the
  /// [SpatialReference.isPannable] property is true on your spatial reference.
  /// Examples of continuously pannable spatial references include WGS84 (WKID
  /// 4326) and Web Mercator Auxiliary Sphere (WKID 102113, 102100, or 3857).
  ///
  /// The following polar spatial references are also supported:
  /// * North pole Azimuthal Equidistant (WKID 102016)
  /// * North pole gnomic (WKID 102034)
  /// * North pole Lambert equal area (WKID 102017)
  /// * North pole orthographic (WKID 102035)
  /// * North pole stereographic (WKID 102018)
  /// * NSIDE EASE North (WKID 3408)
  /// * NSIDC Sea Ice polar stereographic north (WKID 3411)
  /// * WGS 1984 NSIDC Sea Ice Polar Stereographic North (WKID 3413)
  /// * UPS North (WKID 32661)
  /// * South pole Azimuthal Equidistant (WKID 102019)
  /// * South pole gnomic (WKID 102036)
  /// * South pole Lambert equal area (WKID 102020)
  /// * South pole orthographic (WKID 102037)
  /// * South pole stereographic (WKID 102021)
  /// * NSIDE EASE South (WKID 3409)
  /// * NSIDC Sea Ice polar stereographic South (WKID 3412)
  /// * UPS South (WKID 32761)
  /// * WGS1984 Antarctic polar stereographic (WKID 3031)
  factory LatitudeLongitudeGrid() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LatitudeLongitudeGrid_create(errorHandler);
    });
    return LatitudeLongitudeGrid._withHandle(handle);
  }

  /// The format used for labeling the grid.
  LatitudeLongitudeGridLabelFormat get labelFormat {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LatitudeLongitudeGrid_getLabelFormat(
          _handle, errorHandler);
    });
    return LatitudeLongitudeGridLabelFormat._fromCoreValue(coreValue);
  }

  set labelFormat(LatitudeLongitudeGridLabelFormat value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LatitudeLongitudeGrid_setLabelFormat(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The format to use when labeling a [LatitudeLongitudeGrid].
enum LatitudeLongitudeGridLabelFormat {
  /// Label the grid lines (graticules) in decimal degrees.
  decimalDegrees,

  /// Label the grid lines (graticules) in degrees, minutes and seconds.
  degreesMinutesSeconds;

  factory LatitudeLongitudeGridLabelFormat._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return decimalDegrees;
      case 1:
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
      case degreesMinutesSeconds:
        return 1;
    }
  }
}

/// The state of a layer in a [GeoViewController].
///
/// This object allows you to know the current state of a layer in a view.
final class LayerViewState implements ffi.Finalizable {
  final RT_LayerViewStateHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.LayerViewState_destroy.cast());

  static LayerViewState? _fromHandle(RT_LayerViewStateHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LayerViewState._withHandle(handle);
  }

  LayerViewState._withHandle(RT_LayerViewStateHandle handle)
      : _error = Memoized(getter: () {
          final errorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LayerViewState_getError(handle, errorHandler);
          });
          return errorHandle.toArcGISException();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LayerViewState_created(_handle);
    }
  }

  /// The error that describes a problem encountered when displaying layers in a
  /// [GeoViewController].
  ///
  /// For your application, an error may be critical for the user's interaction
  /// with the view's data content. Depending on the type of problem
  /// encountered, you could:
  /// * Call [Layer.retryLoad]
  /// * Remove the layer from the [ArcGISMap] or `ArcGISScene`
  /// * Inspect the data
  /// * Check your network connection
  /// * Check whether an online service is experiencing problems
  ArcGISException? get error => _error.value;

  final Memoized<ArcGISException?> _error;

  /// The status of a layer in the view.
  LayerViewStatus get status {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LayerViewState_getStatus(_handle, errorHandler);
    });
    return LayerViewStatus._fromCoreValue(coreValue);
  }
}

/// The status of a layer in the [GeoViewController].
///
/// This status is used to determine whether a layer is displaying in a
/// [GeoViewController] or whether it is still loading, not visible, out of
/// scale, or has encountered an error or warning. Each layer can have multiple
/// states at the same time. For example, a layer could be both
/// [LayerViewStatus.notVisible] and [LayerViewStatus.outOfScale], or it could
/// be [LayerViewStatus.notVisible] and [LayerViewStatus.loading]. These
/// multiple states are represented using a flag enumeration.
///
/// A status of [LayerViewStatus.active] indicates that the layer is being
/// displayed in the view. Note, that some of the layer view states are not
/// possible together. For example, a layer cannot be both
/// [LayerViewStatus.active] and [LayerViewStatus.notVisible] at the same time.
///
/// If you implement a layer list in a table of contents (TOCs), you can use the
/// layer view status to manage the TOC user interface. For example, you could
/// gray out the layer if it is [LayerViewStatus.outOfScale], or you could show
/// a spinning icon if the layer is [LayerViewStatus.loading]. If the layer list
/// contains a `GroupLayer` that is [LayerViewStatus.notVisible] then its child
/// layers will be [LayerViewStatus.notVisible]. If, the `GroupLayer` is visible
/// then each child layer can be either visible or [LayerViewStatus.notVisible].
///
/// If the layer completely fails to load or render you will encounter a
/// [LayerViewStatus.error]. If the layer fails to render some of its content
/// then you will encounter a [LayerViewStatus.warning]. This could be due to
/// the temporary loss of a network connection, failing layer requests or
/// exceeding the max feature count. In both cases you will find more details
/// about the problem in the [LayerViewState.error].
enum LayerViewStatus {
  /// = 1, The layer in the view is active.
  ///
  /// A status of [LayerViewStatus.active] indicates that the layer is being
  /// displayed in the view.
  active,

  /// = 2, The layer in the view is not visible.
  notVisible,

  /// = 4, The layer in the view is out of scale.
  ///
  /// A status of [LayerViewStatus.outOfScale] indicates that the view is zoomed
  /// outside of the scale range of the layer. If the view is zoomed too far in
  /// (e.g. to a street level) it is beyond the max scale defined for the layer.
  /// If the view has zoomed to far out (e.g. to global scale) it is beyond the
  /// min scale defined for the layer.
  outOfScale,

  /// = 8, The layer in the view is loading.
  ///
  /// Once loading has completed, the layer will be available for display in the
  /// view. If there was a problem loading the layer, the status will be set to
  /// [LayerViewStatus.error] and the [LayerViewState.error] property will
  /// provide details on the specific problem.
  loading,

  /// = 16, The layer in the view has an unrecoverable error.
  ///
  /// When the status is [LayerViewStatus.error], the layer cannot be rendered
  /// in the view. For example, it may have failed to load, be an unsupported
  /// layer type or contain invalid data.
  ///
  /// The [LayerViewState.error] property will provide more details about the
  /// specific problem which was encountered. Depending on the type of problem,
  /// you could:
  /// * Call [Layer.retryLoad]
  /// * Remove the layer from the [ArcGISMap] or `ArcGISScene`
  /// * Inspect the data
  error,

  /// = 32, The layer in the view has encountered an error which may be
  /// temporary.
  ///
  /// When the status is [LayerViewStatus.warning], the layer may still be
  /// displayed in the view. It is possible for the status to be both
  /// [LayerViewStatus.active] and [LayerViewStatus.warning].
  ///
  /// A warning status indicates that the layer has encountered a problem but
  /// may still be usable. For example, some tiles or features may be failing to
  /// load due to network failure or server error.
  ///
  /// You should be aware that when a [LayerViewStatus.warning] is received, the
  /// layer may not be showing all data or it may be showing data which is not
  /// up-to-date.
  ///
  /// The [LayerViewState.error] property will provide more details about the
  /// specific problem which was encountered. Depending on the type of problem,
  /// you could:
  /// * Check your network connection
  /// * Check whether an online service is experiencing problems
  warning;

  factory LayerViewStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 1:
        return active;
      case 2:
        return notVisible;
      case 4:
        return outOfScale;
      case 8:
        return loading;
      case 16:
        return error;
      case 32:
        return warning;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case active:
        return 1;
      case notVisible:
        return 2;
      case outOfScale:
        return 4;
      case loading:
        return 8;
      case error:
        return 16;
      case warning:
        return 32;
    }
  }
}

/// Manages the display of a device's location in an [ArcGISMapViewController].
///
/// Location display can retrieve the device's current location from a
/// [LocationDataSource] and display it on top of an [ArcGISMap]. As the device
/// moves, the map view can respond to new locations by updating the position of
/// the location symbol on the display. It can also set the viewpoint when an
/// updated location is received, or automatically pan and rotate the map when
/// the current location, heading, or course changes.
///
/// Each [ArcGISMapViewController] has its own instance of [LocationDisplay] so
/// you don't have to explicitly instantiate the location display. The location
/// information is provided by a [LocationDataSource]. The current position of
/// the device is provided by default from the operating system. To start
/// receiving location updates, and display the current location, you must start
/// the location display's data source.
///
/// Apart from the device operating system's built-in location, you can also
/// display locations from other sources, including external (high accuracy)
/// GPS, an indoor positioning system (IPS), or simulated locations (for mocking
/// location updates) using the following location data sources:
///
/// * [SimulatedLocationDataSource]
/// * `NmeaLocationDataSource`
/// * `IndoorsLocationDataSource`
/// * `RouteTrackerLocationDataSource`
///
/// By default, the location display uses a blue, round symbol to show the
/// current location. Depending on signal strength, satellite positions, and
/// other factors, the accuracy of the reported location can vary. An additional
/// blue circle ([LocationDisplay.accuracySymbol]) around the location symbol
/// indicates the estimated range of accuracy for the current location. As
/// locations are read from the configured [LocationDataSource], this outer
/// circle may contract and expand as accuracy increases or decreases. You can
/// display further information about the location using the following symbols:
///
/// * [LocationDisplay.acquiringSymbol]
/// * [LocationDisplay.courseSymbol]
/// * [LocationDisplay.headingSymbol]
/// * [LocationDisplay.pingAnimationSymbol]
///
/// You can change the default symbology of these symbols to make them more
/// visible against the underlying map cartography, increase their visibility
/// for visually impaired users, or match an app's visual appearance.
final class LocationDisplay
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_LocationDisplayHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.LocationDisplay_destroyInstance.cast());

  static LocationDisplay? _fromHandle(RT_LocationDisplayHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocationDisplay._instanceCache.instanceWith(handle);
  }

  LocationDisplay._withHandle(RT_LocationDisplayHandle handle)
      : _accuracySymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getAccuracySymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setAccuracySymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _acquiringSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getAcquiringSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setAcquiringSymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _courseSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getCourseSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setCourseSymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _dataSource = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getDataSource(
                handle, errorHandler);
          });
          return LocationDataSource._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setDataSource(
                handle, value._handle, errorHandler);
          });
        }),
        _defaultSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getDefaultSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setDefaultSymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _headingSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getHeadingSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setHeadingSymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _pingAnimationSymbol = Memoized(getter: () {
          final objectHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_LocationDisplay_getPingAnimationSymbol(
                handle, errorHandler);
          });
          return ArcGISSymbol._fromHandle(objectHandle)!;
        }, setter: (value) {
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_LocationDisplay_setPingAnimationSymbol(
                handle, value._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocationDisplay_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _autoPanModeChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setAutoPanModeChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDisplayAutoPanModeChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setAutoPanModeChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _locationChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setLocationChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDisplayLocationChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setLocationChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _statusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setStatusChangedCallback(
              _handle,
              bindings.addresses.asyncLocationDisplayStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_LocationDisplay_setStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<LocationDisplayAutoPanMode>
      _autoPanModeChangedStreamController;

  /// Sets a callback to be invoked when the [LocationDisplay.autoPanMode] of
  /// the location display has been changed.
  ///
  /// If the visible map extent is changed by the user navigating the map
  /// interactively, or by a programmatic navigation method call, this will
  /// cause [LocationDisplay.autoPanMode] to be reset to
  /// [LocationDisplayAutoPanMode.off]. You can respond to this event if your
  /// app needs to revert to the previously set mode after that navigation has
  /// finished.
  Stream<LocationDisplayAutoPanMode> get onAutoPanModeChanged =>
      _autoPanModeChangedStreamController.stream;

  late final StreamController<ArcGISLocation> _locationChangedStreamController;

  /// Sets a callback to be invoked when the location property of the location
  /// display has been changed.
  ///
  /// Location updates are only received when [LocationDisplay.started] is true.
  Stream<ArcGISLocation> get onLocationChanged =>
      _locationChangedStreamController.stream;

  late final StreamController<bool> _statusChangedStreamController;

  /// Sets a callback to be invoked when the started property of the location
  /// display has been changed.
  Stream<bool> get onStatusChanged => _statusChangedStreamController.stream;

  static final _instanceCache = _InstanceCache(
      factory: _LocationDisplayFactory(), kind: 'LocationDisplay');

  /// Creates a location display that can be assigned to an
  /// [ArcGISMapViewController].
  factory LocationDisplay() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_create(errorHandler);
    });
    return LocationDisplay._instanceCache.instanceWith(handle);
  }

  /// A symbol used to represent location accuracy.
  ///
  /// The accuracy of the location can vary depending on signal strength,
  /// satellite positions, and other factors. This circle may contract and
  /// expand as the accuracy of the locations, read from the
  /// [LocationDataSource], increases or decreases.
  ///
  /// The default symbol is a blue outline with a semi-transparent white fill.
  ArcGISSymbol get accuracySymbol => _accuracySymbol.value;

  set accuracySymbol(ArcGISSymbol value) => _accuracySymbol.value = value;

  final Memoized<ArcGISSymbol> _accuracySymbol;

  /// The symbol used to display the last known location while the current
  /// location is being acquired.
  ///
  /// The symbol will be shown until a new location fix is found. This symbol
  /// may be used immediately after starting the [LocationDisplay]. Once an
  /// up-to-date location is acquired, the [LocationDisplay.defaultSymbol],
  /// [LocationDisplay.courseSymbol], or [LocationDisplay.headingSymbol] is
  /// used, depending on the current settings of the [LocationDisplay]. The
  /// default symbol is a grey circle.
  ArcGISSymbol get acquiringSymbol => _acquiringSymbol.value;

  set acquiringSymbol(ArcGISSymbol value) => _acquiringSymbol.value = value;

  final Memoized<ArcGISSymbol> _acquiringSymbol;

  /// The map position of the most recent location reported by the location data
  /// source in the projection of the current map view.
  ArcGISPoint? get arcGISMapLocation {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getMapLocation(
          _handle, errorHandler);
    });
    return ArcGISPoint._fromHandle(objectHandle);
  }

  /// Defines how the [ArcGISMapViewController] reacts when location updates are
  /// received.
  ///
  /// The different auto-pan modes are suited for different types of app,
  /// including modes designed for navigation on foot and in a vehicle. They
  /// affect the symbols used to display device location, the initial zooming
  /// behavior, and the panning behavior of the [ArcGISMapViewController].
  ///
  /// The auto-pan modes include:
  /// * Recenter - the map view attempts to keep the location symbol on-screen
  /// by re-centering the location symbol when the symbol moves outside an
  /// extent defined by the [LocationDisplay.wanderExtentFactor].
  /// * Navigation - the location symbol is pinned to a point on the screen and
  /// always points toward the top edge of the device. The map pans and rotates
  /// based on location updates and the direction of travel.
  /// * Compass navigation - the location symbol is pinned to a point on the
  /// screen and always points toward the top edge of the device. The map
  /// rotates based on the user's bearing relative to magnetic north.
  /// * Off - the map only updates the position of the location symbol on the
  /// map.
  ///
  /// To start the [LocationDisplay] in a specific mode, call this method before
  /// you start the [LocationDataSource].
  ///
  /// Any default zooming behavior (besides scrolling) or any operation that
  /// modifies the [Viewpoint] will automatically set the auto-pan mode to
  /// [LocationDisplayAutoPanMode.off].
  ///
  /// The default auto-pan mode is [LocationDisplayAutoPanMode.off].
  LocationDisplayAutoPanMode get autoPanMode {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getAutoPanMode(
          _handle, errorHandler);
    });
    return LocationDisplayAutoPanMode._fromCoreValue(coreValue);
  }

  set autoPanMode(LocationDisplayAutoPanMode value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setAutoPanMode(
          _handle, value.coreValue, errorHandler);
    });
  }

  /// The symbol used to display the current location and the course (direction
  /// of travel) when moving.
  ///
  /// This symbol rotates with the heading of the movement. If course
  /// information is not available (for example if the device is not moving),
  /// the [LocationDisplay.defaultSymbol] is used.
  ArcGISSymbol get courseSymbol => _courseSymbol.value;

  set courseSymbol(ArcGISSymbol value) => _courseSymbol.value = value;

  final Memoized<ArcGISSymbol> _courseSymbol;

  /// The location data source used for generating location updates.
  ///
  /// [LocationDisplay] uses a location data source to provide the current
  /// position of the device. To start receiving location updates, and display
  /// the current location, you must start the location data source.
  ///
  /// By default the location data source obtains locations from the device's
  /// operating system.
  ///
  /// Alternative location data sources include:
  ///
  /// * [SimulatedLocationDataSource]
  /// * `NmeaLocationDataSource`
  /// * `IndoorsLocationDataSource`
  /// * `RouteTrackerLocationDataSource`
  LocationDataSource get dataSource => _dataSource.value;

  set dataSource(LocationDataSource value) => _dataSource.value = value;

  final Memoized<LocationDataSource> _dataSource;

  /// The symbol used for the location when not moving.
  ///
  /// Changing the location symbols is typically done if the existing symbols do
  /// not work well with the underlying map cartography, to increase visibility
  /// for visually impaired users, or to match an apps visual appearance.
  ArcGISSymbol get defaultSymbol => _defaultSymbol.value;

  set defaultSymbol(ArcGISSymbol value) => _defaultSymbol.value = value;

  final Memoized<ArcGISSymbol> _defaultSymbol;

  /// The heading angle of the current location in degrees relative to north.
  ///
  /// This is only applicable when the auto-pan mode is
  /// [LocationDisplayAutoPanMode.compassNavigation]. The value 0 means the
  /// device is pointed toward magnetic north, 90 means it is pointed due east,
  /// 180 means it is pointed due south, and so on. A negative value indicates
  /// that the heading could not be determined.
  double get heading {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getHeading(_handle, errorHandler);
    });
  }

  /// The symbol used for the location when the auto-pan mode is
  /// [LocationDisplayAutoPanMode.compassNavigation].
  ///
  /// The symbol is rotated to match with the heading of the compass. If there
  /// is no heading information (for example, if the device does not have a
  /// compass sensor), the [LocationDisplay.defaultSymbol] is used.
  ArcGISSymbol get headingSymbol => _headingSymbol.value;

  set headingSymbol(ArcGISSymbol value) => _headingSymbol.value = value;

  final Memoized<ArcGISSymbol> _headingSymbol;

  /// The scale that the map should automatically be zoomed to upon receiving
  /// the first location update.
  ///
  /// The initial map scale to which the [ArcGISMapViewController] will zoom
  /// when the first location update is received after the auto-pan mode is
  /// changed from [LocationDisplayAutoPanMode.off] to any other value. The
  /// default value is 10,000.
  double get initialZoomScale {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getInitialZoomScale(
          _handle, errorHandler);
    });
  }

  set initialZoomScale(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setInitialZoomScale(
          _handle, value, errorHandler);
    });
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getInstanceId(
          _handle, errorHandler);
    });
  }

  /// The most recent location reported by the location data source.
  ///
  /// The [ArcGISLocation] provides data for the single location, including
  /// position, course, velocity, and accuracy.
  ArcGISLocation? get location {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getLocation(_handle, errorHandler);
    });
    return ArcGISLocation._fromHandle(objectHandle);
  }

  /// The navigation point height factor. The factor will decide the location
  /// symbol position vertically from the bottom of the map when the auto-pan
  /// mode is [LocationDisplayAutoPanMode.navigation]. When navigating in a map,
  /// the current location is typically vertically positioned near the bottom of
  /// the map, and horizontally centered in the map, so that the map displays as
  /// much of the route ahead as possible.
  double get navigationPointHeightFactor {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getNavigationPointHeightFactor(
          _handle, errorHandler);
    });
  }

  set navigationPointHeightFactor(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setNavigationPointHeightFactor(
          _handle, value, errorHandler);
    });
  }

  /// The opacity value of all symbols displayed by the [LocationDisplay]. The
  /// value should be between 0 and 1.
  double get opacity {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getOpacity(_handle, errorHandler);
    });
  }

  set opacity(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setOpacity(_handle, value, errorHandler);
    });
  }

  /// The symbol that will be animated around the location symbol, to indicate
  /// when location updates are received.
  ///
  /// Location update animations are only shown when
  /// [LocationDisplay.showPingAnimationSymbol] is true.
  ArcGISSymbol get pingAnimationSymbol => _pingAnimationSymbol.value;

  set pingAnimationSymbol(ArcGISSymbol value) =>
      _pingAnimationSymbol.value = value;

  final Memoized<ArcGISSymbol> _pingAnimationSymbol;

  /// True if the [LocationDisplay.accuracySymbol] is shown, false otherwise.
  bool get showAccuracy {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getShowAccuracy(
          _handle, errorHandler);
    });
  }

  set showAccuracy(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setShowAccuracy(
          _handle, value, errorHandler);
    });
  }

  /// True if location symbols are shown, false otherwise.
  bool get showLocation {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getShowLocation(
          _handle, errorHandler);
    });
  }

  set showLocation(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setShowLocation(
          _handle, value, errorHandler);
    });
  }

  /// True if the [LocationDisplay.pingAnimationSymbol] is shown, false
  /// otherwise.
  bool get showPingAnimationSymbol {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getShowPingAnimationSymbol(
          _handle, errorHandler);
    });
  }

  set showPingAnimationSymbol(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setShowPingAnimationSymbol(
          _handle, value, errorHandler);
    });
  }

  /// True if the location display is currently active (the [LocationDataSource]
  /// has been started), false otherwise.
  bool get started {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getStarted(_handle, errorHandler);
    });
  }

  /// True if the [LocationDisplay.courseSymbol] is used to display current
  /// location, when the location updates indicate the device is moving, false
  /// otherwise.
  ///
  /// If no course information is available, the default symbol will be used
  /// instead. The [LocationDisplay.courseSymbol] is rotated in order to
  /// indicate the device's direction of travel. Generally, course information
  /// is only available if the device is actively moving (the location has a
  /// positive speed).
  bool get useCourseSymbolOnMovement {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getUseCourseSymbolOnMovement(
          _handle, errorHandler);
    });
  }

  set useCourseSymbolOnMovement(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setUseCourseSymbolOnMovement(
          _handle, value, errorHandler);
    });
  }

  /// The wander extent factor controls the re-centering behavior of the
  /// [ArcGISMapViewController] when the location changes.
  ///
  /// The proportion of the current extent within which the location can be
  /// without automatically panning the map. Permitted values are in the range
  /// between 0 (continuous panning) and 1 (only pan when the location reaches
  /// the edge of the current extent). This value only applies when the auto-pan
  /// mode is [LocationDisplayAutoPanMode.recenter]. Lower values within this
  /// range will cause the map to re-center more often, leading to higher CPU
  /// and battery consumption.
  double get wanderExtentFactor {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDisplay_getWanderExtentFactor(
          _handle, errorHandler);
    });
  }

  set wanderExtentFactor(double value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_setWanderExtentFactor(
          _handle, value, errorHandler);
    });
  }

  /// The method is to call the start callback function of the location data
  /// source.
  void start() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_start(_handle, errorHandler);
    });
  }

  /// The method is to call the stop callback function of the location data
  /// source.
  void stop() {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_LocationDisplay_stop(_handle, errorHandler);
    });
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeLocationDisplayAutoPanModeChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return LocationDisplayAutoPanMode._fromCoreValue(coreValue);
        }();
        _autoPanModeChangedStreamController.add(event);
      case AsyncType.asyncTypeLocationDisplayLocationChangedEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_LocationHandle;
          return ArcGISLocation._fromHandle(objectHandle)!;
        }();
        _locationChangedStreamController.add(event);
      case AsyncType.asyncTypeLocationDisplayStatusChangedEvent:
        final event = () {
          return message[2] as bool;
        }();
        _statusChangedStreamController.add(event);
      default:
        logger.f('LocationDisplay unhandled asyncType $asyncType');
    }
  }
}

final class _LocationDisplayFactory
    implements _InstanceFactory<LocationDisplay, RT_LocationDisplayHandle> {
  @override
  LocationDisplay createInstance({required RT_LocationDisplayHandle handle}) {
    return LocationDisplay._withHandle(handle);
  }

  @override
  void destroyHandle(RT_LocationDisplayHandle handle) {
    bindings.LocationDisplay_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_LocationDisplayHandle handle) {
    return runtimecore.RT_LocationDisplay_getInstanceId(handle, ffi.nullptr);
  }
}

/// A location to screen result object.
///
/// The location to screen result contains a point and visibility.
final class LocationToScreenResult implements ffi.Finalizable {
  final RT_LocationToScreenResultHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.LocationToScreenResult_destroy.cast());

  static LocationToScreenResult? _fromHandle(
      RT_LocationToScreenResultHandle handle) {
    if (handle == ffi.nullptr) return null;
    return LocationToScreenResult._withHandle(handle);
  }

  LocationToScreenResult._withHandle(RT_LocationToScreenResultHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.LocationToScreenResult_created(_handle);
    }
  }

  /// The screen coordinates from the location to screen result.
  Offset get screenPoint {
    final coordinate = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationToScreenResult_getScreenPoint(
          _handle, errorHandler);
    });
    return coordinate.toOffset();
  }
}

/// A class that represents the display of the Military Grid Reference System
/// (MGRS) on the map view.
///
/// The military grid reference system is the geocoordinate standard used by
/// various militaries for locating points on the earth. The MGRS grid is
/// derived from the Universal Transverse Mercator (UTM) grid system and the
/// universal polar stereographic (UPS) grid system, but uses a different
/// labeling convention. MGRS is used for the entire earth.
///
/// To display the MGRS grid, create a MGRSGrid and set it as the grid property
/// within the MapView.
///
/// MGRSGrid inherits from Grid and adds a property for the label unit to use.
final class MgrsGrid extends Grid {
  static MgrsGrid? _fromHandle(RT_MGRSGridHandle handle) {
    if (handle == ffi.nullptr) return null;
    return MgrsGrid._withHandle(handle);
  }

  MgrsGrid._withHandle(super.handle) : super._withHandle();

  /// Constructs an MGRS grid for displaying on a map view.
  ///
  /// The grid is supported in spatial references which are continuously
  /// pannable or some polar spatial references. You can check the
  /// [SpatialReference.isPannable] property is true on your spatial reference.
  /// Examples of continuously pannable spatial references include WGS84 (WKID
  /// 4326) and Web Mercator Auxiliary Sphere (WKID 102113, 102100, or 3857).
  ///
  /// The following polar spatial references are also supported:
  /// * North pole Azimuthal Equidistant (WKID 102016)
  /// * North pole gnomic (WKID 102034)
  /// * North pole Lambert equal area (WKID 102017)
  /// * North pole orthographic (WKID 102035)
  /// * North pole stereographic (WKID 102018)
  /// * NSIDE EASE North (WKID 3408)
  /// * NSIDC Sea Ice polar stereographic north (WKID 3411)
  /// * WGS 1984 NSIDC Sea Ice Polar Stereographic North (WKID 3413)
  /// * UPS North (WKID 32661)
  /// * South pole Azimuthal Equidistant (WKID 102019)
  /// * South pole gnomic (WKID 102036)
  /// * South pole Lambert equal area (WKID 102020)
  /// * South pole orthographic (WKID 102037)
  /// * South pole stereographic (WKID 102021)
  /// * NSIDE EASE South (WKID 3409)
  /// * NSIDC Sea Ice polar stereographic South (WKID 3412)
  /// * UPS South (WKID 32761)
  /// * WGS1984 Antarctic polar stereographic (WKID 3031)
  factory MgrsGrid() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MGRSGrid_create(errorHandler);
    });
    return MgrsGrid._withHandle(handle);
  }

  /// The units used for labeling the grid.
  MgrsGridLabelUnit get labelUnit {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_MGRSGrid_getLabelUnit(_handle, errorHandler);
    });
    return MgrsGridLabelUnit._fromCoreValue(coreValue);
  }

  set labelUnit(MgrsGridLabelUnit value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_MGRSGrid_setLabelUnit(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The unit to use when labeling a [MgrsGrid].
enum MgrsGridLabelUnit {
  /// Label the grid in either Kilometers or Meters, depending on the scale of
  /// the map view.
  kilometersMeters,

  /// Label the grid in Meters.
  meters;

  factory MgrsGridLabelUnit._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return kilometersMeters;
      case 1:
        return meters;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case kilometersMeters:
        return 0;
      case meters:
        return 1;
    }
  }
}

/// Who is responsible for call the pulse method.
///
/// Tells the map view who is responsible for calling the pulse function for the
/// map view. The pulse controls when items are updated in the map view. The
/// pulse thread needs to be called by a timer.
enum _PulseThread {
  /// You are responsible to call the pulse function on regular intervals.
  userDefined,

  /// THe map view will have a timer and call the pulse function. You do not
  /// need to call pulse.
  useGeoView;

  factory _PulseThread._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return userDefined;
      case 1:
        return useGeoView;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case userDefined:
        return 0;
      case useGeoView:
        return 1;
    }
  }
}

/// A selection properties.
final class SelectionProperties implements ffi.Finalizable {
  final RT_SelectionPropertiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.SelectionProperties_destroy.cast());

  static SelectionProperties? _fromHandle(RT_SelectionPropertiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return SelectionProperties._withHandle(handle);
  }

  SelectionProperties._withHandle(RT_SelectionPropertiesHandle handle)
      : _color = Memoized(getter: () {
          final colorHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_SelectionProperties_getColor(
                handle, errorHandler);
          });
          return colorHandle.toColor()!;
        }, setter: (value) {
          final coreValue = value.toArcGIS();
          _withThrowingErrorHandler((errorHandler) {
            runtimecore.RT_SelectionProperties_setColor(
                handle, coreValue._handle, errorHandler);
          });
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.SelectionProperties_created(_handle);
    }
  }

  /// Creates a new selection properties object with the specified color.
  ///
  /// Parameters:
  /// - `color` — The selection color.
  factory SelectionProperties({Color color = const Color(0xFF00FFFF)}) {
    _initializeArcGISEnvironmentIfNeeded();
    final coreColor = color.toArcGIS();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_SelectionProperties_createWithColor(
          coreColor._handle, errorHandler);
    });
    final SelectionProperties object = SelectionProperties._withHandle(handle);
    object._color.cache(color);
    return object;
  }

  /// The color value in the selection properties object.
  Color get color => _color.value;

  set color(Color value) => _color.value = value;

  final Memoized<Color> _color;
}

/// A class that represents the display of the United States National Grid
/// (USNG) on the map view.
///
/// The United States National Grid (USNG) is a point reference system of grid
/// references commonly used in the United States. It provides a nationally
/// consistent language of location in a user friendly format. It is similar in
/// design to the national grid reference systems used throughout other nations.
/// The USNG was developed by the Federal Geographic Data Committee.
///
/// To display the USNG grid, create a USNGGrid and set it as the grid property
/// within the MapView.
///
/// USNGGrid inherits from Grid and adds a property for the label unit to use.
final class UsngGrid extends Grid {
  static UsngGrid? _fromHandle(RT_USNGGridHandle handle) {
    if (handle == ffi.nullptr) return null;
    return UsngGrid._withHandle(handle);
  }

  UsngGrid._withHandle(super.handle) : super._withHandle();

  /// Constructs a USNG grid for displaying on a map view.
  ///
  /// The grid is supported in spatial references which are continuously
  /// pannable or some polar spatial references. You can check the
  /// [SpatialReference.isPannable] property is true on your spatial reference.
  /// Examples of continuously pannable spatial references include WGS84 (WKID
  /// 4326) and Web Mercator Auxiliary Sphere (WKID 102113, 102100, or 3857).
  ///
  /// The following polar spatial references are also supported:
  /// * North pole Azimuthal Equidistant (WKID 102016)
  /// * North pole gnomic (WKID 102034)
  /// * North pole Lambert equal area (WKID 102017)
  /// * North pole orthographic (WKID 102035)
  /// * North pole stereographic (WKID 102018)
  /// * NSIDE EASE North (WKID 3408)
  /// * NSIDC Sea Ice polar stereographic north (WKID 3411)
  /// * WGS 1984 NSIDC Sea Ice Polar Stereographic North (WKID 3413)
  /// * UPS North (WKID 32661)
  /// * South pole Azimuthal Equidistant (WKID 102019)
  /// * South pole gnomic (WKID 102036)
  /// * South pole Lambert equal area (WKID 102020)
  /// * South pole orthographic (WKID 102037)
  /// * South pole stereographic (WKID 102021)
  /// * NSIDE EASE South (WKID 3409)
  /// * NSIDC Sea Ice polar stereographic South (WKID 3412)
  /// * UPS South (WKID 32761)
  /// * WGS1984 Antarctic polar stereographic (WKID 3031)
  factory UsngGrid() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_USNGGrid_create(errorHandler);
    });
    return UsngGrid._withHandle(handle);
  }

  /// The units used for labeling the grid.
  UsngGridLabelUnit get labelUnit {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_USNGGrid_getLabelUnit(_handle, errorHandler);
    });
    return UsngGridLabelUnit._fromCoreValue(coreValue);
  }

  set labelUnit(UsngGridLabelUnit value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_USNGGrid_setLabelUnit(
          _handle, value.coreValue, errorHandler);
    });
  }
}

/// The unit to use when labeling an [UsngGrid].
enum UsngGridLabelUnit {
  /// Label the grid in either Kilometers or Meters, depending on the scale of
  /// the map view.
  kilometersMeters,

  /// Label the grid in Meters.
  meters;

  factory UsngGridLabelUnit._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return kilometersMeters;
      case 1:
        return meters;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case kilometersMeters:
        return 0;
      case meters:
        return 1;
    }
  }
}

/// A class that represents the display of the Universal Transverse Mercator
/// (UTM) coordinate system grid on the map view.
///
/// The Universal Transverse Mercator (UTM) conformal projection uses a
/// 2-dimensional Cartesian coordinate system to give locations on the surface
/// of the Earth. Like the traditional method of latitude and longitude, it is a
/// horizontal position representation, i.e. it is used to identify locations on
/// the Earth independently of vertical position. However, it differs from that
/// method in several respects.
///
/// The UTM system is not a single map projection. The system instead divides
/// the Earth into sixty zones, each being a six-degree band of longitude, and
/// uses a secant transverse Mercator projection in each zone.
///
/// To display the UTM grid, create a UTMGrid and set it as the grid property
/// within the MapView.
final class UtmGrid extends Grid {
  static UtmGrid? _fromHandle(RT_UTMGridHandle handle) {
    if (handle == ffi.nullptr) return null;
    return UtmGrid._withHandle(handle);
  }

  UtmGrid._withHandle(super.handle) : super._withHandle();

  /// Constructs a grid for displaying UTM zones on a map view.
  ///
  /// The grid is supported in spatial references which are continuously
  /// pannable or some polar spatial references. You can check the
  /// [SpatialReference.isPannable] property is true on your spatial reference.
  /// Examples of continuously pannable spatial references include WGS84 (WKID
  /// 4326) and Web Mercator Auxiliary Sphere (WKID 102113, 102100, or 3857).
  ///
  /// The following polar spatial references are also supported:
  /// * North pole Azimuthal Equidistant (WKID 102016)
  /// * North pole gnomic (WKID 102034)
  /// * North pole Lambert equal area (WKID 102017)
  /// * North pole orthographic (WKID 102035)
  /// * North pole stereographic (WKID 102018)
  /// * NSIDE EASE North (WKID 3408)
  /// * NSIDC Sea Ice polar stereographic north (WKID 3411)
  /// * WGS 1984 NSIDC Sea Ice Polar Stereographic North (WKID 3413)
  /// * UPS North (WKID 32661)
  /// * South pole Azimuthal Equidistant (WKID 102019)
  /// * South pole gnomic (WKID 102036)
  /// * South pole Lambert equal area (WKID 102020)
  /// * South pole orthographic (WKID 102037)
  /// * South pole stereographic (WKID 102021)
  /// * NSIDE EASE South (WKID 3409)
  /// * NSIDC Sea Ice polar stereographic South (WKID 3412)
  /// * UPS South (WKID 32761)
  /// * WGS1984 Antarctic polar stereographic (WKID 3031)
  factory UtmGrid() {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_UTMGrid_create(errorHandler);
    });
    return UtmGrid._withHandle(handle);
  }
}

/// A view label properties object.
///
/// This is used to change labels for a view.
final class ViewLabelProperties implements ffi.Finalizable {
  final RT_ViewLabelPropertiesHandle _handle;

  static final _nativeFinalizer = ffi.NativeFinalizer(
      bindings.addresses.ViewLabelProperties_destroy.cast());

  static ViewLabelProperties? _fromHandle(RT_ViewLabelPropertiesHandle handle) {
    if (handle == ffi.nullptr) return null;
    return ViewLabelProperties._withHandle(handle);
  }

  ViewLabelProperties._withHandle(RT_ViewLabelPropertiesHandle handle)
      : _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.ViewLabelProperties_created(_handle);
    }
  }

  /// Create a view label property with specified parameters.
  ///
  /// Parameters:
  /// - `animationEnabled` — true to enable, false to disable the animation.
  /// - `labelingEnabled` — true to enable, false to disable the labeling.
  factory ViewLabelProperties(
      {bool animationEnabled = false, bool labelingEnabled = true}) {
    _initializeArcGISEnvironmentIfNeeded();
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ViewLabelProperties_createWithParameters(
          animationEnabled, labelingEnabled, errorHandler);
    });
    return ViewLabelProperties._withHandle(handle);
  }

  /// The view label properties set animation enabled.
  bool get isAnimationEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ViewLabelProperties_getIsAnimationEnabled(
          _handle, errorHandler);
    });
  }

  set isAnimationEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ViewLabelProperties_setIsAnimationEnabled(
          _handle, value, errorHandler);
    });
  }

  /// The view label properties set labeling enabled.
  bool get isLabelingEnabled {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_ViewLabelProperties_getIsLabelingEnabled(
          _handle, errorHandler);
    });
  }

  set isLabelingEnabled(bool value) {
    _withThrowingErrorHandler((errorHandler) {
      runtimecore.RT_ViewLabelProperties_setIsLabelingEnabled(
          _handle, value, errorHandler);
    });
  }
}

/// Should wrap around be used or not.
///
/// Allows you to change the wrap around mode.
enum WrapAroundMode {
  /// Enable wrap around if it is supported.
  ///
  /// Wraparound can only be applied to a map view if the following requirements
  /// are met.
  /// * The map's full extent covers the entire world.
  /// * The [GeoViewController.spatialReference] is either WGS 84 or Web
  /// Mercator Auxiliary Sphere.
  /// * Dynamic layers in the map are based on map services from ArcGIS Server
  /// 10.0 or higher.
  enabledWhenSupported,

  /// Disable wrap around.
  disabled;

  factory WrapAroundMode._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return enabledWhenSupported;
      case 1:
        return disabled;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case enabledWhenSupported:
        return 0;
      case disabled:
        return 1;
    }
  }
}
