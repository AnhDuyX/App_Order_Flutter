// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderId: json['orderId'] as String,
      grandTotal: json['grandTotal'] as String,
      orderStatus: json['orderStatus'] as String,
      transactionId: json['transactionId'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products,
      'orderId': instance.orderId,
      'grandTotal': instance.grandTotal,
      'orderStatus': instance.orderStatus,
      'transactionId': instance.transactionId,
      'address': instance.address,
      'phone': instance.phone,
    };
