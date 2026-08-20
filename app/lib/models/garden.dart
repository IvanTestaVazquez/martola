class Garden {

  final String? id;
  final String name;
  final String location;
  final double area;
  final double? latitude;
  final double? longitude;


  const Garden({
    this.id,
    required this.name,
    required this.location,
    required this.area,
    this.latitude,
    this.longitude,
  });

  factory Garden.fromMap(Map<String, Object?> map) {
    return Garden(
      id: map['id'].toString(),
      name: map['name'] as String,
      location: map['location'] as String,
      area: (map['area'] as num).toDouble(),
      latitude: (map['latitude'] as num?)?.toDouble(),
      longitude: (map['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'name' : name,
      'location' : location,
      'area' : area,
      'longitude' : longitude,
      'latitude' : latitude,
    };
  }
}