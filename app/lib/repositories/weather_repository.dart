import '../models/weather_data.dart';

abstract class WeatherRepository {
   Future<WeatherData> getCurrentWeather({
    required double latitude,
    required double longitude,
  });

}