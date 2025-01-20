import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoply/features/product/data/repositories/hive_product_repository.dart';
import 'package:shoply/features/product/domain/models/product.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> products(
  Ref ref, {
  int? limit,
  int? offset,
  String? category,
  String? searchQuery,
}) async {
  final repository = ref.watch(hiveProductRepositoryProvider);
  final products = await repository.getProducts(
    limit: limit,
    offset: offset,
    category: category,
    searchQuery: searchQuery,
  );
  return products;
}
