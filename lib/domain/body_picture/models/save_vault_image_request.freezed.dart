// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_vault_image_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveVaultImageRequest {
  /// Tag ID associated with the image
  int get tagId;

  /// Tag associated with the image
  String get tag;

  /// Targets (muscle groups) associated with the image
  List<int> get targets;

  /// Path where the image is stored in the device
  String get path;

  /// Date when the image was taken
  DateTime get date;

  /// Note associated with the image
  String get note;

  /// Create a copy of SaveVaultImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveVaultImageRequestCopyWith<SaveVaultImageRequest> get copyWith =>
      _$SaveVaultImageRequestCopyWithImpl<SaveVaultImageRequest>(
          this as SaveVaultImageRequest, _$identity);

  /// Serializes this SaveVaultImageRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveVaultImageRequest &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other.targets, targets) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagId, tag,
      const DeepCollectionEquality().hash(targets), path, date, note);

  @override
  String toString() {
    return 'SaveVaultImageRequest(tagId: $tagId, tag: $tag, targets: $targets, path: $path, date: $date, note: $note)';
  }
}

/// @nodoc
abstract mixin class $SaveVaultImageRequestCopyWith<$Res> {
  factory $SaveVaultImageRequestCopyWith(SaveVaultImageRequest value,
          $Res Function(SaveVaultImageRequest) _then) =
      _$SaveVaultImageRequestCopyWithImpl;
  @useResult
  $Res call(
      {int tagId,
      String tag,
      List<int> targets,
      String path,
      DateTime date,
      String note});
}

/// @nodoc
class _$SaveVaultImageRequestCopyWithImpl<$Res>
    implements $SaveVaultImageRequestCopyWith<$Res> {
  _$SaveVaultImageRequestCopyWithImpl(this._self, this._then);

  final SaveVaultImageRequest _self;
  final $Res Function(SaveVaultImageRequest) _then;

  /// Create a copy of SaveVaultImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? tag = null,
    Object? targets = null,
    Object? path = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(_self.copyWith(
      tagId: null == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _self.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<int>,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [SaveVaultImageRequest].
extension SaveVaultImageRequestPatterns on SaveVaultImageRequest {
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
    TResult Function(_SaveVaultImageRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest() when $default != null:
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
    TResult Function(_SaveVaultImageRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest():
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
    TResult? Function(_SaveVaultImageRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest() when $default != null:
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
    TResult Function(int tagId, String tag, List<int> targets, String path,
            DateTime date, String note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest() when $default != null:
        return $default(_that.tagId, _that.tag, _that.targets, _that.path,
            _that.date, _that.note);
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
    TResult Function(int tagId, String tag, List<int> targets, String path,
            DateTime date, String note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest():
        return $default(_that.tagId, _that.tag, _that.targets, _that.path,
            _that.date, _that.note);
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
    TResult? Function(int tagId, String tag, List<int> targets, String path,
            DateTime date, String note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SaveVaultImageRequest() when $default != null:
        return $default(_that.tagId, _that.tag, _that.targets, _that.path,
            _that.date, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SaveVaultImageRequest implements SaveVaultImageRequest {
  const _SaveVaultImageRequest(
      {required this.tagId,
      required this.tag,
      required final List<int> targets,
      required this.path,
      required this.date,
      required this.note})
      : _targets = targets;
  factory _SaveVaultImageRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageRequestFromJson(json);

  /// Tag ID associated with the image
  @override
  final int tagId;

  /// Tag associated with the image
  @override
  final String tag;

  /// Targets (muscle groups) associated with the image
  final List<int> _targets;

  /// Targets (muscle groups) associated with the image
  @override
  List<int> get targets {
    if (_targets is EqualUnmodifiableListView) return _targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targets);
  }

  /// Path where the image is stored in the device
  @override
  final String path;

  /// Date when the image was taken
  @override
  final DateTime date;

  /// Note associated with the image
  @override
  final String note;

  /// Create a copy of SaveVaultImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveVaultImageRequestCopyWith<_SaveVaultImageRequest> get copyWith =>
      __$SaveVaultImageRequestCopyWithImpl<_SaveVaultImageRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaveVaultImageRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveVaultImageRequest &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality().equals(other._targets, _targets) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagId, tag,
      const DeepCollectionEquality().hash(_targets), path, date, note);

  @override
  String toString() {
    return 'SaveVaultImageRequest(tagId: $tagId, tag: $tag, targets: $targets, path: $path, date: $date, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$SaveVaultImageRequestCopyWith<$Res>
    implements $SaveVaultImageRequestCopyWith<$Res> {
  factory _$SaveVaultImageRequestCopyWith(_SaveVaultImageRequest value,
          $Res Function(_SaveVaultImageRequest) _then) =
      __$SaveVaultImageRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int tagId,
      String tag,
      List<int> targets,
      String path,
      DateTime date,
      String note});
}

/// @nodoc
class __$SaveVaultImageRequestCopyWithImpl<$Res>
    implements _$SaveVaultImageRequestCopyWith<$Res> {
  __$SaveVaultImageRequestCopyWithImpl(this._self, this._then);

  final _SaveVaultImageRequest _self;
  final $Res Function(_SaveVaultImageRequest) _then;

  /// Create a copy of SaveVaultImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tagId = null,
    Object? tag = null,
    Object? targets = null,
    Object? path = null,
    Object? date = null,
    Object? note = null,
  }) {
    return _then(_SaveVaultImageRequest(
      tagId: null == tagId
          ? _self.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      targets: null == targets
          ? _self._targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<int>,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
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
