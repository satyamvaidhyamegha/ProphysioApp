import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:physio/utility/gap_between.dart';
import 'package:physio/constants/string.dart';
import '../../../BaseWidget/search_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/string.dart';
import '../../../constants/style.dart';
import '../../../constants/text_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCare_23Screen extends StatefulWidget {
  const MyCare_23Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyCare_23ScreenState();
  }
}

class MyCare_23ScreenState extends State<MyCare_23Screen> {
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
    backgroundColor: Color(0xff1C1C1E),
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: Container(
        color: Color(0xff1B232366),
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
                  height: 44,
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 44,
                  padding: const EdgeInsets.only(top: 5),
                  child: const Text(
                    "Pending Reports",
                    style: TextStyle(
                      fontSize: 34,
                      fontFamily: 'Mulish',
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
              verticalGap(context: context, screenSize: 0.01),
              SearchWidget(
                  suffixIcon: const Icon(
                    Icons.mic_none,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.search, color: Color(0xff9E9EA5)),
                  controller: myCareSearch,
                  hintText: Strings.SEARCH,
                  inputAction: TextInputAction.search),
              verticalGap(context: context, screenSize: 0.03),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.001,
                  left: MediaQuery.of(context).size.width * 0.0001,
                  // right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: getText(
                  text: "27th March",
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
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
            top: MediaQuery.of(context).size.height * 0.001,
            left: MediaQuery.of(context).size.width * 0.0001,
            // right: MediaQuery.of(context).size.width * 0.3,
          ),
          child: getText(
            text: "27th March",
            textStyle: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
              fontSize: 22,
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
      ],
    ),
  );
}
