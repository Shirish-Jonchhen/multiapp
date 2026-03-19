import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_latest;
import 'package:flutter_timezone/flutter_timezone.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/router/app_router.gr.dart';
import 'core/bloc/auth_token_cubit.dart';
import 'features/todo/presentation/bloc/task_bloc.dart';
import 'features/todo/presentation/bloc/task_event.dart';
import 'features/dynamic_form/presentation/bloc/form_cubit.dart';
import 'features/ecommerce/presentation/bloc/product_bloc.dart';
import 'features/ecommerce/presentation/bloc/product_event.dart';
import 'features/method_channel/presentation/bloc/device_info_cubit.dart';
import 'features/nested_nav/presentation/bloc/nav_cubit.dart';

bool _hasHandledNotification = false;

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  // Background handler for custom notification actions
  debugPrint('Background notification tapped: ${response.payload}');
  getIt<AppRouter>().push(
      TaskDetailRoute(taskId: response.payload!.replaceFirst('task_id:', '')));
}

void handleNotificationPayload(String? payload) {
  if (_hasHandledNotification) return;

  debugPrint('Handling notification payload: $payload');
  if (payload != null && payload.startsWith('task_id:')) {
    _hasHandledNotification = true;
    final taskId = payload.replaceFirst('task_id:', '');

    // Use microtask or delay to ensure router is ready
    Future.microtask(() {
      getIt<AppRouter>().push(TaskDetailRoute(taskId: taskId));

      // Reset flag after a delay to allow future notifications
      Future.delayed(const Duration(seconds: 2), () {
        _hasHandledNotification = false;
      });
    });
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  tz_latest.initializeTimeZones();
  final dynamic tzResult = await FlutterTimezone.getLocalTimezone();
  final String tzName = tzResult is String ? tzResult : tzResult.identifier;
  tz.setLocalLocation(tz.getLocation(tzName));

  final notificationsPlugin = getIt<FlutterLocalNotificationsPlugin>();
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  await notificationsPlugin.initialize(
    const InitializationSettings(android: androidSettings, iOS: iosSettings),
    onDidReceiveNotificationResponse: (details) {
      handleNotificationPayload(details.payload);
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  final androidPlatform =
      notificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  if (androidPlatform != null) {
    await androidPlatform.requestNotificationsPermission();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'task_channel',
      'Tasks',
      description: 'Notifications for task reminders',
      importance: Importance.max,
    );
    await androidPlatform.createNotificationChannel(channel);
  }

  const MethodChannel('com.example.multiapp/battery_refresh')
      .setMethodCallHandler((call) async {
    if (call.method == 'refreshBattery') {
      getIt<DeviceInfoCubit>().fetchDeviceInfo();
    }
  });

  runApp(MyApp(appRouter: getIt<AppRouter>()));

  final details = await notificationsPlugin.getNotificationAppLaunchDetails();
  if (details?.didNotificationLaunchApp ?? false) {
    handleNotificationPayload(details!.notificationResponse?.payload);
  }
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthTokenCubit>()),
        BlocProvider(
            create: (_) => getIt<TaskBloc>()..add(const TaskEvent.loadTasks())),
        BlocProvider(create: (_) => getIt<FormCubit>()..loadSchema()),
        BlocProvider(
            create: (_) =>
                getIt<ProductBloc>()..add(const ProductEvent.loadProducts())),
        BlocProvider(create: (_) => getIt<DeviceInfoCubit>()),
        BlocProvider(create: (_) => getIt<NavCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Showcase',
        routerConfig: appRouter.config(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.white,
          ),
          buttonTheme: const ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          dialogTheme: const DialogThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
