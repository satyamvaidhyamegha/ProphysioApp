import 'package:json_annotation/json_annotation.dart';
import 'package:physio/patient/model/user_model/user_result.dart';
part 'user.g.dart';
@JsonSerializable(explicitToJson: true)
class User {
  final String? message;
  final String? error;
  final UserResult? userResult;

  User({required this.message, required this.userResult, required this.error});

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
