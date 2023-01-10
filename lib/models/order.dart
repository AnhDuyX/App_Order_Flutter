import 'cart_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  factory Order({
    required String userId,
    required List<CartProduct> products,
    required String orderId,
    required String grandTotal,
    required String orderStatus,
    required String transactionId,
    required String address,
    required String phone,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

extension CartExt on Order {
  int get grandTotal {
    return products
        .map((e) => e.product.productSalePrice * e.qty)
        .fold(0, (p, c) => p + c);
  }
}
