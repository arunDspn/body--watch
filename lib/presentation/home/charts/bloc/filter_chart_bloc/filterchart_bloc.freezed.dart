// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 List<ChartDisplayModel> get chartDisplayModelList; DurationsEnum get durationsEnum; DateTime get startDate;
/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterchartEventCopyWith<FilterchartEvent> get copyWith => _$FilterchartEventCopyWithImpl<FilterchartEvent>(this as FilterchartEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterchartEvent&&const DeepCollectionEquality().equals(other.chartDisplayModelList, chartDisplayModelList)&&(identical(other.durationsEnum, durationsEnum) || other.durationsEnum == durationsEnum)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chartDisplayModelList),durationsEnum,startDate);

@override
String toString() {
  return 'FilterchartEvent(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $FilterchartEventCopyWith<$Res>  {
  factory $FilterchartEventCopyWith(FilterchartEvent value, $Res Function(FilterchartEvent) _then) = _$FilterchartEventCopyWithImpl;
@useResult
$Res call({
 List<ChartDisplayModel> chartDisplayModelList, DurationsEnum durationsEnum, DateTime startDate
});




}
/// @nodoc
class _$FilterchartEventCopyWithImpl<$Res>
    implements $FilterchartEventCopyWith<$Res> {
  _$FilterchartEventCopyWithImpl(this._self, this._then);

  final FilterchartEvent _self;
  final $Res Function(FilterchartEvent) _then;

/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chartDisplayModelList = null,Object? durationsEnum = null,Object? startDate = null,}) {
  return _then(_self.copyWith(
chartDisplayModelList: null == chartDisplayModelList ? _self.chartDisplayModelList : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
as List<ChartDisplayModel>,durationsEnum: null == durationsEnum ? _self.durationsEnum : durationsEnum // ignore: cast_nullable_to_non_nullable
as DurationsEnum,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterchartEvent].
extension FilterchartEventPatterns on FilterchartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IntialData value)?  initialData,TResult Function( _Filtering value)?  filtering,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntialData() when initialData != null:
return initialData(_that);case _Filtering() when filtering != null:
return filtering(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IntialData value)  initialData,required TResult Function( _Filtering value)  filtering,}){
final _that = this;
switch (_that) {
case _IntialData():
return initialData(_that);case _Filtering():
return filtering(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IntialData value)?  initialData,TResult? Function( _Filtering value)?  filtering,}){
final _that = this;
switch (_that) {
case _IntialData() when initialData != null:
return initialData(_that);case _Filtering() when filtering != null:
return filtering(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate)?  initialData,TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filterString)?  filtering,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntialData() when initialData != null:
return initialData(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate);case _Filtering() when filtering != null:
return filtering(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filterString);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate)  initialData,required TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filterString)  filtering,}) {final _that = this;
switch (_that) {
case _IntialData():
return initialData(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate);case _Filtering():
return filtering(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filterString);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate)?  initialData,TResult? Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filterString)?  filtering,}) {final _that = this;
switch (_that) {
case _IntialData() when initialData != null:
return initialData(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate);case _Filtering() when filtering != null:
return filtering(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filterString);case _:
  return null;

}
}

}

/// @nodoc


class _IntialData implements FilterchartEvent {
  const _IntialData({required final  List<ChartDisplayModel> chartDisplayModelList, required this.durationsEnum, required this.startDate}): _chartDisplayModelList = chartDisplayModelList;
  

 final  List<ChartDisplayModel> _chartDisplayModelList;
@override List<ChartDisplayModel> get chartDisplayModelList {
  if (_chartDisplayModelList is EqualUnmodifiableListView) return _chartDisplayModelList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chartDisplayModelList);
}

@override final  DurationsEnum durationsEnum;
@override final  DateTime startDate;

/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntialDataCopyWith<_IntialData> get copyWith => __$IntialDataCopyWithImpl<_IntialData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntialData&&const DeepCollectionEquality().equals(other._chartDisplayModelList, _chartDisplayModelList)&&(identical(other.durationsEnum, durationsEnum) || other.durationsEnum == durationsEnum)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chartDisplayModelList),durationsEnum,startDate);

