// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeRangeFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeFilterEventCopyWith<$Res> {
  factory $TimeRangeFilterEventCopyWith(TimeRangeFilterEvent value,
          $Res Function(TimeRangeFilterEvent) then) =
      _$TimeRangeFilterEventCopyWithImpl<$Res, TimeRangeFilterEvent>;
}

/// @nodoc
class _$TimeRangeFilterEventCopyWithImpl<$Res,
        $Val extends TimeRangeFilterEvent>
    implements $TimeRangeFilterEventCopyWith<$Res> {
  _$TimeRangeFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NextRangeImplCopyWith<$Res> {
  factory _$$NextRangeImplCopyWith(
          _$NextRangeImpl value, $Res Function(_$NextRangeImpl) then) =
      __$$NextRangeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextRangeImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterEventCopyWithImpl<$Res, _$NextRangeImpl>
    implements _$$NextRangeImplCopyWith<$Res> {
  __$$NextRangeImplCopyWithImpl(
      _$NextRangeImpl _value, $Res Function(_$NextRangeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextRangeImpl implements _NextRange {
  const _$NextRangeImpl();

  @override
  String toString() {
    return 'TimeRangeFilterEvent.nextRange()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextRangeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) {
    return nextRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) {
    return nextRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) {
    if (nextRange != null) {
      return nextRange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return nextRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return nextRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (nextRange != null) {
      return nextRange(this);
    }
    return orElse();
  }
}

abstract class _NextRange implements TimeRangeFilterEvent {
  const factory _NextRange() = _$NextRangeImpl;
}

/// @nodoc
abstract class _$$PreviousRangeImplCopyWith<$Res> {
  factory _$$PreviousRangeImplCopyWith(
          _$PreviousRangeImpl value, $Res Function(_$PreviousRangeImpl) then) =
      __$$PreviousRangeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousRangeImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterEventCopyWithImpl<$Res, _$PreviousRangeImpl>
    implements _$$PreviousRangeImplCopyWith<$Res> {
  __$$PreviousRangeImplCopyWithImpl(
      _$PreviousRangeImpl _value, $Res Function(_$PreviousRangeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousRangeImpl implements _PreviousRange {
  const _$PreviousRangeImpl();

  @override
  String toString() {
    return 'TimeRangeFilterEvent.previousRange()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousRangeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) {
    return previousRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) {
    return previousRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) {
    if (previousRange != null) {
      return previousRange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return previousRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return previousRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (previousRange != null) {
      return previousRange(this);
    }
    return orElse();
  }
}

abstract class _PreviousRange implements TimeRangeFilterEvent {
  const factory _PreviousRange() = _$PreviousRangeImpl;
}

/// @nodoc
abstract class _$$CurrentRangeImplCopyWith<$Res> {
  factory _$$CurrentRangeImplCopyWith(
          _$CurrentRangeImpl value, $Res Function(_$CurrentRangeImpl) then) =
      __$$CurrentRangeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentRangeImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterEventCopyWithImpl<$Res, _$CurrentRangeImpl>
    implements _$$CurrentRangeImplCopyWith<$Res> {
  __$$CurrentRangeImplCopyWithImpl(
      _$CurrentRangeImpl _value, $Res Function(_$CurrentRangeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentRangeImpl implements _CurrentRange {
  const _$CurrentRangeImpl();

  @override
  String toString() {
    return 'TimeRangeFilterEvent.currentRange()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CurrentRangeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) {
    return currentRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) {
    return currentRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) {
    if (currentRange != null) {
      return currentRange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return currentRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return currentRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (currentRange != null) {
      return currentRange(this);
    }
    return orElse();
  }
}

abstract class _CurrentRange implements TimeRangeFilterEvent {
  const factory _CurrentRange() = _$CurrentRangeImpl;
}

/// @nodoc
abstract class _$$UpdateDataImplCopyWith<$Res> {
  factory _$$UpdateDataImplCopyWith(
          _$UpdateDataImpl value, $Res Function(_$UpdateDataImpl) then) =
      __$$UpdateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Measurement> newMeasurementList});
}

/// @nodoc
class __$$UpdateDataImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterEventCopyWithImpl<$Res, _$UpdateDataImpl>
    implements _$$UpdateDataImplCopyWith<$Res> {
  __$$UpdateDataImplCopyWithImpl(
      _$UpdateDataImpl _value, $Res Function(_$UpdateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMeasurementList = null,
  }) {
    return _then(_$UpdateDataImpl(
      newMeasurementList: null == newMeasurementList
          ? _value._newMeasurementList
          : newMeasurementList // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
    ));
  }
}

/// @nodoc

class _$UpdateDataImpl implements _UpdateData {
  const _$UpdateDataImpl({required final List<Measurement> newMeasurementList})
      : _newMeasurementList = newMeasurementList;

  final List<Measurement> _newMeasurementList;
  @override
  List<Measurement> get newMeasurementList {
    if (_newMeasurementList is EqualUnmodifiableListView)
      return _newMeasurementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newMeasurementList);
  }

  @override
  String toString() {
    return 'TimeRangeFilterEvent.updateData(newMeasurementList: $newMeasurementList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._newMeasurementList, _newMeasurementList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_newMeasurementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      __$$UpdateDataImplCopyWithImpl<_$UpdateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
    required TResult Function(List<Measurement> newMeasurementList) updateData,
  }) {
    return updateData(newMeasurementList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
    TResult? Function(List<Measurement> newMeasurementList)? updateData,
  }) {
    return updateData?.call(newMeasurementList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    TResult Function(List<Measurement> newMeasurementList)? updateData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(newMeasurementList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return updateData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return updateData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(this);
    }
    return orElse();
  }
}

abstract class _UpdateData implements TimeRangeFilterEvent {
  const factory _UpdateData(
      {required final List<Measurement> newMeasurementList}) = _$UpdateDataImpl;

  List<Measurement> get newMeasurementList;
  @JsonKey(ignore: true)
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimeRangeFilterState {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) state,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_State value)? state,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? state,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeFilterStateCopyWith<$Res> {
  factory $TimeRangeFilterStateCopyWith(TimeRangeFilterState value,
          $Res Function(TimeRangeFilterState) then) =
      _$TimeRangeFilterStateCopyWithImpl<$Res, TimeRangeFilterState>;
}

/// @nodoc
class _$TimeRangeFilterStateCopyWithImpl<$Res,
        $Val extends TimeRangeFilterState>
    implements $TimeRangeFilterStateCopyWith<$Res> {
  _$TimeRangeFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StateImplCopyWith<$Res> {
  factory _$$StateImplCopyWith(
          _$StateImpl value, $Res Function(_$StateImpl) then) =
      __$$StateImplCopyWithImpl<$Res>;
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
class __$$StateImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterStateCopyWithImpl<$Res, _$StateImpl>
    implements _$$StateImplCopyWith<$Res> {
  __$$StateImplCopyWithImpl(
      _$StateImpl _value, $Res Function(_$StateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? filteredMeasurements = null,
    Object? timeUnit = null,
    Object? nextable = null,
    Object? previousMeasurement = freezed,
    Object? nextMeasurement = freezed,
  }) {
    return _then(_$StateImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filteredMeasurements: null == filteredMeasurements
          ? _value._filteredMeasurements
          : filteredMeasurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
      timeUnit: null == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
      nextable: null == nextable
          ? _value.nextable
          : nextable // ignore: cast_nullable_to_non_nullable
              as bool,
      previousMeasurement: freezed == previousMeasurement
          ? _value.previousMeasurement
          : previousMeasurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
      nextMeasurement: freezed == nextMeasurement
          ? _value.nextMeasurement
          : nextMeasurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
    ));
  }
}

/// @nodoc

class _$StateImpl implements _State {
  const _$StateImpl(
      {required this.startDate,
      required this.endDate,
      required final List<Measurement> filteredMeasurements,
      required this.timeUnit,
      required this.nextable,
      required this.previousMeasurement,
      required this.nextMeasurement})
      : _filteredMeasurements = filteredMeasurements;

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<Measurement> _filteredMeasurements;
  @override
  List<Measurement> get filteredMeasurements {
    if (_filteredMeasurements is EqualUnmodifiableListView)
      return _filteredMeasurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredMeasurements);
  }

  @override
  final TimeUnit timeUnit;
  @override
  final bool nextable;
  @override
  final Measurement? previousMeasurement;
  @override
  final Measurement? nextMeasurement;

  @override
  String toString() {
    return 'TimeRangeFilterState.state(startDate: $startDate, endDate: $endDate, filteredMeasurements: $filteredMeasurements, timeUnit: $timeUnit, nextable: $nextable, previousMeasurement: $previousMeasurement, nextMeasurement: $nextMeasurement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);

  @override
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
    return state(startDate, endDate, filteredMeasurements, timeUnit, nextable,
        previousMeasurement, nextMeasurement);
  }

  @override
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
    return state?.call(startDate, endDate, filteredMeasurements, timeUnit,
        nextable, previousMeasurement, nextMeasurement);
  }

  @override
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
    if (state != null) {
      return state(startDate, endDate, filteredMeasurements, timeUnit, nextable,
          previousMeasurement, nextMeasurement);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) state,
    required TResult Function(_Loading value) loading,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_State value)? state,
    TResult? Function(_Loading value)? loading,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? state,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _State implements TimeRangeFilterState {
  const factory _State(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final List<Measurement> filteredMeasurements,
      required final TimeUnit timeUnit,
      required final bool nextable,
      required final Measurement? previousMeasurement,
      required final Measurement? nextMeasurement}) = _$StateImpl;

  DateTime get startDate;
  DateTime get endDate;
  List<Measurement> get filteredMeasurements;
  TimeUnit get timeUnit;
  bool get nextable;
  Measurement? get previousMeasurement;
  Measurement? get nextMeasurement;
  @JsonKey(ignore: true)
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TimeRangeFilterStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TimeRangeFilterState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loading();
  }

  @override
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
    return loading?.call();
  }

  @override
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
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) state,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_State value)? state,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? state,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TimeRangeFilterState {
  const factory _Loading() = _$LoadingImpl;
}
