// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/welcome/Self%20Assessment/widget/base_on_routine_slider.dart';
import 'package:physio/patient/welcome/Self%20Assessment/widget/new_release_slider_widget.dart';
import 'package:physio/patient/welcome/Self%20Assessment/widget/self_assesment_suggested_slider.dart';
import 'package:physio/patient/welcome/all%20care%20idea/widget/all_care_ideas.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';



class SelfAssessmentScreen extends StatefulWidget {
  const SelfAssessmentScreen({Key? key}) : super(key: key);

  @override
  State<SelfAssessmentScreen> createState() => _SelfAssessmentScreenState();
}

class _SelfAssessmentScreenState extends State<SelfAssessmentScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.allDoctorBackGroundColor,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0.0,
          backgroundColor: AppColors.allDoctorBackGroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          actions: [
            IconButton(onPressed: (){
              doNavigate(route: AllCareIdeasScreen(), context: context);
            }, icon: Icon(Icons.arrow_forward_ios, color: Colors.white,))
          ],
        ),
        body: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(
                    text: "Self Assessment",
                    textStyle: profilefieldtextStyle.copyWith(
                        fontSize: 34, color: Color.fromRGBO(245, 245, 245, 1))),
                verticalGap(context: context, screenSize: 0.02),
                Container(
                  height: 40,
                  child: TextField(
                    onSubmitted: (val) {
                      // print(ownData.last);
                      // setState(() {
                      //   finalOwnData.add(ownData.last);
                      //   selectedData.add(ownData.last);
                      //   _searchControl.clear();
                      // });
                    },
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    style: inputfieldtextStyle,
                    onChanged: (value) {},
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: ImageIcon(
                        AssetImage(ImagePath.SEARCH_ICON),
                        color: AppColors.baseTextColor,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: AppColors.baseTextColor,
                      ),
                      fillColor: Color(0xff2C2C2E),
                      contentPadding: Margins.basePadding,
                      hintText: "Search",
                      hintStyle: inputfieldtextStyle,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.allDoctorBackGroundColor),
                        borderRadius: Raddi.textFieldBorderRadius,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.allDoctorBackGroundColor),
                        borderRadius: Raddi.textFieldBorderRadius,
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.04),
                AssesmentSuggestedSlider(),
                verticalGap(context: context, screenSize: 0.03),
                BaseInRoutineSlider(),
                verticalGap(context: context, screenSize: 0.03),
                NewReleaseSliderWidget(),
                verticalGap(context: context, screenSize: 0.08)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
