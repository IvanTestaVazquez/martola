import '../../models/task.dart';
import '../../services/database_service.dart';

import '../task_repository.dart';

class SQLiteTaskRepository implements TaskRepository {
  final DatabaseService databaseService;

  SQLiteTaskRepository({
    required this.databaseService,
  });

  @override
  Future<List<Task>> getTasks() async {
    final db = await databaseService.database;

    final maps = await db.query(
      'tasks',
      orderBy: 'is_completed ASC, due_date ASC',
    );

    return maps
        .map((map) => Task.fromMap(map))
        .toList();
  }

  @override
  Future<Task> addTask(
    Task task,
  ) async {
    final db = await databaseService.database;

    final id = await db.insert(
      'tasks',
      task.toMap(),
    );

    return Task(
      id: id.toString(),
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      isCompleted: task.isCompleted,
    );
  }

  @override
  Future<Task?> updateTask(
    String taskId,
    Task updatedTask,
  ) async {
    final db = await databaseService.database;

    final affectedRows = await db.update(
      'tasks',
      updatedTask.toMap(),
      where: 'id = ?',
      whereArgs: [taskId],
    );

    if (affectedRows == 0) {
      return null;
    }

    return Task(
      id: taskId,
      title: updatedTask.title,
      description: updatedTask.description,
      dueDate: updatedTask.dueDate,
      isCompleted: updatedTask.isCompleted,
    );
  }

  @override
  Future<bool> removeTask(
    String taskId,
  ) async {
    final db = await databaseService.database;

    final affectedRows = await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );

    return affectedRows > 0;
  }
}