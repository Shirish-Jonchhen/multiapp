import 'package:dartz/dartz.dart';
import 'package:multiapp/core/error/failures.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
