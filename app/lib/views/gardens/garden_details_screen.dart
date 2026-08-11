import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../models/garden.dart';

import 'edit_garden_screen.dart';

class GardenDetailsScreen extends StatelessWidget {
 
  const GardenDetailsScreen({
    super.key,
    required this.gardenId,
  });

  final String gardenId;

  @override
  Widget build(BuildContext context) {

    final garden = context.select<GardensViewModel, Garden?>(
      (viewModel) => viewModel.getGardenById(gardenId),);

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
                          onPressed: () {                            
                            context.read<GardensViewModel>().removeGarden(gardenId);
                            
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
          ],
        )
      )
    );
  }
}