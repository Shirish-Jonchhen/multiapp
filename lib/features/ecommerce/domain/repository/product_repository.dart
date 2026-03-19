import 'package:dartz/dartz.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts({int limit});
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, Unit>> toggleFavorite(
      int productId, bool currentlyFavorite);
}
