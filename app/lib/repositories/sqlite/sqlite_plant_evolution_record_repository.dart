import '../../models/plant_evolution_record.dart';
import '../../services/database_service.dart';
import '../plant_evolution_record_repository.dart';

class SQLitePlantEvolutionRecordRepository
    implements PlantEvolutionRecordRepository {

  final DatabaseService databaseService;

  SQLitePlantEvolutionRecordRepository({
    required this.databaseService,
  });

  @override
  Future<PlantEvolutionRecord> addRecord (PlantEvolutionRecord record) async {
    final db = await databaseService.database;

    final id = await db.insert(
      'plant_evolution_records',
      record.toMap(),
    );

    return PlantEvolutionRecord(
      id: id.toString(),
      plantId: record.plantId,
      date: record.date,
      height: record.height,
      notes: record.notes,
    );
  }

  @override
  Future<PlantEvolutionRecord?> getRecordById(String id) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'plant_evolution_records',
      where: 'id = ?',
      whereArgs: [int.parse(id)],
    );

    if (maps.isEmpty) {
      return null;
    }

    return PlantEvolutionRecord.fromMap(maps.first);
  }

  @override
  Future<List<PlantEvolutionRecord>> getRecordsByPlantId(String plantId) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'plant_evolution_records',
      where: 'plant_id = ?',
      whereArgs: [int.parse(plantId)],
      orderBy: 'date DESC'
      );

    return  maps.map((map) => PlantEvolutionRecord.fromMap(map)).toList();
  }

  @override
  Future<bool> removeRecord(String id) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'plant_evolution_records',
      where: 'id = ?',
      whereArgs: [int.parse(id)],
    );
    
    return affectedRows > 0;
  }

  @override
  Future<PlantEvolutionRecord?> updateRecord(String recordId, PlantEvolutionRecord updatedRecord) async {
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'plant_evolution_records',
      updatedRecord.toMap(),
      where: 'id = ?',
      whereArgs: [int.parse(recordId)],
    );

    if (affectedRows == 0){
      return null;
    }

    return PlantEvolutionRecord(
      id: recordId,
      plantId: updatedRecord.plantId,
      date: updatedRecord.date,
      height: updatedRecord.height,
      notes: updatedRecord.notes,
    );
  }
}