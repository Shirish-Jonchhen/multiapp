import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:multiapp/core/router/app_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiapp/features/todo/presentation/bloc/task_bloc.dart';
import 'package:multiapp/features/todo/presentation/bloc/task_event.dart';
import 'package:multiapp/features/todo/presentation/bloc/task_state.dart';

@RoutePage()
class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (previous, current) =>
          current.triggeredTask != null &&
          previous.triggeredTask != current.triggeredTask,
      listener: (context, state) {
        final task = state.triggeredTask!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Task Reminder: ${task.title}'),
            action: SnackBarAction(
              label: 'View',
              onPressed: () {
                context.router.push(TaskDetailRoute(taskId: task.id));
              },
            ),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ),
        );
        context.read<TaskBloc>().add(const TaskEvent.dismissNotification());
      },
      child: AutoTabsScaffold(
        backgroundColor: Colors.white,
        routes: const [
          TaskListRoute(),
          DynamicFormRoute(),
          ProductListRoute(),
          DeviceInfoRoute(),
          Tab1WrapperRoute(),
          Tab2WrapperRoute(),
          Tab3WrapperRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.check_box), label: 'Todo'),
              NavigationDestination(
                  icon: Icon(Icons.dynamic_form), label: 'Form'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_bag), label: 'Shop'),
              NavigationDestination(
                  icon: Icon(Icons.phone_android), label: 'Device'),
              NavigationDestination(icon: Icon(Icons.looks_one), label: 'Tab 1'),
              NavigationDestination(icon: Icon(Icons.looks_two), label: 'Tab 2'),
              NavigationDestination(icon: Icon(Icons.looks_3), label: 'Tab 3'),
            ],
          );
        },
      ),
    );
  }
}

@RoutePage()
class Tab1WrapperScreen extends StatelessWidget {
  const Tab1WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class Tab2WrapperScreen extends StatelessWidget {
  const Tab2WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class Tab3WrapperScreen extends StatelessWidget {
  const Tab3WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
