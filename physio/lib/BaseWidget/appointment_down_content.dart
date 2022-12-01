import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/BaseWidget/vertical_devider.dart';
import 'package:physio/constants/string.dart';

import '../constants/text_constants.dart';

class AppointMentDownWidget extends StatelessWidget {
  const AppointMentDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 18.0,
            right: 18,
          ),
          child: getText(
            text: Strings.CALL,
            textStyle: bluetext1,
          ),
        ),
        verticalDevider(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: getText(
            text: Strings.MESSAGE,
            textStyle: bluetext1,
          ),
        ),
        verticalDevider(),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.video,
              color: Color(0xff0A84FE),
              size: 15,
            ),
//verticalGap(context: context, screenSize: 0.02),
            getText(
              text: "    Join",
              textStyle: bluetext1,
            )
          ],
        ),
      ],
    );
  }
}
