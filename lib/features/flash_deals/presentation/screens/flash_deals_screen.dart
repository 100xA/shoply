import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoply/features/cart/domain/providers/cart_provider.dart';
import 'package:shoply/features/product/data/repositories/product_repository.dart';
import 'package:shoply/features/product/domain/models/product.dart';

class FlashDealsScreen extends ConsumerWidget {
  const FlashDealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final flashDealsStream = ref.watch(watchFlashDealsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Deals'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // TODO: Navigate to cart
                },
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Consumer(
                  builder: (context, ref, _) {
                    final itemCount = ref.watch(cartItemCountProvider);
                    if (itemCount == 0) return const SizedBox.shrink();

                    return Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        '$itemCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(),
    );
  }
}

class _FlashDealCard extends ConsumerWidget {
  const _FlashDealCard({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final discountPercentage =
        product.discountPrice != null ? ((product.price - product.discountPrice!) / product.price * 100).round() : 0;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              if (discountPercentage > 0)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '-$discountPercentage%',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onError,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (product.discountPrice != null) ...[
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    '\$${product.discountPrice!.toStringAsFixed(2)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ] else
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).addItem(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
