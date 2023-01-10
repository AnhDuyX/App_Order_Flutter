// ignore_for_file: prefer_const_constructors

import 'package:app_order/components/product_card.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:app_order/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 15),
              child: Text(
                "Top 10 món ngon",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: _productList(ref),
        )
      ]),
    );
  }

  Widget _productList(WidgetRef ref) {
      final products = ref.watch(
        homeProductProvider(
          ProductFilterModel(
            paginationModel: PaginationModel(page: 1, pageSize: 10),
          ),
        ),
      );

      return products.when(
        data: (list) {
          return _buildProductList(list!);
        },
        error: (_, __) => Center(
          child: const Text("Error"),
        ),
        loading: () => CircularProgressIndicator(),
      );
    }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.bottomCenter,
      
      child: ListView.builder(
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
