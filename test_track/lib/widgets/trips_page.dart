import 'dart:developer';

import 'package:test_track/models/project.dart';
import 'package:test_track/models/trip.dart';
import 'package:test_track/common/load_feature_service.dart';
import 'package:test_track/widgets/trip_list_view.dart';
import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key, required this.project});

  final Project project;

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final _allTrips = <Trip>[];
  var _filteredTrips = <Trip>[];
  bool _ready = false;

  final _searchFocusNode = FocusNode();
  final _textEditingController = TextEditingController();
  bool _searchHasFocus = false;

  late TextEditingController _newTripNamecontroller;
  late TextEditingController _newStartDateController;
  final _formKey = GlobalKey<FormState>();
  final Uuid uuid = Uuid();

  @override
  void initState() {
    super.initState();
    loadTrips();

    // instantiate controllers
    _newTripNamecontroller = TextEditingController();
    _newStartDateController = TextEditingController();

    _searchFocusNode.addListener(
      () {
        if (_searchFocusNode.hasFocus != _searchHasFocus) {
          setState(() => _searchHasFocus = _searchFocusNode.hasFocus);
        }
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _searchFocusNode.dispose();
    _newTripNamecontroller.dispose();
    _newStartDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.project.projectName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   child: TextField(
            //     focusNode: _searchFocusNode,
            //     controller: _textEditingController,
            //     onChanged: onSearchChanged,
            //     autocorrect: false,
            //     // ignore: prefer_const_constructors
            //     decoration: InputDecoration(
            //       hintText: 'Search...',
            //     ),
            //   ),
            // ),
            _ready
                ? Expanded(
                    child: Listener(
                      onPointerDown: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: TripListView(trips: _filteredTrips),
                    ),
                  )
                : const Center(
                    child: Text('Loading Trips...'),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openPopup,
        tooltip: 'Add Trip',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future openPopup() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Create New Trip'),
            content: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _newTripNamecontroller,
                    decoration:
                        const InputDecoration(hintText: 'Enter new trip name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Trip Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _newStartDateController,
                    decoration: const InputDecoration(
                        hintText: 'Enter the date of your trip - MM/DD/YYYY'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Start Date';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text("Submit"),
                onPressed: _addTrip,
              )
            ],
          ));

  void _addTrip() async {
    String tripName = _newTripNamecontroller.text;
    String startDate = _newStartDateController.text;

    // Create a uri to a feature service.
    final uri = Uri.parse(
      'https://services.arcgis.com/04HiymDgLlsbhaV4/arcgis/rest/services/TollingData/FeatureServer/1',
    );
    // Create a service feature table with the uri.
    final serviceFeatureTables = ServiceFeatureTable.withUri(uri);
    serviceFeatureTables.apiKey = ArcGISEnvironment.apiKey;
    // Load the data

    final Feature newFeat = serviceFeatureTables.createFeature(
      attributes: {
        'Name': tripName,
        'StartTime': DateTime.now(),
      },
    );

    await serviceFeatureTables.addFeature(newFeat);

    final QueryParameters _query = QueryParameters();
    _query.whereClause = "Name = '$tripName'";

    final FeatureQueryResult secondQuery =
        await serviceFeatureTables.queryFeaturesWithFieldOptions(
            parameters: _query, queryFeatureFields: QueryFeatureFields.loadAll);

    final Iterable<Feature> features = secondQuery.features();

    for (final result in features) {
      log('Pause for effect...');
    }

    Navigator.of(context).pop();
    //loadTrips();
  }

  void onSearchSuffixPressed() {
    if (_searchHasFocus) {
      _textEditingController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      onSearchChanged('');
    } else {
      _searchFocusNode.requestFocus();
    }
  }

  void onSearchChanged(String searchText) {
    final List<Trip> results;
    if (searchText.isEmpty) {
      results = _allTrips;
    } else {
      // TO-DO: update this to query feature table

      // results = _allProjects.where(
      //   (sample) {
      //     final lowerSearchText = searchText.toLowerCase();
      //     return sample.title.toLowerCase().contains(lowerSearchText) ||
      //         sample.category.toLowerCase().contains(lowerSearchText) ||
      //         sample.keywords.any(
      //           (keyword) => keyword.toLowerCase().contains(lowerSearchText),
      //         );
      //   },
      // ).toList();
    }

    //setState(() => _filteredProjects = results);
  }

  void loadTrips() async {
    //setState(() => _ready = false);

    late List<Feature> _features;

    // Create a uri to a feature service.
    final uri = Uri.parse(
      'https://services.arcgis.com/04HiymDgLlsbhaV4/arcgis/rest/services/TollingData/FeatureServer/1',
    );
    // Create a service feature table with the uri.
    final serviceFeatureTables = ServiceFeatureTable.withUri(uri);
    serviceFeatureTables.apiKey = ArcGISEnvironment.apiKey;
    // Load the data
    await serviceFeatureTables.load();

    // Create a feature layer with the service feature table.
    final serviceFeatureLayer =
        FeatureLayer.withFeatureTable(serviceFeatureTables);
    // Clear the operational layers and add the feature layer to the map.

    final QueryParameters _query = QueryParameters();
    _query.whereClause = '1=1';

    final FeatureQueryResult secondQuery =
        await serviceFeatureTables.queryFeaturesWithFieldOptions(
            parameters: _query, queryFeatureFields: QueryFeatureFields.loadAll);

    final Iterable<Feature> features = secondQuery.features();

    for (final result in features) {
      var tripNameData = result.attributes["Name"];
      var startTimeData = result.attributes["StartTime"];
      var endTimeData = result.attributes["EndTime"];
      var notesData = result.attributes["Notes"];

      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(startTimeData);

      Trip trip = Trip(notesData, startTimeData, endTimeData, formattedDate,
          name: tripNameData);
      _allTrips.add(trip);
    }
    _filteredTrips = _allTrips;
    setState(() => _ready = true);
  }
}
