// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VaultImageEntity {

@JsonKey(name: 'tag_id') int get tagId; String get file;@JsonKey(name: 'thumbnail_file') String get thumbnailFile; DateTime get date; String get note;
/// Create a copy of VaultImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultImageEntityCopyWith<VaultImageEntity> get copyWith => _$VaultImageEntityCopyWithImpl<VaultImageEntity>(this as VaultImageEntity, _$identity);

  /// Serializes this VaultImageEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultImageEntity&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnailFile, thumbnailFile) || other.thumbnailFile == thumbnailFile)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,file,thumbnailFile,date,note);

@override
String toString() {
  return 'VaultImageEntity(tagId: $tagId, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class $VaultImageEntityCopyWith<$Res>  {
  factory $VaultImageEntityCopyWith(VaultImageEntity value, $Res Function(VaultImageEntity) _then) = _$VaultImageEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tag_id') int tagId, String file,@JsonKey(name: 'thumbnail_file') String thumbnailFile, DateTime date, String note
});




}
/// @nodoc
class _$VaultImageEntityCopyWithImpl<$Res>
    implements $VaultImageEntityCopyWith<$Res> {
  _$VaultImageEntityCopyWithImpl(this._self, this._then);

  final VaultImageEntity _self;
  final $Res Function(VaultImageEntity) _then;

/// Create a copy of VaultImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? file = null,Object? thumbnailFile = null,Object? date = null,Object? note = null,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnailFile: null == thumbnailFile ? _self.thumbnailFile : thumbnailFile // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultImageEntity].
extension VaultImageEntityPatterns on VaultImageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultImageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _VaultImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VaultImageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')  int tagId,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultImageEntity() when $default != null:
return $default(_that.tagId,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')  int tagId,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)  $default,) {final _that = this;
switch (_that) {
case _VaultImageEntity():
return $default(_that.tagId,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tag_id')  int tagId,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)?  $default,) {final _that = this;
switch (_that) {
case _VaultImageEntity() when $default != null:
return $default(_that.tagId,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VaultImageEntity implements VaultImageEntity {
  const _VaultImageEntity({@JsonKey(name: 'tag_id') required this.tagId, required this.file, @JsonKey(name: 'thumbnail_file') required this.thumbnailFile, required this.date, required this.note});
  factory _VaultImageEntity.fromJson(Map<String, dynamic> json) => _$VaultImageEntityFromJson(json);

@override@JsonKey(name: 'tag_id') final  int tagId;
@override final  String file;
@override@JsonKey(name: 'thumbnail_file') final  String thumbnailFile;
@override final  DateTime date;
@override final  String note;

/// Create a copy of VaultImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultImageEntityCopyWith<_VaultImageEntity> get copyWith => __$VaultImageEntityCopyWithImpl<_VaultImageEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaultImageEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultImageEntity&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnailFile, thumbnailFile) || other.thumbnailFile == thumbnailFile)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,file,thumbnailFile,date,note);

@override
String toString() {
  return 'VaultImageEntity(tagId: $tagId, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class _$VaultImageEntityCopyWith<$Res> implements $VaultImageEntityCopyWith<$Res> {
  factory _$VaultImageEntityCopyWith(_VaultImageEntity value, $Res Function(_VaultImageEntity) _then) = __$VaultImageEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tag_id') int tagId, String file,@JsonKey(name: 'thumbnail_file') String thumbnailFile, DateTime date, String note
});




}
/// @nodoc
class __$VaultImageEntityCopyWithImpl<$Res>
    implements _$VaultImageEntityCopyWith<$Res> {
  __$VaultImageEntityCopyWithImpl(this._self, this._then);

  final _VaultImageEntity _self;
  final $Res Function(_VaultImageEntity) _then;

/// Create a copy of VaultImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? file = null,Object? thumbnailFile = null,Object? date = null,Object? note = null,}) {
  return _then(_VaultImageEntity(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnailFile: null == thumbnailFile ? _self.thumbnailFile : thumbnailFile // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
