import 'package:dartz/dartz.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/form_schema_entity.dart';

abstract class FormRepository {
  Future<Either<Failure, FormSchemaEntity>> loadFormSchema();
  Future<Either<Failure, Unit>> saveFormProgress(
      int step, Map<String, dynamic> values);
  Future<Either<Failure, Map<String, dynamic>?>> restoreFormProgress();
  Future<Either<Failure, Unit>> clearFormProgress();
}
