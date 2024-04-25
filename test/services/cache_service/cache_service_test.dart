import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watcha_body/services/cache_service/cache_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CacheService', () {
    late CacheService cacheService;
    late Directory appDocDir;

    setUp(() async {
      cacheService = CacheService();
      appDocDir = await getApplicationDocumentsDirectory();
    });

    tearDown(() {
      cacheService.clear();
    });

    test('store', () async {
      final file = File('test/test_data/test.txt');
      final fileName = 'test.txt';
      final cachedFilePath = await cacheService.store(file.path, fileName);
      expect(File(cachedFilePath).existsSync(), true);
    });

    test('storeFromBytes', () async {
      final bytes = 'Hello, world!'.codeUnits;
      final fileName = 'test.txt';
      final cachedFilePath = await cacheService.storeFromBytes(bytes, fileName);
      expect(File(cachedFilePath).existsSync(), true);
    });

    test('get', () async {
      final file = File('test/test_data/test.txt');
      final fileName = 'test.txt';
      await cacheService.store(file.path, fileName);
      final cachedFilePath = await cacheService.get(fileName);
      expect(cachedFilePath, isNotNull);
    });

    test('delete', () async {
      final file = File('test/test_data/test.txt');
      final fileName = 'test.txt';
      await cacheService.store(file.path, fileName);
      await cacheService.delete(fileName);
      expect(
          File('${appDocDir.path}/${CacheService.cachePath}/$fileName')
              .existsSync(),
          false);
    });

    test('clear', () async {
      final file = File('test/test_data/test.txt');
      final fileName = 'test.txt';
      await cacheService.store(file.path, fileName);
      await cacheService.clear();
      expect(
          Directory('${appDocDir.path}/${CacheService.cachePath}/')
              .existsSync(),
          false);
    });
  });
}
