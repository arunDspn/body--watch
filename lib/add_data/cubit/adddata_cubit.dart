import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/repositories/chest_repo.dart';

part 'adddata_state.dart';
part 'adddata_cubit.freezed.dart';

class AdddataCubit extends Cubit<AdddataState> {
  AdddataCubit(this.chestRepo) : super(const AdddataState.initial());
  final ChestRepo chestRepo;

  Future<void> insertData(Chest chest) async {
    emit(const AdddataState.loading());
    final result = await chestRepo.createMeasurement(chest);

    result.fold(
      (l) => emit(AdddataState.failure(l)),
      (r) => emit(
        const AdddataState.success(),
      ),
    );
  }
}
