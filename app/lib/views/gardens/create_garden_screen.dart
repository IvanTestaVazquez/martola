import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../viewmodels/geocoding_viewmodel.dart';

import '../../models/garden.dart';
import '../../models/geocoding_results.dart';

class CreateGardenScreen extends StatefulWidget {
  const CreateGardenScreen({super.key});

  @override
  State<CreateGardenScreen> createState() {
    return _CreateGardenScreenState();
  }
}

class _CreateGardenScreenState extends State<CreateGardenScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  GeocodingResult? _selectedGeocodingResult;

  @override
  Widget build(BuildContext context) {
    final geocodingViewModel = context.watch<GeocodingViewModel>();

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
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome'
                        ),
                      validator:(value) => 
                        value == null || value.trim().isEmpty
                          ?'Introduce un nome para a horta' 
                          : null,
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _locationController,
                                decoration: const InputDecoration(
                                  labelText: 'Localización',
                                ),
                                validator: (value) =>
                                    value == null || value.trim().isEmpty
                                        ? 'Introduce unha localización para a horta'
                                        : null,
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () async {
                                await context
                                    .read<GeocodingViewModel>()
                                    .searchLocation(
                                      location: _locationController.text,
                                    );
                              },
                              child: const Text('Buscar localización'),
                            ),
                          ],
                        ),

                        if (geocodingViewModel.isLoading)
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          ),
                        if (geocodingViewModel.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              geocodingViewModel.errorMessage!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        if (!geocodingViewModel.isLoading &&
                          geocodingViewModel.errorMessage == null &&
                          geocodingViewModel.results != null &&
                          geocodingViewModel.results!.isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Non se atoparon localizacións',
                          ),
                        ),
                        if (!geocodingViewModel.isLoading &&
                            geocodingViewModel.results != null &&
                            geocodingViewModel.results!.isNotEmpty)
                          RadioGroup<GeocodingResult>(
                            groupValue: _selectedGeocodingResult,
                            onChanged: (value) {
                              setState(() {
                                _selectedGeocodingResult = value;

                                if (value != null){
                                  _locationController.text = value.name;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                for (final result in geocodingViewModel.results!)
                                  RadioListTile<GeocodingResult>(
                                    title: Text(
                                      '${result.name} — '
                                      '${result.state ?? 'Sen rexión'}, '
                                      '${result.country ?? ''}',
                                    ),
                                    subtitle: Text(
                                      '${result.latitude}, ${result.longitude}',
                                    ),
                                    value: result,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),     
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: _areaController,
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

                        final area = double.parse(_areaController.text);

                        final selectedLocation = _selectedGeocodingResult;

                        final garden = Garden(
                          name: _nameController.text.trim(),
                          location: selectedLocation?.name
                                 ?? _locationController.text.trim(),
                          area: area,
                          latitude: _selectedGeocodingResult?.latitude,
                          longitude: _selectedGeocodingResult?.longitude,
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
    _nameController.dispose();
    _locationController.dispose();
    _areaController.dispose();
    super.dispose();
  }
}