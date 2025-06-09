import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FolderPath {
  FolderPath._({
    required this.imagesPath,
    required this.thumbnailsPath,
  });

  static Future<FolderPath> create({
    required String imagesFolderName,
    required String thumbnailsFolderName,
  }) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final imagesPath = '${appDocDir.path}/$imagesFolderName';
    final thumbnailsPath = '${appDocDir.path}/$thumbnailsFolderName';

    // Create directories if they don't exist
    final imageDirectory = Directory(imagesPath);
    if (!imageDirectory.existsSync()) {
      imageDirectory.createSync(recursive: true);
    }

    final thumbnailDirectory = Directory(thumbnailsPath);
    if (!thumbnailDirectory.existsSync()) {
      thumbnailDirectory.createSync(recursive: true);
    }

    return FolderPath._(
      imagesPath: imagesPath,
      thumbnailsPath: thumbnailsPath,
    );
  }

  final String imagesPath;
  final String thumbnailsPath;
}
