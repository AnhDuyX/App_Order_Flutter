// ignore_for_file: non_constant_identifier_names
// ignore: duplicate_import
import 'package:app_order/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

List<Category> categoriesFromJson(dynamic str) => List<Category>.from(
      (str).map(
        (e) => Category.fromJson(e),
      ),
    );

@freezed
abstract class Category with _$Category {
  factory Category({
    required String CategoryName,
    required String? CategoryImage,
    required String CategoryId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryExt on Category {
  String get fullImagePath => Config.imageURL + CategoryImage!;
}
