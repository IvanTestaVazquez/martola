import '../models/plant_species.dart';

abstract class PlantSpeciesRepository {
  Future<List<PlantSpecies>> getSpecies();

  Future<PlantSpecies> addSpecies(
    PlantSpecies species,
  );

  Future<PlantSpecies?> getSpeciesById(
    String speciesId,
  );

  Future<PlantSpecies?> updateSpecies(
    String speciesId,
    PlantSpecies updatedSpecies,
  );

  Future<bool> removeSpecies(
    String id,
  );
}