part of 'auth_gate_cubit.dart';

@freezed
abstract class AuthGateState with _$AuthGateState {
  // Authenticated
  const factory AuthGateState.authenticated() = _Authenticated;
  // Unauthenticated
  const factory AuthGateState.unauthenticated() = _Unauthenticated;
  // Loading
  const factory AuthGateState.loading() = _Loading;
}
