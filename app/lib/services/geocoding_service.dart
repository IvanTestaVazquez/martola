import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/geocoding_results.dart';

import 'geocoding_exception.dart';

class GeocodingService {
  final String apiKey;

  GeocodingService({
    required this.apiKey,
  });

  Future<List<GeocodingResult>> getGeocodingResults({
    required String location,
  }) async {
    final uri = Uri.https(
      'api.openweathermap.org',
      '/geo/1.0/direct',
      {
        'q': location,
        'limit': '5',
        'appid': apiKey,
      },
    );

    try{      
      final response = await http
            .get(uri)
            .timeout(
              const Duration(seconds: 10),
            );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        return data
          .map(
            (item) => GeocodingResult.fromJson(
              item as Map<String, dynamic>,
            )
          ).toList();
      }

      if (response.statusCode == 401) {
        throw const GeocodingException(
          'API key non válida',
        );
      }

      if (response.statusCode >= 500) {
        throw const GeocodingException(
          'Erro no servidor de xeocodificación',
        );
      }

      throw GeocodingException(
        'Erro HTTP: ${response.statusCode}',
      );
    }on TimeoutException {
      throw const GeocodingException(
        'O servizo de xeocodificación tardou demasiado en responder',
      );
    }on http.ClientException {
      throw const GeocodingException(
       'Non foi posible conectar co servizo de xeocodificación',
      );
    } 
    
  }
  
}