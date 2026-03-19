import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../repository/task_repository.dart';

@injectable
class DeleteTaskUseCase {
  final TaskRepository repository;
  DeleteTaskUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String id) => repository.deleteTask(id);
}
