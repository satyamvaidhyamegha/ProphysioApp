// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';

class BaseStyles {
  static TextStyle textStyleForSilderScreen = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    fontSize: 22,
  );
  static TextStyle textStyleForSilderScreenw500 = TextStyle(
    color: AppColors.textColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 22,
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

  static TextStyle signInText = TextStyle(
    color: AppColors.buttonColor,
    fontFamily: "Mulish",
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static TextStyle headingTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      fontSize: 42.0,
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
      fontSize: 18.0,
      color: Color(0xFF767C83));

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
    fontWeight: FontWeight.w200,
    fontSize: 15,
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
}
