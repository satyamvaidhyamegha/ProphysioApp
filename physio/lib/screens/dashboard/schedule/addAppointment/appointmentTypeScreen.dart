import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/screens/onboarding/certification_screen.dart';
import 'package:flutter/foundation.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';

class appointmentTypeScreen extends StatefulWidget {
  const appointmentTypeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _appointmentTypeScreenPageState();
  }
}

class _appointmentTypeScreenPageState extends State<appointmentTypeScreen> {
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
        backgroundColor: AppColors.appointmentAppBarBackground,
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
        decoration: BoxDecoration(color: AppColors.appointmentBackgroundColor),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 50, top: 60),
              child: getText(
                  textAlign: TextAlign.left,
                  text: "Select Type\nof appointment",
                  textStyle: appointmentScreen1),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.appointmentBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: AppColors.onlineButtonColor),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const HelpUsScreen()));
                    },
                    child: Center(
                      child: getText(
                          textAlign: TextAlign.center,
                          text: Strings.BTN_ONLINE,
                          textStyle: buttonTextStyle),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.appointmentBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: AppColors.offlineButtonColor),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const HelpUsScreen()));
                    },
                    child: Center(
                      child: getText(
                          textAlign: TextAlign.center,
                          text: Strings.BTN_OFFLINE,
                          textStyle: buttonTextStyle),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
