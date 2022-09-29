import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';

import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/string.dart';
import '../../constants/text_constants.dart';
import 'auth_screen.dart';

class AuthPage3 extends StatefulWidget {
  const AuthPage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenPageState3();
  }
}

class _AuthScreenPageState3 extends State<AuthPage3> {
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
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.otpSuccessBackground,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 100, right: 110, left: 110, bottom: 100),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(blurRadius: 500, color: Color(0xff00BF2C))
                        ],
                        image: DecorationImage(
                            image: getAssetImage(
                                imagePath: ImagePath.AUTH_SUCCESS))),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Verified!",
                      textStyle: verifiedText),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "You are successfully registered!",
                      textStyle: registeredText),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 250),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.buttonColor),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AuthPage()));
                    },
                    child: Center(
                      child: getText(
                          textAlign: TextAlign.center,
                          text: "Continue",
                          textStyle: buttonTextStyle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
