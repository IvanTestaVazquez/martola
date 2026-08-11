import 'package:flutter/foundation.dart';

import '../models/garden.dart';

class GardensViewModel extends ChangeNotifier {

  int _nextId = 1;

  final List<Garden> _gardens = [];

  List<Garden> get gardens => List.unmodifiable(_gardens);

  void addGarden(Garden garden) {
    final gardenWithId = Garden(
      id: _nextId.toString(),
      name: garden.name,
      location: garden.location,
      area: garden.area,
    );  

    _gardens.add(gardenWithId);

    _nextId++;

    notifyListeners();
  }

  void removeGarden(String id) {
    final garden = getGardenById(id);

    if (garden == null) {
      return;
    }

    _gardens.remove(garden);
    notifyListeners();
  }

  void updateGarden(Garden oldGarden, Garden updatedGarden){
    final index = _gardens.indexOf(oldGarden);

    if ( index == -1) {
      return;
    }

    _gardens[index] = updatedGarden;
    notifyListeners();
  }

  Garden? getGardenById(String id) {
    for (final garden in _gardens) {
      if (garden.id == id) {
        return garden;
      }
    }

    return null;
  }
}