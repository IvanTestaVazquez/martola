class PlantSpecies{

  final String? id;
  final String commonName;
  final String scientificName;

  const PlantSpecies({
    this.id,
    required this.commonName,
    required this.scientificName,
  });

  factory PlantSpecies.fromMap(Map<String, Object?> map) {
    return PlantSpecies(
      id: map['id'].toString(),
      commonName: map['common_name'] as String,
      scientificName: map['scientific_name'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'common_name' : commonName,
      'scientific_name' : scientificName,
    };
  }
}