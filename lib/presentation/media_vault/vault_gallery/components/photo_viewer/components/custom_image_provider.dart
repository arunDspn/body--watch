import 'dart:typed_data';

import 'package:flutter/material.dart';

typedef DecryptFunction = Future<Uint8List> Function(String imagePath);

class CustomImageProvider extends ImageProvider<String> {
  CustomImageProvider(this.imagePath, this.decryptFunction);
  final String imagePath;
  final DecryptFunction decryptFunction;

  @override
  Future<String> obtainKey(ImageConfiguration configuration) async {
    return imagePath;
  }

  @override
  ImageStreamCompleter loadImage(String key, ImageDecoderCallback decode) {
    Future<ImageInfo> futureImage() async {
      final imageBytes = await decryptFunction(key);
      final image = await decodeImageFromList(imageBytes);
      return ImageInfo(image: image);
    }

    return OneFrameImageStreamCompleter(
      futureImage(),
    );
  }
}
