import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/apipath.dart';
import '../../model/user_model/user_result.dart';

class AuthAPI {
  Future<http.Response> login(
      {required String email, required String password}) async {
    try {
      var body = jsonEncode({'email': email, 'password': password});
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };
      String url = APIPath.loginApiPath;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<http.Response> signup(
      String email, String name, String password) async {
    var body = jsonEncode(
        {'email': email, "name": name, "password": password, "role": 1});
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    String url = APIPath.signupApiPath;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);

    return response;
  }

  Future<http.Response> sendotp(
    String email,
  ) async {
    var body = jsonEncode({
      'email': email,
    });
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    String url = APIPath.sendotp;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  static Future<http.Response> varifyotp(
      {required String email, required String otp}) async {
    var body = jsonEncode({'email': email, 'otp': otp});
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    String url = APIPath.varifyotp;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  Future<http.Response> forgotPassword(
      {required String email,
      required String newPassword,
      required String verifyPassword}) async {
    try {
      var body = jsonEncode({
        'email': email,
        'newPassword': newPassword,
        "verifyPassword": verifyPassword
      });
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };
      String url = APIPath.resetPassword;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<http.Response> editProfileDetails(UserResult userResult) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("userToken");
      var response = await http.put(
        Uri.parse(APIPath.editProfile),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(userResult),
      );
      var reqRes = jsonDecode(response.body);
      print(reqRes);

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
