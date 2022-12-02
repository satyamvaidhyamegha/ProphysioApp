import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/custom_button.dart';
import 'package:physio/BaseWidget/style.dart';

import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/model/Barchart%20Model/barchart_model.dart';
import 'package:physio/physio/screens/People/glass_morphism.dart';

import 'package:physio/utility/gap_between.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProactiveChat6 extends StatefulWidget {
  const ProactiveChat6({super.key});

  @override
  State<ProactiveChat6> createState() => _ProactiveChat6State();
}

var windowWidth;
var windowHeight;
bool isButtonPressed = true;
bool isButtonPressed1 = false;
bool isButtonPressed2 = false;

class _ProactiveChat6State extends State<ProactiveChat6> {
  List<Map<String, dynamic>> painDataList = [
    {"painName": "Upper Back", "isClicked": false},
    {"painName": "Lower Back", "isClicked": false},
    {"painName": "Chest", "isClicked": false},
    {"painName": "Neck", "isClicked": false},
    {"painName": "Right Elbow", "isClicked": false},
    {"painName": "Left Elbow", "isClicked": false},
    {"painName": "Left Hip", "isClicked": false},
    {"painName": "Right Hip", "isClicked": false},
    {"painName": "Right Knee", "isClicked": false},
    {"painName": "Left Knee", "isClicked": false},
    {"painName": "Left Shoulder", "isClicked": false},
    {"painName": "Right Shoulder", "isClicked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        leading: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {}),
          ],
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(IconlyLight.plus),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(IconlyLight.more_square),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
      body: initScreen(context),
    );
  }

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
        enable: true,

        /// Templating the tooltip
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return Container(
            color: AppColors.kBGcolor,
            width: 30,
            child: Row(
              children: [
                if (point.y >= 12) ...[
                  const Icon(
                    Icons.sentiment_very_satisfied_outlined,
                    color: Colors.white,
                  ),
                ] else if (point.y >= 8) ...[
                  const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.white,
                  ),
                ] else if (point.y >= 5) ...[
                  const Icon(
                    Icons.sentiment_neutral_outlined,
                    color: Colors.white,
                  ),
                ] else if (point.y >= 3) ...[
                  const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.white,
                  ),
                ] else
                  (point.y >= 1)[const Icon(
                    Icons.sentiment_very_dissatisfied_outlined,
                    color: Colors.white,
                  )]
              ],
            ),
          );
        });
    super.initState();
  }

  initScreen(BuildContext context) {
    final List<TrendsData> trendsData = [
      TrendsData("1st June", 20, AppColors.barStepColor),
      TrendsData("2nd June", 19, AppColors.barStepColor),
      TrendsData("3rd June", 10, AppColors.barStepColor),
      TrendsData("4 June", 20, AppColors.barStepColor),
      TrendsData("5 June", 12, AppColors.barStepColor),
      TrendsData("6 June", 13, AppColors.barStepColor),
      TrendsData("7 June", 05, AppColors.barGreycolor),
      TrendsData("8 June", 20, AppColors.barStepColor),
      TrendsData("9 June", 15, AppColors.barStepColor),
      TrendsData("10 June", 04, AppColors.barStepColor),
      TrendsData("25 June", 08, AppColors.barStepColor),
      TrendsData("26 June", 11, AppColors.barStepColor),
      TrendsData("27 June", 20, AppColors.barStepColor),
      TrendsData("28 June", 17, AppColors.barStepColor),
      TrendsData("29 June", 04, AppColors.barGreycolor),
      TrendsData("30 June", 08, AppColors.barStepColor),
    ];
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalGap(context: context, screenSize: 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Container(
                    height: MediaQuery.of(context).size.height * 0.125,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        image: DecorationImage(
                            image: AssetImage("assets/DoctorImage.png"),
                            fit: BoxFit.cover))),
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: getText(
                      text: 'Smriti Mehra',
                      textStyle: BaseStyles.scheduleHeaddingStyle),
                ),
                horizontalGap(context: context, screenSize: 0.02),
              ],
            ),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: getText(
                        text: 'F 35, Koromangala', textStyle: labletextStyle2))
              ],
            ),
            verticalGap(context: context, screenSize: 0.004),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: getText(
                        text: 'Last session- Friday,18th May, 2:45pm',
                        textStyle: info1style1))
              ],
            ),
            verticalGap(context: context, screenSize: 0.03),
            Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: double.infinity,
              color: AppColors.schedulecard1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalGap(context: context, screenSize: 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed = !isButtonPressed;

                                if (isButtonPressed = true) {
                                  isButtonPressed1 = false;
                                  isButtonPressed2 = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 5.0),
                              side: isButtonPressed
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'Summary',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed1 = !isButtonPressed1;

                                if (isButtonPressed1 = true) {
                                  isButtonPressed = false;
                                  isButtonPressed2 = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 5.0),
                              side: isButtonPressed1
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'Plan',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed2 = !isButtonPressed2;

                                if (isButtonPressed2 = true) {
                                  isButtonPressed1 = false;
                                  isButtonPressed = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 5.0),
                              side: isButtonPressed2
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'Profile',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                ],
              ),
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        horizontalGap(context: context, screenSize: 0.04),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child:
                              getText(text: '3/5', textStyle: doctorNameText1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        horizontalGap(context: context, screenSize: 0.04),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: getText(
                              text: 'Sessions Completed',
                              textStyle: navlablecolor3),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: getText(text: '8/10', textStyle: doctorNameText1),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: getText(
                          text: 'Compliance Score', textStyle: navlablecolor3),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: getText(text: '8/10', textStyle: doctorNameText1),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: getText(
                          text: 'Satisfaction Score',
                          textStyle: navlablecolor3),
                    )
                  ],
                ),
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Container(
                height: MediaQuery.of(context).size.height * 1.9,
                width: double.infinity,
                color: AppColors.calenderColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.06),
                            getText(
                                text: 'Trends',
                                textStyle: profilefieldtextStyle3),
                          ]),
                          Row(children: [
                            getText(
                                text: 'View all',
                                textStyle: professionProfileHeading2),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                              color: Colors.blue,
                              iconSize: 16,
                            ),
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.002),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Card(
                            color: AppColors.kBGcolor,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalGap(
                                        context: context, screenSize: 0.02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: getText(
                                                  text:
                                                      'Patient Experience last ${trendsData.length} sessions',
                                                  textStyle: info1style1),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 10.0,
                                              width: 10.0,
                                              decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            horizontalGap(
                                                context: context,
                                                screenSize: 0.02),
                                            getText(
                                                text: 'Pain',
                                                textStyle: info1style1),
                                            horizontalGap(
                                                context: context,
                                                screenSize: 0.06),
                                            Container(
                                              height: 10.0,
                                              width: 10.0,
                                              decoration: const BoxDecoration(
                                                color: AppColors.allSelfHeal,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            horizontalGap(
                                                context: context,
                                                screenSize: 0.02),
                                            getText(
                                                text: 'Recovery',
                                                textStyle: info1style1)
                                          ],
                                        ),
                                      ],
                                    ),
                                    verticalGap(
                                        context: context, screenSize: 0.04),
                                    Center(
                                      child: SizedBox(
                                        height: 170,
                                        width: double.infinity,
                                        child: SfCartesianChart(
                                            plotAreaBorderWidth: 0,
                                            tooltipBehavior: _tooltipBehavior,
                                            primaryYAxis: NumericAxis(
                                              isVisible: false,
                                              axisLine:
                                                  const AxisLine(width: 0),
                                              majorGridLines:
                                                  const MajorGridLines(
                                                      width: 0),
                                            ),
                                            primaryXAxis: CategoryAxis(
                                              majorTickLines:
                                                  const MajorTickLines(
                                                      width: 0),
                                              axisLine:
                                                  const AxisLine(width: 0),
                                              isVisible: true,
                                              labelStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500),
                                              majorGridLines:
                                                  const MajorGridLines(
                                                      width: 0),
                                            ),
                                            series: <
                                                ChartSeries<TrendsData,
                                                    String>>[
                                              ColumnSeries<TrendsData, String>(
                                                  pointColorMapper:
                                                      (TrendsData data, _) =>
                                                          data.color,
                                                  borderWidth: 0,
                                                  width: 0.5,
                                                  spacing: 0.02,
                                                  dataSource: trendsData,
                                                  xValueMapper:
                                                      (TrendsData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (TrendsData data, _) =>
                                                          data.y,
                                                  enableTooltip: true,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(18))),
                                            ]),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: 'Last Assigned Routine',
                                textStyle: profilefieldtextStyle3),
                          ]),
                          verticalGap(context: context, screenSize: 0.02),
                          Row(children: [
                            getText(text: 'View all', textStyle: info1style),
                            Row(children: const [
                              Icon(Icons.arrow_forward_ios_outlined,
                                  size: 12, color: Colors.white),
                            ]),
                            horizontalGap(context: context, screenSize: 0.05)
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.002),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            child: Card(
                              color: AppColors.kBGcolor,
                              shadowColor: Colors.black,
                              borderOnForeground: true,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              bottomLeft: Radius.circular(15.0),
                                            ),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Mask Group 135@4x.png"),
                                                fit: BoxFit.cover))),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.62,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: getText(
                                                      text: 'Wed 15th, May',
                                                      textStyle: aboutYouText1),
                                                ),
                                                SizedBox(
                                                  child: getText(
                                                      text: '8:00am',
                                                      textStyle:
                                                          navlablecolor2),
                                                )
                                              ]),
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.62,
                                            child: const Text(
                                              'Routine: Toe curl, Heel lift, Swing arm, sit ups, rotate arm…',
                                              style: subtitle2,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.62,
                                          child: const Text(
                                            'Est. Duration: 20mins',
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.62,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  style: ButtonStyle(
                                                      foregroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.black),
                                                      backgroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.white),
                                                      padding:
                                                          MaterialStateProperty.all<EdgeInsets>(
                                                              const EdgeInsets.all(
                                                                  8)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ))),
                                                  onPressed: () {},
                                                  child: getText(
                                                      text: 'Sit Ups',
                                                      textStyle: BaseStyles.closeStyle1)),
                                              TextButton(
                                                  style: ButtonStyle(
                                                      foregroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.black),
                                                      backgroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.white),
                                                      padding:
                                                          MaterialStateProperty.all<EdgeInsets>(
                                                              const EdgeInsets.all(
                                                                  8)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ))),
                                                  onPressed: () {},
                                                  child: getText(
                                                      text: 'Ankle twist',
                                                      textStyle: BaseStyles.closeStyle1)),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.002),
                                              TextButton(
                                                  style: ButtonStyle(
                                                      foregroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.black),
                                                      backgroundColor:
                                                          MaterialStateProperty.all<Color>(
                                                              Colors.white),
                                                      padding:
                                                          MaterialStateProperty.all<EdgeInsets>(
                                                              const EdgeInsets.all(
                                                                  4)),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ))),
                                                  onPressed: () {},
                                                  child: getText(
                                                      text: '+5 more',
                                                      textStyle: BaseStyles.closeStyle1)),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.002),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: 'Upcoming Appointment',
                                textStyle: profilefieldtextStyle3),
                          ]),
                          Row(children: [
                            getText(text: 'View all', textStyle: info1style),
                            Row(children: const [
                              Icon(Icons.arrow_forward_ios_outlined,
                                  size: 12, color: Colors.white),
                            ]),
                            horizontalGap(context: context, screenSize: 0.04)
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          SizedBox(
                            child: Column(children: [
                              getText(text: '25', textStyle: otpText1),
                              getText(
                                  text: 'May',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen),
                            ]),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.82,
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: Card(
                              color: AppColors.offlineButtonColor,
                              child: Column(children: [
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.02),
                                          SizedBox(
                                            child: getText(
                                                text: 'Kanti Roy, F 35',
                                                textStyle: aboutYouText1),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(IconlyLight.video,
                                              color: Colors.blue),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.02)
                                        ],
                                      ),
                                    ]),
                                Row(
                                  children: [
                                    horizontalGap(
                                        context: context, screenSize: 0.02),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.72,
                                      child: getText(
                                          text:
                                              'Thu, May 27, 3:00 pm - 4:00 pm Condition: Back and shoulder pain',
                                          textStyle: subtitle2),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.02)
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: 'Recent Reports',
                                textStyle: profilefieldtextStyle3),
                          ]),
                          Row(children: [
                            Row(children: [
                              getText(text: 'View all', textStyle: info1style),
                            ]),
                            Row(children: const [
                              Icon(Icons.arrow_forward_ios_outlined,
                                  size: 12, color: Colors.white),
                            ]),
                            horizontalGap(context: context, screenSize: 0.04)
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.04),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.925,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Card(
                                  shadowColor: Colors.black,
                                  color: AppColors.kBGcolor,
                                  child: Column(
                                    children: [
                                      verticalGap(
                                          context: context, screenSize: 0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.02),
                                          Container(
                                              height: 70,
                                              width: 49.09,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/Group 74626@2x.png"),
                                                      fit: BoxFit.cover))),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.56,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getText(
                                                        text:
                                                            'Muscle Constitution',
                                                        textStyle:
                                                            aboutYouText1),
                                                    getText(
                                                        text: '13/3/2020',
                                                        textStyle:
                                                            navlablecolor2),
                                                  ],
                                                ),
                                              ),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.005),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.60,
                                                child: const Text(
                                                  'This is back pain where no specific cause (such as an underlying…',
                                                  style: subtitle2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.02),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.56,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      'Report by Dr. Soham',
                                                      style: bluetext,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                    Icon(
                                                        Icons
                                                            .arrow_forward_ios_outlined,
                                                        size: 12,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.04),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.925,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Card(
                                  color: AppColors.kBGcolor,
                                  child: Column(
                                    children: [
                                      verticalGap(
                                          context: context, screenSize: 0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.02),
                                          Container(
                                              height: 70,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/Group 74627@2x.png"),
                                                      fit: BoxFit.cover))),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.56,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getText(
                                                        text:
                                                            'Assessment Report',
                                                        textStyle:
                                                            aboutYouText1),
                                                    getText(
                                                        text: '14/3/2020',
                                                        textStyle:
                                                            navlablecolor2),
                                                  ],
                                                ),
                                              ),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.005),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.60,
                                                child: const Text(
                                                  'This is back pain where no specific cause (such as an underlying…',
                                                  style: subtitle2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.02),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.56,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      'Report by Dr. Soham',
                                                      style: bluetext,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                    Icon(
                                                        Icons
                                                            .arrow_forward_ios_outlined,
                                                        size: 12,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: 'Recent Complaint',
                                textStyle: profilefieldtextStyle3),
                          ]),
                          Row(children: [
                            Row(children: [
                              getText(text: 'View all', textStyle: info1style),
                            ]),
                            Row(children: const [
                              Icon(Icons.arrow_forward_ios_outlined,
                                  size: 12, color: Colors.white),
                            ]),
                            horizontalGap(context: context, screenSize: 0.04)
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          SizedBox(
                            child: getText(
                                text:
                                    'Left Hip pain complaint - 2nd June @ 2:30pm',
                                textStyle: subtitle2),
                          )
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Stack(children: [
                            Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.46),
                                // alignment: Alignment.bottomCenter,
                                decoration: const BoxDecoration(
                                    color: AppColors.kBGcolor,
                                    image: DecorationImage(
                                        image: AssetImage("assets/xray.png"),
                                        fit: BoxFit.fitHeight)),
                                child: Row(
                                  children: [
                                    Glassmorphism(
                                      blur: 100,
                                      opacity: 0.1,
                                      bottomRightRaadius: 10,
                                      bottomLeftRadius: 10,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.92,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  children:
                                                      painDataList.map((e) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        e['isClicked'] =
                                                            !e['isClicked'];
                                                      });
                                                    },
                                                    child: Chip(
                                                      deleteIcon: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1)),
                                                        child: const Icon(
                                                          Icons.close,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      onDeleted: () {
                                                        setState(() {
                                                          e['isClicked'] =
                                                              !e['isClicked'];
                                                        });
                                                      },
                                                      labelPadding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      label: getText(
                                                        text: e['painName']
                                                            .toString(),
                                                        textStyle: BaseStyles
                                                            .goldTextStyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .kBGcolor,
                                                                fontSize: 12),
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      shadowColor:
                                                          Colors.grey[60],
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              right: 25,
                                                              left: 25,
                                                              bottom: 10),
                                                    ),
                                                  ),
                                                );
                                              }).toList()),
                                            ),
                                            verticalGap(
                                                context: context,
                                                screenSize: 0.03),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            painDataList[0]['isClicked'] == true
                                ? getRedSpot(left: 170, bottom: 200, top: 50)
                                : Container(),
                            painDataList[1]['isClicked'] == true
                                ? getRedSpot(left: 170, bottom: 120, top: 240)
                                : Container(),
                            painDataList[2]['isClicked'] == true
                                ? getRedSpot(left: 190, bottom: 220, top: 20)
                                : Container(),
                            painDataList[3]['isClicked'] == true
                                ? getRedSpot(left: 230, bottom: 60, top: 500)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 400)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 200, bottom: 60, top: 350)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 170, bottom: 60, top: 300)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 200)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 500)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 500)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 500)
                                : Container(),
                            painDataList[4]['isClicked'] == true
                                ? getRedSpot(left: 150, bottom: 60, top: 500)
                                : Container()
                          ]),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      Row(children: [
                        horizontalGap(context: context, screenSize: 0.04),
                        getText(
                            text: 'Upcoming Appointment',
                            textStyle: profilefieldtextStyle3),
                      ]),
                    ])),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * windowWidth,
                  color: AppColors.calenderColor2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Badge(
                          position: BadgePosition.topStart(),
                          badgeContent: const Text('3'),
                          badgeColor: Colors.orange,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/DoctorImage.png"),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: -4,
                                    top: 30,
                                    child: Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: AppColors.routineSubheading,
                                      size: 25,
                                    )),
                              ],
                            ),
                          )),
                      Column(
                        children: [
                          verticalGap(context: context, screenSize: 0.02),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        getText(
                                            text: 'DrRoma Desouza',
                                            textStyle: aboutYouText1),
                                      ]),
                                      Row(
                                        children: [
                                          getText(
                                              text: '9:40 am',
                                              textStyle: navlablecolor3),
                                          const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 12,
                                              color: Colors.white),
                                        ],
                                      )
                                    ]),
                              ),
                              horizontalGap(context: context, screenSize: 0.04)
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  child: const Text(
                                    'Hope you are feeling better after yesterday’s session. Continue to do…',
                                    style: subtitle2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )),
                              horizontalGap(context: context, screenSize: 0.04),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            verticalGap(context: context, screenSize: 0.04),
          ],
        ),
      ),
    );
  }
}

getRedSpot(
    {required double left, required double bottom, required double top}) {
  return Positioned(
    left: left,
    top: top,
    bottom: bottom,
    child: const CircleAvatar(
      radius: 10,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: ErrorColor.errorColorRed,
      ),
    ),
  );
}
