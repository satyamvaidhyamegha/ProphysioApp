import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/search_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
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
      preferredSize: const Size.fromHeight(200),
      child: Container(
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
                    onTap: () => Navigator.of(context).pop(false),
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
                          onPressed: () {},
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
                  children: [
                    horizontalGap(context: context, screenSize: 0.001),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(text: 'Created \nToday', textStyle: navlablecolor1),
                    horizontalGap(context: context, screenSize: 0.11),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Report \nPending', textStyle: navlablecolor1),
                    horizontalGap(context: context, screenSize: 0.11),
                    getText(text: '3.5', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Completed \nRepots', textStyle: navlablecolor1),
                  ],
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
              verticalGap(context: context, screenSize: 0.01),
              SearchWidget(
                  suffixIcon: const Icon(
                    IconlyLight.voice,
                    color: Colors.white,
                  ),
                  prefixIcon:
                      const Icon(IconlyLight.search, color: Color(0xff9E9EA5)),
                  controller: myCareSearch,
                  hintText: Strings.SEARCH,
                  inputAction: TextInputAction.search),
              verticalGap(context: context, screenSize: 0.03),
              Row(children: [
                horizontalGap(context: context, screenSize: 0.0001),
                Expanded(
                  child: getText(text: 'Today’s Session', textStyle: todaytext),
                  flex: 7,
                ),
                horizontalGap(context: context, screenSize: 0.2),
                Expanded(
                  child: getText(text: '(25)', textStyle: todaytext),
                  flex: 2,
                ),
                horizontalGap(context: context, screenSize: 0.0001),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ]),
            ],
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.01,
                          bottom: MediaQuery.of(context).size.width * 0.001,
                        ),
                        child: getText(
                            text: 'Ashish Mehta, M 67',
                            textStyle: BaseStyles.nameStyle),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.0001,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.04,
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                    left: MediaQuery.of(context).size.width * 0.040,
                    right: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: getText(
                      text: 'Thu,3:00 pm - 4:00 pm',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.002,
                      left: MediaQuery.of(context).size.width * 0.040,
                      right: MediaQuery.of(context).size.width * 0.03,
                      bottom: MediaQuery.of(context).size.width * 0.02),
                  child: getText(
                      text: 'Condition: Back and shoulder pain',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.01,
                        bottom: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.0001,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.04,
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                    left: MediaQuery.of(context).size.width * 0.040,
                    right: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: getText(
                      text: 'Thu,3:00 pm - 4:00 pm',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.002,
                      left: MediaQuery.of(context).size.width * 0.040,
                      right: MediaQuery.of(context).size.width * 0.03,
                      bottom: MediaQuery.of(context).size.width * 0.02),
                  child: getText(
                      text: 'Condition: Back and shoulder pain',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                        left: MediaQuery.of(context).size.width * 0.032,
                        right: MediaQuery.of(context).size.width * 0.01,
                        bottom: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.0001,
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.04,
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                    left: MediaQuery.of(context).size.width * 0.040,
                    right: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: getText(
                      text: 'Thu,3:00 pm - 4:00 pm',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.002,
                      left: MediaQuery.of(context).size.width * 0.040,
                      right: MediaQuery.of(context).size.width * 0.03,
                      bottom: MediaQuery.of(context).size.width * 0.02),
                  child: getText(
                      text: 'Condition: Back and shoulder pain',
                      textStyle: BaseStyles.carddetailsStyle),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        Row(children: [
          horizontalGap(context: context, screenSize: 0.04),
          getText(text: 'Pending Session', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.35),
          getText(text: '(4)', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.0001),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ]),
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      onPressed: () {},
                      iconSize: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.04,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                              text: 'Condition: Back and shoulder pain',
                              textStyle: BaseStyles.carddetailsStyle),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        // right: MediaQuery.of(context).size.width * 0.004,
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color(0xff585858),
                        onPressed: () {},
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
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001,
                          left: MediaQuery.of(context).size.width * 0.032,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    Container(
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.videocam),
                        color: Colors.blue,
                        onPressed: () {},
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.032,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                              text: 'Condition: Back and shoulder pain',
                              textStyle: BaseStyles.carddetailsStyle),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        // right: MediaQuery.of(context).size.width * 0.004,
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xff585858),
                        onPressed: () {},
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
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff382424),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001,
                          left: MediaQuery.of(context).size.width * 0.032,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      onPressed: () {},
                      iconSize: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.0001,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.032,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                              text: 'Condition: Back and shoulder pain',
                              textStyle: BaseStyles.carddetailsStyle),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        // right: MediaQuery.of(context).size.width * 0.004,
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.001,
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xff585858),
                        onPressed: () {},
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
        verticalGap(context: context, screenSize: 0.03),
        Row(children: [
          horizontalGap(context: context, screenSize: 0.04),
          getText(text: 'Closed Session', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.35),
          getText(text: '(25)', textStyle: todaytext),
          horizontalGap(context: context, screenSize: 0.0001),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ]),
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      iconSize: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.032,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.04,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      iconSize: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.032,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.04,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(31, 34, 30, 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: getText(
                          text: 'Ashish Mehta, M 67',
                          textStyle: BaseStyles.nameStyle),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.videocam),
                      color: Colors.blue,
                      iconSize: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.032,
                          ),
                          child: getText(
                              text: 'Thu, May 27, 3:00 pm - 4:00 pm ',
                              textStyle: BaseStyles.carddetailsStyle,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.002,
                              left: MediaQuery.of(context).size.width * 0.04,
                              // right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02),
                          child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
      ],
    ),
  );
}
