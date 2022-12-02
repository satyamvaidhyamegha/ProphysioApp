import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/onboarding/auth_screen3.dart';
import '../../../constants/colors.dart';
import '../onboarding/signup_screen2.dart';

class ReportScreen8 extends StatefulWidget {
  const ReportScreen8({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReportScreen8PageState();
  }
}

class _ReportScreen8PageState extends State<ReportScreen8> {
  var windowWidth;
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

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.signupBackground,
          title: const Text("Apt Details"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AuthPage3()),
            ),
          ),
        ),
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColors.signupBackground,
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage("assets/DoctorImage.png"),
                                fit: BoxFit.fill,
                              ))),

                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: getText(
                            text: "Prashant. K [M]",
                            textStyle: headingTextStyle),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 10),
                      //   child: getText(
                      //       text: "[M]",
                      //       textStyle: headingTextStyle
                      //   ),
                      // ),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.phone,
                                    size: 16, color: Colors.blue),
                              ),
                              TextSpan(
                                text: "+91 9949876923",
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              child: getText(
                                  text: "Complaint:", textStyle: headertext),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: getText(
                                  text: "Severe lower back pain ",
                                  textStyle: headertext),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 0.5,
                        color: Colors.blueGrey,
                      ),

                      Container(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: getText(
                                  text: "2", textStyle: headingTextStyle),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.video_call,
                                    size: 25, color: Colors.blue)),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 5, top: 10, bottom: 10),
                              child:
                                  getText(text: "Jun", textStyle: headertext),
                            ),
                            Container(
                              child: getText(text: "|", textStyle: headertext),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 10, top: 10, bottom: 10),
                              child:
                                  getText(text: "Tue", textStyle: headertext),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              padding: const EdgeInsets.only(
                                  right: 5, top: 10, bottom: 10),
                              child: getText(
                                  text: "10:00am", textStyle: headertext),
                            ),
                            Container(
                              child: getText(text: "-", textStyle: headertext),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 10, top: 10, bottom: 10),
                              child: getText(
                                  text: "11:00am", textStyle: headertext),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 220, bottom: 10),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.buttonColor),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AuthPage3()));
                    },
                    child: Center(
                      child: getText(
                          textAlign: TextAlign.center,
                          text: "Confirm",
                          textStyle: buttonTextStyle),
                    ),
                  ),
                )
              ],
            )))));
  }
}
