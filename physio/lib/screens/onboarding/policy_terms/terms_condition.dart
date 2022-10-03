import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

// ignore: prefer_typing_uninitialized_variables
var windowWidth;
// ignore: prefer_typing_uninitialized_variables
var windowHeight;

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width * 2;
    windowHeight = MediaQuery.of(context).size.height * 0.5;
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
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
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
              child: LinearPercentIndicator(
                width: 361,
                animation: true,
                lineHeight: 6.0,
                animationDuration: 2500,
                percent: 0.6,
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
                          right: MediaQuery.of(context).size.width * 0.33),
                      child: getText(
                          text: "Terms & \nConditions",
                          textStyle: BaseStyles.headingTextStyle),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04),
                child: getText(
                    text:
                        "Ipsum aute dolor eu labore. In tempor aliquip in anim nulla eu consectetur nostrud elit minim adipisicing sint id. Aliquip est reprehenderit eiusmod irure sit exercitation magna non commodo excepteur ex voluptate. Minim aliqua fugiat ipsum nulla esse id sint.Qui eu velit mollit dolor. Est aliquip cillum ad dolor duis aute labore. Voluptate est deserunt duis labore do reprehenderit in reprehenderit minim aliqua. Veniam reprehenderit proident qui voluptate elit non eiusmod velit. Eu occaecat amet incididunt adipisicing id ut. Magna aliquip incididunt do anim magna voluptate. In pariatur do sunt mollit est occaecat ad consectetur., textStyle: textStyle Ipsum aute dolor eu labore. In tempor aliquip in anim nulla eu consectetur nostrud elit minim adipisicing sint id. Aliquip est reprehenderit eiusmod irure sit exercitation magna non commodo excepteur ex voluptate. Minim aliqua fugiat ipsum nulla esse id sint.Qui eu velit mollit dolor. Est aliquip cillum ad dolor duis aute labore. Voluptate est deserunt duis labore do reprehenderit in reprehenderit minim aliqua. Veniam reprehenderit proident qui voluptate elit non eiusmod velit. Eu occaecat amet incididunt adipisicing id ut. Magna aliquip incididunt do anim magna voluptate. In pariatur do sunt mollit est occaecat ad consectetur., textStyle: textStyl",
                    textStyle: BaseStyles.privacyTextStyle)),
          ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding:
                  const EdgeInsets.symmetric(horizontal: 146.0, vertical: 22.0),
              shape: const StadiumBorder(),
            ),
            child: buttonText(
              text: 'I Agree',
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              //  Navigator.pushReplacement(context,
              //    MaterialPageRoute(builder: (context) => TermsCondition()));
            }),
      ),
    );
  }
}
