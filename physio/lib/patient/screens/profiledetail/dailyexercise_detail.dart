// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/profiledetail/timetable_detail.dart';
import 'package:physio/patient/screens/profiledetail/waterintake_detail.dart';

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

class DailyExcerciseDaily extends StatefulWidget {
  const DailyExcerciseDaily({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DailyExcerciseDailyPageState();
  }
}

class _DailyExcerciseDailyPageState extends State<DailyExcerciseDaily> {
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  List<ContentModel> contentData = [];
  List<int> idList = [];
  List<int> answerList = [];
  List<SectionModel> sectionData = [];

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(36);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(36);

    setState(() {
      sectionData = req;
    });
  }

  void previousSelectedId() {
    contentData.forEach((element) {
      if (element.status == true) {
        answerList.add(element.id!.toInt());
      }
    });
  }

  @override
  void initState() {
    setState(() {});
    getContentList();
    getSectionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WaterDrinkDetails()));
              });
            },
            skipButtonPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TimeTableDetails()));
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS,
                      child: Column(children: [
                        // verticalGap(context: context, screenSize: 0.02),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.80,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    verticalGap(context: context, screenSize: 0.05),
                    sectionData.isNotEmpty
                        ? Padding(
                            padding: Margins.PAGE_CONTENT_MARGINS,
                            child: getText(
                              text: sectionData[0].title.toString(),
                              textStyle: BaseStyles.addressScreenHeadingText,
                            ),
                          )
                        : Container(),
                    verticalGap(context: context, screenSize: 0.02),
                    sectionData.isNotEmpty
                        ? Padding(
                            padding: Margins.PAGE_CONTENT_MARGINS,
                            child: getText(
                              text: sectionData[0].tagline.toString(),
                              textStyle: infoStyle,
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: contentData.isNotEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: contentData.map((element) {
                                return CheckboxListTile(
                                    // tristate: true,
                                    activeColor: AppColors.CHECKBOX_ACTIVE_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            Raddi.textFieldBorderRadius),
                                    value: element.status,
                                    title: getText(
                                        text: element.title.toString(),
                                        textStyle: infoStyle),
                                    onChanged: (newValue) {
                                      setState(() {
                                        element.status = newValue;
                                        if (element.status == true) {
                                          answerList.add(element.id!.toInt());
                                        } else {
                                          answerList
                                              .remove(element.id!.toInt());
                                        }
                                      });
                                    });
                              }).toList())
                          : Center(
                              child: Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                    ),
                  ])),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Padding(
              padding: Margins.PAGE_CONTENT_MARGINS,
              child: CustomButton(
                  onTap: () {
                    previousSelectedId();
                    var allIdList = idList.join(',');
                    var duplicateAnswerKeyRemove = answerList.toSet().toList();
                    var answerIdList = duplicateAnswerKeyRemove.join(',');

                    FoodAndLifeStyle().createContentData(
                        section_id: 36,
                        answer: answerIdList,
                        content_id: allIdList);

                    doNavigate(route: TimeTableDetails(), context: context);
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9),
            ),
            verticalGap(context: context, screenSize: 0.02)
          ],
        ));
  }
}
