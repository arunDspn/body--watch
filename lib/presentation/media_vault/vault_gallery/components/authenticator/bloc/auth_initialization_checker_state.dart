part of 'auth_initialization_checker_bloc.dart';

@freezed
class AuthInitializationCheckerState with _$AuthInitializationCheckerState {
  const factory AuthInitializationCheckerState.initial() = _Initial;
  const factory AuthInitializationCheckerState.notInitialized() =
      _NotInitialized;
  const factory AuthInitializationCheckerState.initialized() = _Initialized;
  const factory AuthInitializationCheckerState.loading() = _Loading;
  const factory AuthInitializationCheckerState.failed(String message) = _Failed;
}
