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

final class _MapGestureHandler extends StatefulWidget {
  final Widget child;
  final ArcGISMapViewController controller;
  final void Function()? onGestureStarted;
  final void Function(Offset localPosition)? onTap;
  final void Function(Offset localPosition)? onLongPressEnd;

  const _MapGestureHandler({
    required this.controller,
    this.onGestureStarted,
    this.onTap,
    this.onLongPressEnd,
    required this.child,
  });

  @override
  _MapGestureHandlerState createState() => _MapGestureHandlerState();
}

final class _MapGestureHandlerState extends State<_MapGestureHandler> {
  @override
  Widget build(BuildContext context) {
    // when interactionOptions.enabled is false, skip the gesture detector entirely
    return ListenableBuilder(
      listenable: widget.controller.interactionOptions,
      builder: (context, child) {
        return widget.controller.interactionOptions.enabled
            ? _buildGestureDetector(context, child)
            : child!;
      },
      child: widget.child,
    );
  }

  Widget _buildGestureDetector(BuildContext context, Widget? child) {
    final gestures = <Type, GestureRecognizerFactory>{};
    final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);

    gestures[MultiTapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<MultiTapGestureRecognizer>(
      () => MultiTapGestureRecognizer(debugOwner: this),
      (instance) {
        instance.onTapDown = _onTapDown;
        instance.onTapCancel = _onTapCancel;
        instance.onTap = _onTap;
        instance.gestureSettings = gestureSettings;
      },
    );

    gestures[DoubleTapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
      () => DoubleTapGestureRecognizer(debugOwner: this),
      (instance) {
        instance.onDoubleTapDown = _onDoubleTapDown;
        instance.onDoubleTapCancel = _onDoubleTapCancel;
        instance.onDoubleTap = _onDoubleTap;
        instance.gestureSettings = gestureSettings;
      },
    );

    gestures[LongPressGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
      () => LongPressGestureRecognizer(debugOwner: this),
      (instance) {
        instance.onLongPressDown = _onLongPressDown;
        instance.onLongPressCancel = _onLongPressCancel;
        instance.onLongPressStart = _onLongPressStart;
        instance.onLongPressMoveUpdate = _onLongPressMoveUpdate;
        instance.onLongPressEnd = _onLongPressEnd;
        instance.gestureSettings = gestureSettings;
      },
    );

    gestures[ScaleGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<ScaleGestureRecognizer>(
      () => ScaleGestureRecognizer(debugOwner: this),
      (instance) {
        instance.onStart = _onScaleStart;
        instance.onUpdate = _onScaleUpdate;
        instance.onEnd = _onScaleEnd;
        instance.gestureSettings = gestureSettings;
      },
    );

    return RawGestureDetector(
      gestures: gestures,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }

  final _activeTaps = <int>{};
  bool _needsTwoFingerTap = false;

  TapDownDetails? _tapDownDetails;
  TapDownDetails? _secondFingerTapDownDetails;

  TapDownDetails? _canceledTapDownDetails;

  TapDownDetails? _doubleTapDownDetails;

  LongPressDownDetails? _longPressDownDetails;

  ScaleStartDetails? _scaleStartDetails;
  ScaleUpdateDetails? _scaleUpdateDetails;

  var _initialScale = 1.0;
  var _initialRotation = 0.0;

  // a tap-and-drag interprets up and down motion as zoom
  var _recentlyDoubleTapCanceled = false;
  var _oneFingerZooming = false;

  void _onTapDown(int pointer, TapDownDetails tapDownDetails) {
    widget.onGestureStarted?.call();
    widget.controller._stopPanAnimations();
    _recentlyDoubleTapCanceled = false;

    if (_activeTaps.isEmpty) {
      _tapDownDetails = tapDownDetails;
    } else {
      _secondFingerTapDownDetails = tapDownDetails;
    }
    _activeTaps.add(pointer);
  }

  void _onTapCancel(int pointer) {
    _canceledTapDownDetails = _tapDownDetails;
    _activeTaps.remove(pointer);
    if (_activeTaps.isEmpty) {
      _tapDownDetails = null;
    } else {
      _secondFingerTapDownDetails = null;
    }
  }

  void _onTap(int pointer) {
    if (_tapDownDetails != null) {
      if (_activeTaps.length > 1) {
        _needsTwoFingerTap = true;
      } else if (_needsTwoFingerTap) {
        if (_secondFingerTapDownDetails != null) {
          if (widget.controller.interactionOptions.zoomEnabled) {
            final averagePosition = (_tapDownDetails!.localPosition +
                    _secondFingerTapDownDetails!.localPosition) /
                2;
            widget.controller._interactionZoomOutAnimated(
              screenPoint: averagePosition,
              zoomFactor: widget.controller.interactionOptions.zoomFactor,
            );
          }
        }
        _needsTwoFingerTap = false;
        _secondFingerTapDownDetails = null;
      } else {
        widget.onTap?.call(_tapDownDetails!.localPosition);
      }

      if (!_needsTwoFingerTap) _tapDownDetails = null;
    }

    _activeTaps.remove(pointer);
  }

  void _onDoubleTapDown(TapDownDetails tapDownDetails) {
    _doubleTapDownDetails = tapDownDetails;

    if (_needsTwoFingerTap) {
      _activeTaps.clear();
      _secondFingerTapDownDetails = null;
      _needsTwoFingerTap = false;
    }
  }

  void _onDoubleTapCancel() {
    _doubleTapDownDetails = null;
    _recentlyDoubleTapCanceled = true;
  }

  void _onDoubleTap() {
    if (_doubleTapDownDetails != null) {
      if (widget.controller.interactionOptions.zoomEnabled) {
        widget.controller._interactionZoomInAnimated(
          screenPoint: _doubleTapDownDetails!.localPosition,
          zoomFactor: widget.controller.interactionOptions.zoomFactor,
        );
      }
      _doubleTapDownDetails = null;
    }
  }

  void _onLongPressDown(LongPressDownDetails longPressDownDetails) {
    _longPressDownDetails = longPressDownDetails;
  }

  void _onLongPressCancel() {
    _longPressDownDetails = null;
  }

  void _onLongPressStart(LongPressStartDetails longPressStartDetails) {
    if (_longPressDownDetails != null) {
      if (widget.controller.magnifierEnabled) {
        _recentlyDoubleTapCanceled = false;

        _showMagnifier(
          longPressStartDetails.localPosition,
          _longPressDownDetails!.kind,
        );
      } else {
        if (_recentlyDoubleTapCanceled) {
          _initialScale = widget.controller.scale;
          _oneFingerZooming = true;
          _recentlyDoubleTapCanceled = false;
        }
      }
    }
  }

  void _onLongPressMoveUpdate(
      LongPressMoveUpdateDetails longPressMoveUpdateDetails) {
    if (!widget.controller.interactionOptions.enabled) return;

    if (_longPressDownDetails != null) {
      if (widget.controller.magnifierEnabled) {
        _showMagnifier(
          longPressMoveUpdateDetails.localPosition,
          _longPressDownDetails!.kind,
        );
      } else {
        if (_oneFingerZooming) {
          _oneFingerZoom(_longPressDownDetails!.localPosition,
              longPressMoveUpdateDetails.localPosition);
        }
      }
    }
  }

  void _onLongPressEnd(LongPressEndDetails longPressEndDetails) {
    if (!widget.controller.interactionOptions.enabled) return;

    if (_longPressDownDetails != null) {
      if (widget.controller.magnifierEnabled) {
        _hideMagnifier();
      } else {
        if (_oneFingerZooming) {
          _oneFingerZooming = false;
          _initialScale = 1.0;
        }
      }

      widget.onLongPressEnd?.call(longPressEndDetails.localPosition);
      _longPressDownDetails = null;
    }
  }

  void _onScaleStart(ScaleStartDetails scaleStartDetails) {
    if (!widget.controller.interactionOptions.enabled) return;

    widget.controller._stopPanAnimations();

    _scaleStartDetails = scaleStartDetails;
    _initialScale = widget.controller.scale;
    _initialRotation = widget.controller.rotation;

    if (scaleStartDetails.pointerCount == 1 && _recentlyDoubleTapCanceled) {
      _oneFingerZooming = true;
      _recentlyDoubleTapCanceled = false;
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails scaleUpdateDetails) {
    if (_scaleStartDetails == null) return;
    _scaleUpdateDetails = scaleUpdateDetails;

    if (_oneFingerZooming) {
      _oneFingerZoom(_scaleStartDetails!.localFocalPoint,
          scaleUpdateDetails.localFocalPoint);
    } else {
      if (widget.controller.interactionOptions.panEnabled) {
        var delta = scaleUpdateDetails.focalPointDelta;
        if (_canceledTapDownDetails != null) {
          if (_scaleStartDetails!.pointerCount == 1) {
            delta = (scaleUpdateDetails.localFocalPoint -
                _canceledTapDownDetails!.localPosition);
          }
          _canceledTapDownDetails = null;
        }
        widget.controller._interactionDrag(deltaX: delta.dx, deltaY: delta.dy);
      }

      _updateRotation(isScaleEnd: false);

      if (widget.controller.interactionOptions.zoomEnabled) {
        final updateScale = _initialScale / scaleUpdateDetails.scale;
        if (updateScale.isInfinite || updateScale.isNaN) return;

        widget.controller._interactionZoomToScale(
          scale: updateScale,
          screenPoint: scaleUpdateDetails.localFocalPoint,
        );
      }
    }
  }

  void _onScaleEnd(ScaleEndDetails scaleEndDetails) {
    if (_scaleStartDetails == null) return;

    _updateRotation(isScaleEnd: true);

    if (!_oneFingerZooming) {
      _fling(scaleEndDetails.velocity);
    }

    _scaleStartDetails = null;
    _scaleUpdateDetails = null;
    _initialScale = 1.0;
    _initialRotation = 0.0;
    _oneFingerZooming = false;
  }

  void _showMagnifier(Offset coordinate, PointerDeviceKind? kind) {
    if (kind != null && kind == PointerDeviceKind.touch) {
      widget.controller._showMagnifierWithOffsetAt(coordinate: coordinate);
    } else {
      widget.controller._showMagnifierAt(coordinate: coordinate);
    }
  }

  void _hideMagnifier() {
    widget.controller._hideMagnifier();
  }

  void _fling(Velocity velocity) {
    if (!widget.controller.interactionOptions.panEnabled ||
        !widget.controller.interactionOptions.flingEnabled) return;

    const panDuration = 0.5;
    final velocityX = velocity.pixelsPerSecond.dx;
    final velocityY = velocity.pixelsPerSecond.dy;
    final xDecel = velocityX / panDuration;
    final yDecel = velocityY / panDuration;
    final dx = velocityX * panDuration - xDecel * pow(panDuration, 2) / 2;
    final dy = velocityY * panDuration - yDecel * pow(panDuration, 2) / 2;

    widget.controller._stopPanAnimations();
    widget.controller._interactionFlingAnimated(deltaX: dx, deltaY: dy);
  }

  void _oneFingerZoom(Offset initialPoint, Offset currentPoint) {
    if (!widget.controller.interactionOptions.zoomEnabled) return;

    final travelDistance = currentPoint.dy - initialPoint.dy;
    final factor = 1 + travelDistance.abs() / 100;
    var scale = _initialScale;
    if (travelDistance >= 0) {
      scale *= factor;
    } else {
      scale /= factor;
    }
    if (scale.isInfinite || scale.isNaN) return;

    widget.controller._interactionZoomToScale(
      scale: scale,
      screenPoint: initialPoint,
    );
  }

  void _updateRotation({required bool isScaleEnd}) {
    if (widget.controller.interactionOptions.rotateEnabled &&
        _scaleUpdateDetails != null) {
      final rotationDelta = _scaleUpdateDetails!.rotation * 180 / pi;
      var angleDegrees = _initialRotation - rotationDelta;
      if (isScaleEnd &&
          angleDegrees.abs() <
              widget.controller.interactionOptions.snapToNorthThreshold) {
        angleDegrees = 0.0;
      }

      widget.controller._interactionRotate(
        angleDegrees: angleDegrees,
        screenPoint: _scaleUpdateDetails!.localFocalPoint,
      );
    }
  }
}
