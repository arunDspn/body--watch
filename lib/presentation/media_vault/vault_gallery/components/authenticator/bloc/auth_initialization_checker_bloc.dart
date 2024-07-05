import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/i_auth_repository.dart';

part 'auth_initialization_checker_event.dart';
part 'auth_initialization_checker_state.dart';
part 'auth_initialization_checker_bloc.freezed.dart';

class AuthInitializationChecker extends Bloc<AuthInitializationCheckerEvents,
    AuthInitializationCheckerState> {
  AuthInitializationChecker(this.authRepository) : super(const _Initial()) {
    on<AuthInitializationCheckerEvents>((event, emit) async {
      await event.map(
        checkAuth: (value) async {
          final result = await authRepository.isUserInitialized();

          result.fold(
            (l) {
              emit(AuthInitializationCheckerState.failed(l.toLowerCase()));
            },
            (r) {
              if (r) {
                emit(const AuthInitializationCheckerState.initialized());
              } else {
                emit(const AuthInitializationCheckerState.notInitialized());
              }
            },
          );
        },
      );
    });
  }

  final IAuthRepository authRepository;
}
