// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalEntity {

@JsonKey(name: 'target_id') int get targetId;@JsonKey(name: 'target_value') double get targetValue;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'due_date') DateTime? get dueDate; String? get notes;@JsonKey(name: 'status') GoalStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'user_id') int get userId; int? get id;
/// Create a copy of GoalEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalEntityCopyWith<GoalEntity> get copyWith => _$GoalEntityCopyWithImpl<GoalEntity>(this as GoalEntity, _$identity);

  /// Serializes this GoalEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalEntity&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,targetValue,startDate,dueDate,notes,status,createdAt,updatedAt,userId,id);

@override
String toString() {
  return 'GoalEntity(targetId: $targetId, targetValue: $targetValue, startDate: $startDate, dueDate: $dueDate, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, id: $id)';
}


}

/// @nodoc
abstract mixin class $GoalEntityCopyWith<$Res>  {
  factory $GoalEntityCopyWith(GoalEntity value, $Res Function(GoalEntity) _then) = _$GoalEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'target_value') double targetValue,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'due_date') DateTime? dueDate, String? notes,@JsonKey(name: 'status') GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'user_id') int userId, int? id
});




}
/// @nodoc
class _$GoalEntityCopyWithImpl<$Res>
    implements $GoalEntityCopyWith<$Res> {
  _$GoalEntityCopyWithImpl(this._self, this._then);

  final GoalEntity _self;
  final $Res Function(GoalEntity) _then;

/// Create a copy of GoalEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetId = null,Object? targetValue = null,Object? startDate = null,Object? dueDate = freezed,Object? notes = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalEntity].
extension GoalEntityPatterns on GoalEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalEntity value)  $default,){
final _that = this;
switch (_that) {
case _GoalEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GoalEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'target_value')  double targetValue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'due_date')  DateTime? dueDate,  String? notes, @JsonKey(name: 'status')  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'user_id')  int userId,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalEntity() when $default != null:
return $default(_that.targetId,_that.targetValue,_that.startDate,_that.dueDate,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.userId,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'target_value')  double targetValue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'due_date')  DateTime? dueDate,  String? notes, @JsonKey(name: 'status')  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'user_id')  int userId,  int? id)  $default,) {final _that = this;
switch (_that) {
case _GoalEntity():
return $default(_that.targetId,_that.targetValue,_that.startDate,_that.dueDate,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.userId,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'target_id')  int targetId, @JsonKey(name: 'target_value')  double targetValue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'due_date')  DateTime? dueDate,  String? notes, @JsonKey(name: 'status')  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'user_id')  int userId,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _GoalEntity() when $default != null:
return $default(_that.targetId,_that.targetValue,_that.startDate,_that.dueDate,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.userId,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalEntity implements GoalEntity {
  const _GoalEntity({@JsonKey(name: 'target_id') required this.targetId, @JsonKey(name: 'target_value') required this.targetValue, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'due_date') this.dueDate, this.notes, @JsonKey(name: 'status') this.status = GoalStatus.active, @JsonKey(name: 'created_at') this.createdAt = null, @JsonKey(name: 'updated_at') this.updatedAt = null, @JsonKey(name: 'user_id') required this.userId, this.id});
  factory _GoalEntity.fromJson(Map<String, dynamic> json) => _$GoalEntityFromJson(json);

@override@JsonKey(name: 'target_id') final  int targetId;
@override@JsonKey(name: 'target_value') final  double targetValue;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'due_date') final  DateTime? dueDate;
@override final  String? notes;
@override@JsonKey(name: 'status') final  GoalStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  int? id;

/// Create a copy of GoalEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalEntityCopyWith<_GoalEntity> get copyWith => __$GoalEntityCopyWithImpl<_GoalEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalEntity&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,targetValue,startDate,dueDate,notes,status,createdAt,updatedAt,userId,id);

@override
String toString() {
  return 'GoalEntity(targetId: $targetId, targetValue: $targetValue, startDate: $startDate, dueDate: $dueDate, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, id: $id)';
}


}

/// @nodoc
abstract mixin class _$GoalEntityCopyWith<$Res> implements $GoalEntityCopyWith<$Res> {
  factory _$GoalEntityCopyWith(_GoalEntity value, $Res Function(_GoalEntity) _then) = __$GoalEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'target_id') int targetId,@JsonKey(name: 'target_value') double targetValue,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'due_date') DateTime? dueDate, String? notes,@JsonKey(name: 'status') GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'user_id') int userId, int? id
});




}
/// @nodoc
class __$GoalEntityCopyWithImpl<$Res>
    implements _$GoalEntityCopyWith<$Res> {
  __$GoalEntityCopyWithImpl(this._self, this._then);

  final _GoalEntity _self;
  final $Res Function(_GoalEntity) _then;

/// Create a copy of GoalEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetId = null,Object? targetValue = null,Object? startDate = null,Object? dueDate = freezed,Object? notes = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? id = freezed,}) {
  return _then(_GoalEntity(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as int,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
