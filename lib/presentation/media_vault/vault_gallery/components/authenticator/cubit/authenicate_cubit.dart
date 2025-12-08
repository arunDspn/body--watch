import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/auth/i_auth_repository.dart';

part 'authenicate_state.dart';
part 'authenicate_cubit.freezed.dart';

class AuthenicateCubit extends Cubit<AuthenicateState> {
  AuthenicateCubit(this.authRepository)
      : super(const AuthenicateState.initial());

  final IAuthRepository authRepository;

  Future<void> authenticate(String password) async {
    try {
      emit(const AuthenicateState.loading());
      final result = await authRepository.authenticate(password: password);

      result.fold(
        (l) {
          emit(const AuthenicateState.unauthenticated());
        },
        (r) {
          emit(const AuthenicateState.authenticated());
        },
      );
    } catch (e) {
      emit(const AuthenicateState.failed('NO IDEA'));
    }
  }
}
