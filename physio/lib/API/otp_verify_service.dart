import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/Otp Model/verify_otp_response.dart';

class OtpVerifyService {
  static var client = http.Client();

  static Future<OtpVerifyResponse> verifyOtp(
    int otpCode,
    String mobileNo,
  ) async {
    // requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.parse('https://api.prophysio.in/mobile/physios/validateotp');

    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          "mobileNumber": mobileNo,
          "otp": otpCode,
        },
      ),
    );

    if (response.statusCode == 200) {
      debugPrint("works like a charm");
      debugPrint(response.body);
      return OtpVerifyResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kuch toh error hai');
    }
  }
}
