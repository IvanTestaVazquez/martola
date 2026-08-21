import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plant_evolution_viewmodel.dart';
import '../../models/plant_evolution_record.dart';

import 'add_plant_evolution_record_screen.dart';
import 'plant_evolution_details_screen.dart';

class PlantEvolutionListScreen extends StatefulWidget{
  final String plantId;

  const PlantEvolutionListScreen({
    super.key,
    required this.plantId,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlantEvolutionListScreenState();
  }
  
}

class _PlantEvolutionListScreenState extends State<PlantEvolutionListScreen>{

  @override
  void initState(){
    super.initState();

    context.read<PlantEvolutionViewModel>().loadRecords(widget.plantId);
  }

  @override
  Widget build(BuildContext context) {
    final records = context.watch<PlantEvolutionViewModel>().records;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rexistros da planta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: records.isEmpty
            ? Center(
                child: Text(
                  'Non hai rexistros de evolución',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge,
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  final isWide =
                      constraints.maxWidth >= 700;

                  if (!isWide) {
                    return ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (context, index) {
                        return _buildRecordItem(
                          context,
                          records[index],
                        );
                      },
                    );
                  }

                  return GridView.builder(
                    itemCount: records.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2,
                    ),
                    itemBuilder: (context, index) {
                      return _buildRecordItem(
                        context,
                        records[index],
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
              builder: (context) =>
                  const AddPlantEvolutionRecordScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRecordItem(
    BuildContext context,
    PlantEvolutionRecord record,
  ) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  PlantEvolutionDetailsScreen(
                recordId: record.id!,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                '${record.date.day}/'
                '${record.date.month}/'
                '${record.date.year}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                record.height != null
                    ? 'Altura: ${record.height} cm'
                    : 'Altura: sen rexistrar',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                record.notes != null &&
                        record.notes!.trim().isNotEmpty
                    ? 'Notas: ${record.notes}'
                    : 'Notas: sen notas',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}