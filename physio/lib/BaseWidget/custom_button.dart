import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/navigation.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  final Color buttonColor;
  final BorderRadius borderRadius;
  final double height;
  final double width;

  const CustomButton(
      {required this.onTap,
      required this.text,
      required this.borderRadius,
      required this.buttonColor,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(borderRadius: borderRadius, color: buttonColor),
        child: Container(
            alignment: Alignment.center,
            child: getText(
              text: text,
              textAlign: TextAlign.center,
              textStyle: buttonTextStyle,
            )),
      ),
    );
  }
}

getBackIconButton({required BuildContext context}) {
  return
      // ignore: prefer_const_constructors
      InkWell(
    onTap: () {
      backFromPreviousScreen(context: context);
    },
    child: Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
    ),
  );
}

getTwoButtonSplit(
    {required BuildContext context,
    required String buttonText,
    required VoidCallback onPress}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.buttonColor, width: 1.5),
          borderRadius: Raddi.buttonCornerRadius),
      child: Center(
        child: getText(
            text: buttonText,
            textStyle:
                profilefieldtextStyle.copyWith(color: AppColors.buttonColor)),
      ),
    ),
  );
}
