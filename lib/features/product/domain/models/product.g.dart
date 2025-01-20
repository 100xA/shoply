// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      stockQuantity: (json['stock_quantity'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      discountPrice: (json['discount_price'] as num?)?.toDouble(),
      discountEndsAt: json['discount_ends_at'] == null
          ? null
          : DateTime.parse(json['discount_ends_at'] as String),
      isFavorite: json['is_favorite'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'stock_quantity': instance.stockQuantity,
      'categories': instance.categories,
      if (instance.discountPrice case final value?) 'discount_price': value,
      if (instance.discountEndsAt?.toIso8601String() case final value?)
        'discount_ends_at': value,
      'is_favorite': instance.isFavorite,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
    };

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ProductCategoryImplToJson(
        _$ProductCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.imageUrl case final value?) 'image_url': value,
    };
