import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';
part 'product_state.freezed.dart';

enum ProductApiStatus { initial, loading, success, failure }

@freezed
class ProductState with _$ProductState {
  const ProductState._();

  const factory ProductState({
    @Default(ProductApiStatus.initial) ProductApiStatus productsApiStatus,
    @Default([]) List<ProductEntity> products,
    @Default([]) List<String> categories,
    @Default('') String selectedCategory,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedEnd,
    @Default(10) int currentLimit,
    @Default(10) int pageSize,
    @Default('') String searchQuery,
    String? errorMessage,
    @Default(false) bool showFavoriteDialog,
    @Default(false) bool isFavoriteAdded,
    @Default(ProductApiStatus.initial) ProductApiStatus productDetailStatus,
    ProductEntity? selectedProduct,
  }) = _ProductState;

  List<ProductEntity> get filteredProducts {
    if (searchQuery.isEmpty) return products;
    final q = searchQuery.toLowerCase();
    return products
        .where((p) =>
            p.title.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q))
        .toList();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
