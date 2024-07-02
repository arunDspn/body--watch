import 'dart:typed_data';

class DisplayVaultImageModel {
  DisplayVaultImageModel({
    required this.id,
    required this.tag,
    required this.file,
    required this.thumbnailData,
    required this.date,
  });

  final String id;
  final String tag;
  final String file;
  final Uint8List thumbnailData;
  final DateTime date;
}
