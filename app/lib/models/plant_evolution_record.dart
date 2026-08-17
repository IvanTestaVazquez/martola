class PlantEvolutionRecord{
  final String? id;
  final String plantId;
  final DateTime date;
  final double? height;
  final String? notes;

  const PlantEvolutionRecord ({
    this.id,
    required this.plantId,
    required this.date,
    this.height,
    this.notes
  });

  Map<String, Object?> toMap() {
    return {
      'plant_id' : int.parse(plantId),
      'date' : date.toIso8601String(),
      'height' : height,
      'notes' : notes
    };
  }
  
  factory PlantEvolutionRecord.fromMap(Map<String, Object?> map){
    return PlantEvolutionRecord(
      id: map['id'].toString(),
      plantId: map['plant_id'].toString(),
      date: DateTime.parse(map['date'] as String),
      height: (map['height'] as num?)?.toDouble(),
      notes: map['notes'] as String?,
    );
  }
}