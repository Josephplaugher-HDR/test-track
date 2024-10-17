//
// COPYRIGHT © 2024 Esri
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

/// @nodoc
class ViewMetrics {
  late final Rect viewRect;
  late final EdgeInsets screenPadding;
  late final Rect screenRect;

  bool get valid => viewRect != Rect.zero;

  // during device rotation, the viewRect may extend outside the screenRect
  bool get intermediate => viewRect.intersect(screenRect) != viewRect;

  @override
  int get hashCode => Object.hash(viewRect, screenPadding, screenRect);

  @override
  bool operator ==(Object other) {
    if (other is ViewMetrics) {
      return viewRect == other.viewRect &&
          screenPadding == other.screenPadding &&
          screenRect == other.screenRect;
    }
    return false;
  }

  @override
  String toString() {
    return 'ViewMetrics(viewRect: $viewRect, screenPadding: $screenPadding, screenRect: $screenRect)';
  }

  @visibleForTesting
  ViewMetrics(this.viewRect, this.screenPadding, this.screenRect);

  @visibleForTesting
  ViewMetrics.empty() : this(Rect.zero, EdgeInsets.zero, Rect.zero);

  @visibleForTesting
  factory ViewMetrics.fromContext(BuildContext context) {
    final renderObject = context.findRenderObject() as RenderBox?;
    if (renderObject == null) return ViewMetrics.empty();

    final view = View.of(context);
    final viewRect =
        renderObject.localToGlobal(Offset.zero) & renderObject.size;
    final screenPadding =
        EdgeInsets.fromViewPadding(view.viewPadding, view.devicePixelRatio);
    final screenRect = Offset.zero & view.physicalSize / view.devicePixelRatio;
    return ViewMetrics(viewRect, screenPadding, screenRect);
  }

  Insets viewInsets({required bool isAttributionBarVisible}) {
    final left = viewRect.left < screenPadding.left
        ? screenPadding.left - viewRect.left
        : 0.0;
    final top = viewRect.top < screenPadding.top
        ? screenPadding.top - viewRect.top
        : 0.0;
    final right = viewRect.right > screenRect.width - screenPadding.right
        ? viewRect.right - (screenRect.width - screenPadding.right)
        : 0.0;
    final bottom = viewRect.bottom > screenRect.height - screenPadding.bottom
        ? viewRect.bottom - (screenRect.height - screenPadding.bottom)
        : 0.0;

    final adjustedBottom = isAttributionBarVisible
        ? max(bottom, _AttributionBarWidget.minHeight)
        : bottom;

    return Insets(
      left: left,
      top: top,
      right: right,
      bottom: adjustedBottom,
    );
  }
}
