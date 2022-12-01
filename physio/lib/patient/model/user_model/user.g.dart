// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      message: json['message'] as String?,
      userResult: json['userResult'] == null
          ? null
          : UserResult.fromJson(json['userResult'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'userResult': instance.userResult?.toJson(),
    };
