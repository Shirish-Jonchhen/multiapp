import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/task_entity.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String id;
  final String title;
  final String? description;
  final int isCompleted;
  final String? dueDate;
  final String createdAt;

  const TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.dueDate,
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  factory TaskModel.fromEntity(TaskEntity e) => TaskModel(
        id: e.id,
        title: e.title,
        description: e.description,
        isCompleted: e.isCompleted ? 1 : 0,
        dueDate: e.dueDate?.toIso8601String(),
        createdAt: e.createdAt.toIso8601String(),
      );

  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted == 1,
        dueDate: dueDate != null ? DateTime.parse(dueDate!) : null,
        createdAt: DateTime.parse(createdAt),
      );
}
