// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:app_order/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../config.dart';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productsFromJson(dynamic str) => List<Product>.from(
      (str).map(
        (x) => Product.fromJson(x),
      ),
    );

@freezed
abstract class Product with _$Product {
  factory Product(
      {required String productName,
      required Category category,
      required String? productShortDescription,
      required int productPrice,
      required int productSalePrice,
      required String productImage,
      required String? productSKU,
      required String? productType,
      required String? productStatus,
      required String productId,
      List<String>? relatedProducts}) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductExt on Product {
  String get fullImagePath => Config.imageURL + productImage;

  int get calculateDiscount {
    double disPercent = 0;

    if (!productPrice.isNaN) {
      int regularPrice = productPrice;
      int salePrice = productSalePrice > 0 ? productSalePrice : regularPrice;
      int discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }

    return disPercent.round();
  }
}
