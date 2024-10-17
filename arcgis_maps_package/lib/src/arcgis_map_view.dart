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

/// A widget that displays an [ArcGISMap] and associated data.
///
/// Use the associated [ArcGISMapViewController] to configure the map and other data, such as [ArcGISMap.operationalLayers], [ArcGISMapViewController.graphicsOverlays] or [ArcGISMapViewController.locationDisplay].
///
/// Use the controller to interact with the map, such as by using [ArcGISMapViewController.setViewpoint()] or [ArcGISMapViewController.identifyLayer()].
final class ArcGISMapView extends StatefulWidget {
  /// Creates an [ArcGISMapViewController] for use with an [ArcGISMapView].
  ///
  /// Provide an [ArcGISMapViewController] to [ArcGISMapView] via [controllerProvider].
  static ArcGISMapViewController createController() {
    return ArcGISMapViewController._(
      width: 0,
      height: 0,
      screenScale: 1,
      pulse: _PulseThread.userDefined,
    );
  }

  /// Called when this [ArcGISMapView] needs an [ArcGISMapViewController] to associate with itself.
  ///
  /// You must provide an [ArcGISMapViewController] via this callback. The callback will be called exactly once, shortly before [onMapViewReady].
  ///
  /// Use the controller to set the [ArcGISMapViewController.arcGISMap] and configure it. You may wish to create the controller earlier in the process, such as in [State.initState], to start asynchronous tasks such as [ArcGISMap.load()].
  final ArcGISMapViewController Function() controllerProvider;

  /// Called when the map view is ready to be used.
  final void Function()? onMapViewReady;

  /// Called when the user taps on the map view.
  ///
  /// Use `localPosition` to perform tasks based on the location of the tap, such as identifying the tapped item. Use with methods on [ArcGISMapViewController] such as [ArcGISMapViewController.identifyLayer()].
  final void Function(Offset localPosition)? onTap;

  /// Called when the user completes a long press gesture on the map view.
  ///
  /// Use `localPosition` as with [onTap].
  final void Function(Offset localPosition)? onLongPressEnd;

  /// Creates an ArcGIS map view.
  const ArcGISMapView({
    super.key,
    required this.controllerProvider,
    this.onMapViewReady,
    this.onTap,
    this.onLongPressEnd,
  });

  @override
  State<ArcGISMapView> createState() => _ArcGISMapViewState();
}

