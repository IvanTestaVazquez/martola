import 'package:flutter/foundation.dart';

import '../models/garden.dart';
import '../repositories/garden_repository.dart';

class GardensViewModel extends ChangeNotifier {

  final GardenRepository repository;

  GardensViewModel({
    required this.repository,
  });

  List<Garden> get gardens => repository.gardens;

  void addGarden(Garden garden) {
    repository.addGarden(garden);
    notifyListeners();
  }

  void removeGarden(String id) {
    final removed = repository.removeGarden(id);

    if (!removed) {
      return;
    }

    notifyListeners();
  }

  void updateGarden(String gardenId, Garden updatedGarden){
    final garden = repository.updateGarden(gardenId, updatedGarden);

    if ( garden == null) {
      return;
    }

    notifyListeners();
  }

  Garden? getGardenById(String id) { 
    return repository.getGardenById(id);
  }
}