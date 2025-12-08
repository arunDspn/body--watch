// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeasurementModel {
  int get id;
  double get value;
  DateTime get date;

  /// Measurement target name, e.g., "Weight", "Height"
  @JsonKey(name: 'target_name')
  String get targetName;
  @JsonKey(name: 'metric_code')
  String get metricCode;

  /// Measurement type, e.g., "body", "fitness"
  String get type;
  @JsonKey(name: '')
  String? get notes;

  /// Foreign key to the measurement target
  @JsonKey(name: 'target_id')
  int get targetId;

  /// Timestamps
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MeasurementModelCopyWith<MeasurementModel> get copyWith =>
      _$MeasurementModelCopyWithImpl<MeasurementModel>(
          this as MeasurementModel, _$identity);

  /// Serializes this MeasurementModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MeasurementModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetName, targetName) ||
                other.targetName == targetName) &&
            (identical(other.metricCode, metricCode) ||
                other.metricCode == metricCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value, date, targetName,
      metricCode, type, notes, targetId, createdAt, updatedAt);

  @override
  String toString() {
    return 'MeasurementModel(id: $id, value: $value, date: $date, targetName: $targetName, metricCode: $metricCode, type: $type, notes: $notes, targetId: $targetId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $MeasurementModelCopyWith<$Res> {
  factory $MeasurementModelCopyWith(
          MeasurementModel value, $Res Function(MeasurementModel) _then) =
      _$MeasurementModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      double value,
      DateTime date,
      @JsonKey(name: 'target_name') String targetName,
      @JsonKey(name: 'metric_code') String metricCode,
      String type,
      @JsonKey(name: '') String? notes,
      @JsonKey(name: 'target_id') int targetId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$MeasurementModelCopyWithImpl<$Res>
    implements $MeasurementModelCopyWith<$Res> {
  _$MeasurementModelCopyWithImpl(this._self, this._then);

  final MeasurementModel _self;
  final $Res Function(MeasurementModel) _then;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? date = null,
    Object? targetName = null,
    Object? metricCode = null,
    Object? type = null,
    Object? notes = freezed,
    Object? targetId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetName: null == targetName
          ? _self.targetName
          : targetName // ignore: cast_nullable_to_non_nullable
              as String,
      metricCode: null == metricCode
          ? _self.metricCode
          : metricCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [MeasurementModel].
extension MeasurementModelPatterns on MeasurementModel {
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
    TResult Function(_MeasurementModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel() when $default != null:
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
    TResult Function(_MeasurementModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel():
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
    TResult? Function(_MeasurementModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel() when $default != null:
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
            int id,
            double value,
            DateTime date,
            @JsonKey(name: 'target_name') String targetName,
            @JsonKey(name: 'metric_code') String metricCode,
            String type,
            @JsonKey(name: '') String? notes,
            @JsonKey(name: 'target_id') int targetId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel() when $default != null:
        return $default(
            _that.id,
            _that.value,
            _that.date,
            _that.targetName,
            _that.metricCode,
            _that.type,
            _that.notes,
            _that.targetId,
            _that.createdAt,
            _that.updatedAt);
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
            int id,
            double value,
            DateTime date,
            @JsonKey(name: 'target_name') String targetName,
            @JsonKey(name: 'metric_code') String metricCode,
            String type,
            @JsonKey(name: '') String? notes,
            @JsonKey(name: 'target_id') int targetId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel():
        return $default(
            _that.id,
            _that.value,
            _that.date,
            _that.targetName,
            _that.metricCode,
            _that.type,
            _that.notes,
            _that.targetId,
            _that.createdAt,
            _that.updatedAt);
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
            int id,
            double value,
            DateTime date,
            @JsonKey(name: 'target_name') String targetName,
            @JsonKey(name: 'metric_code') String metricCode,
            String type,
            @JsonKey(name: '') String? notes,
            @JsonKey(name: 'target_id') int targetId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeasurementModel() when $default != null:
        return $default(
            _that.id,
            _that.value,
            _that.date,
            _that.targetName,
            _that.metricCode,
            _that.type,
            _that.notes,
            _that.targetId,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MeasurementModel implements MeasurementModel {
  const _MeasurementModel(
      {required this.id,
      required this.value,
      required this.date,
      @JsonKey(name: 'target_name') required this.targetName,
      @JsonKey(name: 'metric_code') required this.metricCode,
      required this.type,
      @JsonKey(name: '') this.notes,
      @JsonKey(name: 'target_id') required this.targetId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _MeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementModelFromJson(json);

  @override
  final int id;
  @override
  final double value;
  @override
  final DateTime date;

  /// Measurement target name, e.g., "Weight", "Height"
  @override
  @JsonKey(name: 'target_name')
  final String targetName;
  @override
  @JsonKey(name: 'metric_code')
  final String metricCode;

  /// Measurement type, e.g., "body", "fitness"
  @override
  final String type;
  @override
  @JsonKey(name: '')
  final String? notes;

  /// Foreign key to the measurement target
  @override
  @JsonKey(name: 'target_id')
  final int targetId;

  /// Timestamps
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MeasurementModelCopyWith<_MeasurementModel> get copyWith =>
      __$MeasurementModelCopyWithImpl<_MeasurementModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MeasurementModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MeasurementModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.targetName, targetName) ||
                other.targetName == targetName) &&
            (identical(other.metricCode, metricCode) ||
                other.metricCode == metricCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value, date, targetName,
      metricCode, type, notes, targetId, createdAt, updatedAt);

  @override
  String toString() {
    return 'MeasurementModel(id: $id, value: $value, date: $date, targetName: $targetName, metricCode: $metricCode, type: $type, notes: $notes, targetId: $targetId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$MeasurementModelCopyWith<$Res>
    implements $MeasurementModelCopyWith<$Res> {
  factory _$MeasurementModelCopyWith(
          _MeasurementModel value, $Res Function(_MeasurementModel) _then) =
      __$MeasurementModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      double value,
      DateTime date,
      @JsonKey(name: 'target_name') String targetName,
      @JsonKey(name: 'metric_code') String metricCode,
      String type,
      @JsonKey(name: '') String? notes,
      @JsonKey(name: 'target_id') int targetId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$MeasurementModelCopyWithImpl<$Res>
    implements _$MeasurementModelCopyWith<$Res> {
  __$MeasurementModelCopyWithImpl(this._self, this._then);

  final _MeasurementModel _self;
  final $Res Function(_MeasurementModel) _then;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? date = null,
    Object? targetName = null,
    Object? metricCode = null,
    Object? type = null,
    Object? notes = freezed,
    Object? targetId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_MeasurementModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetName: null == targetName
          ? _self.targetName
          : targetName // ignore: cast_nullable_to_non_nullable
              as String,
      metricCode: null == metricCode
          ? _self.metricCode
          : metricCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
