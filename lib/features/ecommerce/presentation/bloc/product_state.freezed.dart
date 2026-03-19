// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  ProductApiStatus get productsApiStatus => throw _privateConstructorUsedError;
  List<ProductEntity> get products => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  int get currentLimit => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get showFavoriteDialog => throw _privateConstructorUsedError;
  bool get isFavoriteAdded => throw _privateConstructorUsedError;
  ProductApiStatus get productDetailStatus =>
      throw _privateConstructorUsedError;
  ProductEntity? get selectedProduct => throw _privateConstructorUsedError;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {ProductApiStatus productsApiStatus,
      List<ProductEntity> products,
      List<String> categories,
      String selectedCategory,
      bool isLoadingMore,
      bool hasReachedEnd,
      int currentLimit,
      int pageSize,
      String searchQuery,
      String? errorMessage,
      bool showFavoriteDialog,
      bool isFavoriteAdded,
      ProductApiStatus productDetailStatus,
      ProductEntity? selectedProduct});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsApiStatus = null,
    Object? products = null,
    Object? categories = null,
    Object? selectedCategory = null,
    Object? isLoadingMore = null,
    Object? hasReachedEnd = null,
    Object? currentLimit = null,
    Object? pageSize = null,
    Object? searchQuery = null,
    Object? errorMessage = freezed,
    Object? showFavoriteDialog = null,
    Object? isFavoriteAdded = null,
    Object? productDetailStatus = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_value.copyWith(
      productsApiStatus: null == productsApiStatus
          ? _value.productsApiStatus
          : productsApiStatus // ignore: cast_nullable_to_non_nullable
              as ProductApiStatus,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLimit: null == currentLimit
          ? _value.currentLimit
          : currentLimit // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showFavoriteDialog: null == showFavoriteDialog
          ? _value.showFavoriteDialog
          : showFavoriteDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavoriteAdded: null == isFavoriteAdded
          ? _value.isFavoriteAdded
          : isFavoriteAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetailStatus: null == productDetailStatus
          ? _value.productDetailStatus
          : productDetailStatus // ignore: cast_nullable_to_non_nullable
              as ProductApiStatus,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
          _$ProductStateImpl value, $Res Function(_$ProductStateImpl) then) =
      __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductApiStatus productsApiStatus,
      List<ProductEntity> products,
      List<String> categories,
      String selectedCategory,
      bool isLoadingMore,
      bool hasReachedEnd,
      int currentLimit,
      int pageSize,
      String searchQuery,
      String? errorMessage,
      bool showFavoriteDialog,
      bool isFavoriteAdded,
      ProductApiStatus productDetailStatus,
      ProductEntity? selectedProduct});
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl _value, $Res Function(_$ProductStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsApiStatus = null,
    Object? products = null,
    Object? categories = null,
    Object? selectedCategory = null,
    Object? isLoadingMore = null,
    Object? hasReachedEnd = null,
    Object? currentLimit = null,
    Object? pageSize = null,
    Object? searchQuery = null,
    Object? errorMessage = freezed,
    Object? showFavoriteDialog = null,
    Object? isFavoriteAdded = null,
    Object? productDetailStatus = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_$ProductStateImpl(
      productsApiStatus: null == productsApiStatus
          ? _value.productsApiStatus
          : productsApiStatus // ignore: cast_nullable_to_non_nullable
              as ProductApiStatus,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLimit: null == currentLimit
          ? _value.currentLimit
          : currentLimit // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showFavoriteDialog: null == showFavoriteDialog
          ? _value.showFavoriteDialog
          : showFavoriteDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavoriteAdded: null == isFavoriteAdded
          ? _value.isFavoriteAdded
          : isFavoriteAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetailStatus: null == productDetailStatus
          ? _value.productDetailStatus
          : productDetailStatus // ignore: cast_nullable_to_non_nullable
              as ProductApiStatus,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as ProductEntity?,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl extends _ProductState {
  const _$ProductStateImpl(
      {this.productsApiStatus = ProductApiStatus.initial,
      final List<ProductEntity> products = const [],
      final List<String> categories = const [],
      this.selectedCategory = '',
      this.isLoadingMore = false,
      this.hasReachedEnd = false,
      this.currentLimit = 10,
      this.pageSize = 10,
      this.searchQuery = '',
      this.errorMessage,
      this.showFavoriteDialog = false,
      this.isFavoriteAdded = false,
      this.productDetailStatus = ProductApiStatus.initial,
      this.selectedProduct})
      : _products = products,
        _categories = categories,
        super._();

  @override
  @JsonKey()
  final ProductApiStatus productsApiStatus;
  final List<ProductEntity> _products;
  @override
  @JsonKey()
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final String selectedCategory;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasReachedEnd;
  @override
  @JsonKey()
  final int currentLimit;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool showFavoriteDialog;
  @override
  @JsonKey()
  final bool isFavoriteAdded;
  @override
  @JsonKey()
  final ProductApiStatus productDetailStatus;
  @override
  final ProductEntity? selectedProduct;

  @override
  String toString() {
    return 'ProductState(productsApiStatus: $productsApiStatus, products: $products, categories: $categories, selectedCategory: $selectedCategory, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, currentLimit: $currentLimit, pageSize: $pageSize, searchQuery: $searchQuery, errorMessage: $errorMessage, showFavoriteDialog: $showFavoriteDialog, isFavoriteAdded: $isFavoriteAdded, productDetailStatus: $productDetailStatus, selectedProduct: $selectedProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.productsApiStatus, productsApiStatus) ||
                other.productsApiStatus == productsApiStatus) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            (identical(other.currentLimit, currentLimit) ||
                other.currentLimit == currentLimit) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.showFavoriteDialog, showFavoriteDialog) ||
                other.showFavoriteDialog == showFavoriteDialog) &&
            (identical(other.isFavoriteAdded, isFavoriteAdded) ||
                other.isFavoriteAdded == isFavoriteAdded) &&
            (identical(other.productDetailStatus, productDetailStatus) ||
                other.productDetailStatus == productDetailStatus) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productsApiStatus,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_categories),
      selectedCategory,
      isLoadingMore,
      hasReachedEnd,
      currentLimit,
      pageSize,
      searchQuery,
      errorMessage,
      showFavoriteDialog,
      isFavoriteAdded,
      productDetailStatus,
      selectedProduct);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState(
      {final ProductApiStatus productsApiStatus,
      final List<ProductEntity> products,
      final List<String> categories,
      final String selectedCategory,
      final bool isLoadingMore,
      final bool hasReachedEnd,
      final int currentLimit,
      final int pageSize,
      final String searchQuery,
      final String? errorMessage,
      final bool showFavoriteDialog,
      final bool isFavoriteAdded,
      final ProductApiStatus productDetailStatus,
      final ProductEntity? selectedProduct}) = _$ProductStateImpl;
  const _ProductState._() : super._();

  @override
  ProductApiStatus get productsApiStatus;
  @override
  List<ProductEntity> get products;
  @override
  List<String> get categories;
  @override
  String get selectedCategory;
  @override
  bool get isLoadingMore;
  @override
  bool get hasReachedEnd;
  @override
  int get currentLimit;
  @override
  int get pageSize;
  @override
  String get searchQuery;
  @override
  String? get errorMessage;
  @override
  bool get showFavoriteDialog;
  @override
  bool get isFavoriteAdded;
  @override
  ProductApiStatus get productDetailStatus;
  @override
  ProductEntity? get selectedProduct;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
