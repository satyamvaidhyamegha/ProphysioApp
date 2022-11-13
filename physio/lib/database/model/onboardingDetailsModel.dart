import 'package:flutter/foundation.dart';

class OnboardDetailsModel {
  final int id;
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String email;
  final String password;
  final String physioimg;

  OnboardDetailsModel(
      {required this.id,required this.firstName,required this.lastName,required this.mobileNo,required this.email, required this.password, required this.physioimg});

  toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'mobileNo': mobileNo,
        'email': email,
    'password': password,
    'physioimg': physioimg,
      };

  copy(
          {required int id,
            required String firstName,
          required String lastName,
          required String mobileNo,
          required String email,
          required String password,
          required String physioimg,}) =>
      OnboardDetailsModel(
        id: this.id,
        firstName: this.firstName,
        lastName: this.lastName,
        mobileNo: this.mobileNo,
        email: this.email,
        password: this.password,
        physioimg: this.physioimg,
      );

  @override
  String toString() =>
      id.toString() +
      " " +
      firstName +
      " " +
      lastName +
      " " +
      mobileNo +
      " " +
      email +
          " " +
          password +
          " " +
          physioimg;

  static OnboardDetailsModel fromMap(Map<String, dynamic> json) {
    return OnboardDetailsModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNo: json['mobileNo'],
      email: json['email'],
      password: json['password'],
      physioimg: json['physioimg'],
    );
  }
}
