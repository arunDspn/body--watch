import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_gate_state.dart';
part 'auth_gate_cubit.freezed.dart';

class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit() : super(const AuthGateState.loading());

  void authenicate() {
    emit(const AuthGateState.loading());
    emit(const AuthGateState.authenticated());
  }

  Future<void> unauthenicate() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(const AuthGateState.loading());
    emit(const AuthGateState.unauthenticated());
  }
}
