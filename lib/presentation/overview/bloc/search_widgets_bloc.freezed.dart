// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_widgets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchWidgetsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchWidgetsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchWidgetsEvent()';
}


}

/// @nodoc
class $SearchWidgetsEventCopyWith<$Res>  {
$SearchWidgetsEventCopyWith(SearchWidgetsEvent _, $Res Function(SearchWidgetsEvent) __);
}


/// Adds pattern-matching-related methods to [SearchWidgetsEvent].
extension SearchWidgetsEventPatterns on SearchWidgetsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddData value)?  addData,TResult Function( _KeyChanged value)?  keyChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddData() when addData != null:
return addData(_that);case _KeyChanged() when keyChanged != null:
return keyChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddData value)  addData,required TResult Function( _KeyChanged value)  keyChanged,}){
final _that = this;
switch (_that) {
case _AddData():
return addData(_that);case _KeyChanged():
return keyChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddData value)?  addData,TResult? Function( _KeyChanged value)?  keyChanged,}){
final _that = this;
switch (_that) {
case _AddData() when addData != null:
return addData(_that);case _KeyChanged() when keyChanged != null:
return keyChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<LatestMeasurementDisplayModel> list)?  addData,TResult Function( String key)?  keyChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddData() when addData != null:
return addData(_that.list);case _KeyChanged() when keyChanged != null:
return keyChanged(_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<LatestMeasurementDisplayModel> list)  addData,required TResult Function( String key)  keyChanged,}) {final _that = this;
switch (_that) {
case _AddData():
return addData(_that.list);case _KeyChanged():
return keyChanged(_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<LatestMeasurementDisplayModel> list)?  addData,TResult? Function( String key)?  keyChanged,}) {final _that = this;
switch (_that) {
case _AddData() when addData != null:
return addData(_that.list);case _KeyChanged() when keyChanged != null:
return keyChanged(_that.key);case _:
  return null;

}
}

}

/// @nodoc


class _AddData implements SearchWidgetsEvent {
  const _AddData({required final  List<LatestMeasurementDisplayModel> list}): _list = list;
  

 final  List<LatestMeasurementDisplayModel> _list;
 List<LatestMeasurementDisplayModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of SearchWidgetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDataCopyWith<_AddData> get copyWith => __$AddDataCopyWithImpl<_AddData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddData&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'SearchWidgetsEvent.addData(list: $list)';
}


}

/// @nodoc
abstract mixin class _$AddDataCopyWith<$Res> implements $SearchWidgetsEventCopyWith<$Res> {
  factory _$AddDataCopyWith(_AddData value, $Res Function(_AddData) _then) = __$AddDataCopyWithImpl;
@useResult
$Res call({
 List<LatestMeasurementDisplayModel> list
});




}
/// @nodoc
class __$AddDataCopyWithImpl<$Res>
    implements _$AddDataCopyWith<$Res> {
  __$AddDataCopyWithImpl(this._self, this._then);

  final _AddData _self;
  final $Res Function(_AddData) _then;

/// Create a copy of SearchWidgetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_AddData(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<LatestMeasurementDisplayModel>,
  ));
}


}

/// @nodoc


class _KeyChanged implements SearchWidgetsEvent {
  const _KeyChanged(this.key);
  

 final  String key;

/// Create a copy of SearchWidgetsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyChangedCopyWith<_KeyChanged> get copyWith => __$KeyChangedCopyWithImpl<_KeyChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyChanged&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'SearchWidgetsEvent.keyChanged(key: $key)';
}


}

/// @nodoc
abstract mixin class _$KeyChangedCopyWith<$Res> implements $SearchWidgetsEventCopyWith<$Res> {
  factory _$KeyChangedCopyWith(_KeyChanged value, $Res Function(_KeyChanged) _then) = __$KeyChangedCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class __$KeyChangedCopyWithImpl<$Res>
    implements _$KeyChangedCopyWith<$Res> {
  __$KeyChangedCopyWithImpl(this._self, this._then);

  final _KeyChanged _self;
  final $Res Function(_KeyChanged) _then;

/// Create a copy of SearchWidgetsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(_KeyChanged(
null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SearchWidgetsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchWidgetsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchWidgetsState()';
}


}

/// @nodoc
class $SearchWidgetsStateCopyWith<$Res>  {
$SearchWidgetsStateCopyWith(SearchWidgetsState _, $Res Function(SearchWidgetsState) __);
}


