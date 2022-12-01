import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../constants/apipath.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';

class SearchApi {
  Future<List<ContentModel>> getFoodSearchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // var id = prefs.getInt('userId');
    // var body = jsonEncode({'user_id': '$id', 'section_id': '$sectionId'});
    try {
      // Map<String, String> headers = {
      //   "Content-Type": "application/json; charset=UTF-8"
      // };

      String url = APIPath.FOOD_SEARCH_PATH;
      http.Response response = await http.post(
        Uri.parse(url),
      );

      var jsonResponse = jsonDecode(response.body.toString());

      Iterable searchItr = jsonResponse['rows'];

      List<ContentModel> searchList = List<ContentModel>.from(
          searchItr.map((e) => ContentModel.fromJson(e)));

      return searchList;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<List<ContentModel>> getHealthSearchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // var id = prefs.getInt('userId');
    // var body = jsonEncode({'user_id': '$id', 'section_id': '$sectionId'});
    try {
      // Map<String, String> headers = {
      //   "Content-Type": "application/json; charset=UTF-8"
      // };

      String url = APIPath.HEALTH_CONDITION_PATH;
      http.Response response = await http.post(
        Uri.parse(url),
      );

      var jsonResponse = jsonDecode(response.body.toString());
      //print(jsonResponse);

      Iterable searchItr = jsonResponse['rows'];

      List<ContentModel> searchList = List<ContentModel>.from(
          searchItr.map((e) => ContentModel.fromJson(e)));

      return searchList;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
