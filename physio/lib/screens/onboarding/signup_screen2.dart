import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:physio/screens/onboarding/signup_screen1.dart';

import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/text_constants.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenPageState2();
  }
}

class _SignupScreenPageState2 extends State<SignupScreen2> {
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
            MaterialPageRoute(builder: (context) => const SignupScreen1()),
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
                percent: 0.3,
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
                  text: "Create Password",
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
                    labelText: "Enter Password",
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
                    labelText: "Re-Enter Password",
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
                          builder: (context) => const ProfessionalProfile()));
                },
                child: Center(
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Create Profile",
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
