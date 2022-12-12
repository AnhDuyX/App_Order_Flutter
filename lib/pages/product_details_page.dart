// ignore_for_file: unused_local_variable, unnecessary_nullable_for_final_variable_declarations, must_call_super, sort_child_properties_last, prefer_const_constructors, library_private_types_in_public_api, unused_element

import 'package:app_order/components/widget_col_exp.dart';
import 'package:app_order/components/widget_custom_stepper.dart';
import 'package:app_order/config.dart';
import 'package:app_order/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../wedgets/widget_related_products.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  String productId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: _productDetails(ref),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      productId = arguments["productId"];
    }

    super.didChangeDependencies();
  }

  Widget _productDetails(WidgetRef ref) {
    final details = ref.watch(ProductDetailsProvider(productId));

    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_productDetailsUI(model!),
            RelatedProducts(model.relatedProducts!)],
          );
        },
        error: (_, __) => const Center(
              child: Text("ERR"),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _productDetailsUI(Product model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.network(
              model.fullImagePath,
              fit: BoxFit.fitHeight,
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            model.productName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    (model.calculateDiscount > 0)
                        ? "${model.productPrice.toInt().toString()}${Config.currency}"
                        : "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: model.calculateDiscount > 0
                          ? Colors.red
                          : Colors.black,
                      decoration: model.productSalePrice > 0
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Text(
                    (model.calculateDiscount > 0)
                        ? "${model.productSalePrice.toInt().toString()}${Config.currency}"
                        : "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Text(
                  "SHARE",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                label: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          Text(
            (model.productStatus == "IN")
                ? "Trạng thái hàng: Còn"
                : "Trạng thái hàng: Hết",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Mã sản phẩm: ${model.productSKU}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomStepper(
                lowerLimit: 0,
                upperLimit: 20,
                stepValue: 1,
                iconSize: 22.0,
                value: 1,
                onChanged: (value) {},
              ),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                icon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                label: const Text(
                  "Thêm vào giỏ hàng",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ColExpand(
            title: "Thông tin sản phẩm",
            content: model.productShortDescription,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
