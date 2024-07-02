// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaultImage _$VaultImageFromJson(Map<String, dynamic> json) {
  return _VaultImage.fromJson(json);
}

/// @nodoc
mixin _$VaultImage {
  String get id => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_file')
  String get thumbnailFile => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VaultImageCopyWith<VaultImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaultImageCopyWith<$Res> {
  factory $VaultImageCopyWith(
          VaultImage value, $Res Function(VaultImage) then) =
      _$VaultImageCopyWithImpl<$Res, VaultImage>;
  @useResult
  $Res call(
      {String id,
      String tag,
      String file,
      @JsonKey(name: 'thumbnail_file') String thumbnailFile,
      DateTime date});
}

/// @nodoc
class _$VaultImageCopyWithImpl<$Res, $Val extends VaultImage>
    implements $VaultImageCopyWith<$Res> {
  _$VaultImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? file = null,
    Object? thumbnailFile = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailFile: null == thumbnailFile
          ? _value.thumbnailFile
          : thumbnailFile // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaultImageImplCopyWith<$Res>
    implements $VaultImageCopyWith<$Res> {
  factory _$$VaultImageImplCopyWith(
          _$VaultImageImpl value, $Res Function(_$VaultImageImpl) then) =
      __$$VaultImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String tag,
      String file,
      @JsonKey(name: 'thumbnail_file') String thumbnailFile,
      DateTime date});
}

/// @nodoc
class __$$VaultImageImplCopyWithImpl<$Res>
    extends _$VaultImageCopyWithImpl<$Res, _$VaultImageImpl>
    implements _$$VaultImageImplCopyWith<$Res> {
  __$$VaultImageImplCopyWithImpl(
      _$VaultImageImpl _value, $Res Function(_$VaultImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? file = null,
    Object? thumbnailFile = null,
    Object? date = null,
  }) {
    return _then(_$VaultImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailFile: null == thumbnailFile
          ? _value.thumbnailFile
          : thumbnailFile // ignore: cast_nullable_to_non_nullable
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
class _$VaultImageImpl implements _VaultImage {
  const _$VaultImageImpl(
      {required this.id,
      required this.tag,
      required this.file,
      @JsonKey(name: 'thumbnail_file') required this.thumbnailFile,
      required this.date});

  factory _$VaultImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaultImageImplFromJson(json);

  @override
  final String id;
  @override
  final String tag;
  @override
  final String file;
  @override
  @JsonKey(name: 'thumbnail_file')
  final String thumbnailFile;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'VaultImage(id: $id, tag: $tag, file: $file, thumbnailFile: $thumbnailFile, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaultImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.thumbnailFile, thumbnailFile) ||
                other.thumbnailFile == thumbnailFile) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, tag, file, thumbnailFile, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VaultImageImplCopyWith<_$VaultImageImpl> get copyWith =>
      __$$VaultImageImplCopyWithImpl<_$VaultImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaultImageImplToJson(
      this,
    );
  }
}

abstract class _VaultImage implements VaultImage {
  const factory _VaultImage(
      {required final String id,
      required final String tag,
      required final String file,
      @JsonKey(name: 'thumbnail_file') required final String thumbnailFile,
      required final DateTime date}) = _$VaultImageImpl;

  factory _VaultImage.fromJson(Map<String, dynamic> json) =
      _$VaultImageImpl.fromJson;

  @override
  String get id;
  @override
  String get tag;
  @override
  String get file;
  @override
  @JsonKey(name: 'thumbnail_file')
  String get thumbnailFile;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$VaultImageImplCopyWith<_$VaultImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
