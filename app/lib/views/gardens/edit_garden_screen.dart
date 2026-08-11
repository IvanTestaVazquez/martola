import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';

import '../../models/garden.dart';

class EditGardenScreen extends StatefulWidget {

  const EditGardenScreen({
    super.key,
    required this.garden,
  });

  final Garden garden;

  @override
  State<EditGardenScreen> createState(){
    return _EditGardenScreenState();
  }
}

class _EditGardenScreenState extends State<EditGardenScreen>{

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController locationController;
  late final TextEditingController areaController;

  @override
  initState(){
    super.initState();
    nameController = TextEditingController(text: widget.garden.name);
    locationController = TextEditingController(text: widget.garden.location);
    areaController = TextEditingController(text: widget.garden.area.toString());
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar horta'),
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
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        
                        if(!isValid) {
                          return;
                        }

                        final area = double.parse(areaController.text);
                        
                        final gardenId = widget.garden.id;

                        if (gardenId == null){
                          return;
                        }
                        
                        final updatedGarden = Garden(
                          name: nameController.text.trim(),
                          location: locationController.text.trim(),
                          area: area,
                        );

                        context.read<GardensViewModel>().updateGarden(gardenId, updatedGarden);

                        Navigator.of(context).pop();
                      },
                      child: const Text('Gardar cambios'),
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