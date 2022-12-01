import 'package:json_annotation/json_annotation.dart';
part 'user_result.g.dart';

@JsonSerializable()
class UserResult {
  final int? id;
  final String? name;
  final String? first_name;
  final String? last_name;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final int? role;
  final String? rate;
  final String? location;
  final String? designation;
  final String? year_experience;
  final String? image;
  final int? rating;
  final String? reset_password_token;
  final String? reset_password_expires;
  final String? otp;
  final String? otp_expires;
  final int? agree;
  final String? visiting_hour;
  final String? address;
  final String? date_of_birth;
  final String? height;
  final String? weight;
  final String? blood_group;
  final String? phone2;
  final String? createdAt;
  final String? updatedAt;

  UserResult(
      {this.address,
      this.age,
      this.agree,
      this.blood_group,
      this.createdAt,
      this.date_of_birth,
      this.designation,
      this.email,
      this.gender,
      this.height,
      this.id,
      this.image,
      this.location,
      this.name,
      this.otp,
      this.otp_expires,
      this.phone,
      this.phone2,
      this.rate,
      this.rating,
      this.reset_password_expires,
      this.reset_password_token,
      this.role,
      this.updatedAt,
      this.visiting_hour,
      this.weight,
      this.year_experience, this.first_name, this.last_name});

  factory UserResult.fromJson(Map<String, dynamic> data) =>
      _$UserResultFromJson(data);
  Map<String, dynamic> toJson() => _$UserResultToJson(this);
}
