import 'weather_exception.dart';

import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/weather_data.dart';

class WeatherService {
  final String apiKey;

  WeatherService({
    required this.apiKey,
  });

  Future<WeatherData> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': apiKey,
        'units': 'metric',
        'lang': 'gl',
      },
    );

    try{      
      final response = await http
            .get(uri)
            .timeout(
              const Duration(seconds: 10),
            );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return WeatherData.fromJson(data);
      }

      if (response.statusCode == 401) {
        throw const WeatherException(
          'API key non válida',
        );
      }

      if (response.statusCode >= 500) {
        throw const WeatherException(
          'Erro no servidor meteorolóxico',
        );
      }

      throw WeatherException(
        'Erro HTTP: ${response.statusCode}',
      );
    }on TimeoutException {
      throw const WeatherException(
        'O servizo meteorolóxico tardou demasiado en responder',
      );
    }on http.ClientException {
      throw const WeatherException(
       'Non foi posible conectar co servizo meteorolóxico',
      );
    } 
    
  }
}