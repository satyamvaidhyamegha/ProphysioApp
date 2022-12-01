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
import 'routine_step_screen_female.dart';

class AirRowing extends StatefulWidget {
  const AirRowing({Key? key}) : super(key: key);

  @override
  State<AirRowing> createState() => _AirRowingState();
}

class _AirRowingState extends State<AirRowing> {
  List<Map<String, dynamic>> equipData = [
    {"lableName": "Chair"},
    {"lableName": "Yoga Mat"},
    {"lableName": "Shoes"},
    {"lableName": "Knee Support"},
  ];
   List<Map<String, dynamic>> bodyPartsList = [
    {"lableName": "Legs"},
    {"lableName": "Lawer Back"},
    {"lableName": "Shoulders"},
    {"lableName": "Back"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allDoctorBackGroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        backgroundColor: AppColors.allDoctorBackGroundColor,
        leading: getBackIconButton(context: context),
        title: getText(text: "Routine 1", textStyle: profilefieldtextStyle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.cancel_presentation,
                color: Colors.white,
              )),
          horizontalGap(context: context, screenSize: 0.03),
          horizontalGap(context: context, screenSize: 0.03),
          IconButton(
              onPressed: () {
                doNavigate(route: RoutineStepFemale(), context: context);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(text: "Air Rowing", textStyle: subheadertext1),
              verticalGap(context: context, screenSize: 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: getAssetImage(
                          imagePath: ImagePath.YOGA_IMAGE,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getImageAssets(imagePath: ImagePath.PLAY_ICON_IMAGE),
                    getText(
                      text: Strings.PLAY,
                      textStyle: profilefieldtextStyle,
                    ),
                  ],
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              getText(
                  text: "AirRowing Rowing | 2 Reps | 3",
                  textStyle: BaseStyles.addressScreenHeadingText.copyWith(
                      color: AppColors.routinHeadingColor,
                      fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.01),
                getText(
                  text: "Rounds | 50secs",
                  textStyle: BaseStyles.addressScreenHeadingText.copyWith(
                      color: AppColors.routinHeadingColor,
                      fontWeight: FontWeight.bold)),
              verticalGap(context: context, screenSize: 0.02),
              getText(
                  text:
                      "Details/discription of the expercise that is being\nshown here. Details/discription of the expercise that\nis being shown here.",
                  textStyle: subtitle.copyWith(
                      color: AppColors.routineSubheading,
                      fontWeight: FontWeight.normal)),
              verticalGap(context: context, screenSize: 0.03),
              getText(
                  text: "Body parts focused", textStyle: profilefieldtextStyle),
                  verticalGap(context: context, screenSize: 0.01),
              
              Wrap(
                  spacing: 10.0,
                  runSpacing: 0.0,
                  children: bodyPartsList.map((e) {
                    return Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      useDeleteButtonTooltip: true,
                      label: getText(
                        text: e['lableName'],
                        textStyle: BaseStyles.goldTextStyle
                            .copyWith(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.grey[60],
                      padding: const EdgeInsets.only(
                          top: 0, right: 15, left: 15, bottom: 0),
                    );
                  }).toList()),
              verticalGap(context: context, screenSize: 0.03),
              getText(
                  text: "Equipment needed", textStyle: profilefieldtextStyle),
              verticalGap(context: context, screenSize: 0.01),
              Wrap(
                  spacing: 10.0,
                  runSpacing: 0.0,
                  children: equipData.map((e) {
                    return Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      useDeleteButtonTooltip: true,
                      label: getText(
                        text: e['lableName'],
                        textStyle: BaseStyles.goldTextStyle
                            .copyWith(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.grey[60],
                      padding: const EdgeInsets.only(
                          top: 0, right: 15, left: 15, bottom: 0),
                    );
                  }).toList()),
              
              verticalGap(context: context, screenSize: 0.03),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                getText(
                  text: "Reps: 3", textStyle: profilefieldtextStyle),
                  horizontalGap(context: context, screenSize: 0.3),
                  getText(
                  text: "Reps: 3", textStyle: profilefieldtextStyle),
             ],),
              verticalGap(context: context, screenSize: 0.02),

               getText(
                  text: "Instructions (opt):", textStyle: profilefieldtextStyle),
                  verticalGap(context: context, screenSize: 0.01),
               getText(
                  text: "Details/discription of the playlist that is being shown\nhere. Details/discription of the playlist that is being\nshown here.", textStyle: subtitle.copyWith(
                      color: AppColors.routineSubheading,
                      fontWeight: FontWeight.normal)),
                      verticalGap(context: context, screenSize: 0.05),
              
            ],
          ),
        ),
      ),
    );
  }
}
