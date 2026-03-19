import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/task_entity.dart';
import '../repository/task_repository.dart';

@injectable
class AddTaskUseCase {
  final TaskRepository repository;
  AddTaskUseCase(this.repository);

  Future<Either<Failure, Unit>> call(TaskEntity task) =>
      repository.addTask(task);
}
