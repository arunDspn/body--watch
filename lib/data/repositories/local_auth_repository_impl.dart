import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watcha_body/data/domain/i_auth_repository.dart';

class LocalAuthRepositoryImpl implements IAuthRepository {
  LocalAuthRepositoryImpl({
    required this.secureStorage,
  });
  final FlutterSecureStorage secureStorage;

  final hashedPasswordKey = 'hashed_password_key';
  @override
  Future<Either<String, Unit>> authenticate({
    required String password,
  }) async {
    try {
      final hashedInputPassword = sha256.convert(password.codeUnits);

      final storedPassword = await secureStorage.read(key: hashedPasswordKey);
      if (storedPassword == null || storedPassword.isEmpty) {
        return left('No password stored');
      }
      final decodedStoredPassword = base64Decode(storedPassword);
      final storedDigest = Digest(decodedStoredPassword);

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
  ) async {
    try {
      // Authenticate with old password
      final authResult = await authenticate(password: oldPassword);
      return await authResult.fold(
        left,
        (_) async {
          // Set new password
          final setResult = await setPassword(password: newPassword);
          return setResult.fold(
            left,
            (_) => right(unit),
          );
        },
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> setPassword({
    required String password,
  }) async {
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
