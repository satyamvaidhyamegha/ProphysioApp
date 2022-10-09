import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/screens/onboarding/helpus_helpyou.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:physio/screens/onboarding/signup_screen3.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import 'package:intl/intl.dart';
import '../../constants/text_constants.dart';
import 'auth_screen3.dart';

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

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            MaterialPageRoute(builder: (context) => const SignupScreen3()),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.signupBackground,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
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
                        right: 20, left: 20, bottom: 5, top: 30),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: "Certification",
                        textStyle: signupText2),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(
                                  top: 15, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
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
                                          '${date.year}/${date.month}/${date.day}',
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
                                        child:
                                            Image.asset("assets/calendar.png"),
                                      ),
                                      onTap: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100));

                                        if (newDate != null) {}
                                        setState(() {
                                          date =
                                              newDate!; //set output date to TextField value.
                                        });
                                      })
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
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1),
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
                        child: InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(right: 30, top: 20),
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/plusBtn.png"),
                          ),
                          onTap: () {
                            debugPrint("Add media event");
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 25, bottom: 5, top: 20),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: "Uploaded file",
                        textStyle: professionProfileHeading1),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: AppColors.buttonNextCertificate,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13, right: 13, bottom: 15),
                          child: Container(
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
                                        builder: (context) =>
                                            const HelpUsScreen()));
                              },
                              child: Center(
                                child: getText(
                                    textAlign: TextAlign.center,
                                    text: Strings.BTN_CERTIFICATE,
                                    textStyle: buttonTextStyle),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AuthPage3()));
                          },
                          child: Center(
                            child: getText(
                                textAlign: TextAlign.center,
                                text: Strings.BTN_CERTIFICATE_TEXT,
                                textStyle: textButtonTextStyle),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
