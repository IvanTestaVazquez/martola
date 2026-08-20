class GardenLayoutItem {
  final String? id;
  final String gardenId;
  final String gardenPlantId;
  final double xPosition;
  final double yPosition;

  const GardenLayoutItem({
    this.id,
    required this.gardenId,
    required this.gardenPlantId,
    required this.xPosition,
    required this.yPosition,
  });

  Map<String, Object?> toMap() {
    return {
      'garden_id': int.parse(gardenId),
      'garden_plant_id': int.parse(gardenPlantId),
      'x_position': xPosition,
      'y_position': yPosition,
    };
  }

  factory GardenLayoutItem.fromMap(Map<String,dynamic> map,){
    return GardenLayoutItem(
      id: map['id'].toString(),
      gardenId: map['garden_id'].toString(),
      gardenPlantId: map['garden_plant_id'].toString(),
      xPosition: (map['x_position'] as num).toDouble(),
      yPosition: (map['y_position'] as num).toDouble(),
    );
  }
}