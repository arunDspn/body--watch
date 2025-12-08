import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/models/two_dates_record_model.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'comparison_data_state.dart';
part 'comparison_data_cubit.freezed.dart';

class ComparisonDataCubit extends Cubit<ComparisonDataState> {
  ComparisonDataCubit(this.measurementRepository)
      : super(const ComparisonDataState.initial());

  final MeasurementRepository measurementRepository;

  Future<void> loadData({
    required DateTime dateOne,
    required DateTime dateTwo,
  }) async {
    emit(const ComparisonDataState.loading());

    final result = await measurementRepository.getAllRecordsByTwoDates(
      dateOne: dateOne,
      dateTwo: dateTwo,
    );

    result.fold(
      (l) => emit(ComparisonDataState.failure(message: l)),
      (r) => emit(ComparisonDataState.success(records: r)),
    );
  }
}
