// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_vault_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveVaultImageModel {
  String get tag;
  String get path;
  DateTime get date;

  /// Create a copy of SaveVaultImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveVaultImageModelCopyWith<SaveVaultImageModel> get copyWith =>
      _$SaveVaultImageModelCopyWithImpl<SaveVaultImageModel>(
          this as SaveVaultImageModel, _$identity);

  /// Serializes this SaveVaultImageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveVaultImageModel &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, path, date);

  @override
  String toString() {
    return 'SaveVaultImageModel(tag: $tag, path: $path, date: $date)';
  }
}

/// @nodoc
abstract mixin class $SaveVaultImageModelCopyWith<$Res> {
  factory $SaveVaultImageModelCopyWith(
          SaveVaultImageModel value, $Res Function(SaveVaultImageModel) _then) =
      _$SaveVaultImageModelCopyWithImpl;
  @useResult
  $Res call({String tag, String path, DateTime date});
}

/// @nodoc
class _$SaveVaultImageModelCopyWithImpl<$Res>
    implements $SaveVaultImageModelCopyWith<$Res> {
  _$SaveVaultImageModelCopyWithImpl(this._self, this._then);

  final SaveVaultImageModel _self;
  final $Res Function(SaveVaultImageModel) _then;

  /// Create a copy of SaveVaultImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SaveVaultImageModel implements SaveVaultImageModel {
  const _SaveVaultImageModel(
      {required this.tag, required this.path, required this.date});
  factory _SaveVaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageModelFromJson(json);

  @override
  final String tag;
  @override
  final String path;
  @override
  final DateTime date;

  /// Create a copy of SaveVaultImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveVaultImageModelCopyWith<_SaveVaultImageModel> get copyWith =>
      __$SaveVaultImageModelCopyWithImpl<_SaveVaultImageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaveVaultImageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveVaultImageModel &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, path, date);

  @override
  String toString() {
    return 'SaveVaultImageModel(tag: $tag, path: $path, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$SaveVaultImageModelCopyWith<$Res>
    implements $SaveVaultImageModelCopyWith<$Res> {
  factory _$SaveVaultImageModelCopyWith(_SaveVaultImageModel value,
          $Res Function(_SaveVaultImageModel) _then) =
      __$SaveVaultImageModelCopyWithImpl;
  @override
  @useResult
  $Res call({String tag, String path, DateTime date});
}

/// @nodoc
class __$SaveVaultImageModelCopyWithImpl<$Res>
    implements _$SaveVaultImageModelCopyWith<$Res> {
  __$SaveVaultImageModelCopyWithImpl(this._self, this._then);

  final _SaveVaultImageModel _self;
  final $Res Function(_SaveVaultImageModel) _then;

  /// Create a copy of SaveVaultImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tag = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_SaveVaultImageModel(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
