// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/app_in_detail/welcome_screen.dart';
import 'package:physio/patient/screens/profiledetail/helpus_to_helpyou.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class ProActive extends StatefulWidget {
  const ProActive({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProActivePageState();
  }
}

class _ProActivePageState extends State<ProActive> {
  List<String> list = [
    "Fully Personalised",
    "Real Time Tracking",
    "Deep Health Insights",
    "360 Degree Approach"
  ];

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(171),
          child: Container(
            color: AppColors.PROACTIVE_APPBAR_COLOR,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.textColor, width: 2),
                        borderRadius: Raddi.textFieldBorderRadius,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(Strings.PRO_ACTIVE,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 54,
                                color: AppColors.textColor)))
                  ]),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Container(
                          height: 35,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: AppColors.textColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Center(
                              child: getText(
                            text: 'Save 50%',
                            textStyle: BaseStyles.discountTextStyle,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                  text: Strings.GET_UNLIMITED_ACCESS,
                                  textStyle: infoStyle,
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Row(
                                  children: [
                                    getText(
                                      text: Strings.PRO_ACTIVE_UPPER,
                                      textStyle: TextStyle(
                                        color: AppColors.textColor,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    horizontalGap(
                                        context: context, screenSize: 0.015),
                                    getText(
                                      text: Strings.GOLD,
                                      textStyle: BaseStyles.goldTextStyle,
                                    )
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(height: 10);
                                        },
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        itemCount: list.length,
                                        itemBuilder:
                                            (BuildContext ctxt, int index) {
                                          return new Text(
                                            "???  " + list[index],
                                            style: const TextStyle(
                                              color: AppColors.PROACTIVE_APPBAR_COLOR,
                                              fontFamily: "Mulish",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          );
                                        })),
                                const Divider(color: Colors.grey),
                                horizontalGap(
                                    context: context, screenSize: 0.05),
                                verticalGap(context: context, screenSize: 0.02),
                                const Text('4999/-',
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28.0,
                                        color: AppColors.textColor)),
                                verticalGap(context: context, screenSize: 0.03),
                                const Text(
                                    'Billed yearly (only 416/month) After \n7 days free trial, cancel anytime.',
                                    style: infoStyle),
                              ])),
                      verticalGap(context: context, screenSize: 0.03),
                    ])),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () {
                  doNavigate(route: HelpUsToHelpYouScreen(), context: context);
                  //doNavigate(route: WelcomePage(), context: context);
                },
                text: Strings.SUBSCRIBE_NOW,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.02),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()));
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  getText(
                    text: Strings.LATER,
                    textStyle: BaseStyles.laterButtonTextStyle,
                  )
                ])),
            verticalGap(context: context, screenSize: 0.02),
          ],
        ));
  }
}
