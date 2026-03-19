import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts({int limit = 10});
  Future<ProductModel> getProductById(int id);
  Future<List<ProductModel>> getProductsByCategory(String category,
      {int limit = 10});
  Future<List<String>> getCategories();
}

@LazySingleton(as: ProductRemoteDatasource)
class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;
  ProductRemoteDatasourceImpl(this.dio);

  static const _baseUrl = 'https://fakestoreapi.com';

  @override
  Future<List<ProductModel>> getProducts({int limit = 10}) async {
    final response = await dio.get(
      '$_baseUrl/products',
      queryParameters: {'limit': limit},
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await dio.get('$_baseUrl/products/$id');
    return ProductModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category,
      {int limit = 10}) async {
    final response = await dio.get(
      '$_baseUrl/products/category/$category',
      queryParameters: {'limit': limit},
    );
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await dio.get('$_baseUrl/products/categories');
    return List<String>.from(response.data as List<dynamic>);
  }
}
