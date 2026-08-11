import 'garden_repository.dart';
import '../models/garden.dart';

class MemoryGardenRepository implements GardenRepository {

  final List<Garden> _gardens = [];

  int _nextId = 1;

  @override
  Future<List<Garden>> getGardens() async => List.unmodifiable(_gardens);

  @override
  Future<Garden> addGarden(Garden garden) async{
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
  Future<Garden?> getGardenById(String id) async {
    for (final garden in _gardens) {
      if (garden.id == id) {
        return garden;
      }
    }

    return null;
  }

  @override
  Future<Garden?> updateGarden(String gardenId, Garden updatedGarden)async{
    final garden = await getGardenById(gardenId);

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
  Future<bool> removeGarden(String id) async{
    final garden = await getGardenById(id);

    if (garden == null) {
      return false;
    }

    return _gardens.remove(garden);    
  }
}