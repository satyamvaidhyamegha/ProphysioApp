import 'package:json_annotation/json_annotation.dart';
part 'setting_model.g.dart';

@JsonSerializable()
class SettingModel {
  int? id;
  int? user_id;
  int? contact;
  String? siri_search;
  int? notification;
  int? background_refresh;
  int? mobile_data;
  String? location;
  String? createdAt;
  String? updatedAt;

  SettingModel(
      {this.id,
      this.background_refresh,
      this.contact,
      this.location,
      this.mobile_data,
      this.notification,
      this.siri_search,
      this.user_id, this.createdAt, this.updatedAt});

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
  Map<String, dynamic> toJSon() => _$SettingModelToJson(this);
}
