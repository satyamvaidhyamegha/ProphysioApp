// ignore_for_file: unnecessary_new


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/welcome/welcomeuser.dart';

import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../constants/text_constants.dart';
import 'myreport.dart';

class Eventdetail extends StatefulWidget {
  const Eventdetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EventdetailPageState();
  }
}

class _EventdetailPageState extends State<Eventdetail> {
  bool _value = false;

  List<String> list = [
    "Fully Personalised",
    "Real Time Tracking",
    "Deep Health Insights",
    "360 Degree Approach"
  ];
 
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: SingleChildScrollView(

            // physics: NeverScrollableScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              PreferredSize(
                preferredSize: Size.fromHeight(300),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/Womens Health.png'),
                    fit: BoxFit.cover,
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const Welcomeuser()));
                                    });
                                  }),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffFFFFFF), width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 12,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.09,
                              ),
                              child: const Text(Strings.EVENT, style: headertext)),
                          // ignore: prefer_const_constructors

                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 30,
                            height: 2,
                            // Thickness
                            color: Color(0xffFFFFFF),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: const Text('Exercises \nIn pregnancy',
                                  style: inputtexttextStyle))
                        ]),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.width * 0.09,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.calendarDays,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text('25 April, 2021',
                                style: profilefieldtextStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text('9:00 am - 10:30 am',
                                style: profilefieldtextStyle),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  FontAwesomeIcons.video,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(Strings.ONLINE, style: profilefieldtextStyle),
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
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color(0Xff007CE2)),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(Strings.JOIN,
                                      textAlign: TextAlign.center,
                                      style: buttonTextStyle),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: const Text('${Strings.EVENT} ${Strings.DETAILS}',
                                style: profilefieldtextStyle)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: profilefieldtextStyle),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: profilefieldtextStyle)
                      ])),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]),
                            child: const Center(
                              child: Text(
                                Strings.CHANGE,
                                style: bluetext1,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]),
                            child: const Center(
                              child: Text(
                                Strings.CALL,
                                style: bluetext1,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]),
                            child: const Center(
                              child: Text(
                                Strings.MESSAGE,
                                style: bluetext1,
                              ),
                            ),
                          )
                        ]),
                  )),
              SizedBox(
                height: 10,
              )
            ])));
  }
}
