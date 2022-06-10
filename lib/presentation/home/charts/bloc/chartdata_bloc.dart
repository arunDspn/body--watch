import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';

part 'chartdata_event.dart';
part 'chartdata_state.dart';
part 'chartdata_bloc.freezed.dart';

enum DurationsEnum {
  month1,
  month2,
  month3,
  month4,
  month6,
  month12,
}

class ChartdataBloc extends Bloc<ChartdataEvent, ChartdataState> {
  ChartdataBloc(this.measurementRepository) : super(const _Initial()) {
    on<ChartdataEvent>((event, emit) async {
      await event.map(
        fetchData: (value) async {
          emit(const ChartdataState.loading());
          final _data = await measurementRepository.getDetailsByDate(
            preferredWeightUnit: EnumToString.convertToString(
              value.appPreferences.weightUnit,
            ),
            preferredLengthUnit: EnumToString.convertToString(
              value.appPreferences.lengthUnit,
            ),
            endDate: DateTime.now(),
            startDate: _enumToStartDate(value.duration),
          );

          _data.fold(
            (l) => emit(ChartdataState.failed(cause: l)),
            (r) {
              var _groupedData = r.groupListsBy((element) => element.type);

              final _list = _groupedData.values.map((element) {
                return ChartDisplayModel.fromMeasurementList(
                  measurement: element,
                  name: element.first.type,
                );
              }).toList();
              emit(
                ChartdataState.success(
                  chartDisplayModelList: _list,
                  durationsEnum: value.duration,
                  startDate: _enumToStartDate(value.duration),
                ),
              );
            },
          );
        },
      );
    });
  }

  DateTime _enumToStartDate(DurationsEnum durationsEnum) {
    switch (durationsEnum) {
      case DurationsEnum.month1:
        return DateTime.now().subtract(const Duration(days: 30));
      case DurationsEnum.month2:
        return DateTime.now().subtract(const Duration(days: 60));
      case DurationsEnum.month3:
        return DateTime.now().subtract(const Duration(days: 90));
      case DurationsEnum.month4:
        return DateTime.now().subtract(const Duration(days: 120));
      case DurationsEnum.month6:
        return DateTime.now().subtract(const Duration(days: 180));
      case DurationsEnum.month12:
        return DateTime.now().subtract(const Duration(days: 365));
    }
  }

  final MeasurementRepository measurementRepository;
}
