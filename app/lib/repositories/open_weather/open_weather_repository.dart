import '../../services/weather_service.dart';

import '../weather_repository.dart';

import '../../models/weather_data.dart';

class OpenWeatherRepository implements WeatherRepository{
  final WeatherService weatherService;

  OpenWeatherRepository({
    required this.weatherService,
  });


  @override
  Future<WeatherData> getCurrentWeather({
    required double latitude,
    required double longitude
  }) {
   return weatherService.getCurrentWeather(
      latitude: latitude,
      longitude: longitude
    );  
  }

}