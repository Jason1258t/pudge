import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/user/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    required User author,
    required DateTime createAt,
    required int likesCount,
    List<ImageData>? attachments
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}