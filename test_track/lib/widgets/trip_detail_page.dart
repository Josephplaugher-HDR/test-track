import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:test_track/models/trip.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TripDetailPage extends StatefulWidget {
  const TripDetailPage({super.key, required this.trip});

  final Trip trip;

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  // Create a map with a topographic basemap style.
  final _map = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic);
  // Create a map view controller.
  final _mapViewController = ArcGISMapView.createController();

  // Create the system location data source.
  final _locationDataSource = SystemLocationDataSource();
  // A subscription to receive status changes of the location data source.
  StreamSubscription? _statusSubscription;
  var _status = LocationDataSourceStatus.stopped;
  // A subscription to receive changes to the auto-pan mode.
  StreamSubscription? _autoPanModeSubscription;
  var _autoPanMode = LocationDisplayAutoPanMode.recenter;
  // A flag for when the map view is ready and controls can be used.
  var _ready = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // When exiting, stop the location data source and cancel subscriptions.
    _locationDataSource.stop();
    _statusSubscription?.cancel();
    _autoPanModeSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        // Create a column with a map view and a dropdown button.
        child: Column(
          children: [
            // Add a map view to the widget tree and set a controller.
            Expanded(
              child: ArcGISMapView(
                controllerProvider: () => _mapViewController,
                onMapViewReady: _onMapViewReady,
              ),
            ),
            // Create a dropdown button to select a feature layer source.
            Container(
                height: 225,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.trip.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FixedColumnWidth(80),
                        1: FixedColumnWidth(80),
                        2: FixedColumnWidth(80),
                      },
                      children: const [
                        TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Log 1'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Log 2'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Log 3'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Trip Started.'),
                            ),
                          );
                        },
                        child: const Text('Begin Trip'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _onMapViewReady() async {
    // Create a map with the Navigation Night basemap style.
    _mapViewController.arcGISMap =
        ArcGISMap.withBasemapStyle(BasemapStyle.arcGISNavigationNight);

    // Set the initial system location data source and auto-pan mode.
    _mapViewController.locationDisplay.dataSource = _locationDataSource;
    _mapViewController.locationDisplay.autoPanMode =
        LocationDisplayAutoPanMode.recenter;

    // Subscribe to status changes and changes to the auto-pan mode.
    _statusSubscription = _locationDataSource.onStatusChanged.listen((status) {
      setState(() => _status = status);
    });
    setState(() => _status = _locationDataSource.status);
    _autoPanModeSubscription =
        _mapViewController.locationDisplay.onAutoPanModeChanged.listen((mode) {
      setState(() => _autoPanMode = mode);
    });
    setState(
      () => _autoPanMode = _mapViewController.locationDisplay.autoPanMode,
    );

    // Attempt to start the location data source (this will prompt the user for permission).
    try {
      await _locationDataSource.start();
    } on ArcGISException catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(content: Text(e.message)),
        );
      }
    }

    // Set the ready state variable to true to enable the UI.
    setState(() => _ready = true);
  }
}
