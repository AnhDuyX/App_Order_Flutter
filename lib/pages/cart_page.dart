// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, sort_child_properties_last, camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:app_order/api/api_service.dart';
import 'package:app_order/config.dart';
import 'package:app_order/models/cart.dart';
import 'package:app_order/models/cart_product.dart';
import 'package:app_order/providers.dart';
import 'package:app_order/widgets/widget_appbar.dart';
import 'package:app_order/widgets/widget_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'order_page.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _checkoutBottomNavbar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: AppBarWidget(),
              ),
              Flexible(
                child: _cartList(ref),
                flex: 1,
              )
            ],
          ),
        ));
  }

  Widget _buildCartItems(List<CartProduct> cartProducts, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        return CartItemWidget(
          model: cartProducts[index],
          onQtyUpdate: (CartProduct model, qty, type) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);

            cartViewModel.updateQty(model.product.productId, qty, type);
          },
          onItemRemove: (CartProduct model) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);

            cartViewModel.removeCartItem(model.product.productId, model.qty);
          },
        );
      },
    );
  }

  Widget _cartList(WidgetRef ref) {
    final cartSate = ref.watch(cartItemsProvider);

    if (cartSate.cartModel == null) {
      return const LinearProgressIndicator();
    }

    if (cartSate.cartModel!.products.isEmpty) {
      return const Center(
        child: Text("Cart Empty!"),
      );
    }

    return _buildCartItems(cartSate.cartModel!.products, ref);
  }
}

class _checkoutBottomNavbar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);

    if (cartProvider.cartModel != null) {
      return cartProvider.cartModel!.products.isNotEmpty
          ? Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tổng tiền: ${Config.currency}${cartProvider.cartModel!.grandTotal.toString()}",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Bạn đã đặt hàng thành công",
                            "OK",
                            () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/home", (route) => false);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/home", (route) => false);
                            },
                          );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          
                          label: const Text(
                            "Đặt hàng",
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.shopping_basket,
                            color: Colors.green,
                          ),
                        ),
                        // const Text(
                        //   "Proceed to Checkout",
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox();
    }
    return const SizedBox();
  }
}
