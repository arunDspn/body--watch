// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VaultImage {
  String get id;
  String get tag;
  String get file;
  @JsonKey(name: 'thumbnail_file')
  String get thumbnailFile;
  DateTime get date;
  String get note;

  /// Create a copy of VaultImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VaultImageCopyWith<VaultImage> get copyWith =>
      _$VaultImageCopyWithImpl<VaultImage>(this as VaultImage, _$identity);

  /// Serializes this VaultImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VaultImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.thumbnailFile, thumbnailFile) ||
                other.thumbnailFile == thumbnailFile) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, tag, file, thumbnailFile, date, note);

  @override
  String toString() {
    return 'VaultImage(id: $id, tag: $tag, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
  }
}

/// @nodoc
abstract mixin class $VaultImageCopyWith<$Res> {
  factory $VaultImageCopyWith(
          VaultImage value, $Res Function(VaultImage) _then) =
      _$VaultImageCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String tag,
      String file,
      @JsonKey(name: 'thumbnail_file') String thumbnailFile,
      DateTime date,
      String note});
}

/// @nodoc
class _$VaultImageCopyWithImpl<$Res> implements $VaultImageCopyWith<$Res> {
  _$VaultImageCopyWithImpl(this._self, this._then);

  final VaultImage _self;
  final $Res Function(VaultImage) _then;

  /// Create a copy of VaultImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? file = null,
    Object? thumbnailFile = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailFile: null == thumbnailFile
          ? _self.thumbnailFile
          : thumbnailFile // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VaultImage implements VaultImage {
  const _VaultImage(
      {required this.id,
      required this.tag,
      required this.file,
      @JsonKey(name: 'thumbnail_file') required this.thumbnailFile,
      required this.date,
      required this.note});
  factory _VaultImage.fromJson(Map<String, dynamic> json) =>
      _$VaultImageFromJson(json);

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
  final String note;

  /// Create a copy of VaultImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VaultImageCopyWith<_VaultImage> get copyWith =>
      __$VaultImageCopyWithImpl<_VaultImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VaultImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VaultImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.thumbnailFile, thumbnailFile) ||
                other.thumbnailFile == thumbnailFile) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, tag, file, thumbnailFile, date, note);

  @override
  String toString() {
    return 'VaultImage(id: $id, tag: $tag, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$VaultImageCopyWith<$Res>
    implements $VaultImageCopyWith<$Res> {
  factory _$VaultImageCopyWith(
          _VaultImage value, $Res Function(_VaultImage) _then) =
      __$VaultImageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String tag,
      String file,
      @JsonKey(name: 'thumbnail_file') String thumbnailFile,
      DateTime date,
      String note});
}

/// @nodoc
class __$VaultImageCopyWithImpl<$Res> implements _$VaultImageCopyWith<$Res> {
  __$VaultImageCopyWithImpl(this._self, this._then);

  final _VaultImage _self;
  final $Res Function(_VaultImage) _then;

  /// Create a copy of VaultImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? file = null,
    Object? thumbnailFile = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(_VaultImage(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailFile: null == thumbnailFile
          ? _self.thumbnailFile
          : thumbnailFile // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
