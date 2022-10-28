import 'dart:convert';
import 'dart:ffi';

OtpSignupResponse otpSignupResponse(String str) =>
    OtpSignupResponse.fromJson(json.decode(str));

class OtpSignupResponse{
  OtpSignupResponse({
    required this.valid,
    required this.send,
    required this.randomOtp,
  });

  late final Bool valid;
  late final Bool send;
  late final Int randomOtp;
  late final String message;


  OtpSignupResponse.fromJson(Map<String,dynamic>json){
    valid = json['valid'];
    send = json['send'];
    randomOtp = json['randomOtp'];
    message = json['message'];
  }
}