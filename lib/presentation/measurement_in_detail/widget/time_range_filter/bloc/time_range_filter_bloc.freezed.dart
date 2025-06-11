// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
