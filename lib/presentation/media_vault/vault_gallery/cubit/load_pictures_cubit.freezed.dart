// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_pictures_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadPicturesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPicturesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadPicturesState()';
}


}

/// @nodoc
class $LoadPicturesStateCopyWith<$Res>  {
$LoadPicturesStateCopyWith(LoadPicturesState _, $Res Function(LoadPicturesState) __);
}


/// Adds pattern-matching-related methods to [LoadPicturesState].
extension LoadPicturesStatePatterns on LoadPicturesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPicturesStateLoading value)?  loading,TResult Function( LoadPicturesStateLoaded value)?  loaded,TResult Function( LoadPicturesStateFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPicturesStateLoading() when loading != null:
return loading(_that);case LoadPicturesStateLoaded() when loaded != null:
return loaded(_that);case LoadPicturesStateFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPicturesStateLoading value)  loading,required TResult Function( LoadPicturesStateLoaded value)  loaded,required TResult Function( LoadPicturesStateFailed value)  failed,}){
final _that = this;
switch (_that) {
case LoadPicturesStateLoading():
return loading(_that);case LoadPicturesStateLoaded():
return loaded(_that);case LoadPicturesStateFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPicturesStateLoading value)?  loading,TResult? Function( LoadPicturesStateLoaded value)?  loaded,TResult? Function( LoadPicturesStateFailed value)?  failed,}){
final _that = this;
switch (_that) {
case LoadPicturesStateLoading() when loading != null:
return loading(_that);case LoadPicturesStateLoaded() when loaded != null:
return loaded(_that);case LoadPicturesStateFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<VaultImageModel> pictures)?  loaded,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPicturesStateLoading() when loading != null:
return loading();case LoadPicturesStateLoaded() when loaded != null:
return loaded(_that.pictures);case LoadPicturesStateFailed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<VaultImageModel> pictures)  loaded,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case LoadPicturesStateLoading():
return loading();case LoadPicturesStateLoaded():
return loaded(_that.pictures);case LoadPicturesStateFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<VaultImageModel> pictures)?  loaded,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case LoadPicturesStateLoading() when loading != null:
return loading();case LoadPicturesStateLoaded() when loaded != null:
return loaded(_that.pictures);case LoadPicturesStateFailed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoadPicturesStateLoading implements LoadPicturesState {
  const LoadPicturesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPicturesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadPicturesState.loading()';
}


}




/// @nodoc


class LoadPicturesStateLoaded implements LoadPicturesState {
  const LoadPicturesStateLoaded(final  List<VaultImageModel> pictures): _pictures = pictures;
  

 final  List<VaultImageModel> _pictures;
 List<VaultImageModel> get pictures {
  if (_pictures is EqualUnmodifiableListView) return _pictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pictures);
}


/// Create a copy of LoadPicturesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadPicturesStateLoadedCopyWith<LoadPicturesStateLoaded> get copyWith => _$LoadPicturesStateLoadedCopyWithImpl<LoadPicturesStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPicturesStateLoaded&&const DeepCollectionEquality().equals(other._pictures, _pictures));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pictures));

@override
String toString() {
  return 'LoadPicturesState.loaded(pictures: $pictures)';
}


}

/// @nodoc
abstract mixin class $LoadPicturesStateLoadedCopyWith<$Res> implements $LoadPicturesStateCopyWith<$Res> {
  factory $LoadPicturesStateLoadedCopyWith(LoadPicturesStateLoaded value, $Res Function(LoadPicturesStateLoaded) _then) = _$LoadPicturesStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<VaultImageModel> pictures
});




}
/// @nodoc
class _$LoadPicturesStateLoadedCopyWithImpl<$Res>
    implements $LoadPicturesStateLoadedCopyWith<$Res> {
  _$LoadPicturesStateLoadedCopyWithImpl(this._self, this._then);

  final LoadPicturesStateLoaded _self;
  final $Res Function(LoadPicturesStateLoaded) _then;

/// Create a copy of LoadPicturesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pictures = null,}) {
  return _then(LoadPicturesStateLoaded(
null == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<VaultImageModel>,
  ));
}


}

/// @nodoc


class LoadPicturesStateFailed implements LoadPicturesState {
  const LoadPicturesStateFailed(this.message);
  

 final  String message;

/// Create a copy of LoadPicturesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadPicturesStateFailedCopyWith<LoadPicturesStateFailed> get copyWith => _$LoadPicturesStateFailedCopyWithImpl<LoadPicturesStateFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPicturesStateFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoadPicturesState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoadPicturesStateFailedCopyWith<$Res> implements $LoadPicturesStateCopyWith<$Res> {
  factory $LoadPicturesStateFailedCopyWith(LoadPicturesStateFailed value, $Res Function(LoadPicturesStateFailed) _then) = _$LoadPicturesStateFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoadPicturesStateFailedCopyWithImpl<$Res>
    implements $LoadPicturesStateFailedCopyWith<$Res> {
  _$LoadPicturesStateFailedCopyWithImpl(this._self, this._then);

  final LoadPicturesStateFailed _self;
  final $Res Function(LoadPicturesStateFailed) _then;

/// Create a copy of LoadPicturesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoadPicturesStateFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
