// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filterchart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterchartEvent {
  List<ChartDisplayModel> get chartDisplayModelList;
  DurationsEnum get durationsEnum;
  DateTime get startDate;

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterchartEventCopyWith<FilterchartEvent> get copyWith =>
      _$FilterchartEventCopyWithImpl<FilterchartEvent>(
          this as FilterchartEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterchartEvent &&
            const DeepCollectionEquality()
                .equals(other.chartDisplayModelList, chartDisplayModelList) &&
            (identical(other.durationsEnum, durationsEnum) ||
                other.durationsEnum == durationsEnum) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chartDisplayModelList),
      durationsEnum,
      startDate);

  @override
  String toString() {
    return 'FilterchartEvent(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class $FilterchartEventCopyWith<$Res> {
  factory $FilterchartEventCopyWith(
          FilterchartEvent value, $Res Function(FilterchartEvent) _then) =
      _$FilterchartEventCopyWithImpl;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class _$FilterchartEventCopyWithImpl<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  _$FilterchartEventCopyWithImpl(this._self, this._then);

  final FilterchartEvent _self;
  final $Res Function(FilterchartEvent) _then;

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(_self.copyWith(
      chartDisplayModelList: null == chartDisplayModelList
          ? _self.chartDisplayModelList
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

class _IntialData implements FilterchartEvent {
  const _IntialData(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate})
      : _chartDisplayModelList = chartDisplayModelList;

  final List<ChartDisplayModel> _chartDisplayModelList;
  @override
  List<ChartDisplayModel> get chartDisplayModelList {
    if (_chartDisplayModelList is EqualUnmodifiableListView)
      return _chartDisplayModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartDisplayModelList);
  }

  @override
  final DurationsEnum durationsEnum;
  @override
  final DateTime startDate;

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IntialDataCopyWith<_IntialData> get copyWith =>
      __$IntialDataCopyWithImpl<_IntialData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IntialData &&
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
    return 'FilterchartEvent.initialData(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class _$IntialDataCopyWith<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  factory _$IntialDataCopyWith(
          _IntialData value, $Res Function(_IntialData) _then) =
      __$IntialDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class __$IntialDataCopyWithImpl<$Res> implements _$IntialDataCopyWith<$Res> {
  __$IntialDataCopyWithImpl(this._self, this._then);

  final _IntialData _self;
  final $Res Function(_IntialData) _then;

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(_IntialData(
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

class _Filtering implements FilterchartEvent {
  const _Filtering(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate,
      required final List<String> filterString})
      : _chartDisplayModelList = chartDisplayModelList,
        _filterString = filterString;

  final List<ChartDisplayModel> _chartDisplayModelList;
  @override
  List<ChartDisplayModel> get chartDisplayModelList {
    if (_chartDisplayModelList is EqualUnmodifiableListView)
      return _chartDisplayModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartDisplayModelList);
  }

  @override
  final DurationsEnum durationsEnum;
  @override
  final DateTime startDate;
  final List<String> _filterString;
  List<String> get filterString {
    if (_filterString is EqualUnmodifiableListView) return _filterString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterString);
  }

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilteringCopyWith<_Filtering> get copyWith =>
      __$FilteringCopyWithImpl<_Filtering>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filtering &&
            const DeepCollectionEquality()
                .equals(other._chartDisplayModelList, _chartDisplayModelList) &&
            (identical(other.durationsEnum, durationsEnum) ||
                other.durationsEnum == durationsEnum) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality()
                .equals(other._filterString, _filterString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chartDisplayModelList),
      durationsEnum,
      startDate,
      const DeepCollectionEquality().hash(_filterString));

  @override
  String toString() {
    return 'FilterchartEvent.filtering(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filterString: $filterString)';
  }
}

/// @nodoc
abstract mixin class _$FilteringCopyWith<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  factory _$FilteringCopyWith(
          _Filtering value, $Res Function(_Filtering) _then) =
      __$FilteringCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate,
      List<String> filterString});
}

/// @nodoc
class __$FilteringCopyWithImpl<$Res> implements _$FilteringCopyWith<$Res> {
  __$FilteringCopyWithImpl(this._self, this._then);

  final _Filtering _self;
  final $Res Function(_Filtering) _then;

  /// Create a copy of FilterchartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
    Object? filterString = null,
  }) {
    return _then(_Filtering(
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
      filterString: null == filterString
          ? _self._filterString
          : filterString // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$FilterchartState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FilterchartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FilterchartState()';
  }
}

/// @nodoc
class $FilterchartStateCopyWith<$Res> {
  $FilterchartStateCopyWith(
      FilterchartState _, $Res Function(FilterchartState) __);
}

/// @nodoc

class _Initial implements FilterchartState {
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
    return 'FilterchartState.initial()';
  }
}

/// @nodoc

class _Data implements FilterchartState {
  const _Data(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate,
      required final List<String> filteredTypes})
      : _chartDisplayModelList = chartDisplayModelList,
        _filteredTypes = filteredTypes;

  final List<ChartDisplayModel> _chartDisplayModelList;
  List<ChartDisplayModel> get chartDisplayModelList {
    if (_chartDisplayModelList is EqualUnmodifiableListView)
      return _chartDisplayModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartDisplayModelList);
  }

  final DurationsEnum durationsEnum;
  final DateTime startDate;
  final List<String> _filteredTypes;
  List<String> get filteredTypes {
    if (_filteredTypes is EqualUnmodifiableListView) return _filteredTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTypes);
  }

  /// Create a copy of FilterchartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            const DeepCollectionEquality()
                .equals(other._chartDisplayModelList, _chartDisplayModelList) &&
            (identical(other.durationsEnum, durationsEnum) ||
                other.durationsEnum == durationsEnum) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality()
                .equals(other._filteredTypes, _filteredTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chartDisplayModelList),
      durationsEnum,
      startDate,
      const DeepCollectionEquality().hash(_filteredTypes));

  @override
  String toString() {
    return 'FilterchartState.data(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filteredTypes: $filteredTypes)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res>
    implements $FilterchartStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate,
      List<String> filteredTypes});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of FilterchartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
    Object? filteredTypes = null,
  }) {
    return _then(_Data(
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
      filteredTypes: null == filteredTypes
          ? _self._filteredTypes
          : filteredTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
