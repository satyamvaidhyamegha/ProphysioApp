// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Section%20Folder/section_model.dart';
import 'package:physio/patient/screens/Privacy%20Screen/terms_condition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import '../../model/Food and Style/Goals/Content Folder/content_model.dart';
import '../../services/Food and LifeStyle/food_and_lifestyle.dart';
import '../../services/setting service/setting_api.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrivacyPolicyPageState();
  }
}

class _PrivacyPolicyPageState extends State<PrivacyPolicy> {
  final FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  List<ContentModel> contentData = [];

  List<int> idList = [];
  List<int> answerList = [];
  List<SectionModel> sectionData = [];
  bool isChecked = false;

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(38);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(38);

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
    getContentList();

    getSectionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.kBGcolor,
          leading: getBackIconButton(context: context),
        ),
        backgroundColor: AppColors.kBGcolor,
        body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Column(children: [
                        verticalGap(context: context, screenSize: 0.05),
                        SizedBox(
                          width: 300,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.70,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.05),
                      sectionData.isNotEmpty
                          ? getText(
                              text: sectionData[0].title.toString(),
                              textAlign: TextAlign.start,
                              textStyle: headerStyle)
                          : Container(),
                      verticalGap(context: context, screenSize: 0.03),
                      sectionData.isNotEmpty
                          ? getText(
                              text: sectionData[0].tagline.toString(),
                              textAlign: TextAlign.start,
                              textStyle: infoStyle)
                          : Container(),
                      verticalGap(context: context, screenSize: 0.03),
                      const Text(Strings.THIS_HELP_US, style: infoStyle),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            itemCount: contentData.length,
                            itemBuilder: (context, index) {
                              return contentData.isNotEmpty
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      alignment: Alignment.topLeft,
                                      child: ListView(
                                        children: [
                                          verticalGap(
                                              context: context,
                                              screenSize: 0.03),
                                          getText(
                                            text: contentData[index]
                                                .title
                                                .toString(),
                                            textStyle: infoStyle,
                                          ),
                                          verticalGap(
                                              context: context,
                                              screenSize: 0.03),
                                          Row(
                                            children: [
                                              getText(
                                                  text: contentData[index]
                                                      .subtitle
                                                      .toString(),
                                                  textStyle: info1style),
                                              SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: Checkbox(
                                                    activeColor: Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                    value: contentData[index]
                                                        .status,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        isChecked = !isChecked;
                                                        contentData[index]
                                                            .status = newValue;
                                                        if (contentData[index]
                                                                .status ==
                                                            true) {
                                                          answerList.add(
                                                              contentData[index]
                                                                  .id!
                                                                  .toInt());
                                                        } else {
                                                          answerList.remove(
                                                              contentData[index]
                                                                  .id!
                                                                  .toInt());
                                                        }
                                                      });
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container();
                            }),
                      ),
                    ])),
              ),
              CustomButton(
                  onTap: () async {
                    // if (isChecked = true) {
                    //   SharedPreferences prefs =
                    //       await SharedPreferences.getInstance();

                    //   previousSelectedId();
                    //   var allIdList = idList.join(',');
                    //   var duplicateAnswerKeyRemove =
                    //       answerList.toSet().toList();
                    //   var answerIdList = duplicateAnswerKeyRemove.join(',');

                    //   FoodAndLifeStyle().createContentData(
                    //       section_id: 38,
                    //       answer: answerIdList,
                    //       content_id: allIdList);

                    //   doNavigate(route: TermsConsition(), context: context);
                    // } else {
                    //   print("not selected");
                    // }

                    if (isChecked == false) {
                      return null;
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      previousSelectedId();
                      var allIdList = idList.join(',');
                      var duplicateAnswerKeyRemove =
                          answerList.toSet().toList();
                      var answerIdList = duplicateAnswerKeyRemove.join(',');

                      FoodAndLifeStyle().createContentData(
                          section_id: 38,
                          answer: answerIdList,
                          content_id: allIdList);

                      SettingApi().createDefaultSetting(
                          user_id: prefs.getInt("userId")!.toInt());

                      doNavigate(route: TermsConsition(), context: context);
                    }
                  },
                  text: Strings.NEXT,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor:
                      isChecked == true ? AppColors.buttonColor : AppColors.inactiveButtonColor,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width),
              verticalGap(context: context, screenSize: 0.02),
            ],
          ),
        ));
  }
}
