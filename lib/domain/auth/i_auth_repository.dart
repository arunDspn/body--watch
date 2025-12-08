import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, Unit>> setPassword({required String password});

  Future<Either<String, Unit>> authenticate({required String password});

  Future<Either<String, Unit>> changePassword(
    String oldPassword,
    String newPassword,
  );

  Future<Either<String, bool>> isUserInitialized();
}
