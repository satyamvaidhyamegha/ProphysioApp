import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/string.dart';
import '../../constants/style.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../constants/text_constants.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  var windowWidth;
  var windowHeight;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: initScreen(context));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getAssetImage(imagePath: ImagePath.OTP_SCREEN),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(45)),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text("Verify Code",
                      style: BaseStyles.textStyleForAuthScreen),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: const Text(
                      "We have sent the code verification \n to your mobile number",
                      style: BaseStyles.otpTextStyle),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 15, top: 70),
                    child: const Text(
                      "+91 7098910064",
                      style: BaseStyles.otpTextStyleTwo,
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 70),
                      child: Image.asset("assets/editicon.png")),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 0, right: 300, left: 15, bottom: 10),
                  child: const Divider(
                    color: Colors.white,
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, bottom: 10, top: 40),
                child:
                    const Text("Enter the OTP", style: BaseStyles.otpTextStyle),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: OtpTextField(
                  numberOfFields: 6,
                  enabledBorderColor: const Color(0xFF3C3C3C),
                  filled: true,
                  fillColor: AppColors.buttonVerifyBG,
                  showFieldAsBox: true,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Resend in 00:30s",
                      style: BaseStyles.otpTextStyleThree,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Resend OTP",
                      style: BaseStyles.otpTextStyleFive,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.buttonVerifyBG,
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, bottom: 15),
          child: Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.buttonColor),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthPage3()));
              },
              child: Center(
                child: getText(
                    textAlign: TextAlign.center,
                    text: Strings.VERIFY_OTP_TEXT,
                    textStyle: buttonTextStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
