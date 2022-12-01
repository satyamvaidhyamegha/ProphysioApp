import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/apipath.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../model/Food and Style/Goals/Section Folder/section_model.dart';

class FoodAndLifeStyle {
  Future<List<ContentModel>> getContent(int sectionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    print(id);
    var body = jsonEncode({'user_id': '$id', 'section_id': '$sectionId'});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.FOOD_LIFE_LIST;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var jsonResponse = jsonDecode(response.body.toString());

      Iterable contentItr = jsonResponse['content']['rows'];
      print(contentItr);
      List<ContentModel> contentList = List<ContentModel>.from(
          contentItr.map((e) => ContentModel.fromJson(e)));

      return contentList;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<List<SectionModel>> getSection(int sectionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({'user_id': '$id', 'section_id': '$sectionId'});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.FOOD_LIFE_LIST;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var jsonResponse = jsonDecode(response.body.toString());

      Iterable sectiontItr = jsonResponse['section']['rows'];
      List<SectionModel> sectionList = List<SectionModel>.from(
          sectiontItr.map((e) => SectionModel.fromJson(e)));

      return sectionList;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<void> createContentData(
      {required int section_id,
      required String answer,
      required String content_id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({
      'user_id': id,
      'section_id': section_id,
      'answer': answer,
      'content_id': content_id
    });
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.ADD_CONTENT_DATA;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }

  Future<http.Request> getFoodAndLifeStyle(String answerId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = prefs.getInt('userId');
    var body = jsonEncode({'user_id': id});
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      String url = APIPath.GET_FOOD_LIFE_STYLE;
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var jsonResponse = jsonDecode(response.body.toString());
      print(jsonResponse['answers'][answerId]);

      // Iterable sectiontItr = jsonResponse['answer'];
      // print(sectiontItr);
      // List<ContentModel> sectionList = List<ContentModel>.from(
      //     sectiontItr.map((e) => ContentModel.fromJson(e)));
      // sectionList.forEach((element) {
      //   print(element.title);
      // });

      //return response;
    } catch (e) {
      print(e.toString());
    }
    throw {};
  }
}
