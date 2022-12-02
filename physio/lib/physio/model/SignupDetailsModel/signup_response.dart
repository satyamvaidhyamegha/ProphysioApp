import 'dart:convert';

class SignUpResponse {
  final String id;
  final String name;

  SignUpResponse({required this.id, required this.name});

  factory SignUpResponse.fromJson(Map<dynamic, dynamic> json) {
    return SignUpResponse(
        id: json['_id'].toString(), name: json['result']['name']);
  }
}
