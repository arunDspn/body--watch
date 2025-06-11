part of 'create_password_cubit.dart';

@freezed
sealed class CreatePasswordState with _$CreatePasswordState {
  const factory CreatePasswordState.initial() = CreatePasswordStateInitial;
  // Loading

  const factory CreatePasswordState.loading() = CreatePasswordStateLoading;
  const factory CreatePasswordState.success() = CreatePasswordStateSuccess;
  const factory CreatePasswordState.failed(
    String message,
  ) = CreatePasswordStateFailed;
}
