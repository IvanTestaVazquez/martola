import 'package:flutter/material.dart';

import '../../models/garden.dart';

class GardenDetailsScreen extends StatelessWidget {
 
  const GardenDetailsScreen({
    super.key,
    required this.garden,
  });

  final Garden garden;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          garden.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Localización: ${garden.location}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Área: ${garden.area} m²',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        )
      )
    );
  }
}