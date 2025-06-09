class CompareImagesModel {
  CompareImagesModel({
    required this.firstImages,
    required this.secondImages,
  });

  /// List of image paths for the first set of images
  final List<String> firstImages;

  /// List of image paths for the second set of images
  final List<String> secondImages;
}
