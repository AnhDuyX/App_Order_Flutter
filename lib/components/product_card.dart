// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, duplicate_ignore

import 'package:app_order/config.dart';
import 'package:app_order/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product? model;
  const ProductCard({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: model!.calculateDiscount > 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text(
                        "${model!.calculateDiscount}% OFF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    // ignore: sort_child_properties_last
                    child: Image.network(
                      model!.fullImagePath,
                      fit: BoxFit.cover,
                    ),
                    height: 85,
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("/product-details",
                        arguments: {'productId': model!.productId});
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      model!.productName,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${model!.productPrice.toInt().toString()}${Config.currency}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: model!.calculateDiscount > 0
                                      ? Colors.red
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: model!.productSalePrice > 0
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              Text(
                                (model!.calculateDiscount > 0)
                                    ? "${model!.productSalePrice.toInt().toString()}${Config.currency}"
                                    : "",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 25,
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
