// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filterchart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterchartEvent {
  List<ChartDisplayModel> get chartDisplayModelList =>
      throw _privateConstructorUsedError;
  DurationsEnum get durationsEnum => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)
        initialData,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)
        filtering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IntialData value) initialData,
    required TResult Function(_Filtering value) filtering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IntialData value)? initialData,
    TResult? Function(_Filtering value)? filtering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IntialData value)? initialData,
    TResult Function(_Filtering value)? filtering,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterchartEventCopyWith<FilterchartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterchartEventCopyWith<$Res> {
  factory $FilterchartEventCopyWith(
          FilterchartEvent value, $Res Function(FilterchartEvent) then) =
      _$FilterchartEventCopyWithImpl<$Res, FilterchartEvent>;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class _$FilterchartEventCopyWithImpl<$Res, $Val extends FilterchartEvent>
    implements $FilterchartEventCopyWith<$Res> {
  _$FilterchartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(_value.copyWith(
      chartDisplayModelList: null == chartDisplayModelList
          ? _value.chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _value.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntialDataImplCopyWith<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  factory _$$IntialDataImplCopyWith(
          _$IntialDataImpl value, $Res Function(_$IntialDataImpl) then) =
      __$$IntialDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate});
}

/// @nodoc
class __$$IntialDataImplCopyWithImpl<$Res>
    extends _$FilterchartEventCopyWithImpl<$Res, _$IntialDataImpl>
    implements _$$IntialDataImplCopyWith<$Res> {
  __$$IntialDataImplCopyWithImpl(
      _$IntialDataImpl _value, $Res Function(_$IntialDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
  }) {
    return _then(_$IntialDataImpl(
      chartDisplayModelList: null == chartDisplayModelList
          ? _value._chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _value.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$IntialDataImpl implements _IntialData {
  const _$IntialDataImpl(
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

  @override
  String toString() {
    return 'FilterchartEvent.initialData(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntialDataImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntialDataImplCopyWith<_$IntialDataImpl> get copyWith =>
      __$$IntialDataImplCopyWithImpl<_$IntialDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)
        initialData,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)
        filtering,
  }) {
    return initialData(chartDisplayModelList, durationsEnum, startDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
  }) {
    return initialData?.call(chartDisplayModelList, durationsEnum, startDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
    required TResult orElse(),
  }) {
    if (initialData != null) {
      return initialData(chartDisplayModelList, durationsEnum, startDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IntialData value) initialData,
    required TResult Function(_Filtering value) filtering,
  }) {
    return initialData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IntialData value)? initialData,
    TResult? Function(_Filtering value)? filtering,
  }) {
    return initialData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IntialData value)? initialData,
    TResult Function(_Filtering value)? filtering,
    required TResult orElse(),
  }) {
    if (initialData != null) {
      return initialData(this);
    }
    return orElse();
  }
}

abstract class _IntialData implements FilterchartEvent {
  const factory _IntialData(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required final DurationsEnum durationsEnum,
      required final DateTime startDate}) = _$IntialDataImpl;

  @override
  List<ChartDisplayModel> get chartDisplayModelList;
  @override
  DurationsEnum get durationsEnum;
  @override
  DateTime get startDate;
  @override
  @JsonKey(ignore: true)
  _$$IntialDataImplCopyWith<_$IntialDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteringImplCopyWith<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  factory _$$FilteringImplCopyWith(
          _$FilteringImpl value, $Res Function(_$FilteringImpl) then) =
      __$$FilteringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate,
      List<String> filterString});
}

