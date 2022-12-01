// ignore_for_file: unnecessary_new, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Section%20Folder/section_model.dart';
import 'package:physio/patient/screens/profiledetail/foodsearch_detail.dart';
import 'package:physio/patient/services/Food%20and%20LifeStyle/food_and_lifestyle.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../BaseWidget/water_inc_dec.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'dailyexercise_detail.dart';

class WaterDrinkDetails extends StatefulWidget {
  const WaterDrinkDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WaterDrinkDetailsPageState();
  }
}

class _WaterDrinkDetailsPageState extends State<WaterDrinkDetails> {
  TextEditingController editingController = TextEditingController();
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  int glass1 = 0;
  int glass2 = 0;
  int bottol = 0;
  List<SectionModel> sectionData = [];
  List<ContentModel> contentData = [];
  List<int> answerList = [];
  List<int> idList = [];

  Future<void> getContentList() async {
    var req = await _foodAndLifeStyle.getContent(35);
    req.forEach((e) => idList.add(e.id!.toInt()));
    setState(() {
      contentData = req;
    });
  }

  Future<void> getSectionData() async {
    var sectionList = await _foodAndLifeStyle.getSection(35);

    setState(() {
      sectionData = sectionList;
    });
  }

  void minusGlass1() {
    setState(() {
      if (glass1 != 0) glass1--;
    });
  }

  void addGlass1() {
    setState(() {
      glass1++;
    });
  }

  void minusGlass2() {
    setState(() {
      if (glass2 != 0) glass2--;
    });
  }

  void addGlass2() {
    setState(() {
      glass2++;
    });
  }

  void minusBotto() {
    setState(() {
      if (bottol != 0) bottol--;
    });
  }

  void addBottol() {
    setState(() {
      bottol++;
    });
  }

  @override
  void initState() {
    super.initState();
    getSectionData();
    getContentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => FoodSearchDetails()));
              });
            },
            skipButtonPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DailyExcerciseDaily()));
            }),
        backgroundColor: AppColors.BACKGROUND_COLOR,
        body: Column(children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        // verticalGap(context: context, screenSize: 0.05),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.60,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor:
                                  AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.05),
                      sectionData.isNotEmpty
                          ? getText(
                              text: sectionData[0].title.toString(),
                              textStyle: BaseStyles.addressScreenHeadingText,
                            )
                          : Container(),
                      verticalGap(context: context, screenSize: 0.02),
                      getText(
                          text: "${(glass1 + glass2).toString()} Glasses",
                          textStyle: BaseStyles.glassTextStyle),
                      verticalGap(context: context, screenSize: 0.03),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WaterIncDec(
                              minus: minusGlass1,
                              add: addGlass1,
                              imagePath: ImagePath.GLASS1_PHOTO,
                              incDecText: glass1.toString(),
                              height: 50,
                              weight: 70,
                            ),
                            WaterIncDec(
                              minus: minusGlass2,
                              add: addGlass2,
                              imagePath: ImagePath.GLASS2_PHOTO,
                              incDecText: glass2.toString(),
                              height: 50,
                              weight: 70,
                            ),
                            WaterIncDec(
                              minus: minusBotto,
                              add: addBottol,
                              imagePath: ImagePath.WATER_BOTTOL_IMAGE,
                              incDecText: bottol.toString(),
                              height: 70,
                              weight: 80,
                            ),
                          ]),
                    ]),
              ),
            ),
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    print("$glass1 - $glass2 - $bottol");
                  },
                  child: getText(
                      text: "Not Sure",
                      textStyle: BaseStyles.laterButtonTextStyle))),
          verticalGap(context: context, screenSize: 0.02),
          CustomButton(
              onTap: () {
                var allIdList = idList.join(',');

                List answerList = [glass1, glass2, bottol];
                var answerListSeparate = answerList.join(',');

                FoodAndLifeStyle().createContentData(
                    section_id: 35,
                    answer: answerListSeparate,
                    content_id: allIdList);
                EasyLoading.dismiss();
                doNavigate(
                    route: const DailyExcerciseDaily(), context: context);
              },
              text: Strings.CONTINUE,
              borderRadius: Raddi.buttonCornerRadius,
              buttonColor: AppColors.buttonColor,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9),
          verticalGap(context: context, screenSize: 0.02),
        ]));
  }
}
