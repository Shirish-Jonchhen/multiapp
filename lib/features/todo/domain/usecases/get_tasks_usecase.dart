import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/task_entity.dart';
import '../repository/task_repository.dart';

@injectable
class GetTasksUseCase {
  final TaskRepository repository;
  GetTasksUseCase(this.repository);

  Future<Either<Failure, List<TaskEntity>>> call() => repository.getTasks();
}
