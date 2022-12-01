import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants/apipath.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../model/home page model/history model/history_model.dart';
import '../../model/home page model/upcoming model/upcoming_model.dart';

class HomePageApi {
  Future<HistorySessionModel> getHistorySession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');

    var body = jsonEncode({
      'user_id': id,
    });
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.HISTORY_SESSION_API;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      final jsonResponse = json.decode(response.body);
      var modelData = HistorySessionModel.fromJson(jsonResponse);

      return modelData;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<UpcomingModel> getUpcomingSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');

    var body = jsonEncode({
      'user_id': id,
    });
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.UCOOMING_API;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      final jsonResponse = json.decode(response.body);
      var modelData = UpcomingModel.fromJson(jsonResponse);

      return modelData;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<List<UpcomingModel>> getUpcomingListSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');

    var body = jsonEncode({
      'user_id': id,
    });
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.UPCOMING_LIST;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var jsonResponse = jsonDecode(response.body.toString());
      Iterable contentItr = jsonResponse['rows'];

      List<UpcomingModel> contentList = List<UpcomingModel>.from(
          contentItr.map((e) => UpcomingModel.fromJson(e)));

      return contentList;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<List<ContentModel>> getHomePageContentData(int sectionId) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var id = prefs.getInt('userId');
    // print(id);
    var body = jsonEncode({'section_id': '$sectionId'});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.HOMEPAGE_CARE_IDEAS;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var jsonResponse = jsonDecode(response.body.toString());

      Iterable contentItr = jsonResponse['content'];

      List<ContentModel> contentList = List<ContentModel>.from(
          contentItr.map((e) => ContentModel.fromJson(e)));

      return contentList;
    } catch (e) {
      print(e.toString());
    }
    throw Exception('Failed to load album');
  }

  Future<void> saveFeelingRating({
    required int rating,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({'user_id': id, 'rating': rating});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.WELBEING_CREATE_API;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      var jsonResponse = json.decode(response.body);
      ;
    } catch (e) {
      print(e.toString());
    }
    
  }

  Future<void> savePainRecoveryRating({
    required int rating,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({'user_id': id, 'rating': rating});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.WELBEING_PAIN_RECOVERY_SAVE_API;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      

    } catch (e) {
      print(e.toString());
    }
    
  }

  Future<http.Response> getWelbeingData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');

    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = "http://ritzyware.net:3016/mobile/wellbeing/$id";
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      var jsonResponse = jsonDecode(response.body.toString());

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw Exception(http.Response);
  }
  Future<http.Response> getRecoveryPain() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');

    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = "http://ritzyware.net:3016/mobile/recovery/$id";
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      var jsonResponse = jsonDecode(response.body.toString());

      return response;
    } catch (e) {
      print(e.toString());
    }
    throw Exception(http.Response);
  }
  
  
}
