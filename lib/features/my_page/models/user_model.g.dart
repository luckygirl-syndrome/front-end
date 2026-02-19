// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      nickname: json['nickname'] as String,
      profileImg: json['profile_img'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profile_img': instance.profileImg,
      'description': instance.description,
    };

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateRequestImpl(
      nickname: json['nickname'] as String?,
      profileImg: json['profile_img'] as String?,
    );

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
        _$ProfileUpdateRequestImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profile_img': instance.profileImg,
    };
