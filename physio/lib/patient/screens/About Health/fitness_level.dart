// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'package:physio/patient/screens/About Health/glass_morphism.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../model/Food and Style/Goals/Section Folder/section_model.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';
import 'feel_throughout.dart';

class FitnessLevel extends StatefulWidget {
  const FitnessLevel({Key? key}) : super(key: key);

  @override
  State<FitnessLevel> createState() => _FitnessLevelState();
}

class _FitnessLevelState extends State<FitnessLevel> {
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();
  double sliderValue = 10;
  List<ContentModel> contentData = [];
  List<SectionModel> sectionData = [];
  List<int> idList = [];
  List<int> answerList = [];

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(40);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(40);

    setState(() {
      sectionData = req;
    });
  }

  void previousSelectedId() {
    contentData.forEach((element) {
      if (element.status == true) {
        answerList.add(element.id!.toInt());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContentList();
    getSectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: Custom_Appbar(
          actionButtonText: Strings.SKIP,
          backPressed: () {
            Navigator.pop(context);
          },
          skipButtonPressed: () {
            doNavigate(route: FeelThrughoutPage(), context: context);
          }),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.BACKGROUND_COLOR),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  verticalGap(context: context, screenSize: 0.02),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.25,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.PROGRESS_YELLOW_LINE),
                      backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                    ),
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.05),
              Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: sectionData.isNotEmpty
                      ? getText(
                          text: sectionData[0].title.toString(),
                          textStyle: subheadertext2.copyWith(fontSize: 22))
                      : Container()),
              verticalGap(context: context, screenSize: 0.02),
              Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: sectionData.isNotEmpty
                      ? getText(
                          text: sectionData[0].tagline.toString(),
                          textStyle: info1style)
                      : Container()),
              verticalGap(context: context, screenSize: 0.02),
              Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: contentData.isNotEmpty
                      ? getText(
                          text: contentData[0].title.toString(),
                          textStyle: subheadertext2.copyWith(fontSize: 22))
                      : Container()),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.39),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
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
                                    ? AppColors.PROGRESS_YELLOW_LINE
                                    : AppColors.CHECKBOX_ACTIVE_COLOR,
                                label: sliderValue.toString(),
                                activeColor: sliderValue <= 50
                                    ? AppColors.PROGRESS_YELLOW_LINE
                                    : AppColors.CHECKBOX_ACTIVE_COLOR,
                                inactiveColor: Colors.greenAccent,
                                min: 0,
                                max: 100,
                                divisions: 10,
                                value: sliderValue,
                                onChanged: (value) {
                                  setState(() {
                                    sliderValue = value;
                                  });
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                getText(
                                  text: "Not at all fit",
                                  textStyle: TextStyle(color: AppColors.PROGRESS_YELLOW_LINE),
                                ),
                                getText(
                                  text: "Really fit",
                                  textStyle: TextStyle(color: AppColors.CHECKBOX_ACTIVE_COLOR),
                                )
                              ],
                            ),
                            verticalGap(context: context, screenSize: 0.02),
                            CustomButton(
                                onTap: () {
                                  var idLists = idList.join(',');
                                  // print(idLists);

                                  print(sliderValue.toInt());

                                  FoodAndLifeStyle().createContentData(
                                      section_id: 40,
                                      answer: sliderValue.toInt().toString(),
                                      content_id: idLists);

                                  doNavigate(
                                      route: FeelThrughoutPage(),
                                      context: context);
                                },
                                text: "Continue",
                                borderRadius: Raddi.buttonCornerRadius,
                                buttonColor: AppColors.buttonColor,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.8),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
