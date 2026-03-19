import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  ProductBloc({
    required this.getProductsUseCase,
    required this.getProductByIdUseCase,
    required this.getCategoriesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(const ProductState()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadMoreProductsEvent>(_onLoadMore);
    on<FilterByCategoryEvent>(_onFilterByCategory);
    on<SearchProductsEvent>(_onSearch);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<LoadProductDetailEvent>(_onLoadProductDetail);
    on<DismissProductDialogEvent>(
        (_, emit) => emit(state.copyWith(showFavoriteDialog: false)));
  }

  Future<void> _onLoadProducts(
      LoadProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
      productsApiStatus: ProductApiStatus.loading,
      currentLimit: state.pageSize,
      hasReachedEnd: false,
    ));

    final categoriesResult = await getCategoriesUseCase();
    final productsResult = await getProductsUseCase(limit: state.pageSize);

    productsResult.fold(
      (failure) => emit(state.copyWith(
        productsApiStatus: ProductApiStatus.failure,
        errorMessage: failure.message,
      )),
      (products) {
        final categories = categoriesResult.getOrElse(() => []);
        emit(state.copyWith(
          productsApiStatus: ProductApiStatus.success,
          products: products,
          categories: categories,
          hasReachedEnd: products.length < state.pageSize,
          showFavoriteDialog: false,
        ));
      },
    );
  }

  Future<void> _onLoadMore(
      LoadMoreProductsEvent event, Emitter<ProductState> emit) async {
    if (state.isLoadingMore || state.hasReachedEnd) return;

    emit(state.copyWith(isLoadingMore: true));
    final newLimit = state.currentLimit + state.pageSize;

    final result = await getProductsUseCase(limit: newLimit);
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingMore: false,
        errorMessage: failure.message,
      )),
      (products) => emit(state.copyWith(
        isLoadingMore: false,
        products: products,
        currentLimit: newLimit,
        hasReachedEnd: products.length <= state.products.length,
      )),
    );
  }

  Future<void> _onFilterByCategory(
      FilterByCategoryEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
      productsApiStatus: ProductApiStatus.loading,
      selectedCategory: event.category,
    ));

    final result = await getProductsUseCase(limit: state.pageSize);

    result.fold(
      (failure) => emit(state.copyWith(
        productsApiStatus: ProductApiStatus.failure,
        errorMessage: failure.message,
      )),
      (products) {
        final filtered = event.category.isEmpty
            ? products
            : products.where((p) => p.category == event.category).toList();
        emit(state.copyWith(
          productsApiStatus: ProductApiStatus.success,
          products: filtered,
          hasReachedEnd: filtered.length < state.pageSize,
        ));
      },
    );
  }

  void _onSearch(SearchProductsEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(searchQuery: event.query));
  }

  Future<void> _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<ProductState> emit) async {
    final result =
        await toggleFavoriteUseCase(event.productId, event.currentlyFavorite);

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) {
        final updatedProducts = state.products.map((p) {
          if (p.id == event.productId) {
            return p.copyWith(isFavorite: !event.currentlyFavorite);
          }
          return p;
        }).toList();

        emit(state.copyWith(
          products: updatedProducts,
          showFavoriteDialog: true,
          isFavoriteAdded: !event.currentlyFavorite,
        ));
      },
    );
  }

  Future<void> _onLoadProductDetail(
      LoadProductDetailEvent event, Emitter<ProductState> emit) async {
    if (event.showLoading) {
      emit(state.copyWith(productDetailStatus: ProductApiStatus.loading));
    }
    final result = await getProductByIdUseCase(event.productId);
    result.fold(
      (failure) => emit(state.copyWith(
        productDetailStatus: ProductApiStatus.failure,
        errorMessage: failure.message,
      )),
      (product) => emit(state.copyWith(
        productDetailStatus: ProductApiStatus.success,
        selectedProduct: product,
      )),
    );
  }
}
