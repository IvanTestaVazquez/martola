import '../models/geocoding_results.dart';

abstract class GeocodingRepository {

  Future<List<GeocodingResult>> getGeocodingResults ({
    required String location,
  });
}