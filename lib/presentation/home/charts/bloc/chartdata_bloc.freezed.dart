// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chartdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartdataEvent {
  DurationsEnum get duration;
  AppPreferences get appPreferences;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartdataEventCopyWith<ChartdataEvent> get copyWith =>
      _$ChartdataEventCopyWithImpl<ChartdataEvent>(
          this as ChartdataEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartdataEvent &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, appPreferences);

  @override
  String toString() {
    return 'ChartdataEvent(duration: $duration, appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class $ChartdataEventCopyWith<$Res> {
  factory $ChartdataEventCopyWith(
          ChartdataEvent value, $Res Function(ChartdataEvent) _then) =
      _$ChartdataEventCopyWithImpl;
  @useResult
  $Res call({DurationsEnum duration, AppPreferences appPreferences});
}

/// @nodoc
class _$ChartdataEventCopyWithImpl<$Res>
    implements $ChartdataEventCopyWith<$Res> {
  _$ChartdataEventCopyWithImpl(this._self, this._then);

  final ChartdataEvent _self;
  final $Res Function(ChartdataEvent) _then;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? appPreferences = null,
  }) {
    return _then(_self.copyWith(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc

class _FetchData implements ChartdataEvent {
  const _FetchData({required this.duration, required this.appPreferences});

  @override
  final DurationsEnum duration;
  @override
  final AppPreferences appPreferences;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchDataCopyWith<_FetchData> get copyWith =>
      __$FetchDataCopyWithImpl<_FetchData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchData &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.appPreferences, appPreferences) ||
                other.appPreferences == appPreferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, appPreferences);

  @override
  String toString() {
    return 'ChartdataEvent.fetchData(duration: $duration, appPreferences: $appPreferences)';
  }
}

/// @nodoc
abstract mixin class _$FetchDataCopyWith<$Res>
    implements $ChartdataEventCopyWith<$Res> {
  factory _$FetchDataCopyWith(
          _FetchData value, $Res Function(_FetchData) _then) =
      __$FetchDataCopyWithImpl;
  @override
  @useResult
  $Res call({DurationsEnum duration, AppPreferences appPreferences});
}

/// @nodoc
class __$FetchDataCopyWithImpl<$Res> implements _$FetchDataCopyWith<$Res> {
  __$FetchDataCopyWithImpl(this._self, this._then);

  final _FetchData _self;
  final $Res Function(_FetchData) _then;

  /// Create a copy of ChartdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duration = null,
    Object? appPreferences = null,
  }) {
    return _then(_FetchData(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      appPreferences: null == appPreferences
          ? _self.appPreferences
          : appPreferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }
}

/// @nodoc
mixin _$ChartdataState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChartdataState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState()';
  }
}

/// @nodoc
class $ChartdataStateCopyWith<$Res> {
  $ChartdataStateCopyWith(ChartdataState _, $Res Function(ChartdataState) __);
}

/// @nodoc

class _Initial implements ChartdataState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState.initial()';
  }
}

/// @nodoc

class _Loading implements ChartdataState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChartdataState.loading()';
  }
}

/// @nodoc

class _Success implements ChartdataState {
  const _Success(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate})
      : _chartDisplayModelList = chartDisplayModelList;

  final List<ChartDisplayModel> _chartDisplayModelList;
  List<ChartDisplayModel> get chartDisplayModelList {
    if (_chartDisplayModelList is EqualUnmodifiableListView)
      return _chartDisplayModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartDisplayModelList);
  }

  final DurationsEnum durationsEnum;
  final DateTime startDate;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality()
                .equals(other._chartDisplayModelList, _chartDisplayModelList) &&
            (identical(other.durationsEnum, durationsEnum) ||
                other.durationsEnum == durationsEnum) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chartDisplayModelList),
      durationsEnum,
      startDate);

  @override
  String toString() {
    return 'ChartdataState.success(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $ChartdataStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(_Success(
      chartDisplayModelList: null == chartDisplayModelList
          ? _self._chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _self.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _Failed implements ChartdataState {
  const _Failed({required this.cause});

  final String cause;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @override
  String toString() {
    return 'ChartdataState.failed(cause: $cause)';
  }
}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res>
    implements $ChartdataStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) =
      __$FailedCopyWithImpl;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

  /// Create a copy of ChartdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
  }) {
    return _then(_Failed(
      cause: null == cause
          ? _self.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
