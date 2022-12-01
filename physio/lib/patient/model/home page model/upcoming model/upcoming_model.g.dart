// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingModel _$UpcomingModelFromJson(Map<String, dynamic> json) =>
    UpcomingModel(
      id: json['id'] as int?,
      doctor_id: json['doctor_id'] as int?,
      user_id: json['user_id'] as int?,
      health_condition: json['health_condition'] as String?,
      createdAt: json['createdAt'] as String?,
      details: json['details'] as String?,
      end_time: json['end_time'] as String?,
      equipment: json['equipment'] as String?,
      prefer_location: json['prefer_location'] as String?,
      refer_by: json['refer_by'] as String?,
      session_location: json['session_location'] as String?,
      start_time: json['start_time'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updatedAt'] as String?,
      doctor_name: json['doctor_name'] as String?,
    );

Map<String, dynamic> _$UpcomingModelToJson(UpcomingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctor_id,
      'user_id': instance.user_id,
      'health_condition': instance.health_condition,
      'prefer_location': instance.prefer_location,
      'refer_by': instance.refer_by,
      'session_location': instance.session_location,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'status': instance.status,
      'details': instance.details,
      'equipment': instance.equipment,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'doctor_name': instance.doctor_name,
    };
