// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';

class BaseStyles {
  static TextStyle textStyleForSilderScreen = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    height: 1.5,
    fontSize: 22,
  );
  static TextStyle textStyleForSilderScreenw500 = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    height: 1.5,
    fontSize: 22,
  );
  static TextStyle textStyleForProfileSelection = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    height: 1.5,
    fontSize: 42,
  );
  static TextStyle buttonTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: Color(0xFFCCCCCC));
  static TextStyle inputfieldtextStyle = TextStyle(
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Color(0xFFCCCCCC));
  static TextStyle popuptextStyle = TextStyle(
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      color: Color(0xFFCCCCCC));

  static TextStyle subText = TextStyle(
    color: Color(0xFFCCCCCC),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static TextStyle headingTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 42.0,
      color: Color(0xFFFFFFFF));

  static TextStyle privacyTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      height: 1.5,
      color: Color(0xFFFFFFFF));

  static TextStyle subHeadingTextStyle = TextStyle(
    color: AppColors.subTextColor,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static TextStyle orSignInWithText = TextStyle(
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      color: Color(0xFF767C83));

  static TextStyle orSignInWithbutton = TextStyle(
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );
  static TextStyle sessionreport = TextStyle(
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 18.0,
  );

  static TextStyle forgotPasswordTextStyle = TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600);
  static TextStyle laterButtonTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: AppColors.buttonColor);

  static TextStyle discountTextStyle = TextStyle(
    color: Color(0xFF182021),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );

  static TextStyle goldTextStyle = TextStyle(
    color: AppColors.goldColorText,
    fontFamily: "Mulish",
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  static TextStyle addressScreenHeadingText = TextStyle(
    color: AppColors.baseTextColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  static TextStyle skipTextStyle = TextStyle(
    color: AppColors.buttonColor,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle drinkWaterText = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 30.0,
      color: Color(0xFFFFFFFF));

  static TextStyle glassTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      color: Color(0xFF5FE3FF));

  static TextStyle textStyleForAuthScreen = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontSize: 40,
  );

  static TextStyle textStyleForSignupScreen = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontSize: 20,
  );

  static const TextStyle selfCareTextStyle = TextStyle(
    color: Color(0xFF000000),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static const TextStyle proPhysio = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  static const TextStyle beliveYou = TextStyle(
    color: Color(0xFFD6D6D6),
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );
  static const TextStyle smallSizeText = TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: AppColors.greyColors);

  static const TextStyle appointmentDateStyle = TextStyle(
    color: Color(0xFF007CE2),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w700,
    fontSize: 34,
  );
  static const TextStyle scheduleHeaddingStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w400,
    fontSize: 34,
  );
  static const TextStyle pendingRequestStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w400,
    fontSize: 22,
  );
  static const TextStyle dateStyle = TextStyle(
    color: Colors.blue,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );
  static const TextStyle monthStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle monthStyletext = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static const TextStyle nameStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    height: 0.01,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontFamily: "Mulish");

  static const TextStyle profileTitle = TextStyle(
      fontSize: 16,
      fontFamily: "Mulish",
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(235, 235, 245, 0.6));
  static const TextStyle profileSubtitle = TextStyle(
      fontSize: 16,
      fontFamily: "Mulish",
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(235, 235, 245, 1));

  static const TextStyle otpTextStyle = TextStyle(
      fontSize: 16,
      fontFamily: "Mulish",
      fontWeight: FontWeight.normal,
      color: Color.fromRGBO(196, 196, 196, 1));

  static const TextStyle otpTextStyleTwo = TextStyle(
      fontSize: 16,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(255, 255, 255, 1));

  static const TextStyle otpTextStyleFour = TextStyle(
      fontSize: 18,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(255, 255, 255, 1));

  static const TextStyle otpTextStyleThree = TextStyle(
      fontSize: 12,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(142, 142, 142, 1));

  static const TextStyle carddetailsStyle = TextStyle(
      fontSize: 12,
      fontFamily: "Mulish",
      height: 1,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const TextStyle sessionName = TextStyle(
      fontSize: 22,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static const TextStyle otpTextStyleFive = TextStyle(
      fontSize: 16,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(0, 124, 226, 1));

  static TextStyle numStyleForslideScreen = TextStyle(
    color: Color.fromRGBO(0, 124, 226, 1),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static TextStyle textStyleForslideScreen = TextStyle(
    color: Color.fromRGBO(196, 196, 196, 1),
    fontFamily: "Mulish",
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const TextStyle calendarnoapp = TextStyle(
      fontSize: 12,
      fontFamily: "Mulish",
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(142, 142, 142, 1));
  static const TextStyle monthStyles = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static const TextStyle dateStyles = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    height: 0.01,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static const TextStyle name = TextStyle(
    color: Colors.white,
    fontFamily: "Mulish",
    height: 0.01,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}
