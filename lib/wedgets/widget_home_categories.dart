// ignore_for_file: unused_element, prefer_const_constructors, unnecessary_const, avoid_unnecessary_containers

import 'package:app_order/models/category.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class HomeCategoriesWidget extends ConsumerWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 15),
                child: Text(
                  "Danh mục",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: _categoriesList(ref),
          )
        ],
      ),
    );
  }

  Widget _categoriesList(WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        PaginationModel(page: 1, pageSize: 10),
      ),
    );

    return categories.when(
      data: (list) {
        return _buildCategoryList(list!, ref);
      },
      error: (_, __) => const Center(
        child: Text("ERR"),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCategoryList(List<Category> categories, WidgetRef ref) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              ProductFilterModel filterModel = ProductFilterModel(
                  paginationModel: PaginationModel(page: 1, pageSize: 10),
                  CategoryId: data.CategoryId);

               ref
                   .read(productsFilterProvider.notifier)
                   .setProductFilter(filterModel);
               ref.read(productNotifierProvider.notifier).getProducts();

              Navigator.of(context).pushNamed('/products', arguments: {
                'categoryId': data.CategoryId,
                'categoryName': data.CategoryName,
              });
            },
            
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      margin: EdgeInsets.all(8),
                      width: 70,
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        data.fullImagePath,
                        height: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data.CategoryName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
         
          );
        },
      ),
    );
  }
}
