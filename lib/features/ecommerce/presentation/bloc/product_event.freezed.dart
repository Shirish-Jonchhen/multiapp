// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProductsEventImplCopyWith<$Res> {
  factory _$$LoadProductsEventImplCopyWith(_$LoadProductsEventImpl value,
          $Res Function(_$LoadProductsEventImpl) then) =
      __$$LoadProductsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProductsEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductsEventImpl>
    implements _$$LoadProductsEventImplCopyWith<$Res> {
  __$$LoadProductsEventImplCopyWithImpl(_$LoadProductsEventImpl _value,
      $Res Function(_$LoadProductsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadProductsEventImpl implements LoadProductsEvent {
  const _$LoadProductsEventImpl();

  @override
  String toString() {
    return 'ProductEvent.loadProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProductsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return loadProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return loadProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class LoadProductsEvent implements ProductEvent {
  const factory LoadProductsEvent() = _$LoadProductsEventImpl;
}

/// @nodoc
abstract class _$$LoadMoreProductsEventImplCopyWith<$Res> {
  factory _$$LoadMoreProductsEventImplCopyWith(
          _$LoadMoreProductsEventImpl value,
          $Res Function(_$LoadMoreProductsEventImpl) then) =
      __$$LoadMoreProductsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreProductsEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadMoreProductsEventImpl>
    implements _$$LoadMoreProductsEventImplCopyWith<$Res> {
  __$$LoadMoreProductsEventImplCopyWithImpl(_$LoadMoreProductsEventImpl _value,
      $Res Function(_$LoadMoreProductsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreProductsEventImpl implements LoadMoreProductsEvent {
  const _$LoadMoreProductsEventImpl();

  @override
  String toString() {
    return 'ProductEvent.loadMoreProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreProductsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return loadMoreProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return loadMoreProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return loadMoreProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return loadMoreProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts(this);
    }
    return orElse();
  }
}

abstract class LoadMoreProductsEvent implements ProductEvent {
  const factory LoadMoreProductsEvent() = _$LoadMoreProductsEventImpl;
}

/// @nodoc
abstract class _$$FilterByCategoryEventImplCopyWith<$Res> {
  factory _$$FilterByCategoryEventImplCopyWith(
          _$FilterByCategoryEventImpl value,
          $Res Function(_$FilterByCategoryEventImpl) then) =
      __$$FilterByCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$FilterByCategoryEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$FilterByCategoryEventImpl>
    implements _$$FilterByCategoryEventImplCopyWith<$Res> {
  __$$FilterByCategoryEventImplCopyWithImpl(_$FilterByCategoryEventImpl _value,
      $Res Function(_$FilterByCategoryEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$FilterByCategoryEventImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterByCategoryEventImpl implements FilterByCategoryEvent {
  const _$FilterByCategoryEventImpl(this.category);

  @override
  final String category;

  @override
  String toString() {
    return 'ProductEvent.filterByCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryEventImplCopyWith<_$FilterByCategoryEventImpl>
      get copyWith => __$$FilterByCategoryEventImplCopyWithImpl<
          _$FilterByCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return filterByCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return filterByCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return filterByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return filterByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class FilterByCategoryEvent implements ProductEvent {
  const factory FilterByCategoryEvent(final String category) =
      _$FilterByCategoryEventImpl;

  String get category;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByCategoryEventImplCopyWith<_$FilterByCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchProductsEventImplCopyWith<$Res> {
  factory _$$SearchProductsEventImplCopyWith(_$SearchProductsEventImpl value,
          $Res Function(_$SearchProductsEventImpl) then) =
      __$$SearchProductsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchProductsEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$SearchProductsEventImpl>
    implements _$$SearchProductsEventImplCopyWith<$Res> {
  __$$SearchProductsEventImplCopyWithImpl(_$SearchProductsEventImpl _value,
      $Res Function(_$SearchProductsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchProductsEventImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchProductsEventImpl implements SearchProductsEvent {
  const _$SearchProductsEventImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ProductEvent.searchProducts(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductsEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductsEventImplCopyWith<_$SearchProductsEventImpl> get copyWith =>
      __$$SearchProductsEventImplCopyWithImpl<_$SearchProductsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return searchProducts(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return searchProducts?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return searchProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return searchProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(this);
    }
    return orElse();
  }
}

abstract class SearchProductsEvent implements ProductEvent {
  const factory SearchProductsEvent(final String query) =
      _$SearchProductsEventImpl;

  String get query;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchProductsEventImplCopyWith<_$SearchProductsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFavoriteEventImplCopyWith<$Res> {
  factory _$$ToggleFavoriteEventImplCopyWith(_$ToggleFavoriteEventImpl value,
          $Res Function(_$ToggleFavoriteEventImpl) then) =
      __$$ToggleFavoriteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, bool currentlyFavorite});
}

/// @nodoc
class __$$ToggleFavoriteEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$ToggleFavoriteEventImpl>
    implements _$$ToggleFavoriteEventImplCopyWith<$Res> {
  __$$ToggleFavoriteEventImplCopyWithImpl(_$ToggleFavoriteEventImpl _value,
      $Res Function(_$ToggleFavoriteEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? currentlyFavorite = null,
  }) {
    return _then(_$ToggleFavoriteEventImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      null == currentlyFavorite
          ? _value.currentlyFavorite
          : currentlyFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleFavoriteEventImpl implements ToggleFavoriteEvent {
  const _$ToggleFavoriteEventImpl(this.productId, this.currentlyFavorite);

  @override
  final int productId;
  @override
  final bool currentlyFavorite;

  @override
  String toString() {
    return 'ProductEvent.toggleFavorite(productId: $productId, currentlyFavorite: $currentlyFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFavoriteEventImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.currentlyFavorite, currentlyFavorite) ||
                other.currentlyFavorite == currentlyFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, currentlyFavorite);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFavoriteEventImplCopyWith<_$ToggleFavoriteEventImpl> get copyWith =>
      __$$ToggleFavoriteEventImplCopyWithImpl<_$ToggleFavoriteEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return toggleFavorite(productId, currentlyFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return toggleFavorite?.call(productId, currentlyFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(productId, currentlyFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return toggleFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return toggleFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(this);
    }
    return orElse();
  }
}

abstract class ToggleFavoriteEvent implements ProductEvent {
  const factory ToggleFavoriteEvent(
          final int productId, final bool currentlyFavorite) =
      _$ToggleFavoriteEventImpl;

  int get productId;
  bool get currentlyFavorite;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFavoriteEventImplCopyWith<_$ToggleFavoriteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProductDetailEventImplCopyWith<$Res> {
  factory _$$LoadProductDetailEventImplCopyWith(
          _$LoadProductDetailEventImpl value,
          $Res Function(_$LoadProductDetailEventImpl) then) =
      __$$LoadProductDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, bool showLoading});
}

/// @nodoc
class __$$LoadProductDetailEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductDetailEventImpl>
    implements _$$LoadProductDetailEventImplCopyWith<$Res> {
  __$$LoadProductDetailEventImplCopyWithImpl(
      _$LoadProductDetailEventImpl _value,
      $Res Function(_$LoadProductDetailEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? showLoading = null,
  }) {
    return _then(_$LoadProductDetailEventImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadProductDetailEventImpl implements LoadProductDetailEvent {
  const _$LoadProductDetailEventImpl(this.productId, this.showLoading);

  @override
  final int productId;
  @override
  final bool showLoading;

  @override
  String toString() {
    return 'ProductEvent.loadProductDetail(productId: $productId, showLoading: $showLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductDetailEventImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, showLoading);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductDetailEventImplCopyWith<_$LoadProductDetailEventImpl>
      get copyWith => __$$LoadProductDetailEventImplCopyWithImpl<
          _$LoadProductDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return loadProductDetail(productId, showLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return loadProductDetail?.call(productId, showLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(productId, showLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return loadProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return loadProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(this);
    }
    return orElse();
  }
}

abstract class LoadProductDetailEvent implements ProductEvent {
  const factory LoadProductDetailEvent(
          final int productId, final bool showLoading) =
      _$LoadProductDetailEventImpl;

  int get productId;
  bool get showLoading;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProductDetailEventImplCopyWith<_$LoadProductDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DismissProductDialogEventImplCopyWith<$Res> {
  factory _$$DismissProductDialogEventImplCopyWith(
          _$DismissProductDialogEventImpl value,
          $Res Function(_$DismissProductDialogEventImpl) then) =
      __$$DismissProductDialogEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DismissProductDialogEventImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$DismissProductDialogEventImpl>
    implements _$$DismissProductDialogEventImplCopyWith<$Res> {
  __$$DismissProductDialogEventImplCopyWithImpl(
      _$DismissProductDialogEventImpl _value,
      $Res Function(_$DismissProductDialogEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DismissProductDialogEventImpl implements DismissProductDialogEvent {
  const _$DismissProductDialogEventImpl();

  @override
  String toString() {
    return 'ProductEvent.dismissDialog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DismissProductDialogEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String query) searchProducts,
    required TResult Function(int productId, bool currentlyFavorite)
        toggleFavorite,
    required TResult Function(int productId, bool showLoading)
        loadProductDetail,
    required TResult Function() dismissDialog,
  }) {
    return dismissDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String query)? searchProducts,
    TResult? Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult? Function(int productId, bool showLoading)? loadProductDetail,
    TResult? Function()? dismissDialog,
  }) {
    return dismissDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String category)? filterByCategory,
    TResult Function(String query)? searchProducts,
    TResult Function(int productId, bool currentlyFavorite)? toggleFavorite,
    TResult Function(int productId, bool showLoading)? loadProductDetail,
    TResult Function()? dismissDialog,
    required TResult orElse(),
  }) {
    if (dismissDialog != null) {
      return dismissDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductsEvent value) loadProducts,
    required TResult Function(LoadMoreProductsEvent value) loadMoreProducts,
    required TResult Function(FilterByCategoryEvent value) filterByCategory,
    required TResult Function(SearchProductsEvent value) searchProducts,
    required TResult Function(ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(LoadProductDetailEvent value) loadProductDetail,
    required TResult Function(DismissProductDialogEvent value) dismissDialog,
  }) {
    return dismissDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductsEvent value)? loadProducts,
    TResult? Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult? Function(FilterByCategoryEvent value)? filterByCategory,
    TResult? Function(SearchProductsEvent value)? searchProducts,
    TResult? Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult? Function(DismissProductDialogEvent value)? dismissDialog,
  }) {
    return dismissDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductsEvent value)? loadProducts,
    TResult Function(LoadMoreProductsEvent value)? loadMoreProducts,
    TResult Function(FilterByCategoryEvent value)? filterByCategory,
    TResult Function(SearchProductsEvent value)? searchProducts,
    TResult Function(ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(LoadProductDetailEvent value)? loadProductDetail,
    TResult Function(DismissProductDialogEvent value)? dismissDialog,
    required TResult orElse(),
  }) {
    if (dismissDialog != null) {
      return dismissDialog(this);
    }
    return orElse();
  }
}

abstract class DismissProductDialogEvent implements ProductEvent {
  const factory DismissProductDialogEvent() = _$DismissProductDialogEventImpl;
}
