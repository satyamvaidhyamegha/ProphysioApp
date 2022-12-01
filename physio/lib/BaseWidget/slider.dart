import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:reviews_slider/reviews_slider.dart';

import '../constants/colors.dart';
import '../constants/raddi.dart';

class FitnessDownText extends StatefulWidget {
  @override
  State<FitnessDownText> createState() => _FitnessDownTextState();
}

class _FitnessDownTextState extends State<FitnessDownText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Margins.PAGE_CONTENT_MARGINS,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getText(
            text: "Low",
            textStyle: TextStyle(color: AppColors.ORANGE),
          ),
          getText(
            text: "okay",
            textStyle: TextStyle(color: Colors.white),
          ),
          getText(
            text: "Fresh",
            textStyle: TextStyle(color: AppColors.GREEN),
          ),
        ],
      ),
    );
  }
}
