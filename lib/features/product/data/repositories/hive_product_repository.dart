import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoply/features/product/domain/models/product.dart';

part 'hive_product_repository.g.dart';

class HiveProductRepository {
  static const String _productsBox = 'products';
  static const String _categoriesBox = 'categories';

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(ProductCategoryAdapter());
    await Hive.openBox<Product>(_productsBox);
    await Hive.openBox<ProductCategory>(_categoriesBox);
    
    // Add sample data if the box is empty
    final productsBox = Hive.box<Product>(_productsBox);
    if (productsBox.isEmpty) {
      await _addSampleData();
    }
  }

  Future<void> _addSampleData() async {
    final products = [
      Product(
        id: '1',
        name: 'Nike Air Max',
        description: 'Comfortable running shoes with air cushioning',
        price: 129.99,
        images: [
          'https://example.com/nike-air-max.jpg',
        ],
        stockQuantity: 50,
        categories: ['Shoes', 'Sports'],
        discountPrice: 99.99,
        discountEndsAt: DateTime.now().add(const Duration(days: 7)),
      ),
      Product(
        id: '2',
        name: 'Leather Jacket',
        description: 'Classic black leather jacket',
        price: 199.99,
        images: [
          'https://example.com/leather-jacket.jpg',
        ],
        stockQuantity: 30,
        categories: ['Clothing', 'Fashion'],
      ),
      // Add more sample products as needed
    ];

    final categories = [
      ProductCategory(
        id: '1',
        name: 'Shoes',
        description: 'Footwear for all occasions',
      ),
      ProductCategory(
        id: '2',
        name: 'Clothing',
        description: 'Fashion apparel',
      ),
      ProductCategory(
        id: '3',
        name: 'Electronics',
        description: 'Latest gadgets and devices',
      ),
    ];

    final productsBox = Hive.box<Product>(_productsBox);
    final categoriesBox = Hive.box<ProductCategory>(_categoriesBox);

    for (final product in products) {
      await productsBox.put(product.id, product);
    }

    for (final category in categories) {
      await categoriesBox.put(category.id, category);
    }
  }

  Future<List<Product>> getProducts({
    int? limit,
    int? offset,
    String? category,
    String? searchQuery,
  }) async {
    final box = Hive.box<Product>(_productsBox);
    var products = box.values.toList();

    if (category != null) {
      products = products.where((p) => p.categories.contains(category)).toList();
    }

    if (searchQuery != null) {
      final query = searchQuery.toLowerCase();
      products = products.where((p) =>
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query)).toList();
    }

    if (offset != null) {
      products = products.skip(offset).toList();
    }

    if (limit != null) {
      products = products.take(limit).toList();
    }

    return products;
  }

  Future<List<Product>> getFlashDeals() async {
    final box = Hive.box<Product>(_productsBox);
    final now = DateTime.now();
    return box.values.where((p) => 
      p.discountPrice != null && 
      p.discountEndsAt != null && 
      p.discountEndsAt!.isAfter(now)
    ).toList();
  }

  Stream<List<Product>> watchFlashDeals() async* {
    final box = Hive.box<Product>(_productsBox);
    yield* box.watch().map((_) {
      final now = DateTime.now();
      return box.values.where((p) => 
        p.discountPrice != null && 
        p.discountEndsAt != null && 
        p.discountEndsAt!.isAfter(now)
      ).toList();
    });
  }

  Future<List<ProductCategory>> getCategories() async {
    final box = Hive.box<ProductCategory>(_categoriesBox);
    return box.values.toList();
  }

  Future<Product?> getProductById(String id) async {
    final box = Hive.box<Product>(_productsBox);
    return box.get(id);
  }

  Future<void> toggleFavorite(String productId) async {
    final box = Hive.box<Product>(_productsBox);
    final product = box.get(productId);
    if (product != null) {
      product.isFavorite = !product.isFavorite;
      await box.put(productId, product);
    }
  }
}

@riverpod
HiveProductRepository hiveProductRepository(HiveProductRepositoryRef ref) {
  return HiveProductRepository();
}
