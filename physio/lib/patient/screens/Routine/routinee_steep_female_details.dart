import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/screens/Routine/my_excercise.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/step_progress.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class RoutineFemaleDetails extends StatefulWidget {
  const RoutineFemaleDetails({Key? key}) : super(key: key);

  @override
  State<RoutineFemaleDetails> createState() => _RoutineFemaleDetailsState();
}

class _RoutineFemaleDetailsState extends State<RoutineFemaleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allDoctorBackGroundColor,
        appBar: AppBar(
        
          elevation: 0.0,
          backgroundColor: AppColors.allDoctorBackGroundColor,
          leading: getBackIconButton(context: context),
          title: getText(text: "Routine - 1", textStyle: profilefieldtextStyle),
          actions: [
            IconButton(
                onPressed: () {
                  doNavigate(route: MyExcerciseScreen(), context: context);
                },
                icon: Icon(
                  Icons.cancel_presentation,
                  color: Colors.white,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: getAssetImage(
                      imagePath: ImagePath.YOGA_IMAGE,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Container(
                child: Center(
                  child: CustomButton(
                      onTap: () {},
                      text: "Restart",
                      borderRadius: Raddi.buttonCornerRadius,
                      buttonColor: AppColors.buttonColor,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4),
                ),
              ),
              verticalGap(context: context, screenSize: 0.03),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        text: "Status",
                        textStyle: BaseStyles.addressScreenHeadingText.copyWith(
                            color: AppColors.routinHeadingColor,
                            fontWeight: FontWeight.bold)),
                    verticalGap(context: context, screenSize: 0.02),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: Raddi.k12px,
                          color: AppColors.routineCardColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StepProgressIndicate(),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: 2,
                            color: AppColors.loginPageBorderColorIcons,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  getText(
                                      text: "35",
                                      textStyle: profilefieldtextStyle.copyWith(
                                          color: AppColors.ROUTINE_STEP_COLOR,
                                          fontSize: 48)),
                                  getText(
                                      text: "min",
                                      textStyle: profilefieldtextStyle.copyWith(
                                          color: AppColors.ROUTINE_STEP_COLOR,
                                          fontSize: 21)),
                                ],
                              ),
                              getText(
                                  text: "   Remaining in\nmorning session",
                                  textStyle: profilefieldtextStyle)
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                      getText(
                  text: "Up Next",
                  textStyle: BaseStyles.addressScreenHeadingText.copyWith(
                      color: AppColors.routinHeadingColor,
                      fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.02),
               Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: Raddi.k12px,
                    color: AppColors.routineCardColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width*0.26,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImagePath.ROUTINE_UP_NEXT_IMAGE), fit: BoxFit.fill)
                      ),
                       ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          verticalGap(context: context, screenSize: 0.008),
                          getText(
                              text: "Sit ups", textStyle: profilefieldtextStyle),
                          verticalGap(context: context, screenSize: 0.01),
                          getText(
                              text:
                                  "Details/discription of the expercise that is\nbeing shown here.",
                              textStyle: subtitle.copyWith(
                                  color: AppColors.routineSubheading,
                                  fontWeight: FontWeight.normal)),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only( right: 10),
                                child: Chip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  useDeleteButtonTooltip: true,
                                  label: getText(
                                    text: "Legs",
                                    textStyle: BaseStyles.goldTextStyle
                                        .copyWith(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.grey[60],
                                  padding: const EdgeInsets.only(
                                      top: 0, right: 15, left: 15, bottom: 0),
                                ),
                              ),
                              Chip(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                useDeleteButtonTooltip: true,
                                label: getText(
                                  text: "Lower back",
                                  textStyle: BaseStyles.goldTextStyle
                                      .copyWith(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                                shadowColor: Colors.grey[60],
                                padding: const EdgeInsets.only(
                                    top: 0, right: 15, left: 15, bottom: 0),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             verticalGap(context: context, screenSize: 0.06)
                  ],
                ),
                
              ),
            ],
          ),
        ));
  }
}
