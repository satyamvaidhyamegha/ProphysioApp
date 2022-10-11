import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  int? id;
  String? name;
  bool? enabled;
  

  NotificationModel({this.id, this.name, this.enabled});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJSon() => _$NotificationModelToJson(this);
}
