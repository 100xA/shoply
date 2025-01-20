import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoply/features/product/domain/models/product.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    @Default(1) int quantity,
  }) = _CartItem;

  const CartItem._();

  double get total => (product.discountPrice ?? product.price) * quantity;
}

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  List<CartItem> build() => [];

  void addItem(Product product) {
    final existingIndex = state.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      state = [
        ...state.sublist(0, existingIndex),
        CartItem(
          product: product,
          quantity: state[existingIndex].quantity + 1,
        ),
        ...state.sublist(existingIndex + 1),
      ];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeItem(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity < 1) {
      removeItem(productId);
      return;
    }

    state = state.map((item) {
      if (item.product.id == productId) {
        return CartItem(
          product: item.product,
          quantity: quantity,
        );
      }
      return item;
    }).toList();
  }

  void clear() {
    state = [];
  }

  double get total => state.fold(
        0,
        (sum, item) => sum + item.total,
      );

  int get itemCount => state.fold(
        0,
        (sum, item) => sum + item.quantity,
      );
}

@riverpod
double cartTotal(Ref ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );
}

@riverpod
int cartItemCount(Ref ref) {
  return ref.watch(cartProvider).length;
}