@override
String toString() {
  return 'FilterchartEvent.initialData(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$IntialDataCopyWith<$Res> implements $FilterchartEventCopyWith<$Res> {
  factory _$IntialDataCopyWith(_IntialData value, $Res Function(_IntialData) _then) = __$IntialDataCopyWithImpl;
@override @useResult
$Res call({
 List<ChartDisplayModel> chartDisplayModelList, DurationsEnum durationsEnum, DateTime startDate
});




}
/// @nodoc
class __$IntialDataCopyWithImpl<$Res>
    implements _$IntialDataCopyWith<$Res> {
  __$IntialDataCopyWithImpl(this._self, this._then);

  final _IntialData _self;
  final $Res Function(_IntialData) _then;

/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chartDisplayModelList = null,Object? durationsEnum = null,Object? startDate = null,}) {
  return _then(_IntialData(
chartDisplayModelList: null == chartDisplayModelList ? _self._chartDisplayModelList : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
as List<ChartDisplayModel>,durationsEnum: null == durationsEnum ? _self.durationsEnum : durationsEnum // ignore: cast_nullable_to_non_nullable
as DurationsEnum,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _Filtering implements FilterchartEvent {
  const _Filtering({required final  List<ChartDisplayModel> chartDisplayModelList, required this.durationsEnum, required this.startDate, required final  List<String> filterString}): _chartDisplayModelList = chartDisplayModelList,_filterString = filterString;
  

 final  List<ChartDisplayModel> _chartDisplayModelList;
@override List<ChartDisplayModel> get chartDisplayModelList {
  if (_chartDisplayModelList is EqualUnmodifiableListView) return _chartDisplayModelList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chartDisplayModelList);
}

@override final  DurationsEnum durationsEnum;
@override final  DateTime startDate;
 final  List<String> _filterString;
 List<String> get filterString {
  if (_filterString is EqualUnmodifiableListView) return _filterString;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filterString);
}


/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilteringCopyWith<_Filtering> get copyWith => __$FilteringCopyWithImpl<_Filtering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Filtering&&const DeepCollectionEquality().equals(other._chartDisplayModelList, _chartDisplayModelList)&&(identical(other.durationsEnum, durationsEnum) || other.durationsEnum == durationsEnum)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&const DeepCollectionEquality().equals(other._filterString, _filterString));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chartDisplayModelList),durationsEnum,startDate,const DeepCollectionEquality().hash(_filterString));

@override
String toString() {
  return 'FilterchartEvent.filtering(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filterString: $filterString)';
}


}

/// @nodoc
abstract mixin class _$FilteringCopyWith<$Res> implements $FilterchartEventCopyWith<$Res> {
  factory _$FilteringCopyWith(_Filtering value, $Res Function(_Filtering) _then) = __$FilteringCopyWithImpl;
@override @useResult
$Res call({
 List<ChartDisplayModel> chartDisplayModelList, DurationsEnum durationsEnum, DateTime startDate, List<String> filterString
});




}
/// @nodoc
class __$FilteringCopyWithImpl<$Res>
    implements _$FilteringCopyWith<$Res> {
  __$FilteringCopyWithImpl(this._self, this._then);

  final _Filtering _self;
  final $Res Function(_Filtering) _then;

/// Create a copy of FilterchartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chartDisplayModelList = null,Object? durationsEnum = null,Object? startDate = null,Object? filterString = null,}) {
  return _then(_Filtering(
chartDisplayModelList: null == chartDisplayModelList ? _self._chartDisplayModelList : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
as List<ChartDisplayModel>,durationsEnum: null == durationsEnum ? _self.durationsEnum : durationsEnum // ignore: cast_nullable_to_non_nullable
as DurationsEnum,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,filterString: null == filterString ? _self._filterString : filterString // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$FilterchartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterchartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterchartState()';
}


}

/// @nodoc
class $FilterchartStateCopyWith<$Res>  {
$FilterchartStateCopyWith(FilterchartState _, $Res Function(FilterchartState) __);
}


/// Adds pattern-matching-related methods to [FilterchartState].
extension FilterchartStatePatterns on FilterchartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FilterchartStateInitial value)?  initial,TResult Function( FilterchartStateData value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FilterchartStateInitial() when initial != null:
return initial(_that);case FilterchartStateData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FilterchartStateInitial value)  initial,required TResult Function( FilterchartStateData value)  data,}){
final _that = this;
switch (_that) {
case FilterchartStateInitial():
return initial(_that);case FilterchartStateData():
return data(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FilterchartStateInitial value)?  initial,TResult? Function( FilterchartStateData value)?  data,}){
final _that = this;
switch (_that) {
case FilterchartStateInitial() when initial != null:
return initial(_that);case FilterchartStateData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filteredTypes)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FilterchartStateInitial() when initial != null:
return initial();case FilterchartStateData() when data != null:
return data(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filteredTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filteredTypes)  data,}) {final _that = this;
switch (_that) {
case FilterchartStateInitial():
return initial();case FilterchartStateData():
return data(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filteredTypes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<ChartDisplayModel> chartDisplayModelList,  DurationsEnum durationsEnum,  DateTime startDate,  List<String> filteredTypes)?  data,}) {final _that = this;
switch (_that) {
case FilterchartStateInitial() when initial != null:
return initial();case FilterchartStateData() when data != null:
return data(_that.chartDisplayModelList,_that.durationsEnum,_that.startDate,_that.filteredTypes);case _:
  return null;

}
}

}

