// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartTotalHash() => r'16fd5d0ff0f21d4f01977d2c6312b33668516887';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = AutoDisposeProvider<double>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CartTotalRef = AutoDisposeProviderRef<double>;
String _$cartItemCountHash() => r'aed7dafb987cb2f93f9984b5c5c351f8d70264b0';

/// See also [cartItemCount].
@ProviderFor(cartItemCount)
final cartItemCountProvider = AutoDisposeProvider<int>.internal(
  cartItemCount,
  name: r'cartItemCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CartItemCountRef = AutoDisposeProviderRef<int>;
String _$cartHash() => r'5a214526bd733a015eaca5137493eab1d7ce4bbb';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider = NotifierProvider<Cart, List<CartItem>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = Notifier<List<CartItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
