import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/models/app_preferences.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'getallmeasurments_state.dart';
part 'getallmeasurments_cubit.freezed.dart';

/// Used to get all measurements of specific type from the database
/// Specifically used in Type Detailed Screen
class GetSingleMeasurmentsDetailsCubit
    extends Cubit<GetSingleMeasurmentsDetailsState> {
  GetSingleMeasurmentsDetailsCubit(this.measurementRepository)
      : super(const GetSingleMeasurmentsDetailsState.initial());

  final MeasurementRepository measurementRepository;

  Future<void> fetchAllData({
    required String type,
    required AppPreferences appPreferences,
    // required DurationsEnum durationsEnum,
  }) async {
    emit(const GetSingleMeasurmentsDetailsState.loading());

    final _result =
        await measurementRepository.getMeasurementItemDataByDateRange(
      endDate: DateTime.now(),
      startDate: DateTime.now().subtract(const Duration(days: 7)),
      measurementItemId: -1,
      // type: type,
      // preferredWeightUnit: EnumToString.convertToString(
      //   appPreferences.weightUnit,
      // ),
      // preferredLengthUnit: EnumToString.convertToString(
      //   appPreferences.lengthUnit,
      // ),
      // startDate: enumToStartDate(durationsEnum),
    );

    _result.fold(
      (l) => emit(GetSingleMeasurmentsDetailsState.failed(cause: l)),
      (r) => emit(
        GetSingleMeasurmentsDetailsState.success(
          list: r,
          //todo: not required
          // durationsEnum: durationsEnum,
          // startDate: enumToStartDate(durationsEnum),
        ),
      ),
    );
  }

  void reloadList(String id) {
    final previousState = state;
    emit(const GetSingleMeasurmentsDetailsState.loading());
    // if (previousState is AllMeasurementsLoaded) {
    //   final list =
    //       previousState.list.where((element) => element.id != id).toList();
    //   // emit(
    //   //   previousState.copyWith(
    //   //     list: list,
    //   //   ),
    //   // );
    //   emit(
    //     GetSingleMeasurmentsDetailsState.success(
    //       list: list,
    //       // durationsEnum: previousState.durationsEnum,
    //       // startDate: previousState.startDate,
    //     ),
    //   );
    // }
  }
}
