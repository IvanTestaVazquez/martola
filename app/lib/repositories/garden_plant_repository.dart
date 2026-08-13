import '../models/garden_plant.dart';

abstract class GardenPlantRepository {
  Future<List<GardenPlant>> getPlantsByGardenId(
    String gardenId,
  );

  Future<GardenPlant> addPlant(
    GardenPlant plant,
  );

  Future<GardenPlant?> getPlantById(
    String id,
  );

  Future<GardenPlant?> updatePlant(
    String plantId,
    GardenPlant updatedPlant,
  );

  Future<bool> removePlant(
    String id,
  );
}