// ignore_for_file: unused_local_variable, unused_element

import 'package:app_order/api/api_service.dart';
import 'package:app_order/application/state/product_state.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final APIService _apiService;
  final ProductFilterModel _filterModel;

  ProductsNotifier(this._apiService, this._filterModel)
      : super(const ProductsState());
  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(page: _page, pageSize: 10),
    );

    final products = await _apiService.getProducts(filterModel);
    final newProducts = [...state.products, ...products!];

    if (products.length % 10 != 0 || products.isEmpty) {
      state = state.copyWith(hasNext: true);
    }

    state = state.copyWith(products: newProducts);
    _page++;

    state = state.copyWith(isLoading: false);

    

  }

  Future<void> refreshProducts() async {
      state = state.copyWith(products: [], hasNext: true);
      _page = 1;

      await getProducts();
    }
}
