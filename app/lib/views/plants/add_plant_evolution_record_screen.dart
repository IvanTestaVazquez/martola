import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plant_evolution_viewmodel.dart';



class AddPlantEvolutionRecordScreen extends StatefulWidget{

  const AddPlantEvolutionRecordScreen({
    super.key,
  });

  @override
  State<AddPlantEvolutionRecordScreen> createState() =>
      _AddPlantEvolutionRecordScreenState();
}

class _AddPlantEvolutionRecordScreenState extends State<AddPlantEvolutionRecordScreen> {

  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();

  final _notesController = TextEditingController();

  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _heightController.dispose();
    _notesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engadir rexistro de evolución'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data: '
                    '${_date.day}/'
                    '${_date.month}/'
                    '${_date.year}',
                  ),
                  TextButton(
                    onPressed: _selectDate,
                    child: const Text('Cambiar'),
                  ),
                ],
              ),
              TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)'
                    ),
                  validator:(value) {
                    if (value == null || value.trim().isEmpty){
                      return null;
                    }

                    final height = double.tryParse(value);

                    if (height == null){
                      return 'A altura non é un valor válido';
                    }

                    if (height <= 0) {
                      return 'A altura debe ser maior que 0';
                    }

                    return null;
                  },
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),                                       
                ),              
              const SizedBox(height: 16),
              TextFormField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notas adicionais'
                    ),             
                ),        
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final heightText = _heightController.text.trim();

                  final height = (heightText.isEmpty)
                    ? null
                    : double.parse(heightText);

                  final notesText = _notesController.text.trim();

                  final notes = notesText.isEmpty
                      ? null
                      : notesText;

                  await context.read<PlantEvolutionViewModel>().addRecord(
                    date: _date,
                    height: height,
                    notes: notes,
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

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _date = selectedDate;
    });
  }

}