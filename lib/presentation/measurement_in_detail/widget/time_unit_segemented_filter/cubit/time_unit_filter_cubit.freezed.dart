// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_unit_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeUnitFilterState {
  TimeUnit get timeUnit;

  /// Create a copy of TimeUnitFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeUnitFilterStateCopyWith<TimeUnitFilterState> get copyWith =>
      _$TimeUnitFilterStateCopyWithImpl<TimeUnitFilterState>(
          this as TimeUnitFilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeUnitFilterState &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeUnit);

  @override
  String toString() {
    return 'TimeUnitFilterState(timeUnit: $timeUnit)';
  }
}

/// @nodoc
abstract mixin class $TimeUnitFilterStateCopyWith<$Res> {
  factory $TimeUnitFilterStateCopyWith(
          TimeUnitFilterState value, $Res Function(TimeUnitFilterState) _then) =
      _$TimeUnitFilterStateCopyWithImpl;
  @useResult
  $Res call({TimeUnit timeUnit});
}

/// @nodoc
class _$TimeUnitFilterStateCopyWithImpl<$Res>
    implements $TimeUnitFilterStateCopyWith<$Res> {
  _$TimeUnitFilterStateCopyWithImpl(this._self, this._then);

  final TimeUnitFilterState _self;
  final $Res Function(TimeUnitFilterState) _then;

  /// Create a copy of TimeUnitFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeUnit = null,
  }) {
    return _then(_self.copyWith(
      timeUnit: null == timeUnit
          ? _self.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
    ));
  }
}

/// Adds pattern-matching-related methods to [TimeUnitFilterState].
extension TimeUnitFilterStatePatterns on TimeUnitFilterState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_On value)? on,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _On() when on != null:
        return on(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_On value) on,
  }) {
    final _that = this;
    switch (_that) {
      case _On():
        return on(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_On value)? on,
  }) {
    final _that = this;
    switch (_that) {
      case _On() when on != null:
        return on(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimeUnit timeUnit)? on,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _On() when on != null:
        return on(_that.timeUnit);
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
  TResult when<TResult extends Object?>({
    required TResult Function(TimeUnit timeUnit) on,
  }) {
    final _that = this;
    switch (_that) {
      case _On():
        return on(_that.timeUnit);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimeUnit timeUnit)? on,
  }) {
    final _that = this;
    switch (_that) {
      case _On() when on != null:
        return on(_that.timeUnit);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _On implements TimeUnitFilterState {
  const _On({required this.timeUnit});

  @override
  final TimeUnit timeUnit;

  /// Create a copy of TimeUnitFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnCopyWith<_On> get copyWith => __$OnCopyWithImpl<_On>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _On &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeUnit);

  @override
  String toString() {
    return 'TimeUnitFilterState.on(timeUnit: $timeUnit)';
  }
}

/// @nodoc
abstract mixin class _$OnCopyWith<$Res>
    implements $TimeUnitFilterStateCopyWith<$Res> {
  factory _$OnCopyWith(_On value, $Res Function(_On) _then) = __$OnCopyWithImpl;
  @override
  @useResult
  $Res call({TimeUnit timeUnit});
}

/// @nodoc
class __$OnCopyWithImpl<$Res> implements _$OnCopyWith<$Res> {
  __$OnCopyWithImpl(this._self, this._then);

  final _On _self;
  final $Res Function(_On) _then;

  /// Create a copy of TimeUnitFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timeUnit = null,
  }) {
    return _then(_On(
      timeUnit: null == timeUnit
          ? _self.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
    ));
  }
}

// dart format on
