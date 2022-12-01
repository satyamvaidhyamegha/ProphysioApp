import 'package:flutter/material.dart';
import 'package:physio/patient/screens/Routine/routine_step_male.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/model_bottom_sheet.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class RoutineStepFemale extends StatefulWidget {
  const RoutineStepFemale({Key? key}) : super(key: key);

  @override
  State<RoutineStepFemale> createState() => _RoutineStepFemaleState();
}

class _RoutineStepFemaleState extends State<RoutineStepFemale> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: getAssetImage(
                        imagePath: ImagePath.YOGA_IMAGE,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        //padding: Margins.PAGE_CONTENT_MARGINS,
                        color: Colors.transparent.withOpacity(0.3),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          leading: getBackIconButton(context: context),
                          title: getText(
                              text: "Routine - 1",
                              textStyle: profilefieldtextStyle),
                          trailing: IconButton(
                              onPressed: () {
                                doNavigate(
                                    route: RoutineStepMale(), context: context);
                              },
                              icon: Icon(
                                Icons.cancel_presentation,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Column(children: [
                          verticalGap(context: context, screenSize: 0.53),
                          CircularStepProgressIndicator(
                            circularDirection:
                                CircularDirection.counterclockwise,
                            child: Center(
                              child: getText(
                                  text: "15/30",
                                  textStyle: profilefieldtextStyle.copyWith(
                                      fontSize: 21,
                                      color: AppColors.routineStepColor2)),
                            ),
                            totalSteps: 100,
                            currentStep: 70,
                            stepSize: 5,
                            selectedColor: AppColors.routineStepColor2,
                            unselectedColor: Colors.black,
                            padding: 0,
                            width: 110,
                            height: 110,
                            selectedStepSize: 5,
                            roundedCap: (_, __) => true,
                          ),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Round Completed",
                              textStyle: subtitle.copyWith(
                                  color: AppColors.routineSubheading,
                                  fontSize: 12))
                        ]),
                      ),
                    ],
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width,
              color: AppColors.allDoctorBackGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getTwoButtonSplit(
                      context: context,
                      buttonText: "Skip",
                      onPress: () {
                        print("Check");
                        setState(() {
                          showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: Raddi.k12px
                          ),
                            isScrollControlled: true,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width*0.95,
                            
                          ),
                          backgroundColor: AppColors.kBGcolor,
                            context: context,
                            builder: (context) {
                              return BottomSheetWithData();
                            });
                        });
                      }),
                  getTwoButtonSplit(
                      context: context, buttonText: "Restart", onPress: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
