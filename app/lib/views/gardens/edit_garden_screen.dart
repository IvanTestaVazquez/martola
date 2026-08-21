import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../viewmodels/geocoding_viewmodel.dart';

import '../../models/garden.dart';
import '../../models/geocoding_results.dart';

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

  late final TextEditingController _nameController;
  late final TextEditingController _locationController;
  late final TextEditingController _areaController;

  GeocodingResult? _selectedGeocodingResult;

  @override
  void initState(){
    super.initState();
    _nameController = TextEditingController(text: widget.garden.name);
    _locationController = TextEditingController(text: widget.garden.location);
    _areaController = TextEditingController(text: widget.garden.area.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context
          .read<GeocodingViewModel>()
          .clearSearch();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final geocodingViewModel = context.watch<GeocodingViewModel>();

    final locationField = TextFormField(
      controller: _locationController,
      decoration: const InputDecoration(
        labelText: 'Localización',
      ),
      validator: (value) =>
          value == null || value.trim().isEmpty
              ? 'Introduce unha localización para a horta'
              : null,
    );

    final searchButton = ElevatedButton(
      onPressed: () async {
        await context
            .read<GeocodingViewModel>()
            .searchLocation(
              location: _locationController.text,
            );
      },
      child: const Text(
        'Buscar localización',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar horta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
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
                         LayoutBuilder(
                            builder: (context, constraints) {
                              final isNarrow =
                                  constraints.maxWidth < 500;

                              if (isNarrow) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    locationField,
                                    const SizedBox(height: 8),
                                    searchButton,
                                  ],
                                );
                              }

                              return Row(
                                children: [
                                  Expanded(
                                    child: locationField,
                                  ),
                                  const SizedBox(width: 16),
                                  searchButton,
                                ],
                              );
                            },
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

                          final location = _locationController.text.trim();
                          final selectedLocation = _selectedGeocodingResult;
                          final locationChanged = (location != widget.garden.location);
                          
                          final gardenId = widget.garden.id;

                          if (gardenId == null){
                            return;
                          }
                                                

                          final updatedGarden = Garden(
                            name: _nameController.text.trim(),
                            location: location,
                            area: area,
                            latitude:selectedLocation != null
                                ? selectedLocation.latitude
                                : locationChanged
                                    ? null
                                    : widget.garden.latitude,
                            longitude: selectedLocation != null
                                ? selectedLocation.longitude
                                : locationChanged
                                    ? null
                                    : widget.garden.longitude,
                          );

                          await context.read<GardensViewModel>().updateGarden(gardenId, updatedGarden);

                          if(!context.mounted) return;

                          Navigator.of(context).pop();
                        },
                        child: const Text('Gardar cambios'),
                      )
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

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _areaController.dispose();
    super.dispose();
  }
}