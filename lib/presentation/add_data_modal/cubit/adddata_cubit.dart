import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/repositories/widget_repository.dart';

part 'adddata_state.dart';
part 'adddata_cubit.freezed.dart';

class AdddataCubit extends Cubit<AdddataState> {
  AdddataCubit(this.measurementRepository, this.widgetRepository)
      : super(const AdddataState.initial());
  final MeasurementRepository measurementRepository;
  final WidgetRepository widgetRepository;

  Future<void> insertData({
    required Measurement measurement,
    required String tableName,
  }) async {
    emit(const AdddataState.loading());
    final result = await measurementRepository.createMeasurement(
      measurement: measurement,
      tableName: tableName,
    );

    result.fold(
      (l) => emit(AdddataState.failure(l)),
      (r) => emit(
        const AdddataState.success(),
      ),
    );
  }

  Future<void> insertInitalData({
    required MeasurementWidget measurementWidget,
    required Measurement measurement,
  }) async {
    emit(const AdddataState.loading());

    // Create DB

    // updating added widgets
    final _dbResult =
        await widgetRepository.addWidget(measurementWidget: measurementWidget);

    _dbResult.fold(
      (l) => emit(AdddataState.failure(l)),
      (r) => insertData(
        measurement: measurement,
        tableName: measurementWidget.tableName,
      ),
    );
  }
}
