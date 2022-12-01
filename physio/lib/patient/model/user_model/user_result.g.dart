// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResult _$UserResultFromJson(Map<String, dynamic> json) => UserResult(
      address: json['address'] as String?,
      age: json['age'] as int?,
      agree: json['agree'] as int?,
      blood_group: json['blood_group'] as String?,
      createdAt: json['createdAt'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      height: json['height'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      otp: json['otp'] as String?,
      otp_expires: json['otp_expires'] as String?,
      phone: json['phone'] as String?,
      phone2: json['phone2'] as String?,
      rate: json['rate'] as String?,
      rating: json['rating'] as int?,
      reset_password_expires: json['reset_password_expires'] as String?,
      reset_password_token: json['reset_password_token'] as String?,
      role: json['role'] as int?,
      updatedAt: json['updatedAt'] as String?,
      visiting_hour: json['visiting_hour'] as String?,
      weight: json['weight'] as String?,
      year_experience: json['year_experience'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
    );

Map<String, dynamic> _$UserResultToJson(UserResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'rate': instance.rate,
      'location': instance.location,
      'designation': instance.designation,
      'year_experience': instance.year_experience,
      'image': instance.image,
      'rating': instance.rating,
      'reset_password_token': instance.reset_password_token,
      'reset_password_expires': instance.reset_password_expires,
      'otp': instance.otp,
      'otp_expires': instance.otp_expires,
      'agree': instance.agree,
      'visiting_hour': instance.visiting_hour,
      'address': instance.address,
      'date_of_birth': instance.date_of_birth,
      'height': instance.height,
      'weight': instance.weight,
      'blood_group': instance.blood_group,
      'phone2': instance.phone2,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
