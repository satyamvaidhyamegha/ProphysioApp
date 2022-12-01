// // ignore_for_file: unnecessary_new, prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Section%20Folder/section_model.dart';
import 'package:physio/patient/screens/profiledetail/mealplan_detail.dart';
import 'package:physio/patient/services/Food%20and%20LifeStyle/search_api.dart';
import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';
import 'waterintake_detail.dart';

class FoodSearchDetails extends StatefulWidget {
  const FoodSearchDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodSearchDetailsPageState();
  }
}

class _FoodSearchDetailsPageState extends State<FoodSearchDetails> {
  final FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();
  TextEditingController _searchControl = TextEditingController();
  List<ContentModel> _allContentData = [];
  List<ContentModel> _foundData = [];
  List<SectionModel> sectionData = [];
  List<ContentModel> results = [];
  List<String> selectedData = [];
  List<int> allIdList = [];
  List<int> answerList = [];
  List<String> ownData = [];
  List<String> finalOwnData = [];
  bool textFieldSelect = false;
  List<Color> colorCode = <Color>[
    Color.fromRGBO(141, 183, 204, 1),
    Color.fromRGBO(151, 204, 141, 1),
    Color.fromRGBO(217, 190, 77, 1),
    Color.fromRGBO(232, 153, 95, 1),
    Color.fromRGBO(175, 133, 102, 1),
    Color.fromRGBO(141, 183, 204, 1),
    Color.fromRGBO(199, 198, 197, 1),
  ];

  Future<void> addList() async {
    var contentList = await SearchApi().getFoodSearchData();
    ;
    contentList.forEach((e) => allIdList.add(e.id!.toInt()));
    setState(() {
      _allContentData = contentList;
    });
  }

  // Future<void> previousSelectedId() async {
  //   var req = await SearchApi().getSearchData();
  //   req.forEach((element) {
  //     if (element.status == true) {
  //       answerList.add(element.id!.toInt());
  //       selectedData.add(element);
  //     }
  //   });
  // }

  Future<void> getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(34);

    setState(() {
      sectionData = req;
    });
  }

  void ownDataShort() {
    if (finalOwnData.isEmpty) {
      setState(() {
        finalOwnData.add(ownData.toSet().toList().toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // previousSelectedId();
    addList();
    getSectionList();
  }

  void _runFilter(String enteredKeyword) {
    //print("check");
    if (enteredKeyword.isEmpty) {
      results = _allContentData;
    } else {
      results = _allContentData
          .where((user) =>
              user.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    // print("results");
    if (results.isEmpty) {
      ContentModel contentModel = ContentModel();
      contentModel.title = enteredKeyword.toLowerCase();
      results = [contentModel];
    }

    setState(() {
      _foundData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const MealPlanDetails()));
              });
            },
            skipButtonPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WaterDrinkDetails()));
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child: ListView(children: <Widget>[
            verticalGap(context: context, screenSize: 0.01),
            const SizedBox(
              width: 300,
              height: 10,
              child: ClipRRect(
                borderRadius: Raddi.textFieldBorderRadius,
                child: LinearProgressIndicator(
                  value: 0.60,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.PROGRESS_YELLOW_LINE),
                  backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                ),
              ),
            ),
            verticalGap(context: context, screenSize: 0.05),
            sectionData.isNotEmpty
                ? getText(
                    text: sectionData[0].title.toString(),
                    textStyle: BaseStyles.addressScreenHeadingText,
                  )
                : Container(),
            verticalGap(context: context, screenSize: 0.01),
            sectionData.isNotEmpty
                ? getText(
                    text: sectionData[0].tagline.toString(),
                    textStyle: infoStyle,
                  )
                : Container(),
            verticalGap(context: context, screenSize: 0.02),
            TextField(
              controller: _searchControl,
              textInputAction: TextInputAction.search,
              style: inputfieldtextStyle,
              onChanged: (value) => _runFilter(value),
              autofocus: false,
              onSubmitted: (val) {
                print(ownData.last);
                setState(() {
                  finalOwnData.add(ownData.last);
                  selectedData.add(ownData.last);
                  _searchControl.clear();
                });
              },
              decoration: InputDecoration(
                
                prefixIcon: ImageIcon(
                  getAssetImage(imagePath: ImagePath.SEARCH_ICON),
                  color: AppColors.subTextColor,
                ),
                fillColor: Colors.transparent,
                contentPadding: Margins.basePadding,
                hintText: "Search your type",
                hintStyle: inputfieldtextStyle,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.whiteGrey),
                  borderRadius: Raddi.textFieldBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.whiteGrey),
                  borderRadius: Raddi.buttonCornerRadius,
                ),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Container(
                padding: Margins.basePadding,
                height: MediaQuery.of(context).size.height * 0.46,
                child: _foundData.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundData.length,
                        itemBuilder: (context, index) => Container(
                          margin: Margins.basePadding,
                          decoration: BoxDecoration(
                              borderRadius: Raddi.buttonCornerRadius,
                              border:
                                  Border.all(color: AppColors.textColor, width: 1)),
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                // _foundData[index].status =
                                //     !_foundData[index].status!;
                                // if (_foundData[index].status == true) {
                                selectedData
                                    .add(_foundData[index].title.toString());
                                // answerList.add(_foundData[index].id!.toInt());
                                _searchControl.clear();
                                if (selectedData.isNotEmpty) {
                                  _foundData.clear();
                                }
                                //_foundData.clear();
                                // } else {
                                //   selectedData.remove(_foundData[index]);
                                //   answerList
                                //       .remove(_foundData[index].id!.toInt());
                                // }
                              });
                            },
                            leading: Text(
                              _foundData[index].title.toString(),
                              style: infoStyle,
                            ),
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 20.0,
                        //runSpacing: 10.0,
                        children: selectedData.map((e) {
                          return e.isNotEmpty
                              ? Chip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  useDeleteButtonTooltip: true,
                                  deleteIcon: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                  onDeleted: () {
                                    setState(() {
                                      selectedData.remove(e);
                                    });
                                  },
                                  labelPadding: const EdgeInsets.all(1.0),
                                  label: getText(
                                    text: e.toString(),
                                    textStyle: BaseStyles.goldTextStyle
                                        .copyWith(color: Colors.black),
                                  ),
                                  backgroundColor: colorCode[
                                      Random().nextInt(colorCode.length)],
                                  shadowColor: Colors.grey[60],
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 20, left: 20, bottom: 10),
                                )
                              : Container(
                                  margin: Margins.basePadding,
                                  decoration: BoxDecoration(
                                      borderRadius: Raddi.buttonCornerRadius,
                                      border: Border.all(
                                          color: AppColors.textColor, width: 1)),
                                  child: ListTile(
                                    onTap: () {},
                                    leading: Text(
                                      ownData[0],
                                      style: infoStyle,
                                    ),
                                  ),
                                );
                        }).toList(),
                      )),
            verticalGap(context: context, screenSize: 0.03),
            CustomButton(
                onTap: () {
                  var duplicateAnswerKeyRemove = selectedData.toSet().toList();
                  var foodAnswer = duplicateAnswerKeyRemove.join(',');
                  //print(answerIdList);

                  FoodAndLifeStyle().createContentData(
                      section_id: 34, answer: foodAnswer, content_id: "");
                  doNavigate(
                      route: const WaterDrinkDetails(), context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.01)
          ]),
        ));
  }
}
