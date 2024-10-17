import 'package:flutter/material.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

import 'package:test_track/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  ArcGISEnvironment.apiKey = dotenv.env["ESRI_KEY"] ?? "No API key found";
  runApp(const MaterialApp(home: App()));
}
