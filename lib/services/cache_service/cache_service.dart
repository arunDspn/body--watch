// import 'dart:html';

// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_cache_manager/src/storage/cache_object.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CacheService {
  static const cachePath = 'tempCached';

  /// Stores data in the cache.
  /// Key is filename itself.
  /// Value is the data to be stored.
  Future<String> store(String filePath, String fileName) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    final file = File(filePath);

    // get file name from path
    // final filename = file.path.split('/').last;

    // create temp folder
    final dir = Directory('${appDocDir.path}/$cachePath');
    if (!dir.existsSync()) {
      dir.createSync();
    }

    // create temp folder
    final cachedFile =
        await file.copy('${appDocDir.path}/$cachePath/$fileName');
    return cachedFile.path;
  }

  Future<String> storeFromBytes(List<int> bytes, String fileName) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    // get file name from path
    // final filename = file.path.split('/').last;

    // create temp folder
    final dir = Directory('${appDocDir.path}/$cachePath');
    if (!dir.existsSync()) {
      dir.createSync();
    }

    // create temp folder
    final cachedFile = File('${appDocDir.path}/$cachePath/$fileName');
    cachedFile.writeAsBytesSync(bytes);
    return cachedFile.path;
  }

  /// Retrieves data from the cache.
  /// Returns null if the data is not in the cache.
  Future<String?> get(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    final cachedFile = File('${appDocDir.path}/$cachePath/$filename');
    if (cachedFile.existsSync()) {
      return cachedFile.path;
    }
    return null;
  }

  /// Deletes a data from the cache.
  Future<void> delete(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final file = File('${appDocDir.path}/$cachePath/$filename');
    if (file.existsSync()) {
      await file.delete();
    }
  }

  /// Deletes all data from the cache.
  Future<void> clear() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDocDir.path}/$cachePath/');
    final isExists = dir.existsSync();
    if (isExists) {
      dir.deleteSync(recursive: true);
    }
  }

  // /// Returns the size of the cache in bytes.
  // int size() {}

  // /// Returns the number of items in the cache.
  // int count() {}

  dos() async {
    // check for cache folder is empty or not
    final appDocDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDocDir.path}/$cachePath/');

    if (dir.existsSync()) {
      final files = dir.listSync();
      for (var file in files) {
        debugPrint(file.path);
      }
    } else {
      debugPrint('not exists');
    }
  }
}

// // cache_service.dart

// class CacheService {
//   static const key = 'customCacheKey';
//   static CacheManager instance = CacheManager(
//     Config(
//       key,
//       stalePeriod: const Duration(days: 7),
//       maxNrOfCacheObjects: 20,
//       repo: JsonCacheInfoRepository(databaseName: key),
//       // fileSystem: IOFileSystem(key),
//       fileService: HttpFileService(),
//     ),
//   );
//   void init() {}
// }

// class Max implements FileService {
//   @override
//   int concurrentFetches = 10;

//   @override
//   Future<FileServiceResponse> get(String url, {Map<String, String>? headers}) {
//     // TODO: implement get

//     FileSystem fileSystem = IOFileSystem(CacheService.key);
//     throw UnimplementedError();
//   }
// }

// class HttpsssFileService implements FileServiceResponse {
//   @override
//   // TODO: implement content
//   Stream<List<int>> get content => throw UnimplementedError();

//   @override
//   // TODO: implement contentLength
//   int? get contentLength => throw UnimplementedError();

//   @override
//   // TODO: implement eTag
//   String? get eTag => throw UnimplementedError();

//   @override
//   // TODO: implement fileExtension
//   String get fileExtension => throw UnimplementedError();

//   @override
//   // TODO: implement statusCode
//   int get statusCode => throw UnimplementedError();

//   @override
//   // TODO: implement validTill
//   DateTime get validTill => throw UnimplementedError();
// }
