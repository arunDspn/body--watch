// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState()';
}


}

/// @nodoc
class $CreatePasswordStateCopyWith<$Res>  {
$CreatePasswordStateCopyWith(CreatePasswordState _, $Res Function(CreatePasswordState) __);
}


/// Adds pattern-matching-related methods to [CreatePasswordState].
extension CreatePasswordStatePatterns on CreatePasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePasswordStateInitial value)?  initial,TResult Function( CreatePasswordStateLoading value)?  loading,TResult Function( CreatePasswordStateSuccess value)?  success,TResult Function( CreatePasswordStateFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePasswordStateInitial() when initial != null:
return initial(_that);case CreatePasswordStateLoading() when loading != null:
return loading(_that);case CreatePasswordStateSuccess() when success != null:
return success(_that);case CreatePasswordStateFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePasswordStateInitial value)  initial,required TResult Function( CreatePasswordStateLoading value)  loading,required TResult Function( CreatePasswordStateSuccess value)  success,required TResult Function( CreatePasswordStateFailed value)  failed,}){
final _that = this;
switch (_that) {
case CreatePasswordStateInitial():
return initial(_that);case CreatePasswordStateLoading():
return loading(_that);case CreatePasswordStateSuccess():
return success(_that);case CreatePasswordStateFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePasswordStateInitial value)?  initial,TResult? Function( CreatePasswordStateLoading value)?  loading,TResult? Function( CreatePasswordStateSuccess value)?  success,TResult? Function( CreatePasswordStateFailed value)?  failed,}){
final _that = this;
switch (_that) {
case CreatePasswordStateInitial() when initial != null:
return initial(_that);case CreatePasswordStateLoading() when loading != null:
return loading(_that);case CreatePasswordStateSuccess() when success != null:
return success(_that);case CreatePasswordStateFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePasswordStateInitial() when initial != null:
return initial();case CreatePasswordStateLoading() when loading != null:
return loading();case CreatePasswordStateSuccess() when success != null:
return success();case CreatePasswordStateFailed() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case CreatePasswordStateInitial():
return initial();case CreatePasswordStateLoading():
return loading();case CreatePasswordStateSuccess():
return success();case CreatePasswordStateFailed():
return failed(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case CreatePasswordStateInitial() when initial != null:
return initial();case CreatePasswordStateLoading() when loading != null:
return loading();case CreatePasswordStateSuccess() when success != null:
return success();case CreatePasswordStateFailed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreatePasswordStateInitial implements CreatePasswordState {
  const CreatePasswordStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState.initial()';
}


}




/// @nodoc


class CreatePasswordStateLoading implements CreatePasswordState {
  const CreatePasswordStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState.loading()';
}


}




/// @nodoc


class CreatePasswordStateSuccess implements CreatePasswordState {
  const CreatePasswordStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePasswordState.success()';
}


}




/// @nodoc


class CreatePasswordStateFailed implements CreatePasswordState {
  const CreatePasswordStateFailed(this.message);
  

 final  String message;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePasswordStateFailedCopyWith<CreatePasswordStateFailed> get copyWith => _$CreatePasswordStateFailedCopyWithImpl<CreatePasswordStateFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePasswordStateFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreatePasswordState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreatePasswordStateFailedCopyWith<$Res> implements $CreatePasswordStateCopyWith<$Res> {
  factory $CreatePasswordStateFailedCopyWith(CreatePasswordStateFailed value, $Res Function(CreatePasswordStateFailed) _then) = _$CreatePasswordStateFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreatePasswordStateFailedCopyWithImpl<$Res>
    implements $CreatePasswordStateFailedCopyWith<$Res> {
  _$CreatePasswordStateFailedCopyWithImpl(this._self, this._then);

  final CreatePasswordStateFailed _self;
  final $Res Function(CreatePasswordStateFailed) _then;

/// Create a copy of CreatePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreatePasswordStateFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
