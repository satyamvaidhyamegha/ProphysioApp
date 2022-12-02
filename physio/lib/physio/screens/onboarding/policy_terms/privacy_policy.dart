// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physio/physio/screens/onboarding/policy_terms/terms_condition.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

var windowWidth;
var windowHeight;

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08, left: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: new LinearPercentIndicator(
                  width: 358,
                  animation: true,
                  lineHeight: 6.0,
                  animationDuration: 2500,
                  percent: 0.4,
                  barRadius: const Radius.circular(16),
                  progressColor: AppColors.progressYellowLine,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.04,
                            right: MediaQuery.of(context).size.width * 0.50),
                        child: getText(
                            text: "Privacy \nPolicy",
                            textStyle: BaseStyles.headingTextStyle),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04),
                          child: getText(
                              text:
                                  "We collect data to understand you and cater to your needs in a Hyper Personalised Manner. This helps us to help you more effectively",
                              textStyle: BaseStyles.privacyTextStyle),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04),
                          child: getText(
                              text:
                                  "I want the awesome benefits of Hyper Personalisation!",
                              textStyle: BaseStyles.privacyTextStyle),
                        ),
                        Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.20),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 145.0, vertical: 18.0),
                                shape: const StadiumBorder(),
                              ),
                              child: buttonText(
                                  text: 'I Agree',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsCondition()));
                              }),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.04)),
                          Center(
                              child: TextButton(
                            style: TextButton.styleFrom(primary: Colors.blue
                                // foreground
                                ),
                            onPressed: () {
                              //   Navigator.pushReplacement(
                              //      context,
                              //       MaterialPageRoute(
                              //      builder: (context) => TermsCondition()));
                            },
                            child: getText(
                                text: 'Disagree',
                                textStyle: BaseStyles.orSignInWithbutton),
                          ))
                        ])
                      ]))
            ]),
      ),
    );
  }
}
