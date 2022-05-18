import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/failures/app_preferences_failures.dart';

abstract class IAppPreferences {
  /// Get App Preferences from shared preferences
  /// Returns [Either] of [AppPreferences] or [AppPreferencesFailure]
  ///
  /// [AppPreferencesFailure] can be
  /// 1. [AppPreferencesFailure.notPreferencesFound]
  ///   That means its first time user
  ///
  /// 2. [AppPreferencesFailure.typicalFailure]
  ///   It can be any failure
  Future<Either<AppPreferencesFailure, AppPreferences>> getPreferences();

  /// Set Intial App Preferences to shared preferences
  /// Returns [Either] of [AppPreferences] or [AppPreferencesFailure]
  Future<Either<AppPreferencesFailure, AppPreferences>> setIntialPreferences({
    required AppPreferences appPreferences,
  });

  /// Set App Preferences to shared preferences
  /// Returns [Either] of [AppPreferences] or [AppPreferencesFailure]
  Future<Either<AppPreferencesFailure, AppPreferences>> setPreferencess({
    required AppPreferences appPreferences,
  });
}
