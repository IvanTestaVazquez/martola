import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/plant_evolution_viewmodel.dart';

import '../../models/plant_evolution_record.dart';


class EditPlantEvolutionRecordScreen extends StatefulWidget{
  final PlantEvolutionRecord record;

  const EditPlantEvolutionRecordScreen({
    super.key,
    required this.record,
  });

  @override
  State<EditPlantEvolutionRecordScreen> createState() =>
      _EditPlantEvolutionRecordScreenState();
}

class _EditPlantEvolutionRecordScreenState extends State<EditPlantEvolutionRecordScreen> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _heightController;

  late final TextEditingController _notesController;

  late DateTime _date;

  @override
  void initState(){
    super.initState();
    _heightController = TextEditingController(text: widget.record.height.toString());
    _notesController = TextEditingController(text: widget.record.notes);
    _date = widget.record.date;
  }

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
        title: const Text('Editar rexistro de evolución'),
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

                  await context.read<PlantEvolutionViewModel>().updateRecord(
                    recordId: widget.record.id!,
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