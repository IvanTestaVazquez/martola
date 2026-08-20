import '../../models/garden_layout_item.dart';
import '../../services/database_service.dart';

import '../garden_layout_repository.dart';

class SQLiteGardenLayoutRepository implements GardenLayoutRepository{
  final DatabaseService databaseService;

  SQLiteGardenLayoutRepository({
    required this.databaseService,
  }); 

  @override
  Future<GardenLayoutItem> addItem(GardenLayoutItem item) async{
    final db = await databaseService.database;

    final id = await db.insert(
      'garden_layout_items',
      item.toMap(),
    );

    return GardenLayoutItem(
      id: id.toString(),
      gardenId: item.gardenId,
      gardenPlantId: item.gardenPlantId,
      xPosition: item.xPosition,
      yPosition: item.yPosition,
    );
  }

  @override
  Future<List<GardenLayoutItem>> getItemsByGardenId(String gardenId) async {
    final db = await databaseService.database;

    final maps = await db.query(
      'garden_layout_items',
      where: 'garden_id = ?',
      whereArgs: [int.parse(gardenId)],
    );

    return maps.map((map) => GardenLayoutItem.fromMap(map)).toList();
  }

  @override
  Future<bool> removeItem(String itemId) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'garden_layout_items',
      where: 'id = ?',
      whereArgs: [int.parse(itemId)],
    );

    return affectedRows > 0;
  }

  @override
  Future<GardenLayoutItem?> updateItem(
    String itemId,
    GardenLayoutItem updatedItem
  ) async {
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'garden_layout_items',
      updatedItem.toMap(),
      where: 'id = ?',
      whereArgs: [int.parse(itemId)],
    );

    if (affectedRows == 0){
      return null;
    }

    return GardenLayoutItem(
      id: itemId,
      gardenId: updatedItem.gardenId,
      gardenPlantId: updatedItem.gardenPlantId,
      xPosition: updatedItem.xPosition,
      yPosition: updatedItem.yPosition,
    );
  }

  
}