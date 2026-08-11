import 'package:flutter/foundation.dart';

import '../models/garden.dart';
import '../repositories/garden_repository.dart';

class GardensViewModel extends ChangeNotifier {

  final GardenRepository repository;
  final List<Garden> _gardens = [];

  GardensViewModel({
    required this.repository,
  });

  Future<void> loadGardens() async {
    final gardens = await repository.getGardens();

    _gardens.clear();
    _gardens.addAll(gardens);
    
    notifyListeners();
  }

  List<Garden> get gardens => List.unmodifiable(_gardens);

  Future<void> addGarden(Garden garden) async {
    final newGarden = await repository.addGarden(garden);

    _gardens.add(newGarden);

    notifyListeners();
  }

  Future<void> removeGarden(String id) async {
    final removed = await repository.removeGarden(id);

    if (!removed) {
      return;
    }
    
     _gardens.removeWhere(
      (garden) => garden.id == id,
    );

    notifyListeners();
  }

  Future<void> updateGarden(String gardenId, Garden updatedGarden) async{
    final garden = await repository.updateGarden(gardenId, updatedGarden);

    if ( garden == null) {
      return;
    }

    for(final currentGarden in _gardens){
      if (currentGarden.id == gardenId) {
        final index = _gardens.indexOf(currentGarden);
        _gardens[index] = garden;

        break;
      }
    }       

    notifyListeners();
  }

  Garden? getGardenById(String id) { 
    for (final garden in _gardens){
      if (garden.id == id){
        return garden;
      }
    }

    return null;
  }
}