import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:physio/physio/API/otp_config.dart';
import 'package:physio/physio/model/Otp%20Model/otp_signup_response.dart';


class OtpApiService {
  static var client = http.Client();

  static Future<OtpSignupResponse> otpSignup(
      String firstName, String secondName, String mobileNumber) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.parse('https://api.prophysio.in/mobile/physios/sendotp');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {
          "firstname": firstName,
          "secondname": secondName,
          "mobileNumber": mobileNumber
        },
      ),
    );

    return OtpSignupResponse.fromJson(json.decode(json.encode(response.body)));
  }

  // static Future<OtpSignupResponse> verifyOtp(
  //   String mobileNo,
  //   int otpCode,
  // ) async {
  //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //
  //   var url = Uri.parse('https://api.prophysio.in/mobile/physios/validateotp');
  //
  //   var response = await client.post(
  //     url,
  //     headers: requestHeaders,
  //     body: jsonEncode(
  //       {
  //         "mobileNumber": mobileNo,
  //         "otp": otpCode,
  //       },
  //     ),
  //   );
  //
  //   return otpSignupResponse(response.body);
  // }
}
