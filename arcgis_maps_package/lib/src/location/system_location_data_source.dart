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

/// A [LocationDataSource] that provides location updates from the device.
///
/// Use this data source to display location data on a map using the [ArcGISMapViewController.locationDisplay].
final class SystemLocationDataSource extends LocationDataSource {
  final _dartLocation = Location.instance;

  SystemLocationDataSource._withHandle(super.handle) : super._withHandle();

  /// Creates a system location data source.
  factory SystemLocationDataSource() {
    final handle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_LocationDataSource_create(errorHandler);
    });

    // Create the SystemLocationDataSource and add it to the LocationDataSource instance cache.
    final systemLds = SystemLocationDataSource._withHandle(handle);
    LocationDataSource._instanceCache.addInstance(systemLds);
    return systemLds;
  }

  StreamSubscription<LocationData>? _locationDataStream;

  @override
  Future<void> _doStart() async {
    await _dartLocation._authorizeLocationServices();
    _locationDataStream = _dartLocation.onLocationChanged
        .listen(_handleLocationStreamOnChange)
      ..onError(_handleLocationStreamError);
  }

  @override
  Future<void> _doStop() async {
    if (_locationDataStream != null) {
      _locationDataStream!.cancel();
      _locationDataStream = null;
    }
  }

  void _handleLocationStreamOnChange(LocationData locationData) {
    final location = locationData.toArcGISLocation();
    updateHeading(location.course);
    updateLocation(location);
  }

  void _handleLocationStreamError(Object errorObj, StackTrace stackTrace) {
    // Not much else to do here but stop. Currently the Runtime does not
    // provide a way to fail with an error.
    stop();
  }
}
