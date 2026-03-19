import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/exceptions.dart';
import 'package:multiapp/core/error/failures.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repository/task_repository.dart';
import '../datasource/task_local_datasource.dart';
import '../models/task_model.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDatasource localDatasource;
  TaskRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final models = await localDatasource.getTasks();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(String id) async {
    try {
      final model = await localDatasource.getTaskById(id);
      if (model == null) return Left(Failure.cache(message: 'Task not found'));
      return Right(model.toEntity());
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTask(TaskEntity task) async {
    try {
      await localDatasource.insertTask(TaskModel.fromEntity(task));
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTask(TaskEntity task) async {
    try {
      await localDatasource.updateTask(TaskModel.fromEntity(task));
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String id) async {
    try {
      await localDatasource.deleteTask(id);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}
