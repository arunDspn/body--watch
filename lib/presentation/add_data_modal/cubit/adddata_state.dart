part of 'adddata_cubit.dart';

@freezed
sealed class AdddataState with _$AdddataState {
  const factory AdddataState.initial() = AddDataInitial;
  const factory AdddataState.loading() = AddDataLoading;
  const factory AdddataState.failure(String message) = AddDataFailure;
  const factory AdddataState.success() = AddDataSuccess;
}
