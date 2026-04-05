import 'package:bloc/bloc.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/domain/measurement/models/measurement_model.dart';

class ChartDetailCubit extends Cubit<ChartDetailState> {
  ChartDetailCubit(this._repository) : super(const ChartDetailInitial());

  final MeasurementRepository _repository;

  Future<void> load({required int targetId, int userId = 1}) async {
    emit(const ChartDetailLoading());

    final result = await _repository.getMeasurementsByTarget(
      targetId: targetId,
      userId: userId,
    );

    result.fold(
      (error) => emit(ChartDetailFailure(error)),
      (measurements) => emit(ChartDetailLoaded(measurements)),
    );
  }
}

abstract class ChartDetailState {
  const ChartDetailState();
}

class ChartDetailInitial extends ChartDetailState {
  const ChartDetailInitial();
}

class ChartDetailLoading extends ChartDetailState {
  const ChartDetailLoading();
}

class ChartDetailLoaded extends ChartDetailState {
  const ChartDetailLoaded(this.measurements);

  final List<MeasurementModel> measurements;
}

class ChartDetailFailure extends ChartDetailState {
  const ChartDetailFailure(this.message);

  final String message;
}
