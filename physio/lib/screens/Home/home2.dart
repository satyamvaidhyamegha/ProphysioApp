import 'package:badges/badges.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/model/Barchart%20Model/barchart_model.dart';
import 'package:physio/utility/gap_between.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

late TooltipBehavior _tooltipBehavior;

class _Home2State extends State<Home2> {
  // ignore: prefer_typing_uninitialized_variables
  var windowWidth;
  // ignore: prefer_typing_uninitialized_variables
  var windowHeight;
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: initScreen(context),
    );
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,

        /// Templating the tooltip
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(
            child: Text(
              '${point.y.toString()} session',
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
    super.initState();
  }

  initScreen(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData("M", 35),
      ChartData("T ", 23),
      ChartData("W", 34),
      ChartData("T", 25),
      ChartData("F", 40),
      ChartData("S", 34),
      ChartData("S ", 25),
    ];

    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: windowWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalGap(context: context, screenSize: 0.1),
              Row(children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Welcome', textStyle: certificationHeader3),
                horizontalGap(context: context, screenSize: 0.8),
              ]),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  horizontalGap(context: context, screenSize: 0.03),
                  getText(text: 'Dr. Janet', textStyle: subheadertext1),
                  horizontalGap(context: context, screenSize: 0.44),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                      child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/DoctorImage.png"),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  horizontalGap(context: context, screenSize: 0.04),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 0.5,
                endIndent: 0,
                indent: 0,
                color: Colors.grey,
              ),
              verticalGap(context: context, screenSize: 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  getText(text: '25', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(
                      text: 'Upcoming \nAppointment',
                      textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.08),
                  getText(text: '03', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'Report \nPending', textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.06),
                  getText(text: '3.5', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'Earning \nToday', textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.04)
                ],
              ),
              verticalGap(context: context, screenSize: 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  getText(text: '06', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'New \nMessages', textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.08),
                  getText(text: '06', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'Patient \nUpdates', textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.06),
                  getText(text: '0.6', textStyle: BaseStyles.numberStyle),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'New \nPatients', textStyle: navlablecolor1),
                  horizontalGap(context: context, screenSize: 0.04)
                ],
              ),
              verticalGap(context: context, screenSize: 0.03),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  getParaText(
                      text: 'Most productive day this week',
                      textStyle: profilefieldtextStyle3)
                ],
              ),
              verticalGap(context: context, screenSize: 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 380,
                      child: SfCartesianChart(
                          tooltipBehavior: _tooltipBehavior,
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
                          series: <ChartSeries<ChartData, String>>[
                            ColumnSeries<ChartData, String>(
                                borderWidth: 0,
                                width: 0.8,
                                spacing: 0.3,
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(18)))
                          ]),
                    ),
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(
                        text: 'Patient updates',
                        textStyle: profilefieldtextStyle3),
                    horizontalGap(context: context, screenSize: 0.3),
                    getText(text: '(25)', textStyle: todaytext),
                    horizontalGap(context: context, screenSize: 0.02),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    horizontalGap(context: context, screenSize: 0.04)
                  ]),
              verticalGap(context: context, screenSize: 0.02),
              SizedBox(
                height: 200,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.001),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'New messages', textStyle: profilefieldtextStyle3),
                horizontalGap(context: context, screenSize: 0.3),
                getText(text: '(25)', textStyle: todaytext),
                horizontalGap(context: context, screenSize: 0.04),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 22.0,
                ),
                horizontalGap(context: context, screenSize: 0.04)
              ]),
              verticalGap(context: context, screenSize: 0.02),
              SizedBox(
                height: 200,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                            position: BadgePosition.topStart(),
                            badgeContent: const Text('3'),
                            badgeColor: Colors.orange,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/DoctorImage.png"),
                                        fit: BoxFit.cover))),
                          ),
                          horizontalGap(context: context, screenSize: 0.02),
                          verticalGap(context: context, screenSize: 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          getText(
                                              text: "DR. Pramod",
                                              textStyle: aboutYouText1),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.32),
                                          getText(
                                              text: "Yesterday",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.002),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ])),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.002,
                                      right: MediaQuery.of(context).size.width *
                                          0.14),
                                  child: getText(
                                      text:
                                          'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                      textStyle: subtitle2),
                                ),
                              ]),
                            ],
                          ),
                        ]),
                    const Divider(
                      height: 20,
                      thickness: 0.25,
                      indent: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'New Exercises', textStyle: profilefieldtextStyle3),
                horizontalGap(context: context, screenSize: 0.3),
                getText(text: '(25)', textStyle: todaytext),
                horizontalGap(context: context, screenSize: 0.04),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 22.0,
                ),
                horizontalGap(context: context, screenSize: 0.04)
              ]),
              verticalGap(context: context, screenSize: 0.03),
              SizedBox(
                height: 200,
                child: ListView(padding: EdgeInsets.zero, children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Card(
                      color: AppColors.kBGcolor,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 95,
                                width: 92,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18.0),
                                      bottomLeft: Radius.circular(18.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/Mask Group 135@4x.png"),
                                        fit: BoxFit.cover))),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.54),
                                  child: getText(
                                      text: 'Sit ups',
                                      textStyle: aboutYouText1),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                Row(
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
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     legs     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    horizontalGap(
                                        context: context, screenSize: 0.04),
                                    TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ))),
                                        onPressed: () {},
                                        child: getText(
                                            text: '     Lower back     ',
                                            textStyle: BaseStyles.closeStyle1)),
                                    verticalGap(
                                        context: context, screenSize: 0.002)
                                  ],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.04),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        verticalGap(context: context, screenSize: 0.17),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: Row(
            children: [
              horizontalGap(context: context, screenSize: 0.32),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: AppColors.bacColor,
                ),
                child: Column(
                  children: [
                    verticalGap(context: context, screenSize: 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        horizontalGap(context: context, screenSize: 0.46),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(
                              text: 'My Profile', textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(
                              text: 'Notifications', textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(
                              text: 'Payment & Subscription',
                              textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(
                              text: 'Password & Security',
                              textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(text: 'Settings', textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.015),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(
                              text: 'Privacy Policy',
                              textStyle: buttonTextStyle)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
