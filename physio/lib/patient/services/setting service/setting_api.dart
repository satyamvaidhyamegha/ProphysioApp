import 'dart:convert';

import 'package:physio/patient/model/setting_model/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants/apipath.dart';

class SettingApi {
  Future<void> createDefaultSetting({required int user_id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = jsonEncode({
      "user_id": user_id,
      "contact": 0,
      "siri_search": "off",
      "notification": 0,
      "background_refresh": 0,
      "mobile_data": 0,
      "location": "when shared"
    });
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.SETTING_FIRST_SAVE;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<SettingModel> getSetingData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
      };

      String url = "http://ritzyware.net:3016/mobile/usersetting/userid/$id";
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      var responseData = response.body;

      var decodeData = json.decode(responseData);

      var modelData = SettingModel.fromJson(decodeData);

      return modelData;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
