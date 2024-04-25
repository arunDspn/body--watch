import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptService {
  EncryptService({
    required this.storage,
  });

  static const String _keyKey = 'asd2342d';
  static const String _ivKey = 'asd21434dsf4';

  final FlutterSecureStorage storage;
  (Key, IV) _generateKeyAndIV() {
    // Generate a 128-bit key and a random 128-bit IV
    final key = Key.fromSecureRandom(16);
    final iv = IV.allZerosOfLength(16);

    return (key, iv);
  }

  Future<(Key, IV)> generateAndStoreKeyAndIV() async {
    final (key, iv) = _generateKeyAndIV();

    // Store the key and IV in a secure location, using flutter_secure_storage
    // Create storage
    await storage.write(key: _keyKey, value: key.base64);
    await storage.write(key: _ivKey, value: iv.base64);

    return (key, iv);
  }

  Future<(Key, IV)> getKeyAndIV() async {
    final keyString = await storage.read(key: _keyKey);
    final ivString = await storage.read(key: _ivKey);
    if (keyString != null && ivString != null) {
      final key = Key.fromBase64(keyString);
      final iv = IV.fromBase64(ivString);
      return (key, iv);
    } else {
      // throw Exception('Key and IV not found in storage');
      final (key, iv) = await generateAndStoreKeyAndIV();
      return (key, iv);
    }
  }

  Future<Uint8List> encryptPhoto({
    required String filePath,
  }) async {
    // Get key and IV from storage
    final (key, iv) = await getKeyAndIV();

    // Initialize encrypter with AES algorithm and key

    final encrypter =
        Encrypter(AES(key)); // Initialize encrypter with AES algorithm and key

    final file = File(filePath); // Read photo from file path
    final photoBytes = await file.readAsBytes(); // Read photo as bytes

    // Encrypt photo bytes
    final encryptedPhoto = encrypter.encryptBytes(photoBytes, iv: iv);

    return encryptedPhoto.bytes;
  }

  Future<List<int>> decryptPhoto(Uint8List encryptedPhotoBytes) async {
    final (key, iv) = await getKeyAndIV(); // Get key and IV from storage

    // Initialize encrypter with AES algorithm and key)

    final encrypter =
        Encrypter(AES(key)); // Initialize encrypter with AES algorithm and key

    // Decrypt bytes
    // final decryptedBytes = Isolate.run(
    //   () => encrypter.decryptBytes(Encrypted(encryptedPhotoBytes), iv: iv),
    // );

    // Decrypt bytes (alternative)
    final decryptedBytes =
        encrypter.decryptBytes(Encrypted(encryptedPhotoBytes), iv: iv);

    return decryptedBytes; // Return decrypted bytes as a list of ints
  }
}
