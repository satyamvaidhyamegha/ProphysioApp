import 'dart:convert';

OtpSignupResponse otpSignupResponse(String str) =>
    OtpSignupResponse.fromJson(json.decode(str));

class OtpSignupResponse{
  OtpSignupResponse({
    required this.message,
    required this.data,
});

  late final String message;
  late final String data;

  OtpSignupResponse.fromJson(Map<String,dynamic>json){
    message = json['message'];
    data = json['data'];
  }
}