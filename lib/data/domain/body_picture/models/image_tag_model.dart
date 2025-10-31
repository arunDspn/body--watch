import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_tag_model.g.dart';
part 'image_tag_model.freezed.dart';

@freezed
abstract class ImageTagModel with _$ImageTagModel {
  const factory ImageTagModel({
    required int id,
    required String tag,
  }) = _ImageTagModel;

  factory ImageTagModel.fromJson(Map<String, dynamic> json) =>
      _$ImageTagModelFromJson(json);
}
