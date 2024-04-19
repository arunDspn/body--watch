import 'package:watcha_body/data/domain/models/vault_image_model.dart';

class CompareImagesModel {
  CompareImagesModel({
    required this.firstImages,
    required this.secondImages,
  });

  final List<VaultImage> firstImages;
  final List<VaultImage> secondImages;
}
