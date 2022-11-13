import 'package:flutter/foundation.dart';

class OnboardDetailsModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNo;
  final String? email;

  OnboardDetailsModel(
      {this.id, this.firstName, this.lastName, this.mobileNo, this.email});

  toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'mobileNo': mobileNo,
        'email': email
      };

  copy(
          {required String firstName,
          required String lastName,
          required String mobileNo,
          required String email}) =>
      OnboardDetailsModel(
        firstName: this.firstName,
        lastName: this.lastName,
        mobileNo: this.mobileNo,
        email: this.email,
      );

  @override
  String toString() =>
      id.toString() +
      " " +
      firstName! +
      " " +
      lastName! +
      " " +
      mobileNo! +
      " " +
      email!;

  static OnboardDetailsModel fromMap(Map<String, dynamic> json) {
    return OnboardDetailsModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNo: json['mobileNo'],
      email: json['email'],
    );
  }
}
