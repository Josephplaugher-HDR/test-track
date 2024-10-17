import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

class Trip {
  final String name;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? notes;
  final String formattedDate;


  Trip(this.notes, this.startTime, this.endTime, this.formattedDate, {required this.name});
}