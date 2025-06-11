import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_gate_keeper_event.dart';
part 'auth_gate_keeper_state.dart';
part 'auth_gate_keeper_bloc.freezed.dart';

class AuthGateKeeperBloc
    extends Bloc<AuthGateKeeperEvent, AuthGateKeeperState> {
  AuthGateKeeperBloc() : super(const AuthGateKeeperState.loading()) {
    on<AuthGateKeeperEvent>((event, emit) {
      switch (event) {
        case _TriggerAuth():
          emit(const AuthGateKeeperState.authenticated());
          break;
        case _TriggerUnAuth():
          emit(const AuthGateKeeperState.unauthenticated());
          break;
      }

      // event.map(
      //   triggerAuth: (value) {},
      //   triggerUnAuth: (value) {},
      // );
    });
  }
}
