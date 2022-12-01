// ignore_for_file: unnecessary_new
//pending

import 'package:flutter/material.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'food_life_style_welcome.dart';

class EditprofilePage5 extends StatefulWidget {
  const EditprofilePage5({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditprofilePage5State();
  }
}

class _EditprofilePage5State extends State<EditprofilePage5> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        appBar: AppBar(
          backgroundColor: AppColors.kBGcolor,
          leading: getBackIconButton(context: context),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodAndLifeStyleWelcome()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFF007CE2),
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      verticalGap(context: context, screenSize: 0.02),
                      const Text(
                        "BMI",
                        style: profilefieldtextStyle,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      const Text(
                        "Your Ideal BMI should be 2.0. This can be \nachieve with a fitness nutrition",
                        style: infoStyle,
                      ),
                      verticalGap(context: context, screenSize: 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: "Height",
                              textStyle: profilefieldtextStyle,
                            ),
                            Wrap(
                              children: [
                                ChoiceChip(
                                  label: Container(
                                    width: 80,
                                    height: 20,
                                    child: Center(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: getText(
                                            text: 'Meters',
                                            textStyle: profilefieldtextStyle,
                                          )),
                                    ),
                                  ),
                                  selected: false,
                                  backgroundColor: const Color(0XFF182021),
                                  onSelected: (bool selected) {
                                    setState(() {});
                                  },
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                ChoiceChip(
                                  label: Container(
                                    width: 60,
                                    height: 20,
                                    child: Center(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: getText(
                                            text: 'Feet',
                                            textStyle: profilefieldtextStyle,
                                          )),
                                    ),
                                  ),
                                  selected: true,
                                  onSelected: (bool selected) {
                                    setState(() {});
                                  },
                                  selectedColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ],
                            )
                          ]),
                    ])),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () {
                  doNavigate(route: FoodAndLifeStyleWelcome(), context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.02),
          ],
        ));
  }
}
