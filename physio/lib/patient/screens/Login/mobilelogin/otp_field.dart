// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../../services/Auth Service/Auth_service.dart';
import '../../onboarding/auth_screen3.dart';

class OtpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtpPagePageState();
  }
}

class _OtpPagePageState extends State<OtpPage> {
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  final TextEditingController otpcontroller = TextEditingController();
  final AuthAPI _authAPI = AuthAPI();
  String? confirmEmail;
  String invalidMsg = ErrorMsg.INVALID_OTP;
  String otpExpiremsg = "OTP has been expired";
  String otpAction = "";

  sharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('signUpEmail').toString();
    setState(() {
      if (email.isEmpty) {
        confirmEmail = "Email not entered";
      } else {
        confirmEmail = email;
      }
    });
  }

  @override
  void initState() {
    setState(() {});
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    sharedPref();
    otpcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    errorController!.close();
    otpcontroller.dispose();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/Group 74772.png"),
              colorFilter: ColorFilter.mode(
                  AppColors.greyColors.withOpacity(1), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.30,
                            ),
                            child: const Text(Strings.VERIFY_CODE,
                                textAlign: TextAlign.center,
                                style: headerStyle)),
                        Padding(
                            padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                        )),
                        const Text(
                          SuccessfullMsg.VERIFICATION_MESSAGE,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(confirmEmail.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image(
                                image: getAssetImage(
                                    imagePath: ImagePath.OTP_SCREEN_IMAGE),
                                color: AppColors.buttonColor,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          padding: const EdgeInsets.only(
                            bottom:
                                10, // This can be the space you need betweeb text and underline
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: AppColors.verifyOtpEnterOtpColor,
                              width:
                                  2.0, // This would be the width of the underline
                            )),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.060,
                        )),
                        const Text(
                          Strings.ENTER_OTP,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.verifyOtpEnterOtpColor,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        PinCodeTextField(
                          autoDismissKeyboard: true,
                          appContext: context,
                          textStyle:
                              const TextStyle(color: AppColors.textColor),
                          pastedTextStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                              selectedFillColor: Colors.black,
                              borderWidth: 2,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              inactiveFillColor: AppColors.greyColors,
                              errorBorderColor: AppColors.greyColors,
                              fieldHeight: 60,
                              fieldWidth: 40,
                              disabledColor: AppColors.greyColors,
                              activeColor: AppColors.whiteGrey,
                              inactiveColor: Colors.white,
                              selectedColor: AppColors.black,
                              activeFillColor: hasError
                                  ? const Color(0xff000000)
                                  : const Color(0xff000000)),
                          cursorColor: Colors.white,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: false,
                          errorAnimationController: errorController,
                          controller: otpcontroller,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            otpcontroller.text;
                            setState(() {
                              currentText = otpcontroller.text;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");

                            return true;
                          },
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                otpAction,
                                style: const TextStyle(
                                    color: ErrorColor.errorColorRed,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              OtpTimerButton(
                                  backgroundColor: Colors.transparent,
                                  onPressed: () async {
                                    var req = await _authAPI
                                        .sendotp(confirmEmail.toString());
                                    print(req.body);
                                  },
                                  text: Text(
                                    Strings.RESEND_OTP,
                                    style: TextStyle(
                                        color: AppColors
                                            .PAGE_INDICATOR_ACTIVE_DOT_COLOR,
                                        fontSize: 16,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  duration: 60),
                            ]),
                      ])))),
      bottomSheet: Container(
        color: AppColors.kBGcolor,
        padding: EdgeInsets.only(bottom: 5),
        height: MediaQuery.of(context).size.height * 0.09,
        child: GestureDetector(
            onTap: () async {
              setState(() {
                if (otpcontroller.text.length < 6) {
                  otpAction = ErrorMsg.INVALID_OTP;
                } else {
                  otpAction = "";
                }
              });
              print(otpcontroller.text);
              var otpVerify = await AuthAPI.varifyotp(
                  email: confirmEmail.toString(), otp: otpcontroller.text);
              var resReq = json.decode(otpVerify.body);
              print(resReq['message']);

              if (resReq['message'] == invalidMsg) {
                setState(() {
                  otpAction = ErrorMsg.INVALID_OTP;
                });
              } else if (resReq['message'] == otpExpiremsg) {
                setState(() {
                  otpAction = ErrorMsg.OTP_EXPIRE;
                });
              } else {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var email = prefs.getString('signUpEmail');
                var password = prefs.getString('password');
                print(email);
                print(password);
                var loginReq = await _authAPI.login(
                    email: email.toString(), password: password.toString());
                var resReq = json.decode(loginReq.body);
                prefs.setString('userToken', resReq['token']);
                prefs.setInt("userId", resReq['result']['id']);
                prefs.setString('userEmail', resReq['result']['email']);
                doNavigate(route: AuthPage3(), context: context);
              }
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    borderRadius: Raddi.buttonCornerRadius,
                    color: otpcontroller.text.length == 6
                        ? AppColors.buttonColor
                        : AppColors.inactiveButtonColor),
                child: Container(
                    alignment: Alignment.center,
                    child: const Text(Strings.VERIFY_OTP,
                        textAlign: TextAlign.center, style: buttonTextStyle)),
              ),
            )),
      ),
    );
  }
}
