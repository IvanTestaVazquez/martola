import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../viewmodels/tasks_viewmodel.dart';

import 'create_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() =>
      _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TasksViewModel>().loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksViewModel>().tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: tasks.isEmpty
            ? Center(
                child: Text(
                  'Non hai tarefas pendentes',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge,
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  final isWide =
                      constraints.maxWidth >= 700;

                  if (!isWide) {
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return _buildTaskItem(
                          context,
                          tasks[index],
                        );
                      },
                    );
                  }

                  return GridView.builder(
                    itemCount: tasks.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (context, index) {
                      return _buildTaskItem(
                        context,
                        tasks[index],
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const CreateTaskScreen(),
            ),
          );
        },
        tooltip: 'Crear tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskItem(
    BuildContext context,
    Task task,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(
              value: task.isCompleted,
              onChanged: (_) async {
                await context
                    .read<TasksViewModel>()
                    .toggleCompleted(task.id!);
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                          decoration:
                              task.isCompleted
                                  ? TextDecoration
                                      .lineThrough
                                  : null,
                        ),
                  ),
                  if (task.description != null &&
                      task.description!
                          .trim()
                          .isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      task.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (task.dueDate != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Data límite: '
                      '${task.dueDate!.day}/'
                      '${task.dueDate!.month}/'
                      '${task.dueDate!.year}',
                    ),
                  ],
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await context
                    .read<TasksViewModel>()
                    .removeTask(task.id!);
              },
              tooltip: 'Eliminar tarefa',
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}