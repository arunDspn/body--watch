import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_gate_keeper_event.dart';
part 'auth_gate_keeper_state.dart';
part 'auth_gate_keeper_bloc.freezed.dart';

class AuthGateKeeperBloc
    extends Bloc<AuthGateKeeperEvent, AuthGateKeeperState> {
  AuthGateKeeperBloc() : super(const _Loading()) {
    on<AuthGateKeeperEvent>((event, emit) {
      event.map(
        triggerAuth: (value) {
          emit(const AuthGateKeeperState.authenticated());
        },
        triggerUnAuth: (value) {
          emit(const AuthGateKeeperState.unauthenticated());
        },
      );
    });
  }
}
