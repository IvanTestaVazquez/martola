import '../../models/plant_species.dart';
import '../../services/database_service.dart';
import '../plant_species_repository.dart';

class SQLitePlantSpeciesRepository implements PlantSpeciesRepository {
  final DatabaseService databaseService;

  SQLitePlantSpeciesRepository({
    required this.databaseService,
  });

  

  @override
  Future<PlantSpecies> addSpecies(PlantSpecies species) async {
    final db = await databaseService.database;

    final id = await db.insert(
      'plant_species',
      species.toMap(),
    );

    return PlantSpecies(
      id: id.toString(),
      commonName: species.commonName,
      scientificName: species.scientificName,
    );
  }

  @override
  Future<PlantSpecies?> getSpeciesById(String id) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'plant_species',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      return null;
    }

    return PlantSpecies.fromMap(maps.first);
  }

  @override
  Future<List<PlantSpecies>> getSpecies() async {
    final db = await databaseService.database;

    final maps = await db.query('plant_species');

    return  maps.map((map) => PlantSpecies.fromMap(map)).toList();
  }

  @override
  Future<bool> removeSpecies(String id) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'plant_species',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    return affectedRows > 0;
  }

  @override
  Future<PlantSpecies?> updateSpecies(String speciesId, PlantSpecies updatedSpecies) async {
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'plant_species',
      updatedSpecies.toMap(),
      where: 'id = ?',
      whereArgs: [speciesId],
    );

    if (affectedRows == 0){
      return null;
    }

    return PlantSpecies(
      id: speciesId,
      commonName: updatedSpecies.commonName,
      scientificName: updatedSpecies.scientificName,
    );
  }
}