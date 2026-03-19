import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiapp/core/widgets/app_dialog.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import 'package:multiapp/features/todo/domain/entities/task_entity.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';

@RoutePage()
class TaskDetailScreen extends StatefulWidget {
  final String taskId;
  const TaskDetailScreen({super.key, required this.taskId});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.loadTaskById(widget.taskId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final task = context.read<TaskBloc>().state.selectedTask;
              if (task != null) {
                _showEditTaskDialog(context, task);
              }
            },
          ),
        ],
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.tasksApiStatus == ApiStatus.loading) {
            return const LoadingSpinner();
          }
          if (state.tasksApiStatus == ApiStatus.failure) {
            return AppErrorWidget(
              message: state.errorMessage ?? 'Failed to load task',
              onRetry: () => context
                  .read<TaskBloc>()
                  .add(TaskEvent.loadTaskById(widget.taskId)),
            );
          }
          final task = state.selectedTask;
          if (task == null) {
            return const Center(child: Text('Task not found'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Chip(
                      label: Text(
                        task.isCompleted ? 'Completed' : 'Pending',
                      ),
                      backgroundColor: task.isCompleted
                          ? Colors.green.withValues(alpha: 0.2)
                          : Colors.orange.withValues(alpha: 0.2),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (task.description != null) ...[
                  Text('Description',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(task.description!),
                  const SizedBox(height: 16),
                ],
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _InfoRow(
                          label: 'Created',
                          value:
                              '${task.createdAt.year}-${task.createdAt.month.toString().padLeft(2, '0')}-${task.createdAt.day.toString().padLeft(2, '0')}',
                        ),
                        if (task.dueDate != null)
                          _InfoRow(
                            label: 'Due Date',
                            value:
                                '${task.dueDate!.year}-${task.dueDate!.month.toString().padLeft(2, '0')}-${task.dueDate!.day.toString().padLeft(2, '0')}',
                          ),
                        _InfoRow(
                          label: 'Status',
                          value: task.isCompleted ? 'Completed' : 'Pending',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final updated = TaskEntity(
                            id: task.id,
                            title: task.title,
                            description: task.description,
                            isCompleted: !task.isCompleted,
                            dueDate: task.dueDate,
                            createdAt: task.createdAt,
                          );
                          context
                              .read<TaskBloc>()
                              .add(TaskEvent.updateTask(updated));
                        },
                        icon: Icon(
                            task.isCompleted ? Icons.undo : Icons.check_circle),
                        label: Text(task.isCompleted
                            ? 'Mark Incomplete'
                            : 'Mark Complete'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final confirm = await AppDialog.showConfirm(
                          context,
                          title: 'Delete Task',
                          message: 'Are you sure you want to delete this task?',
                        );
                        if (confirm == true && context.mounted) {
                          context
                              .read<TaskBloc>()
                              .add(TaskEvent.deleteTask(task.id));
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, TaskEntity task) {
    final titleController = TextEditingController(text: task.title);
    final descController = TextEditingController(text: task.description);
    DateTime? selectedDate = task.dueDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Edit Task',
                      style: Theme.of(ctx).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Task Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() => selectedDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text(selectedDate != null
                        ? '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}'
                        : 'Set Due Date'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isEmpty) return;
                      final updated = TaskEntity(
                        id: task.id,
                        title: titleController.text.trim(),
                        description: descController.text.trim().isEmpty
                            ? null
                            : descController.text.trim(),
                        isCompleted: task.isCompleted,
                        dueDate: selectedDate,
                        createdAt: task.createdAt,
                      );
                      context.read<TaskBloc>().add(TaskEvent.updateTask(updated));
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Update Task'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
