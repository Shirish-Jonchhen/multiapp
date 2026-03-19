class TaskEntity {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime? dueDate;
  final DateTime createdAt;

  const TaskEntity({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.dueDate,
    required this.createdAt,
  });
}
