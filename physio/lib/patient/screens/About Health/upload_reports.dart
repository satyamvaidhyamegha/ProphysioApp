// ignore_for_file: prefer_const_constructors


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';
import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
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
import '../Success Screen/awasome_screen.dart';
import '../profiledetail/helpus_to_helpyou.dart';
import 'about_health_summary.dart';

class ReportsUpload extends StatefulWidget {
  const ReportsUpload({Key? key}) : super(key: key);

  @override
  State<ReportsUpload> createState() => _ReportsUploadState();
}

class _ReportsUploadState extends State<ReportsUpload> {
  FoodAndLifeStyle _foodAndLifeStyle = FoodAndLifeStyle();

  List<ContentModel> contentData = [];
  List<SectionModel> sectionData = [];
  List<int> idList = [];
  List<int> answerList = [];
  File? image;
  final _picker = ImagePicker();
  List<File>? file;

  Future getFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
       

    if (result != null) {
    setState(() {
        file = result.paths.map((path) => File(path!)).toList();
    });
    } else {
      // User canceled the picker
    }
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      setState(() {});
    }
  }

  void getContentList() async {
    var req = await _foodAndLifeStyle.getContent(44);

    req.forEach((e) => idList.add(e.id!.toInt()));

    setState(() {
      contentData = req;
    });
  }

  void getSectionList() async {
    var req = await _foodAndLifeStyle.getSection(44);

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
            doNavigate(route: HelpUsToHelpYouScreen(), context: context);
          },
          skipButtonPressed: () {
            doNavigate(route: HealthSummary(), context: context);
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
              //  verticalGap(context: context, screenSize: 0.01),
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
                          textStyle: subheadertext2)
                      : Container()),
              verticalGap(context: context, screenSize: 0.02),
              Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: sectionData.isNotEmpty
                      ? getText(
                          text: sectionData[0].tagline.toString(),
                          textStyle: info1style.copyWith(fontSize: 15))
                      : Container()),
              verticalGap(context: context, screenSize: 0.02),
              GestureDetector(
                onTap: () {
                  getFile();
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: AppColors.loginDeviderColor, width: 0.8),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Upload my reports        ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Mulish",
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          ImageIcon(
                            AssetImage(ImagePath.UPLOAD_ICON),
                            color: AppColors.textColor,
                            size: 30,
                          ),
                          horizontalGap(context: context, screenSize: 0.01)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: AppColors.loginDeviderColor, width: 0.8),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          const Text("Take a pic of my reports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Mulish",
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18,
                          ),
                          ImageIcon(
                            AssetImage(ImagePath.CAMERA_ICON),
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
           
            
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 15, left: 20, right: 20),
        color: AppColors.kBGcolor,
        child: CustomButton(
            onTap: () {
              doNavigate(
                  route: AwsomeScreen(voidCallback: () {
                    doNavigate(route: HealthSummary(), context: context);
                  }),
                  context: context);
            },
            text: "Done",
            borderRadius: Raddi.buttonCornerRadius,
            buttonColor: AppColors.buttonColor,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width),
      ),
    );
  }
}
