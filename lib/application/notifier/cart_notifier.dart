// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps, avoid_single_cascade_in_expression_statements

import 'package:app_order/api/api_service.dart';
import 'package:app_order/application/state/cart_state.dart';
import 'package:app_order/models/cart_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<CartSate> {
  final APIService _apiService;

  CartNotifier(this._apiService) : super(const CartSate()) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: true);

    final cartData = await _apiService.getCart();

    state = state.copyWith(cartModel: cartData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItem(productId, qty) async {
    await _apiService.addCartItem(productId, qty);

    await getCartItems();
  }

  Future<void> removeCartItem(productId, qty) async {
    await _apiService.removeCartItem(productId, qty);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updateItems = state.cartModel!;
    // log("data: ${updateItems.products}");
    // log("cần xóa: $isCartItemExist");

  //state.cartModel!.products.remove(isCartItemExist);

  //final newData = 

// lstUsers.removeWhere((item) => index == index);

    state = state.copyWith(cartModel: state.cartModel!);
  }

  Future<void> updateQty(productId, qty, type) async {
    var cartItem = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updateItems = state.cartModel!;

    if (type == '-') {
      await _apiService.removeCartItem(productId, 1);

      if (cartItem.qty > 1) {
        CartProduct cartProduct = CartProduct(
          qty: cartItem.qty - 1,
          product: cartItem.product,
        );

        updateItems.products.remove(cartItem);
        updateItems.products.add(cartProduct);
      } else {
        updateItems.products.remove(cartItem);
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      CartProduct cartProduct =
          CartProduct(qty: cartItem.qty + 1, product: cartItem.product);

      updateItems.products.remove(cartItem);
      updateItems.products.add(cartProduct);
    }

    state = state.copyWith(cartModel: updateItems);
  }
}
