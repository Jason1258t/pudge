// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCreateDTO {

 String? get username; String? get bio; String? get avatarUrl;
/// Create a copy of UserCreateDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateDTOCopyWith<UserCreateDTO> get copyWith => _$UserCreateDTOCopyWithImpl<UserCreateDTO>(this as UserCreateDTO, _$identity);

  /// Serializes this UserCreateDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateDTO&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,bio,avatarUrl);

@override
String toString() {
  return 'UserCreateDTO(username: $username, bio: $bio, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserCreateDTOCopyWith<$Res>  {
  factory $UserCreateDTOCopyWith(UserCreateDTO value, $Res Function(UserCreateDTO) _then) = _$UserCreateDTOCopyWithImpl;
@useResult
$Res call({
 String? username, String? bio, String? avatarUrl
});




}
/// @nodoc
class _$UserCreateDTOCopyWithImpl<$Res>
    implements $UserCreateDTOCopyWith<$Res> {
  _$UserCreateDTOCopyWithImpl(this._self, this._then);

  final UserCreateDTO _self;
  final $Res Function(UserCreateDTO) _then;

/// Create a copy of UserCreateDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? bio = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserCreateDTO implements UserCreateDTO {
  const _UserCreateDTO({this.username, this.bio, this.avatarUrl});
  factory _UserCreateDTO.fromJson(Map<String, dynamic> json) => _$UserCreateDTOFromJson(json);

@override final  String? username;
@override final  String? bio;
@override final  String? avatarUrl;

/// Create a copy of UserCreateDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreateDTOCopyWith<_UserCreateDTO> get copyWith => __$UserCreateDTOCopyWithImpl<_UserCreateDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreateDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreateDTO&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,bio,avatarUrl);

@override
String toString() {
  return 'UserCreateDTO(username: $username, bio: $bio, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCreateDTOCopyWith<$Res> implements $UserCreateDTOCopyWith<$Res> {
  factory _$UserCreateDTOCopyWith(_UserCreateDTO value, $Res Function(_UserCreateDTO) _then) = __$UserCreateDTOCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? bio, String? avatarUrl
});




}
/// @nodoc
class __$UserCreateDTOCopyWithImpl<$Res>
    implements _$UserCreateDTOCopyWith<$Res> {
  __$UserCreateDTOCopyWithImpl(this._self, this._then);

  final _UserCreateDTO _self;
  final $Res Function(_UserCreateDTO) _then;

/// Create a copy of UserCreateDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? bio = freezed,Object? avatarUrl = freezed,}) {
  return _then(_UserCreateDTO(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
