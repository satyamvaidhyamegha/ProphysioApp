import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';

class PersonalInforText extends StatelessWidget {
  String titleText;
  String subtitleText;
  double height;
  double width;
  Widget? widget;

  PersonalInforText(
      {required this.titleText,
      required this.subtitleText,
      required this.height,
      required this.width,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Margins.PAGE_CONTENT_MARGINS,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: widget != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      titleText,
                      style: summaryTitleText,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      subtitleText,
                      style: summarySubtitile,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ],
                ),
                widget!
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  titleText,
                  style: summaryTitleText,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  subtitleText,
                  style: summarySubtitile,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  maxLines: 3,
                ),
              ],
            ),
    );
  }
}
