import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoply/core/config/supabase_config.dart';
import 'package:shoply/features/product/domain/models/product.dart';

part 'product_repository.g.dart';

class ProductRepository {
  Future<List<Product>> getProducts({
    int? limit,
    int? offset,
    String? category,
    String? searchQuery,
  }) async {
    final query = SupabaseConfig.client.from('products').select().order('created_at', ascending: false);

    if (limit != null) {
      query.limit(limit);
    }

    if (offset != null) {
      query.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await query;
    return response.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getFlashDeals() async {
    final now = DateTime.now().toUtc().toIso8601String();
    final response = await SupabaseConfig.client
        .from('products')
        .select()
        .not('discountPrice', 'is', null)
        .gte('discountEndsAt', now)
        .order('discountEndsAt', ascending: true);

    return response.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<ProductCategory>> getCategories() async {
    final response = await SupabaseConfig.client.from('categories').select();
    return response.map((json) => ProductCategory.fromJson(json)).toList();
  }

  Future<Product> getProductById(String id) async {
    final response = await SupabaseConfig.client.from('products').select().eq('id', id).single();

    try {
      return Product.fromJson(response);
    } catch (e) {
      throw Exception('Failed to parse product data: ${e.toString()}');
    }
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository();
}

@riverpod
Future<List<Product>> products(
  ProductsRef ref, {
  int? limit,
  int? offset,
  String? category,
  String? searchQuery,
}) {
  return ref.watch(productRepositoryProvider).getProducts(
        limit: limit,
        offset: offset,
        category: category,
        searchQuery: searchQuery,
      );
}

@riverpod
Future<List<Product>> flashDeals(FlashDealsRef ref) {
  return ref.watch(productRepositoryProvider).getFlashDeals();
}

@riverpod
Future<List<ProductCategory>> categories(CategoriesRef ref) {
  return ref.watch(productRepositoryProvider).getCategories();
}
