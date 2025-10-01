// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  /// Tag associated with the image
  String get tag;

  /// Path where the image is stored in the device
  String get path;

  /// Date when the image was taken
  DateTime get date;

  /// Muscle group associated with the image
  List<String> get muscleGroup;

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
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other.muscleGroup, muscleGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, path, date,
      const DeepCollectionEquality().hash(muscleGroup));

  @override
  String toString() {
    return 'SaveVaultImageModel(tag: $tag, path: $path, date: $date, muscleGroup: $muscleGroup)';
  }
}

/// @nodoc
abstract mixin class $SaveVaultImageModelCopyWith<$Res> {
  factory $SaveVaultImageModelCopyWith(
          SaveVaultImageModel value, $Res Function(SaveVaultImageModel) _then) =
      _$SaveVaultImageModelCopyWithImpl;
  @useResult
  $Res call({String tag, String path, DateTime date, List<String> muscleGroup});
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
    Object? muscleGroup = null,
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
      muscleGroup: null == muscleGroup
          ? _self.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SaveVaultImageModel].
extension SaveVaultImageModelPatterns on SaveVaultImageModel {
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
    TResult Function(_SaveVaultImageModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel() when $default != null:
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
    TResult Function(_SaveVaultImageModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel():
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
    TResult? Function(_SaveVaultImageModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel() when $default != null:
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
    TResult Function(
            String tag, String path, DateTime date, List<String> muscleGroup)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel() when $default != null:
        return $default(_that.tag, _that.path, _that.date, _that.muscleGroup);
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
    TResult Function(
            String tag, String path, DateTime date, List<String> muscleGroup)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel():
        return $default(_that.tag, _that.path, _that.date, _that.muscleGroup);
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
    TResult? Function(
            String tag, String path, DateTime date, List<String> muscleGroup)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageModel() when $default != null:
        return $default(_that.tag, _that.path, _that.date, _that.muscleGroup);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SaveVaultImageModel implements SaveVaultImageModel {
  const _SaveVaultImageModel(
      {required this.tag,
      required this.path,
      required this.date,
      required final List<String> muscleGroup})
      : _muscleGroup = muscleGroup;
  factory _SaveVaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageModelFromJson(json);

  /// Tag associated with the image
  @override
  final String tag;

  /// Path where the image is stored in the device
  @override
  final String path;

  /// Date when the image was taken
  @override
  final DateTime date;

  /// Muscle group associated with the image
  final List<String> _muscleGroup;

  /// Muscle group associated with the image
  @override
  List<String> get muscleGroup {
    if (_muscleGroup is EqualUnmodifiableListView) return _muscleGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_muscleGroup);
  }

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
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroup, _muscleGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, path, date,
      const DeepCollectionEquality().hash(_muscleGroup));

  @override
  String toString() {
    return 'SaveVaultImageModel(tag: $tag, path: $path, date: $date, muscleGroup: $muscleGroup)';
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
  $Res call({String tag, String path, DateTime date, List<String> muscleGroup});
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
    Object? muscleGroup = null,
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
      muscleGroup: null == muscleGroup
          ? _self._muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
