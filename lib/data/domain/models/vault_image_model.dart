import 'package:freezed_annotation/freezed_annotation.dart';
part 'vault_image_model.freezed.dart';
part 'vault_image_model.g.dart';

@freezed
class VaultImage with _$VaultImage {
  const factory VaultImage({
    required String tag,
    required String path,
    required DateTime date,
  }) = _VaultImage;

  factory VaultImage.fromJson(Map<String, dynamic> json) =>
      _$VaultImageFromJson(json);
}
