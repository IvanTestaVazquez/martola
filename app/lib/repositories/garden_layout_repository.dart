import '../models/garden_layout_item.dart';

abstract class GardenLayoutRepository {
  Future<List<GardenLayoutItem>> getItemsByGardenId(
    String gardenId,
  );

  Future<GardenLayoutItem> addItem(
    GardenLayoutItem item,
  );

  Future<GardenLayoutItem?> updateItem(
    String itemId,
    GardenLayoutItem updatedItem,
  );

  Future<bool> removeItem(
    String itemId,
  );
}