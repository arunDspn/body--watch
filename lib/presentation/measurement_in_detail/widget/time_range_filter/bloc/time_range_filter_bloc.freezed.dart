// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeRangeFilterEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimeRangeFilterEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterEvent()';
  }
}

/// @nodoc
class $TimeRangeFilterEventCopyWith<$Res> {
  $TimeRangeFilterEventCopyWith(
      TimeRangeFilterEvent _, $Res Function(TimeRangeFilterEvent) __);
}

/// Adds pattern-matching-related methods to [TimeRangeFilterEvent].
extension TimeRangeFilterEventPatterns on TimeRangeFilterEvent {
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
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange() when nextRange != null:
        return nextRange(_that);
      case _PreviousRange() when previousRange != null:
        return previousRange(_that);
      case _CurrentRange() when currentRange != null:
        return currentRange(_that);
      case _UpdateData() when updateData != null:
        return updateData(_that);
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
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange():
        return nextRange(_that);
      case _PreviousRange():
        return previousRange(_that);
      case _CurrentRange():
        return currentRange(_that);
      case _UpdateData():
        return updateData(_that);
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
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange() when nextRange != null:
        return nextRange(_that);
      case _PreviousRange() when previousRange != null:
        return previousRange(_that);
      case _CurrentRange() when currentRange != null:
        return currentRange(_that);
      case _UpdateData() when updateData != null:
        return updateData(_that);
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
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange() when nextRange != null:
        return nextRange();
      case _PreviousRange() when previousRange != null:
        return previousRange();
      case _CurrentRange() when currentRange != null:
        return currentRange();
      case _UpdateData() when updateData != null:
        return updateData(_that.newMeasurementList);
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
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange():
        return nextRange();
      case _PreviousRange():
        return previousRange();
      case _CurrentRange():
        return currentRange();
      case _UpdateData():
        return updateData(_that.newMeasurementList);
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
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) {
    final _that = this;
    switch (_that) {
      case _NextRange() when nextRange != null:
        return nextRange();
      case _PreviousRange() when previousRange != null:
        return previousRange();
      case _CurrentRange() when currentRange != null:
        return currentRange();
      case _UpdateData() when updateData != null:
        return updateData(_that.newMeasurementList);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NextRange implements TimeRangeFilterEvent {
  const _NextRange();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NextRange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterEvent.nextRange()';
  }
}

/// @nodoc

class _PreviousRange implements TimeRangeFilterEvent {
  const _PreviousRange();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PreviousRange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterEvent.previousRange()';
  }
}

/// @nodoc

class _CurrentRange implements TimeRangeFilterEvent {
  const _CurrentRange();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CurrentRange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterEvent.currentRange()';
  }
}

/// @nodoc

class _UpdateData implements TimeRangeFilterEvent {
  const _UpdateData({required final List<Measurement> newMeasurementList})
      : _newMeasurementList = newMeasurementList;

  final List<Measurement> _newMeasurementList;
  List<Measurement> get newMeasurementList {
    if (_newMeasurementList is EqualUnmodifiableListView)
      return _newMeasurementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newMeasurementList);
  }

  /// Create a copy of TimeRangeFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateDataCopyWith<_UpdateData> get copyWith =>
      __$UpdateDataCopyWithImpl<_UpdateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateData &&
            const DeepCollectionEquality()
                .equals(other._newMeasurementList, _newMeasurementList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_newMeasurementList));

  @override
  String toString() {
    return 'TimeRangeFilterEvent.updateData(newMeasurementList: $newMeasurementList)';
  }
}

/// @nodoc
abstract mixin class _$UpdateDataCopyWith<$Res>
    implements $TimeRangeFilterEventCopyWith<$Res> {
  factory _$UpdateDataCopyWith(
          _UpdateData value, $Res Function(_UpdateData) _then) =
      __$UpdateDataCopyWithImpl;
  @useResult
  $Res call({List<Measurement> newMeasurementList});
}

/// @nodoc
class __$UpdateDataCopyWithImpl<$Res> implements _$UpdateDataCopyWith<$Res> {
  __$UpdateDataCopyWithImpl(this._self, this._then);

  final _UpdateData _self;
  final $Res Function(_UpdateData) _then;

  /// Create a copy of TimeRangeFilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? newMeasurementList = null,
  }) {
    return _then(_UpdateData(
      newMeasurementList: null == newMeasurementList
          ? _self._newMeasurementList
          : newMeasurementList // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
    ));
  }
}

/// @nodoc
mixin _$TimeRangeFilterState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimeRangeFilterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterState()';
  }
}

/// @nodoc
class $TimeRangeFilterStateCopyWith<$Res> {
  $TimeRangeFilterStateCopyWith(
      TimeRangeFilterState _, $Res Function(TimeRangeFilterState) __);
}

