import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiapp/core/router/app_router.gr.dart';
import 'package:multiapp/core/widgets/app_dialog.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import 'package:multiapp/features/todo/domain/entities/task_entity.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';

@RoutePage()
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state.showSuccessDialog) {
            AppDialog.showInfo(context,
                title: 'Done', message: state.successDialogMessage);

            context.read<TaskBloc>().add(const TaskEvent.dismissDialog());
          }
          if (state.mutationStatus == ApiStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Error')),
            );
          }
        },
        builder: (context, state) {
          if (state.tasksApiStatus == ApiStatus.loading) {
            return const LoadingWidget();
          }
          if (state.tasksApiStatus == ApiStatus.failure) {
            return AppErrorWidget(
              message: state.errorMessage ?? 'Failed to load tasks',
              onRetry: () =>
                  context.read<TaskBloc>().add(const TaskEvent.loadTasks()),
            );
          }
          if (state.tasks.isEmpty &&
              state.tasksApiStatus == ApiStatus.success) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.task_alt,
                      size: 80,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.5)),
                  const SizedBox(height: 16),
                  Text('No tasks yet!',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  const Text('Tap the + button to add your first task.'),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TaskBloc>().add(const TaskEvent.loadTasks());
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return _TaskCard(task: task);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    DateTime? selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                  Text('Add New Task',
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
                        initialDate:
                            DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() => selectedDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text(selectedDate != null
                        ? '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}'
                        : 'Set Due Date (optional)'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isEmpty) return;
                      final task = TaskEntity(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text.trim(),
                        description: descController.text.trim().isEmpty
                            ? null
                            : descController.text.trim(),
                        isCompleted: false,
                        dueDate: selectedDate,
                        createdAt: DateTime.now(),
                      );
                      context.read<TaskBloc>().add(TaskEvent.addTask(task));
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Add Task'),
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

class _TaskCard extends StatelessWidget {
  final TaskEntity task;
  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        context.read<TaskBloc>().add(TaskEvent.deleteTask(task.id));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          style: ListTileStyle.list,
          tileColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black12),
          ),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) {
              final updated = TaskEntity(
                id: task.id,
                title: task.title,
                description: task.description,
                isCompleted: !task.isCompleted,
                dueDate: task.dueDate,
                createdAt: task.createdAt,
              );
              context.read<TaskBloc>().add(TaskEvent.updateTask(updated));
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.dueDate != null
              ? 'Due: ${task.dueDate!.year}-${task.dueDate!.month.toString().padLeft(2, '0')}-${task.dueDate!.day.toString().padLeft(2, '0')}'
              : 'No due date'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            context.router.push(TaskDetailRoute(taskId: task.id));
          },
        ),
      ),
    );
  }
}
