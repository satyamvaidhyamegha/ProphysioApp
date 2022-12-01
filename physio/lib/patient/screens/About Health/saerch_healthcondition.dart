// // ignore_for_file: unnecessary_new, prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About%20Health/serached_tag.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../model/Food and Style/Goals/Section Folder/section_model.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';
import '../../services/Food and LifeStyle/search_api.dart';
import '../profiledetail/mealplan_detail.dart';

class SearchHealthCondition extends StatefulWidget {
  const SearchHealthCondition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchHealthConditionPageState();
  }
}

class _SearchHealthConditionPageState extends State<SearchHealthCondition> {
  final FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();
  List<ContentModel> _allContentData = [];
  List<ContentModel> _foundData = [];
  List<SectionModel> sectionData = [];
  List<ContentModel> results = [];
  List<String> selectedData = [];
  List<int> allIdList = [];
  List<int> answerList = [];
  List<String> ownData = [];
  List<String> finalOwnData = [];

  TextEditingController _searchControl = TextEditingController();

  Future<void> addList() async {
    var contentList = await SearchApi().getHealthSearchData();
    contentList.forEach((e) => allIdList.add(e.id!.toInt()));
    setState(() {
      _allContentData = contentList;
    });
  }

  // Future<void> previousSelectedId() async {
  //   var req = await _foodAndLifeStyle.getContent(42);
  //   req.forEach((element) {
  //     if (element.status == true) {
  //       answerList.add(element.id!.toInt());
  //       selectedData.add(element);
  //     }
  //   });
  // }

  Future<void> getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(42);

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
    print("check");
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
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const WaterDrinkDetails()));
            }),
        backgroundColor: AppColors.kBGcolor,
        body: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            //verticalGap(context: context, screenSize: 0.01),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 40,
                        child: TextField(
                          onSubmitted: (val) {
                            print(ownData.last);
                            setState(() {
                              finalOwnData.add(ownData.last);
                              selectedData.add(ownData.last);
                              _searchControl.clear();
                            });
                          },
                          controller: _searchControl,
                          textInputAction: TextInputAction.search,
                          style: inputfieldtextStyle,
                          onChanged: (value) => _runFilter(value),
                          autofocus: false,
                          decoration: InputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage(ImagePath.SEARCH_ICON),
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            fillColor: Color(0xff2C2C2E),
                            contentPadding: Margins.basePadding,
                            hintText: "Search",
                            hintStyle: inputfieldtextStyle,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteGrey),
                              borderRadius: Raddi.textFieldBorderRadius,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteGrey),
                              borderRadius: Raddi.textFieldBorderRadius,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    getText(
                        text: "Select all that apply",
                        textStyle:
                            BaseStyles.profileSubtitle.copyWith(fontSize: 18)),
                    verticalGap(context: context, screenSize: 0.02),
                    Container(
                        padding: Margins.basePadding,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: _foundData.isNotEmpty
                            ? ListView.builder(
                                itemCount: _foundData.length,
                                itemBuilder: (context, index) => Container(
                                  margin: Margins.basePadding,
                                  decoration: BoxDecoration(
                                      borderRadius: Raddi.buttonCornerRadius,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        // _foundData[index].status =
                                        //     !_foundData[index].status!;
                                        // if (_foundData[index].status == true) {
                                        selectedData.add(
                                            _foundData[index].title.toString());
                                        // answerList
                                        //.add(_foundData[index].id!.toInt());
                                        _searchControl.clear();
                                        if (selectedData.isNotEmpty) {
                                          _foundData.clear();
                                        }
                                        //   _foundData.clear();
                                        // } else {
                                        //   selectedData
                                        //       .remove(_foundData[index]);
                                        //   answerList.remove(
                                        //       _foundData[index].id!.toInt());
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
                                spacing: 10.0,
                                // runSpacing: 15.0,
                                children: selectedData.map((e) {
                                  return e.isNotEmpty
                                      ? Chip(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
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
                                          labelPadding:
                                              const EdgeInsets.all(2.0),
                                          label: getText(
                                            text: e.toString(),
                                            textStyle: BaseStyles.goldTextStyle
                                                .copyWith(color: Colors.black),
                                          ),
                                          backgroundColor: AppColors
                                              .healthConditionChipsColorList,
                                          shadowColor: Colors.grey[60],
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              right: 25,
                                              left: 25,
                                              bottom: 10),
                                        )
                                      : Container(
                                          margin: Margins.basePadding,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  Raddi.buttonCornerRadius,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1)),
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
                  ]),
            )),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () {
                  // var idList = allIdList.join(',');
                  // var duplicateAnswerKeyRemove = answerList.toSet().toList();
                  // var answerIdList = duplicateAnswerKeyRemove.join(',');
                  // print(answerIdList);

                  // FoodAndLifeStyle().createContentData(
                  //     section_id: 34, answer: answerIdList, content_id: idList);
                  doNavigate(
                      route: SearchDisease(selectedData), context: context);
                  // SearchApi().getHealthSearchData();
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.02)
          ]),
        ));
  }
}
