import 'package:json_annotation/json_annotation.dart';
part 'history_model.g.dart';

@JsonSerializable()
class HistorySessionModel {
  String? message;
  int? session_count;
  int? days;
  int? reward_point;

  HistorySessionModel(
      {this.message, this.session_count, this.days, this.reward_point});

  factory HistorySessionModel.fromJson(Map<String, dynamic> json) =>
      _$HistorySessionModelFromJson(json);
  Map<String, dynamic> toJSon() => _$HistorySessionModelToJson(this);
}
