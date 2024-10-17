import 'package:arcgis_maps/arcgis_maps.dart';

Future<Iterable<Feature>> loadFeatureService(Uri uri) async {
  // Create a service feature table with the uri.
  final serviceFeatureTables = ServiceFeatureTable.withUri(uri);
  serviceFeatureTables.apiKey = ArcGISEnvironment.apiKey;
  // Load the data
  await serviceFeatureTables.load();

  final QueryParameters query = QueryParameters();
  query.whereClause = '1=1';

  final FeatureQueryResult secondQuery =
      await serviceFeatureTables.queryFeaturesWithFieldOptions(
    parameters: query,
    queryFeatureFields: QueryFeatureFields.loadAll,
  );

  final Iterable<Feature> features = secondQuery.features();

  return features;
}