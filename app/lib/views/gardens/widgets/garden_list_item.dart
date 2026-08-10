import 'package:flutter/material.dart';

import '../../../models/garden.dart';

class GardenListItem extends StatelessWidget {
  const GardenListItem({
    super.key,
    required this.garden,
    required this.onTap,
  });

  final Garden garden;
  final void Function(Garden) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:InkWell(
        onTap: () => onTap(garden),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                garden.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    garden.location,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '${garden.area} m²',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )    
            ],
          )
        )
      )
    );
  }
}