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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeRangeFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextRange,
    required TResult Function() previousRange,
    required TResult Function() currentRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextRange value) nextRange,
    required TResult Function(_PreviousRange value) previousRange,
    required TResult Function(_CurrentRange value) currentRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
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
  bool operator ==(dynamic other) {
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
  }) {
    return nextRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
  }) {
    return nextRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
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
  }) {
    return nextRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
  }) {
    return nextRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
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
  bool operator ==(dynamic other) {
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
  }) {
    return previousRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
  }) {
    return previousRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
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
  }) {
    return previousRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
  }) {
    return previousRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
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
  bool operator ==(dynamic other) {
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
  }) {
    return currentRange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nextRange,
    TResult? Function()? previousRange,
    TResult? Function()? currentRange,
  }) {
    return currentRange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextRange,
    TResult Function()? previousRange,
    TResult Function()? currentRange,
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
  }) {
    return currentRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextRange value)? nextRange,
    TResult? Function(_PreviousRange value)? previousRange,
    TResult? Function(_CurrentRange value)? currentRange,
  }) {
    return currentRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextRange value)? nextRange,
    TResult Function(_PreviousRange value)? previousRange,
    TResult Function(_CurrentRange value)? currentRange,
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
mixin _$TimeRangeFilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)
        state,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
        state,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
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
      List<Measurement> measurements,
      TimeUnit timeUnit,
      bool nextable});
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
    Object? measurements = null,
    Object? timeUnit = null,
    Object? nextable = null,
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
      measurements: null == measurements
          ? _value._measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>,
      timeUnit: null == timeUnit
          ? _value.timeUnit
          : timeUnit // ignore: cast_nullable_to_non_nullable
              as TimeUnit,
      nextable: null == nextable
          ? _value.nextable
          : nextable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StateImpl implements _State {
  const _$StateImpl(
      {required this.startDate,
      required this.endDate,
      required final List<Measurement> measurements,
      required this.timeUnit,
      required this.nextable})
      : _measurements = measurements;

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<Measurement> _measurements;
  @override
  List<Measurement> get measurements {
    if (_measurements is EqualUnmodifiableListView) return _measurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measurements);
  }

  @override
  final TimeUnit timeUnit;
  @override
  final bool nextable;

  @override
  String toString() {
    return 'TimeRangeFilterState.state(startDate: $startDate, endDate: $endDate, measurements: $measurements, timeUnit: $timeUnit, nextable: $nextable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._measurements, _measurements) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit) &&
            (identical(other.nextable, nextable) ||
                other.nextable == nextable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate,
      const DeepCollectionEquality().hash(_measurements), timeUnit, nextable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)
        state,
    required TResult Function() loading,
  }) {
    return state(startDate, endDate, measurements, timeUnit, nextable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
        state,
    TResult? Function()? loading,
  }) {
    return state?.call(startDate, endDate, measurements, timeUnit, nextable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
        state,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(startDate, endDate, measurements, timeUnit, nextable);
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
      required final List<Measurement> measurements,
      required final TimeUnit timeUnit,
      required final bool nextable}) = _$StateImpl;

  DateTime get startDate;
  DateTime get endDate;
  List<Measurement> get measurements;
  TimeUnit get timeUnit;
  bool get nextable;
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)
        state,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
        state,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime endDate,
            List<Measurement> measurements, TimeUnit timeUnit, bool nextable)?
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
