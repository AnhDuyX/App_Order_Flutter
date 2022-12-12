// ignore_for_file: non_constant_identifier_names

import 'package:app_order/api/api_service.dart';
import 'package:app_order/application/notifier/product_filter_notifier.dart';
import 'package:app_order/application/notifier/products_notifier.dart';
import 'package:app_order/application/state/product_state.dart';
// import 'package:app_order/application/notifier/product_filter_notifier.dart';
// import 'package:app_order/application/notifier/product_notifier.dart';
// import 'package:app_order/application/state/product_state.dart';
import 'package:app_order/models/category.dart';
import 'package:app_order/models/pagination.dart';
import 'package:app_order/models/product.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:app_order/models/slider.dart';
import 'package:app_order/pages/product_details_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) {
  final apiRespository = ref.watch(apiService);

  return apiRespository.getProducts(productFilterModel);
});

final productsFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>(
  (ref) => ProductsFilterNotifier(),
);

final productNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(
    ref.watch(apiService),
    ref.watch(productsFilterProvider),
  ),
);

final slidersProvider =
    FutureProvider.family<List<SliderModel>?, PaginationModel>(
  (ref, paginationModel) {
    final sliderRepo = ref.watch(apiService);
    return sliderRepo.getSliders(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);

final ProductDetailsProvider =
    FutureProvider.family<Product?, String>((ref, productId) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getProductDetails(productId);
});

final ralatedProductsProvider = FutureProvider.family<List<Product>?, ProductFilterModel>((ref, productFilterModel){
  final apiRepository = ref.watch(apiService);
  return apiRepository.getProducts(productFilterModel);
});