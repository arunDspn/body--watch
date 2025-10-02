// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeasurementEntity {
  double get value;
  DateTime get date;
  @JsonKey(name: 'target_id')
  int get targetId;
  String get notes;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // user_id
  @JsonKey(name: 'user_id')
  int get userId;
  int? get id;

  /// Create a copy of MeasurementEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MeasurementEntityCopyWith<MeasurementEntity> get copyWith =>
      _$MeasurementEntityCopyWithImpl<MeasurementEntity>(
          this as MeasurementEntity, _$identity);

  /// Serializes this MeasurementEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MeasurementEntity &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, date, targetId, notes,
      createdAt, updatedAt, userId, id);

  @override
  String toString() {
    return 'MeasurementEntity(value: $value, date: $date, targetId: $targetId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class $MeasurementEntityCopyWith<$Res> {
  factory $MeasurementEntityCopyWith(
          MeasurementEntity value, $Res Function(MeasurementEntity) _then) =
      _$MeasurementEntityCopyWithImpl;
  @useResult
  $Res call(
      {double value,
      DateTime date,
      @JsonKey(name: 'target_id') int targetId,
      String notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_id') int userId,
      int? id});
}

/// @nodoc
class _$MeasurementEntityCopyWithImpl<$Res>
    implements $MeasurementEntityCopyWith<$Res> {
  _$MeasurementEntityCopyWithImpl(this._self, this._then);

  final MeasurementEntity _self;
  final $Res Function(MeasurementEntity) _then;

  /// Create a copy of MeasurementEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? date = null,
    Object? targetId = null,
    Object? notes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = null,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MeasurementEntity].
extension MeasurementEntityPatterns on MeasurementEntity {
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
    TResult Function(_MeasurementEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity() when $default != null:
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
    TResult Function(_MeasurementEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity():
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
    TResult? Function(_MeasurementEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity() when $default != null:
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
            double value,
            DateTime date,
            @JsonKey(name: 'target_id') int targetId,
            String notes,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'user_id') int userId,
            int? id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity() when $default != null:
        return $default(_that.value, _that.date, _that.targetId, _that.notes,
            _that.createdAt, _that.updatedAt, _that.userId, _that.id);
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
            double value,
            DateTime date,
            @JsonKey(name: 'target_id') int targetId,
            String notes,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'user_id') int userId,
            int? id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity():
        return $default(_that.value, _that.date, _that.targetId, _that.notes,
            _that.createdAt, _that.updatedAt, _that.userId, _that.id);
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
            double value,
            DateTime date,
            @JsonKey(name: 'target_id') int targetId,
            String notes,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'user_id') int userId,
            int? id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementEntity() when $default != null:
        return $default(_that.value, _that.date, _that.targetId, _that.notes,
            _that.createdAt, _that.updatedAt, _that.userId, _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MeasurementEntity implements MeasurementEntity {
  const _MeasurementEntity(
      {required this.value,
      required this.date,
      @JsonKey(name: 'target_id') required this.targetId,
      required this.notes,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_id') required this.userId,
      this.id});
  factory _MeasurementEntity.fromJson(Map<String, dynamic> json) =>
      _$MeasurementEntityFromJson(json);

  @override
  final double value;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'target_id')
  final int targetId;
  @override
  final String notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
// user_id
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int? id;

  /// Create a copy of MeasurementEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MeasurementEntityCopyWith<_MeasurementEntity> get copyWith =>
      __$MeasurementEntityCopyWithImpl<_MeasurementEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MeasurementEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MeasurementEntity &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, date, targetId, notes,
      createdAt, updatedAt, userId, id);

  @override
  String toString() {
    return 'MeasurementEntity(value: $value, date: $date, targetId: $targetId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$MeasurementEntityCopyWith<$Res>
    implements $MeasurementEntityCopyWith<$Res> {
  factory _$MeasurementEntityCopyWith(
          _MeasurementEntity value, $Res Function(_MeasurementEntity) _then) =
      __$MeasurementEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double value,
      DateTime date,
      @JsonKey(name: 'target_id') int targetId,
      String notes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_id') int userId,
      int? id});
}

/// @nodoc
class __$MeasurementEntityCopyWithImpl<$Res>
    implements _$MeasurementEntityCopyWith<$Res> {
  __$MeasurementEntityCopyWithImpl(this._self, this._then);

  final _MeasurementEntity _self;
  final $Res Function(_MeasurementEntity) _then;

  /// Create a copy of MeasurementEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? date = null,
    Object? targetId = null,
    Object? notes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = null,
    Object? id = freezed,
  }) {
    return _then(_MeasurementEntity(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
