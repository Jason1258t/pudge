import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/entities/image/image.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  // @JsonSerializable(explicitToJson: true)
  const factory Post({
    required String id,
    required String title,
    required String description,
    required List<ImageData> images,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
