import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:multiapp/core/router/app_router.gr.dart';
import 'package:multiapp/core/widgets/app_dialog.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

@RoutePage()
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final _scrollController = ScrollController();
  Timer? _debounce;
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<ProductBloc>().add(const ProductEvent.loadMoreProducts());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<ProductBloc>().add(ProductEvent.searchProducts(query));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                onChanged: _onSearchChanged,
              )
            : const Text('Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  context
                      .read<ProductBloc>()
                      .add(const ProductEvent.searchProducts(''));
                }
              });
            },
          ),
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.showFavoriteDialog) {
            AppDialog.showInfo(
              context,
              title: 'Favorites',
              message: state.isFavoriteAdded
                  ? 'Added to favorites'
                  : 'Removed from favorites',
            );
            context.read<ProductBloc>().add(const ProductEvent.dismissDialog());
          }
        },
        builder: (context, state) {
          if (state.productsApiStatus == ProductApiStatus.loading) {
            return const LoadingWidget();
          }
          if (state.productsApiStatus == ProductApiStatus.failure) {
            return AppErrorWidget(
              message: state.errorMessage ?? 'Failed to load products',
              onRetry: () => context
                  .read<ProductBloc>()
                  .add(const ProductEvent.loadProducts()),
            );
          }

          final products = state.filteredProducts;

          return Column(
            children: [
              // Category filter chips
              if (state.categories.isNotEmpty)
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(
                          label: const Text('All'),
                          selected: state.selectedCategory.isEmpty,
                          onSelected: (_) => context
                              .read<ProductBloc>()
                              .add(const ProductEvent.filterByCategory('')),
                        ),
                      ),
                      ...state.categories.map((cat) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FilterChip(
                              label: Text(cat),
                              selected: state.selectedCategory == cat,
                              onSelected: (_) => context
                                  .read<ProductBloc>()
                                  .add(ProductEvent.filterByCategory(cat)),
                            ),
                          )),
                    ],
                  ),
                ),
              // Products list
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: products.length + (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == products.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final product = products[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: SizedBox(
                          width: 56,
                          height: 56,
                          child: CachedNetworkImage(
                            imageUrl: product.image,
                            fit: BoxFit.contain,
                            placeholder: (_, __) => const Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2)),
                            errorWidget: (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        ),
                        title: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${product.ratingRate} ★ (${product.ratingCount})',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () => context.read<ProductBloc>().add(
                              ProductEvent.toggleFavorite(
                                  product.id, product.isFavorite)),
                        ),
                        onTap: () => context.router
                            .push(ProductDetailRoute(productId: product.id)),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
