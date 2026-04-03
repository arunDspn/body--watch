// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_new_media_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddNewMediaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewMediaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNewMediaState()';
}


}

/// @nodoc
class $AddNewMediaStateCopyWith<$Res>  {
$AddNewMediaStateCopyWith(AddNewMediaState _, $Res Function(AddNewMediaState) __);
}


/// Adds pattern-matching-related methods to [AddNewMediaState].
extension AddNewMediaStatePatterns on AddNewMediaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddNewMediaStateInitial value)?  initial,TResult Function( AddNewMediaStateLoading value)?  loading,TResult Function( AddNewMediaStateSuccess value)?  success,TResult Function( AddNewMediaStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddNewMediaStateInitial() when initial != null:
return initial(_that);case AddNewMediaStateLoading() when loading != null:
return loading(_that);case AddNewMediaStateSuccess() when success != null:
return success(_that);case AddNewMediaStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddNewMediaStateInitial value)  initial,required TResult Function( AddNewMediaStateLoading value)  loading,required TResult Function( AddNewMediaStateSuccess value)  success,required TResult Function( AddNewMediaStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case AddNewMediaStateInitial():
return initial(_that);case AddNewMediaStateLoading():
return loading(_that);case AddNewMediaStateSuccess():
return success(_that);case AddNewMediaStateFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddNewMediaStateInitial value)?  initial,TResult? Function( AddNewMediaStateLoading value)?  loading,TResult? Function( AddNewMediaStateSuccess value)?  success,TResult? Function( AddNewMediaStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case AddNewMediaStateInitial() when initial != null:
return initial(_that);case AddNewMediaStateLoading() when loading != null:
return loading(_that);case AddNewMediaStateSuccess() when success != null:
return success(_that);case AddNewMediaStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( VaultImageModel savedImage)?  success,TResult Function( String failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddNewMediaStateInitial() when initial != null:
return initial();case AddNewMediaStateLoading() when loading != null:
return loading();case AddNewMediaStateSuccess() when success != null:
return success(_that.savedImage);case AddNewMediaStateFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( VaultImageModel savedImage)  success,required TResult Function( String failure)  failure,}) {final _that = this;
switch (_that) {
case AddNewMediaStateInitial():
return initial();case AddNewMediaStateLoading():
return loading();case AddNewMediaStateSuccess():
return success(_that.savedImage);case AddNewMediaStateFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( VaultImageModel savedImage)?  success,TResult? Function( String failure)?  failure,}) {final _that = this;
switch (_that) {
case AddNewMediaStateInitial() when initial != null:
return initial();case AddNewMediaStateLoading() when loading != null:
return loading();case AddNewMediaStateSuccess() when success != null:
return success(_that.savedImage);case AddNewMediaStateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class AddNewMediaStateInitial implements AddNewMediaState {
  const AddNewMediaStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewMediaStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNewMediaState.initial()';
}


}




/// @nodoc


class AddNewMediaStateLoading implements AddNewMediaState {
  const AddNewMediaStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewMediaStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddNewMediaState.loading()';
}


}




/// @nodoc


class AddNewMediaStateSuccess implements AddNewMediaState {
  const AddNewMediaStateSuccess({required this.savedImage});
  

 final  VaultImageModel savedImage;

/// Create a copy of AddNewMediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddNewMediaStateSuccessCopyWith<AddNewMediaStateSuccess> get copyWith => _$AddNewMediaStateSuccessCopyWithImpl<AddNewMediaStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewMediaStateSuccess&&(identical(other.savedImage, savedImage) || other.savedImage == savedImage));
}


@override
int get hashCode => Object.hash(runtimeType,savedImage);

@override
String toString() {
  return 'AddNewMediaState.success(savedImage: $savedImage)';
}


}

/// @nodoc
abstract mixin class $AddNewMediaStateSuccessCopyWith<$Res> implements $AddNewMediaStateCopyWith<$Res> {
  factory $AddNewMediaStateSuccessCopyWith(AddNewMediaStateSuccess value, $Res Function(AddNewMediaStateSuccess) _then) = _$AddNewMediaStateSuccessCopyWithImpl;
@useResult
$Res call({
 VaultImageModel savedImage
});


$VaultImageModelCopyWith<$Res> get savedImage;

}
/// @nodoc
class _$AddNewMediaStateSuccessCopyWithImpl<$Res>
    implements $AddNewMediaStateSuccessCopyWith<$Res> {
  _$AddNewMediaStateSuccessCopyWithImpl(this._self, this._then);

  final AddNewMediaStateSuccess _self;
  final $Res Function(AddNewMediaStateSuccess) _then;

/// Create a copy of AddNewMediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? savedImage = null,}) {
  return _then(AddNewMediaStateSuccess(
savedImage: null == savedImage ? _self.savedImage : savedImage // ignore: cast_nullable_to_non_nullable
as VaultImageModel,
  ));
}

/// Create a copy of AddNewMediaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VaultImageModelCopyWith<$Res> get savedImage {
  
  return $VaultImageModelCopyWith<$Res>(_self.savedImage, (value) {
    return _then(_self.copyWith(savedImage: value));
  });
}
}

/// @nodoc


class AddNewMediaStateFailure implements AddNewMediaState {
  const AddNewMediaStateFailure(this.failure);
  

 final  String failure;

/// Create a copy of AddNewMediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddNewMediaStateFailureCopyWith<AddNewMediaStateFailure> get copyWith => _$AddNewMediaStateFailureCopyWithImpl<AddNewMediaStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewMediaStateFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AddNewMediaState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AddNewMediaStateFailureCopyWith<$Res> implements $AddNewMediaStateCopyWith<$Res> {
  factory $AddNewMediaStateFailureCopyWith(AddNewMediaStateFailure value, $Res Function(AddNewMediaStateFailure) _then) = _$AddNewMediaStateFailureCopyWithImpl;
@useResult
$Res call({
 String failure
});




}
/// @nodoc
class _$AddNewMediaStateFailureCopyWithImpl<$Res>
    implements $AddNewMediaStateFailureCopyWith<$Res> {
  _$AddNewMediaStateFailureCopyWithImpl(this._self, this._then);

  final AddNewMediaStateFailure _self;
  final $Res Function(AddNewMediaStateFailure) _then;

/// Create a copy of AddNewMediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AddNewMediaStateFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
