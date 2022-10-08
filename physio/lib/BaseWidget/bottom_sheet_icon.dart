import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/style.dart';

class BottomSheetIcons extends StatelessWidget {
  final String lableText;
  final IconData iconData;
  final VoidCallback onTap;

  BottomSheetIcons(
      {required this.iconData, required this.lableText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey[300],
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                iconData,
                size: 30,
                color: Colors.green,
              ),
            ),
          ),
          getText(
              text: lableText,
              textStyle: BaseStyles.profileTitle.copyWith(
                color: Colors.grey[300],
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
