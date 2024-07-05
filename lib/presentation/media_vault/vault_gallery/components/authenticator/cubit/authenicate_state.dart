part of 'authenicate_cubit.dart';

@freezed
class AuthenicateState with _$AuthenicateState {
  const factory AuthenicateState.initial() = _Initial;
  const factory AuthenicateState.authenticated() = _Authenticated;
  const factory AuthenicateState.unauthenticated() = _Unauthenticated;
  const factory AuthenicateState.loading() = _Loading;
  const factory AuthenicateState.failed(String message) = _Failed;
}
