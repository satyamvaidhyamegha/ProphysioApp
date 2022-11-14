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
      String language,
      String certificateName,
      String issuing_org,
      String issue_date,
      String media,
      String name) async {
    var url =
        Uri.parse('https://api.prophysio.in/mobile/physios/signupDetails');

    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "physioid": physioid,
          "aboutYou": aboutYou,
          "education": education,
          "speciality": speciality,
          "language": language,
          "certificateName": certificateName,
          "issuing_org": issuing_org,
          "issuing_date": issue_date,
          "media": media,
          "name": name
        },
      ),
    );

    return SignUpDetailsResponse.fromJson(json.decode(response.body));
  }
}
