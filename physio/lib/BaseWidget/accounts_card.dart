import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';

class AccountsCard extends StatelessWidget {
  final String titleText;
  final Widget child;
  IconData? iconData;
  AccountsCard({required this.titleText, required this.child, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.PROFILE_CARD_COLOR,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            iconData,
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
          trailing: Icon(
            Icons.expand_more,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
