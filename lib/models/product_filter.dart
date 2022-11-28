// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:app_order/models/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_filter.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel({
    required PaginationModel paginationModel,
    String? CategoryId,
    String? sortBy,
    
  }) = _ProductFilterModel;
}