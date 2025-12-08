import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/metrics/metrics_repository.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';

part 'get_all_metric_units_available_state.dart';
part 'get_all_metric_units_available_cubit.freezed.dart';

class GetAllMetricUnitsAvailableCubit
    extends Cubit<GetAllMetricUnitsAvailableState> {
  GetAllMetricUnitsAvailableCubit()
      : super(const GetAllMetricUnitsAvailableState.initial());

  final MetricsRepository metricsRepository = MetricsRepository();

  /// Fetch all metric units available
  Future<void> fetchAllMetricUnitsAvailable() async {
    emit(const GetAllMetricUnitsAvailableState.loading());
    try {
      final metricUnits = await metricsRepository.getAllMetricUnitsAvailable();

      emit(GetAllMetricUnitsAvailableState.loaded(metricUnits: metricUnits));
    } catch (e) {
      emit(GetAllMetricUnitsAvailableState.error(e.toString()));
    }
  }
}
