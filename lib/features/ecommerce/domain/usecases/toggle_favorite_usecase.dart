import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../repository/product_repository.dart';

@injectable
class ToggleFavoriteUseCase {
  final ProductRepository repository;
  ToggleFavoriteUseCase(this.repository);
  Future<Either<Failure, Unit>> call(int productId, bool currentlyFavorite) =>
      repository.toggleFavorite(productId, currentlyFavorite);
}
