import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/SignupDetailsModel/signup_response.dart';

class SignupService {
  static var client = http.Client();

  static Future<SignUpResponse> signup(
      String firstName,
      String secondName,
      String address,
      int rate,
      int yoe,
      String contactNo,
      String emailId,
      String pass,
      String physioimg) async {
    var url = Uri.parse('https://api.prophysio.in/mobile/physios/signup');

    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "firstname": firstName,
          "secondname": secondName,
          "address": address,
          "rate": rate,
          "yearOfExperience": yoe,
          "phone": contactNo,
          "email": emailId,
          "password": pass,
          "physioimg": physioimg
        },
      ),
    );

    return SignUpResponse.fromJson(json.decode(json.encode(response.body)));
  }
}
