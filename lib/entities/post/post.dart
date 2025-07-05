import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/user/user.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required String title,
    required String description,
    required List<ImageData> images,
    User? author,
    required DateTime createdAt,
    required int commentsCount,
    required int likesCount,
    required bool isLiked,
    required double avgScore,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
