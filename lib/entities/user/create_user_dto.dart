import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_dto.freezed.dart';

part 'create_user_dto.g.dart';

@freezed
abstract class UserCreateDTO with _$UserCreateDTO {
  const factory UserCreateDTO({
    String? username,
    String? bio,
    String? avatarUrl,
  }) = _UserCreateDTO;

  factory UserCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCreateDTOFromJson(json);
}
