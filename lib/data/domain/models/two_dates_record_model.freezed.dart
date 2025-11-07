// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_dates_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TwoDatesRecord {
// Target name
  String get name; // First date value
  double? get data1;
  String? get metricCode1; // Second date value
  double? get data2;
  String? get metricCode2;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TwoDatesRecordCopyWith<TwoDatesRecord> get copyWith =>
      _$TwoDatesRecordCopyWithImpl<TwoDatesRecord>(
          this as TwoDatesRecord, _$identity);

  /// Serializes this TwoDatesRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TwoDatesRecord &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data1, data1) || other.data1 == data1) &&
            (identical(other.metricCode1, metricCode1) ||
                other.metricCode1 == metricCode1) &&
            (identical(other.data2, data2) || other.data2 == data2) &&
            (identical(other.metricCode2, metricCode2) ||
                other.metricCode2 == metricCode2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, data1, metricCode1, data2, metricCode2);

  @override
  String toString() {
    return 'TwoDatesRecord(name: $name, data1: $data1, metricCode1: $metricCode1, data2: $data2, metricCode2: $metricCode2)';
  }
}

/// @nodoc
abstract mixin class $TwoDatesRecordCopyWith<$Res> {
  factory $TwoDatesRecordCopyWith(
          TwoDatesRecord value, $Res Function(TwoDatesRecord) _then) =
      _$TwoDatesRecordCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      double? data1,
      String? metricCode1,
      double? data2,
      String? metricCode2});
}

/// @nodoc
class _$TwoDatesRecordCopyWithImpl<$Res>
    implements $TwoDatesRecordCopyWith<$Res> {
  _$TwoDatesRecordCopyWithImpl(this._self, this._then);

  final TwoDatesRecord _self;
  final $Res Function(TwoDatesRecord) _then;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? metricCode1 = freezed,
    Object? data2 = freezed,
    Object? metricCode2 = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      metricCode1: freezed == metricCode1
          ? _self.metricCode1
          : metricCode1 // ignore: cast_nullable_to_non_nullable
              as String?,
      data2: freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
      metricCode2: freezed == metricCode2
          ? _self.metricCode2
          : metricCode2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TwoDatesRecord].
extension TwoDatesRecordPatterns on TwoDatesRecord {
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
    TResult Function(_TwoDatesRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord() when $default != null:
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
    TResult Function(_TwoDatesRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord():
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
    TResult? Function(_TwoDatesRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord() when $default != null:
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
    TResult Function(String name, double? data1, String? metricCode1,
            double? data2, String? metricCode2)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord() when $default != null:
        return $default(_that.name, _that.data1, _that.metricCode1, _that.data2,
            _that.metricCode2);
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
    TResult Function(String name, double? data1, String? metricCode1,
            double? data2, String? metricCode2)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord():
        return $default(_that.name, _that.data1, _that.metricCode1, _that.data2,
            _that.metricCode2);
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
    TResult? Function(String name, double? data1, String? metricCode1,
            double? data2, String? metricCode2)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TwoDatesRecord() when $default != null:
        return $default(_that.name, _that.data1, _that.metricCode1, _that.data2,
            _that.metricCode2);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TwoDatesRecord implements TwoDatesRecord {
  const _TwoDatesRecord(
      {required this.name,
      required this.data1,
      required this.metricCode1,
      required this.data2,
      required this.metricCode2});
  factory _TwoDatesRecord.fromJson(Map<String, dynamic> json) =>
      _$TwoDatesRecordFromJson(json);

// Target name
  @override
  final String name;
// First date value
  @override
  final double? data1;
  @override
  final String? metricCode1;
// Second date value
  @override
  final double? data2;
  @override
  final String? metricCode2;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TwoDatesRecordCopyWith<_TwoDatesRecord> get copyWith =>
      __$TwoDatesRecordCopyWithImpl<_TwoDatesRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TwoDatesRecordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TwoDatesRecord &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data1, data1) || other.data1 == data1) &&
            (identical(other.metricCode1, metricCode1) ||
                other.metricCode1 == metricCode1) &&
            (identical(other.data2, data2) || other.data2 == data2) &&
            (identical(other.metricCode2, metricCode2) ||
                other.metricCode2 == metricCode2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, data1, metricCode1, data2, metricCode2);

  @override
  String toString() {
    return 'TwoDatesRecord(name: $name, data1: $data1, metricCode1: $metricCode1, data2: $data2, metricCode2: $metricCode2)';
  }
}

/// @nodoc
abstract mixin class _$TwoDatesRecordCopyWith<$Res>
    implements $TwoDatesRecordCopyWith<$Res> {
  factory _$TwoDatesRecordCopyWith(
          _TwoDatesRecord value, $Res Function(_TwoDatesRecord) _then) =
      __$TwoDatesRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      double? data1,
      String? metricCode1,
      double? data2,
      String? metricCode2});
}

/// @nodoc
class __$TwoDatesRecordCopyWithImpl<$Res>
    implements _$TwoDatesRecordCopyWith<$Res> {
  __$TwoDatesRecordCopyWithImpl(this._self, this._then);

  final _TwoDatesRecord _self;
  final $Res Function(_TwoDatesRecord) _then;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? metricCode1 = freezed,
    Object? data2 = freezed,
    Object? metricCode2 = freezed,
  }) {
    return _then(_TwoDatesRecord(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      metricCode1: freezed == metricCode1
          ? _self.metricCode1
          : metricCode1 // ignore: cast_nullable_to_non_nullable
              as String?,
      data2: freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
      metricCode2: freezed == metricCode2
          ? _self.metricCode2
          : metricCode2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
