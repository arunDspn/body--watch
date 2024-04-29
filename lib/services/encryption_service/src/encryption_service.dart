import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptService {
  EncryptService({
    required this.encryptionResultPort,
    required this.decryptionResultPort,
    required this.encryptionSendPort,
    required this.decryptionSendPort,
  });

  final Stream<dynamic> encryptionResultPort;
  final Stream<dynamic> decryptionResultPort;
  final SendPort encryptionSendPort;
  final SendPort decryptionSendPort;

  // static
  static const String _keyKey = 'asd2342d';
  static const String _ivKey = 'asd21434dsf4';
  static const secureStorage = FlutterSecureStorage();

  // final FlutterSecureStorage storage;
  static (Key, IV) _generateKeyAndIV() {
    // Generate a 128-bit key and a random 128-bit IV
    final key = Key.fromSecureRandom(16);
    final iv = IV.allZerosOfLength(16);

    return (key, iv);
  }

  static Future<(Key, IV)> generateAndStoreKeyAndIV() async {
    final (key, iv) = _generateKeyAndIV();

    // Store the key and IV in a secure location, using flutter_secure_storage
    // Create storage
    await EncryptService.secureStorage.write(key: _keyKey, value: key.base64);
    await EncryptService.secureStorage.write(key: _ivKey, value: iv.base64);

    return (key, iv);
  }

  static Future<(Key, IV)> getKeyAndIV() async {
    final keyString = await EncryptService.secureStorage.read(key: _keyKey);
    final ivString = await EncryptService.secureStorage.read(key: _ivKey);
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
    // final (key, iv) = await getKeyAndIV();

    // // Initialize encrypter with AES algorithm and key

    // final encrypter =
    //     Encrypter(AES(key)); // Initialize encrypter with AES algorithm and key

    final file = File(filePath); // Read photo from file path
    final photoBytes = await file.readAsBytes(); // Read photo as bytes

    // Encrypt photo bytes
    // final encryptedPhoto = encrypter.encryptBytes(photoBytes, iv: iv);

    encryptionSendPort.send(photoBytes);
    final encryptedPhotoBytes = await encryptionResultPort.first;

    if (encryptedPhotoBytes is! Uint8List) {
      throw Exception('encryptedPhotoBytes is not Uint8List');
    }
    return encryptedPhotoBytes;
  }

  Future<List<int>> decryptPhoto(Uint8List encryptedPhotoBytes) async {
    // final (key, iv) = await getKeyAndIV(); // Get key and IV from storage

    // Initialize encrypter with AES algorithm and key)

    // final encrypter =
    //     Encrypter(AES(key)); // Initialize encrypter with AES algorithm and key

    // Decrypt bytes
    // final decryptedBytes = Isolate.run(
    //   () => encrypter.decryptBytes(Encrypted(encryptedPhotoBytes), iv: iv),
    // );

    // Decrypt bytes (alternative)
    // final decryptedBytes =
    //     encrypter.decryptBytes(Encrypted(encryptedPhotoBytes), iv: iv);

    decryptionSendPort.send(encryptedPhotoBytes);
    final decryptedBytes = await decryptionResultPort.first;

    if (decryptedBytes is! List<int>) {
      throw Exception('decryptedBytes is not List<int>');
    }

    return decryptedBytes; // Return decrypted bytes as a list of ints
  }

  // // Static Isloates
  static Future<void> encryptPhotosFromBytes(
    List<dynamic> items,
  ) async {
    final sendPortToMain = items[0] as SendPort;
    final rootIsolateToken = items[1] as RootIsolateToken;

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
    final receivePort = ReceivePort();
    sendPortToMain.send(receivePort.sendPort);

    // Listen for messages from main isolate

    final (key, iv) = await EncryptService.getKeyAndIV();
    final encrypter = Encrypter(AES(key));

    receivePort.listen((message) {
      log(';;;;;--------------------------- encrypt');
      if (message is Uint8List) {
        log('message is Uint8List so starting to encrypt');
        final encryptedBytes = encrypter.encryptBytes(message, iv: iv).bytes;
        // Send encrypted bytes back to main isolate
        sendPortToMain.send(encryptedBytes);
      } else {
        log('message is not IsolatePayload');
      }
    });
  }

  static Future<void> decryptPhotosFromBytes(
    List<dynamic> items,
  ) async {
    final sendPortToMain = items[0] as SendPort;
    final rootIsolateToken = items[1] as RootIsolateToken;

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    final receivePort = ReceivePort();
    sendPortToMain.send(receivePort.sendPort);

    final (key, iv) = await EncryptService.getKeyAndIV();
    final encrypter = Encrypter(AES(key));

    // Listen for messages from main isolate
    receivePort.listen(
      (message) {
        // NEW
        if (message is Uint8List) {
          log('message is Uint8List so starting to decrypt');
          final encryptedBytes = encrypter.decryptBytes(
            Encrypted(message),
            iv: iv,
          );
          // Send encrypted bytes back to main isolate
          sendPortToMain.send(encryptedBytes);
        } else {
          log(message.runtimeType.toString());
          log('message is not Uint8List');
        }
      },
    );
  }
}
