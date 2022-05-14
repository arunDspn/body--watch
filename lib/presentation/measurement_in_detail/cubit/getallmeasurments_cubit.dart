import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';

part 'getallmeasurments_state.dart';
part 'getallmeasurments_cubit.freezed.dart';

class GetallmeasurmentsCubit extends Cubit<GetallmeasurmentsState> {
  GetallmeasurmentsCubit(this.measurementRepository)
      : super(const GetallmeasurmentsState.initial());

  final MeasurementRepository measurementRepository;

  Future<void> fetchAllData({
    required String tableName,
  }) async {
    emit(const GetallmeasurmentsState.loading());

    final _result = await measurementRepository.getAllDetails(
      tableName: tableName,
    );

    _result.fold(
      (l) => emit(GetallmeasurmentsState.failed(cause: l)),
      (r) => emit(GetallmeasurmentsState.success(list: r)),
    );
  }
}
