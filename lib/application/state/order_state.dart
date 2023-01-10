import 'package:app_order/models/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/cart.dart';

part 'order_state.freezed.dart';

@freezed
class OrderSate with _$OrderSate{
  const factory OrderSate({
    Order? orderModel,
    @Default(false) bool isLoading,
  }) = _OrderSate;
 }
