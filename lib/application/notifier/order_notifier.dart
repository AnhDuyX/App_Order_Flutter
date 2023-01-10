

import 'package:app_order/api/api_service.dart';
import 'package:app_order/application/state/order_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNotifier extends StateNotifier<OrderSate> {
  final APIService _apiService;

  OrderNotifier(this._apiService) : super(const OrderSate()) {
    getOrder();
  }

  Future<void> getOrder() async {
    state = state.copyWith(isLoading: true);

    final orderData = await _apiService.getOrder();

    state = state.copyWith(orderModel: orderData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addOrder(address, phone) async {
    await APIService.addOrders(address, phone);
    getOrder();
  }
}