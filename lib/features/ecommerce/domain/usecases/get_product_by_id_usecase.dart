import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

@injectable
class GetProductByIdUseCase {
  final ProductRepository repository;
  GetProductByIdUseCase(this.repository);
  Future<Either<Failure, ProductEntity>> call(int id) =>
      repository.getProductById(id);
}
