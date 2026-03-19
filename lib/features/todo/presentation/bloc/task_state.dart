import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';
part 'task_state.freezed.dart';

enum ApiStatus { initial, loading, success, failure }

@freezed
class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default(ApiStatus.initial) ApiStatus tasksApiStatus,
    @Default([]) List<TaskEntity> tasks,
    TaskEntity? selectedTask,
    String? errorMessage,
    @Default(false) bool showSuccessDialog,
    @Default('') String successDialogMessage,
    @Default(ApiStatus.initial) ApiStatus mutationStatus,
    TaskEntity? triggeredTask,
  }) = _TaskState;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
