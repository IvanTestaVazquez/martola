import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({
    super.key,
    required this.onCreateGarden,
    required this.onAddTask,
  });

  final VoidCallback onCreateGarden; 
  final VoidCallback onAddTask;

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
                  Icons.add_circle_outline_rounded, 
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Accións rápidas",
                  style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: onCreateGarden,
              icon: const Icon(Icons.local_florist),
              label: const Text('Crear horta'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: onAddTask,
              icon: const Icon(Icons.task),
              label: const Text('Engadir tarefa'),
            ), 
          ],
        )
      )
    );
  }
}