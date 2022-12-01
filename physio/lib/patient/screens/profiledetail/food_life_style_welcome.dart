// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'goalset_detail.dart';

class FoodAndLifeStyleWelcome extends StatefulWidget {
  const FoodAndLifeStyleWelcome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodAndLifeStyleWelcomeState();
  }
}

class _FoodAndLifeStyleWelcomeState extends State<FoodAndLifeStyleWelcome> {
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.kBGcolor,
          leading: getBackIconButton(context: context),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoalSetForFitness()));
                },
                child: getText(
                    text: Strings.SKIP, textStyle: BaseStyles.skipTextStyle))
          ],
        ),
        backgroundColor: AppColors.kBGcolor,
        body: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: getAssetImage(imagePath: ImagePath.FOOD_AND_LIFESTYLE),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                    text: "Food and \nLifestyle",
                    textStyle: headerStyle,
                  ),
                  verticalGap(context: context, screenSize: 0.03),
                  getText(
                      text:
                          "By understanding your lifestyle well \npersonalised Proactive to help you \nachieve your goals effectively.",
                      textStyle: infoStyle),
                  verticalGap(context: context, screenSize: 0.02),
                  CustomButton(
                      onTap: () {
                        doNavigate(
                            route: GoalSetForFitness(), context: context);
                      },
                      text: "Set My Preferences",
                      borderRadius: Raddi.buttonCornerRadius,
                      buttonColor: AppColors.buttonColor,
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9),
                  verticalGap(context: context, screenSize: 0.02),
                ])));
  }
}
