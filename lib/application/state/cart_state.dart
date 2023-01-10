import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/cart.dart';

part 'cart_state.freezed.dart';

@freezed
class CartSate with _$CartSate{
  const factory CartSate({
    Cart? cartModel,
    @Default(false) bool isLoading,
  }) = _CartState;
 }
