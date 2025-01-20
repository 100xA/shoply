// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'product_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'1143e6a957468f07814b030b8e53d8ea1ddb037b';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productsHash() => r'c011ec5066cd6932f00b748b341d21af70880a70';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [products].
@ProviderFor(products)
const productsProvider = ProductsFamily();

/// See also [products].
class ProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [products].
  const ProductsFamily();

  /// See also [products].
  ProductsProvider call({
    int? limit,
    int? offset,
    String? category,
    String? searchQuery,
  }) {
    return ProductsProvider(
      limit: limit,
      offset: offset,
      category: category,
      searchQuery: searchQuery,
    );
  }

  @override
  ProductsProvider getProviderOverride(
    covariant ProductsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
      category: provider.category,
      searchQuery: provider.searchQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productsProvider';
}

/// See also [products].
class ProductsProvider extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [products].
  ProductsProvider({
    int? limit,
    int? offset,
    String? category,
    String? searchQuery,
  }) : this._internal(
          (ref) => products(
            ref as ProductsRef,
            limit: limit,
            offset: offset,
            category: category,
            searchQuery: searchQuery,
          ),
          from: productsProvider,
          name: r'productsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsHash,
          dependencies: ProductsFamily._dependencies,
          allTransitiveDependencies: ProductsFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
          category: category,
          searchQuery: searchQuery,
        );

  ProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
    required this.category,
    required this.searchQuery,
  }) : super.internal();

  final int? limit;
  final int? offset;
  final String? category;
  final String? searchQuery;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(ProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsProvider._internal(
        (ref) => create(ref as ProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
        category: category,
        searchQuery: searchQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _ProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsProvider &&
        other.limit == limit &&
        other.offset == offset &&
        other.category == category &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `offset` of this provider.
  int? get offset;

  /// The parameter `category` of this provider.
  String? get category;

  /// The parameter `searchQuery` of this provider.
  String? get searchQuery;
}

class _ProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>> with ProductsRef {
  _ProductsProviderElement(super.provider);

  @override
  int? get limit => (origin as ProductsProvider).limit;
  @override
  int? get offset => (origin as ProductsProvider).offset;
  @override
  String? get category => (origin as ProductsProvider).category;
  @override
  String? get searchQuery => (origin as ProductsProvider).searchQuery;
}

String _$flashDealsHash() => r'e3451db57d8f1be3bedc487cb4768f65898c62a2';

/// See also [flashDeals].
@ProviderFor(flashDeals)
final flashDealsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  flashDeals,
  name: r'flashDealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$flashDealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlashDealsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$categoriesHash() => r'24a1b19acf4c493f5566ad0d6343e7ee5da73f92';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider =
    AutoDisposeFutureProvider<List<ProductCategory>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<List<ProductCategory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
