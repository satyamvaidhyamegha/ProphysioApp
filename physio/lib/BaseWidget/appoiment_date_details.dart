import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';

class AppoinmentsDetails extends StatelessWidget {
  final String dateText;
  final String dayText;
  final String doctorName;
  final String appintmentTime;
  final VoidCallback onPressed;

  const AppoinmentsDetails(
      {Key? key,
      required this.dateText,
      required this.dayText,
      required this.doctorName,
      required this.appintmentTime,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              dateText,
              style: const TextStyle(
                color: AppColors.buttonColor,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
            getText(
              text: dayText,
              textStyle: iconlablecolor,
            ),
          ],
        ),
        title: getText(
          text: "Session with $doctorName",
          textStyle: profilefieldtextStyle,
        ),
        subtitle: getText(
          text: "Online Appointment \n$appintmentTime",
          textStyle: iconlablecolor.copyWith(fontSize: 11),
        ),
        trailing: IconButton(
            constraints: BoxConstraints(),
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.blueLightColor,
            )));
  }
}
