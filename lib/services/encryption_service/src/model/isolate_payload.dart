import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:watcha_body/services/encryption_service/src/model/convertors.dart';
part 'isolate_payload.freezed.dart';
part 'isolate_payload.g.dart';

@freezed
class IsolatePayload with _$IsolatePayload {
  const factory IsolatePayload({
    @KeyConverter() required Key key,
    @Uint8ListConverter() required Uint8List bytes,
    @IvConverter() required IV iv,
  }) = _IsolatePayload;

  factory IsolatePayload.fromJson(Map<String, Object?> json) =>
      _$IsolatePayloadFromJson(json);

  // tojson
  // Map<String, dynamic> toJson() => _$IsolatePayloadToJson(this);

  // @JsonKey(fromJson: _bytesFromJson, toJson: _bytesToJson)
  // // Custom logic to convert from JSON to Uint8List
  // static Uint8List _bytesFromJson(List<int> json) => Uint8List.fromList(json);

  // // Custom logic to convert from Uint8List to JSON
  // static List<int> _bytesToJson(Uint8List bytes) => bytes.toList();
}