/// Adds pattern-matching-related methods to [SearchWidgetsState].
extension SearchWidgetsStatePatterns on SearchWidgetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchWidgetsStateLoading value)?  loading,TResult Function( SearchWidgetsStateLoaded value)?  loaded,TResult Function( SearchWidgetsStateFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchWidgetsStateLoading() when loading != null:
return loading(_that);case SearchWidgetsStateLoaded() when loaded != null:
return loaded(_that);case SearchWidgetsStateFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchWidgetsStateLoading value)  loading,required TResult Function( SearchWidgetsStateLoaded value)  loaded,required TResult Function( SearchWidgetsStateFailed value)  failed,}){
final _that = this;
switch (_that) {
case SearchWidgetsStateLoading():
return loading(_that);case SearchWidgetsStateLoaded():
return loaded(_that);case SearchWidgetsStateFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchWidgetsStateLoading value)?  loading,TResult? Function( SearchWidgetsStateLoaded value)?  loaded,TResult? Function( SearchWidgetsStateFailed value)?  failed,}){
final _that = this;
switch (_that) {
case SearchWidgetsStateLoading() when loading != null:
return loading(_that);case SearchWidgetsStateLoaded() when loaded != null:
return loaded(_that);case SearchWidgetsStateFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<LatestMeasurementDisplayModel> lists)?  loaded,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchWidgetsStateLoading() when loading != null:
return loading();case SearchWidgetsStateLoaded() when loaded != null:
return loaded(_that.lists);case SearchWidgetsStateFailed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<LatestMeasurementDisplayModel> lists)  loaded,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case SearchWidgetsStateLoading():
return loading();case SearchWidgetsStateLoaded():
return loaded(_that.lists);case SearchWidgetsStateFailed():
return failed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<LatestMeasurementDisplayModel> lists)?  loaded,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case SearchWidgetsStateLoading() when loading != null:
return loading();case SearchWidgetsStateLoaded() when loaded != null:
return loaded(_that.lists);case SearchWidgetsStateFailed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class SearchWidgetsStateLoading implements SearchWidgetsState {
  const SearchWidgetsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchWidgetsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchWidgetsState.loading()';
}


}




/// @nodoc


class SearchWidgetsStateLoaded implements SearchWidgetsState {
  const SearchWidgetsStateLoaded({required final  List<LatestMeasurementDisplayModel> lists}): _lists = lists;
  

 final  List<LatestMeasurementDisplayModel> _lists;
 List<LatestMeasurementDisplayModel> get lists {
  if (_lists is EqualUnmodifiableListView) return _lists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lists);
}


/// Create a copy of SearchWidgetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchWidgetsStateLoadedCopyWith<SearchWidgetsStateLoaded> get copyWith => _$SearchWidgetsStateLoadedCopyWithImpl<SearchWidgetsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchWidgetsStateLoaded&&const DeepCollectionEquality().equals(other._lists, _lists));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lists));

@override
String toString() {
  return 'SearchWidgetsState.loaded(lists: $lists)';
}


}

/// @nodoc
abstract mixin class $SearchWidgetsStateLoadedCopyWith<$Res> implements $SearchWidgetsStateCopyWith<$Res> {
  factory $SearchWidgetsStateLoadedCopyWith(SearchWidgetsStateLoaded value, $Res Function(SearchWidgetsStateLoaded) _then) = _$SearchWidgetsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<LatestMeasurementDisplayModel> lists
});




}
/// @nodoc
class _$SearchWidgetsStateLoadedCopyWithImpl<$Res>
    implements $SearchWidgetsStateLoadedCopyWith<$Res> {
  _$SearchWidgetsStateLoadedCopyWithImpl(this._self, this._then);

  final SearchWidgetsStateLoaded _self;
  final $Res Function(SearchWidgetsStateLoaded) _then;

/// Create a copy of SearchWidgetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lists = null,}) {
  return _then(SearchWidgetsStateLoaded(
lists: null == lists ? _self._lists : lists // ignore: cast_nullable_to_non_nullable
as List<LatestMeasurementDisplayModel>,
  ));
}


}

/// @nodoc


class SearchWidgetsStateFailed implements SearchWidgetsState {
  const SearchWidgetsStateFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchWidgetsStateFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchWidgetsState.failed()';
}


}




// dart format on
