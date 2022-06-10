import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';

part 'getallwidgetsdata_event.dart';
part 'getallwidgetsdata_state.dart';
part 'getallwidgetsdata_bloc.freezed.dart';

// Used in Overview
class GetallwidgetsdataBloc
    extends Bloc<GetallwidgetsdataEvent, GetallwidgetsdataState> {
  GetallwidgetsdataBloc(this.measurementRepository) : super(const _Initial()) {
    on<GetallwidgetsdataEvent>((event, emit) async {
      await event.map(
        fetchAllData: (value) async {
          emit(const GetallwidgetsdataState.loading());
          final _addedWidgets = await measurementRepository.getAddedTypes();

          // emit(const GetallwidgetsdataState.success([]));

          await _addedWidgets.fold(
            (l) {
              emit(GetallwidgetsdataState.failure(l));
            },
            (addedWidgets) async {
              final _allDetailsresult =
                  await measurementRepository.getLatestDetails(
                preferredWeightUnit: EnumToString.convertToString(
                  value.appPreferences.weightUnit,
                ),
                preferredLengthUnit: EnumToString.convertToString(
                  value.appPreferences.lengthUnit,
                ),
              );

              //TODO: I think we can directly groupby the widget type
              _allDetailsresult.fold(
                (l) => emit(GetallwidgetsdataState.failure(l)),
                (allDetails) {
                  final _allDetails = <LatestMeasurementDisplayModel>[];
                  for (final e in addedWidgets) {
                    final _measurement = allDetails
                        .where((element) => element.type == e)
                        .toList();
                    final _measurementDisplay =
                        LatestMeasurementDisplayModel.fromMeasurementList(
                      measurement: _measurement,
                    );
                    _allDetails.add(_measurementDisplay);
                  }
                  emit(GetallwidgetsdataState.success(_allDetails));
                },
              );
            },
          );
        },
      );
    });
  }

  final MeasurementRepository measurementRepository;
}