/// @nodoc


class FilterchartStateInitial implements FilterchartState {
  const FilterchartStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterchartStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FilterchartState.initial()';
}


}




/// @nodoc


class FilterchartStateData implements FilterchartState {
  const FilterchartStateData({required final  List<ChartDisplayModel> chartDisplayModelList, required this.durationsEnum, required this.startDate, required final  List<String> filteredTypes}): _chartDisplayModelList = chartDisplayModelList,_filteredTypes = filteredTypes;
  

 final  List<ChartDisplayModel> _chartDisplayModelList;
 List<ChartDisplayModel> get chartDisplayModelList {
  if (_chartDisplayModelList is EqualUnmodifiableListView) return _chartDisplayModelList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chartDisplayModelList);
}

 final  DurationsEnum durationsEnum;
 final  DateTime startDate;
 final  List<String> _filteredTypes;
 List<String> get filteredTypes {
  if (_filteredTypes is EqualUnmodifiableListView) return _filteredTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTypes);
}


/// Create a copy of FilterchartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterchartStateDataCopyWith<FilterchartStateData> get copyWith => _$FilterchartStateDataCopyWithImpl<FilterchartStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterchartStateData&&const DeepCollectionEquality().equals(other._chartDisplayModelList, _chartDisplayModelList)&&(identical(other.durationsEnum, durationsEnum) || other.durationsEnum == durationsEnum)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&const DeepCollectionEquality().equals(other._filteredTypes, _filteredTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chartDisplayModelList),durationsEnum,startDate,const DeepCollectionEquality().hash(_filteredTypes));

@override
String toString() {
  return 'FilterchartState.data(chartDisplayModelList: $chartDisplayModelList, durationsEnum: $durationsEnum, startDate: $startDate, filteredTypes: $filteredTypes)';
}


}

/// @nodoc
abstract mixin class $FilterchartStateDataCopyWith<$Res> implements $FilterchartStateCopyWith<$Res> {
  factory $FilterchartStateDataCopyWith(FilterchartStateData value, $Res Function(FilterchartStateData) _then) = _$FilterchartStateDataCopyWithImpl;
@useResult
$Res call({
 List<ChartDisplayModel> chartDisplayModelList, DurationsEnum durationsEnum, DateTime startDate, List<String> filteredTypes
});




}
/// @nodoc
class _$FilterchartStateDataCopyWithImpl<$Res>
    implements $FilterchartStateDataCopyWith<$Res> {
  _$FilterchartStateDataCopyWithImpl(this._self, this._then);

  final FilterchartStateData _self;
  final $Res Function(FilterchartStateData) _then;

/// Create a copy of FilterchartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chartDisplayModelList = null,Object? durationsEnum = null,Object? startDate = null,Object? filteredTypes = null,}) {
  return _then(FilterchartStateData(
chartDisplayModelList: null == chartDisplayModelList ? _self._chartDisplayModelList : chartDisplayModelList // ignore: cast_nullable_to_non_nullable
as List<ChartDisplayModel>,durationsEnum: null == durationsEnum ? _self.durationsEnum : durationsEnum // ignore: cast_nullable_to_non_nullable
as DurationsEnum,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,filteredTypes: null == filteredTypes ? _self._filteredTypes : filteredTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
