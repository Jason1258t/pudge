import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

part 'image.g.dart';

@freezed
abstract class ImageData with _$ImageData {
  const factory ImageData({
    required String id,
    required String originalUrl,
    double? width,
    double? height,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
}

extension ImageAspectRatio on ImageData {
  double get aspectRatio =>
      width != null && height != null ? width! / height! : 1;
}
