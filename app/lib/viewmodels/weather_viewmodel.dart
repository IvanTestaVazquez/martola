import 'package:flutter/material.dart';

import '../services/weather_exception.dart';

import '../repositories/weather_repository.dart';
import '../models/weather_data.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository weatherRepository;

  WeatherData? _weatherData;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherViewModel({
    required this.weatherRepository,
  });

  WeatherData? get weatherData => _weatherData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try{
      _weatherData = await weatherRepository.getCurrentWeather(
      latitude: latitude,
      longitude: longitude
      );
    }on WeatherException catch (error){
      _weatherData = null;
      _errorMessage = error.message;
    }finally{      
      _isLoading = false;
      notifyListeners();
    }

  }
}