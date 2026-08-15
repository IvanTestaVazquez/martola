import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../plants/plant_list_screen.dart';
import 'edit_garden_screen.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../viewmodels/plants_viewmodel.dart';
import '../../models/garden.dart';
import '../../models/garden_plant.dart';

class GardenDetailsScreen extends StatefulWidget {
 
  const GardenDetailsScreen({
    super.key,
    required this.gardenId,
  });

  final String gardenId;

   @override
  State<GardenDetailsScreen> createState(){
    return _GardenDetailsScreenState();
  }  
}

class _GardenDetailsScreenState  extends State<GardenDetailsScreen> {

  @override
  void initState(){
    super.initState();

    context.read<PlantsViewModel>().loadPlants(widget.gardenId);
  }


  @override
  Widget build(BuildContext context) {

    final garden = context.select<GardensViewModel, Garden?>(
      (viewModel) => viewModel.getGardenById(widget.gardenId),);

    final plants = context.select<PlantsViewModel, List<GardenPlant>>(
      (viewModel) => viewModel.plants,
    );

    if (garden == null) {
      return const Scaffold(
        body: Center(
          child: Text('Horta non atopada'),
        ),
      );
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          garden.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plantas: ${plants.length}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Localización: ${garden.location}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Área: ${garden.area} m²',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditGardenScreen(garden: garden,),
                    )
                );
              }, 
              child: const Text('Editar horta')
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:(dialogContext){
                    return AlertDialog(
                      title: const Text('Eliminar horta'),
                      content: Text('Seguro que queres eliminar ${garden.name}?'),
                     
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        FilledButton(
                          onPressed: () async {                            
                            await context.read<GardensViewModel>().removeGarden(widget.gardenId);
                            
                            if(!context.mounted || !dialogContext.mounted) return;

                            Navigator.of(dialogContext).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Eliminar'),
                        ),
                      ],
                    );
                  },
                );
              }, 
              child: const Text('Eliminar horta')),
               const SizedBox(height: 16),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlantListScreen(gardenId: widget.gardenId,),
                    )
                );
              }, 
              child: const Text('Lista de plantas')
            ),
          ],
        )
      )
    );
  }
  
}