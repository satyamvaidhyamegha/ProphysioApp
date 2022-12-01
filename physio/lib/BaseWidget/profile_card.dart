import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';

class ProfileCard extends StatelessWidget {
  final String titleText;
  final String leadingIcon;
  VoidCallback? onTap;

  ProfileCard({required this.titleText, required this.leadingIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ImageIcon(
              AssetImage(leadingIcon),
              color: Colors.blue,
            ),
          ),
          title: getText(
              text: titleText,
              textStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.normal,
                  fontFamily: "Mulish")),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 15,
          )),
    );
  }
}