/// Adds pattern-matching-related methods to [TimeRangeFilterState].
extension TimeRangeFilterStatePatterns on TimeRangeFilterState {
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
    TResult Function(TimeRangeFilterStateState value)? state,
    TResult Function(TimeRangeFilterStateLoading value)? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState() when state != null:
        return state(_that);
      case TimeRangeFilterStateLoading() when loading != null:
        return loading(_that);
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
    required TResult Function(TimeRangeFilterStateState value) state,
    required TResult Function(TimeRangeFilterStateLoading value) loading,
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState():
        return state(_that);
      case TimeRangeFilterStateLoading():
        return loading(_that);
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
    TResult? Function(TimeRangeFilterStateState value)? state,
    TResult? Function(TimeRangeFilterStateLoading value)? loading,
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState() when state != null:
        return state(_that);
      case TimeRangeFilterStateLoading() when loading != null:
        return loading(_that);
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
    TResult Function(
            DateTime startDate,
            DateTime endDate,
            List<Measurement> filteredMeasurements,
            TimeUnit timeUnit,
            bool nextable,
            Measurement? previousMeasurement,
            Measurement? nextMeasurement)?
        state,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState() when state != null:
        return state(
            _that.startDate,
            _that.endDate,
            _that.filteredMeasurements,
            _that.timeUnit,
            _that.nextable,
            _that.previousMeasurement,
            _that.nextMeasurement);
      case TimeRangeFilterStateLoading() when loading != null:
        return loading();
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
    required TResult Function(
            DateTime startDate,
            DateTime endDate,
            List<Measurement> filteredMeasurements,
            TimeUnit timeUnit,
            bool nextable,
            Measurement? previousMeasurement,
            Measurement? nextMeasurement)
        state,
    required TResult Function() loading,
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState():
        return state(
            _that.startDate,
            _that.endDate,
            _that.filteredMeasurements,
            _that.timeUnit,
            _that.nextable,
            _that.previousMeasurement,
            _that.nextMeasurement);
      case TimeRangeFilterStateLoading():
        return loading();
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
    TResult? Function(
            DateTime startDate,
            DateTime endDate,
            List<Measurement> filteredMeasurements,
            TimeUnit timeUnit,
            bool nextable,
            Measurement? previousMeasurement,
            Measurement? nextMeasurement)?
        state,
    TResult? Function()? loading,
  }) {
    final _that = this;
    switch (_that) {
      case TimeRangeFilterStateState() when state != null:
        return state(
            _that.startDate,
            _that.endDate,
            _that.filteredMeasurements,
            _that.timeUnit,
            _that.nextable,
            _that.previousMeasurement,
            _that.nextMeasurement);
      case TimeRangeFilterStateLoading() when loading != null:
        return loading();
      case _:
        return null;
    }
  }
}

/// @nodoc

class TimeRangeFilterStateState implements TimeRangeFilterState {
  const TimeRangeFilterStateState(
      {required this.startDate,
      required this.endDate,
      required final List<Measurement> filteredMeasurements,
      required this.timeUnit,
      required this.nextable,
      required this.previousMeasurement,
      required this.nextMeasurement})
      : _filteredMeasurements = filteredMeasurements;

  final DateTime startDate;
  final DateTime endDate;
  final List<Measurement> _filteredMeasurements;
  List<Measurement> get filteredMeasurements {
    if (_filteredMeasurements is EqualUnmodifiableListView)
      return _filteredMeasurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredMeasurements);
  }

  final TimeUnit timeUnit;
  final bool nextable;
  final Measurement? previousMeasurement;
  final Measurement? nextMeasurement;

  /// Create a copy of TimeRangeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeRangeFilterStateStateCopyWith<TimeRangeFilterStateState> get copyWith =>
      _$TimeRangeFilterStateStateCopyWithImpl<TimeRangeFilterStateState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeRangeFilterStateState &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._filteredMeasurements, _filteredMeasurements) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit) &&
            (identical(other.nextable, nextable) ||
                other.nextable == nextable) &&
            (identical(other.previousMeasurement, previousMeasurement) ||
                other.previousMeasurement == previousMeasurement) &&
            (identical(other.nextMeasurement, nextMeasurement) ||
                other.nextMeasurement == nextMeasurement));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_filteredMeasurements),
      timeUnit,
      nextable,
      previousMeasurement,
      nextMeasurement);

  @override
  String toString() {
    return 'TimeRangeFilterState.state(startDate: $startDate, endDate: $endDate, filteredMeasurements: $filteredMeasurements, timeUnit: $timeUnit, nextable: $nextable, previousMeasurement: $previousMeasurement, nextMeasurement: $nextMeasurement)';
  }
}

/// @nodoc
abstract mixin class $TimeRangeFilterStateStateCopyWith<$Res>
    implements $TimeRangeFilterStateCopyWith<$Res> {
  factory $TimeRangeFilterStateStateCopyWith(TimeRangeFilterStateState value,
          $Res Function(TimeRangeFilterStateState) _then) =
      _$TimeRangeFilterStateStateCopyWithImpl;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      List<Measurement> filteredMeasurements,
      TimeUnit timeUnit,
      bool nextable,
      Measurement? previousMeasurement,
      Measurement? nextMeasurement});
}

/// @nodoc
class _$TimeRangeFilterStateStateCopyWithImpl<$Res>
    implements $TimeRangeFilterStateStateCopyWith<$Res> {
  _$TimeRangeFilterStateStateCopyWithImpl(this._self, this._then);

  final TimeRangeFilterStateState _self;
  final $Res Function(TimeRangeFilterStateState) _then;

  /// Create a copy of TimeRangeFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? filteredMeasurements = null,
    Object? timeUnit = null,
    Object? nextable = null,
    Object? previousMeasurement = freezed,
    Object? nextMeasurement = freezed,
  }) {
    return _then(TimeRangeFilterStateState(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filteredMeasurements: null == filteredMeasurements
          ? _self._filteredMeasurements
          : filteredMeasurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
      timeUnit: null == timeUnit
          ? _self.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
      nextable: null == nextable
          ? _self.nextable
          : nextable // ignore: cast_nullable_to_non_nullable
              as bool,
      previousMeasurement: freezed == previousMeasurement
          ? _self.previousMeasurement
          : previousMeasurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
      nextMeasurement: freezed == nextMeasurement
          ? _self.nextMeasurement
          : nextMeasurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
    ));
  }
}

/// @nodoc

class TimeRangeFilterStateLoading implements TimeRangeFilterState {
  const TimeRangeFilterStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeRangeFilterStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimeRangeFilterState.loading()';
  }
}

// dart format on
