// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/Success%20Screen/email_send_success.dart';

import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterSuccessPagePageState();
  }
}

class _RegisterSuccessPagePageState extends State<RegisterSuccessPage> {
  final TextEditingController emailcontroller = TextEditingController();
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/Group 74772.png"),
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF0A0A0A).withOpacity(0.30),
                      BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
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
                        top: MediaQuery.of(context).size.width * 0.40,
                      ),
                      child: Image.asset(ImagePath.SUCCESSFULL_TICK),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    )),
                    const Text(SuccessfullMsg.REGISTER_SUCCESS,
                        textAlign: TextAlign.start, style: headerStyle),
                    Padding(
                        padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    )),
                    const Text(
                      "Lorem ipsum dolor sit amet, \nconsectetuer adipiscing elit, sed diam \nnonummy nibh euismod tincidunt ut \nlaoreet dolore magna",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.subTextColor,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ])))),
      bottomSheet: Container(
        color: AppColors.kBGcolor,
        padding: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.09,
        child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EmailSendSuccess()));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: Raddi.buttonCornerRadius,
                    color: AppColors.buttonColor),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(Strings.CONTINUE,
                      textAlign: TextAlign.center, style: buttonTextStyle),
                ),
              ),
            )),
      ),
    );
  }
}
