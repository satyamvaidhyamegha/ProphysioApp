// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/welcome/model/myreport_date.dart';
import 'package:physio/patient/welcome/model/myreport_doctor.dart';
import 'package:physio/patient/welcome/model/quicklinks.dart';
import '../../../BaseWidget/appoiment_date_details.dart';
import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/search_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../BaseWidget/vertical_devider.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../uploadedreport.dart';

class MycarePage extends StatefulWidget {
  const MycarePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MycarePagePageState();
  }
}

class _MycarePagePageState extends State<MycarePage> {
  //final bool _obscureText = true;
  final TextEditingController myCareSearch = TextEditingController();
  ScrollController mycontroller1 = ScrollController();
  ScrollController mycontroller2 = ScrollController();

  var password = "";
  var email = "";

  
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  List<Quicklink> quicklinkval = List.generate(
    quickcareval.length,
    (index) => Quicklink(
      image: quickcareval[index]["image"],
      name: quickcareval[index]["name"],
    ),
  );

  List<DateCard> reportvaldetail = List.generate(
    dateval.length,
    (index) => DateCard(
      image: dateval[index]["image"],
      title: dateval[index]["title"],
      subtext: dateval[index]["subtext"],
      doctorname: dateval[index]["doctorname"],
      date: dateval[index]["date"],
    ),
  );

  //list of doctor

  List<DoctorCard> doctorvaldetail = List.generate(
    doctorCardval.length,
    (index) => DoctorCard(
      name: doctorCardval[index]["name"],
      image: doctorCardval[index]["image"],
      title: doctorCardval[index]["title"],
      subtext: doctorCardval[index]["subtext"],
      doctorname: doctorCardval[index]["doctorname"],
      date: doctorCardval[index]["date"],
    ),
  );

  @override
  Widget build(BuildContext context) {
    //var editingController;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kBGcolor,
          automaticallyImplyLeading: false,
          title: Text(
            "${Strings.MY} ${Strings.CARE}",
            style: subheadertext1,
          ),
        ),
        backgroundColor: AppColors.kBGcolor,
        body: ListView(
          controller: mycontroller1,
          addAutomaticKeepAlives: true,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.02),
                      SearchWidget(
                          suffixIcon: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          controller: myCareSearch,
                          hintText: Strings.SEARCH,
                          inputAction: TextInputAction.search),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: "${Strings.MY} ${Strings.ASSESSMENT}",
                        textStyle: headertext,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                            controller: mycontroller2,
                            itemCount: reportvaldetail.length,
                            shrinkWrap: true,
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 0.0),
                            itemBuilder: (context, index) {
                              return Card(
                                  color: AppColors.kBGcolor,
                                  elevation: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: IntrinsicHeight(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: getImageAssets(
                                                imagePath:
                                                    reportvaldetail[index]
                                                        .image,
                                              )),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.06),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getText(
                                                text: reportvaldetail[index]
                                                    .title,
                                                textStyle:
                                                    profilefieldtextStyle,
                                              ),
                                              const SizedBox(height: 10),
                                              getText(
                                                text: reportvaldetail[index]
                                                    .subtext,
                                                textStyle: iconlablecolor,
                                              ),
                                              verticalGap(
                                                  context: context,
                                                  screenSize: 0.02),
                                              getText(
                                                text: "ProLab, 27 Feb 2021",
                                                textStyle: iconlablecolor,
                                              )
                                            ],
                                          ),
                                        ])),
                                  ));
                            }),
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "${Strings.RECENT} ${Strings.REPORTS}",
                              style: infoStyle2,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: "All ${Strings.REPORTS}",
                                    textStyle: bluetext1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Color(0xFF007CE2), size: 15)
                                ]),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                            itemCount: reportvaldetail.length,
                            shrinkWrap: true,
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 0.0),
                            itemBuilder: (context, index) {
                              return Card(
                                  color: AppColors.kBGcolor,
                                  elevation: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: IntrinsicHeight(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: getImageAssets(
                                                imagePath:
                                                    reportvaldetail[index]
                                                        .image,
                                              )),
                                          SizedBox(width: 15),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getText(
                                                text: reportvaldetail[index]
                                                    .title,
                                                textStyle:
                                                    profilefieldtextStyle,
                                              ),
                                              const SizedBox(height: 10),
                                              getText(
                                                text: reportvaldetail[index]
                                                    .subtext,
                                                textStyle: iconlablecolor,
                                              ),
                                              SizedBox(height: 20),
                                              getText(
                                                text: "ProLab, 27 Feb 2021",
                                                textStyle: iconlablecolor,
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ])),
                                  ));
                            }),
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text: "${Strings.UPCOMING} (1)",
                              textStyle: headertext,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                    text: "${Strings.ALL} ${Strings.SESSION}",
                                    textStyle: bluetext1,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Color(0xFF007CE2), size: 15)
                                ]),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      AppoinmentsDetails(
                          dateText: "22",
                          dayText: "Saterday",
                          doctorName: "Dr. Rama",
                          appintmentTime: "3.00pm-4.00pm",
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Uploadreportdetail()));
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Color(0xffebebf599)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 18.0,
                              right: 18,
                            ),
                            child: getText(
                              text: Strings.CALL,
                              textStyle: bluetext1,
                            ),
                          ),
                          verticalDevider(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(Strings.MESSAGE, style: bluetext1),
                          ),
                          verticalDevider(),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
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
                                    text: Strings.JOIN, textStyle: bluetext1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      getText(
                        text: Strings.QUICK_LINKS,
                        textStyle: headertext,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,

                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: quicklinkval.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Card(
                                color: Colors.black,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          getImageAssets(
                                              imagePath:
                                                  quicklinkval[index].image),
                                          const SizedBox(width: 15),
                                          getText(
                                            text: quicklinkval[index].name,
                                            textStyle: midheadertext,
                                          )
                                        ],
                                      ),
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: Colors.grey),
                                    ),
                                    const Divider(
                                        color: Colors.grey, thickness: 0.4),
                                  ],
                                ),
                              ),
                            );
                          }),
                      verticalGap(context: context, screenSize: 0.02),
                    ])),
          ],
        ));
  }
}
