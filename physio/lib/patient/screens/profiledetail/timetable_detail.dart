// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Section%20Folder/section_model.dart';
import 'package:physio/patient/screens/Success%20Screen/awasome_screen.dart';
import 'package:physio/patient/screens/profiledetail/dailyexercise_detail.dart';
import 'package:physio/patient/screens/profiledetail/food_and_life_style_summary.dart';
import 'package:physio/patient/services/Food%20and%20LifeStyle/food_and_lifestyle.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class TimeTableDetails extends StatefulWidget {
  const TimeTableDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimeTableDetailsPageState();
  }
}

class _TimeTableDetailsPageState extends State<TimeTableDetails> {
  DateTime _dateTime = DateTime.now();
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  var value = "";
  List<SectionModel> sectionData = [];
  List<ContentModel> contentData = [];
  List<int> answerList = [];
  List<int> idList = [];

  Future<void> getContentList() async {
    var req = await _foodAndLifeStyle.getContent(37);
    req.forEach((e) => idList.add(e.id!.toInt()));
    setState(() {
      contentData = req;
    });
  }

  Future<void> getSectionData() async {
    var sectionList = await _foodAndLifeStyle.getSection(37);

    setState(() {
      sectionData = sectionList;
    });
  }

  @override
  void initState() {
    setState(() {});
    getContentList();
    getSectionData();
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
                        builder: (_) => const DailyExcerciseDaily()));
              });
            },
            skipButtonPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodLifeStyleSummary()));
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Column(children: [
                        //verticalGap(context: context, screenSize: 0.03),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.60,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.05),
                      sectionData.isNotEmpty
                          ? getText(
                              text: sectionData[0].title.toString(),
                              textStyle: BaseStyles.addressScreenHeadingText,
                            )
                          : Container(),
                      verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImagePath.ARROW_LEFT_TIMER),
                              TimePickerSpinner(
                                time: DateTime.now(),
                                spacing: 5,
                                is24HourMode: true,
                                normalTextStyle: const TextStyle(
                                    fontSize: 24, color: Color(0xffADADAD)),
                                highlightedTextStyle: const TextStyle(
                                    fontSize: 24, color: AppColors.PROGRESS_YELLOW_LINE),
                                isForce2Digits: true,
                                minutesInterval: 30,
                                onTimeChange: (time) {
                                  setState(() {
                                    _dateTime = time;
                                  });
                                },
                              ),
                              SizedBox(
                                  width: 60,
                                  child:
                                      Image.asset(ImagePath.ARROW_RIGHT_TIMER))
                            ],
                          )),
                    ])),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Center(
                child: getText(
                    text: "Not Sure",
                    textStyle: BaseStyles.laterButtonTextStyle)),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () {
                  var allIdList = idList.join(',');
                  var answerList = "${_dateTime.hour}:${_dateTime.minute}";
                  FoodAndLifeStyle().createContentData(
                      section_id: 37,
                      answer: answerList,
                      content_id: allIdList);

                  doNavigate(
                      route: AwsomeScreen(voidCallback: () {
                        doNavigate(
                            route: FoodLifeStyleSummary(), context: context);
                      }),
                      context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.02)
          ],
        ));
  }
}
