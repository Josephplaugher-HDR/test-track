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

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

void main() async {
  // Supply your apiKey using the --dart-define-from-file command line argument
  ArcGISEnvironment.apiKey = const String.fromEnvironment('API_KEY');
  // Alternatively, replace the above line with the following and hard-code your apiKey here:
  // ArcGISEnvironment.apiKey = 'your_api_key_here';

  runApp(const MaterialApp(home: GeocodeExample()));
}

class GeocodeExample extends StatefulWidget {
  const GeocodeExample({super.key});

  @override
  State<GeocodeExample> createState() => _GeocodeExampleState();
}

class _GeocodeExampleState extends State<GeocodeExample> {
  final _textEditingController = TextEditingController();
  final _locatorTask = LocatorTask.withUri(Uri.parse(
      'https://geocode-api.arcgis.com/arcgis/rest/services/World/GeocodeServer'));
  final _suggestParameters = SuggestParameters();
  final _geocodeParameters = GeocodeParameters();
  CancelableOperation<List<SuggestResult>>? _suggestOperation;
  String? _suggestAgain;
  var _suggestResults = <SuggestResult>[];
  bool _searchHasFocus = false;
  final _searchFocusNode = FocusNode();
  final _graphicsOverlay = GraphicsOverlay();
  final _graphic = Graphic();
  final _mapViewController = ArcGISMapView.createController();
  bool _ready = false;

  @override
  initState() {
    super.initState();

    _suggestParameters.maxResults = 8;

    _geocodeParameters.minScore = 75;
    _geocodeParameters.resultAttributeNames.add('Match_addr');

    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus != _searchHasFocus) {
        setState(() => _searchHasFocus = _searchFocusNode.hasFocus);
      }
    });

    _graphicsOverlay.renderer = SimpleRenderer(
      symbol: SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: Colors.red,
        size: 20,
      ),
    );
    _graphicsOverlay.graphics.add(_graphic);
    _mapViewController.graphicsOverlays.add(_graphicsOverlay);

    final map = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISStreets);
    map.initialViewpoint = Viewpoint.fromCenter(
      ArcGISPoint(
        x: 4.376000,
        y: 50.838570,
        spatialReference: SpatialReference.wgs84,
      ),
      scale: 2e7,
    );
    map.load().catchError((error) => alertError('Map load', error));
    _mapViewController.arcGISMap = map;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Text('ArcGIS Flutter SDK'),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ArcGISMapView(
            controllerProvider: () => _mapViewController,
            onMapViewReady: () => setState(() => _ready = true),
            onTap: onTap,
          ),
          Visibility(
            visible: _ready,
            child: overlayControls(context),
          ),
        ],
      ),
    );
  }

  Widget overlayControls(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textEditingController,
          autocorrect: false,
          focusNode: _searchFocusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search...',
            suffixIcon: IconButton(
              icon: Icon(_searchHasFocus ? Icons.cancel : Icons.search),
              onPressed: onSearchSuffixPressed,
            ),
          ),
          onChanged: onSearchChanged,
          onSubmitted: onSearchSubmitted,
        ),
        Visibility(
          visible: _suggestResults.isNotEmpty,
          child: Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestResults.length,
              itemBuilder: (context, index) {
                return Material(
                  child: ListTile(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onSuggestSelected(_suggestResults[index]);
                    },
                    title: Text(
                      _suggestResults[index].label,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void onTap(Offset localPosition) async {
    final identifyGraphicsOverlayResult =
        await _mapViewController.identifyGraphicsOverlay(
      _graphicsOverlay,
      screenPoint: localPosition,
      tolerance: 22,
    );

    if (identifyGraphicsOverlayResult.graphics.isEmpty) return;

    if (mounted) {
      final graphic = identifyGraphicsOverlayResult.graphics.first;
      final matchAddr = graphic.attributes['Match_addr'];
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(matchAddr));
        },
      );
    }
  }

  void onSearchChanged(String searchText) async {
    if (searchText.isEmpty) {
      clearSuggestions();
      return;
    }

    if (_suggestOperation != null) {
      // already in progress -- remember to start another query after this one completes
      _suggestAgain = searchText;
      return;
    }

    _suggestOperation = _locatorTask.suggestCancelable(
      searchText: searchText,
      parameters: _suggestParameters,
    );

    final suggestResults = await _suggestOperation!.value;
    _suggestOperation = null;

    setState(() => _suggestResults = List.from(suggestResults));

    if (_suggestAgain != null) {
      // start again with the latest input value
      onSearchChanged(_suggestAgain!);
      _suggestAgain = null;
    }
  }

  void onSuggestSelected(SuggestResult suggestResult) async {
    clearSuggestions();

    _textEditingController.text = suggestResult.label;

    final geocodeResults = await _locatorTask.geocodeWithSuggestResult(
      suggestResult,
      parameters: _geocodeParameters,
    );

    if (geocodeResults.isEmpty) return;

    final geocodeResult = geocodeResults.first;
    _graphic.geometry = geocodeResult.displayLocation;
    _graphic.attributes.addEntries(geocodeResult.attributes.entries);
    if (geocodeResult.extent != null) {
      _mapViewController.setViewpointAnimated(
        Viewpoint.fromTargetExtent(geocodeResult.extent!),
      );
    }
  }

  void onSearchSubmitted(String searchText) async {
    // catch up with any ongoing operation
    if (_suggestAgain != null) {
      if (_suggestOperation != null) {
        _suggestOperation!.cancel();
        _suggestOperation = null;
      }
      onSearchChanged(_suggestAgain!);
      _suggestAgain = null;
    }
    await _suggestOperation?.value;

    // select the top result
    if (_suggestResults.isNotEmpty) {
      onSuggestSelected(_suggestResults.first);
    }
  }

  void clearSuggestions() {
    _suggestAgain = null;
    if (_suggestOperation != null) {
      _suggestOperation!.cancel();
      _suggestOperation = null;
    }

    setState(() => _suggestResults.clear());
  }

  void onSearchSuffixPressed() {
    if (_searchHasFocus) {
      _graphic.geometry = null;
      _textEditingController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      onSearchChanged('');
    } else {
      _searchFocusNode.requestFocus();
    }
  }

  void alertError(String title, ArcGISException error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(error.message),
      ),
    );
  }
}
