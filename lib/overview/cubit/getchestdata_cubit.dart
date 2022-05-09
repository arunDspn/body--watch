import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/chest_repo.dart';

part 'getchestdata_state.dart';
part 'getchestdata_cubit.freezed.dart';

class GetchestdataCubit extends Cubit<GetchestdataState> {
  final ChestRepo chestRepository;
  GetchestdataCubit(this.chestRepository)
      : super(const GetchestdataState.initial());

  Future<void> getDetails() async {
    emit(const GetchestdataState.loading());
    final _result = await chestRepository.getLatestDetails();

    _result.fold(
      (l) => emit(GetchestdataState.failure(l)),
      (r) => emit(
        GetchestdataState.success(r),
      ),
    );
  }
}
