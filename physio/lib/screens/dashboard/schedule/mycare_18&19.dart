import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:physio/main.dart';
import 'package:physio/utility/gap_between.dart';
import 'package:physio/constants/string.dart';
import '../../../BaseWidget/search_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/string.dart';
import '../../../constants/style.dart';
import '../../../constants/text_constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: camel_case_types
class pendingAptsScreen extends StatefulWidget {
  const pendingAptsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _pendingAptsScreenState();
  }
}

// ignore: camel_case_types
class _pendingAptsScreenState extends State<pendingAptsScreen> {
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

  var itemCredential;
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
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Pending apts Reqs",
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
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xff9E9EA5)),
                    controller: myCareSearch,
                    hintText: Strings.SEARCH,
                    inputAction: TextInputAction.search),
                verticalGap(context: context, screenSize: 0.03),
              ]),
        ),
        verticalGap(context: context, screenSize: 0.03),
        AnimatedContainer(
          duration: Duration.zero,
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: const ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: pendingAptPopup,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: giveReason,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(),
                  icon: Icons.close,
                  label: 'Reject',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: accepted,
                  backgroundColor: Color(0xFF07C333),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  icon: Icons.check,
                  label: 'Accept',
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xff1C1C1E),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '10:00',
                                  textStyle:
                                      BaseStyles.numStyleForslideScreen)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: getText(
                                  text: 'am',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff2E2E2E)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.135,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.032,
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Suraj Deshmukh, M 46',
                                textStyle: BaseStyles.nameStyle),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.004,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            icon: const Icon(Icons.videocam_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: MediaQuery.of(context).size.width * 0.040,
                          right: MediaQuery.of(context).size.width * 0.27,
                        ),
                        child: getText(
                            text: 'Wed, 12:00 pm - 1:00 pm',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002,
                            left: MediaQuery.of(context).size.width * 0.040,
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        AnimatedContainer(
          duration: Duration.zero,

          //   ),
          child: Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(0),

            endActionPane: const ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: pendingAptPopup,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: giveReason,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(),
                  icon: Icons.close,
                  label: 'Reject',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: accepted,
                  backgroundColor: Color(0xFF07C333),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  icon: Icons.check,
                  label: 'Accept',
                ),
              ],
            ),

            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xff1C1C1E),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '10:00',
                                  textStyle:
                                      BaseStyles.numStyleForslideScreen)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: getText(
                                  text: 'am',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff2E2E2E)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.135,
                  // color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.032,
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Suraj Deshmukh, M 46',
                                textStyle: BaseStyles.nameStyle),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.004,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            icon: const Icon(Icons.videocam_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: MediaQuery.of(context).size.width * 0.040,
                          right: MediaQuery.of(context).size.width * 0.27,
                        ),
                        child: getText(
                            text: 'Wed, 12:00 pm - 1:00 pm',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002,
                            left: MediaQuery.of(context).size.width * 0.040,
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        AnimatedContainer(
          duration: Duration.zero,
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: const ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: pendingAptPopup,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: giveReason,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(),
                  icon: Icons.close,
                  label: 'Reject',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: accepted,
                  backgroundColor: Color(0xFF07C333),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  icon: Icons.check,
                  label: 'Accept',
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 75,
                      color: Color(0xff1C1C1E),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                // top: MediaQuery.of(context).size.height *
                                //     0.001,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '10:00',
                                  textStyle:
                                      BaseStyles.numStyleForslideScreen)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: getText(
                                  text: 'am',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff2E2E2E)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.135,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.032,
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Suraj Deshmukh, M 46',
                                textStyle: BaseStyles.nameStyle),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.004,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            icon: const Icon(Icons.videocam_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: MediaQuery.of(context).size.width * 0.040,
                          right: MediaQuery.of(context).size.width * 0.27,
                          // bottom: MediaQuery.of(context).size.width * 0.02
                        ),
                        child: getText(
                            text: 'Wed, 12:00 pm - 1:00 pm',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002,
                            left: MediaQuery.of(context).size.width * 0.040,
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        AnimatedContainer(
          duration: Duration.zero,
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: const ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: pendingAptPopup,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: giveReason,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(),
                  icon: Icons.close,
                  label: 'Reject',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: accepted,
                  backgroundColor: Color(0xFF07C333),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  icon: Icons.check,
                  label: 'Accept',
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 75,
                      color: Color(0xff1C1C1E),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '10:00',
                                  textStyle:
                                      BaseStyles.numStyleForslideScreen)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: getText(
                                  text: 'am',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff2E2E2E)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.135,
                  // color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.032,
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Suraj Deshmukh, M 46',
                                textStyle: BaseStyles.nameStyle),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.004,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            icon: const Icon(Icons.videocam_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: MediaQuery.of(context).size.width * 0.040,
                          right: MediaQuery.of(context).size.width * 0.27,
                        ),
                        child: getText(
                            text: 'Wed, 12:00 pm - 1:00 pm',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002,
                            left: MediaQuery.of(context).size.width * 0.040,
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: getText(
                            text: 'Condition: Back and shoulder pain',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        AnimatedContainer(
          duration: Duration.zero,
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: const ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: pendingAptPopup,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  icon: Icons.more_horiz,

                  label: 'More',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: giveReason,
                  backgroundColor: Color.fromARGB(146, 144, 146, 134),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(),
                  icon: Icons.close,
                  label: 'Reject',
                ),
                Padding(padding: EdgeInsets.all(0.2)),
                SlidableAction(
                  flex: 2,
                  onPressed: accepted,
                  backgroundColor: Color(0xFF07C333),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  icon: Icons.check,
                  label: 'Accept',
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xff1C1C1E),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '10:00',
                                  textStyle:
                                      BaseStyles.numStyleForslideScreen)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: getText(
                                  text: 'am',
                                  textStyle:
                                      BaseStyles.textStyleForslideScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff2E2E2E)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.135,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.032,
                                right:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Suraj Deshmukh, M 46',
                                textStyle: BaseStyles.nameStyle),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.004,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            icon: const Icon(Icons.videocam_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.002,
                          left: MediaQuery.of(context).size.width * 0.040,
                          right: MediaQuery.of(context).size.width * 0.27,
                        ),
                        child: getText(
                            text: 'Wed, 12:00 pm - 1:00 pm',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002,
                            left: MediaQuery.of(context).size.width * 0.040,
                            right: MediaQuery.of(context).size.width * 0.27,
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: getText(
                            text: 'Condition: Back and shoulder pain ',
                            textStyle: BaseStyles.carddetailsStyle),
                      ),
                    ],
                  ),
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

void accepted(BuildContext context) {}
void giveReason(BuildContext context) {}
Future pendingAptPopup(BuildContext context) {
  return showDialog(context: context, builder: _buildPopupDialog);
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Color(0xff2C2D31),
    alignment: Alignment.centerLeft,
    // alignment:  MainAxisAlignment.center,
    content: Container(
      width: 200,
      height: 96,
      color: Color(0xff2C2D31),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: FlatButton(
                  onPressed: () {},
                  child:
                      const Text('Send a message', style: BaseStyles.PopUpText),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: FlatButton(
                  onPressed: () {},
                  child:
                      const Text('View profile', style: BaseStyles.PopUpText),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
