import 'dart:convert';
import 'dart:ffi';

class LoginResponse {
  final String token;
  final String message;

  LoginResponse({
    required this.token,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(token: json['token'] as String, message: json['message'] as String);
  }
}
