import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/colors.dart';
import '../constants/raddi.dart';
import '../constants/style.dart';
import '../constants/text_constants.dart';
import '../utility/gap_between.dart';
import 'custom_button.dart';

class BottomSheetWithData extends StatefulWidget {
  const BottomSheetWithData({Key? key}) : super(key: key);

  @override
  State<BottomSheetWithData> createState() => _BottomSheetWithDataState();
}

class _BottomSheetWithDataState extends State<BottomSheetWithData> {
  List<Map<String, dynamic>> resonData = [
    {"title": "It pains", "isChecked": false},
    {"title": "Its confusing", "isChecked": false},
    {"title": "I don’t like it", "isChecked": false},
    {"title": "I already did it.", "isChecked": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 50, left: 40),
            child: getText(
                text: "Reason for skipping this\nexercise?",
                textStyle: BaseStyles.profileSubtitle.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
          ),
          verticalGap(context: context, screenSize: 0.03),
          Padding(
            padding: Margins.PAGE_CONTENT_MARGINS.copyWith(left: 30),
            child: Column(
              children: resonData.map((e) {
                return Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                          side: BorderSide(color: Colors.white, width: .8),
                          checkColor: Colors.white,
                          activeColor: AppColors.CHECKBOX_ACTIVE_COLOR,
                          splashRadius: 20,
                          shape: CircleBorder(),
                          value: e['isChecked'],
                          onChanged: (value) {
                            setState(() {
                              print("check");
                              e['isChecked'] = !e['isChecked'];
                            });
                          }),
                    ),
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(
                        text: e['title'],
                        textStyle: profilefieldtextStyle.copyWith(
                            color: AppColors.subTextColor)),
                  ],
                );
              }).toList(),
            ),
          ),
          verticalGap(context: context, screenSize: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                child: getTwoButtonSplit(
                    context: context, buttonText: "Cancel", onPress: () {
                      Navigator.pop(context);
                    }),
              ),
              CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Confirm",
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4),
            ],
          ),
        ],
      ),
    );
  }
}
