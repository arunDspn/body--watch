import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';

part 'all_available_targets_state.dart';
part 'all_available_targets_cubit.freezed.dart';

class AllAvailableTargetsCubit extends Cubit<AllAvailableTargetsState> {
  AllAvailableTargetsCubit(this.measurementsFacade)
    : super(const AllAvailableTargetsState.initial());

  final IMeasurementsFacade measurementsFacade;

  Future<void> fetch() async {
    emit(const AllAvailableTargetsState.loading());

    final result = await measurementsFacade.getAllTargets();

    result.fold(
      (l) => emit(AllAvailableTargetsState.failure(l)),
      (r) => emit(AllAvailableTargetsState.success(targets: r)),
    );
  }
}
