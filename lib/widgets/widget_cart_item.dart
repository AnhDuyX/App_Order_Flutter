// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:app_order/components/widget_custom_stepper.dart';
import 'package:app_order/models/cart_product.dart';
import 'package:app_order/models/product.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
    required this.model,
    this.onQtyUpdate,
    this.onItemRemove,
  }) : super(key: key);

  final CartProduct model;
  final Function? onQtyUpdate;
  final Function? onItemRemove;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: cartItemUI(context),
      ),
    );
  }

  Widget cartItemUI(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
              child: Container(
                color: Colors.white,
                width: 100,
                alignment: Alignment.center,
                child: Image.network(
                  widget.model.product.productImage != ""
                      ? widget.model.product.fullImagePath
                      : "",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.product.productName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Giá: ${widget.model.product.productPrice.toString()}${Config.currency}",
                          style: TextStyle(
                            fontSize: 13,
                            color: widget.model.product.productSalePrice <
                                    widget.model.product.productPrice
                                ? Colors.red
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: widget.model.product.productSalePrice <
                                    widget.model.product.productPrice
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        Text(
                          (widget.model.product.productSalePrice <
                                  widget.model.product.productPrice)
                              ? "Giá còn: ${widget.model.product.productSalePrice.toString()}${Config.currency}"
                              : "",
                          textAlign: TextAlign.left,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 24, 136, 28),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Số lượng: " + widget.model.qty.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 5.0, right: 5.0),
                          child: TextButton.icon(
                            onPressed: () {
                              widget.onItemRemove!(widget.model);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color.fromARGB(255, 245, 29, 13)),
                            ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Xóa",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // child: GestureDetector(
                          //   child: const Icon(
                          //     Icons.save_sharp,
                          //     color: Colors.red,
                          //   ),
                          //   onTap: () {
                          //     onItemRemove!(model);
                          //   },
                          // ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
