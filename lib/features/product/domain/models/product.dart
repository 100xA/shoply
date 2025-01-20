import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String description,
    required double price,
    required List<String> images,
    required int stockQuantity,
    required List<String> categories,
    double? discountPrice,
    DateTime? discountEndsAt,
    @Default(false) bool isFavorite,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
