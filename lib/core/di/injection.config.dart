// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:multiapp/core/bloc/auth_token_cubit.dart' as _i269;
import 'package:multiapp/core/di/notification_module.dart' as _i482;
import 'package:multiapp/core/network/dio_client.dart' as _i866;
import 'package:multiapp/core/router/app_router.dart' as _i412;
import 'package:multiapp/features/dynamic_form/data/datasource/form_local_datasource.dart'
    as _i129;
import 'package:multiapp/features/dynamic_form/data/repository_impl/form_repository_impl.dart'
    as _i277;
import 'package:multiapp/features/dynamic_form/domain/repository/form_repository.dart'
    as _i766;
import 'package:multiapp/features/dynamic_form/domain/usecases/load_form_schema_usecase.dart'
    as _i963;
import 'package:multiapp/features/dynamic_form/domain/usecases/restore_form_progress_usecase.dart'
    as _i336;
import 'package:multiapp/features/dynamic_form/domain/usecases/save_form_progress_usecase.dart'
    as _i435;
import 'package:multiapp/features/dynamic_form/presentation/bloc/form_cubit.dart'
    as _i842;
import 'package:multiapp/features/ecommerce/data/datasource/product_local_datasource.dart'
    as _i751;
import 'package:multiapp/features/ecommerce/data/datasource/product_remote_datasource.dart'
    as _i677;
import 'package:multiapp/features/ecommerce/data/repository_impl/product_repository_impl.dart'
    as _i541;
import 'package:multiapp/features/ecommerce/domain/repository/product_repository.dart'
    as _i898;
import 'package:multiapp/features/ecommerce/domain/usecases/get_categories_usecase.dart'
    as _i712;
import 'package:multiapp/features/ecommerce/domain/usecases/get_product_by_id_usecase.dart'
    as _i912;
import 'package:multiapp/features/ecommerce/domain/usecases/get_products_usecase.dart'
    as _i232;
import 'package:multiapp/features/ecommerce/domain/usecases/toggle_favorite_usecase.dart'
    as _i416;
import 'package:multiapp/features/ecommerce/presentation/bloc/product_bloc.dart'
    as _i646;
import 'package:multiapp/features/method_channel/data/datasource/device_info_datasource.dart'
    as _i336;
import 'package:multiapp/features/method_channel/data/repository_impl/device_info_repository_impl.dart'
    as _i674;
import 'package:multiapp/features/method_channel/domain/repository/device_info_repository.dart'
    as _i749;
import 'package:multiapp/features/method_channel/domain/usecases/get_device_info_usecase.dart'
    as _i848;
import 'package:multiapp/features/method_channel/presentation/bloc/device_info_cubit.dart'
    as _i453;
import 'package:multiapp/features/nested_nav/presentation/bloc/nav_cubit.dart'
    as _i912;
import 'package:multiapp/features/todo/data/datasource/task_local_datasource.dart'
    as _i504;
import 'package:multiapp/features/todo/data/repository_impl/task_repository_impl.dart'
    as _i246;
import 'package:multiapp/features/todo/domain/repository/task_repository.dart'
    as _i557;
import 'package:multiapp/features/todo/domain/usecases/add_task_usecase.dart'
    as _i1018;
import 'package:multiapp/features/todo/domain/usecases/delete_task_usecase.dart'
    as _i180;
import 'package:multiapp/features/todo/domain/usecases/get_task_by_id_usecase.dart'
    as _i367;
import 'package:multiapp/features/todo/domain/usecases/get_tasks_usecase.dart'
    as _i198;
import 'package:multiapp/features/todo/domain/usecases/update_task_usecase.dart'
    as _i1036;
