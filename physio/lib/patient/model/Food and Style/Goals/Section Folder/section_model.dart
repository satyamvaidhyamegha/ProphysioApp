import 'package:json_annotation/json_annotation.dart';
part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  int? id;
  String? title;
  String? tagline;
  String? createdAt;
  String? updatedAt;
  SectionModel({this.id, this.title, this.tagline, this.createdAt, this.updatedAt});
factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJSon() => _$SectionModelToJson(this);


}
