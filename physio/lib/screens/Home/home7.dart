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
class home_7 extends StatefulWidget {
  const home_7({Key? key}) : super(key: key);

  @override
  State<home_7> createState() => _home_7State();
}

// ignore: camel_case_types
class _home_7State extends State<home_7> {
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
    // drawerScrimColor: const Color.fromRGBO(28, 28, 30, 1),
    backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(202),
      child: Container(
        color: const Color.fromRGBO(29, 29, 29, 0.94),
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
                          "Exercise Hub",
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
                            IconlyLight.plus,
                            color: AppColors.buttonColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(84, 84, 88, 0.65),
                  // thickness: 1,
                ),
                verticalGap(context: context, screenSize: 0.02),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.001),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Total \nPatients', textStyle: navlablecolor1),
                    horizontalGap(context: context, screenSize: 0.11),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(
                        text: 'Sessions \nTill date',
                        textStyle: navlablecolor1),
                    horizontalGap(context: context, screenSize: 0.1),
                    getText(text: '06', textStyle: BaseStyles.numberStyle),
                    horizontalGap(context: context, screenSize: 0.015),
                    Expanded(
                      flex: 2,
                      child: getText(
                          text: 'Avg sessions\nPer day',
                          textStyle: navlablecolor1),
                    ),
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
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.0001),
                  Expanded(
                    child: getText(
                        text: 'Recently added (3)', textStyle: todaytext),
                    flex: 7,
                  ),
                  horizontalGap(context: context, screenSize: 0.0001),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              SizedBox(
                height: 309,
                width: 370,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/exercise-1.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Mask Group 135@4x.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.001,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42),
                                      child: getText(
                                          text: 'Air Rowing',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                                                text: '     Hands     ',
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
                                                text: '     Sholder     ',
                                                textStyle: BaseStyles.closeStyle1)),
                                        verticalGap(
                                            context: context, screenSize: 0.002)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.001,
                              right: MediaQuery.of(context).size.width * 0.001,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Exercise-3.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.0001),
                  Expanded(
                    child: getText(
                        text: 'My playlists (25)', textStyle: todaytext),
                    flex: 7,
                  ),
                  horizontalGap(context: context, screenSize: 0.0001),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              SizedBox(
                height: 309,
                width: 370,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/exercise-1.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Mask Group 135@4x.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.001,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42),
                                      child: getText(
                                          text: 'Air Rowing',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                                                text: '     Hands     ',
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
                                                text: '     Sholder     ',
                                                textStyle: BaseStyles.closeStyle1)),
                                        verticalGap(
                                            context: context, screenSize: 0.002)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.001,
                              right: MediaQuery.of(context).size.width * 0.001,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Exercise-3.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.0001),
                  Expanded(
                    child: getText(
                        text: 'Bookmarked Exercises (25)',
                        textStyle: todaytext),
                    flex: 10,
                  ),
                  horizontalGap(context: context, screenSize: 0.0001),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              SizedBox(
                height: 309,
                width: 370,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/exercise-1.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.001,
                            right: MediaQuery.of(context).size.width * 0.001,
                            // bottom: MediaQuery.of(context).size.height * 0.02
                          ),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Mask Group 135@4x.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.001,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42),
                                      child: getText(
                                          text: 'Air Rowing',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                                                text: '     Hands     ',
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
                                                text: '     Sholder     ',
                                                textStyle: BaseStyles.closeStyle1)),
                                        verticalGap(
                                            context: context, screenSize: 0.002)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.001,
                              right: MediaQuery.of(context).size.width * 0.001,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Card(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            shadowColor: Colors.black,
                            borderOnForeground: true,
                            child: Row(
                              children: [
                                Container(
                                    height: 95,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Exercise-3.png"),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.020,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5),
                                      child: getText(
                                          text: 'Sit ups',
                                          textStyle: aboutYouText1),
                                    ),
                                    Row(children: [
                                      horizontalGap(
                                          context: context, screenSize: 0.02),
                                      getText(
                                          text:
                                              'Details/discription of the expercise that is being \nshown here.',
                                          textStyle: subtitle2),
                                    ]),
                                    Row(
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
                              ],
                            ),
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
    ),
  );
}