/// @nodoc
class __$$FilteringImplCopyWithImpl<$Res>
    extends _$FilterchartEventCopyWithImpl<$Res, _$FilteringImpl>
    implements _$$FilteringImplCopyWith<$Res> {
  __$$FilteringImplCopyWithImpl(
      _$FilteringImpl _value, $Res Function(_$FilteringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
    Object? filterString = null,
  }) {
    return _then(_$FilteringImpl(
      chartDisplayModelList: null == chartDisplayModelList
          ? _value._chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _value.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filterString: null == filterString
          ? _value._filterString
          : filterString // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FilteringImpl implements _Filtering {
  const _$FilteringImpl(
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
  @override
  List<String> get filterString {
    if (_filterString is EqualUnmodifiableListView) return _filterString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterString);
  }

  @override
  String toString() {
    return 'FilterchartEvent.filtering(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filterString: $filterString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteringImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteringImplCopyWith<_$FilteringImpl> get copyWith =>
      __$$FilteringImplCopyWithImpl<_$FilteringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)
        initialData,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)
        filtering,
  }) {
    return filtering(
        chartDisplayModelList, durationsEnum, startDate, filterString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
  }) {
    return filtering?.call(
        chartDisplayModelList, durationsEnum, startDate, filterString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum, DateTime startDate)?
        initialData,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filterString)?
        filtering,
    required TResult orElse(),
  }) {
    if (filtering != null) {
      return filtering(
          chartDisplayModelList, durationsEnum, startDate, filterString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IntialData value) initialData,
    required TResult Function(_Filtering value) filtering,
  }) {
    return filtering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IntialData value)? initialData,
    TResult? Function(_Filtering value)? filtering,
  }) {
    return filtering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IntialData value)? initialData,
    TResult Function(_Filtering value)? filtering,
    required TResult orElse(),
  }) {
    if (filtering != null) {
      return filtering(this);
    }
    return orElse();
  }
}

abstract class _Filtering implements FilterchartEvent {
  const factory _Filtering(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required final DurationsEnum durationsEnum,
      required final DateTime startDate,
      required final List<String> filterString}) = _$FilteringImpl;

  @override
  List<ChartDisplayModel> get chartDisplayModelList;
  @override
  DurationsEnum get durationsEnum;
  @override
  DateTime get startDate;
  List<String> get filterString;
  @override
  @JsonKey(ignore: true)
  _$$FilteringImplCopyWith<_$FilteringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterchartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterchartStateCopyWith<$Res> {
  factory $FilterchartStateCopyWith(
          FilterchartState value, $Res Function(FilterchartState) then) =
      _$FilterchartStateCopyWithImpl<$Res, FilterchartState>;
}

/// @nodoc
class _$FilterchartStateCopyWithImpl<$Res, $Val extends FilterchartState>
    implements $FilterchartStateCopyWith<$Res> {
  _$FilterchartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FilterchartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FilterchartState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)
        data,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Data value) data,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Data value)? data,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FilterchartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ChartDisplayModel> chartDisplayModelList,
      DurationsEnum durationsEnum,
      DateTime startDate,
      List<String> filteredTypes});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$FilterchartStateCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartDisplayModelList = null,
    Object? durationsEnum = null,
    Object? startDate = null,
    Object? filteredTypes = null,
  }) {
    return _then(_$DataImpl(
      chartDisplayModelList: null == chartDisplayModelList
          ? _value._chartDisplayModelList
          : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
              as List<ChartDisplayModel>,
      durationsEnum: null == durationsEnum
          ? _value.durationsEnum
          : durationsEnum // ignore: cast_nullable_to_non_nullable
              as DurationsEnum,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filteredTypes: null == filteredTypes
          ? _value._filteredTypes
          : filteredTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DataImpl implements _Data {
  const _$DataImpl(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required this.durationsEnum,
      required this.startDate,
      required final List<String> filteredTypes})
      : _chartDisplayModelList = chartDisplayModelList,
        _filteredTypes = filteredTypes;

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
  final List<String> _filteredTypes;
  @override
  List<String> get filteredTypes {
    if (_filteredTypes is EqualUnmodifiableListView) return _filteredTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTypes);
  }

  @override
  String toString() {
    return 'FilterchartState.data(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filteredTypes: $filteredTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)
        data,
  }) {
    return data(chartDisplayModelList, durationsEnum, startDate, filteredTypes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
  }) {
    return data?.call(
        chartDisplayModelList, durationsEnum, startDate, filteredTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<ChartDisplayModel> chartDisplayModelList,
            DurationsEnum durationsEnum,
            DateTime startDate,
            List<String> filteredTypes)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(
          chartDisplayModelList, durationsEnum, startDate, filteredTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements FilterchartState {
  const factory _Data(
      {required final List<ChartDisplayModel> chartDisplayModelList,
      required final DurationsEnum durationsEnum,
      required final DateTime startDate,
      required final List<String> filteredTypes}) = _$DataImpl;

  List<ChartDisplayModel> get chartDisplayModelList;
  DurationsEnum get durationsEnum;
  DateTime get startDate;
  List<String> get filteredTypes;
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
