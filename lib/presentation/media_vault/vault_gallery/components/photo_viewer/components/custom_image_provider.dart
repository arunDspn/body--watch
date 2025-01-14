import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

typedef DecryptFunction = Future<Uint8List> Function({
  required String path,
  required Uint8List nonce,
});

class CustomImageProvider extends ImageProvider<String> {
  CustomImageProvider(this.imagePath, this.decryptFunction, this.nonce);
  final String imagePath;
  final String nonce;
  final DecryptFunction decryptFunction;

  @override
  Future<String> obtainKey(ImageConfiguration configuration) async {
    return imagePath;
  }

  @override
  ImageStreamCompleter loadImage(String key, ImageDecoderCallback decode) {
    Future<ImageInfo> futureImage() async {
      final imageBytes =
          await decryptFunction(path: key, nonce: base64Decode(nonce));
      final image = await decodeImageFromList(imageBytes);
      return ImageInfo(image: image);
    }

    return OneFrameImageStreamCompleter(
      futureImage(),
    );
  }
}
