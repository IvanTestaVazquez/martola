class Task {
  final String? id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool isCompleted;

  const Task({
    this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
  });

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'description': description,
      'due_date': dueDate?.toIso8601String(),
      'is_completed': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'].toString(),
      title: map['title'] as String,
      description: map['description'] as String?,
      dueDate: map['due_date'] != null
          ? DateTime.parse(map['due_date'] as String)
          : null,
      isCompleted: (map['is_completed'] as int) == 1,
    );
  }
}