// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/model/home%20page%20model/history%20model/history_model.dart';
import 'package:physio/patient/model/home%20page%20model/upcoming%20model/upcoming_model.dart';
import 'package:physio/patient/model/user_model/user_result.dart';
import 'package:physio/patient/screens/About%20Health/upload_reports.dart';
import 'package:physio/patient/screens/Profile%20Screen/profile_screen.dart';
import 'package:physio/patient/services/Auth%20Service/user_details.dart';
import 'package:physio/patient/services/home%20page%20services/home_page_api.dart';
import 'package:physio/patient/welcome/model/quicklinks.dart';
import '../../../../BaseWidget/appoiment_date_details.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/care_idea_list.dart';
import '../../../../BaseWidget/device_track.dart';
import '../../../../BaseWidget/explore_procare_slider.dart';
import '../../../../BaseWidget/my_welbeing.dart';
import '../../../../BaseWidget/quick_link_card.dart';
import '../../../../BaseWidget/recomnded_slider.dart';
import '../../../../BaseWidget/self_assessment_slider.dart';
import '../../../../BaseWidget/self_care_slider.dart';
import '../../../../BaseWidget/self_healing_slider.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../uploadedreport.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  ScrollController? _scrollViewController;
  var value = "";
  int? selectedValue1;
  int? selectedValue2;
  int? selectedValue3;
  int? _currentIndex = 0;
  int currentPos = 0;
  bool isSelected = true;
  Color _colorContainer = Colors.grey;
  UserDetailsApi userDetailsApi = UserDetailsApi();
  List<UpcomingModel> listOfAppointmentData = [];
  List<ContentModel> careIdeasList = [];
  int wellbeingratings = 0;
  int painRecoveryRating = 0;

  void getListOfAppointment() async {
    var listData = await HomePageApi().getUpcomingListSession();

    setState(() {
      listOfAppointmentData = listData;
    });
  }

  void getWelbeingData() async {
    var response = await HomePageApi().getWelbeingData();
    var jsonDecodeData = jsonDecode(response.body);
    setState(() {
      wellbeingratings = jsonDecodeData['rating'];
    });
  }

  void getRecoveryPainData() async {
    var response = await HomePageApi().getRecoveryPain();
    var jsonDecodeData = jsonDecode(response.body);
    setState(() {
      painRecoveryRating = jsonDecodeData['rating'];
    });
  }

  saveRatingForWellbeing(int rating) async {
    await HomePageApi().saveFeelingRating(rating: rating);
    setState(() {
      wellbeingratings = rating;
    });
  }

  saveRatingForPainRecovery(int rating) async {
    await HomePageApi().savePainRecoveryRating(rating: rating);
    setState(() {
      painRecoveryRating = rating;
    });
  }

  void getCareIdeaList() async {
    var careIdea = await HomePageApi().getHomePageContentData(46);

    setState(() {
      careIdeasList = careIdea;
    });
  }

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  void onChange2(int value) {
    setState(() {
      selectedValue2 = value;
    });
  }

  void onChange3(int value) {
    setState(() {
      selectedValue3 = value;
    });
  }

  final List<ListItem> _items = [
    ListItem(title: 'Home', isSelected: true, icon: FontAwesomeIcons.house),
    ListItem(title: 'My Care', isSelected: false, icon: FontAwesomeIcons.child),
    ListItem(
        title: 'My Doc', isSelected: false, icon: FontAwesomeIcons.userDoctor),
    ListItem(title: 'Messages', isSelected: false, icon: Icons.mail_rounded),
    ListItem(title: 'Explore', isSelected: false, icon: Icons.grid_view_rounded)
  ];

  List<Quicklink> quicklinkval = List.generate(
    quickcareval.length,
    (index) => Quicklink(
      image: quickcareval[index]["image"],
      name: quickcareval[index]["name"],
    ),
  );

  @override
  void initState() {
    getListOfAppointment();
    getCareIdeaList();
    getWelbeingData();
    getRecoveryPainData();
    _controller = new TabController(length: 5, vsync: this);
    _controller?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            actions: [
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  doNavigate(route: ProfilePage(), context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<UserResult>(
                      future: UserDetailsApi().getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CircleAvatar(
                              radius: 30,
                              backgroundImage: snapshot.data!.image != null
                                  ? NetworkImage(
                                      snapshot.data!.image.toString())
                                  : getAssetImage(
                                      imagePath: ImagePath.PRAMOD_CEO_PIC));
                        } else {
                          return Container();
                        }
                      }),
                ),
              )
            ],
            backgroundColor: AppColors.allDoctorBackGroundColor,
            automaticallyImplyLeading: false,
            toolbarHeight: 120,
            title: Column(
              children: [
                InkWell(
                  onTap: () {
                    doNavigate(route: ReportsUpload(), context: context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getText(
                      text: Strings.WELCOME,
                      textStyle: infoStyle.copyWith(
                          fontSize: 14,
                          fontFamily: "Mulish",
                          color: Color.fromRGBO(235, 235, 245, 0.6)),
                    ),
                  ),
                ),
                FutureBuilder<UserResult>(
                  future: userDetailsApi.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: getText(
                          text: snapshot.data!.name!.isNotEmpty
                              ? snapshot.data!.name.toString()
                              : "User Name",
                          textStyle: headerStyle.copyWith(
                              fontSize: 34,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Mulish"),
                        ),
                      );
                    } else {
                      return getText(
                        text: "Loading user data......",
                        textStyle: infoStyle,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.allDoctorBackGroundColor,
          body: Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHome(context),
                      verticalGap(context: context, screenSize: 0.02),
                      getText(
                        text: "${Strings.MY} ${Strings.WELLBEING}",
                        textStyle: headertext,
                      ),
                      verticalGap(context: context, screenSize: 0.01),

                      Card(
                        shadowColor: Colors.black87,
                        color: Colors.transparent,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                  text: "${Strings.HOW_ARE_YOU_FELLING}",
                                  textStyle: profilefieldtextStyle,
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Container(
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.GREAT_WEL_ICON,
                                          name: Strings.GREAT,
                                          textColor: (wellbeingratings == 5)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForWellbeing(5);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.GOOD_WEL_ICON,
                                          name: Strings.GOOD,
                                          textColor: (wellbeingratings == 4)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForWellbeing(4);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.FINE_WEL_ICON,
                                          name: Strings.FINE,
                                          textColor: (wellbeingratings == 3)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForWellbeing(3);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.MEH_WEL_ICON,
                                          name: Strings.MEH,
                                          textColor: (wellbeingratings == 2)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForWellbeing(2);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath:
                                              ImagePath.TERRIBLE_WEL_ICON,
                                          name: Strings.TERRIBLE,
                                          textColor: (wellbeingratings == 1)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForWellbeing(1);
                                          }),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      getText(
                        text: "Pain/Recovery",
                        textStyle: headertext,
                      ),
                      verticalGap(context: context, screenSize: 0.01),

                      Card(
                        shadowColor: Colors.black87,
                        color: Colors.transparent,
                        child: Padding(
                          padding: Margins.basePadding,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                  text: "How is your pain the complaint area?",
                                  textStyle: profilefieldtextStyle,
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Container(
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.GREAT_WEL_ICON,
                                          name: Strings.GREAT,
                                          textColor: (painRecoveryRating == 5)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForPainRecovery(5);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.GOOD_WEL_ICON,
                                          name: Strings.GOOD,
                                          textColor: (painRecoveryRating == 4)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForPainRecovery(4);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.FINE_WEL_ICON,
                                          name: Strings.FINE,
                                          textColor: (painRecoveryRating == 3)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForPainRecovery(3);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath: ImagePath.MEH_WEL_ICON,
                                          name: Strings.MEH,
                                          textColor: (painRecoveryRating == 2)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForPainRecovery(2);
                                          }),
                                      MyWelBeingWidget(
                                          imagePath:
                                              ImagePath.TERRIBLE_WEL_ICON,
                                          name: Strings.TERRIBLE,
                                          textColor: (painRecoveryRating == 1)
                                              ? AppColors.buttonColor
                                              : Colors.grey,
                                          onTap: () {
                                            saveRatingForPainRecovery(1);
                                          }),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),

                      verticalGap(context: context, screenSize: 0.03),
                      Row(
                        children: [
                          getText(
                            text: "${Strings.CARE} ${Strings.IDEAS}",
                            textStyle: headertext,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              getText(
                                  text: "View all",
                                  textStyle: profilefieldtextStyle.copyWith(
                                    color: AppColors.buttonColor,
                                  )),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.buttonColor,
                                size: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.015),
                      AllCareIdeas(),
                      verticalGap(context: context, screenSize: 0.02),
                      //1st slide
                      Row(
                        children: [
                          getText(
                            text: Strings.RECOMENDED_FOR_YOU,
                            textStyle: headertext,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              getText(
                                  text: "View all",
                                  textStyle: profilefieldtextStyle.copyWith(
                                    color: AppColors.buttonColor,
                                  )),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.buttonColor,
                                size: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.015),
                      RecomndedSlider(),
                      //_buildrowindicator(context, recomendvals),

                      verticalGap(context: context, screenSize: 0.02),
                      //2nd
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: Strings.SELF_ASSESSMENT,
                              textStyle: headertext,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: Strings.VIEW_ALL,
                                    textStyle: bluetext,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: AppColors.buttonColor, size: 15)
                                ]),
                          ]),
                      verticalGap(context: context, screenSize: 0.015),
                      AssesmentSlider(),
                      // _buildrowindicator(context, selfacessval),
                      verticalGap(context: context, screenSize: 0.02),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: "Selfcare",
                              textStyle: headertext,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: Strings.VIEW_ALL,
                                    textStyle: bluetext,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: AppColors.buttonColor, size: 15)
                                ]),
                          ]),
                      verticalGap(context: context, screenSize: 0.015),
                      SelfCareSlider(),

                      // _buildrowindicator(context, selfcarevaldetail),
                      verticalGap(context: context, screenSize: 0.03),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: "${Strings.SELF} ${Strings.HEALING}",
                              textStyle: headertext,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: Strings.VIEW_ALL,
                                    textStyle: bluetext,
                                  ),
                                  verticalGap(
                                      context: context, screenSize: 0.02),
                                  Icon(Icons.arrow_forward_ios,
                                      color: AppColors.buttonColor, size: 15)
                                ]),
                          ]),

                      verticalGap(context: context, screenSize: 0.015),

                      SelfHealing(),
                      verticalGap(context: context, screenSize: 0.03),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: "${Strings.EXPLORE} ${Strings.PRO_CARE}",
                              textStyle: headertext,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: Strings.VIEW_ALL,
                                    textStyle: bluetext,
                                  ),
                                  verticalGap(
                                      context: context, screenSize: 0.02),
                                  Icon(Icons.arrow_forward_ios,
                                      color: AppColors.buttonColor, size: 15)
                                ]),
                          ]),

                      verticalGap(context: context, screenSize: 0.015),
                      ExploreProcareSlider(),

                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: "Upgrade your Healthcare",
                        textStyle: headertext,
                      ),
                      verticalGap(context: context, screenSize: 0.015),
                      DeviceDetails(),

                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: Strings.QUICK_LINKS,
                        textStyle: headertext,
                      ),
                      verticalGap(context: context, screenSize: 0.015),

                      Container(
                        height: MediaQuery.of(context).size.height * 0.29,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.PROFILE_CARD_COLOR,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: quicklinkval.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  QuickLink(
                                    onTap: () {},
                                    titleText: quicklinkval[index].name,
                                    leadingIcon: quicklinkval[index].image,
                                  ),
                                  Divider(
                                    color: Colors.grey[900],
                                    indent: 30,
                                    height: 1,
                                    thickness: 2,
                                  ),
                                ],
                              );
                            }),
                      ),

                      verticalGap(context: context, screenSize: 0.02),
                    ]),
              ))),
    );
  }

  Widget _buildHome(context) {
    return Align(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const SizedBox(height: 5),

          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      getImageAssets(imagePath: ImagePath.SESSION_IMAGE),
                      const SizedBox(
                        width: 5,
                      ),
                      FutureBuilder<HistorySessionModel>(
                        future: HomePageApi().getHistorySession(),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return getText(
                              text: snap.data!.session_count.toString(),
                              textStyle: BaseStyles.smallSizeText
                                  .copyWith(color: AppColors.textColor),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      getText(
                        text: Strings.SESSION,
                        textStyle: BaseStyles.smallSizeText,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      getImageAssets(imagePath: ImagePath.CALENDER_ICON_IMAGE),
                      const SizedBox(
                        width: 5,
                      ),
                      FutureBuilder<HistorySessionModel>(
                        future: HomePageApi().getHistorySession(),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return getText(
                              text: snap.data!.days.toString(),
                              textStyle: BaseStyles.smallSizeText
                                  .copyWith(color: AppColors.textColor),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      getText(
                        text: Strings.DAYS,
                        textStyle: BaseStyles.smallSizeText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      getImageAssets(imagePath: ImagePath.POINT_ICON_IMAGE),
                      const SizedBox(
                        width: 5,
                      ),
                      FutureBuilder<HistorySessionModel>(
                        future: HomePageApi().getHistorySession(),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return getText(
                              text: snap.data!.reward_point.toString(),
                              textStyle: BaseStyles.smallSizeText
                                  .copyWith(color: AppColors.textColor),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      getText(
                        text: Strings.POINTS,
                        textStyle: BaseStyles.smallSizeText,
                      ),
                    ],
                  )
                ],
              )),
          const SizedBox(height: 30),
          getText(
            text: "${Strings.PRO} ${Strings.ROUTINES}",
            textStyle: headertext,
          ),
          const SizedBox(
            height: 20,
          ),
          //pending video clip

          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: getAssetImage(
                      imagePath: ImagePath.YOGA_IMAGE,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getImageAssets(imagePath: ImagePath.PLAY_ICON_IMAGE),
                getText(
                  text: Strings.PLAY,
                  textStyle: profilefieldtextStyle,
                )
              ],
            ),
          ),

//pending video clip

          FutureBuilder<UpcomingModel>(
            future: HomePageApi().getUpcomingSession(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getText(
                                  text: "${Strings.MORNING} ${Strings.SESSION}",
                                  textStyle: subheadertext,
                                ),
                                FutureBuilder<UpcomingModel>(
                                    future: HomePageApi().getUpcomingSession(),
                                    builder: (context, snap) {
                                      if (snap.hasData) {
                                        // final dt1 = DateTime.tryParse(
                                        //     snap.data!.start_time.toString());
                                        return getText(
                                          text: DateFormat.d().format(
                                              DateTime.parse(snap
                                                  .data!.start_time
                                                  .toString())),
                                          textStyle:
                                              BaseStyles.appointmentDateStyle,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder<UpcomingModel>(
                                    future: HomePageApi().getUpcomingSession(),
                                    builder: ((context, snapshot) {
                                      if (snapshot.hasData) {
                                        return getText(
                                          text:
                                              snapshot.data!.details.toString(),
                                          textStyle: info1style,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    })),
                                verticalGap(context: context, screenSize: 0.02),
                                FutureBuilder<UpcomingModel>(
                                    future: HomePageApi().getUpcomingSession(),
                                    builder: ((context, snapshot) {
                                      if (snapshot.hasData) {
                                        var date = DateTime.parse(snapshot
                                            .data!.start_time
                                            .toString());

                                        return InkWell(
                                          onTap: () {
                                            print(DateFormat('EEEE')
                                                .format(date));
                                          },
                                          child: getText(
                                            text:
                                                DateFormat('EEEE').format(date),
                                            textStyle: info1style,
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    })),
                              ],
                            ),
                            verticalGap(context: context, screenSize: 0.02),
                            getText(
                              text: Strings.YOU_WILL_NEED,
                              textStyle: profilefieldtextStyle,
                            ),
                            verticalGap(context: context, screenSize: 0.02),
                            FutureBuilder<UpcomingModel>(
                              future: HomePageApi().getUpcomingSession(),
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  String text = snap.data!.equipment.toString();

                                  List<String> result = text.split(',');
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      result[0].isNotEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                getImageAssets(
                                                    imagePath: ImagePath
                                                        .YOGA_MATS_ICON),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text: result[0],
                                                  textStyle: iconlablecolor,
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      result[1].isNotEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                getImageAssets(
                                                    imagePath: ImagePath
                                                        .CHAIR_ICON_IMAGE),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text: result[1],
                                                  textStyle: iconlablecolor,
                                                )
                                              ],
                                            )
                                          : Container(),
                                      result[2].isNotEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                getImageAssets(
                                                    imagePath: ImagePath
                                                        .EQIPMENT_ICON_IMAGE),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text: result[2],
                                                  textStyle: iconlablecolor,
                                                )
                                              ],
                                            )
                                          : Container(),
                                      result[3].isNotEmpty
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                getImageAssets(
                                                    imagePath: ImagePath
                                                        .BUDDY_ICON_IMAGE),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text: result[3],
                                                  textStyle: iconlablecolor,
                                                )
                                              ],
                                            )
                                          : Container(),
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            verticalGap(context: context, screenSize: 0.03),
                            listOfAppointmentData.isNotEmpty
                                ? Text(
                                    "${Strings.APPIONTMENT}s (${listOfAppointmentData.length})",
                                    style: headertext)
                                : Container(),
                            listOfAppointmentData.isNotEmpty
                                ? Column(
                                    children:
                                        listOfAppointmentData.map((element) {
                                      var startDate = DateFormat('hh:mm a')
                                          .format(DateTime.parse(
                                              element.start_time.toString()));
                                      var endDate = DateFormat('hh:mm a')
                                          .format(DateTime.parse(
                                              element.end_time.toString()));

                                      return AppoinmentsDetails(
                                          dateText: DateFormat.d().format(
                                              DateTime.parse(element.start_time
                                                  .toString())),
                                          dayText: DateFormat('EEEE').format(
                                              DateTime.parse(element.start_time
                                                  .toString())),
                                          doctorName:
                                              element.doctor_name.toString(),
                                          appintmentTime:
                                              "$startDate - $endDate",
                                          onPressed: () {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          Uploadreportdetail()));
                                            });
                                          });
                                    }).toList(),
                                  )
                                : Container()
                          ])),
                );
              } else {
                return Container();
              }
            },
          )
        ]));
  }
}

class ListItem {
  String title;
  bool isSelected;
  IconData icon;
  ListItem({
    required this.title,
    required this.isSelected,
    required this.icon,
  });
}

class Mood {
  String name;
  String moodimage;
  bool iselected;
  Mood(this.moodimage, this.name, this.iselected);
}
