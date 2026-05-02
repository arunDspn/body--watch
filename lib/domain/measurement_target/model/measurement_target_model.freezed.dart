// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_target_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeasurementTargetModel {

 int get id; String get name; String get code; String get type; String get category;@JsonKey(name: 'metric_code') String get metricCode;@JsonKey(name: 'display_order') int get displayOrder; List<MetricUnitsModel> get units;@JsonKey(name: 'is_custom') bool get isCustom;
/// Create a copy of MeasurementTargetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementTargetModelCopyWith<MeasurementTargetModel> get copyWith => _$MeasurementTargetModelCopyWithImpl<MeasurementTargetModel>(this as MeasurementTargetModel, _$identity);

  /// Serializes this MeasurementTargetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementTargetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,category,metricCode,displayOrder,const DeepCollectionEquality().hash(units),isCustom);

@override
String toString() {
  return 'MeasurementTargetModel(id: $id, name: $name, code: $code, type: $type, category: $category, metricCode: $metricCode, displayOrder: $displayOrder, units: $units, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class $MeasurementTargetModelCopyWith<$Res>  {
  factory $MeasurementTargetModelCopyWith(MeasurementTargetModel value, $Res Function(MeasurementTargetModel) _then) = _$MeasurementTargetModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String code, String type, String category,@JsonKey(name: 'metric_code') String metricCode,@JsonKey(name: 'display_order') int displayOrder, List<MetricUnitsModel> units,@JsonKey(name: 'is_custom') bool isCustom
});




}
/// @nodoc
class _$MeasurementTargetModelCopyWithImpl<$Res>
    implements $MeasurementTargetModelCopyWith<$Res> {
  _$MeasurementTargetModelCopyWithImpl(this._self, this._then);

  final MeasurementTargetModel _self;
  final $Res Function(MeasurementTargetModel) _then;

/// Create a copy of MeasurementTargetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? category = null,Object? metricCode = null,Object? displayOrder = null,Object? units = null,Object? isCustom = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<MetricUnitsModel>,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MeasurementTargetModel].
extension MeasurementTargetModelPatterns on MeasurementTargetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeasurementTargetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeasurementTargetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeasurementTargetModel value)  $default,){
final _that = this;
switch (_that) {
case _MeasurementTargetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeasurementTargetModel value)?  $default,){
final _that = this;
switch (_that) {
case _MeasurementTargetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String code,  String type,  String category, @JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'display_order')  int displayOrder,  List<MetricUnitsModel> units, @JsonKey(name: 'is_custom')  bool isCustom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeasurementTargetModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.category,_that.metricCode,_that.displayOrder,_that.units,_that.isCustom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String code,  String type,  String category, @JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'display_order')  int displayOrder,  List<MetricUnitsModel> units, @JsonKey(name: 'is_custom')  bool isCustom)  $default,) {final _that = this;
switch (_that) {
case _MeasurementTargetModel():
return $default(_that.id,_that.name,_that.code,_that.type,_that.category,_that.metricCode,_that.displayOrder,_that.units,_that.isCustom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String code,  String type,  String category, @JsonKey(name: 'metric_code')  String metricCode, @JsonKey(name: 'display_order')  int displayOrder,  List<MetricUnitsModel> units, @JsonKey(name: 'is_custom')  bool isCustom)?  $default,) {final _that = this;
switch (_that) {
case _MeasurementTargetModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.category,_that.metricCode,_that.displayOrder,_that.units,_that.isCustom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeasurementTargetModel extends MeasurementTargetModel {
  const _MeasurementTargetModel({required this.id, required this.name, required this.code, required this.type, required this.category, @JsonKey(name: 'metric_code') required this.metricCode, @JsonKey(name: 'display_order') required this.displayOrder, required final  List<MetricUnitsModel> units, @JsonKey(name: 'is_custom') this.isCustom = false}): _units = units,super._();
  factory _MeasurementTargetModel.fromJson(Map<String, dynamic> json) => _$MeasurementTargetModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String code;
@override final  String type;
@override final  String category;
@override@JsonKey(name: 'metric_code') final  String metricCode;
@override@JsonKey(name: 'display_order') final  int displayOrder;
 final  List<MetricUnitsModel> _units;
@override List<MetricUnitsModel> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override@JsonKey(name: 'is_custom') final  bool isCustom;

/// Create a copy of MeasurementTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasurementTargetModelCopyWith<_MeasurementTargetModel> get copyWith => __$MeasurementTargetModelCopyWithImpl<_MeasurementTargetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeasurementTargetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeasurementTargetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.metricCode, metricCode) || other.metricCode == metricCode)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,type,category,metricCode,displayOrder,const DeepCollectionEquality().hash(_units),isCustom);

@override
String toString() {
  return 'MeasurementTargetModel(id: $id, name: $name, code: $code, type: $type, category: $category, metricCode: $metricCode, displayOrder: $displayOrder, units: $units, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class _$MeasurementTargetModelCopyWith<$Res> implements $MeasurementTargetModelCopyWith<$Res> {
  factory _$MeasurementTargetModelCopyWith(_MeasurementTargetModel value, $Res Function(_MeasurementTargetModel) _then) = __$MeasurementTargetModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String code, String type, String category,@JsonKey(name: 'metric_code') String metricCode,@JsonKey(name: 'display_order') int displayOrder, List<MetricUnitsModel> units,@JsonKey(name: 'is_custom') bool isCustom
});




}
/// @nodoc
class __$MeasurementTargetModelCopyWithImpl<$Res>
    implements _$MeasurementTargetModelCopyWith<$Res> {
  __$MeasurementTargetModelCopyWithImpl(this._self, this._then);

  final _MeasurementTargetModel _self;
  final $Res Function(_MeasurementTargetModel) _then;

/// Create a copy of MeasurementTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? category = null,Object? metricCode = null,Object? displayOrder = null,Object? units = null,Object? isCustom = null,}) {
  return _then(_MeasurementTargetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,metricCode: null == metricCode ? _self.metricCode : metricCode // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<MetricUnitsModel>,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
