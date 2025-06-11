part of 'auth_initialization_checker_bloc.dart';

@freezed
sealed class AuthInitializationCheckerEvents
    with _$AuthInitializationCheckerEvents {
  const factory AuthInitializationCheckerEvents.checkAuth() = _CheckAuth;
}
