part of 'auth_gate_keeper_bloc.dart';

@freezed
class AuthGateKeeperEvent with _$AuthGateKeeperEvent {
  // const factory AuthGateKeeperEvent.checkAuth() = _CheckAuth;

  const factory AuthGateKeeperEvent.triggerAuth() = _TriggerAuth;
  const factory AuthGateKeeperEvent.triggerUnAuth() = _TriggerUnAuth;
}
