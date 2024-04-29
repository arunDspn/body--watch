// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isolate_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsolatePayload _$IsolatePayloadFromJson(Map<String, dynamic> json) {
  return _IsolatePayload.fromJson(json);
}

/// @nodoc
mixin _$IsolatePayload {
  @KeyConverter()
  Key get key => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get bytes => throw _privateConstructorUsedError;
  @IvConverter()
  IV get iv => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsolatePayloadCopyWith<IsolatePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsolatePayloadCopyWith<$Res> {
  factory $IsolatePayloadCopyWith(
          IsolatePayload value, $Res Function(IsolatePayload) then) =
      _$IsolatePayloadCopyWithImpl<$Res, IsolatePayload>;
  @useResult
  $Res call(
      {@KeyConverter() Key key,
      @Uint8ListConverter() Uint8List bytes,
      @IvConverter() IV iv});
}

/// @nodoc
class _$IsolatePayloadCopyWithImpl<$Res, $Val extends IsolatePayload>
    implements $IsolatePayloadCopyWith<$Res> {
  _$IsolatePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? bytes = null,
    Object? iv = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      iv: null == iv
          ? _value.iv
          : iv // ignore: cast_nullable_to_non_nullable
              as IV,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsolatePayloadImplCopyWith<$Res>
    implements $IsolatePayloadCopyWith<$Res> {
  factory _$$IsolatePayloadImplCopyWith(_$IsolatePayloadImpl value,
          $Res Function(_$IsolatePayloadImpl) then) =
      __$$IsolatePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@KeyConverter() Key key,
      @Uint8ListConverter() Uint8List bytes,
      @IvConverter() IV iv});
}

/// @nodoc
class __$$IsolatePayloadImplCopyWithImpl<$Res>
    extends _$IsolatePayloadCopyWithImpl<$Res, _$IsolatePayloadImpl>
    implements _$$IsolatePayloadImplCopyWith<$Res> {
  __$$IsolatePayloadImplCopyWithImpl(
      _$IsolatePayloadImpl _value, $Res Function(_$IsolatePayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? bytes = null,
    Object? iv = null,
  }) {
    return _then(_$IsolatePayloadImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      iv: null == iv
          ? _value.iv
          : iv // ignore: cast_nullable_to_non_nullable
              as IV,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IsolatePayloadImpl implements _IsolatePayload {
  const _$IsolatePayloadImpl(
      {@KeyConverter() required this.key,
      @Uint8ListConverter() required this.bytes,
      @IvConverter() required this.iv});

  factory _$IsolatePayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsolatePayloadImplFromJson(json);

  @override
  @KeyConverter()
  final Key key;
  @override
  @Uint8ListConverter()
  final Uint8List bytes;
  @override
  @IvConverter()
  final IV iv;

  @override
  String toString() {
    return 'IsolatePayload(key: $key, bytes: $bytes, iv: $iv)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsolatePayloadImpl &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            (identical(other.iv, iv) || other.iv == iv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, const DeepCollectionEquality().hash(bytes), iv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsolatePayloadImplCopyWith<_$IsolatePayloadImpl> get copyWith =>
      __$$IsolatePayloadImplCopyWithImpl<_$IsolatePayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsolatePayloadImplToJson(
      this,
    );
  }
}

abstract class _IsolatePayload implements IsolatePayload {
  const factory _IsolatePayload(
      {@KeyConverter() required final Key key,
      @Uint8ListConverter() required final Uint8List bytes,
      @IvConverter() required final IV iv}) = _$IsolatePayloadImpl;

  factory _IsolatePayload.fromJson(Map<String, dynamic> json) =
      _$IsolatePayloadImpl.fromJson;

  @override
  @KeyConverter()
  Key get key;
  @override
  @Uint8ListConverter()
  Uint8List get bytes;
  @override
  @IvConverter()
  IV get iv;
  @override
  @JsonKey(ignore: true)
  _$$IsolatePayloadImplCopyWith<_$IsolatePayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
