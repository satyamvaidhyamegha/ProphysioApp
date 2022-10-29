import 'dart:convert';
import 'dart:ffi';

class OtpSignupResponse {
  final bool send;
  final int randomOtp;

  OtpSignupResponse({
    required this.send,
    required this.randomOtp,
  });

  factory OtpSignupResponse.fromJson(Map<String, dynamic> json) {
    return OtpSignupResponse(send: json['send'], randomOtp: json['randomOtp']);
  }
}
