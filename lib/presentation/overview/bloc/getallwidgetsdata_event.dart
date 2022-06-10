part of 'getallwidgetsdata_bloc.dart';

@freezed
class GetallwidgetsdataEvent with _$GetallwidgetsdataEvent {
  const factory GetallwidgetsdataEvent.fetchAllData({
    required AppPreferences appPreferences,
  }) = _FetchAllData;
}
