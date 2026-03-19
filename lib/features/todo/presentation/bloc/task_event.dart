import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';
part 'task_event.freezed.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.loadTasks() = LoadTasksEvent;
  const factory TaskEvent.loadTaskById(String id) = LoadTaskByIdEvent;
  const factory TaskEvent.addTask(TaskEntity task) = AddTaskEvent;
  const factory TaskEvent.updateTask(TaskEntity task) = UpdateTaskEvent;
  const factory TaskEvent.deleteTask(String id) = DeleteTaskEvent;
  const factory TaskEvent.dismissDialog() = DismissDialogEvent;
  const factory TaskEvent.notificationTriggered(TaskEntity task) = NotificationTriggeredEvent;
  const factory TaskEvent.dismissNotification() = DismissNotificationEvent;
}
