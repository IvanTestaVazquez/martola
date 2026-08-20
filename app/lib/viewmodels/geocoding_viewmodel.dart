import 'package:flutter/material.dart';

import '../models/geocoding_results.dart';
import '../repositories/geocoding_repository.dart';
import '../services/geocoding_exception.dart';

class GeocodingViewModel extends ChangeNotifier {
  final GeocodingRepository geocodingRepository;

  List<GeocodingResult>? _results;
  bool _isLoading = false;
  String? _errorMessage;

  GeocodingViewModel({
    required this.geocodingRepository,
  });

  List<GeocodingResult>? get results => _results;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> searchLocation({
    required String location,
  }) async {
    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try{
      _results = await geocodingRepository.getGeocodingResults(
        location: location,
      );
    }on GeocodingException catch (error){
      _results = null;
      _errorMessage = error.message;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
    
  }

  void clearSearch(){
    _results = null;
    _errorMessage = null;
    _isLoading = false;

    notifyListeners();
  }
}