// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productName: json['productName'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      productShortDescription: json['productShortDescription'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productSalePrice: (json['productSalePrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      productSKU: json['productSKU'] as String,
      productStatus: json['productStatus'] as String,
      productId: json['_id'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'category': instance.category,
      'productShortDescription': instance.productShortDescription,
      'productPrice': instance.productPrice,
      'productSalePrice': instance.productSalePrice,
      'productImage': instance.productImage,
      'productSKU': instance.productSKU,
      'productStatus': instance.productStatus,
      '_id': instance.productId,
    };
