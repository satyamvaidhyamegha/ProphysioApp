import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/screens/onboarding/certification_screen.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:physio/screens/onboarding/push_notifications.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import 'package:intl/intl.dart';
import '../../constants/text_constants.dart';
import 'auth_screen3.dart';

class HelpUsScreen extends StatefulWidget {
  const HelpUsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HelpUsScreenPageState();
  }
}

class _HelpUsScreenPageState extends State<HelpUsScreen> {
  var windowWidth;
  var windowHeight;

  DateTime date = DateTime.now();

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
                builder: (context) => const CertificationScreen()),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getAssetImage(imagePath: ImagePath.HELPUS_BG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 5, top: 30),
                    child: getText(
                        textAlign: TextAlign.left,
                        text: "Help us\nHelp you!",
                        textStyle: helpusText1),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 5, top: 15),
                    child: getText(
                        textAlign: TextAlign.left,
                        text:
                            "Personalised Proactive to help you\nachieve your goals effectively",
                        textStyle: helpusText2),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 60, right: 60, bottom: 15),
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
                                        const PushNotifications()));
                          },
                          child: Center(
                            child: getText(
                                textAlign: TextAlign.center,
                                text: Strings.BTN_HELPUS,
                                textStyle: buttonTextStyle),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //   color: AppColors.buttonNextCertificate,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 13, right: 13, bottom: 15),
      //     child: Container(
      //       alignment: Alignment.bottomCenter,
      //       width: MediaQuery.of(context).size.width * 0.9,
      //       height: MediaQuery.of(context).size.height * 0.07,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //           color: AppColors.buttonColor),
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.pushReplacement(context,
      //               MaterialPageRoute(builder: (context) => const AuthPage3()));
      //         },
      //         child: Center(
      //           child: getText(
      //               textAlign: TextAlign.center,
      //               text: Strings.BTN_CERTIFICATE,
      //               textStyle: buttonTextStyle),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