import 'package:multiapp/features/todo/presentation/bloc/task_bloc.dart'
    as _i915;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final notificationModule = _$NotificationModule();
    final dioModule = _$DioModule();
    gh.factory<_i912.NavCubit>(() => _i912.NavCubit());
    gh.singleton<_i163.FlutterLocalNotificationsPlugin>(
        () => notificationModule.notificationsPlugin);
    gh.singleton<_i269.AuthTokenCubit>(() => _i269.AuthTokenCubit());
    gh.lazySingleton<_i412.AppRouter>(() => _i412.AppRouter());
    gh.lazySingleton<_i751.ProductLocalDatasource>(
        () => _i751.ProductLocalDatasourceImpl());
    gh.lazySingleton<_i129.FormLocalDatasource>(
        () => _i129.FormLocalDatasourceImpl());
    gh.lazySingleton<_i504.TaskLocalDatasource>(
        () => _i504.TaskLocalDatasourceImpl());
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<_i269.AuthTokenCubit>()));
    gh.lazySingleton<_i336.DeviceInfoDatasource>(
        () => _i336.DeviceInfoDatasourceImpl());
    gh.lazySingleton<_i677.ProductRemoteDatasource>(
        () => _i677.ProductRemoteDatasourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i766.FormRepository>(
        () => _i277.FormRepositoryImpl(gh<_i129.FormLocalDatasource>()));
    gh.lazySingleton<_i557.TaskRepository>(
        () => _i246.TaskRepositoryImpl(gh<_i504.TaskLocalDatasource>()));
    gh.lazySingleton<_i749.DeviceInfoRepository>(
        () => _i674.DeviceInfoRepositoryImpl(gh<_i336.DeviceInfoDatasource>()));
    gh.lazySingleton<_i898.ProductRepository>(() => _i541.ProductRepositoryImpl(
          gh<_i677.ProductRemoteDatasource>(),
          gh<_i751.ProductLocalDatasource>(),
        ));
    gh.factory<_i435.SaveFormProgressUseCase>(
        () => _i435.SaveFormProgressUseCase(gh<_i766.FormRepository>()));
    gh.factory<_i963.LoadFormSchemaUseCase>(
        () => _i963.LoadFormSchemaUseCase(gh<_i766.FormRepository>()));
    gh.factory<_i336.RestoreFormProgressUseCase>(
        () => _i336.RestoreFormProgressUseCase(gh<_i766.FormRepository>()));
    gh.factory<_i848.GetDeviceInfoUseCase>(
        () => _i848.GetDeviceInfoUseCase(gh<_i749.DeviceInfoRepository>()));
    gh.factory<_i1018.AddTaskUseCase>(
        () => _i1018.AddTaskUseCase(gh<_i557.TaskRepository>()));
    gh.factory<_i1036.UpdateTaskUseCase>(
        () => _i1036.UpdateTaskUseCase(gh<_i557.TaskRepository>()));
    gh.factory<_i180.DeleteTaskUseCase>(
        () => _i180.DeleteTaskUseCase(gh<_i557.TaskRepository>()));
    gh.factory<_i367.GetTaskByIdUseCase>(
        () => _i367.GetTaskByIdUseCase(gh<_i557.TaskRepository>()));
    gh.factory<_i198.GetTasksUseCase>(
        () => _i198.GetTasksUseCase(gh<_i557.TaskRepository>()));
    gh.factory<_i912.GetProductByIdUseCase>(
        () => _i912.GetProductByIdUseCase(gh<_i898.ProductRepository>()));
    gh.factory<_i416.ToggleFavoriteUseCase>(
        () => _i416.ToggleFavoriteUseCase(gh<_i898.ProductRepository>()));
    gh.factory<_i232.GetProductsUseCase>(
        () => _i232.GetProductsUseCase(gh<_i898.ProductRepository>()));
    gh.factory<_i712.GetCategoriesUseCase>(
        () => _i712.GetCategoriesUseCase(gh<_i898.ProductRepository>()));
    gh.factory<_i842.FormCubit>(() => _i842.FormCubit(
          loadFormSchemaUseCase: gh<_i963.LoadFormSchemaUseCase>(),
          saveFormProgressUseCase: gh<_i435.SaveFormProgressUseCase>(),
          restoreFormProgressUseCase: gh<_i336.RestoreFormProgressUseCase>(),
          formRepository: gh<_i766.FormRepository>(),
        ));
    gh.lazySingleton<_i453.DeviceInfoCubit>(
        () => _i453.DeviceInfoCubit(gh<_i848.GetDeviceInfoUseCase>()));
    gh.factory<_i915.TaskBloc>(() => _i915.TaskBloc(
          getTasksUseCase: gh<_i198.GetTasksUseCase>(),
          addTaskUseCase: gh<_i1018.AddTaskUseCase>(),
          updateTaskUseCase: gh<_i1036.UpdateTaskUseCase>(),
          deleteTaskUseCase: gh<_i180.DeleteTaskUseCase>(),
          getTaskByIdUseCase: gh<_i367.GetTaskByIdUseCase>(),
          notificationsPlugin: gh<_i163.FlutterLocalNotificationsPlugin>(),
        ));
    gh.factory<_i646.ProductBloc>(() => _i646.ProductBloc(
          getProductsUseCase: gh<_i232.GetProductsUseCase>(),
          getProductByIdUseCase: gh<_i912.GetProductByIdUseCase>(),
          getCategoriesUseCase: gh<_i712.GetCategoriesUseCase>(),
          toggleFavoriteUseCase: gh<_i416.ToggleFavoriteUseCase>(),
        ));
    return this;
  }
}

class _$NotificationModule extends _i482.NotificationModule {}

class _$DioModule extends _i866.DioModule {}
