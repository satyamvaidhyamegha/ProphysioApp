import 'dart:convert';

class SignUpResponse {
  final String id;

  SignUpResponse({required this.id});

  factory SignUpResponse.fromJson(Map<dynamic, dynamic> json) {
    return SignUpResponse(id: json['_id'].toString());
  }
}
