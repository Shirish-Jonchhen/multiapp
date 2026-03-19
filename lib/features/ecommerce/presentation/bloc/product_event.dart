import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_event.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts() = LoadProductsEvent;
  const factory ProductEvent.loadMoreProducts() = LoadMoreProductsEvent;
  const factory ProductEvent.filterByCategory(String category) =
      FilterByCategoryEvent;
  const factory ProductEvent.searchProducts(String query) = SearchProductsEvent;
  const factory ProductEvent.toggleFavorite(
      int productId, bool currentlyFavorite) = ToggleFavoriteEvent;
  const factory ProductEvent.loadProductDetail(
      int productId, bool showLoading) = LoadProductDetailEvent;
  const factory ProductEvent.dismissDialog() = DismissProductDialogEvent;
}
