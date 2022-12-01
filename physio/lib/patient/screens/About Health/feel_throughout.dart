// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About%20Health/serached_tag.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/separator.dart';
import '../../../BaseWidget/slider.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../model/Food and Style/Goals/Section Folder/section_model.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';

class FeelThrughoutPage extends StatefulWidget {
  const FeelThrughoutPage({Key? key}) : super(key: key);

  @override
  State<FeelThrughoutPage> createState() => _FeelThrughoutPageState();
}

class _FeelThrughoutPageState extends State<FeelThrughoutPage> {
  final FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();
  double morningSliderValue = 10;
  double afterNoonSliderValue = 10;
  double eveningSliderValue = 10;
  double nightSliderValue = 10;

  List<ContentModel> contentData = [];
  List<SectionModel> sectionData = [];
  List<int> prevousAns = [];
  List<int> idList = [];
  List<int> answerList = [];

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(41);
    req.forEach((e) => idList.add(e.id!.toInt()));
    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(41);
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
            doNavigate(route: SearchDisease([]), context: context);
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // verticalGap(context: context, screenSize: 0.02),
          Padding(
            padding: Margins.PAGE_CONTENT_MARGINS,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.40,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.PROGRESS_YELLOW_LINE),
                  backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                ),
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.03),
          Padding(
              padding: Margins.PAGE_CONTENT_MARGINS,
              child: sectionData.isNotEmpty
                  ? getText(
                      text: sectionData[0].title.toString(),
                      textStyle: subheadertext2.copyWith(fontSize: 22))
                  : Container()),
          verticalGap(context: context, screenSize: 0.03),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Margins.PAGE_CONTENT_MARGINS,
                    child: getText(
                        text: "Morning",
                        textStyle: subheadertext2.copyWith(fontSize: 22)),
                  ),
                  Slider(
                      thumbColor: morningSliderValue <= 30
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      label: morningSliderValue.toString(),
                      activeColor: morningSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      inactiveColor: AppColors.GREEN,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      value: morningSliderValue,
                      onChanged: (value) {
                        setState(() {
                          morningSliderValue = value;
                          print(morningSliderValue);
                        });
                      }),
                  FitnessDownText(),
                  MySeparator(),
                  Padding(
                    padding: Margins.PAGE_CONTENT_MARGINS,
                    child: getText(
                        text: "Afternoon",
                        textStyle: subheadertext2.copyWith(fontSize: 22)),
                  ),
                  Slider(
                      thumbColor: afterNoonSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      label: afterNoonSliderValue.toString(),
                      activeColor: afterNoonSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      inactiveColor: AppColors.GREEN,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      value: afterNoonSliderValue,
                      onChanged: (value) {
                        setState(() {
                          afterNoonSliderValue = value;
                          print(afterNoonSliderValue);
                        });
                      }),
                  FitnessDownText(),
                  MySeparator(),
                  Padding(
                    padding: Margins.PAGE_CONTENT_MARGINS,
                    child: getText(
                        text: "Evening",
                        textStyle: subheadertext2.copyWith(fontSize: 22)),
                  ),
                  Slider(
                      thumbColor: eveningSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      label: eveningSliderValue.toString(),
                      activeColor: eveningSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      inactiveColor: AppColors.GREEN,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      value: eveningSliderValue,
                      onChanged: (value) {
                        setState(() {
                          eveningSliderValue = value;
                          print(eveningSliderValue);
                        });
                      }),
                  FitnessDownText(),
                  MySeparator(),
                  Padding(
                    padding: Margins.PAGE_CONTENT_MARGINS,
                    child: getText(
                        text: "Night",
                        textStyle: subheadertext2.copyWith(fontSize: 22)),
                  ),
                  Slider(
                      thumbColor: nightSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      label: nightSliderValue.toString(),
                      activeColor: nightSliderValue <= 50
                          ? AppColors.ORANGE
                          : AppColors.GREEN,
                      inactiveColor: AppColors.GREEN,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      value: nightSliderValue,
                      onChanged: (value) {
                        setState(() {
                          nightSliderValue = value;
                          print(nightSliderValue);
                        });
                      }),
                  FitnessDownText(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: CustomButton(
                onTap: () {
                  var allIdList = idList.join(',');
                  var duplicateAnswerKeyRemove = answerList.toSet().toList();
                  // var answerIdList = duplicateAnswerKeyRemove.join(',');
                  var answer =
                      "${morningSliderValue.toInt()},${afterNoonSliderValue.toInt()},${eveningSliderValue.toInt()},${nightSliderValue.toInt()}";
                  FoodAndLifeStyle().createContentData(
                      section_id: 41, answer: answer, content_id: allIdList);
                  doNavigate(route: SearchDisease([]), context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width),
          ),
          verticalGap(context: context, screenSize: 0.025),
        ],
      ),
    );
  }
}
