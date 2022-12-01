// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Section%20Folder/section_model.dart';
import 'package:physio/patient/screens/profiledetail/food_life_style_welcome.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';
import 'foodpreference_detail.dart';

class GoalSetForFitness extends StatefulWidget {
  const GoalSetForFitness({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GoalSetForFitnessPageState();
  }
}

class _GoalSetForFitnessPageState extends State<GoalSetForFitness> {
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  List<ContentModel> contentData = [];
  List<SectionModel> sectionData = [];
  List<int> idList = [];
  List<int> answerList = [];

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(31);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(31);

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
    setState(() {});
    super.initState();
    getContentList();
    getSectionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 80,
          backgroundColor: AppColors.BACKGROUND_COLOR,
          leading: IconButton(
              onPressed: () {
                doNavigate(route: FoodAndLifeStyleWelcome(), context: context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.textColor,
                size: 18,
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodPreferenceDetails()));
                },
                child: getText(
                    text: Strings.SKIP, textStyle: BaseStyles.skipTextStyle))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS,
                      child: Column(children: [
                        //verticalGap(context: context, screenSize: 0.03),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.60,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    sectionData.isNotEmpty
                        ? Padding(
                            padding: Margins.PAGE_CONTENT_MARGINS,
                            child: getText(
                              text: sectionData[0].title.toString(),
                              textStyle: BaseStyles.addressScreenHeadingText,
                            ),
                          )
                        : Container(),
                    verticalGap(context: context, screenSize: 0.02),
                    sectionData.isNotEmpty
                        ? Padding(
                            padding: Margins.PAGE_CONTENT_MARGINS,
                            child: getText(
                              text: sectionData[0].tagline.toString(),
                              textStyle: infoStyle,
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: contentData.isNotEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: contentData.map((element) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        element.status = !element.status!;
                                        if (element.status == true) {
                                          answerList.add(element.id!.toInt());
                                        } else {
                                          answerList
                                              .remove(element.id!.toInt());
                                        }
                                      });
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            color: element.status == false
                                                ? null
                                                : AppColors.PROGRESS_YELLOW_LINE,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Color(0xff707070),
                                                width: 1.5)),
                                        child: ListTile(
                                          leading: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              child: SvgPicture.network(
                                                element.featured_image
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            element.title.toString(),
                                            style: subheadertext.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ),
                                );
                              }).toList())
                          : Center(
                              child: Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ])),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Padding(
              padding: Margins.PAGE_CONTENT_MARGINS,
              child: CustomButton(
                  onTap: () {
                    previousSelectedId();
                    var allIdList = idList.join(',');
                    var duplicateAnswerKeyRemove = answerList.toSet().toList();
                    var answerIdList = duplicateAnswerKeyRemove.join(',');

                    FoodAndLifeStyle().createContentData(
                        section_id: 31,
                        answer: answerIdList,
                        content_id: allIdList);
                    EasyLoading.dismiss();

                    doNavigate(
                        route: FoodPreferenceDetails(), context: context);
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9),
            ),
            verticalGap(context: context, screenSize: 0.02)
          ],
        ));
  }
}
