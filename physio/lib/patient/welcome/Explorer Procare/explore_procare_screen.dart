// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/Routine/air_rowing.dart';

import '../../../BaseWidget/care_idea_list.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class ExploreProCareScreen extends StatefulWidget {
  const ExploreProCareScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExploreProCareScreenPageState();
  }
}

class _ExploreProCareScreenPageState extends State<ExploreProCareScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> recentData = [
    {
      "imagePath": ImagePath.ABOUT_SCREEN_IMAGE1,
      "title": "Breathe away\nyour pain"
    },
    {
      "imagePath": ImagePath.ABOUT_SCREEN_IMAGE1,
      "title": "Listen to\nhealing music"
    },
    {
      "imagePath": ImagePath.ABOUT_SCREEN_IMAGE1,
      "title": "Go on a healing\ninward journey"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              
              elevation: 0.0,
              backgroundColor: AppColors.allDoctorBackGroundColor,
              title: const Text(
                "Explore Procare",
                style: profilefieldtextStyle,
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              actions: [
                IconButton(
                    onPressed: () {
                      doNavigate(
                          route: AirRowing(), context: context);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ))
              ],
            ),
            backgroundColor: AppColors.allDoctorBackGroundColor,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Container(
                    color: AppColors.profileAppbarBgColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        Strings.TRANSFER_YOUR_PAIN_TO_WISDOM,
                        style: subheadertext2,
                      ),
                    ),
                  ),
                  Container(
                      color: AppColors.profileAppbarBgColor,
                      alignment: Alignment.centerRight,
                      child: const Image(
                          image: AssetImage(
                            (ImagePath.TARNSFORM_PAIN_IMAGE),
                          ),
                          fit: BoxFit.cover)),
                  const SizedBox(height: 25),
                  Card(
                      color: AppColors.allDoctorBackGroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              getText(
                                text: "${Strings.CARE} ${Strings.IDEAS}",
                                textStyle: headertext,
                              ),
                              AllCareIdeas(),
                              verticalGap(context: context, screenSize: 0.02),
                              Center(
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: Raddi.buttonCornerRadius,
                                        border: Border.all(
                                            color: AppColors.buttonColor,
                                            width: 1.5)),
                                    child: const Center(
                                      child: Text(
                                        "${Strings.EXPLORE} ${Strings.MORE}",
                                        style: bluetext,
                                      ),
                                    )),
                              ),
                              verticalGap(context: context, screenSize: 0.02),
                              Text(
                                "Self Healing",
                                style: headertext.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              verticalGap(context: context, screenSize: 0.02),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: recentData.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                            borderRadius: Raddi.k12px,
                                            color: Colors.amber,
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(e['imagePath']),
                                                fit: BoxFit.cover)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getText(
                                                  text: e['title'],
                                                  textStyle:
                                                      profilefieldtextStyle
                                                          .copyWith(
                                                              fontSize: 18)),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.025)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              verticalGap(context: context, screenSize: 0.03),
                              Text(
                                Strings.SELF_ASSESSMENT,
                                style: headertext.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    decoration: BoxDecoration(
                                        borderRadius: Raddi.k12px,
                                        color: AppColors.PROFILE_CARD_COLOR),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.13,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.280000,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                  ),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          ImagePath
                                                              .ANATOMY_IAMGE)),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text(
                                                    Strings.CHECK_YOU_HEALTH,
                                                    style:
                                                        profilefieldtextStyle,
                                                  ),
                                                  verticalGap(
                                                      context: context,
                                                      screenSize: 0.008),
                                                  Text(
                                                    "Your next self assessment \nis scheduled on the end of this \nmonth!",
                                                    style: info1style,
                                                  ),
                                                  verticalGap(
                                                      context: context,
                                                      screenSize: 0.008),
                                                  Text(
                                                    "Know ${Strings.MORE}",
                                                    style: bluetext,
                                                  ),
                                                ]),
                                          )
                                        ]),
                                  )),
                              verticalGap(context: context, screenSize: 0.04),
                              Text(
                                Strings.ENVIRINMENT,
                                style: headertext.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    decoration: BoxDecoration(
                                        borderRadius: Raddi.k12px,
                                        color: AppColors.PROFILE_CARD_COLOR),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.29,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                  ),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(ImagePath
                                                          .ENVIRONMENT_IMAGE)),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text(
                                                    "Setting space for\nexcercise",
                                                    style:
                                                        profilefieldtextStyle,
                                                  ),
                                                  verticalGap(
                                                      context: context,
                                                      screenSize: 0.008),
                                                  Text(
                                                    "Your next self assessment \nis scheduled on the end of this \nmonth!",
                                                    style: info1style,
                                                  ),
                                                  verticalGap(
                                                      context: context,
                                                      screenSize: 0.008),
                                                  Text(
                                                    "Know ${Strings.MORE}",
                                                    style: bluetext,
                                                  ),
                                                ]),
                                          )
                                        ]),
                                  )),
                              verticalGap(context: context, screenSize: 0.05)
                            ]),
                      )),
                ]))));
  }
}
