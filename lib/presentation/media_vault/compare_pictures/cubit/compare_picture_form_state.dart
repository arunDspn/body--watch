part of 'compare_picture_form_cubit.dart';

@freezed
sealed class ComparePictureFormState with _$ComparePictureFormState {
  const factory ComparePictureFormState.state({
    required int? tag,
    required List<int> targets,
    required DateTime? firstDate,
    required DateTime? secondDate,
    required bool ready,
  }) = ComparePictureFormStateData;
}
