import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/search_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/dashboard/schedule/mycare_27.dart';
import 'package:physio/physio/screens/onboarding/policy_terms/privacy_policy.dart';
import 'package:physio/utility/gap_between.dart';

// ignore: camel_case_types
class myCare_26 extends StatefulWidget {
  const myCare_26({Key? key}) : super(key: key);

  @override
  State<myCare_26> createState() => _myCare_26State();
}

// ignore: camel_case_types
class _myCare_26State extends State<myCare_26> {
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
  final hintText;
  return Scaffold(
    backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(208),
      child: Column(
        children: [
          Container(
            color: const Color.fromRGBO(34, 34, 34, 1),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
                left: MediaQuery.of(context).size.width * 0.03,
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
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCare_27()),
                      ),
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
                          padding: const EdgeInsets.only(top: 5),
                          child: const Text(
                            "Pending Reports",
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.001),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalGap(context: context, screenSize: 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  horizontalGap(context: context, screenSize: 0.01),
                  Expanded(
                    child: getText(text: '27th March', textStyle: todaytext),
                    flex: 7,
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
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
        verticalGap(context: context, screenSize: 0.02),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  horizontalGap(context: context, screenSize: 0.01),
                  Expanded(
                    child: getText(text: '27th March', textStyle: todaytext),
                    flex: 7,
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff382424),
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
                                        text:
                                            'Thu, May 27, 3:00 pm - 4:00 pm  ',
                                        textStyle: BaseStyles.carddetailsStyle,
                                        textAlign: TextAlign.left),
                                  ]),
                                  verticalGap(
                                      context: context, screenSize: 0.01),
                                  Row(children: [
                                    getText(
                                        text:
                                            'Condition: Back and shoulder pain',
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
                            color: Color(0xff585858),
                            onPressed: () {},
                            child: const Text('Close',
                                style: BaseStyles.closeStyle),
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
        verticalGap(context: context, screenSize: 0.01),
      ],
    ),
  );
}
