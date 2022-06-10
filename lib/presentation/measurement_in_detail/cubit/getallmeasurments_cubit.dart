import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'getallmeasurments_state.dart';
part 'getallmeasurments_cubit.freezed.dart';

/// Used to get all measurements of specific type from the database
/// Specifically used in Type Detailed Screen
class GetallmeasurmentsCubit extends Cubit<GetallmeasurmentsState> {
  GetallmeasurmentsCubit(this.measurementRepository)
      : super(const GetallmeasurmentsState.initial());

  final MeasurementRepository measurementRepository;

  Future<void> fetchAllData({
    required String type,
    required AppPreferences appPreferences,
  }) async {
    emit(const GetallmeasurmentsState.loading());

    final _result = await measurementRepository.getDetailsByDate(
      type: type,
      preferredWeightUnit: EnumToString.convertToString(
        appPreferences.weightUnit,
      ),
      preferredLengthUnit: EnumToString.convertToString(
        appPreferences.lengthUnit,
      ),
    );

    _result.fold(
      (l) => emit(GetallmeasurmentsState.failed(cause: l)),
      (r) => emit(GetallmeasurmentsState.success(list: r)),
    );
  }
}
