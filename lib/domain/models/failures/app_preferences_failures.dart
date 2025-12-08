import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_preferences_failures.freezed.dart';

@freezed
abstract class AppPreferencesFailure with _$AppPreferencesFailure {
  const factory AppPreferencesFailure.notPreferencesFound() =
      NotPreferencesFound;
  const factory AppPreferencesFailure.typicalFailure({
    required String message,
  }) = TypicalFailure;
}
