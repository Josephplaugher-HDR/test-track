import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

void main() async {
  print("we are here: " + Directory.current.path);
  await dotenv.load(fileName: ".env");
  ArcGISEnvironment.apiKey = dotenv.env["ESRI_KEY"] ?? "No API key found";
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArcGISMapView(
        controllerProvider: () => ArcGISMapView.createController()
          ..arcGISMap =
              ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic),
      ),
    );
  }
}
