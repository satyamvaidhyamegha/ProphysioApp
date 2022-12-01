import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/screens/app_in_detail/welcome_screen.dart';

import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class HelpUsToHelpYouScreen extends StatefulWidget {
  const HelpUsToHelpYouScreen({Key? key}) : super(key: key);

  @override
  State<HelpUsToHelpYouScreen> createState() => _HelpUsToHelpYouScreenState();
}

class _HelpUsToHelpYouScreenState extends State<HelpUsToHelpYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: Custom_Appbar(
          backPressed: () {},
          actionButtonText: "Skip",
          skipButtonPressed: () {
            doNavigate(route: WelcomePage(), context: context);
          }),
      body: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: getText(
                        text: "Help us to\nHelp you!",
                        textStyle:
                            BaseStyles.profileSubtitle.copyWith(fontSize: 42)),
                  ),
                  verticalGap(context: context, screenSize: 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: getText(
                        text:
                            "Personalise proactive to help you\nachieve your goals effectively",
                        textStyle: BaseStyles.profileTitle),
                  ),
                ],
              ),
            ),
            verticalGap(context: context, screenSize: 0.06),
            CustomButton(
                onTap: () {
                  doNavigate(route: WelcomePage(), context: context);
                },
                text: "Let's Do It",
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width),
            verticalGap(context: context, screenSize: 0.01)
          ],
        ),
      ),
    );
  }
}
