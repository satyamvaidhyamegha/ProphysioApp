// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/screens/onboarding/model/recentreport.dart';
import 'package:physio/patient/welcome/model/appointment.dart';
import 'package:physio/patient/welcome/model/doctordetail.dart';
import 'package:physio/patient/welcome/myreport.dart';
import 'package:physio/patient/welcome/uploadedreport.dart';

import '../../../../../BaseWidget/base_image_widget.dart';
import '../../../../../BaseWidget/custom_button.dart';
import '../../../../../BaseWidget/text.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/raddi.dart';
import '../../../../../constants/string.dart';
import '../../../../../constants/text_constants.dart';
import '../../../../../utility/gap_between.dart';


class Appointmentdetail extends StatefulWidget {
  const Appointmentdetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppointmentdetailPageState();
  }
}

class _AppointmentdetailPageState extends State<Appointmentdetail>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  var password = "";
  var email = "";
  bool itSelected = false;
  bool engSelected = false;
  double rating = 3.5;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  List<Appointment> appointmentvaldetail = List.generate(
    appointmentval.length,
    (index) => Appointment(
      time: appointmentval[index]["time"],
      name: appointmentval[index]["name"],
      desc: appointmentval[index]["desc"],
      month: appointmentval[index]["month"],
      date: appointmentval[index]["date"],
    ),
  );
                         
  List<Report> reportvaldetail = List.generate(
    reportval.length,
    (index) => Report(
      name: reportval[index]["name"],
      month: reportval[index]["month"],
      date: reportval[index]["date"],
    ),
  );

  List<DoctordetailCard> doctorvalcarddetail = List.generate(
    doctordetailCardval.length,
    (index) => DoctordetailCard(
      education: doctordetailCardval[index]["education"],
      hospitalname: doctordetailCardval[index]["hospitalname"],
      image: doctordetailCardval[index]["image"],
      lastcontanct: doctordetailCardval[index]["lastcontanct"],
      doctorname: doctordetailCardval[index]["doctorname"],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.kBGcolor,
                leading: getBackIconButton(context: context),
                title: getText(
                  text: "Book in ${Strings.APPIONTMENT}",
                  textStyle: profilefieldtextStyle,
                )),
            backgroundColor: AppColors.kBGcolor,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: Margins.marginsK18,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: getAssetImage(
                                                imagePath:
                                                    doctorvalcarddetail[index]
                                                        .image,
                                              )),
                                        )),
                                  ),
                                  const SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getText(
                                            text: doctorvalcarddetail[index]
                                                .doctorname,
                                            textStyle: profilefieldtextStyle,
                                          ),
                                          const SizedBox(height: 5),
                                          getText(
                                            text: doctorvalcarddetail[index]
                                                .education,
                                            textStyle: info1style,
                                          ),
                                        ]),
                                  ),
                                ]));
                      }),
                ),
                verticalGap(context: context, screenSize: 0.02),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: const Divider(
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    getText(
                                      text: Strings.CONSULTING_HOURS,
                                      textStyle: profilefieldtextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                getText(
                                  text: '9:00 am - 10:30 am | Mon - Fri',
                                  textStyle: info1style1,
                                )
                              ]),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Reportdetail()));
                            },
                            child: Center(
                              child: Container(
                                width: 125,
                                height: 41,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color(0Xff007CE2)),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: getText(
                                    text: Strings.BOOK_NOW,
                                    textAlign: TextAlign.center,
                                    textStyle: bluetext1,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                      child: TabBar(
                        isScrollable: false,
                        controller: _tabController,
                        indicatorPadding: Margins.basePadding,
                        // give the indicator a decoration (color and border radius)
                        indicator: BoxDecoration(
                          border: Border.all(color: const Color(0xff007CE2)),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),

                        labelColor: Colors.white,
                        labelStyle: info1style1,
                        unselectedLabelColor: Colors.white,

                        tabs: const [
                          // first tab [you can add an icon using the icon property]
                          Tab(
                            text: '${Strings.APPIONTMENT}s',
                          ),

                          // second tab [you can add an icon using the icon property]
                          Tab(
                            text: Strings.REPORTS,
                          ),

                          Tab(
                            text: Strings.MESSAGE,
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                          controller: _tabController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: <Widget>[
                            tabbar1(context),
                            tabbar2(context),
                            Container(
                              height: 40,
                              width: 40,
                              color: Colors.amber,
                            ),
                          ])),
                ),
              ],
            )));
  }

  Widget tabbar1(context) {
    return Padding(
      padding: Margins.marginsK18,
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text(Strings.UPCOMING, style: infoStyle2),
          Card(
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Text(
                                "22",
                                style: TextStyle(
                                  color: Color(0xFF007CE2),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34,
                                ),
                              ),
                              SizedBox(height: 5),
                              getText(
                                text: "May | Sat",
                                textStyle: iconlablecolor,
                              ),
                            ],
                          ),
                          const SizedBox(width: 25),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(
                                text: "Dr. Roma Desouza",
                                textStyle: info1style1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              getText(
                                text:
                                    "${Strings.ONLINE} ${Strings.APPIONTMENT}",
                                textStyle: iconlablecolor,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              getText(
                                text: "3.00pm-4.00pm",
                                textStyle: iconlablecolor,
                              ),
                            ],
                          ),
                        ]),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.videocam_rounded,
                              size: 18,
                              color: Color(0xff0A84FF),
                            ),
                            onPressed: () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const Uploadreportdetail()));
                              });
                            }),
                      ]),
                ),
                verticalGap(context: context, screenSize: 0.015),
                const Divider(color: Color(0xffebebf599)),
                IntrinsicHeight(
                    //wrap Row with this, otherwise, vertical divider will not display
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.swap_horiz_rounded,
                          color: Color(0xff007CE2),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        getText(
                          text: Strings.SHIFT,
                          textStyle: bluetext1,
                        ),
                      ],
                    )),
                    const VerticalDivider(color: Colors.white),
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          Icons.swap_horiz_rounded,
                          color: Color(0xff007CE2),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        getText(
                          text: Strings.CANCEL,
                          textStyle: bluetext1,
                        ),
                      ],
                    )),
                    const VerticalDivider(color: Colors.white),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.video,
                          color: Color(0xff0A84FE),
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        getText(
                          text: Strings.JOIN,
                          textStyle: bluetext1,
                        ),
                      ],
                    ),
                  ],
                )),
              ])),
          verticalGap(context: context, screenSize: 0.02),
          getText(
            text: "${Strings.PAST} ${Strings.APPIONTMENT}s",
            textStyle: infoStyle2,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: appointmentvaldetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Column(
                                children: [
                                  Text(
                                    appointmentvaldetail[index].date,
                                    style: const TextStyle(
                                      color: Color(0xFF007CE2),
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  getText(
                                    text: appointmentvaldetail[index].month,
                                    textStyle: info1style,
                                  )
                                ],
                              ),
                              const SizedBox(width: 25),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getText(
                                    text: appointmentvaldetail[index].name,
                                    textStyle: info1style1,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  getText(
                                    text: appointmentvaldetail[index].desc,
                                    textStyle: subtitle1,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  getText(
                                    text: appointmentvaldetail[index].time,
                                    textStyle: subtitle1,
                                  ),
                                ],
                              ),
                            ]),
                          ]));
                }),
          )
        ],
      ),
    );
  }

  Widget tabbar2(context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          verticalGap(context: context, screenSize: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getText(
                text: '${Strings.RECENT} ${Strings.REPORTS}',
                textStyle: infoStyle2,
              ),
              Icon(Icons.circle_rounded, color: Color(0xff007CE2))
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: reportvaldetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Row(children: [
                            Column(
                              children: [
                                Text(
                                  reportvaldetail[index].date,
                                  style: const TextStyle(
                                    color: AppColors.buttonColor,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                getText(
                                  text: reportvaldetail[index].month,
                                  textStyle: info1style,
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                  text: Strings.ASSESTMENT_REPORT,
                                  textStyle: info1style1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                getText(
                                  text: reportvaldetail[index].name,
                                  textStyle: subtitle1,
                                ),
                              ],
                            ),
                          ]),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: Color(0xff98989F))
                        ])),
                  );
                }),
          )
        ],
      ),
    );
  }
}
