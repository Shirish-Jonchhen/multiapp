import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/exceptions.dart';
import 'package:multiapp/core/error/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/product_remote_datasource.dart';
import '../datasource/product_local_datasource.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;
  final ProductLocalDatasource localDatasource;

  ProductRepositoryImpl(this.remoteDatasource, this.localDatasource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
      {int limit = 10}) async {
    try {
      final models = await remoteDatasource.getProducts(limit: limit);
      final favoriteIds = await localDatasource.getFavoriteIds();
      final entities = models
          .map((m) => m.toEntity(isFavorite: favoriteIds.contains(m.id)))
          .toList();
      return Right(entities);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final model = await remoteDatasource.getProductById(id);
      final favoriteIds = await localDatasource.getFavoriteIds();
      return Right(model.toEntity(isFavorite: favoriteIds.contains(model.id)));
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = await remoteDatasource.getCategories();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleFavorite(
      int productId, bool currentlyFavorite) async {
    try {
      if (currentlyFavorite) {
        await localDatasource.removeFavorite(productId);
      } else {
        await localDatasource.addFavorite(productId);
      }
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(Failure.cache(message: e.message));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}
