import '../models/garden.dart';

abstract class GardenRepository {

  Future<List<Garden>> getGardens();

  Future<Garden> addGarden(Garden garden);   

  Future<Garden?> getGardenById(String id);

  Future<Garden?> updateGarden(String gardenId, Garden updatedGarden);

  Future<bool> removeGarden(String id);
}