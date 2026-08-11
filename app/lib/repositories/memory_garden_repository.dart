import 'garden_repository.dart';
import '../models/garden.dart';

class MemoryGardenRepository implements GardenRepository {

  final List<Garden> _gardens = [];

  int _nextId = 1;

  @override
  List<Garden> get gardens => List.unmodifiable(_gardens);

  @override
  Garden addGarden(Garden garden){
    final newGarden = Garden(
      id: _nextId.toString(),
      name: garden.name,
      location: garden.location, 
      area: garden.area
    );

    _gardens.add(newGarden);
    _nextId++;

    return newGarden;
  }

  @override
  Garden? getGardenById(String id) {
    for (final garden in _gardens) {
      if (garden.id == id) {
        return garden;
      }
    }

    return null;
  }

  @override
  Garden? updateGarden(String gardenId, Garden updatedGarden){
    final garden = getGardenById(gardenId);

    if ( garden == null) {
      return null;
    }

    final index = _gardens.indexOf(garden);

    final gardenWithId = Garden(
      id: gardenId,
      name: updatedGarden.name,
      location: updatedGarden.location,
      area: updatedGarden.area,
    );

    _gardens[index] = gardenWithId;

    return gardenWithId;
  }

  @override
  bool removeGarden(String id){
    final garden = getGardenById(id);

    if (garden == null) {
      return false;
    }

    return _gardens.remove(garden);    
  }
}