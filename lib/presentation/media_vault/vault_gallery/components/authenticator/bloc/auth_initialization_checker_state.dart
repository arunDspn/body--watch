part of 'auth_initialization_checker_bloc.dart';

@freezed
sealed class AuthInitializationCheckerState
    with _$AuthInitializationCheckerState {
  const factory AuthInitializationCheckerState.initial() =
      AuthInitializationCheckerStateInitial;
  const factory AuthInitializationCheckerState.notInitialized() =
      AuthInitializationCheckerStateNotInitialized;
  const factory AuthInitializationCheckerState.initialized() =
      AuthInitializationCheckerStateInitialized;
  const factory AuthInitializationCheckerState.loading() =
      AuthInitializationCheckerStateLoading;
  const factory AuthInitializationCheckerState.failed(String message) =
      AuthInitializationCheckerStateFailed;
}
