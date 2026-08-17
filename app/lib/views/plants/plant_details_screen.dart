import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_plant_screen.dart';
import 'plant_evolution_list_screen.dart';

import '../../viewmodels/plants_viewmodel.dart';
import '../../viewmodels/plant_species_viewmodel.dart';
import '../../viewmodels/plant_evolution_viewmodel.dart';

import '../../models/garden_plant.dart';
import '../../models/plant_species.dart';
import '../../models/plant_evolution_record.dart';

class PlantDetailsScreen extends StatefulWidget{
  final String plantId;

  const PlantDetailsScreen({
    super.key,
    required this.plantId,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlantDetailsScreen();
  }  
}
class _PlantDetailsScreen extends State<PlantDetailsScreen>{

  @override
  void initState(){
    super.initState();

    context.read<PlantEvolutionViewModel>().loadRecords(widget.plantId);
  }
  
  @override
  Widget build(BuildContext context) {
    final plant = context.select<PlantsViewModel, GardenPlant?>(
      (viewModel) => viewModel.getPlantById(widget.plantId),
    );

    final records = context.select<PlantEvolutionViewModel, List<PlantEvolutionRecord>>(
      (viewModel) => viewModel.records,
    );

    PlantSpecies? species;

    if(plant != null){
      species = context.select<PlantSpeciesViewModel, PlantSpecies?>(
        (viewModel) => viewModel.getSpeciesById(plant.speciesId),
    );
    }
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle da planta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: plant == null          
          ? Center(
              child:Text(
                'Planta non atopada',
                style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                'Nome: ${plant.customName}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Especie: ${species?.commonName ?? 'Descoñecida'}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Data de plantación: ' 
                '${plant.plantingDate.day}/'
                '${plant.plantingDate.month}/'
                '${plant.plantingDate.year}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                 'Rexistros de evolución: ${records.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditPlantScreen(plant: plant,),
                    )
                  );
                }, 
                child: const Text('Editar planta')
              ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlantEvolutionListScreen(
                         plantId: widget.plantId,
                      ),
                    ),
                  );
                },
                child: const Text('Ver evolución'),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Eliminar planta'),
                        content: Text(
                          'Seguro que queres eliminar ${plant.customName}?',
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
                                  .read<PlantsViewModel>()
                                  .removePlant(plant.id!);

                              if (!context.mounted ||
                                  !dialogContext.mounted) {
                                return;
                              }

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
                child: const Text('Eliminar planta'),
              ),
            ]
          ))

    );
  }
}
  
