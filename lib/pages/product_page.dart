// ignore_for_file: non_constant_identifier_names, unnecessary_nullable_for_final_variable_declarations, must_call_super, unnecessary_import, unused_field, unused_element, sort_child_properties_last

import 'package:app_order/components/product_card.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:app_order/models/product_sort.dart';
import 'package:app_order/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
  
}

class _ProductsPageState extends State<ProductsPage> {
  String? CategoryId;
  String? CategoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductFilters(
                CategoryId: CategoryId,
                CategoryName: CategoryName,
              ),
              Flexible(
                child: _ProductList(),
                flex: 1,
              )
            ]),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      CategoryName = arguments['categoryName'];
      CategoryId = arguments['categoryId'];
    }

    super.didChangeDependencies();
  }
}

class _ProductFilters extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(value: "createdAt", label: "Lastest"),
    ProductSortModel(value: "-productSalePrice", label: "Price: High to Low"),
    ProductSortModel(value: "productSalePrice", label: "Price: Low to High")
  ];

  _ProductFilters({
    Key? key,
    this.CategoryName,
    this.CategoryId,
  });

  final String? CategoryName;
  final String? CategoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              CategoryName!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: PopupMenuButton(
              onSelected: (sortBy) {
                ProductFilterModel filterModel = ProductFilterModel(
                    paginationModel: PaginationModel(page: 0, pageSize: 10),
                    CategoryId: filterProvider.CategoryId,
                    sortBy: sortBy.toString());

                ref
                    .read(productsFilterProvider.notifier)
                    .setProductFilter(filterModel);

                    ref.read(productNotifierProvider.notifier).getProducts();
              },
              initialValue: filterProvider.sortBy,
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item.value,
                    child: InkWell(child: Text(item.label!)),
                  );
                }).toList();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          ),
        ],
      ),
     );
  }
}

class _ProductList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    if (productState.products.isEmpty) {
      if (!productState.hasNext && !productState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const LinearProgressIndicator();
    }
    return Column(
      children: [
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              productState.products.length,
              (index) {
                return ProductCard(
                  model: productState.products[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
