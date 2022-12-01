import 'package:flutter/material.dart';
import '../BaseWidget/text.dart';
import '../constants/text_constants.dart';
import 'gap_between.dart';

class GreatJobCardContent extends StatelessWidget {
final String timeText;
final Widget widget;
final String timeType;

GreatJobCardContent({required this.timeText, required this.timeType, required this.widget});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
           widget,
            horizontalGap(context: context, screenSize: 0.01),
            getText(
                text: timeText,
                textStyle: profilefieldtextStyle.copyWith(fontSize: 24))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: getText(text: timeType, textStyle: subtitle1),
        )
      ],
    );
  }
}
