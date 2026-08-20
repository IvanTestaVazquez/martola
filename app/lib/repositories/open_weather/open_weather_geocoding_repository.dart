import '../../models/geocoding_results.dart';
import '../../services/geocoding_service.dart';

import '../geocoding_repository.dart';

class OpenWeatherGeocodingRepository implements GeocodingRepository{
  final GeocodingService geocodingService;

  OpenWeatherGeocodingRepository({
    required this.geocodingService,
  });

  @override
  Future<List<GeocodingResult>> getGeocodingResults({
    required String location
  }) {
    return geocodingService.getGeocodingResults(
      location: location,
    );
  }

}