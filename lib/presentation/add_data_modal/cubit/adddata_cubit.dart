import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
part 'adddata_state.dart';
part 'adddata_cubit.freezed.dart';

class AdddataCubit extends Cubit<AdddataState> {
  AdddataCubit(this.measurementRepository)
      : super(const AdddataState.initial());
  final MeasurementRepository measurementRepository;

  Future<void> insertData({
    required Measurement measurement,
  }) async {
    emit(const AdddataState.loading());
    final result = await measurementRepository.createMeasurement(
      measurement: measurement,
    );

    result.fold(
      (l) => emit(AdddataState.failure(l)),
      (r) => emit(
        const AdddataState.success(),
      ),
    );
  }

  //TODO: Delete it
  // Future<void> insertInitalData({
  //   required MeasurementWidget measurementWidget,
  //   required Measurement measurement,
  // }) async {
  //   emit(const AdddataState.loading());

  //   // Create DB

  //   // updating added widgets
  //   final _dbResult =
  //       await widgetRepository.addWidget(measurementWidget: measurementWidget);

  //   _dbResult.fold(
  //     (l) => emit(AdddataState.failure(l)),
  //     (r) => insertData(
  //       measurement: measurement,
  //       tableName: measurementWidget.tableName,
  //     ),
  //   );
  // }
}
