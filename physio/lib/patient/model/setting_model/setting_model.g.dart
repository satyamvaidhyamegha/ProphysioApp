// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) => SettingModel(
      id: json['id'] as int?,
      background_refresh: json['background_refresh'] as int?,
      contact: json['contact'] as int?,
      location: json['location'] as String?,
      mobile_data: json['mobile_data'] as int?,
      notification: json['notification'] as int?,
      siri_search: json['siri_search'] as String?,
      user_id: json['user_id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?
      
    );

Map<String, dynamic> _$SettingModelToJson(SettingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'contact': instance.contact,
      'siri_search': instance.siri_search,
      'notification': instance.notification,
      'background_refresh': instance.background_refresh,
      'mobile_data': instance.mobile_data,
      'location': instance.location,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt
    };
