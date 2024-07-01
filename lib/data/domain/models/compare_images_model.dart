import 'package:watcha_body/data/domain/display_vault_image_model.dart';

class CompareImagesModel {
  CompareImagesModel({
    required this.firstImages,
    required this.secondImages,
  });

  // final List<DisplayVaultImageModel> firstImages;
  // final List<DisplayVaultImageModel> secondImages;

  final List<String> firstImages;
  final List<String> secondImages;
}

// class CompareDisplayVaultImageModel {
//   final String tag;
//   final String path;
//   final Uint8List thumbnailData;
//   final DateTime date;
// }
