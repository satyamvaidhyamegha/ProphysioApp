import 'dart:convert';

class SignUpResponse {
  final String name;

  SignUpResponse({required this.name});

  factory SignUpResponse.fromJson(Map<dynamic, dynamic> json) {
    return SignUpResponse(name: json['result']['rate']);
  }
}
