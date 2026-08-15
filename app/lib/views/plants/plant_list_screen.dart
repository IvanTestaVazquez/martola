import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plants_viewmodel.dart';

import 'add_plant_screen.dart';
import 'plant_details_screen.dart';

class PlantListScreen extends StatelessWidget {
  const PlantListScreen({
    super.key,
    required this.gardenId,
  });

  final String gardenId;

  @override
  Widget build(BuildContext context) {
    final plantsViewModel =
        context.watch<PlantsViewModel>();

    final plants = plantsViewModel.plants;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantas da horta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: plants.isEmpty
            ? Center(
                child: Text(
                  'Non hai plantas rexistradas',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge,
                ),
              )
            : ListView.builder(
                itemCount: plants.length,
                itemBuilder: (context, index) {
                  final plant = plants[index];

                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlantDetailsScreen(
                            plantId : plant.id!,
                          )),
                      );
                    },
                    child : Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plant.customName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge,
                        ),
                        Text(
                          '${plant.plantingDate.day}/'
                          '${plant.plantingDate.month}/'
                          '${plant.plantingDate.year}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPlantScreen(),)
          );
        } ,
        child: const Icon(Icons.add)
      ),
    );
  }
}