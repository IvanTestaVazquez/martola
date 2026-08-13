class GardenPlant {
  final String? id;
  final String gardenId;
  final String speciesId;
  final String customName;
  final DateTime plantingDate;

  const GardenPlant(    {
      this.id,
      required this.gardenId,
      required this.speciesId,
      required this.customName,
      required this.plantingDate,
    });

  Map<String, Object?> toMap() {
    return {
      'garden_id' : int.parse(gardenId),
      'species_id' : int.parse(speciesId),
      'custom_name' : customName,
      'planting_date': plantingDate.toIso8601String(),
    };
  }

  factory GardenPlant.fromMap(Map<String, Object?> map) {
    return GardenPlant(
      id: map['id'].toString(),
      gardenId: map['garden_id'].toString(),
      speciesId: map['species_id'].toString(),
      customName: map['custom_name'] as String,
      plantingDate: DateTime.parse(
        map['planting_date'] as String,
      ),
    );
  }
}