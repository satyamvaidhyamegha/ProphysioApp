// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/screens/Routine/routine_1_screen.dart';

import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/search_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class MyExcerciseScreen extends StatefulWidget {
  const MyExcerciseScreen({Key? key}) : super(key: key);

  @override
  State<MyExcerciseScreen> createState() => _MyExcerciseScreenState();
}

class _MyExcerciseScreenState extends State<MyExcerciseScreen> {
  List<Map<String, dynamic>> cardData = [
    {
      "title": "Sit ups",
      "subtitle":
          "Details/discription of the expercise that is\nbeing shown here.",
      "imagePath": ImagePath.YOGA_IMAGE,
    },
    {
      "title": "Air Rowing",
      "subtitle":
          "Details/discription of the expercise that is\nbeing shown here.",
      "imagePath": ImagePath.ROUTINE_UP_NEXT_IMAGE
    },
    {
      "title": "Sit ups",
      "subtitle":
          "Details/discription of the expercise that is\nbeing shown here.",
      "imagePath": ImagePath.YOGA_IMAGE
    },
  ];
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allDoctorBackGroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        backgroundColor: AppColors.allDoctorBackGroundColor,
        leading: getBackIconButton(context: context),
        actions: [ IconButton(onPressed: (){
              doNavigate(route: Routine1Screen(), context: context);
            }, icon: Icon(Icons.arrow_forward_ios, color: Colors.white,))],
      ),
      body: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(text: "My Excercise", textStyle: subheadertext1),
              verticalGap(context: context, screenSize: 0.01),
              SearchWidget(
                  suffixIcon: Icon(
                    Icons.mic,
                    color: AppColors.profileDividerClr,
                  ),
                  prefixIcon: ImageIcon(
                    getAssetImage(imagePath: ImagePath.SEARCH_ICON),
                    color: AppColors.profileDividerClr,
                  ),
                  controller: searchController,
                  hintText: "Search",
                  inputAction: TextInputAction.search),
              verticalGap(context: context, screenSize: 0.03),
              getText(
                  text: "Lower Back",
                  textStyle: profilefieldtextStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Column(
                children: cardData.map((e) {
                  return  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
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
                            )
                          ],
                        ),
                      )
                    ],
                ),
              ),
                  );
                }).toList(),
              ),
              verticalGap(context: context, screenSize: 0.03),
              getText(
                  text: "Upper Body",
                  textStyle: profilefieldtextStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Column(
                children: cardData.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
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
                            )
                          ],
                        ),
                      )
                    ],
                ),
              ),
                  );
                }).toList(),
              ),
              verticalGap(context: context, screenSize: 0.1)
            ],
          ),
        ),
      ),
    );
  }
}
