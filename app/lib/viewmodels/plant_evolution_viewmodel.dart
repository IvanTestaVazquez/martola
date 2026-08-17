import 'package:flutter/material.dart';

import '../models/plant_evolution_record.dart';
import '../repositories/plant_evolution_record_repository.dart';

class PlantEvolutionViewModel extends ChangeNotifier {

  final PlantEvolutionRecordRepository plantEvolutionRecordRepository;
  String? _currentPlantId;

  final List<PlantEvolutionRecord> _records = [];

  PlantEvolutionViewModel ({
    required this.plantEvolutionRecordRepository,
  });

  String? get currentPlantId => _currentPlantId;

  List<PlantEvolutionRecord> get records => List.unmodifiable(_records);

  Future<void> loadRecords(String plantId) async {
    _currentPlantId = plantId;

    final records = await plantEvolutionRecordRepository.getRecordsByPlantId(plantId);

    _records.clear();
    _records.addAll(records);
    
    notifyListeners();
  }

  Future<void> addRecord ({ 
    required DateTime date,
    double? height,
    String? notes,
    }) async {
    final plantId = _currentPlantId;

    if (plantId == null) {
      return;
    }

    final record = PlantEvolutionRecord(
      plantId: plantId,
      date: date,
      height: height,
      notes: notes,
    );

    final newRecord = await plantEvolutionRecordRepository.addRecord(record);

    _records.insert(0, newRecord);

    notifyListeners();
  }

  PlantEvolutionRecord? getRecordById(String id) { 
    final index = _records.indexWhere((record) => record.id == id,); 

    if (index == -1){
      return null;
    }

    return _records[index];
  }

  Future<void> updateRecord({
    required String recordId,
    required DateTime date,
    double? height,
    String? notes,
  }) async {
    final plantId = _currentPlantId;

    if (plantId == null){
      return;
    }

    final updatedRecord = PlantEvolutionRecord(
      plantId: plantId,
      date: date,
      height: height,
      notes: notes,
    );

    final record = await plantEvolutionRecordRepository.updateRecord(recordId, updatedRecord);

    if ( record == null ) {
      return;
    }

    final index = _records.indexWhere((record) => record.id == recordId,);

    if (index == -1){
      return;
    }

    _records[index] = record;

    notifyListeners();
  }

  Future<void> removeRecord(String id) async{
    final removed = await plantEvolutionRecordRepository.removeRecord(id);

    if (!removed){
      return;
    }

    _records.removeWhere((record) => record.id == id,);

    notifyListeners();
  }
}