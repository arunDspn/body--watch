// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_vault_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaveVaultImageModel _$SaveVaultImageModelFromJson(Map<String, dynamic> json) {
  return _SaveVaultImageModel.fromJson(json);
}

/// @nodoc
mixin _$SaveVaultImageModel {
  String get tag => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveVaultImageModelCopyWith<SaveVaultImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveVaultImageModelCopyWith<$Res> {
  factory $SaveVaultImageModelCopyWith(
          SaveVaultImageModel value, $Res Function(SaveVaultImageModel) then) =
      _$SaveVaultImageModelCopyWithImpl<$Res, SaveVaultImageModel>;
  @useResult
  $Res call({String tag, String path, DateTime date});
}

/// @nodoc
class _$SaveVaultImageModelCopyWithImpl<$Res, $Val extends SaveVaultImageModel>
    implements $SaveVaultImageModelCopyWith<$Res> {
  _$SaveVaultImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveVaultImageModelImplCopyWith<$Res>
    implements $SaveVaultImageModelCopyWith<$Res> {
  factory _$$SaveVaultImageModelImplCopyWith(_$SaveVaultImageModelImpl value,
          $Res Function(_$SaveVaultImageModelImpl) then) =
      __$$SaveVaultImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tag, String path, DateTime date});
}

/// @nodoc
class __$$SaveVaultImageModelImplCopyWithImpl<$Res>
    extends _$SaveVaultImageModelCopyWithImpl<$Res, _$SaveVaultImageModelImpl>
    implements _$$SaveVaultImageModelImplCopyWith<$Res> {
  __$$SaveVaultImageModelImplCopyWithImpl(_$SaveVaultImageModelImpl _value,
      $Res Function(_$SaveVaultImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_$SaveVaultImageModelImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveVaultImageModelImpl implements _SaveVaultImageModel {
  const _$SaveVaultImageModelImpl(
      {required this.tag, required this.path, required this.date});

  factory _$SaveVaultImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveVaultImageModelImplFromJson(json);

  @override
  final String tag;
  @override
  final String path;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'SaveVaultImageModel(tag: $tag, path: $path, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveVaultImageModelImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tag, path, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveVaultImageModelImplCopyWith<_$SaveVaultImageModelImpl> get copyWith =>
      __$$SaveVaultImageModelImplCopyWithImpl<_$SaveVaultImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveVaultImageModelImplToJson(
      this,
    );
  }
}

abstract class _SaveVaultImageModel implements SaveVaultImageModel {
  const factory _SaveVaultImageModel(
      {required final String tag,
      required final String path,
      required final DateTime date}) = _$SaveVaultImageModelImpl;

  factory _SaveVaultImageModel.fromJson(Map<String, dynamic> json) =
      _$SaveVaultImageModelImpl.fromJson;

  @override
  String get tag;
  @override
  String get path;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$SaveVaultImageModelImplCopyWith<_$SaveVaultImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
