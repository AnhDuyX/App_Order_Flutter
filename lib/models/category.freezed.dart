// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get CategoryName => throw _privateConstructorUsedError;
  String? get CategoryImage => throw _privateConstructorUsedError;
  String get CategoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({String CategoryName, String? CategoryImage, String CategoryId});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? CategoryName = null,
    Object? CategoryImage = freezed,
    Object? CategoryId = null,
  }) {
    return _then(_value.copyWith(
      CategoryName: null == CategoryName
          ? _value.CategoryName
          : CategoryName // ignore: cast_nullable_to_non_nullable
              as String,
      CategoryImage: freezed == CategoryImage
          ? _value.CategoryImage
          : CategoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      CategoryId: null == CategoryId
          ? _value.CategoryId
          : CategoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String CategoryName, String? CategoryImage, String CategoryId});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? CategoryName = null,
    Object? CategoryImage = freezed,
    Object? CategoryId = null,
  }) {
    return _then(_$_Category(
      CategoryName: null == CategoryName
          ? _value.CategoryName
          : CategoryName // ignore: cast_nullable_to_non_nullable
              as String,
      CategoryImage: freezed == CategoryImage
          ? _value.CategoryImage
          : CategoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      CategoryId: null == CategoryId
          ? _value.CategoryId
          : CategoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  _$_Category(
      {required this.CategoryName,
      required this.CategoryImage,
      required this.CategoryId});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String CategoryName;
  @override
  final String? CategoryImage;
  @override
  final String CategoryId;

  @override
  String toString() {
    return 'Category(CategoryName: $CategoryName, CategoryImage: $CategoryImage, CategoryId: $CategoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.CategoryName, CategoryName) ||
                other.CategoryName == CategoryName) &&
            (identical(other.CategoryImage, CategoryImage) ||
                other.CategoryImage == CategoryImage) &&
            (identical(other.CategoryId, CategoryId) ||
                other.CategoryId == CategoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, CategoryName, CategoryImage, CategoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  factory _Category(
      {required final String CategoryName,
      required final String? CategoryImage,
      required final String CategoryId}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get CategoryName;
  @override
  String? get CategoryImage;
  @override
  String get CategoryId;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
