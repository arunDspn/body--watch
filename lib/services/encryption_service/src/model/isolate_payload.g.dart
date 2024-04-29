// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isolate_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsolatePayloadImpl _$$IsolatePayloadImplFromJson(Map<String, dynamic> json) =>
    _$IsolatePayloadImpl(
      key: const KeyConverter().fromJson(json['key'] as String),
      bytes: const Uint8ListConverter().fromJson(json['bytes'] as String),
      iv: const IvConverter().fromJson(json['iv'] as String),
    );

Map<String, dynamic> _$$IsolatePayloadImplToJson(
        _$IsolatePayloadImpl instance) =>
    <String, dynamic>{
      'key': const KeyConverter().toJson(instance.key),
      'bytes': const Uint8ListConverter().toJson(instance.bytes),
      'iv': const IvConverter().toJson(instance.iv),
    };
