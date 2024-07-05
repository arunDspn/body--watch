import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watcha_body/data/domain/i_auth_repository.dart';

class LocalAuthRepositoryImpl implements IAuthRepository {
  LocalAuthRepositoryImpl({required this.secureStorage});
  final FlutterSecureStorage secureStorage;

  final hashedPasswordKey = 'hashed_password_key';
  @override
  Future<Either<String, Unit>> authenticate({required String password}) async {
    try {
      final hashedInputPassword = sha256.convert(password.codeUnits);
      final storedPassword = await secureStorage.read(key: hashedPasswordKey);
      if (storedPassword == null || storedPassword.isEmpty) {
        return left('No password stored');
      }

      final decodedStoredPassword = base64Decode(storedPassword);
      final storedDigest = Digest(decodedStoredPassword);

      // if (decodedStoredPassword != (hashedInputPassword.bytes as Uint8List)) {
      //   return left('Wrong password');
      // }

      if (hashedInputPassword != storedDigest) {
        return left('Wrong password');
      }

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> changePassword(
    String oldPassword,
    String newPassword,
  ) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Unit>> setPassword({required String password}) async {
    try {
      final hashedPassword = sha256.convert(password.codeUnits);
      await secureStorage.write(
        key: hashedPasswordKey,
        value: base64Encode(hashedPassword.bytes),
      );
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> isUserInitialized() async {
    try {
      final isThatSo = await secureStorage.containsKey(key: hashedPasswordKey);
      return right(isThatSo);
    } catch (e) {
      return left(e.toString());
    }
  }
}
