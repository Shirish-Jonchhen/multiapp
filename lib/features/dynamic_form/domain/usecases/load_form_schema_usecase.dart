import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/form_schema_entity.dart';
import '../repository/form_repository.dart';

@injectable
class LoadFormSchemaUseCase {
  final FormRepository repository;
  LoadFormSchemaUseCase(this.repository);

  Future<Either<Failure, FormSchemaEntity>> call() =>
      repository.loadFormSchema();
}
