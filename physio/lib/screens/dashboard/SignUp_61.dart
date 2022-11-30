import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/screens/Home/people.dart';

import '../../BaseWidget/search_widget.dart';
import '../../utility/gap_between.dart';

class SignUp_61 extends StatefulWidget {
  const SignUp_61({Key? key}) : super(key: key);

  @override
  State<SignUp_61> createState() => _SignUp_61State();
}

class _SignUp_61State extends State<SignUp_61> {
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
    backgroundColor: Color(0xff222222),
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(205),
      child: Container(
        color: Color(0xff222222),
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
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 0.02),
                    child: const Text(
                      "New Exercises",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  verticalGap(context: context, screenSize: 0.025),
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
                ])),
      ),
    ),
    body: ListView(
      scrollDirection: Axis.vertical,
      controller: mycontroller1,
      addAutomaticKeepAlives: true,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalGap(context: context, screenSize: 0.01),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.001,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: getText(
                text: "Newly Added",
                textStyle: todaytext,
              ),
            ),
          ],
        ),
        verticalGap(context: context, screenSize: 0.01),
        SizedBox(
          width: windowWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Card(
                    color: AppColors.signupscreen,
                    shadowColor: Colors.black,
                    borderOnForeground: true,
                    child: Row(children: [
                      Container(
                          height: 95,
                          width: 92,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0),
                              ),
                              image: DecorationImage(
                                  image: AssetImage("assets/exercise-1.png"),
                                  fit: BoxFit.cover))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalGap(context: context, screenSize: 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.02),
                                getText(
                                    text: 'Sit ups', textStyle: aboutYouText1),
                              ]),
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.02),
                            getText(
                                text:
                                    'Details/discription of the expercise that is being \nshown here.',
                                textStyle: subtitle2),
                          ]),
                          Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.13),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     legs     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              horizontalGap(context: context, screenSize: 0.04),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     Lower back     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              verticalGap(context: context, screenSize: 0.002)
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02),
                  child: Card(
                    color: AppColors.signupscreen,
                    shadowColor: Colors.black,
                    borderOnForeground: true,
                    child: Row(children: [
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalGap(context: context, screenSize: 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.02),
                                getText(
                                    text: 'Air Rowing',
                                    textStyle: aboutYouText1),
                              ]),
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.02),
                            getText(
                                text:
                                    'Details/discription of the expercise that is being \nshown here.',
                                textStyle: subtitle2),
                          ]),
                          Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.13),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     Hands     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              horizontalGap(context: context, screenSize: 0.04),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     Sholder     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              verticalGap(context: context, screenSize: 0.002)
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.02),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02),
                  child: Card(
                    color: AppColors.signupscreen,
                    shadowColor: Colors.black,
                    borderOnForeground: true,
                    child: Row(children: [
                      Container(
                          height: 95,
                          width: 92,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0),
                              ),
                              image: DecorationImage(
                                  image: AssetImage("assets/Exercise-3.png"),
                                  fit: BoxFit.cover))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalGap(context: context, screenSize: 0.01),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.02),
                                getText(
                                    text: 'Sit ups', textStyle: aboutYouText1),
                              ]),
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.02),
                            getText(
                                text:
                                    'Details/discription of the expercise that is being \nshown here.',
                                textStyle: subtitle2),
                          ]),
                          Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.13),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     legs     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              horizontalGap(context: context, screenSize: 0.04),
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
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                                  onPressed: () {},
                                  child: getText(
                                      text: '     Lower back     ',
                                      textStyle: BaseStyles.closeStyle1)),
                              verticalGap(context: context, screenSize: 0.04)
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.02),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                  text: "Upper Body",
                  textStyle: todaytext,
                ),
              ],
            ),
          ],
        ),
        verticalGap(context: context, screenSize: 0.01),
        SizedBox(
          width: windowWidth,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Card(
                  color: AppColors.signupscreen,
                  shadowColor: Colors.black,
                  borderOnForeground: true,
                  child: Row(children: [
                    Container(
                        height: 95,
                        width: 92,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                            ),
                            image: DecorationImage(
                                image: AssetImage("assets/Exercise-4.png"),
                                fit: BoxFit.cover))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.02),
                          getText(text: 'Sit ups', textStyle: aboutYouText1),
                        ]),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.02),
                          getText(
                              text:
                                  'Details/discription of the expercise that is being \nshown here.',
                              textStyle: subtitle2),
                        ]),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.13),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     legs     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            horizontalGap(context: context, screenSize: 0.04),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     Lower back     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            verticalGap(context: context, screenSize: 0.001)
                          ],
                        )
                      ],
                    )
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.02),
                child: Card(
                  color: AppColors.signupscreen,
                  shadowColor: Colors.black,
                  borderOnForeground: true,
                  child: Row(children: [
                    Container(
                        height: 95,
                        width: 92,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                            ),
                            image: DecorationImage(
                                image: AssetImage("assets/Exercise-5.png"),
                                fit: BoxFit.cover))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              horizontalGap(context: context, screenSize: 0.02),
                              getText(
                                  text: 'Air Rowing', textStyle: aboutYouText1),
                            ]),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.02),
                          getText(
                              text:
                                  'Details/discription of the expercise that is being \nshown here.',
                              textStyle: subtitle2),
                        ]),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.13),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     Hands     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            horizontalGap(context: context, screenSize: 0.04),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     Sholder     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            verticalGap(context: context, screenSize: 0.002)
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
                  color: AppColors.signupscreen,
                  shadowColor: Colors.black,
                  borderOnForeground: true,
                  child: Row(children: [
                    Container(
                        height: 95,
                        width: 92,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                            ),
                            image: DecorationImage(
                                image: AssetImage("assets/Exercise-6.png"),
                                fit: BoxFit.cover))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              horizontalGap(context: context, screenSize: 0.02),
                              getText(
                                  text: 'Sit ups', textStyle: aboutYouText1),
                            ]),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.02),
                          getText(
                              text:
                                  'Details/discription of the expercise that is being \nshown here.',
                              textStyle: subtitle2),
                        ]),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.13),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     legs     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            horizontalGap(context: context, screenSize: 0.04),
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
                                            const EdgeInsets.all(8)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ))),
                                onPressed: () {},
                                child: getText(
                                    text: '     Lower back     ',
                                    textStyle: BaseStyles.closeStyle1)),
                            verticalGap(context: context, screenSize: 0.04)
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
            ]),
          ),
        ),
        verticalGap(context: context, screenSize: 0.04)
      ],
    ),
  );
}
