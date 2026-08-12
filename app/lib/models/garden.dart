class Garden {

  final String? id;
  final String name;
  final String location;
  final double area;


  const Garden({
    this.id,
    required this.name,
    required this.location,
    required this.area,
  });

  factory Garden.fromMap(Map<String, Object?> map) {
    return Garden(
      id: map['id'].toString(),
      name: map['name'] as String,
      location: map['location'] as String,
      area: (map['area'] as num).toDouble(),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'name' : name,
      'location' : location,
      'area' : area,
    };
  }
}