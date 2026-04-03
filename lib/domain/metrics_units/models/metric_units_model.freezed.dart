// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric_units_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetricUnitsModel {

 String get unit; String get code;@JsonKey(name: 'to_base_factor') double get toBaseFactor;
/// Create a copy of MetricUnitsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricUnitsModelCopyWith<MetricUnitsModel> get copyWith => _$MetricUnitsModelCopyWithImpl<MetricUnitsModel>(this as MetricUnitsModel, _$identity);

  /// Serializes this MetricUnitsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricUnitsModel&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.code, code) || other.code == code)&&(identical(other.toBaseFactor, toBaseFactor) || other.toBaseFactor == toBaseFactor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,code,toBaseFactor);

@override
String toString() {
  return 'MetricUnitsModel(unit: $unit, code: $code, toBaseFactor: $toBaseFactor)';
}


}

/// @nodoc
abstract mixin class $MetricUnitsModelCopyWith<$Res>  {
  factory $MetricUnitsModelCopyWith(MetricUnitsModel value, $Res Function(MetricUnitsModel) _then) = _$MetricUnitsModelCopyWithImpl;
@useResult
$Res call({
 String unit, String code,@JsonKey(name: 'to_base_factor') double toBaseFactor
});




}
/// @nodoc
class _$MetricUnitsModelCopyWithImpl<$Res>
    implements $MetricUnitsModelCopyWith<$Res> {
  _$MetricUnitsModelCopyWithImpl(this._self, this._then);

  final MetricUnitsModel _self;
  final $Res Function(MetricUnitsModel) _then;

/// Create a copy of MetricUnitsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unit = null,Object? code = null,Object? toBaseFactor = null,}) {
  return _then(_self.copyWith(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,toBaseFactor: null == toBaseFactor ? _self.toBaseFactor : toBaseFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricUnitsModel].
extension MetricUnitsModelPatterns on MetricUnitsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricUnitsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricUnitsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricUnitsModel value)  $default,){
final _that = this;
switch (_that) {
case _MetricUnitsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricUnitsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetricUnitsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String unit,  String code, @JsonKey(name: 'to_base_factor')  double toBaseFactor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricUnitsModel() when $default != null:
return $default(_that.unit,_that.code,_that.toBaseFactor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String unit,  String code, @JsonKey(name: 'to_base_factor')  double toBaseFactor)  $default,) {final _that = this;
switch (_that) {
case _MetricUnitsModel():
return $default(_that.unit,_that.code,_that.toBaseFactor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String unit,  String code, @JsonKey(name: 'to_base_factor')  double toBaseFactor)?  $default,) {final _that = this;
switch (_that) {
case _MetricUnitsModel() when $default != null:
return $default(_that.unit,_that.code,_that.toBaseFactor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetricUnitsModel implements MetricUnitsModel {
  const _MetricUnitsModel({required this.unit, required this.code, @JsonKey(name: 'to_base_factor') required this.toBaseFactor});
  factory _MetricUnitsModel.fromJson(Map<String, dynamic> json) => _$MetricUnitsModelFromJson(json);

@override final  String unit;
@override final  String code;
@override@JsonKey(name: 'to_base_factor') final  double toBaseFactor;

/// Create a copy of MetricUnitsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricUnitsModelCopyWith<_MetricUnitsModel> get copyWith => __$MetricUnitsModelCopyWithImpl<_MetricUnitsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricUnitsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricUnitsModel&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.code, code) || other.code == code)&&(identical(other.toBaseFactor, toBaseFactor) || other.toBaseFactor == toBaseFactor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,code,toBaseFactor);

@override
String toString() {
  return 'MetricUnitsModel(unit: $unit, code: $code, toBaseFactor: $toBaseFactor)';
}


}

/// @nodoc
abstract mixin class _$MetricUnitsModelCopyWith<$Res> implements $MetricUnitsModelCopyWith<$Res> {
  factory _$MetricUnitsModelCopyWith(_MetricUnitsModel value, $Res Function(_MetricUnitsModel) _then) = __$MetricUnitsModelCopyWithImpl;
@override @useResult
$Res call({
 String unit, String code,@JsonKey(name: 'to_base_factor') double toBaseFactor
});




}
/// @nodoc
class __$MetricUnitsModelCopyWithImpl<$Res>
    implements _$MetricUnitsModelCopyWith<$Res> {
  __$MetricUnitsModelCopyWithImpl(this._self, this._then);

  final _MetricUnitsModel _self;
  final $Res Function(_MetricUnitsModel) _then;

/// Create a copy of MetricUnitsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unit = null,Object? code = null,Object? toBaseFactor = null,}) {
  return _then(_MetricUnitsModel(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,toBaseFactor: null == toBaseFactor ? _self.toBaseFactor : toBaseFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
