import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';

import 'garden_details_screen.dart';
import 'create_garden_screen.dart';

import 'widgets/garden_list_item.dart';

class GardensScreen extends StatelessWidget {
  const GardensScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final gardensViewModel = context.watch<GardensViewModel>();
    final gardens = gardensViewModel.gardens;

    return Scaffold(
      appBar: AppBar(
        title: const Text('As miñas hortas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 700;

            if (!isWide) {
              return ListView.builder(
                itemCount: gardens.length,
                itemBuilder: (context, index) {
                  final garden = gardens[index];

                  return GardenListItem(
                    garden: garden,
                    onTap: (garden) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GardenDetailsScreen(
                            gardenId: garden.id!,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }

            return GridView.builder(
              itemCount: gardens.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3,
              ),
              itemBuilder: (context, index) {
                final garden = gardens[index];

                return GardenListItem(
                  garden: garden,
                  onTap: (garden) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GardenDetailsScreen(
                          gardenId: garden.id!,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateGardenScreen(),)
          );
        } ,        
        tooltip: 'Crear nova horta',
        child: const Icon(Icons.add),
      ),
    );
  }
}