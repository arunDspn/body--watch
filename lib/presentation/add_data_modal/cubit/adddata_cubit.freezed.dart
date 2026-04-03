// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adddata_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdddataState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdddataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdddataState()';
}


}

/// @nodoc
class $AdddataStateCopyWith<$Res>  {
$AdddataStateCopyWith(AdddataState _, $Res Function(AdddataState) __);
}


/// Adds pattern-matching-related methods to [AdddataState].
extension AdddataStatePatterns on AdddataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddDataInitial value)?  initial,TResult Function( AddDataLoading value)?  loading,TResult Function( AddDataFailure value)?  failure,TResult Function( AddDataSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddDataInitial() when initial != null:
return initial(_that);case AddDataLoading() when loading != null:
return loading(_that);case AddDataFailure() when failure != null:
return failure(_that);case AddDataSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddDataInitial value)  initial,required TResult Function( AddDataLoading value)  loading,required TResult Function( AddDataFailure value)  failure,required TResult Function( AddDataSuccess value)  success,}){
final _that = this;
switch (_that) {
case AddDataInitial():
return initial(_that);case AddDataLoading():
return loading(_that);case AddDataFailure():
return failure(_that);case AddDataSuccess():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddDataInitial value)?  initial,TResult? Function( AddDataLoading value)?  loading,TResult? Function( AddDataFailure value)?  failure,TResult? Function( AddDataSuccess value)?  success,}){
final _that = this;
switch (_that) {
case AddDataInitial() when initial != null:
return initial(_that);case AddDataLoading() when loading != null:
return loading(_that);case AddDataFailure() when failure != null:
return failure(_that);case AddDataSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  failure,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddDataInitial() when initial != null:
return initial();case AddDataLoading() when loading != null:
return loading();case AddDataFailure() when failure != null:
return failure(_that.message);case AddDataSuccess() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  failure,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case AddDataInitial():
return initial();case AddDataLoading():
return loading();case AddDataFailure():
return failure(_that.message);case AddDataSuccess():
return success();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  failure,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case AddDataInitial() when initial != null:
return initial();case AddDataLoading() when loading != null:
return loading();case AddDataFailure() when failure != null:
return failure(_that.message);case AddDataSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class AddDataInitial implements AdddataState {
  const AddDataInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDataInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdddataState.initial()';
}


}




/// @nodoc


class AddDataLoading implements AdddataState {
  const AddDataLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDataLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdddataState.loading()';
}


}




/// @nodoc


class AddDataFailure implements AdddataState {
  const AddDataFailure(this.message);
  

 final  String message;

/// Create a copy of AdddataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDataFailureCopyWith<AddDataFailure> get copyWith => _$AddDataFailureCopyWithImpl<AddDataFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDataFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdddataState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddDataFailureCopyWith<$Res> implements $AdddataStateCopyWith<$Res> {
  factory $AddDataFailureCopyWith(AddDataFailure value, $Res Function(AddDataFailure) _then) = _$AddDataFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddDataFailureCopyWithImpl<$Res>
    implements $AddDataFailureCopyWith<$Res> {
  _$AddDataFailureCopyWithImpl(this._self, this._then);

  final AddDataFailure _self;
  final $Res Function(AddDataFailure) _then;

/// Create a copy of AdddataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddDataFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddDataSuccess implements AdddataState {
  const AddDataSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDataSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdddataState.success()';
}


}




// dart format on
