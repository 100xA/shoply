import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final List<String> images;

  @HiveField(5)
  final int stockQuantity;

  @HiveField(6)
  final List<String> categories;

  @HiveField(7)
  final double? discountPrice;

  @HiveField(8)
  final DateTime? discountEndsAt;

  @HiveField(9)
  bool isFavorite;

  @HiveField(10)
  final double rating;

  @HiveField(11)
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.stockQuantity,
    required this.categories,
    this.discountPrice,
    this.discountEndsAt,
    this.isFavorite = false,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images: List<String>.from(json['images'] as List),
      stockQuantity: json['stock_quantity'] as int,
      categories: List<String>.from(json['categories'] as List),
      discountPrice: json['discount_price'] != null ? (json['discount_price'] as num).toDouble() : null,
      discountEndsAt: json['discount_ends_at'] != null ? DateTime.parse(json['discount_ends_at'] as String) : null,
      isFavorite: json['is_favorite'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] as int? ?? 0,
    );
  }

  bool get isOnSale => discountPrice != null && discountEndsAt != null && discountEndsAt!.isAfter(DateTime.now());
}

@HiveType(typeId: 1)
class ProductCategory extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? description;

  ProductCategory({
    required this.id,
    required this.name,
    this.description,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }
}
