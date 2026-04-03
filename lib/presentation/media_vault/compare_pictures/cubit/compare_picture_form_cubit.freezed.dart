// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_picture_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComparePictureFormState {

 int? get tag; List<int> get targets; DateTime? get firstDate; DateTime? get secondDate; bool get ready;
/// Create a copy of ComparePictureFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparePictureFormStateCopyWith<ComparePictureFormState> get copyWith => _$ComparePictureFormStateCopyWithImpl<ComparePictureFormState>(this as ComparePictureFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparePictureFormState&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other.targets, targets)&&(identical(other.firstDate, firstDate) || other.firstDate == firstDate)&&(identical(other.secondDate, secondDate) || other.secondDate == secondDate)&&(identical(other.ready, ready) || other.ready == ready));
}


@override
int get hashCode => Object.hash(runtimeType,tag,const DeepCollectionEquality().hash(targets),firstDate,secondDate,ready);

@override
String toString() {
  return 'ComparePictureFormState(tag: $tag, targets: $targets, firstDate: $firstDate, secondDate: $secondDate, ready: $ready)';
}


}

/// @nodoc
abstract mixin class $ComparePictureFormStateCopyWith<$Res>  {
  factory $ComparePictureFormStateCopyWith(ComparePictureFormState value, $Res Function(ComparePictureFormState) _then) = _$ComparePictureFormStateCopyWithImpl;
@useResult
$Res call({
 int? tag, List<int> targets, DateTime? firstDate, DateTime? secondDate, bool ready
});




}
/// @nodoc
class _$ComparePictureFormStateCopyWithImpl<$Res>
    implements $ComparePictureFormStateCopyWith<$Res> {
  _$ComparePictureFormStateCopyWithImpl(this._self, this._then);

  final ComparePictureFormState _self;
  final $Res Function(ComparePictureFormState) _then;

/// Create a copy of ComparePictureFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? targets = null,Object? firstDate = freezed,Object? secondDate = freezed,Object? ready = null,}) {
  return _then(_self.copyWith(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as int?,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as List<int>,firstDate: freezed == firstDate ? _self.firstDate : firstDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondDate: freezed == secondDate ? _self.secondDate : secondDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparePictureFormState].
extension ComparePictureFormStatePatterns on ComparePictureFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComparePictureFormStateData value)?  state,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComparePictureFormStateData() when state != null:
return state(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComparePictureFormStateData value)  state,}){
final _that = this;
switch (_that) {
case ComparePictureFormStateData():
return state(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComparePictureFormStateData value)?  state,}){
final _that = this;
switch (_that) {
case ComparePictureFormStateData() when state != null:
return state(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? tag,  List<int> targets,  DateTime? firstDate,  DateTime? secondDate,  bool ready)?  state,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComparePictureFormStateData() when state != null:
return state(_that.tag,_that.targets,_that.firstDate,_that.secondDate,_that.ready);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? tag,  List<int> targets,  DateTime? firstDate,  DateTime? secondDate,  bool ready)  state,}) {final _that = this;
switch (_that) {
case ComparePictureFormStateData():
return state(_that.tag,_that.targets,_that.firstDate,_that.secondDate,_that.ready);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? tag,  List<int> targets,  DateTime? firstDate,  DateTime? secondDate,  bool ready)?  state,}) {final _that = this;
switch (_that) {
case ComparePictureFormStateData() when state != null:
return state(_that.tag,_that.targets,_that.firstDate,_that.secondDate,_that.ready);case _:
  return null;

}
}

}

/// @nodoc


class ComparePictureFormStateData implements ComparePictureFormState {
  const ComparePictureFormStateData({required this.tag, required final  List<int> targets, required this.firstDate, required this.secondDate, required this.ready}): _targets = targets;
  

@override final  int? tag;
 final  List<int> _targets;
@override List<int> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}

@override final  DateTime? firstDate;
@override final  DateTime? secondDate;
@override final  bool ready;

/// Create a copy of ComparePictureFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparePictureFormStateDataCopyWith<ComparePictureFormStateData> get copyWith => _$ComparePictureFormStateDataCopyWithImpl<ComparePictureFormStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparePictureFormStateData&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other._targets, _targets)&&(identical(other.firstDate, firstDate) || other.firstDate == firstDate)&&(identical(other.secondDate, secondDate) || other.secondDate == secondDate)&&(identical(other.ready, ready) || other.ready == ready));
}


@override
int get hashCode => Object.hash(runtimeType,tag,const DeepCollectionEquality().hash(_targets),firstDate,secondDate,ready);

@override
String toString() {
  return 'ComparePictureFormState.state(tag: $tag, targets: $targets, firstDate: $firstDate, secondDate: $secondDate, ready: $ready)';
}


}

/// @nodoc
abstract mixin class $ComparePictureFormStateDataCopyWith<$Res> implements $ComparePictureFormStateCopyWith<$Res> {
  factory $ComparePictureFormStateDataCopyWith(ComparePictureFormStateData value, $Res Function(ComparePictureFormStateData) _then) = _$ComparePictureFormStateDataCopyWithImpl;
@override @useResult
$Res call({
 int? tag, List<int> targets, DateTime? firstDate, DateTime? secondDate, bool ready
});




}
/// @nodoc
class _$ComparePictureFormStateDataCopyWithImpl<$Res>
    implements $ComparePictureFormStateDataCopyWith<$Res> {
  _$ComparePictureFormStateDataCopyWithImpl(this._self, this._then);

  final ComparePictureFormStateData _self;
  final $Res Function(ComparePictureFormStateData) _then;

/// Create a copy of ComparePictureFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? targets = null,Object? firstDate = freezed,Object? secondDate = freezed,Object? ready = null,}) {
  return _then(ComparePictureFormStateData(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as int?,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<int>,firstDate: freezed == firstDate ? _self.firstDate : firstDate // ignore: cast_nullable_to_non_nullable
as DateTime?,secondDate: freezed == secondDate ? _self.secondDate : secondDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
