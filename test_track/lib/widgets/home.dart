import 'dart:convert';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_track/common/load_feature_service.dart';
import 'package:test_track/models/project.dart';
import 'package:test_track/widgets/sample_list_view.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _allProjects = <Project>[];
  var _filteredProjects = <Project>[];
  bool _ready = false;

  final _searchFocusNode = FocusNode();
  final _textEditingController = TextEditingController();
  bool _searchHasFocus = false;

  @override
  void initState() {
    super.initState();
    loadFeatureServiceFromUri();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                focusNode: _searchFocusNode,
                controller: _textEditingController,
                onChanged: onSearchChanged,
                autocorrect: false,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              ),
            ),
            _ready
                ? Expanded(
                    child: Listener(
                      onPointerDown: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: SampleListView(projects: _filteredProjects),
                    ),
                  )
                : const Center(
                    child: Text('Loading Projects...'),
                  ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void placeholderFunction() {
    // Placeholder function
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
    final List<Project> results;
    if (searchText.isEmpty) {
      results = _allProjects;
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

  void loadSamples() async {
    final jsonString =
        await rootBundle.loadString('assets/generated_samples_list.json');
    final sampleData = jsonDecode(jsonString);
    for (final s in sampleData.entries) {
      //_allSamples.add(Sample.fromJson(s.value));
    }
    //_filteredSamples = _allSamples;
    setState(() => _ready = true);
  }

  void loadFeatureServiceFromUri() async {
    Iterable<Feature> features = await loadFeatureService(Uri.parse(
        'https://services.arcgis.com/04HiymDgLlsbhaV4/arcgis/rest/services/TollingData/FeatureServer/3'));

    for (final result in features) {
      var projName = result.attributes["ProjectName"];
      var projNum = result.attributes["ProjectNumber"];
      var objId = result.attributes["OBJECTID"];

      Project project = Project(projectName: projName, projectNumber: projNum);
      _allProjects.add(project);
    }
    _filteredProjects = _allProjects;
    setState(() => _ready = true);
  }
}