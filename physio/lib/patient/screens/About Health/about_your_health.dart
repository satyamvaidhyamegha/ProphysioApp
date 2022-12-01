// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
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
import 'fitness_level.dart';

class AboutYourHealth extends StatefulWidget {
  const AboutYourHealth({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutYourHealthPageState();
  }
}

class _AboutYourHealthPageState extends State<AboutYourHealth> {
  @override
  void initState() {
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
              doNavigate(route: const FitnessLevel(), context: context);
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    getAssetImage(imagePath: ImagePath.TELL_ABOUT_YOUR_HEALTH),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
                right: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        text: "Tell us a \nbit about \nyour health",
                        textStyle: headerStyle),
                    verticalGap(context: context, screenSize: 0.02),
                    getText(
                      text:
                          "By understanding your lifestyle well \npersonalised Proactive to help you \nachieve your goals effectively.",
                      textStyle: infoStyle,
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    CustomButton(
                        onTap: () {
                          doNavigate(route: FitnessLevel(), context: context);
                        },
                        text: Strings.LET_GO,
                        borderRadius: Raddi.buttonCornerRadius,
                        buttonColor: AppColors.buttonColor,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Fill The Rest Later",
                              style: headerStyle.copyWith(
                                  fontSize: 18,
                                  color: AppColors.buttonColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    verticalGap(context: context, screenSize: 0.02)
                  ]),
            )));
  }
}
