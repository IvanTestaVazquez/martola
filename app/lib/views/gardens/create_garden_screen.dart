import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';

import '../../models/garden.dart';

class CreateGardenScreen extends StatefulWidget {
  const CreateGardenScreen({super.key});

  @override
  State<CreateGardenScreen> createState() {
    return _CreateGardenScreenState();
  }
}

class _CreateGardenScreenState extends State<CreateGardenScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario nova horta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome'
                        ),
                      validator:(value) => 
                        value == null || value.trim().isEmpty
                          ?'Introduce un nome para a horta' 
                          : null,
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        labelText: 'Localización',
                      ),
                      validator:(value) => 
                        value == null || value.trim().isEmpty
                          ?'Introduce unha localización para a horta' 
                          : null,
                    ),              
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: areaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Superficie (m²)', 
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Introduce unha superficie';
                        }

                        final area = double.tryParse(value);

                        if (area == null) {
                          return 'Introduce unha superficie válida';
                        }

                        if (area <= 0) {
                          return 'A superficie debe ser maior que 0';
                        }

                        return null;
                      },
                    ),              
                    const SizedBox(height: 16.0),
                    FilledButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();
                        
                        if(!isValid) {
                          return;
                        }

                        final area = double.parse(areaController.text);

                        final garden = Garden(
                          name: nameController.text.trim(),
                          location: locationController.text.trim(),
                          area: area,
                        );

                        await context.read<GardensViewModel>().addGarden(garden);

                        if (!context.mounted) return;
                        
                        Navigator.of(context).pop();
                      },
                      child: const Text('Crear horta'),
                    )
                  ],
                ),
              ) 
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    areaController.dispose();
    super.dispose();
  }
}