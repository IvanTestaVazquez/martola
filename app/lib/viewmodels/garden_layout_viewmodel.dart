import 'package:flutter/material.dart';

import '../models/garden_layout_item.dart';
import '../repositories/garden_layout_repository.dart';

class GardenLayoutViewModel extends ChangeNotifier {
  final GardenLayoutRepository gardenLayoutRepository;

  String? _currentGardenId;
  final List<GardenLayoutItem> _items = [];

  GardenLayoutViewModel({
    required this.gardenLayoutRepository,
  });

  List<GardenLayoutItem> get items =>
      List.unmodifiable(_items);

  String? get currentGardenId =>
      _currentGardenId;

  Future<void> loadItems(
    String gardenId,
  ) async {
    _currentGardenId = gardenId;

    final items = await gardenLayoutRepository
        .getItemsByGardenId(gardenId);

    _items
      ..clear()
      ..addAll(items);

    notifyListeners();
  }

  Future<void> addItem(
    GardenLayoutItem item,
  ) async {
    final createdItem = await gardenLayoutRepository.addItem(item);

    _items.add(createdItem);

    notifyListeners();
  }

  Future<void> updateItem(
    String itemId,
    GardenLayoutItem updatedItem,
  ) async {
    final savedItem = await gardenLayoutRepository.updateItem(
      itemId,
      updatedItem,
    );

    if (savedItem == null) {
      return;
    }

    final index = _items.indexWhere(
      (item) => item.id == itemId,
    );

    if (index == -1) {
      return;
    }

    _items[index] = savedItem;

    notifyListeners();
  }

  Future<void> removeItem(
    String itemId,
  ) async {
    final removed =
        await gardenLayoutRepository.removeItem(
      itemId,
    );

    if (!removed) {
      return;
    }

    _items.removeWhere(
      (item) => item.id == itemId,
    );

    notifyListeners();
  }
  
  void updateItemPositionLocally(
    String itemId,
    double xPosition,
    double yPosition,
  ) {
    final index = _items.indexWhere(
      (item) => item.id == itemId,
    );

    if (index == -1) {
      return;
    }

    final item = _items[index];

    _items[index] = GardenLayoutItem(
      id: item.id,
      gardenId: item.gardenId,
      gardenPlantId: item.gardenPlantId,
      xPosition: xPosition,
      yPosition: yPosition,
    );

    notifyListeners();
  }
}