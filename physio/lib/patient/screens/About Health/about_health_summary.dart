import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About Health/glass_morphism.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../welcome/welcomeuser.dart';

class HealthSummary extends StatefulWidget {
  const HealthSummary({Key? key}) : super(key: key);

  @override
  State<HealthSummary> createState() => _HealthSummaryState();
}

class _HealthSummaryState extends State<HealthSummary> {
  double sliderValue = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                doNavigate(route: Welcomeuser(), context: context);
                //getFitnessContentData();
                //print(fitnessData[0].title.toString());
                // await Future.delayed(Duration(seconds: 2));
                // print(sliderValue);
              },
              child: Text(
                "Done",
                style: info1style.copyWith(
                    fontFamily: "Mulish",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ))
        ],
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Color(0xff222222),
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: getBackIconButton(context: context),
        ),
        title: getText(
            text: "Summary",
            textStyle: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // getText(
              //     text: "Energy",
              //     textStyle: summaryTitleText.copyWith(fontSize: 16)),
              // Image.asset("assets/Screenshot (43).png")
              getText(
                  text: "Fitness level",
                  textStyle: summaryTitleText.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.02),
              Container(
                padding: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff1C1C1E),
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        // color: AppColors.BACKGROUND_COLOR,
                        image: DecorationImage(
                            image: AssetImage(ImagePath.FITNESS_LEVEL_PHOTO))),
                    child: Glassmorphism(
                      blur: 2,
                      opacity: 0.1,
                      topLeftRadius: 20,
                      topRightRaadius: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Slider(
                                thumbColor: sliderValue <= 30
                                    ? Colors.orange
                                    : Colors.green,
                                label: sliderValue.toString(),
                                activeColor: sliderValue <= 50
                                    ? Colors.orange
                                    : Colors.green,
                                inactiveColor: Colors.greenAccent,
                                min: 0,
                                max: 100,
                                divisions: 10,
                                value: sliderValue,
                                onChanged: (value) {
                                  // setState(() {
                                  //   sliderValue = value;
                                  // });
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                getText(
                                  text: "Not at all fit",
                                  textStyle: TextStyle(color: Colors.orange),
                                ),
                                getText(
                                  text: "Really fit",
                                  textStyle: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              verticalGap(context: context, screenSize: 0.04),
              getText(
                  text: "Health Condition",
                  textStyle: summaryTitleText.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.01),

              Card(
                color: Color(0xff1C1C1E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:Margins.basePadding,
                    child: Wrap(spacing: 10.0, children: [
                      Chip(
                        useDeleteButtonTooltip: true,
                        deleteIcon: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Center(
                            child: const Icon(
                              Icons.close,
                              size: 15,
                            ),
                          ),
                        ),
                        labelPadding: const EdgeInsets.all(1.0),
                        label: getText(
                          text: "Low Blood Pressure",
                          textStyle: BaseStyles.goldTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        backgroundColor: AppColors.textColor,
                        shadowColor: Colors.grey[60],
                        padding: const EdgeInsets.only(
                            top: 5, right: 12, left: 12, bottom: 5),
                      ),
                      Chip(
                        useDeleteButtonTooltip: true,
                        deleteIcon: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Center(
                            child: const Icon(
                              Icons.close,
                              size: 15,
                            ),
                          ),
                        ),
                        labelPadding: const EdgeInsets.all(1.0),
                        label: getText(
                          text: "Sugar",
                          textStyle: BaseStyles.goldTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        backgroundColor: AppColors.textColor,
                        shadowColor: Colors.grey[60],
                        padding: const EdgeInsets.only(
                            top: 5, right: 12, left: 12, bottom: 5),
                      ),
                      Chip(
                        useDeleteButtonTooltip: true,
                        deleteIcon: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Center(
                            child: const Icon(
                              Icons.close,
                              size: 15,
                            ),
                          ),
                        ),
                        labelPadding: const EdgeInsets.all(1.0),
                        label: getText(
                          text: "High Blood Pressure",
                          textStyle: BaseStyles.goldTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        backgroundColor: AppColors.textColor,
                        shadowColor: Colors.grey[60],
                        padding: const EdgeInsets.only(
                            top: 5, right: 12, left: 12, bottom: 5),
                      ),
                    ])),
              ),
              verticalGap(context: context, screenSize: 0.04),
              getText(
                  text: "Complaint",
                  textStyle: summaryTitleText.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.01),
              Card(
                color: Color(0xff1C1C1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Image.asset(ImagePath.BODY_XRAY_PHOTO)),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 5,
                            left: 10,
                            right: 10,
                          ),
                          child: Wrap(spacing: 10.0, children: [
                            Chip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              useDeleteButtonTooltip: true,
                              deleteIcon: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Center(
                                  child:  Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ),
                              ),
                              labelPadding: const EdgeInsets.all(1.0),
                              label: getText(
                                text: "Right Soulder",
                                textStyle: BaseStyles.goldTextStyle
                                    .copyWith(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.grey[60],
                              padding: const EdgeInsets.only(
                                  top: 5, right: 12, left: 12, bottom: 5),
                            ),
                            Chip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              useDeleteButtonTooltip: true,
                              deleteIcon: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Center(
                                  child: const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ),
                              ),
                              labelPadding: const EdgeInsets.all(1.0),
                              label: getText(
                                text: "Left Knee",
                                textStyle: BaseStyles.goldTextStyle
                                    .copyWith(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.grey[60],
                              padding: const EdgeInsets.only(
                                  top: 5, right: 12, left: 12, bottom: 5),
                            ),
                            Chip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              useDeleteButtonTooltip: true,
                              deleteIcon: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Center(
                                  child: const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ),
                              ),
                              labelPadding: const EdgeInsets.all(1.0),
                              label: getText(
                                text: "Right Hip",
                                textStyle: BaseStyles.goldTextStyle
                                    .copyWith(color: Colors.black),
                              ),
                              backgroundColor: AppColors.textColor,
                              shadowColor: Colors.grey[60],
                              padding: const EdgeInsets.only(
                                  top: 5, right: 12, left: 12, bottom: 5),
                            ),
                          ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
