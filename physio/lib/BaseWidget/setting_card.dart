import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/colors.dart';

class SettingCard extends StatelessWidget {
  final String titleText;
  final Widget child;

  final String iconPath;
  SettingCard(
      {required this.titleText, required this.child, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.PROFILE_CARD_COLOR,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
            leading: ImageIcon(
              AssetImage(iconPath),
              color: Colors.blue,
              size: 25,
            ),
            title: getText(
                text: titleText,
                textStyle: TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.baseTextColor)),
            trailing: Container(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.3,
                child: child)),
      ),
    );
  }
}
