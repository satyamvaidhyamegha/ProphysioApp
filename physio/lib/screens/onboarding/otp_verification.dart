import 'package:flutter/material.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../constants/string.dart';
import '../../constants/style.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: getAssetImage(imagePath: ImagePath.OTP_SCREEN),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(40)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text("Verify Code",
                          style: BaseStyles.textStyleForAuthScreen),
                      padding:
                          EdgeInsets.only(left: 20, right: 110, bottom: 10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                          "We have sent the code verification \n to your mobile number",
                          style: BaseStyles.otpTextStyle),
                      padding:
                          EdgeInsets.only(left: 20, right: 110, bottom: 10),
                    ),
                  ),
                  Container(
                    child: Text(
                      "+91 7098910064",
                      style: BaseStyles.otpTextStyleTwo,
                    ),
                    padding: EdgeInsets.only(
                        left: 1, right: 210, bottom: 15, top: 30),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: 0, right: 300, left: 30, bottom: 10),
                      child: Divider(
                        color: Colors.white,
                      )),
                  Container(
                    child:
                        Text("Enter the OTP", style: BaseStyles.otpTextStyle),
                    padding: EdgeInsets.only(left: 1, right: 210, bottom: 10),
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    enabledBorderColor: Color(0xFF3C3C3C),
                    fillColor: Color(0xff1C1C1E),
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
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Resend in 00:30s",
                          style: BaseStyles.otpTextStyleThree,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Resend OTP",
                          style: BaseStyles.otpTextStyleThree,
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
