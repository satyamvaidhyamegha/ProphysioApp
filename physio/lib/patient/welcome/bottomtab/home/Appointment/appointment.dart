// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/welcome/myreport.dart';
import '../../../../../BaseWidget/custom_button.dart';
import '../../../../../BaseWidget/text.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/raddi.dart';
import '../../../../../constants/string.dart';
import '../../../../../constants/text_constants.dart';
import '../../../../../utility/gap_between.dart';
import '../../../model/message.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppointmentPageState();
  }
}

class _AppointmentPageState extends State<Appointment> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  var password = "";
  var email = "";
  bool itSelected = false;
  bool engSelected = false;
  double rating = 3.5;

  
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  List<Chat> doctorchatval = List.generate(
    doctorchat.length,
    (index) => Chat(
      image: doctorchat[index]["image"],
      name: doctorchat[index]["name"],
      desc: doctorchat[index]["desc"],
      time: doctorchat[index]["time"],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var editingController;
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.02),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  getBackIconButton(context: context),
                                  verticalGap(
                                      context: context, screenSize: 0.02),
                                  getText(
                                    text: Strings.APPIONTMENT,
                                    textStyle: profilefieldtextStyle,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.video,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                  verticalGap(
                                      context: context, screenSize: 0.02),
                                  Icon(
                                    FontAwesomeIcons.upload,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ],
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      getText(
                        text: 'Session with Dr. Roma \nDesouza',
                        textStyle: subheadertext2,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.09,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.calendarDays,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    getText(
                                      text: '25 April, 2021',
                                      textStyle: profilefieldtextStyle,
                                    )
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    getText(
                                      text: '9:00 am - 10:30 am',
                                      textStyle: profilefieldtextStyle,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.video,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        getText(
                                          text: Strings.ONLINE,
                                          textStyle: profilefieldtextStyle,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Reportdetail()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                Raddi.buttonCornerRadius,
                                            color: const Color(0Xff007CE2)),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: getText(
                                              text: Strings.BOOK_NOW,
                                              textAlign: TextAlign.center,
                                              textStyle: buttonTextStyle,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Divider(
                                  color: Colors.white,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                    ),
                                    child: const Text(Strings.SEASSION_SUMMERY,
                                        style: profilefieldtextStyle)),
                                const SizedBox(
                                  height: 10,
                                ),
                                getText(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                  textStyle: info1style1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                getText(
                                  text: Strings.GETTING_READY_SEASSION,
                                  textStyle: profilefieldtextStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                getText(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                  textStyle: info1style1,
                                )
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            Raddi.textFieldBorderRadius,
                                        color: Colors.grey[900]),
                                    child: Center(
                                        child: getText(
                                      text: Strings.CHANGE,
                                      textStyle: bluetext1,
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            Raddi.textFieldBorderRadius,
                                        color: Colors.grey[900]),
                                    child: Center(
                                        child: getText(
                                      text: Strings.CALL,
                                      textStyle: bluetext1,
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            Raddi.textFieldBorderRadius,
                                        color: Colors.grey[900]),
                                    child: Center(
                                        child: getText(
                                      text: Strings.MESSAGE,
                                      textStyle: bluetext1,
                                    )),
                                  )
                                ]),
                          )),
                      SizedBox(
                        height: 10,
                      )
                    ]))));
  }
}
