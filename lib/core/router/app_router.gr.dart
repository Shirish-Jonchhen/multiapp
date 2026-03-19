// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:multiapp/features/dynamic_form/presentation/screens/dynamic_form_screen.dart'
    as _i2;
import 'package:multiapp/features/ecommerce/presentation/screens/product_detail_screen.dart'
    as _i4;
import 'package:multiapp/features/ecommerce/presentation/screens/product_list_screen.dart'
    as _i5;
import 'package:multiapp/features/method_channel/presentation/screens/device_info_screen.dart'
    as _i1;
import 'package:multiapp/features/nested_nav/presentation/screens/main_shell_screen.dart'
    as _i3;
import 'package:multiapp/features/nested_nav/presentation/screens/tab1/tab1_detail_screen.dart'
    as _i6;
import 'package:multiapp/features/nested_nav/presentation/screens/tab1/tab1_screen.dart'
    as _i7;
import 'package:multiapp/features/nested_nav/presentation/screens/tab2/tab2_detail_screen.dart'
    as _i8;
import 'package:multiapp/features/nested_nav/presentation/screens/tab2/tab2_screen.dart'
    as _i9;
import 'package:multiapp/features/nested_nav/presentation/screens/tab3/tab3_detail_screen.dart'
    as _i10;
import 'package:multiapp/features/nested_nav/presentation/screens/tab3/tab3_screen.dart'
    as _i11;
import 'package:multiapp/features/todo/presentation/screens/task_detail_screen.dart'
    as _i12;
import 'package:multiapp/features/todo/presentation/screens/task_list_screen.dart'
    as _i13;

/// generated route for
/// [_i1.DeviceInfoScreen]
class DeviceInfoRoute extends _i14.PageRouteInfo<void> {
  const DeviceInfoRoute({List<_i14.PageRouteInfo>? children})
    : super(DeviceInfoRoute.name, initialChildren: children);

  static const String name = 'DeviceInfoRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.DeviceInfoScreen();
    },
  );
}

/// generated route for
/// [_i2.DynamicFormScreen]
class DynamicFormRoute extends _i14.PageRouteInfo<void> {
  const DynamicFormRoute({List<_i14.PageRouteInfo>? children})
    : super(DynamicFormRoute.name, initialChildren: children);

  static const String name = 'DynamicFormRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.DynamicFormScreen();
    },
  );
}

/// generated route for
/// [_i3.MainShellScreen]
class MainShellRoute extends _i14.PageRouteInfo<void> {
  const MainShellRoute({List<_i14.PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainShellScreen();
    },
  );
}

/// generated route for
/// [_i4.ProductDetailScreen]
class ProductDetailRoute extends _i14.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i15.Key? key,
    required int productId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(key: key, productId: productId),
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i4.ProductDetailScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.productId});

  final _i15.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i5.ProductListScreen]
class ProductListRoute extends _i14.PageRouteInfo<void> {
  const ProductListRoute({List<_i14.PageRouteInfo>? children})
    : super(ProductListRoute.name, initialChildren: children);

  static const String name = 'ProductListRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProductListScreen();
    },
  );
}

/// generated route for
/// [_i6.Tab1DetailScreen]
class Tab1DetailRoute extends _i14.PageRouteInfo<void> {
  const Tab1DetailRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab1DetailRoute.name, initialChildren: children);

  static const String name = 'Tab1DetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.Tab1DetailScreen();
    },
  );
}

/// generated route for
/// [_i7.Tab1Screen]
class Tab1Route extends _i14.PageRouteInfo<void> {
  const Tab1Route({List<_i14.PageRouteInfo>? children})
    : super(Tab1Route.name, initialChildren: children);

  static const String name = 'Tab1Route';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.Tab1Screen();
    },
  );
}

/// generated route for
/// [_i3.Tab1WrapperScreen]
class Tab1WrapperRoute extends _i14.PageRouteInfo<void> {
  const Tab1WrapperRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab1WrapperRoute.name, initialChildren: children);

  static const String name = 'Tab1WrapperRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.Tab1WrapperScreen();
    },
  );
}

/// generated route for
/// [_i8.Tab2DetailScreen]
class Tab2DetailRoute extends _i14.PageRouteInfo<void> {
  const Tab2DetailRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab2DetailRoute.name, initialChildren: children);

  static const String name = 'Tab2DetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.Tab2DetailScreen();
    },
  );
}

/// generated route for
/// [_i9.Tab2Screen]
class Tab2Route extends _i14.PageRouteInfo<void> {
  const Tab2Route({List<_i14.PageRouteInfo>? children})
    : super(Tab2Route.name, initialChildren: children);

  static const String name = 'Tab2Route';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.Tab2Screen();
    },
  );
}

/// generated route for
/// [_i3.Tab2WrapperScreen]
class Tab2WrapperRoute extends _i14.PageRouteInfo<void> {
  const Tab2WrapperRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab2WrapperRoute.name, initialChildren: children);

  static const String name = 'Tab2WrapperRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.Tab2WrapperScreen();
    },
  );
}

/// generated route for
/// [_i10.Tab3DetailScreen]
class Tab3DetailRoute extends _i14.PageRouteInfo<void> {
  const Tab3DetailRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab3DetailRoute.name, initialChildren: children);

  static const String name = 'Tab3DetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.Tab3DetailScreen();
    },
  );
}

/// generated route for
/// [_i11.Tab3Screen]
class Tab3Route extends _i14.PageRouteInfo<void> {
  const Tab3Route({List<_i14.PageRouteInfo>? children})
    : super(Tab3Route.name, initialChildren: children);

  static const String name = 'Tab3Route';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.Tab3Screen();
    },
  );
}

/// generated route for
/// [_i3.Tab3WrapperScreen]
class Tab3WrapperRoute extends _i14.PageRouteInfo<void> {
  const Tab3WrapperRoute({List<_i14.PageRouteInfo>? children})
    : super(Tab3WrapperRoute.name, initialChildren: children);

  static const String name = 'Tab3WrapperRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.Tab3WrapperScreen();
    },
  );
}

/// generated route for
/// [_i12.TaskDetailScreen]
class TaskDetailRoute extends _i14.PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({
    _i15.Key? key,
    required String taskId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         TaskDetailRoute.name,
         args: TaskDetailRouteArgs(key: key, taskId: taskId),
         initialChildren: children,
       );

  static const String name = 'TaskDetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskDetailRouteArgs>();
      return _i12.TaskDetailScreen(key: args.key, taskId: args.taskId);
    },
  );
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs({this.key, required this.taskId});

  final _i15.Key? key;

  final String taskId;

  @override
  String toString() {
    return 'TaskDetailRouteArgs{key: $key, taskId: $taskId}';
  }
}

/// generated route for
/// [_i13.TaskListScreen]
class TaskListRoute extends _i14.PageRouteInfo<void> {
  const TaskListRoute({List<_i14.PageRouteInfo>? children})
    : super(TaskListRoute.name, initialChildren: children);

  static const String name = 'TaskListRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TaskListScreen();
    },
  );
}
