import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/SignupDetailsModel/signupDetails_response.dart';

class SignupDetailsService {
  static var client = http.Client();

  static Future<SignUpDetailsResponse> signupDetails(
      String physioid,
      String aboutYou,
      String education,
      String speciality,
      String certificateName,
      String issuing_org,
      String issue_date,
      String media) async {
    var url = Uri.parse('https://api.prophysio.in/mobile/physios/signupDetails');

    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "physioid" : physioid,
          "aboutYou": aboutYou,
          "education": education,
          "speciality": speciality,
          "certificateName": certificateName,
          "issuing_org": issuing_org,
          "issuing_date": issue_date,
          "media": media,

        },
      ),
    );

    return SignUpDetailsResponse.fromJson(json.decode(response.body));
  }
}