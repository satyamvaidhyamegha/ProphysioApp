import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:physio/physio/model/Login%20Model/login_response.dart';


class LoginService {
  static var client = http.Client();

  static Future<LoginResponse> login(
      String email,
      String password,
     ) async {
    var url = Uri.parse('https://api.prophysio.in/mobile/physios/login');

    var response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    return LoginResponse.fromJson(json.decode(response.body));
  }
}
