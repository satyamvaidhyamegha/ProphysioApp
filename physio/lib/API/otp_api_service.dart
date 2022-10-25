import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:physio/API/otp_config.dart';
import 'package:physio/model/Otp%20Model/otp_signup_response.dart';

class OtpApiService {
  static var client = http.Client();

  static Future<OtpSignupResponse> otpSignup(String firstName,String secondName,String mobileNumber) async {
    print(mobileNumber);
    debugPrint('mobileNumber = $mobileNumber');
    Map<String,String> requestHeaders = {
      'Content-Type' : 'application/json'
    };

    // var url = Uri.http(Config.apiURL, Config.otpSignupApi);
    var url = Uri.parse('https://api.prophysio.in/mobile/physios/sendotp');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        { "firstname":firstName,
          "secondname":secondName,
          "mobileNumber":mobileNumber},
      ),
    );

    return otpSignupResponse(response.body);
  }

  static Future<OtpSignupResponse> verifyOtp(String mobileNo,String otpHash, String otpCode,) async {
    Map<String,String> requestHeaders = {
      'Content-Type' : 'application/json'
    };

    var url = Uri.http(Config.apiURL, Config.verifyOtpApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {"phone":mobileNo,
        "otp": otpCode,
        "hash": otpHash,
        },
      ),
    );

    return otpSignupResponse(response.body);
  }
}