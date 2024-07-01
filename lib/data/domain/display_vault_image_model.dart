import 'dart:typed_data';

class DisplayVaultImageModel {
  DisplayVaultImageModel({
    required this.tag,
    required this.path,
    required this.thumbnailData,
    required this.date,
  });

  final String tag;
  final String path;
  final Uint8List thumbnailData;
  final DateTime date;
}
