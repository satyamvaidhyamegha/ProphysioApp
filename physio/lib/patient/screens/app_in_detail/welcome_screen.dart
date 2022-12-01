// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/profiledetail/editprofile_detail.dart';
import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WelcomePagePageState();
  }
}

class _WelcomePagePageState extends State<WelcomePage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              backFromPreviousScreen(context: context);
            },
            skipButtonPressed: () {
              doNavigate(route: const EditprofilePage(), context: context);
            }),
        backgroundColor: AppColors.kBGcolor,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: getAssetImage(imagePath: ImagePath.GEETING_KNOW_YOU),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        text: "Getting to \nknow you", textStyle: headerStyle),
                    verticalGap(context: context, screenSize: 0.03),
                    getText(
                      text:
                          "By understanding your lifestyle well \npersonalised Proactive to help you \nachieve your goals effectively.",
                      textStyle: infoStyle,
                    ),
                    verticalGap(context: context, screenSize: 0.06),
                    CustomButton(
                        onTap: () {
                          doNavigate(
                              route: EditprofilePage(), context: context);
                        },
                        text: Strings.LET_START,
                        borderRadius: Raddi.buttonCornerRadius,
                        buttonColor: AppColors.buttonColor,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width),
                    SizedBox(height: 10),
                  ]),
            )));
  }
}
