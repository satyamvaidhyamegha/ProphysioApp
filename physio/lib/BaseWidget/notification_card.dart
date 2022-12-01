import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeText;

  NotificationCard(
      {required this.title, required this.subtitle, required this.timeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color:AppColors.PROFILE_CARD_COLOR,),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getText(
                  text: title,
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFFFFFF))),
              getText(
                  text: subtitle,
                  textStyle: TextStyle(
                      color: AppColors.PROFILE_SUBTITLE_COLOR,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.normal,
                      fontSize: 12)),
              getText(
                  text: timeText,
                  textStyle: TextStyle(
                      color: AppColors.PROFILE_SUBTITLE_COLOR,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.normal,
                      fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
