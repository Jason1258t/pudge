// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCreateDTO _$UserCreateDTOFromJson(Map<String, dynamic> json) =>
    _UserCreateDTO(
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserCreateDTOToJson(_UserCreateDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'bio': instance.bio,
      'avatarUrl': instance.avatarUrl,
    };
