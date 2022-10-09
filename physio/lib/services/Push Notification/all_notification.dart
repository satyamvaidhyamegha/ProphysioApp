import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/apipath.dart';
import '../../model/Notification Model/notification_model.dart';

class AllNotification {
  Future<List<NotificationModel>> getAllNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({'user_id': '$id'});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.NOTIFICATION_LIST;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      List jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((data) => NotificationModel.fromJson(data))
          .toList();
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<List<NotificationModel>> createNotification(
      int? notificationId, bool? enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode(
        {'user_id': id, 'notification_id': notificationId, 'enabled': enabled});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.NOTIFICATION_ADD;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      var jsonResponse = json.decode(response.body);

      return jsonResponse;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<http.Response> getNotificationListDemo() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var id = prefs.getInt('userId');
    // var body = jsonEncode({'user_id': '$id'});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.DEMO_NOTIFICATION_LIST;
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
      );
      // var jsonData = jsonDecode(response.body);
      // print(jsonData['rows']);

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
