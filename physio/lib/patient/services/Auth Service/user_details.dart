import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model/user_result.dart';

class UserDetailsApi {
  Future<UserResult> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("userToken");
    var id = prefs.getInt('userId');
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      };

      String url = "http://ritzyware.net:3016/mobile/user/$id";
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      var responseData = response.body;
      var decodeData = json.decode(responseData);
      var modelData = UserResult.fromJson(decodeData);

      return modelData;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
