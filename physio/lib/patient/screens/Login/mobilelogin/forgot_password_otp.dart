// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:physio/patient/screens/Login/mobilelogin/new_password_set.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../../services/Auth Service/Auth_service.dart';

class ForgotPasswordOtp extends StatefulWidget {
  String? enteredEmail;
  ForgotPasswordOtp({required this.enteredEmail});
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordOtpPageState();
  }
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtp> {
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  final TextEditingController otpcontroller = TextEditingController();
  final AuthAPI _authAPI = AuthAPI();
  String invalidMsg = "Invalid OTP";
  String otpExpiremsg = "OTP has been expired";
  String otpActionTake = "";

  @override
  void initState() {
    setState(() {});
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
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

  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Group 74772.png"),
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
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.30,
                            ),
                            child:  Text(Strings.VERIFY_CODE,
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
                        Padding(
                            padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.enteredEmail.toString(),
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
                            Image(
                              image: getAssetImage(
                                  imagePath: ImagePath.OTP_SCREEN_IMAGE),
                              color: AppColors.buttonColor,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          padding: const EdgeInsets.only(
                            bottom:
                                10, // This can be the space you need betweeb text and underline
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Color(0xff6E6E6E),
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
                            color: Color(0xFF8E8E8E),
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
                        Padding(
                            padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.0,
                        )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                otpActionTake,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              OtpTimerButton(
                                  backgroundColor: Colors.transparent,
                                  onPressed: () async {
                                    var req = await _authAPI.sendotp(
                                        widget.enteredEmail.toString());
                                  },
                                  text: Text(
                                    Strings.RESEND_OTP,
                                    style: TextStyle(
                                        color: Color(0xff007CE2),
                                        fontSize: 16,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  duration: 60),
                            ]),
                        verticalGap(context: context, screenSize: 0.22),
                      ]))))),
      bottomSheet: Container(
        color: AppColors.kBGcolor,
        height: MediaQuery.of(context).size.height * 0.09,
        padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
        child: GestureDetector(
            onTap: () async {
              setState(() {
                if (otpcontroller.text.length < 6) {
                  otpActionTake = "Invalid OTP";
                } else {
                  otpActionTake = "";
                }
              });
              print(otpcontroller.text);
              var otpVerify = await AuthAPI.varifyotp(
                  email: widget.enteredEmail.toString(),
                  otp: otpcontroller.text);
              var resReq = json.decode(otpVerify.body);

              if (resReq['message'] == invalidMsg) {
                setState(() {
                  otpActionTake = "Invalid OTP";
                });
              } else if (resReq['message'] == otpExpiremsg) {
                setState(() {
                  otpActionTake = "Otp Expired please resend";
                });
              } else {
                doNavigate(
                    route: NewPasswordPage(
                      forgotPasswordEmail: widget.enteredEmail.toString(),
                    ),
                    context: context);
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
                        : Colors.grey),
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
