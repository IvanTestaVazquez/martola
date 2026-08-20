import '../../models/garden.dart';
import '../../services/database_service.dart';
import '../garden_repository.dart';

class SQLiteGardenRepository implements GardenRepository {
  final DatabaseService databaseService;

  SQLiteGardenRepository({
    required this.databaseService,
  });

  

  @override
  Future<Garden> addGarden(Garden garden) async {
    final db = await databaseService.database;

    final id = await db.insert(
      'gardens',
      garden.toMap(),
    );

    return Garden(
      id: id.toString(),
      location: garden.location,
      name: garden.name,
      area: garden.area,
      longitude: garden.longitude,
      latitude: garden.latitude,
    );
  }

  @override
  Future<Garden?> getGardenById(String id) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'gardens',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      return null;
    }

    return Garden.fromMap(maps.first);
  }

  @override
  Future<List<Garden>> getGardens() async {
    final db = await databaseService.database;

    final maps = await db.query('gardens');

    return  maps.map((map) => Garden.fromMap(map)).toList();
  }

  @override
  Future<bool> removeGarden(String id) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'gardens',
      where: 'id = ?',
      whereArgs: [id],
    );
    
    return affectedRows > 0;
  }

  @override
  Future<Garden?> updateGarden(String gardenId, Garden updatedGarden) async {
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'gardens',
      updatedGarden.toMap(),
      where: 'id = ?',
      whereArgs: [gardenId],
    );

    if (affectedRows == 0){
      return null;
    }

    return Garden(
      id: gardenId,
      name: updatedGarden.name,
      location: updatedGarden.location,
      area: updatedGarden.area,
      longitude: updatedGarden.longitude,
      latitude: updatedGarden.latitude,
    );
  }
}