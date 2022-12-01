// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistorySessionModel _$HistorySessionModelFromJson(Map<String, dynamic> json) =>
    HistorySessionModel(
      message: json['message'] as String?,
      session_count: json['session_count'] as int?,
      days: json['days'] as int?,
      reward_point: json['reward_point'] as int?,
    );

Map<String, dynamic> _$HistorySessionModelToJson(
        HistorySessionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'session_count': instance.session_count,
      'days': instance.days,
      'reward_point': instance.reward_point,
    };
