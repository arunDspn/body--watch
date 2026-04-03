// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComparisonDataState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComparisonDataState()';
}


}

/// @nodoc
class $ComparisonDataStateCopyWith<$Res>  {
$ComparisonDataStateCopyWith(ComparisonDataState _, $Res Function(ComparisonDataState) __);
}


/// Adds pattern-matching-related methods to [ComparisonDataState].
extension ComparisonDataStatePatterns on ComparisonDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComparisonDataStateInitial value)?  initial,TResult Function( ComparisonDataStateLoading value)?  loading,TResult Function( ComparisonDataStateSuccess value)?  success,TResult Function( ComparisonDataStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComparisonDataStateInitial() when initial != null:
return initial(_that);case ComparisonDataStateLoading() when loading != null:
return loading(_that);case ComparisonDataStateSuccess() when success != null:
return success(_that);case ComparisonDataStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComparisonDataStateInitial value)  initial,required TResult Function( ComparisonDataStateLoading value)  loading,required TResult Function( ComparisonDataStateSuccess value)  success,required TResult Function( ComparisonDataStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case ComparisonDataStateInitial():
return initial(_that);case ComparisonDataStateLoading():
return loading(_that);case ComparisonDataStateSuccess():
return success(_that);case ComparisonDataStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComparisonDataStateInitial value)?  initial,TResult? Function( ComparisonDataStateLoading value)?  loading,TResult? Function( ComparisonDataStateSuccess value)?  success,TResult? Function( ComparisonDataStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ComparisonDataStateInitial() when initial != null:
return initial(_that);case ComparisonDataStateLoading() when loading != null:
return loading(_that);case ComparisonDataStateSuccess() when success != null:
return success(_that);case ComparisonDataStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TwoDatesRecord> records)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComparisonDataStateInitial() when initial != null:
return initial();case ComparisonDataStateLoading() when loading != null:
return loading();case ComparisonDataStateSuccess() when success != null:
return success(_that.records);case ComparisonDataStateFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TwoDatesRecord> records)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ComparisonDataStateInitial():
return initial();case ComparisonDataStateLoading():
return loading();case ComparisonDataStateSuccess():
return success(_that.records);case ComparisonDataStateFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TwoDatesRecord> records)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ComparisonDataStateInitial() when initial != null:
return initial();case ComparisonDataStateLoading() when loading != null:
return loading();case ComparisonDataStateSuccess() when success != null:
return success(_that.records);case ComparisonDataStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ComparisonDataStateInitial implements ComparisonDataState {
  const ComparisonDataStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDataStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComparisonDataState.initial()';
}


}




/// @nodoc


class ComparisonDataStateLoading implements ComparisonDataState {
  const ComparisonDataStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDataStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ComparisonDataState.loading()';
}


}




/// @nodoc


class ComparisonDataStateSuccess implements ComparisonDataState {
  const ComparisonDataStateSuccess({required final  List<TwoDatesRecord> records}): _records = records;
  

 final  List<TwoDatesRecord> _records;
 List<TwoDatesRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}


/// Create a copy of ComparisonDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonDataStateSuccessCopyWith<ComparisonDataStateSuccess> get copyWith => _$ComparisonDataStateSuccessCopyWithImpl<ComparisonDataStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDataStateSuccess&&const DeepCollectionEquality().equals(other._records, _records));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'ComparisonDataState.success(records: $records)';
}


}

/// @nodoc
abstract mixin class $ComparisonDataStateSuccessCopyWith<$Res> implements $ComparisonDataStateCopyWith<$Res> {
  factory $ComparisonDataStateSuccessCopyWith(ComparisonDataStateSuccess value, $Res Function(ComparisonDataStateSuccess) _then) = _$ComparisonDataStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<TwoDatesRecord> records
});




}
/// @nodoc
class _$ComparisonDataStateSuccessCopyWithImpl<$Res>
    implements $ComparisonDataStateSuccessCopyWith<$Res> {
  _$ComparisonDataStateSuccessCopyWithImpl(this._self, this._then);

  final ComparisonDataStateSuccess _self;
  final $Res Function(ComparisonDataStateSuccess) _then;

/// Create a copy of ComparisonDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? records = null,}) {
  return _then(ComparisonDataStateSuccess(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<TwoDatesRecord>,
  ));
}


}

/// @nodoc


class ComparisonDataStateFailure implements ComparisonDataState {
  const ComparisonDataStateFailure({required this.message});
  

 final  String message;

/// Create a copy of ComparisonDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonDataStateFailureCopyWith<ComparisonDataStateFailure> get copyWith => _$ComparisonDataStateFailureCopyWithImpl<ComparisonDataStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonDataStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ComparisonDataState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ComparisonDataStateFailureCopyWith<$Res> implements $ComparisonDataStateCopyWith<$Res> {
  factory $ComparisonDataStateFailureCopyWith(ComparisonDataStateFailure value, $Res Function(ComparisonDataStateFailure) _then) = _$ComparisonDataStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ComparisonDataStateFailureCopyWithImpl<$Res>
    implements $ComparisonDataStateFailureCopyWith<$Res> {
  _$ComparisonDataStateFailureCopyWithImpl(this._self, this._then);

  final ComparisonDataStateFailure _self;
  final $Res Function(ComparisonDataStateFailure) _then;

/// Create a copy of ComparisonDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ComparisonDataStateFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
