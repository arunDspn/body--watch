// Custom JsonConverter for Uint8List
// @JsonConverter()
import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:json_annotation/json_annotation.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    // if (json.isEmpty) return ;
    return Uint8List.fromList(base64Decode(json));
  }

  @override
  String toJson(Uint8List? object) {
    if (object == null) return '';
    return base64Encode(object);
  }
}

// Custom JsonConverter for IV
// Custom JsonConverter for IV
// @JsonConverter(explicitToJson: true)
class IvConverter implements JsonConverter<IV, String> {
  const IvConverter();

  @override
  IV fromJson(String json) {
    if (json.isEmpty) return IV.allZerosOfLength(0);
    return IV.fromBase64(json);
  }

  @override
  String toJson(IV? object) {
    if (object == null) return '';
    return object.base64;
  }
}

// Custom JsonConverter for Key
// @JsonConverter()
class KeyConverter implements JsonConverter<Key, String> {
  const KeyConverter();

  @override
  Key fromJson(String json) {
    if (json.isEmpty) return Key.allZerosOfLength(0);
    // Check for valid key formats (e.g., base64, hex)
    if (json.contains(RegExp(r'^[A-Za-z0-9+/=]+$'))) {
      return Key.fromBase64(json);
    } else if (json.contains(RegExp(r'^[0-9a-fA-F]+$'))) {
      return Key.fromUtf8(json);
    } else {
      throw ArgumentError('Invalid Key format in JSON: $json');
    }
  }

  @override
  String toJson(Key? object) {
    if (object == null) return '';
    return object
        .base64; // You can choose base64 or utf8 based on your preference
  }
}
