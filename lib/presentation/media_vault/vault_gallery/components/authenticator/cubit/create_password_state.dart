part of 'create_password_cubit.dart';

@freezed
class CreatePasswordState with _$CreatePasswordState {
  const factory CreatePasswordState.initial() = _Initial;
  // Loading

  const factory CreatePasswordState.loading() = _Loading;
  const factory CreatePasswordState.success() = _Success;
  const factory CreatePasswordState.failed(
    String message,
  ) = _Failed;
}
