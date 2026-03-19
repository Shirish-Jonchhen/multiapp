import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/exceptions.dart';
import 'package:multiapp/core/error/failures.dart';
import '../../domain/entities/form_schema_entity.dart';
import '../../domain/repository/form_repository.dart';
import '../datasource/form_local_datasource.dart';
import '../models/form_schema_model.dart';

@LazySingleton(as: FormRepository)
class FormRepositoryImpl implements FormRepository {
  final FormLocalDatasource localDatasource;
  FormRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, FormSchemaEntity>> loadFormSchema() async {
    try {
      final jsonString = await localDatasource.loadFormSchema();
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final model = FormSchemaModel.fromJson(json);
      return Right(model.toEntity());
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveFormProgress(
      int step, Map<String, dynamic> values) async {
    try {
      await localDatasource.saveProgress(step, values);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> restoreFormProgress() async {
    try {
      final result = await localDatasource.restoreProgress();
      return Right(result);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearFormProgress() async {
    try {
      await localDatasource.clearProgress();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }
}
