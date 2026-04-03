// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_unit_preferences_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserUnitPreferencesEntity {

// required int id,
@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'preferred_unit') String get preferredUnit;@JsonKey(name: 'metric_code') String get metricCode;
/// Create a copy of UserUnitPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUnitPreferencesEntityCopyWith<UserUnitPreferencesEntity> get copyWith => _$UserUnitPreferencesEntityCopyWithImpl<UserUnitPreferencesEntity>(this as UserUnitPreferencesEntity, _$identity);

  /// Serializes this UserUnitPreferencesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUnitPreferencesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.preferredUnit, preferredUnit) || other.preferredUnit == preferredUnit)&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,preferredUnit,metricCode);

@override
String toString() {
  return 'UserUnitPreferencesEntity(userId: $userId, preferredUnit: $preferredUnit, metricCode: $metricCode)';
}


}

/// @nodoc
abstract mixin class $UserUnitPreferencesEntityCopyWith<$Res>  {
  factory $UserUnitPreferencesEntityCopyWith(UserUnitPreferencesEntity value, $Res Function(UserUnitPreferencesEntity) _then) = _$UserUnitPreferencesEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'preferred_unit') String preferredUnit,@JsonKey(name: 'metric_code') String metricCode
});




}
/// @nodoc
class _$UserUnitPreferencesEntityCopyWithImpl<$Res>
    implements $UserUnitPreferencesEntityCopyWith<$Res> {
  _$UserUnitPreferencesEntityCopyWithImpl(this._self, this._then);

  final UserUnitPreferencesEntity _self;
  final $Res Function(UserUnitPreferencesEntity) _then;

/// Create a copy of UserUnitPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? preferredUnit = null,Object? metricCode = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,preferredUnit: null == preferredUnit ? _self.preferredUnit : preferredUnit // ignore: cast_nullable_to_non_nullable
as String,metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserUnitPreferencesEntity].
extension UserUnitPreferencesEntityPatterns on UserUnitPreferencesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserUnitPreferencesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserUnitPreferencesEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserUnitPreferencesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'preferred_unit')  String preferredUnit, @JsonKey(name: 'metric_code')  String metricCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity() when $default != null:
return $default(_that.userId,_that.preferredUnit,_that.metricCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'preferred_unit')  String preferredUnit, @JsonKey(name: 'metric_code')  String metricCode)  $default,) {final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity():
return $default(_that.userId,_that.preferredUnit,_that.metricCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'preferred_unit')  String preferredUnit, @JsonKey(name: 'metric_code')  String metricCode)?  $default,) {final _that = this;
switch (_that) {
case _UserUnitPreferencesEntity() when $default != null:
return $default(_that.userId,_that.preferredUnit,_that.metricCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserUnitPreferencesEntity implements UserUnitPreferencesEntity {
  const _UserUnitPreferencesEntity({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'preferred_unit') required this.preferredUnit, @JsonKey(name: 'metric_code') required this.metricCode});
  factory _UserUnitPreferencesEntity.fromJson(Map<String, dynamic> json) => _$UserUnitPreferencesEntityFromJson(json);

// required int id,
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'preferred_unit') final  String preferredUnit;
@override@JsonKey(name: 'metric_code') final  String metricCode;

/// Create a copy of UserUnitPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUnitPreferencesEntityCopyWith<_UserUnitPreferencesEntity> get copyWith => __$UserUnitPreferencesEntityCopyWithImpl<_UserUnitPreferencesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserUnitPreferencesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUnitPreferencesEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.preferredUnit, preferredUnit) || other.preferredUnit == preferredUnit)&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,preferredUnit,metricCode);

@override
String toString() {
  return 'UserUnitPreferencesEntity(userId: $userId, preferredUnit: $preferredUnit, metricCode: $metricCode)';
}


}

/// @nodoc
abstract mixin class _$UserUnitPreferencesEntityCopyWith<$Res> implements $UserUnitPreferencesEntityCopyWith<$Res> {
  factory _$UserUnitPreferencesEntityCopyWith(_UserUnitPreferencesEntity value, $Res Function(_UserUnitPreferencesEntity) _then) = __$UserUnitPreferencesEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'preferred_unit') String preferredUnit,@JsonKey(name: 'metric_code') String metricCode
});




}
/// @nodoc
class __$UserUnitPreferencesEntityCopyWithImpl<$Res>
    implements _$UserUnitPreferencesEntityCopyWith<$Res> {
  __$UserUnitPreferencesEntityCopyWithImpl(this._self, this._then);

  final _UserUnitPreferencesEntity _self;
  final $Res Function(_UserUnitPreferencesEntity) _then;

/// Create a copy of UserUnitPreferencesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? preferredUnit = null,Object? metricCode = null,}) {
  return _then(_UserUnitPreferencesEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,preferredUnit: null == preferredUnit ? _self.preferredUnit : preferredUnit // ignore: cast_nullable_to_non_nullable
as String,metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
