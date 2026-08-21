import '../models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();

  Future<Task> addTask(
    Task task,
  );

  Future<Task?> updateTask(
    String taskId,
    Task updatedTask,
  );

  Future<bool> removeTask(
    String taskId,
  );
}