class _ArcGISMapViewState extends State<ArcGISMapView>
    with WidgetsBindingObserver {
  final _globalKey = GlobalKey();
  final _viewType = 'com.esri.GeoView';
  var _lastScreenScale = 0.0;
  var _viewMetrics = ViewMetrics.empty();
  var _viewAttributionTextVisible = true;
  var _attributionText = '';
  var _isAttributionTextVisible = true;
  bool _attributionExpanded = false;
  late final MethodChannel _methodChannel;
  late final ArcGISMapViewController _controller;
  StreamSubscription? _attributionSubscription;
  StreamSubscription? _isAttributionTextVisibleSubscription;
  StreamSubscription? _magnifierEnabledChangedSubscription;
  StreamSubscription? _scaleSubscription;
  var _platformViewReady = false;
  var _gesturesReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    if (_attributionSubscription != null) {
      _exitHandler.unregisterSubscription(_attributionSubscription!);
    }
    _attributionSubscription?.cancel();
    _isAttributionTextVisibleSubscription?.cancel();
    _magnifierEnabledChangedSubscription?.cancel();
    _scaleSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _methodChannel.invokeMethod('geoViewDestroyed');
    _controller.dispose();
    _methodChannel.setMethodCallHandler(null);

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (!_platformViewReady) return;

    _updateScreenScale(View.of(context).devicePixelRatio);
    updateViewMetrics(_globalKey.currentContext ?? context);
  }

  void updateViewMetrics(BuildContext context) {
    final viewMetrics = ViewMetrics.fromContext(context);

    // ignore updates during rotation transitions
    if (!viewMetrics.valid || viewMetrics.intermediate) return;

    checkViewInsets(viewMetrics, _viewAttributionTextVisible);
  }

  void checkViewInsets(
      ViewMetrics viewMetrics, bool viewAttributionTextVisible) {
    if (viewMetrics == _viewMetrics &&
        viewAttributionTextVisible == _viewAttributionTextVisible) return;

    _viewMetrics = viewMetrics;
    _viewAttributionTextVisible = viewAttributionTextVisible;
    _controller._viewInsets = _viewMetrics.viewInsets(
        isAttributionBarVisible: _viewAttributionTextVisible);
  }

  @override
  Widget build(BuildContext context) {
    var mapChild = _buildNative(context);

    // Once all setup tasks related to the PlatformView are finished, allow gestures
    if (_platformViewReady && _gesturesReady) {
      mapChild = _MapGestureHandler(
        controller: _controller,
        onGestureStarted: _onGestureStarted,
        onTap: widget.onTap,
        onLongPressEnd: widget.onLongPressEnd,
        child: mapChild,
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        mapChild,
        Visibility(
          visible: _platformViewReady && _isAttributionTextVisible,
          child: _AttributionBarWidget(
            attributionText: _attributionText,
            expanded: _attributionExpanded,
            onTapAttribution: _onTapAttribution,
          ),
        )
      ],
    );
  }

  Widget _buildNative(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS || TargetPlatform.macOS:
        return _buildNativeDarwin(context);
      case TargetPlatform.android:
        return _buildNativeAndroid(context);
      default:
        return Center(
          child: Text('ArcGISMapView $defaultTargetPlatform not supported'),
        );
    }
  }

  Widget _buildNativeDarwin(BuildContext context) {
    return UiKitView(
      key: _globalKey,
      viewType: _viewType,
      hitTestBehavior: PlatformViewHitTestBehavior.transparent,
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }

  Widget _buildNativeAndroid(BuildContext context) {
    return PlatformViewLink(
      key: _globalKey,
      viewType: _viewType,
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.transparent,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
        );
      },
      onCreatePlatformView: (params) {
        var androidViewController =
            PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: params.viewType,
          layoutDirection: TextDirection.ltr,
          onFocus: () {
            params.onFocusChanged(true);
          },
        );
        androidViewController.addOnPlatformViewCreatedListener((id) {
          params.onPlatformViewCreated(id);
          _onPlatformViewCreated(id);
        });
        androidViewController.create();
        return androidViewController;
      },
    );
  }

  void _onTapAttribution() {
    setState(() => _attributionExpanded = !_attributionExpanded);
  }

  void _onGestureStarted() {
    if (_attributionExpanded) {
      setState(() => _attributionExpanded = false);
    }
  }

  Future<dynamic> _platformCallHandler(MethodCall call) {
    switch (call.method) {
      case 'screenScaleChanged':
        final screenScale = call.arguments as double;
        _updateScreenScale(screenScale);
        return Future.value();
      default:
        logger.e('Unknown method ${call.method}');
        return Future.error(MissingPluginException());
    }
  }

  void _onPlatformViewCreated(int id) async {
    _controller = widget.controllerProvider();
    final screenScale = MediaQuery.of(context).devicePixelRatio;
    _createMethodChannel(id);

    await Future.wait([
      _methodChannel.invokeMethod(
          'initializeGeoView', _controller._handle.address),
      _setupController(),
    ]);

    _updateScreenScale(screenScale);
    updateViewMetrics(_globalKey.currentContext ?? context);

    widget.onMapViewReady?.call();
    setState(() => _platformViewReady = true);
  }

  void _updateScreenScale(double screenScale) {
    if (screenScale == _lastScreenScale) return;

    _controller._setScreenScale(screenScale);
    _lastScreenScale = screenScale;
  }

  void _createMethodChannel(int id) {
    _methodChannel = MethodChannel('$_viewType/$id');
    _methodChannel.setMethodCallHandler(_platformCallHandler);

    if (kDebugMode) {
      _methodChannel.invokeMethod('ping').then((result) {
        assert(result == 'pong');
      });
    }
  }

  Future<void> _setupController() async {
    _attributionSubscription =
        _controller.onAttributionChanged.listen((attributionText) {
      setState(() => _attributionText = attributionText);
    });
    _exitHandler.registerSubscription(_attributionSubscription!);

    _isAttributionTextVisibleSubscription =
        _controller._onIsAttributionTextVisibleChanged.listen((visible) {
      setState(() => _isAttributionTextVisible = visible);
      checkViewInsets(_viewMetrics, _isAttributionTextVisible);
    });

    // Gestures are meaningless until the map is loaded and DrawStatus has completed,
    // which we can detect by checking _controlller.scale.
    _scaleSubscription = _controller.onScaleChanged.listen((scale) {
      final newGesturesReady = !scale.isNaN;
      if (newGesturesReady != _gesturesReady) {
        setState(() => _gesturesReady = newGesturesReady);
      }
    });

    _magnifierEnabledChangedSubscription = _controller
        ._onMagnifierEnabledChanged
        .listen((enabled) async => await _magnifierEnabledChanged(enabled));

    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final setupFutures = <Future>[];
    setupFutures.add(_setupMagnifierImages(devicePixelRatio));
    setupFutures
        .add(_controller.locationDisplay.configureSymbols(devicePixelRatio));
    if (_controller.magnifierEnabled) {
      setupFutures.add(_magnifierEnabledChanged(true));
    }
    await Future.wait(setupFutures);
  }

  Future<void> _setupMagnifierImages(double devicePixelRatio) async {
    final images = await Future.wait([
      ArcGISImage.fromScaledAsset(
          'packages/arcgis_maps/assets/MagnifierMask.png',
          devicePixelScale: devicePixelRatio),
      ArcGISImage.fromScaledAsset('packages/arcgis_maps/assets/Magnifier.png',
          devicePixelScale: devicePixelRatio),
    ]);
    _controller._setMagnifierImagesWithSize(
        mask: images[0], overlay: images[1], width: 141, height: 141);
  }

  Future<void> _magnifierEnabledChanged(bool enabled) async {
    await _methodChannel.invokeMethod('magnifierEnabledChanged', enabled);
  }
}
