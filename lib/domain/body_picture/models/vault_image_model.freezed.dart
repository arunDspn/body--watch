// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VaultImageModel {

 int get id; String get tag; List<String> get targets; String get file;@JsonKey(name: 'thumbnail_file') String get thumbnailFile; DateTime get date; String get note;
/// Create a copy of VaultImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultImageModelCopyWith<VaultImageModel> get copyWith => _$VaultImageModelCopyWithImpl<VaultImageModel>(this as VaultImageModel, _$identity);

  /// Serializes this VaultImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other.targets, targets)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnailFile, thumbnailFile) || other.thumbnailFile == thumbnailFile)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tag,const DeepCollectionEquality().hash(targets),file,thumbnailFile,date,note);

@override
String toString() {
  return 'VaultImageModel(id: $id, tag: $tag, targets: $targets, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class $VaultImageModelCopyWith<$Res>  {
  factory $VaultImageModelCopyWith(VaultImageModel value, $Res Function(VaultImageModel) _then) = _$VaultImageModelCopyWithImpl;
@useResult
$Res call({
 int id, String tag, List<String> targets, String file,@JsonKey(name: 'thumbnail_file') String thumbnailFile, DateTime date, String note
});




}
/// @nodoc
class _$VaultImageModelCopyWithImpl<$Res>
    implements $VaultImageModelCopyWith<$Res> {
  _$VaultImageModelCopyWithImpl(this._self, this._then);

  final VaultImageModel _self;
  final $Res Function(VaultImageModel) _then;

/// Create a copy of VaultImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tag = null,Object? targets = null,Object? file = null,Object? thumbnailFile = null,Object? date = null,Object? note = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as List<String>,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnailFile: null == thumbnailFile ? _self.thumbnailFile : thumbnailFile // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultImageModel].
extension VaultImageModelPatterns on VaultImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultImageModel value)  $default,){
final _that = this;
switch (_that) {
case _VaultImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _VaultImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String tag,  List<String> targets,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultImageModel() when $default != null:
return $default(_that.id,_that.tag,_that.targets,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String tag,  List<String> targets,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)  $default,) {final _that = this;
switch (_that) {
case _VaultImageModel():
return $default(_that.id,_that.tag,_that.targets,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String tag,  List<String> targets,  String file, @JsonKey(name: 'thumbnail_file')  String thumbnailFile,  DateTime date,  String note)?  $default,) {final _that = this;
switch (_that) {
case _VaultImageModel() when $default != null:
return $default(_that.id,_that.tag,_that.targets,_that.file,_that.thumbnailFile,_that.date,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VaultImageModel implements VaultImageModel {
  const _VaultImageModel({required this.id, required this.tag, required final  List<String> targets, required this.file, @JsonKey(name: 'thumbnail_file') required this.thumbnailFile, required this.date, required this.note}): _targets = targets;
  factory _VaultImageModel.fromJson(Map<String, dynamic> json) => _$VaultImageModelFromJson(json);

@override final  int id;
@override final  String tag;
 final  List<String> _targets;
@override List<String> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}

@override final  String file;
@override@JsonKey(name: 'thumbnail_file') final  String thumbnailFile;
@override final  DateTime date;
@override final  String note;

/// Create a copy of VaultImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultImageModelCopyWith<_VaultImageModel> get copyWith => __$VaultImageModelCopyWithImpl<_VaultImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaultImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other._targets, _targets)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnailFile, thumbnailFile) || other.thumbnailFile == thumbnailFile)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tag,const DeepCollectionEquality().hash(_targets),file,thumbnailFile,date,note);

@override
String toString() {
  return 'VaultImageModel(id: $id, tag: $tag, targets: $targets, file: $file, thumbnailFile: $thumbnailFile, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class _$VaultImageModelCopyWith<$Res> implements $VaultImageModelCopyWith<$Res> {
  factory _$VaultImageModelCopyWith(_VaultImageModel value, $Res Function(_VaultImageModel) _then) = __$VaultImageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String tag, List<String> targets, String file,@JsonKey(name: 'thumbnail_file') String thumbnailFile, DateTime date, String note
});




}
/// @nodoc
class __$VaultImageModelCopyWithImpl<$Res>
    implements _$VaultImageModelCopyWith<$Res> {
  __$VaultImageModelCopyWithImpl(this._self, this._then);

  final _VaultImageModel _self;
  final $Res Function(_VaultImageModel) _then;

/// Create a copy of VaultImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tag = null,Object? targets = null,Object? file = null,Object? thumbnailFile = null,Object? date = null,Object? note = null,}) {
  return _then(_VaultImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<String>,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnailFile: null == thumbnailFile ? _self.thumbnailFile : thumbnailFile // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
