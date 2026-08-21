import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/garden_layout_viewmodel.dart';
import '../../viewmodels/plants_viewmodel.dart';

import '../../models/garden_layout_item.dart';
import '../../models/garden_plant.dart';

class LayoutDesignerScreen extends StatefulWidget {
  const LayoutDesignerScreen({
    super.key,
    required this.gardenId,
  });

  final String gardenId;

  @override
  State<LayoutDesignerScreen> createState() {
    return _LayoutDesignerScreenState();
  }
}

class _LayoutDesignerScreenState extends State<LayoutDesignerScreen> {  

  static const double _itemSize = 64.0;
  static const List<(double, double)> _initialPositions = [
    (0.2, 0.2),
    (0.4, 0.2),
    (0.6, 0.2),
    (0.8, 0.2),
    (0.2, 0.4),
    (0.4, 0.4),
    (0.6, 0.4),
    (0.8, 0.4),
    (0.2, 0.6),
    (0.4, 0.6),
    (0.6, 0.6),
    (0.8, 0.6),
    (0.2, 0.8),
    (0.4, 0.8),
    (0.6, 0.8),
    (0.8, 0.8),
  ];

  GardenPlant? _selectedPlant;

  @override
  void initState() {
    super.initState();

    context
        .read<GardenLayoutViewModel>()
        .loadItems(widget.gardenId);

    context
        .read<PlantsViewModel>()
        .loadPlants(widget.gardenId);
  }

  @override
  Widget build(BuildContext context) {
    final plants = context.select<PlantsViewModel, List<GardenPlant>>(
      (viewModel) => viewModel.plants,
    );

    final layoutItems =
        context.select<GardenLayoutViewModel, List<GardenLayoutItem>>(
      (viewModel) => viewModel.items,
    );

    final availablePlants = plants.where(
          (plant) {
            return !layoutItems.any(
              (item) => item.gardenPlantId == plant.id,
            );
          },
        ).toList();

    
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deseño da horta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 500;

                final plantSelector = DropdownButton<GardenPlant>(
                  value: _selectedPlant,
                  hint: const Text(
                    'Selecciona unha planta',
                  ),
                  isExpanded: true,
                  items: availablePlants.map(
                    (plant) {
                      return DropdownMenuItem(
                        value: plant,
                        child: Text(
                          plant.customName,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (plant) {
                    setState(() {
                      _selectedPlant = plant;
                    });
                  },
                );

                final addButton = FilledButton(
                  onPressed: _selectedPlant == null
                      ? null
                      : () async {
                          final plant = _selectedPlant!;
                          final position = _findAvailableInitialPosition(layoutItems);

                          if (position == null) {
                            return;
                          }

                          await context
                              .read<GardenLayoutViewModel>()
                              .addItem(
                                GardenLayoutItem(
                                  gardenId: widget.gardenId,
                                  gardenPlantId: plant.id!,
                                  xPosition: position.$1,
                                  yPosition: position.$2,
                                ),
                              );

                          if (!mounted) return;

                          setState(() {
                            _selectedPlant = null;
                          });
                        },
                  child: const Text(
                    'Engadir ao deseño',
                  ),
                );

                if (isNarrow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      plantSelector,
                      const SizedBox(height: 8),
                      addButton,
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(
                      child: plantSelector,
                    ),
                    const SizedBox(width: 16),
                    addButton,
                  ],
                );
              },
            ),
              const SizedBox(height: 16),
              Expanded(
                child:LayoutBuilder(
                  builder: (context, constraints) {
                    final boardWidth = constraints.maxWidth;
                    final boardHeight = constraints.maxHeight;

                    final minX = (_itemSize / 2) / boardWidth;
                    final maxX = 1.0 - minX;
                    final minY = (_itemSize / 2) / boardHeight;
                    final maxY = 1.0 - minY;

                    return Container(
                      width: boardWidth,
                      height: boardHeight,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                      children: [
                         for (final item in layoutItems)
                           _buildLayoutItem(
                            item: item,
                            plants: plants,
                            layoutItems: layoutItems,
                            boardWidth: boardWidth,
                            boardHeight: boardHeight,
                            minX: minX,
                            maxX: maxX,
                            minY: minY,
                            maxY: maxY,
                          ),
                      ],
                    ),
                    );
                  },
                ),
                ),
            ],  
          ),      
        ),
      );
    
  }

  Widget _buildLayoutItem({
    required GardenLayoutItem item,
    required List<GardenPlant> plants,
    required List<GardenLayoutItem> layoutItems,
    required double boardWidth,
    required double boardHeight,
    required double minX,
    required double maxX,
    required double minY,
    required double maxY,
  }) {
    final plant = plants.firstWhere(
      (plant) => plant.id == item.gardenPlantId,
    );

    return Positioned(
      left: item.xPosition * boardWidth - _itemSize / 2,
      top: item.yPosition * boardHeight - _itemSize / 2,
      child: GestureDetector(
        onPanUpdate: (details) {
          final newX = item.xPosition + details.delta.dx / boardWidth;
          final newY = item.yPosition + details.delta.dy / boardHeight;

          final clampedX = newX.clamp(minX, maxX);
          final clampedY = newY.clamp(minY, maxY);

          final newCenterX = clampedX * boardWidth;
          final newCenterY = clampedY * boardHeight;

          final overlaps = layoutItems.any(
            (otherItem) {
              if (otherItem.id == item.id) {
                return false;
              }

              final otherCenterX =
                  otherItem.xPosition * boardWidth;

              final otherCenterY =
                  otherItem.yPosition * boardHeight;

              final horizontalDistance =
                  (newCenterX - otherCenterX).abs();

              final verticalDistance =
                  (newCenterY - otherCenterY).abs();

              return horizontalDistance < _itemSize &&
                  verticalDistance < _itemSize;
            },
          );

          if (!overlaps){
            context
              .read<GardenLayoutViewModel>()
              .updateItemPositionLocally(
                item.id!,
                clampedX,
                clampedY,
              );
          }
          
          },
        onPanEnd: (_) async {
          final currentItem = context
              .read<GardenLayoutViewModel>()
              .items
              .firstWhere(
                (layoutItem) => layoutItem.id == item.id,
              );

          await context
              .read<GardenLayoutViewModel>()
              .updateItem(
                currentItem.id!,
                currentItem,
              );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text(
                  'Retirar do deseño',
                ),
                content: Text(
                  'Queres retirar ${plant.customName} do deseño?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      await context
                          .read<GardenLayoutViewModel>()
                          .removeItem(item.id!);

                      if (!dialogContext.mounted) {
                        return;
                      }

                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('Retirar'),
                  ),
                ],
              );
            },
          );
        },        
        child: Container(
          width: _itemSize,
          height: _itemSize,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.eco,
                size: 24,
              ),
              Text(
                plant.customName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall,
              ),
            ],
          ),
        )
      ), 
    );
  }

  (double, double)? _findAvailableInitialPosition(
    List<GardenLayoutItem> layoutItems,
  ) {
    for (final position in _initialPositions) {
      final isOccupied = layoutItems.any(
        (item) {
          final horizontalDistance =
              (item.xPosition - position.$1).abs();

          final verticalDistance =
              (item.yPosition - position.$2).abs();

          return horizontalDistance < 0.15 &&
              verticalDistance < 0.15;
        },
      );

      if (!isOccupied) {
        return position;
      }
    }

    return null;
  }

  
}