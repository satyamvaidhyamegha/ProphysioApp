import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/utility/gap_between.dart';
import 'package:physio/constants/string.dart';
import '../../../../BaseWidget/search_widget.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/text_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: camel_case_types
class Report_32Screen extends StatefulWidget {
  const Report_32Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Report_32ScreenState();
  }
}

class _Report_32ScreenState extends State<Report_32Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: initScreen(context),
    );
  }
}

initScreen(BuildContext context) {
  final TextEditingController myCareSearch = TextEditingController();
  ScrollController mycontroller1 = ScrollController();
  ScrollController mycontroller2 = ScrollController();

  return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          color: const Color.fromRGBO(34, 34, 34, 1),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.03),
                  Container(
                    height: 44,
                    padding: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "Complaint",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        controller: mycontroller1,
        addAutomaticKeepAlives: true,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalGap(context: context, screenSize: 0.02),
                SearchWidget(
                    suffixIcon: const Icon(
                      Icons.mic_none,
                      color: Colors.white,
                    ),
                    prefixIcon: const Icon(Icons.search,
                        color: const Color(0xff9E9EA5)),
                    controller: myCareSearch,
                    hintText: Strings.SEARCH,
                    inputAction: TextInputAction.search),
                verticalGap(context: context, screenSize: 0.03),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                    left: MediaQuery.of(context).size.width * 0.003,
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: getText(
                    text: "Today",
                    textStyle: todaytext,
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Kanti Roy, F 35',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu, May 27, 3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Kanti Roy, F 35',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu, May 27, 3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Kanti Roy, F 35',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu, May 27, 3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                    left: MediaQuery.of(context).size.width * 0.003,
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: getText(
                    text: "Later",
                    textStyle: todaytext,
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Ashish Mehta, M 67',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu,3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Ashish Mehta, M 67',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu,3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color(0xff1C1C1E),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: getText(
                                        text: '10:00',
                                        textStyle:
                                            BaseStyles.numStyleForslideScreen)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    child: getText(
                                        text: 'am',
                                        textStyle: BaseStyles
                                            .textStyleForslideScreen)),
                              ],
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.025),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2E2E2E)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.001,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.001,
                                      ),
                                      child: getText(
                                          text: 'Ashish Mehta, M 67',
                                          textStyle: BaseStyles.nameStyle),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      icon: const Icon(CupertinoIcons.videocam),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.001,
                                    left: MediaQuery.of(context).size.width *
                                        0.040,
                                    right: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  child: getText(
                                      text: 'Thu,3:00 pm - 4:00 pm',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.002,
                                      left: MediaQuery.of(context).size.width *
                                          0.040,
                                      right: MediaQuery.of(context).size.width *
                                          0.03,
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: getText(
                                      text: 'Condition: Back and shoulder pain',
                                      textStyle: BaseStyles.carddetailsStyle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
