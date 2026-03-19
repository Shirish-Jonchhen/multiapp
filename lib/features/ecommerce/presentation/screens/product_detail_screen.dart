import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductBloc>()
        .add(ProductEvent.loadProductDetail(widget.productId, true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        actions: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              final product = state.selectedProduct;
              if (product == null) return const SizedBox.shrink();
              return IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : null,
                ),
                onPressed: () => context.read<ProductBloc>().add(
                    ProductEvent.toggleFavorite(
                        product.id, product.isFavorite)),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.showFavoriteDialog) {
            context
                .read<ProductBloc>()
                .add(ProductEvent.loadProductDetail(widget.productId, false));

            //   AppDialog.showInfo(
            //     context,
            //     title: 'Favorites',
            //     message: state.isFavoriteAdded
            //         ? 'Added to favorites'
            //         : 'Removed from favorites',
            //   );
            //   context.read<ProductBloc>().add(const ProductEvent.dismissDialog());
          }
        },
        builder: (context, state) {
          if (state.productDetailStatus == ProductApiStatus.loading) {
            return const LoadingSpinner();
          }
          if (state.productDetailStatus == ProductApiStatus.failure) {
            return AppErrorWidget(
              message: state.errorMessage ?? 'Failed to load product',
              onRetry: () => context
                  .read<ProductBloc>()
                  .add(ProductEvent.loadProductDetail(widget.productId, true)),
            );
          }
          final product = state.selectedProduct;
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.contain,
                    placeholder: (_, __) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (_, __, ___) =>
                        const Icon(Icons.image_not_supported, size: 64),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Chip(
                        label: Text(product.category),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                      const SizedBox(height: 8),
                      // Title
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      // Rating
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              index < product.ratingRate.round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${product.ratingRate} (${product.ratingCount} reviews)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Description
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
