// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/About%20Health/upload_reports.dart';
import 'package:physio/patient/screens/About Health/glass_morphism.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
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

class PainImageMark extends StatefulWidget {
  const PainImageMark({Key? key}) : super(key: key);

  @override
  State<PainImageMark> createState() => _PainImageMarkState();
}

class _PainImageMarkState extends State<PainImageMark> {
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();
  double sliderValue = 10;
  List<ContentModel> contentData = [];
  List<SectionModel> sectionData = [];
  List<int> idList = [];
  List<int> answerList = [];
  List selectedPain = [];
  List<Map<String, dynamic>> painDataList = [
    {"painName": "Upper Back", "isClicked": false},
    {"painName": "Lower Back", "isClicked": false},
    {"painName": "Chest", "isClicked": false},
    {"painName": "Neck", "isClicked": false},
    {"painName": "Right Elbow", "isClicked": false},
    {"painName": "Left Elbow", "isClicked": false},
    {"painName": "Left Hip", "isClicked": false},
    {"painName": "Right Hip", "isClicked": false},
    {"painName": "Right Knee", "isClicked": false},
    {"painName": "Left Knee", "isClicked": false},
    {"painName": "Left Shoulder", "isClicked": false},
    {"painName": "Right Shoulder", "isClicked": false},
  ];

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(43);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(43);

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
            doNavigate(route: ReportsUpload(), context: context);
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
              //verticalGap(context: context, screenSize: 0.01),
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
              verticalGap(context: context, screenSize: 0.03),
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
                          textStyle: info1style.copyWith(fontSize: 16))
                      : Container()),
              Expanded(
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.45),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: AppColors.BACKGROUND_COLOR,
                        image: DecorationImage(
                            image: AssetImage(ImagePath.BODY_XRAY_PHOTO),
                            fit: BoxFit.fitHeight)),
                    child: Glassmorphism(
                      blur: 2.5,
                      opacity: 0.1,
                      topRightRaadius: 20,
                      topLeftRadius: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  //mainAxisAlignment:
                                  //MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: painDataList.map((e) {
                                return Padding(
                                  padding: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        e['isClicked'] = !e['isClicked'];
                                      });
                                    },
                                    child: Chip(
                                      useDeleteButtonTooltip: true,
                                      deleteIcon: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: const Icon(
                                          Icons.close,
                                          size: 15,
                                        ),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          e['isClicked'] = !e['isClicked'];
                                        });
                                      },
                                      labelPadding: const EdgeInsets.all(2.0),
                                      label: getText(
                                        text: e['painName'].toString(),
                                        textStyle: BaseStyles.goldTextStyle
                                            .copyWith(
                                                color: Colors.black,
                                                fontSize: 12),
                                      ),
                                      backgroundColor: Colors.white,
                                      shadowColor: Colors.grey[60],
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 25,
                                          left: 25,
                                          bottom: 10),
                                    ),
                                  ),
                                );
                              }).toList()),
                            ),
                            verticalGap(context: context, screenSize: 0.03),
                            CustomButton(
                                onTap: () {
                                  // var idLists = idList.join(',');
                                  // // print(idLists);

                                  // print(sliderValue.toInt());

                                  // FoodAndLifeStyle().createContentData(
                                  //     section_id: 40,
                                  //     answer: sliderValue.toInt().toString(),
                                  //     content_id: idLists);

                                  doNavigate(
                                      route: ReportsUpload(), context: context);
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
          painDataList[0]['isClicked'] == true
              ? getRedSpot(left: 170, bottom: 200, top: 50)
              : Container(),
          painDataList[1]['isClicked'] == true
              ? getRedSpot(left: 170, bottom: 120, top: 240)
              : Container(),
          painDataList[2]['isClicked'] == true
              ? getRedSpot(left: 210, bottom: 140, top: 60)
              : Container(),
          painDataList[3]['isClicked'] == true
              ? getRedSpot(left: 230, bottom: 60, top: 500)
              : Container(),
          painDataList[3]['isClicked'] == true
              ? getRedSpot(left: 150, bottom: 60, top: 500)
              : Container()
        ],
      ),
    );
  }
}

getRedSpot(
    {required double left, required double bottom, required double top}) {
  return Positioned(
    left: left,
    top: top,
    bottom: bottom,
    child: CircleAvatar(
      radius: 10,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: ErrorColor.errorColorRed,
      ),
    ),
  );
}
