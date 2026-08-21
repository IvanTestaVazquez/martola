import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plant_species_viewmodel.dart';
import '../../viewmodels/plants_viewmodel.dart';

import '../../models/garden_plant.dart';

class EditPlantScreen extends StatefulWidget {
  final GardenPlant plant;

  const EditPlantScreen({
    super.key,
    required this.plant,
  });

  @override
  State<EditPlantScreen> createState() =>
      _EditPlantScreenState();
}

class _EditPlantScreenState extends State<EditPlantScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _customNameController;
  late String? _selectedSpeciesId;
  late DateTime _plantingDate;

  @override
  void initState(){
    super.initState();
    _customNameController = TextEditingController(text: widget.plant.customName);
    _selectedSpeciesId =  widget.plant.speciesId;
    _plantingDate = widget.plant.plantingDate;
  }

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
        title: const Text('Editar planta'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 400;

                      final dateText = Text(
                        'Data de plantación: '
                        '${_plantingDate.day}/'
                        '${_plantingDate.month}/'
                        '${_plantingDate.year}',
                      );

                      final changeButton = TextButton(
                        onPressed: _selectPlantingDate,
                        child: const Text('Cambiar'),
                      );

                      if (isNarrow) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dateText,
                            changeButton,
                          ],
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dateText,
                          changeButton,
                        ],
                      );
                    },
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

                      await context.read<PlantsViewModel>().updatePlant(
                        plantId: widget.plant.id!,
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
          ),
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