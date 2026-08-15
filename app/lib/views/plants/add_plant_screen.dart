import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plant_species_viewmodel.dart';
import '../../viewmodels/plants_viewmodel.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({
    super.key,
  });

  @override
  State<AddPlantScreen> createState() =>
      _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();

  final _customNameController = TextEditingController();
  String? _selectedSpeciesId;
  DateTime _plantingDate = DateTime.now();

  @override
  void dispose() {
    _customNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final species = context.watch<PlantSpeciesViewModel>().species;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Engadir planta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                      controller: _customNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome da planta'
                        ),
                      validator:(value) => 
                        value == null || value.trim().isEmpty
                          ?'Introduce un nome para a planta' 
                          : null,
                    ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedSpeciesId,
                decoration: const InputDecoration(
                  labelText: 'Especie',
                ),
                items: species.map((plantSpecies) {
                  return DropdownMenuItem<String>(
                    value: plantSpecies.id,
                    child: Text(
                      plantSpecies.commonName,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSpeciesId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Selecciona unha especie';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data de plantación: '
                    '${_plantingDate.day}/'
                    '${_plantingDate.month}/'
                    '${_plantingDate.year}',
                  ),
                  TextButton(
                    onPressed: _selectPlantingDate,
                    child: const Text('Cambiar'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final speciesId = _selectedSpeciesId;

                  if (speciesId == null) {
                    return;
                  }

                  await context.read<PlantsViewModel>().addPlant(
                    speciesId: speciesId,
                    customName: _customNameController.text.trim(),
                    plantingDate: _plantingDate,
                  );

                  if (!context.mounted) {
                    return;
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Gardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectPlantingDate() async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: _plantingDate,
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );

  if (selectedDate == null) {
    return;
  }

  setState(() {
    _plantingDate = selectedDate;
  });
}
}