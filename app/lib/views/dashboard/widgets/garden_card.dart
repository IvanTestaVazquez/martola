import 'package:flutter/material.dart';

class GardenCard extends StatelessWidget {
  const GardenCard({
    super.key,
    required this.gardenCount,
    required this.onViewGardens,
  });

  final int gardenCount; 
  final VoidCallback onViewGardens;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.local_florist, 
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "As miñas hortas",
                  style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$gardenCount hortas dispoñibles',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: onViewGardens,
                  child: const Text('Ver hortas'),
                ),
                ]
            ),            
          ],
        )
      )
    );
  }
}