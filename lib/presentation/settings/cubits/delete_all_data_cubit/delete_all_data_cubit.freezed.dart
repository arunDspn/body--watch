// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_all_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteAllDataState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteAllDataState()';
}


}

/// @nodoc
class $DeleteAllDataStateCopyWith<$Res>  {
$DeleteAllDataStateCopyWith(DeleteAllDataState _, $Res Function(DeleteAllDataState) __);
}


/// Adds pattern-matching-related methods to [DeleteAllDataState].
extension DeleteAllDataStatePatterns on DeleteAllDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeleteAllDataStateInitial value)?  initial,TResult Function( DeleteAllDataStateLoading value)?  loading,TResult Function( DeleteAllDataStateSuccess value)?  success,TResult Function( DeleteAllDataStateFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeleteAllDataStateInitial() when initial != null:
return initial(_that);case DeleteAllDataStateLoading() when loading != null:
return loading(_that);case DeleteAllDataStateSuccess() when success != null:
return success(_that);case DeleteAllDataStateFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeleteAllDataStateInitial value)  initial,required TResult Function( DeleteAllDataStateLoading value)  loading,required TResult Function( DeleteAllDataStateSuccess value)  success,required TResult Function( DeleteAllDataStateFailed value)  failed,}){
final _that = this;
switch (_that) {
case DeleteAllDataStateInitial():
return initial(_that);case DeleteAllDataStateLoading():
return loading(_that);case DeleteAllDataStateSuccess():
return success(_that);case DeleteAllDataStateFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeleteAllDataStateInitial value)?  initial,TResult? Function( DeleteAllDataStateLoading value)?  loading,TResult? Function( DeleteAllDataStateSuccess value)?  success,TResult? Function( DeleteAllDataStateFailed value)?  failed,}){
final _that = this;
switch (_that) {
case DeleteAllDataStateInitial() when initial != null:
return initial(_that);case DeleteAllDataStateLoading() when loading != null:
return loading(_that);case DeleteAllDataStateSuccess() when success != null:
return success(_that);case DeleteAllDataStateFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String msg)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeleteAllDataStateInitial() when initial != null:
return initial();case DeleteAllDataStateLoading() when loading != null:
return loading();case DeleteAllDataStateSuccess() when success != null:
return success();case DeleteAllDataStateFailed() when failed != null:
return failed(_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String msg)  failed,}) {final _that = this;
switch (_that) {
case DeleteAllDataStateInitial():
return initial();case DeleteAllDataStateLoading():
return loading();case DeleteAllDataStateSuccess():
return success();case DeleteAllDataStateFailed():
return failed(_that.msg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String msg)?  failed,}) {final _that = this;
switch (_that) {
case DeleteAllDataStateInitial() when initial != null:
return initial();case DeleteAllDataStateLoading() when loading != null:
return loading();case DeleteAllDataStateSuccess() when success != null:
return success();case DeleteAllDataStateFailed() when failed != null:
return failed(_that.msg);case _:
  return null;

}
}

}

/// @nodoc


class DeleteAllDataStateInitial implements DeleteAllDataState {
  const DeleteAllDataStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllDataStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteAllDataState.initial()';
}


}




/// @nodoc


class DeleteAllDataStateLoading implements DeleteAllDataState {
  const DeleteAllDataStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllDataStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteAllDataState.loading()';
}


}




/// @nodoc


class DeleteAllDataStateSuccess implements DeleteAllDataState {
  const DeleteAllDataStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllDataStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteAllDataState.success()';
}


}




/// @nodoc


class DeleteAllDataStateFailed implements DeleteAllDataState {
  const DeleteAllDataStateFailed(this.msg);
  

 final  String msg;

/// Create a copy of DeleteAllDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAllDataStateFailedCopyWith<DeleteAllDataStateFailed> get copyWith => _$DeleteAllDataStateFailedCopyWithImpl<DeleteAllDataStateFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllDataStateFailed&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,msg);

@override
String toString() {
  return 'DeleteAllDataState.failed(msg: $msg)';
}


}

/// @nodoc
abstract mixin class $DeleteAllDataStateFailedCopyWith<$Res> implements $DeleteAllDataStateCopyWith<$Res> {
  factory $DeleteAllDataStateFailedCopyWith(DeleteAllDataStateFailed value, $Res Function(DeleteAllDataStateFailed) _then) = _$DeleteAllDataStateFailedCopyWithImpl;
@useResult
$Res call({
 String msg
});




}
/// @nodoc
class _$DeleteAllDataStateFailedCopyWithImpl<$Res>
    implements $DeleteAllDataStateFailedCopyWith<$Res> {
  _$DeleteAllDataStateFailedCopyWithImpl(this._self, this._then);

  final DeleteAllDataStateFailed _self;
  final $Res Function(DeleteAllDataStateFailed) _then;

/// Create a copy of DeleteAllDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? msg = null,}) {
  return _then(DeleteAllDataStateFailed(
null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
