import '../models/plant_evolution_record.dart';

abstract class PlantEvolutionRecordRepository {
  Future<List<PlantEvolutionRecord>> getRecordsByPlantId(
    String plantId,
  );

  Future<PlantEvolutionRecord> addRecord(
    PlantEvolutionRecord record,
  );

  Future<PlantEvolutionRecord?> getRecordById(
    String id,
  );

  Future<PlantEvolutionRecord?> updateRecord(
    String recordId,
    PlantEvolutionRecord updatedRecord,
  );

  Future<bool> removeRecord(
    String id,
  );
}