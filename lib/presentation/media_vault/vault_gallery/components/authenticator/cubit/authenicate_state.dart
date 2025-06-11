part of 'authenicate_cubit.dart';

@freezed
sealed class AuthenicateState with _$AuthenicateState {
  const factory AuthenicateState.initial() = AuthenicateStateInitial;
  const factory AuthenicateState.authenticated() =
      AuthenicateStateAuthenticated;
  const factory AuthenicateState.unauthenticated() =
      AuthenicateStateUnauthenticated;
  const factory AuthenicateState.loading() = AuthenicateStateLoading;
  const factory AuthenicateState.failed(String message) =
      AuthenicateStateFailed;
}
