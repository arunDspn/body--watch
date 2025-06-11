part of 'auth_gate_keeper_bloc.dart';

@freezed
sealed class AuthGateKeeperState with _$AuthGateKeeperState {
  const factory AuthGateKeeperState.loading() = AuthGateKeeperStateLoading;
  const factory AuthGateKeeperState.authenticated() =
      AuthGateKeeperStateAuthenticated;
  const factory AuthGateKeeperState.unauthenticated() =
      AuthGateKeeperStateUnauthenticated;
}
