// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_dates_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TwoDatesRecord {
  String get name;
  double? get data1;
  double? get data2;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TwoDatesRecordCopyWith<TwoDatesRecord> get copyWith =>
      _$TwoDatesRecordCopyWithImpl<TwoDatesRecord>(
          this as TwoDatesRecord, _$identity);

  /// Serializes this TwoDatesRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TwoDatesRecord &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data1, data1) || other.data1 == data1) &&
            (identical(other.data2, data2) || other.data2 == data2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, data1, data2);

  @override
  String toString() {
    return 'TwoDatesRecord(name: $name, data1: $data1, data2: $data2)';
  }
}

/// @nodoc
abstract mixin class $TwoDatesRecordCopyWith<$Res> {
  factory $TwoDatesRecordCopyWith(
          TwoDatesRecord value, $Res Function(TwoDatesRecord) _then) =
      _$TwoDatesRecordCopyWithImpl;
  @useResult
  $Res call({String name, double? data1, double? data2});
}

/// @nodoc
class _$TwoDatesRecordCopyWithImpl<$Res>
    implements $TwoDatesRecordCopyWith<$Res> {
  _$TwoDatesRecordCopyWithImpl(this._self, this._then);

  final TwoDatesRecord _self;
  final $Res Function(TwoDatesRecord) _then;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? data2 = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      data2: freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TwoDatesRecord implements TwoDatesRecord {
  const _TwoDatesRecord(
      {required this.name, required this.data1, required this.data2});
  factory _TwoDatesRecord.fromJson(Map<String, dynamic> json) =>
      _$TwoDatesRecordFromJson(json);

  @override
  final String name;
  @override
  final double? data1;
  @override
  final double? data2;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TwoDatesRecordCopyWith<_TwoDatesRecord> get copyWith =>
      __$TwoDatesRecordCopyWithImpl<_TwoDatesRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TwoDatesRecordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TwoDatesRecord &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data1, data1) || other.data1 == data1) &&
            (identical(other.data2, data2) || other.data2 == data2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, data1, data2);

  @override
  String toString() {
    return 'TwoDatesRecord(name: $name, data1: $data1, data2: $data2)';
  }
}

/// @nodoc
abstract mixin class _$TwoDatesRecordCopyWith<$Res>
    implements $TwoDatesRecordCopyWith<$Res> {
  factory _$TwoDatesRecordCopyWith(
          _TwoDatesRecord value, $Res Function(_TwoDatesRecord) _then) =
      __$TwoDatesRecordCopyWithImpl;
  @override
  @useResult
  $Res call({String name, double? data1, double? data2});
}

/// @nodoc
class __$TwoDatesRecordCopyWithImpl<$Res>
    implements _$TwoDatesRecordCopyWith<$Res> {
  __$TwoDatesRecordCopyWithImpl(this._self, this._then);

  final _TwoDatesRecord _self;
  final $Res Function(_TwoDatesRecord) _then;

  /// Create a copy of TwoDatesRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? data2 = freezed,
  }) {
    return _then(_TwoDatesRecord(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _self.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      data2: freezed == data2
          ? _self.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
