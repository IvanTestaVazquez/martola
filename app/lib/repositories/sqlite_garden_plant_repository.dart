import '../services/database_service.dart';
import '../models/garden_plant.dart';
import 'garden_plant_repository.dart';

class SQLiteGardenPlantRepository implements GardenPlantRepository{
  final DatabaseService databaseService;

  SQLiteGardenPlantRepository({
    required this.databaseService,
  });

  @override
  Future<GardenPlant> addPlant(GardenPlant plant) async {
    final db = await databaseService.database;

    final id = await db.insert(
      'garden_plants',
      plant.toMap(),
    );

    return GardenPlant(
      id: id.toString(),
      gardenId: plant.gardenId,
      speciesId: plant.speciesId,
      customName: plant.customName,
      plantingDate: plant.plantingDate,
    );
  }

  @override
  Future<GardenPlant?> getPlantById(String id) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'garden_plants',
      where: 'id = ?',
      whereArgs: [int.parse(id)],
    );

    if (maps.isEmpty) {
      return null;
    }

    return GardenPlant.fromMap(maps.first);
  }

  @override
  Future<List<GardenPlant>> getPlantsByGardenId(String gardenId) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'garden_plants',
      where: 'garden_id = ?',
      whereArgs: [int.parse(gardenId)],
      );

    return  maps.map((map) => GardenPlant.fromMap(map)).toList();
  }

  @override
  Future<bool> removePlant(String id) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'garden_plants',
      where: 'id = ?',
      whereArgs: [int.parse(id)],
    );
    
    return affectedRows > 0;
  }

  @override
  Future<GardenPlant?> updatePlant(String plantId, GardenPlant updatedPlant) async{
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'garden_plants',
      updatedPlant.toMap(),
      where: 'id = ?',
      whereArgs: [int.parse(plantId)],
    );

    if (affectedRows == 0){
      return null;
    }

    return GardenPlant(
      id: plantId,
      gardenId: updatedPlant.gardenId,
      speciesId: updatedPlant.speciesId,
      customName: updatedPlant.customName,
      plantingDate: updatedPlant.plantingDate,
    );
  }

  
}