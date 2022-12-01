// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/welcome/bottomtab/home/Chat/message_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/my_welbeing.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/great_job_card_text.dart';
import '../../../utility/navigation.dart';

class GreatJobScreen extends StatefulWidget {
  const GreatJobScreen({Key? key}) : super(key: key);

  @override
  State<GreatJobScreen> createState() => _GreatJobScreenState();
}

class _GreatJobScreenState extends State<GreatJobScreen> {
  List<Map<String, dynamic>> cardData = [
    {"title": "35", "subtitle": "Minutes"},
    {"title": "8", "subtitle": "Exercise"},
    {"title": "03", "subtitle": "Repeats"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greateJobScreen,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              AppColors.greateJobScreen,
              Color.fromARGB(255, 67, 81, 67),
              AppColors.allDoctorBackGroundColor
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircularStepProgressIndicator(
              circularDirection: CircularDirection.counterclockwise,
              totalSteps: 100,
              currentStep: 90,
              stepSize: 5,
              selectedColor: AppColors.blueColor,
              unselectedColor: AppColors.greateJobScreen,
              padding: 0,
              width: 60,
              height: 60,
              selectedStepSize: 5,
              roundedCap: (_, __) => true,
            ),
            verticalGap(context: context, screenSize: 0.04),
            getText(text: "Great Job!", textStyle: headerStyle),
            verticalGap(context: context, screenSize: 0.04),
            Align(
              alignment: Alignment.center,
              child: getText(
                  text:
                      "You have completed 4/5 sessions\n                      this week!",
                  textStyle: infoStyle),
            ),
            verticalGap(context: context, screenSize: 0.04),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.greateJobCardColor,
              ),
              child: Padding(
                padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreatJobCardContent(
                          timeText: "35",
                          timeType: "Minutes",
                          widget: Icon(
                            Icons.punch_clock_outlined,
                            color: AppColors.PROGRESS_YELLOW_LINE,
                          ),
                        ),
                        devider(),
                        GreatJobCardContent(
                          timeText: "08",
                          timeType: "Exercise",
                          widget: Icon(
                            Icons.punch_clock_outlined,
                            color: AppColors.PROGRESS_YELLOW_LINE,
                          ),
                        ),
                        devider(),
                        GreatJobCardContent(
                          timeText: "03",
                          timeType: "Repeats",
                          widget: Icon(
                            Icons.punch_clock_outlined,
                            color: AppColors.PROGRESS_YELLOW_LINE,
                          ),
                        ),
                      ],
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                    getText(
                        text: "Tell us how do you feel?",
                        textStyle: labletextStyle),
                    verticalGap(context: context, screenSize: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyWelBeingWidget(
                            imagePath: ImagePath.GOOD_WEL_ICON,
                            name: Strings.GOOD,
                            textColor: Colors.grey,
                            onTap: () {
                              // saveRatingForWellbeing(4);
                            }),
                        MyWelBeingWidget(
                            imagePath: ImagePath.FINE_WEL_ICON,
                            name: Strings.FINE,
                            textColor: Colors.grey,
                            onTap: () {
                              // saveRatingForWellbeing(3);
                            }),
                        MyWelBeingWidget(
                            imagePath: ImagePath.MEH_WEL_ICON,
                            name: Strings.MEH,
                            textColor: Colors.grey,
                            onTap: () {
                              //saveRatingForWellbeing(2);
                            }),
                        MyWelBeingWidget(
                            imagePath: ImagePath.TERRIBLE_WEL_ICON,
                            name: Strings.TERRIBLE,
                            textColor: Colors.grey,
                            onTap: () {
                              //saveRatingForWellbeing(1);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            verticalGap(context: context, screenSize: 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getTwoButtonSplit(
                    context: context, buttonText: "Add a note", onPress: () {}),
                getTwoButtonSplit(
                    context: context,
                    buttonText: "Send a message",
                    onPress: () {
                      doNavigate(route: Message(), context: context);
                    })
              ],
            ),
            verticalGap(context: context, screenSize: 0.04),
          ],
        ),
      )),
    );
  }

  devider() {
    return Container(
      height: 40,
      width: 2,
      color: Colors.black,
    );
  }
}
