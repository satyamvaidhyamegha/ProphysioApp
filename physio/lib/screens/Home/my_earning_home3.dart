import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/screens/Home/barchart_model.dart';
import 'package:physio/utility/gap_between.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

bool pressAttention1 = false;
bool pressAttention2 = false;
bool pressAttention3 = false;
bool pressAttention4 = false;
bool pressAttention5 = false;

class _Home3State extends State<Home3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Column(children: [
          verticalGap(context: context, screenSize: 0.06),
          Row(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  onPressed: () {}),
            ],
          ),
          Row(children: [
            horizontalGap(context: context, screenSize: 0.04),
            getText(
                text: 'My Earnings',
                textStyle: BaseStyles.scheduleHeaddingStyle),
          ]),
        ]),
      ),
      backgroundColor: AppColors.kBGcolor,
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    final List<DayData> dayData = [
      DayData("Received", 35, AppColors.barStepColor),
      DayData("Accepted ", 23, AppColors.checkboxActiveColor),
      DayData("Declined", 34, ErrorColor.errorColorRed)
    ];
    final List<TimeData> timeData = [
      TimeData("9:00 am", 20, AppColors.barBlueGreen),
      TimeData("10:00", 25, AppColors.barBlueGreen),
      TimeData("11:00", 10, AppColors.barBlueGreen),
      TimeData("12:00", 20, AppColors.barBlueGreen),
      TimeData("1:00", 25, AppColors.barBlueGreen),
      TimeData("2:00", 13, AppColors.barBlueGreen),
      TimeData("3:00", 05, AppColors.barBlueGreen),
      TimeData("4:00", 20, AppColors.barBlueGreen),
      TimeData("5:00", 22, AppColors.barBlueGreen),
      TimeData("6:00", 04, AppColors.barBlueGreen),
      TimeData("7:00", 08, AppColors.barBlueGreen),
      TimeData("8:00 pm", 11, AppColors.barBlueGreen),
    ];

    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 1,
              thickness: 0.20,
              color: Colors.grey,
            ),
            Column(
              children: [
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Total \nPatients', textStyle: navlablecolor2),
                    horizontalGap(context: context, screenSize: 0.11),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Sessions \nTill date',
                        textStyle: navlablecolor3),
                    horizontalGap(context: context, screenSize: 0.07),
                    getText(text: '0.6', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Avg sessions \nPer day',
                        textStyle: navlablecolor3),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.025),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(
                        text: 'General Info', textStyle: profilefieldtextStyle3)
                  ],
                ),
                verticalGap(context: context, screenSize: 0.02),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(text: 'Price / session', textStyle: aboutYouText1),
                    horizontalGap(context: context, screenSize: 0.25),
                    getText(
                        text: 'Earning last month', textStyle: aboutYouText1)
                  ],
                ),
                Row(
                  children: [
                    Row(children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      getText(
                          text: '₹5000', textStyle: professionProfileHeading2),
                    ]),
                    verticalGap(context: context, screenSize: 0.04),
                    Row(children: [
                      horizontalGap(context: context, screenSize: 0.41),
                      getText(
                          text: '₹65,000', textStyle: professionProfileHeading2)
                    ])
                  ],
                ),
                Builder(builder: (context) {
                  return Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.03),
                      getText(
                          text: 'Earning till date', textStyle: aboutYouText1),
                      horizontalGap(context: context, screenSize: 0.25),
                      getText(
                          text: 'Avg. Earning/day', textStyle: aboutYouText1)
                    ],
                  );
                }),
                Row(
                  children: [
                    Row(children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      getText(
                          text: '20000', textStyle: professionProfileHeading2),
                    ]),
                    verticalGap(context: context, screenSize: 0.04),
                    Row(children: [
                      horizontalGap(context: context, screenSize: 0.41),
                      getText(
                          text: '₹65,000', textStyle: professionProfileHeading2)
                    ])
                  ],
                ),
                verticalGap(context: context, screenSize: 0.02),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    Row(
                      children: [
                        getText(
                            text: 'Sessions',
                            textStyle: profilefieldtextStyle3),
                      ],
                    ),
                    horizontalGap(context: context, screenSize: 0.3),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 34,
                              width: 162,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  )),
                              child: Row(
                                children: [
                                  horizontalGap(
                                      context: context, screenSize: 0.004),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: pressAttention1
                                              ? Colors.blue
                                              : AppColors.schedulecard1,
                                        ),
                                        onPressed: () {
                                          setState(() => pressAttention1 =
                                              !pressAttention1);
                                          if (pressAttention1 = true) {
                                            pressAttention2 = false;
                                            pressAttention3 = false;
                                            pressAttention4 = false;
                                            pressAttention5 = false;
                                          }
                                        },
                                        child: getText(
                                            text: 'D',
                                            textStyle: subtitle3,
                                            textAlign: TextAlign.left)),
                                  ),
                                  horizontalGap(
                                      context: context, screenSize: 0.004),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: pressAttention2
                                              ? Colors.blue
                                              : AppColors.schedulecard1,
                                        ),
                                        onPressed: () {
                                          setState(() => pressAttention2 =
                                              !pressAttention2);
                                          if (pressAttention2 = true) {
                                            pressAttention1 = false;
                                            pressAttention3 = false;
                                            pressAttention4 = false;
                                            pressAttention5 = false;
                                          }
                                        },
                                        child: getText(
                                            text: 'W',
                                            textStyle: subtitle3,
                                            textAlign: TextAlign.center)),
                                  ),
                                  horizontalGap(
                                      context: context, screenSize: 0.004),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: pressAttention3
                                              ? Colors.blue
                                              : AppColors.schedulecard1,
                                        ),
                                        onPressed: () {
                                          setState(() => pressAttention3 =
                                              !pressAttention3);
                                          if (pressAttention3 = true) {
                                            pressAttention2 = false;
                                            pressAttention1 = false;
                                            pressAttention4 = false;
                                            pressAttention5 = false;
                                          }
                                        },
                                        child: getText(
                                            text: 'M',
                                            textStyle: subtitle3,
                                            textAlign: TextAlign.center)),
                                  ),
                                  horizontalGap(
                                      context: context, screenSize: 0.004),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: pressAttention4
                                              ? Colors.blue
                                              : AppColors.schedulecard1,
                                        ),
                                        onPressed: () {
                                          setState(() => pressAttention4 =
                                              !pressAttention4);
                                          if (pressAttention4 = true) {
                                            pressAttention2 = false;
                                            pressAttention3 = false;
                                            pressAttention1 = false;
                                            pressAttention5 = false;
                                          }
                                        },
                                        child: getText(
                                            text: 'Q',
                                            textStyle: subtitle3,
                                            textAlign: TextAlign.center)),
                                  ),
                                  horizontalGap(
                                      context: context, screenSize: 0.004),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: pressAttention5
                                              ? Colors.blue
                                              : AppColors.schedulecard1,
                                        ),
                                        onPressed: () {
                                          setState(() => pressAttention5 =
                                              !pressAttention5);
                                          if (pressAttention1 = true) {
                                            pressAttention2 = false;
                                            pressAttention3 = false;
                                            pressAttention4 = false;
                                            pressAttention1 = false;
                                          }
                                        },
                                        child: getText(
                                            text: 'Y',
                                            textStyle: subtitle3,
                                            textAlign: TextAlign.center)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Center(
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                          axisLine: const AxisLine(width: 0),
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        primaryXAxis: CategoryAxis(
                          majorTickLines: const MajorTickLines(width: 0),
                          axisLine: const AxisLine(width: 0),
                          isVisible: true,
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        series: <ChartSeries<DayData, String>>[
                          ColumnSeries<DayData, String>(
                              pointColorMapper: (DayData data, _) => data.color,
                              borderWidth: 0,
                              width: 0.4,
                              spacing: 0.5,
                              dataSource: dayData,
                              xValueMapper: (DayData data, _) => data.x,
                              yValueMapper: (DayData data, _) => data.y,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)))
                        ]),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(
                        text: 'Avg. peek hrs this month',
                        textStyle: profilefieldtextStyle3)
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                          axisLine: const AxisLine(width: 0),
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        primaryXAxis: CategoryAxis(
                          majorTickLines: const MajorTickLines(width: 0),
                          axisLine: const AxisLine(width: 0),
                          isVisible: true,
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        series: <ChartSeries<TimeData, String>>[
                          ColumnSeries<TimeData, String>(
                              pointColorMapper: (TimeData data, _) =>
                                  data.color,
                              borderWidth: 0,
                              width: 0.5,
                              spacing: 0.02,
                              dataSource: timeData,
                              xValueMapper: (TimeData data, _) => data.x,
                              yValueMapper: (TimeData data, _) => data.y,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)))
                        ]),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
