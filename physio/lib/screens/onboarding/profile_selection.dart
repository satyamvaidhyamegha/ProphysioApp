import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:physio/screens/onboarding/camera.dart';
import 'about_screen.dart';
import 'package:physio/screens/onboarding/policy_terms/privacy_policy.dart';

class ProfileSelectionPage extends StatefulWidget {
  const ProfileSelectionPage({Key? key}) : super(key: key);

  @override
  State<ProfileSelectionPage> createState() => _ProfileSelectionPageState();
}

bool isButtonPressed = false;
bool isButtonPressed1 = false;
bool isTxtbtnPressed = false;

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  // ignore: prefer_typing_uninitialized_variables
  var windowWidth;
  // ignore: prefer_typing_uninitialized_variables
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
        backgroundColor: AppColors.kBGcolor,
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: getText(
                        text: "Tell us who\nyou are joining \nas?",
                        textStyle: BaseStyles.textStyleForProfileSelection),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.26),
                    child: getText(
                        text: "So that we can personalise \nyour experience",
                        textStyle: BaseStyles.subText),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
          ),
          Container(),
          Stack(
            children: <Widget>[
              Image.asset(
                'assets/Group 74744.png',
                fit: BoxFit.cover,
                height: 410,
                width: 390,
              ),
              Positioned(
                  top: 165,
                  child: BlurryContainer(
                    blur: 90,
                    child: Container(
                      width: 375,
                      height: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.26,
                    left: MediaQuery.of(context).size.width * 0.02,
                    right: MediaQuery.of(context).size.width * 0.02),
                child: Center(
                    child: Column(children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isButtonPressed ? Colors.blue : Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 145.0, vertical: 18.0),
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'Physio',
                      style: isButtonPressed
                          ? const TextStyle(color: Colors.white, fontSize: 18)
                          : const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        isButtonPressed = !isButtonPressed;

                        if (isButtonPressed = true) {
                          isButtonPressed1 = false;
                          isTxtbtnPressed = false;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutPage()),
                        );
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isButtonPressed1 ? Colors.blue : Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 145.0, vertical: 18.0),
                      shape: const StadiumBorder(),
                    ),
                    child: buttonText(
                      text: 'Patient',
                      textStyle: isButtonPressed1
                          ? const TextStyle(color: Colors.white, fontSize: 18)
                          : const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    onPressed: () async {
                      setState(() {
                        isButtonPressed1 = !isButtonPressed1;

                        if (isButtonPressed1 = true) {
                          isButtonPressed = false;
                          isTxtbtnPressed = false;
                        }
                      });
                    },
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Container(
                          height: 2.0,
                          width: 80.0,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.06,
                        ),
                        child: getText(
                            text: "Already a member?",
                            textStyle: BaseStyles.orSignInWithText),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.06,
                        ),
                        child: Container(
                          height: 2.0,
                          width: 80.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      primary: isTxtbtnPressed
                          ? Colors.blue
                          : Colors.white, // foreground
                    ),
                    onPressed: () {
                      isTxtbtnPressed = !isTxtbtnPressed;
                      setState(() {
                        if (isTxtbtnPressed = true) {
                          isButtonPressed1 = false;
                          isButtonPressed = false;
                        }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CameraPage()));
                      });
                    },
                    child: getText(
                        text: 'Login',
                        textStyle: BaseStyles.orSignInWithbutton),
                  ))
                ])),
              )
            ],
          ),
        ])));
  }
}
