import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/entities/image/image.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String username,
    String? bio,
    ImageData? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
