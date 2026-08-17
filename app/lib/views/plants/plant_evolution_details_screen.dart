import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/plant_evolution_record.dart';
import '../../viewmodels/plant_evolution_viewmodel.dart';

import 'edit_plant_evolution_record_screen.dart';

class PlantEvolutionDetailsScreen extends StatelessWidget{

  final String recordId;

  const PlantEvolutionDetailsScreen({
    super.key,
    required this.recordId,
  });

  @override
  Widget build(BuildContext context) {
    final record = context.select<PlantEvolutionViewModel, PlantEvolutionRecord?> (
      (viewModel) => viewModel.getRecordById(recordId),
    );

    if (record == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles do rexistro'),
        ),
        body: const Center(
          child: Text('Rexistro non atopado'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles do rexistro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                'Data: '
                '${record.date.day}/'
                '${record.date.month}/'
                '${record.date.year}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                record.height != null
                    ? 'Altura: ${record.height} cm'
                    : 'Altura: sen rexistrar',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                record.notes != null
                    ? 'Notas: ${record.notes}'
                    : 'Notas: sen notas',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditPlantEvolutionRecordScreen(record: record,),
                    )
                  );
                }, 
              child: const Text('Editar rexistro')
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Eliminar rexistro'),
                        content: const Text(
                          'Seguro que queres eliminar o rexistro seleccionado?',
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
                                  .read<PlantEvolutionViewModel>()
                                  .removeRecord(record.id!);

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
                child: const Text('Eliminar rexistro'),
              ),
            ], 
          ),         
        ),        
      );

  }
  
}