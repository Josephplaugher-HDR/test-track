import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';

void main() {
  // replace 'YOUR_ACCESS_TOKEN' with your API key access token
  ArcGISEnvironment.apiKey =
      'AAPTxy8BH1VEsoebNVZXo8HurJvjrCRhQLxEcvFJ54L52yfMF8SqJXkXpFqBfRjc8xa3qlVHHeo0NKu2IdVfnAdkIy5OxDDSEGi19Dui-vcUlzbZ9JVlzt2pgC-CdM0fO2wcJnQjKx9SFpgNoUp41tu_VTm27bO5YFctaAD1YAuQu-DIDufPXRGM3XGvWVL-etkxhvQp4zzcLtasImfG2keRsTQCaLuleK8O1uQBPwqVmJGziZuS5IewJcyiyu0s1YU1AT1_qz81fJDD';

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
