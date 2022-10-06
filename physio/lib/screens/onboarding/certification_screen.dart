import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:flutter/foundation.dart';

import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/text_constants.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CertificationScreenPageState();
  }
}

class _CertificationScreenPageState extends State<CertificationScreen> {
  var windowWidth;
  var windowHeight;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ProfessionalProfile()),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.signupBackground,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: LinearPercentIndicator(
                percent: 0.6,
                animation: true,
                animationDuration: 1000,
                lineHeight: 10,
                progressColor: Colors.amber,
                barRadius: const Radius.circular(16),
                backgroundColor: const Color(0xff707070),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 10, top: 30),
              child: getText(
                  textAlign: TextAlign.center,
                  text: "Certification",
                  textStyle: signupText2),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Certificate Name",
                    labelStyle: headertext,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    fillColor: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Issuing Organization",
                    labelStyle: headertext,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    fillColor: Colors.black),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Expanded(
                flex: 8,
                child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, right: 20, bottom: 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Issue Date",
                                style: const TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 15, bottom: 10),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "24/10/2022",
                                style: certificationHeader2,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/calendar.png"),
                          ),
                          onTap: () {
                            debugPrint("calendar click event");
                          },
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 6,
                child: Container(),
              ),
            ]),
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      right: 20, left: 25, bottom: 5, top: 20),
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Media",
                      textStyle: professionProfileHeading1),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(
                        top: 20, right: 20, bottom: 5, left: 0),
                    child: const Divider(
                      thickness: 1,
                      color: Colors.white24,
                    )),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Add or link document",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.asset("assets/groupplus.svg"),
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.buttonColor),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CertificationScreen()));
                },
                child: Center(
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Next",
                      textStyle: buttonTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
