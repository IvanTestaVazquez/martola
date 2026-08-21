import 'package:flutter/foundation.dart';

import '../models/task.dart';
import '../repositories/task_repository.dart';

class TasksViewModel extends ChangeNotifier {
  final TaskRepository repository;

  TasksViewModel({
    required this.repository,
  });

  final List<Task> _tasks = [];

  List<Task> get tasks =>
      List.unmodifiable(_tasks);

  int get pendingTasksCount =>
      _tasks
          .where((task) => !task.isCompleted)
          .length;

  Future<void> loadTasks() async {
    final tasks = await repository.getTasks();

    _tasks
      ..clear()
      ..addAll(tasks);

    notifyListeners();
  }

  Future<void> addTask(
    Task task,
  ) async {
    final addedTask =
        await repository.addTask(task);

    _tasks.add(addedTask);

    notifyListeners();
  }

  Future<void> toggleCompleted(
    String taskId,
  ) async {
    final index = _tasks.indexWhere(
      (task) => task.id == taskId,
    );

    if (index == -1) {
      return;
    }

    final currentTask = _tasks[index];

    final updatedTask = Task(
      id: currentTask.id,
      title: currentTask.title,
      description: currentTask.description,
      dueDate: currentTask.dueDate,
      isCompleted: !currentTask.isCompleted,
    );

    final savedTask =
        await repository.updateTask(
      taskId,
      updatedTask,
    );

    if (savedTask == null) {
      return;
    }

    _tasks[index] = savedTask;

    notifyListeners();
  }

  Future<void> removeTask(
    String taskId,
  ) async {
    final removed =
        await repository.removeTask(taskId);

    if (!removed) {
      return;
    }

    _tasks.removeWhere(
      (task) => task.id == taskId,
    );

    notifyListeners();
  }
}