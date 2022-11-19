import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';
import 'package:physio/constants/style.dart';

class MyCare_24 extends StatefulWidget {
  const MyCare_24({Key? key}) : super(key: key);

  @override
  State<MyCare_24> createState() => _MyCare_24State();
}

class _MyCare_24State extends State<MyCare_24> {
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
      preferredSize: Size.fromHeight(190),
      child: Container(
        height: 160,
        color: Color(0xff222222),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
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
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 0.03),
                child: const Text(
                  "Sit ups",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    body: ListView(
      scrollDirection: Axis.vertical,
      controller: mycontroller1,
      addAutomaticKeepAlives: true,
      children: [
        Container(
          height: 246,
          child: const Image(
            image: AssetImage("assets/ExerciseVideo.png"),
            fit: BoxFit.fill,
          ),
        ),
        verticalGap(context: context, screenSize: 0.12),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Container(
            child: getText(text: 'Sit ups - 30 Secs', textStyle: aboutYouText1),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            // right: MediaQuery.of(context).size.width * 0.05,
            // bottom: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Container(
            width: 300,
            height: 51,
            child: getText(
                text:
                    'Details/discription of the expercise that is being \nshown here. Details/discription of the expercise that is\nbeing shown here.',
                textStyle: Description),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            // right: MediaQuery.of(context).size.width * 0.05,
            // bottom: MediaQuery.of(context).size.width * 0.05,
          ),
          child: getText(text: 'Body parts focused', textStyle: aboutYouText1),
        ),
        verticalGap(context: context, screenSize: 0.03),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      child: getText(
                          text: '     Lower back     ',
                          textStyle: BaseStyles.closeStyle1)),
                  horizontalGap(context: context, screenSize: 0.04),
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      child: getText(
                          text: '     Shoulders     ',
                          textStyle: BaseStyles.closeStyle1)),
                  horizontalGap(context: context, screenSize: 0.04),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(8)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {},
                    child: getText(
                        text: '     Back     ',
                        textStyle: BaseStyles.closeStyle1),
                  ),
                ],
              ),
            ),
            horizontalGap(context: context, screenSize: 0.04),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            // right: MediaQuery.of(context).size.width * 0.05,
            // bottom: MediaQuery.of(context).size.width * 0.05,
          ),
          child: getText(text: 'Equipment needed', textStyle: aboutYouText1),
        ),
        verticalGap(context: context, screenSize: 0.03),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      child: getText(
                          text: '     Chair     ',
                          textStyle: BaseStyles.closeStyle1)),
                  horizontalGap(context: context, screenSize: 0.04),
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      child: getText(
                          text: '     Yoga Mat     ',
                          textStyle: BaseStyles.closeStyle1)),
                  horizontalGap(context: context, screenSize: 0.04),
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      child: getText(
                          text: '     Shoes     ',
                          textStyle: BaseStyles.closeStyle1)),
                  horizontalGap(context: context, screenSize: 0.04),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(8)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {},
                    child: getText(
                        text: '     Knee Support     ',
                        textStyle: BaseStyles.closeStyle1),
                  ),
                ],
              ),
            ),
            horizontalGap(context: context, screenSize: 0.04),
          ],
        ),
        verticalGap(context: context, screenSize: 0.03),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.001,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.04,
          ),
          child: getText(
            text: "Upper Body",
            textStyle: todaytext,
          ),
        ),
        verticalGap(context: context, screenSize: 0.03),
        SizedBox(
          height: 309,
          width: 343,
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
                                    image: AssetImage("assets/Exercise-4.png"),
                                    fit: BoxFit.cover))),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                  top: MediaQuery.of(context).size.height *
                                      0.020,
                                  right:
                                      MediaQuery.of(context).size.width * 0.50),
                              child: getText(
                                  text: 'Sit ups', textStyle: aboutYouText1),
                            ),
                            Row(children: [
                              horizontalGap(context: context, screenSize: 0.02),
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
                                verticalGap(context: context, screenSize: 0.002)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02),
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
                                  topLeft: Radius.circular(18.0),
                                  bottomLeft: Radius.circular(18.0),
                                ),
                                image: DecorationImage(
                                    image: AssetImage("assets/Exercise-5.png"),
                                    fit: BoxFit.cover))),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.020,
                                  left:
                                      MediaQuery.of(context).size.width * 0.001,
                                  right:
                                      MediaQuery.of(context).size.width * 0.42),
                              child: getText(
                                  text: 'Air Rowing', textStyle: aboutYouText1),
                            ),
                            Row(
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.02),
                                getText(
                                    text:
                                        'Details/discription of the expercise that is being \nshown here.',
                                    textStyle: subtitle2),
                              ],
                            ),
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
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
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
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.all(8)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: getText(
                                        text: '     Sholder     ',
                                        textStyle: BaseStyles.closeStyle1)),
                                verticalGap(context: context, screenSize: 0.04),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.02),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.02),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        bottomLeft: Radius.circular(18.0),
                      ),
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
                                    topLeft: Radius.circular(18.0),
                                    bottomLeft: Radius.circular(18.0),
                                  ),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/Exercise-6.png"),
                                      fit: BoxFit.cover))),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.020,
                                    left: MediaQuery.of(context).size.width *
                                        0.02,
                                    right: MediaQuery.of(context).size.width *
                                        0.50),
                                child: getText(
                                    text: 'Sit ups', textStyle: aboutYouText1),
                              ),
                              Row(
                                children: [
                                  horizontalGap(
                                      context: context, screenSize: 0.02),
                                  getText(
                                      text:
                                          'Details/discription of the expercise that is being \nshown here.',
                                      textStyle: subtitle2),
                                ],
                              ),
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
                                          ),
                                        ),
                                      ),
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
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: getText(
                                          text: '     Lower back     ',
                                          textStyle: BaseStyles.closeStyle1)),
                                  verticalGap(
                                      context: context, screenSize: 0.04),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.04),
              ],
            ),
          ),
        ),
        verticalGap(context: context, screenSize: 0.01)
      ],
    ),
  );
}
