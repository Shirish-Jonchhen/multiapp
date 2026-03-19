import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../repository/form_repository.dart';

@injectable
class SaveFormProgressUseCase {
  final FormRepository repository;
  SaveFormProgressUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int step, Map<String, dynamic> values) =>
      repository.saveFormProgress(step, values);
}
