import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArcGISMapView(
        controllerProvider: () => ArcGISMapView.createController()
          ..arcGISMap = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic),
      ),
    );
  }
}