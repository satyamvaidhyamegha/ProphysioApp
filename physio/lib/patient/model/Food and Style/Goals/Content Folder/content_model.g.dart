// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      summary: json['summary'] as String?,
      status: json['status'] as bool?,
      description: json['description'] as String?,
      featured_image: json['featured_image'] as String?,
      video: json['video'] as String?,
      is_featured: json['is_featured'] as bool?,
      reading_time: json['reading_time'] as int?,
      likes_number: json['likes_number'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$ContentModelToJson(ContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'summary': instance.summary,
      'status': instance.status,
      'description': instance.description,
      'featured_image': instance.featured_image,
      'video': instance.video,
      'is_featured': instance.is_featured,
      'likes_number': instance.likes_number,
      'reading_time': instance.reading_time,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'answer': instance.answer,
    };
