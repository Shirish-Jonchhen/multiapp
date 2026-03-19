import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../repository/form_repository.dart';

@injectable
class RestoreFormProgressUseCase {
  final FormRepository repository;
  RestoreFormProgressUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>?>> call() =>
      repository.restoreFormProgress();
}
