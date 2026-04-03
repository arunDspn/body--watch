// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_unit_preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserUnitPreferenceModel {

@JsonKey(name: 'metric_code') String get metricCode;@JsonKey(name: 'to_base_factor') double get toBaseFactor;@JsonKey(name: 'preferred_unit') String get preferredUnit;
/// Create a copy of UserUnitPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUnitPreferenceModelCopyWith<UserUnitPreferenceModel> get copyWith => _$UserUnitPreferenceModelCopyWithImpl<UserUnitPreferenceModel>(this as UserUnitPreferenceModel, _$identity);

  /// Serializes this UserUnitPreferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUnitPreferenceModel&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode)&&(identical(other.toBaseFactor, toBaseFactor) || other.toBaseFactor == toBaseFactor)&&(identical(other.preferredUnit, preferredUnit) || other.preferredUnit == preferredUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metricCode,toBaseFactor,preferredUnit);

@override
String toString() {
  return 'UserUnitPreferenceModel(metricCode: $metricCode, toBaseFactor: $toBaseFactor, preferredUnit: $preferredUnit)';
}


}

/// @nodoc
abstract mixin class $UserUnitPreferenceModelCopyWith<$Res>  {
  factory $UserUnitPreferenceModelCopyWith(UserUnitPreferenceModel value, $Res Function(UserUnitPreferenceModel) _then) = _$UserUnitPreferenceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'metric_code') String metricCode,@JsonKey(name: 'to_base_factor') double toBaseFactor,@JsonKey(name: 'preferred_unit') String preferredUnit
});




}
/// @nodoc
class _$UserUnitPreferenceModelCopyWithImpl<$Res>
    implements $UserUnitPreferenceModelCopyWith<$Res> {
  _$UserUnitPreferenceModelCopyWithImpl(this._self, this._then);

  final UserUnitPreferenceModel _self;
  final $Res Function(UserUnitPreferenceModel) _then;

/// Create a copy of UserUnitPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metricCode = null,Object? toBaseFactor = null,Object? preferredUnit = null,}) {
  return _then(_self.copyWith(
metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,toBaseFactor: null == toBaseFactor ? _self.toBaseFactor : toBaseFactor // ignore: cast_nullable_to_non_nullable
as double,preferredUnit: null == preferredUnit ? _self.preferredUnit : preferredUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserUnitPreferenceModel].
extension UserUnitPreferenceModelPatterns on UserUnitPreferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserUnitPreferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserUnitPreferenceModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserUnitPreferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _UserUnitPreferenceModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserUnitPreferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserUnitPreferenceModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'to_base_factor')  double toBaseFactor, @JsonKey(name: 'preferred_unit')  String preferredUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserUnitPreferenceModel() when $default != null:
return $default(_that.metricCode,_that.toBaseFactor,_that.preferredUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'to_base_factor')  double toBaseFactor, @JsonKey(name: 'preferred_unit')  String preferredUnit)  $default,) {final _that = this;
switch (_that) {
case _UserUnitPreferenceModel():
return $default(_that.metricCode,_that.toBaseFactor,_that.preferredUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'to_base_factor')  double toBaseFactor, @JsonKey(name: 'preferred_unit')  String preferredUnit)?  $default,) {final _that = this;
switch (_that) {
case _UserUnitPreferenceModel() when $default != null:
return $default(_that.metricCode,_that.toBaseFactor,_that.preferredUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserUnitPreferenceModel implements UserUnitPreferenceModel {
  const _UserUnitPreferenceModel({@JsonKey(name: 'metric_code') required this.metricCode, @JsonKey(name: 'to_base_factor') required this.toBaseFactor, @JsonKey(name: 'preferred_unit') required this.preferredUnit});
  factory _UserUnitPreferenceModel.fromJson(Map<String, dynamic> json) => _$UserUnitPreferenceModelFromJson(json);

@override@JsonKey(name: 'metric_code') final  String metricCode;
@override@JsonKey(name: 'to_base_factor') final  double toBaseFactor;
@override@JsonKey(name: 'preferred_unit') final  String preferredUnit;

/// Create a copy of UserUnitPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUnitPreferenceModelCopyWith<_UserUnitPreferenceModel> get copyWith => __$UserUnitPreferenceModelCopyWithImpl<_UserUnitPreferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserUnitPreferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUnitPreferenceModel&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode)&&(identical(other.toBaseFactor, toBaseFactor) || other.toBaseFactor == toBaseFactor)&&(identical(other.preferredUnit, preferredUnit) || other.preferredUnit == preferredUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metricCode,toBaseFactor,preferredUnit);

@override
String toString() {
  return 'UserUnitPreferenceModel(metricCode: $metricCode, toBaseFactor: $toBaseFactor, preferredUnit: $preferredUnit)';
}


}

/// @nodoc
abstract mixin class _$UserUnitPreferenceModelCopyWith<$Res> implements $UserUnitPreferenceModelCopyWith<$Res> {
  factory _$UserUnitPreferenceModelCopyWith(_UserUnitPreferenceModel value, $Res Function(_UserUnitPreferenceModel) _then) = __$UserUnitPreferenceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'metric_code') String metricCode,@JsonKey(name: 'to_base_factor') double toBaseFactor,@JsonKey(name: 'preferred_unit') String preferredUnit
});




}
/// @nodoc
class __$UserUnitPreferenceModelCopyWithImpl<$Res>
    implements _$UserUnitPreferenceModelCopyWith<$Res> {
  __$UserUnitPreferenceModelCopyWithImpl(this._self, this._then);

  final _UserUnitPreferenceModel _self;
  final $Res Function(_UserUnitPreferenceModel) _then;

/// Create a copy of UserUnitPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metricCode = null,Object? toBaseFactor = null,Object? preferredUnit = null,}) {
  return _then(_UserUnitPreferenceModel(
metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,toBaseFactor: null == toBaseFactor ? _self.toBaseFactor : toBaseFactor // ignore: cast_nullable_to_non_nullable
as double,preferredUnit: null == preferredUnit ? _self.preferredUnit : preferredUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
