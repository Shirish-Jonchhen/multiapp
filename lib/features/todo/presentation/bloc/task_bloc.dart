import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/get_tasks_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/get_task_by_id_usecase.dart';
import 'task_event.dart';
import 'task_state.dart';

@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase getTasksUseCase;
  final AddTaskUseCase addTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetTaskByIdUseCase getTaskByIdUseCase;
  final FlutterLocalNotificationsPlugin notificationsPlugin;
  final Map<String, Timer?> _notificationTimers = {};

  TaskBloc({
    required this.getTasksUseCase,
    required this.addTaskUseCase,
    required this.updateTaskUseCase,
    required this.deleteTaskUseCase,
    required this.getTaskByIdUseCase,
    required this.notificationsPlugin,
  }) : super(const TaskState()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<LoadTaskByIdEvent>(_onLoadTaskById);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<NotificationTriggeredEvent>((event, emit) => emit(state.copyWith(
          triggeredTask: event.task,
        )));
    on<DismissNotificationEvent>((_, emit) => emit(state.copyWith(
          triggeredTask: null,
        )));
    on<DismissDialogEvent>((_, emit) => emit(state.copyWith(
          showSuccessDialog: false,
          successDialogMessage: '',
        )));
  }

  @override
  Future<void> close() {
    for (final timer in _notificationTimers.values) {
      timer?.cancel();
    }
    _notificationTimers.clear();
    return super.close();
  }

  Future<void> _onLoadTasks(
      LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(tasksApiStatus: ApiStatus.loading));
    final result = await getTasksUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        tasksApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (tasks) {
        // Automatically reschedule notifications for all pending tasks on launch
        for (final task in tasks) {
          if (!task.isCompleted && task.dueDate != null) {
            _scheduleNotification(task, isInitialLoad: true);
          }
        }
        emit(state.copyWith(
          tasksApiStatus: ApiStatus.success,
          tasks: tasks,
          showSuccessDialog: true,
          successDialogMessage: 'Tasks loaded successfully',
        ));
      },
    );
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(mutationStatus: ApiStatus.loading));
    final result = await addTaskUseCase(event.task);
    await result.fold(
      (failure) async => emit(state.copyWith(
        mutationStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (_) async {
        if (event.task.dueDate != null) {
          try {
            await _scheduleNotification(event.task);
          } catch (e) {
            debugPrint('Failed to schedule notification: $e');
          }
        }

        final tasksResult = await getTasksUseCase();
        tasksResult.fold(
          (_) => emit(state.copyWith(mutationStatus: ApiStatus.failure)),
          (tasks) => emit(state.copyWith(
            mutationStatus: ApiStatus.success,
            tasks: tasks,
            showSuccessDialog: true,
            successDialogMessage: 'Task added successfully',
          )),
        );
      },
    );
  }

  Future<void> _onUpdateTask(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(mutationStatus: ApiStatus.loading));
    final result = await updateTaskUseCase(event.task);
    await result.fold(
      (failure) async => emit(state.copyWith(
        mutationStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (_) async {
        if (event.task.dueDate != null) {
          try {
            await _scheduleNotification(event.task);
          } catch (e) {
            debugPrint('Failed to update notification: $e');
          }
        } else {
          await notificationsPlugin.cancel(event.task.id.hashCode.abs());
        }

        final tasksResult = await getTasksUseCase();
        tasksResult.fold(
          (_) => emit(state.copyWith(mutationStatus: ApiStatus.failure)),
          (tasks) => emit(state.copyWith(
            mutationStatus: ApiStatus.success,
            tasks: tasks,
            selectedTask: event.task,
            showSuccessDialog: true,
            successDialogMessage: 'Task updated successfully',
          )),
        );
      },
    );
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    final updatedTasks = List<TaskEntity>.from(state.tasks)
      ..removeWhere((t) => t.id == event.id);
    emit(state.copyWith(
      mutationStatus: ApiStatus.loading,
      tasks: updatedTasks,
    ));

    // Cancel notification and timer on delete
    _notificationTimers[event.id]?.cancel();
    _notificationTimers.remove(event.id);
    await notificationsPlugin.cancel(event.id.hashCode.abs());

    final result = await deleteTaskUseCase(event.id);
    await result.fold(
      (failure) async => emit(state.copyWith(
        mutationStatus: ApiStatus.failure,
        errorMessage: failure.message,
        tasksApiStatus: ApiStatus.loading,
      )),
      (_) async {
        final tasksResult = await getTasksUseCase();
        tasksResult.fold(
          (_) => emit(state.copyWith(mutationStatus: ApiStatus.failure)),
          (tasks) => emit(state.copyWith(
            mutationStatus: ApiStatus.success,
            tasks: tasks,
            showSuccessDialog: true,
            successDialogMessage: 'Task deleted',
          )),
        );
      },
    );
  }

  Future<void> _onLoadTaskById(
      LoadTaskByIdEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(tasksApiStatus: ApiStatus.loading));
    final result = await getTaskByIdUseCase(event.id);
    result.fold(
      (failure) => emit(state.copyWith(
        tasksApiStatus: ApiStatus.failure,
        errorMessage: failure.message,
      )),
      (task) => emit(state.copyWith(
        tasksApiStatus: ApiStatus.success,
        selectedTask: task,
      )),
    );
  }

  Future<void> _scheduleNotification(TaskEntity task,
      {bool isInitialLoad = false}) async {
    final dueDate = task.dueDate;
    if (dueDate == null || dueDate.isBefore(DateTime.now())) return;

    final taskId = task.id;
    final title = task.title;
    final description = task.description ?? '';

    // Cancel existing timer for this task if any
    _notificationTimers[taskId]?.cancel();

    await notificationsPlugin.zonedSchedule(
      taskId.hashCode.abs(),
      title,
      description,
      tz.TZDateTime.from(dueDate, tz.local)
          .subtract(const Duration(minutes: 30)),
      const NotificationDetails(
        android: AndroidNotificationDetails('task_channel', 'Tasks',
            importance: Importance.max,
            priority: Priority.max,
            showWhen: true,
            fullScreenIntent: true),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'task_id:$taskId',
    );

    final triggerTime = dueDate.subtract(const Duration(minutes: 30));
    final delay = triggerTime.difference(DateTime.now());

    if (delay.isNegative) {
      // If the 30-min lead time has already passed, show it immediately 
      // ONLY if this is not the initial app load (to avoid spamming)
      // and only if the task is still in the future.
      if (!isInitialLoad) {
        add(TaskEvent.notificationTriggered(task));
      }
    } else {
      _notificationTimers[taskId] = Timer(delay, () {
        add(TaskEvent.notificationTriggered(task));
      });
    }
  }
}
