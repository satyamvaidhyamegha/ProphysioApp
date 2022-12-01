// // ignore_for_file: unnecessary_new, prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About%20Health/saerch_healthcondition.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/separator.dart';
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
import 'image_pain.dart';


class SearchDisease extends StatefulWidget {
  List<String> selectedData;
  SearchDisease(this.selectedData);

  @override
  State<StatefulWidget> createState() {
    return _SearchDiseasePageState();
  }
}

class _SearchDiseasePageState extends State<SearchDisease> {
  final FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  List<SectionModel> sectionData = [];
  List<ContentModel> results = [];
  List<String> selectedList = [];

  //List<ContentModel> selectedData = [];
  List<int> allIdList = [];
  List<int> answerList = [];

  // Future<void> previousSelectedId() async {
  //   var req = await _foodAndLifeStyle.getContent(42);
  //   req.forEach((element) {
  //     if (element.status == true) {
  //       answerList.add(element.id!.toInt());
  //       widget.selectedData!.add(element);
  //     }
  //   });
  // }

  Future<void> getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(42);

    setState(() {
      sectionData = req;
    });
  }

  Future<void> addList() async {
    var contentList = await _foodAndLifeStyle.getContent(42);
    contentList.forEach((e) => allIdList.add(e.id!.toInt()));
  }

  @override
  void initState() {
    super.initState();
    // previousSelectedId();
    addList();
    getSectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              Navigator.pop(context);
            },
            skipButtonPressed: () {
              doNavigate(route: PainImageMark(), context: context);
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            //verticalGap(context: context, screenSize: 0.01),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
              child: ClipRRect(
                borderRadius: Raddi.textFieldBorderRadius,
                child: LinearProgressIndicator(
                  value: 0.80,
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
            verticalGap(context: context, screenSize: 0.02),
            sectionData.isNotEmpty
                ? getText(
                    text: sectionData[0].tagline.toString(),
                    textStyle: infoStyle,
                  )
                : Container(),
            verticalGap(context: context, screenSize: 0.03),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    selectedList.isNotEmpty
                        ? Wrap(
                            spacing: 10.0,
                            //runSpacing: 15.0,
                            children: selectedList.map((e) {
                              return e.isNotEmpty
                                  ? Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      useDeleteButtonTooltip: true,
                                      deleteIcon: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: Center(
                                          child: const Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          selectedList.remove(e);
                                          answerList.remove(e);
                                          widget.selectedData.add(e);
                                        });
                                      },
                                      labelPadding: const EdgeInsets.all(1.0),
                                      label: getText(
                                        text: e.toString(),
                                        textStyle: BaseStyles.goldTextStyle
                                            .copyWith(color: Colors.black),
                                      ),
                                      backgroundColor: AppColors.textColor,
                                      shadowColor: Colors.grey[60],
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          right: 12,
                                          left: 12,
                                          bottom: 5),
                                    )
                                  : Container();
                            }).toList(),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                          ),
                    MySeparator(),
                    getText(
                        text: "Select all that apply",
                        textStyle:
                            BaseStyles.profileSubtitle.copyWith(fontSize: 18)),
                    verticalGap(context: context, screenSize: 0.015),
                    widget.selectedData.isNotEmpty
                        ? Wrap(
                            spacing: 10.0,
                            //runSpacing: 15.0,
                            children: widget.selectedData.map((e) {
                              return e.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedList.add(e.toString());
                                          widget.selectedData.remove(e);
                                        });
                                      },
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        //useDeleteButtonTooltip: true,
                                        labelPadding: const EdgeInsets.all(1.0),
                                        label: getText(
                                          text: e.toString(),
                                          textStyle: BaseStyles.goldTextStyle
                                              .copyWith(color: Colors.black),
                                        ),
                                        backgroundColor: AppColors
                                            .healthConditionChipsColorList,
                                        shadowColor: Colors.grey[60],
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            right: 12,
                                            left: 12,
                                            bottom: 5),
                                      ),
                                    )
                                  : Container();
                            }).toList(),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                          ),
                  ]),
            )),
            InkWell(
              onTap: () {
                doNavigate(route: SearchHealthCondition(), context: context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage(ImagePath.SEARCH_ICON),
                    color: AppColors.textColor,
                  ),
                  horizontalGap(context: context, screenSize: 0.03),
                  Text(
                    "Search",
                    style: TextStyle(color: AppColors.textColor, fontSize: 20),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () async {
                    doNavigate(route: PainImageMark(), context: context);
                    print(answerList.toSet().toList());
                  },
                  child: Text(
                    "I’m Completely Fine",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () {
                  //  var idList = allIdList.join(',');
                  var duplicateAnswerKeyRemove = selectedList.toSet().toList();
                  var answerList = duplicateAnswerKeyRemove.join(',');

                  FoodAndLifeStyle().createContentData(
                      section_id: 42, answer: answerList, content_id: "");
                  doNavigate(route: const PainImageMark(), context: context);
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
