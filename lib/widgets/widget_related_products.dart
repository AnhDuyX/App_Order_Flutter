// ignore_for_file: prefer_const_constructors, unused_element, sort_child_properties_last, avoid_unnecessary_containers

import 'package:app_order/components/product_card.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:app_order/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

class RelatedProducts extends ConsumerWidget {
  const RelatedProducts(this.relatedProducts, {Key? key}) : super(key: key);
  final List<String> relatedProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            "Sản phẩm liên quan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            child: _productList(ref),
            visible: relatedProducts.isNotEmpty,
          )
        ],
      ),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      ralatedProductsProvider(
        ProductFilterModel(
            paginationModel: PaginationModel(page: 1, pageSize: 10),
            productIds: relatedProducts),
      ),
    );

    return products.when(
        data: (list) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildProductList(list!)],
          );
        },
        error: (_, __) => const Center(
              child: Text("ERR"),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            var data = products[index];
            return GestureDetector(
              onTap: () {},
              child: ProductCard(model: data),
            );
          }),
    );
  }
}
