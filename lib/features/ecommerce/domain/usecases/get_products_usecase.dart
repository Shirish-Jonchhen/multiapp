import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

@injectable
class GetProductsUseCase {
  final ProductRepository repository;
  GetProductsUseCase(this.repository);
  Future<Either<Failure, List<ProductEntity>>> call({int limit = 10}) =>
      repository.getProducts(limit: limit);
}
