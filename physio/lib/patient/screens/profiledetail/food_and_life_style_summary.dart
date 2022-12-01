import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About%20Health/about_your_health.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/food_lifestyle_card.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class FoodLifeStyleSummary extends StatefulWidget {
  const FoodLifeStyleSummary({Key? key}) : super(key: key);

  @override
  State<FoodLifeStyleSummary> createState() => _FoodLifeStyleSummaryState();
}

class _FoodLifeStyleSummaryState extends State<FoodLifeStyleSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: AppColors.BACKGROUND_COLOR,
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: getBackIconButton(context: context),
        ),
        title: getText(
            text: "Summary",
            textStyle: TextStyle(fontSize: 16, color: Colors.white)),
      ),
      body: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalGap(context: context, screenSize: 0.02),
                    FoodLifeStyleCard(
                        firstText: "Right nutrition can transform\nyour health",
                        secondText:
                            "Lorem ipsum dolor sit amet,\nconsecteturer adipiscing eit, sed\ntincidunt ut loareet dolore\nmgna",
                        imagePath: ImagePath.FIRST_PHOTO_SUMMARY,
                        colors: Color(0xff2D6A40)),
                    verticalGap(context: context, screenSize: 0.02),
                    FoodLifeStyleCard(
                        firstText: "1 later of water",
                        secondText:
                            "Lorem ipsum dolor sit amet,\nconsecteturer adipiscing eit, sed\ntincidunt ut loareet dolore\nmgna",
                        imagePath: ImagePath.SECOND_PHOTO_SUMMARY,
                        colors: Color(0xff2D496A)),
                    verticalGap(context: context, screenSize: 0.02),
                    FoodLifeStyleCard(
                        firstText: "Understand your routine",
                        secondText:
                            "Lorem ipsum dolor sit amet,\nconsecteturer adipiscing eit, sed\ntincidunt ut loareet dolore\nmgna",
                        imagePath: ImagePath.THIRD_PHOTO_SUMMARY,
                        colors: Color(0xff766F48)),
                    verticalGap(context: context, screenSize: 0.03),
                  ],
                ),
              ),
            ),
            verticalGap(context: context, screenSize: 0.01),
            CustomButton(
                onTap: () {
                  doNavigate(route: AboutYourHealth(), context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Fill The Rest Later",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                )),
            verticalGap(context: context, screenSize: 0.01),
          ],
        ),
      ),
    );
  }
}
