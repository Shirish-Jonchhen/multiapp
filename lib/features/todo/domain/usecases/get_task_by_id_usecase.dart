import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/task_entity.dart';
import '../repository/task_repository.dart';

@injectable
class GetTaskByIdUseCase {
  final TaskRepository repository;
  GetTaskByIdUseCase(this.repository);

  Future<Either<Failure, TaskEntity>> call(String id) =>
      repository.getTaskById(id);
}
