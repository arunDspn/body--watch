// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageTagModel {
  int get id;
  String get tag;

  /// Create a copy of ImageTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageTagModelCopyWith<ImageTagModel> get copyWith =>
      _$ImageTagModelCopyWithImpl<ImageTagModel>(
          this as ImageTagModel, _$identity);

  /// Serializes this ImageTagModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageTagModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tag);

  @override
  String toString() {
    return 'ImageTagModel(id: $id, tag: $tag)';
  }
}

/// @nodoc
abstract mixin class $ImageTagModelCopyWith<$Res> {
  factory $ImageTagModelCopyWith(
          ImageTagModel value, $Res Function(ImageTagModel) _then) =
      _$ImageTagModelCopyWithImpl;
  @useResult
  $Res call({int id, String tag});
}

/// @nodoc
class _$ImageTagModelCopyWithImpl<$Res>
    implements $ImageTagModelCopyWith<$Res> {
  _$ImageTagModelCopyWithImpl(this._self, this._then);

  final ImageTagModel _self;
  final $Res Function(ImageTagModel) _then;

  /// Create a copy of ImageTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ImageTagModel].
extension ImageTagModelPatterns on ImageTagModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ImageTagModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ImageTagModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ImageTagModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String tag)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel() when $default != null:
        return $default(_that.id, _that.tag);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String tag) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel():
        return $default(_that.id, _that.tag);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String tag)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageTagModel() when $default != null:
        return $default(_that.id, _that.tag);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ImageTagModel implements ImageTagModel {
  const _ImageTagModel({required this.id, required this.tag});
  factory _ImageTagModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTagModelFromJson(json);

  @override
  final int id;
  @override
  final String tag;

  /// Create a copy of ImageTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageTagModelCopyWith<_ImageTagModel> get copyWith =>
      __$ImageTagModelCopyWithImpl<_ImageTagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageTagModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageTagModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tag);

  @override
  String toString() {
    return 'ImageTagModel(id: $id, tag: $tag)';
  }
}

/// @nodoc
abstract mixin class _$ImageTagModelCopyWith<$Res>
    implements $ImageTagModelCopyWith<$Res> {
  factory _$ImageTagModelCopyWith(
          _ImageTagModel value, $Res Function(_ImageTagModel) _then) =
      __$ImageTagModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String tag});
}

/// @nodoc
class __$ImageTagModelCopyWithImpl<$Res>
    implements _$ImageTagModelCopyWith<$Res> {
  __$ImageTagModelCopyWithImpl(this._self, this._then);

  final _ImageTagModel _self;
  final $Res Function(_ImageTagModel) _then;

  /// Create a copy of ImageTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tag = null,
  }) {
    return _then(_ImageTagModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
