import 'package:flutter/material.dart';

class Sample {
  final String _category;
  final String _description;
  final List<String> _snippets;
  final String _title;
  final List<String> _keywords;

  Sample.fromJson(Map<String, dynamic> json)
      : _category = json['category'],
        _description = json['description'],
        _snippets = List<String>.from(json['snippets']),
        _title = json['title'],
        _keywords = List<String>.from(json['keywords']);

  String get title => _title;

  String get description => _description;

  String get category => _category;

  List<String> get snippets => _snippets;

  List<String> get keywords => _keywords;

}