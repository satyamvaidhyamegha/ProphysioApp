import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/search_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/Home/reports_37.dart';
import 'package:physio/physio/screens/Home/reports_38.dart';
import 'package:physio/physio/screens/dashboard/schedule/myCare_25.dart';
import 'package:physio/physio/screens/dashboard/schedule/myCare_28.dart';
import 'package:physio/physio/screens/dashboard/schedule/myCare_31.dart';
import 'package:physio/physio/screens/dashboard/schedule/mycare_26.dart';
import 'package:physio/utility/gap_between.dart';

// ignore: camel_case_types
class MyCare_27 extends StatefulWidget {
  const MyCare_27({Key? key}) : super(key: key);

  @override
  State<MyCare_27> createState() => _MyCare_27State();
}

// ignore: camel_case_types
class _MyCare_27State extends State<MyCare_27> {
  // ignore: prefer_typing_uninitialized_variables
  var windowWidth;
  // ignore: prefer_typing_uninitialized_variables
  var windowHeight;
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
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
      preferredSize: const Size.fromHeight(290),
      child: Column(
        children: [
          Container(
            color: const Color.fromRGBO(34, 34, 34, 1),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
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
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: 44,
                            padding: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "Reports - Session",
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        horizontalGap(context: context, screenSize: 0.13),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyCare_31(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.plus,
                                color: AppColors.buttonColor,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalGap(context: context, screenSize: 0.035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        horizontalGap(context: context, screenSize: 0.001),
                        Expanded(
                          flex: 0,
                          child: getText(
                              text: '06', textStyle: BaseStyles.numberStyle),
                        ),
                        horizontalGap(context: context, screenSize: 0.02),
                        getText(
                            text: 'Created \nToday', textStyle: navlablecolor1),
                        horizontalGap(context: context, screenSize: 0.11),
                        Expanded(
                          flex: 0,
                          child: getText(
                              text: '06', textStyle: BaseStyles.numberStyle),
                        ),
                        horizontalGap(context: context, screenSize: 0.02),
                        getText(
                            text: 'Report \nPending',
                            textStyle: navlablecolor1),
                        horizontalGap(context: context, screenSize: 0.11),
                        Expanded(
                          flex: 0,
                          child: getText(
                              text: '3.5', textStyle: BaseStyles.numberStyle),
                        ),
                        horizontalGap(context: context, screenSize: 0.02),
                        getText(
                            text: 'Completed \nRepots',
                            textStyle: navlablecolor1),
                      ],
                    ),
                  ]),
            ),
          ),
          verticalGap(context: context, screenSize: 0.0001),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalGap(context: context, screenSize: 0.01),
                SearchWidget(
                    suffixIcon: const Icon(
                      IconlyLight.voice,
                      color: Colors.white,
                    ),
                    prefixIcon: const Icon(IconlyLight.search,
                        color: Color(0xff9E9EA5)),
                    controller: myCareSearch,
                    hintText: Strings.SEARCH,
                    inputAction: TextInputAction.search),
                verticalGap(context: context, screenSize: 0.001),
              ],
            ),
          )
        ],
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            horizontalGap(context: context, screenSize: 0.0001),
            Expanded(
              child: getText(text: 'Today’s Session', textStyle: todaytext),
              flex: 7,
            ),
            horizontalGap(context: context, screenSize: 0.25),
            Expanded(
              child: getText(text: '(25)', textStyle: todaytext),
              flex: 2,
            ),
            horizontalGap(context: context, screenSize: 0.0001),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const myCare_25(),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.offlineButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_37(),
                            ),
                          );
                        },
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.offlineButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_37(),
                            ),
                          );
                        },
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.offlineButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_37(),
                            ),
                          );
                        },
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.02),
        Row(children: [
          horizontalGap(context: context, screenSize: 0.04),
          getText(text: 'Pending Session', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.35),
          getText(text: '(4)', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.0001),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const myCare_26(),
                ),
              );
            },
          ),
        ]),
        verticalGap(context: context, screenSize: 0.02),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                            ]),
                      ),
                    ),
                    // verticalGap(context: context, screenSize: 0.02),
                    // horizontalGap(context: context, screenSize: 0.22),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: FlatButton(
                        height: 24,
                        minWidth: 68,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: const Color(0xff585858),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_38(),
                            ),
                          );
                        },
                        child:
                            const Text('Close', style: BaseStyles.closeStyle),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                            ]),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: FlatButton(
                        height: 24,
                        minWidth: 68,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: const Color(0xff585858),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_38(),
                            ),
                          );
                        },
                        child:
                            const Text('Close', style: BaseStyles.closeStyle),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                            ]),
                      ),
                    ),
                    // verticalGap(context: context, screenSize: 0.02),
                    // horizontalGap(context: context, screenSize: 0.22),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: FlatButton(
                        height: 24,
                        minWidth: 68,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: const Color(0xff585858),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reports_38(),
                            ),
                          );
                        },
                        child:
                            const Text('Close', style: BaseStyles.closeStyle),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.02),
        Row(children: [
          horizontalGap(context: context, screenSize: 0.04),
          Expanded(
            flex: 0,
            child: getText(text: 'Closed Session', textStyle: todaytext),
          ),
          horizontalGap(context: context, screenSize: 0.35),
          Expanded(
            flex: 0,
            child: getText(text: '(25)', textStyle: todaytext),
          ),
          horizontalGap(context: context, screenSize: 0.0001),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.white,
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyCare_28()),
            ),
          ),
        ]),
        verticalGap(context: context, screenSize: 0.02),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const reports_37()),
                        ),
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const reports_37()),
                        ),
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    Expanded(
                      flex: 6,
                      child: getText(
                          text: 'Ashish Mehta, M 67  ',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const reports_37()),
                        ),
                        child: const Icon(
                          IconlyLight.video,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // horizontalGap(context: context, screenSize: 0.01),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.018,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                getText(
                                    text: 'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                    textStyle: BaseStyles.carddetailsStyle,
                                    textAlign: TextAlign.left),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                              Row(children: [
                                getText(
                                    text: 'Condition: Back and shoulder pain',
                                    textStyle: BaseStyles.carddetailsStyle),
                              ]),
                              verticalGap(context: context, screenSize: 0.01),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
      ],
    ),
  );
}
