part of 'auth_gate_keeper_bloc.dart';

@freezed
abstract class AuthGateKeeperState with _$AuthGateKeeperState {
  const factory AuthGateKeeperState.loading() = _Loading;
  const factory AuthGateKeeperState.authenticated() = _Authenticated;
  const factory AuthGateKeeperState.unauthenticated() = _Unauthenticated;
}
