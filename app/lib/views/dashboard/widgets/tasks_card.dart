import 'package:flutter/material.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({
    super.key,
    required this.tasksCount,
    required this.onViewTasks,
  });

  final int tasksCount; 
  final VoidCallback onViewTasks;

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
                  Icons.task, 
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Tarefas",
                  style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$tasksCount tarefas pendentes',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: onViewTasks,
                  child: const Text('Ver tarefas'),
                ),
                ]
            ),            
          ],
        )
      )
    );
  }
}