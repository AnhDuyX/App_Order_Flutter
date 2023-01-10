// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderSate {
  Order? get orderModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSateCopyWith<OrderSate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSateCopyWith<$Res> {
  factory $OrderSateCopyWith(OrderSate value, $Res Function(OrderSate) then) =
      _$OrderSateCopyWithImpl<$Res, OrderSate>;
  @useResult
  $Res call({Order? orderModel, bool isLoading});

  $OrderCopyWith<$Res>? get orderModel;
}

/// @nodoc
class _$OrderSateCopyWithImpl<$Res, $Val extends OrderSate>
    implements $OrderSateCopyWith<$Res> {
  _$OrderSateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      orderModel: freezed == orderModel
          ? _value.orderModel
          : orderModel // ignore: cast_nullable_to_non_nullable
              as Order?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res>? get orderModel {
    if (_value.orderModel == null) {
      return null;
    }

    return $OrderCopyWith<$Res>(_value.orderModel!, (value) {
      return _then(_value.copyWith(orderModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderSateCopyWith<$Res> implements $OrderSateCopyWith<$Res> {
  factory _$$_OrderSateCopyWith(
          _$_OrderSate value, $Res Function(_$_OrderSate) then) =
      __$$_OrderSateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Order? orderModel, bool isLoading});

  @override
  $OrderCopyWith<$Res>? get orderModel;
}

/// @nodoc
class __$$_OrderSateCopyWithImpl<$Res>
    extends _$OrderSateCopyWithImpl<$Res, _$_OrderSate>
    implements _$$_OrderSateCopyWith<$Res> {
  __$$_OrderSateCopyWithImpl(
      _$_OrderSate _value, $Res Function(_$_OrderSate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_OrderSate(
      orderModel: freezed == orderModel
          ? _value.orderModel
          : orderModel // ignore: cast_nullable_to_non_nullable
              as Order?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderSate implements _OrderSate {
  const _$_OrderSate({this.orderModel, this.isLoading = false});

  @override
  final Order? orderModel;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'OrderSate(orderModel: $orderModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderSate &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderModel, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderSateCopyWith<_$_OrderSate> get copyWith =>
      __$$_OrderSateCopyWithImpl<_$_OrderSate>(this, _$identity);
}

abstract class _OrderSate implements OrderSate {
  const factory _OrderSate({final Order? orderModel, final bool isLoading}) =
      _$_OrderSate;

  @override
  Order? get orderModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_OrderSateCopyWith<_$_OrderSate> get copyWith =>
      throw _privateConstructorUsedError;
}
