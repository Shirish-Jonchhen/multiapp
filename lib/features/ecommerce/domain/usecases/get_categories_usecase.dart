import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../repository/product_repository.dart';

@injectable
class GetCategoriesUseCase {
  final ProductRepository repository;
  GetCategoriesUseCase(this.repository);
  Future<Either<Failure, List<String>>> call() => repository.getCategories();
}
