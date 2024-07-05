import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/i_auth_repository.dart';

part 'create_password_state.dart';
part 'create_password_cubit.freezed.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit(this.authRepository)
      : super(const CreatePasswordState.initial());

  final IAuthRepository authRepository;

  Future<void> createPassword(String password) async {
    emit(const CreatePasswordState.loading());
    final result = await authRepository.setPassword(password: password);

    result.fold(
      (l) {
        emit(CreatePasswordState.failed(l));
      },
      (r) {
        emit(const CreatePasswordState.success());
      },
    );
  }
}
