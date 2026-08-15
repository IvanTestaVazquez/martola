import 'package:flutter/foundation.dart';

import '../models/garden_plant.dart';
import '../repositories/garden_plant_repository.dart';

class PlantsViewModel extends ChangeNotifier{
  final GardenPlantRepository gardenPlantRepository;
  String? _currentGardenId;

  final List<GardenPlant> _plants = [];

  PlantsViewModel ({
    required this.gardenPlantRepository,
  });

  String? get currentGardenId => _currentGardenId;

  List<GardenPlant> get plants => List.unmodifiable(_plants);

  Future<void> loadPlants(String gardenId) async {
    _currentGardenId = gardenId;

    final plants = await gardenPlantRepository.getPlantsByGardenId(gardenId);

    _plants.clear();
    _plants.addAll(plants);
    
    notifyListeners();
  }

  Future<void> addPlant ({
    required String speciesId,
    required String customName,
    required DateTime plantingDate,
  }) async {
    final gardenId = _currentGardenId;

    if (gardenId == null) {
      return;
    }

    final plant = GardenPlant(
      gardenId: gardenId,
      speciesId: speciesId,
      customName: customName,
      plantingDate: plantingDate,
    );

    final newPlant = await gardenPlantRepository.addPlant(plant);

    _plants.add(newPlant);

    notifyListeners();
  }

  GardenPlant? getPlantById(String id) { 
    final index = _plants.indexWhere((plant) => plant.id == id,); 

    if (index == -1){
      return null;
    }

    return _plants[index];
  }

  Future<void> updatePlant({
    required String plantId,
    required String speciesId,
    required String customName,
    required DateTime plantingDate,
  }) async {
    final gardenId = _currentGardenId;

    if (gardenId == null){
      return;
    }

    final updatedPlant = GardenPlant(
      gardenId: gardenId, 
      speciesId: speciesId, 
      customName: customName, 
      plantingDate: plantingDate,
    );

    final plant = await gardenPlantRepository.updatePlant(plantId, updatedPlant);

    if ( plant == null ) {
      return;
    }

    final index = _plants.indexWhere((plant) => plant.id == plantId,);

    if (index == -1){
      return;
    }

    _plants[index] = plant;

    notifyListeners();
  }

  Future<void> removePlant(String id) async{
    final removed = await gardenPlantRepository.removePlant(id);

    if (!removed){
      return;
    }

    _plants.removeWhere(
      (plant) => plant.id == id,
    );

    notifyListeners();
  }

}