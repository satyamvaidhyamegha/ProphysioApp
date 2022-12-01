import 'package:json_annotation/json_annotation.dart';
part 'upcoming_model.g.dart';

@JsonSerializable()
class UpcomingModel {
  int? id;
  int? doctor_id;
  int? user_id;
  String? health_condition;
  String? prefer_location;
  String? refer_by;
  String? session_location;
  String? start_time;
  String? end_time;
  String? status;
  String? details;
  String? equipment;
  String? createdAt;
  String? updatedAt;
  String? doctor_name;

  UpcomingModel({
    this.id,
    this.doctor_id,
    this.user_id,
    this.health_condition,
    this.createdAt,
    this.details,
    this.end_time,
    this.equipment,
    this.prefer_location,
    this.refer_by,
    this.session_location,
    this.start_time,
    this.status,
    this.updatedAt,
    this.doctor_name
  });
  factory UpcomingModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingModelFromJson(json);
  Map<String, dynamic> toJSon() => _$UpcomingModelToJson(this);
}
