import 'package:flutter/foundation.dart';

import '../models/plant_species.dart';
import '../repositories/plant_species_repository.dart';

class PlantSpeciesViewModel extends ChangeNotifier {

  final PlantSpeciesRepository plantSpeciesRepository;
  final List<PlantSpecies> _species = [];

  PlantSpeciesViewModel({
    required this.plantSpeciesRepository,
  });

  List<PlantSpecies> get species => List.unmodifiable(_species);

  Future<void> loadSpecies() async {
    final species = await plantSpeciesRepository.getSpecies();

    _species.clear();
    _species.addAll(species);
    
    notifyListeners();
  }

  Future<void> addSpecies(PlantSpecies species) async {
    final newSpecies = await plantSpeciesRepository.addSpecies(species);

    _species.add(newSpecies);

    notifyListeners();
  }

  PlantSpecies? getSpeciesById(String id) { 
    for (final species in _species){
      if (species.id == id){
        return species;
      }
    }

    return null;
  }

  Future<void> updateSpecies (String speciesId, PlantSpecies updatedSpecies) async {
    final species = await plantSpeciesRepository.updateSpecies(speciesId, updatedSpecies);

    if ( species == null) {
      return;
    }

    final index = _species.indexWhere(
      (species) => species.id == speciesId,
    );

    if (index == -1){
      return;
    }

    _species[index] = species;

    notifyListeners();
  }

  Future<void> removeSpecies(String id) async {
    final removed = await plantSpeciesRepository.removeSpecies(id);

    if (!removed) {
      return;
    }
    
     _species.removeWhere(
      (species) => species.id == id,
    );

    notifyListeners();
  }



}