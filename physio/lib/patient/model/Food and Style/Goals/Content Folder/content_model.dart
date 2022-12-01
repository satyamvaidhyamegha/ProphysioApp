import 'package:json_annotation/json_annotation.dart';
part 'content_model.g.dart';

@JsonSerializable()
class ContentModel {
  int? id;
  String? title;
  String? subtitle;
  String? summary;
  bool? status;
  String? description;
  String? featured_image;
  String? video;
  bool? is_featured;
  int? likes_number;
  int? reading_time;
  String? createdAt;
  String? updatedAt;
  String? answer;
 

  ContentModel(
      {this.id,
      this.title,
      this.subtitle,
      this.summary,
      this.status,
      this.description,
      this.featured_image,
      this.video,
      this.is_featured,
      this.reading_time,
      this.likes_number,
      this.createdAt,
      this.updatedAt,
      this.answer});
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
  Map<String, dynamic> toJSon() => _$ContentModelToJson(this);
}
