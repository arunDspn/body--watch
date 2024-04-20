// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_dates_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TwoDatesRecord _$TwoDatesRecordFromJson(Map<String, dynamic> json) {
  return _TwoDatesRecord.fromJson(json);
}

/// @nodoc
mixin _$TwoDatesRecord {
  String get name => throw _privateConstructorUsedError;
  double? get data1 => throw _privateConstructorUsedError;
  double? get data2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TwoDatesRecordCopyWith<TwoDatesRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwoDatesRecordCopyWith<$Res> {
  factory $TwoDatesRecordCopyWith(
          TwoDatesRecord value, $Res Function(TwoDatesRecord) then) =
      _$TwoDatesRecordCopyWithImpl<$Res, TwoDatesRecord>;
  @useResult
  $Res call({String name, double? data1, double? data2});
}

/// @nodoc
class _$TwoDatesRecordCopyWithImpl<$Res, $Val extends TwoDatesRecord>
    implements $TwoDatesRecordCopyWith<$Res> {
  _$TwoDatesRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? data2 = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _value.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      data2: freezed == data2
          ? _value.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TwoDatesRecordImplCopyWith<$Res>
    implements $TwoDatesRecordCopyWith<$Res> {
  factory _$$TwoDatesRecordImplCopyWith(_$TwoDatesRecordImpl value,
          $Res Function(_$TwoDatesRecordImpl) then) =
      __$$TwoDatesRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double? data1, double? data2});
}

/// @nodoc
class __$$TwoDatesRecordImplCopyWithImpl<$Res>
    extends _$TwoDatesRecordCopyWithImpl<$Res, _$TwoDatesRecordImpl>
    implements _$$TwoDatesRecordImplCopyWith<$Res> {
  __$$TwoDatesRecordImplCopyWithImpl(
      _$TwoDatesRecordImpl _value, $Res Function(_$TwoDatesRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? data1 = freezed,
    Object? data2 = freezed,
  }) {
    return _then(_$TwoDatesRecordImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data1: freezed == data1
          ? _value.data1
          : data1 // ignore: cast_nullable_to_non_nullable
              as double?,
      data2: freezed == data2
          ? _value.data2
          : data2 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TwoDatesRecordImpl implements _TwoDatesRecord {
  const _$TwoDatesRecordImpl(
      {required this.name, required this.data1, required this.data2});

  factory _$TwoDatesRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$TwoDatesRecordImplFromJson(json);

  @override
  final String name;
  @override
  final double? data1;
  @override
  final double? data2;

  @override
  String toString() {
    return 'TwoDatesRecord(name: $name, data1: $data1, data2: $data2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwoDatesRecordImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data1, data1) || other.data1 == data1) &&
            (identical(other.data2, data2) || other.data2 == data2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, data1, data2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TwoDatesRecordImplCopyWith<_$TwoDatesRecordImpl> get copyWith =>
      __$$TwoDatesRecordImplCopyWithImpl<_$TwoDatesRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TwoDatesRecordImplToJson(
      this,
    );
  }
}

abstract class _TwoDatesRecord implements TwoDatesRecord {
  const factory _TwoDatesRecord(
      {required final String name,
      required final double? data1,
      required final double? data2}) = _$TwoDatesRecordImpl;

  factory _TwoDatesRecord.fromJson(Map<String, dynamic> json) =
      _$TwoDatesRecordImpl.fromJson;

  @override
  String get name;
  @override
  double? get data1;
  @override
  double? get data2;
  @override
  @JsonKey(ignore: true)
  _$$TwoDatesRecordImplCopyWith<_$TwoDatesRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
