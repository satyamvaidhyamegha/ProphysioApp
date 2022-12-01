// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:physio/patient/welcome/model/doctordetail.dart';
import 'package:physio/patient/welcome/model/myreport_date.dart';
import 'package:physio/patient/welcome/model/quicklinks.dart';
import 'package:physio/patient/welcome/model/recentactivity.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/my_doc.dart';
import '../../../../BaseWidget/search_widget.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../BaseWidget/vertical_devider.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../uploadedreport.dart';
import 'all_doctor.dart';

class Mydoc extends StatefulWidget {
  const Mydoc({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MydocPageState();
  }
}

class _MydocPageState extends State<Mydoc> {
  final TextEditingController myDocSearch = TextEditingController();

  var password = "";
  var email = "";
  double rating = 3.5;

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  List<Recentactivity> recentactivityvalue = List.generate(
    recentactivityval.length,
    (index) => Recentactivity(
      image: recentactivityval[index]["image"],
      name: recentactivityval[index]["name"],
      desc: recentactivityval[index]["desc"],
    ),
  );

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
    var editingController;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0.0,
            backgroundColor: AppColors.allDoctorBackGroundColor,
            automaticallyImplyLeading: false,
            title: Padding(padding: EdgeInsets.only(top: 30, left: 8), child: getText(
              text: "${Strings.MY} ${Strings.DOC}",
              textStyle: subheadertext1,
            ),)),
        backgroundColor: AppColors.allDoctorBackGroundColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchWidget(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                          controller: myDocSearch,
                          hintText: Strings.SEARCH,
                          inputAction: TextInputAction.search),
                      verticalGap(context: context, screenSize: 0.04),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(
                              text:
                                  "${Strings.MY} ${Strings.RECENT} ${Strings.DOC}",
                              textStyle: headertext.copyWith(fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                doNavigate(route: AllDoctorListScreen(), context: context);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    getText(
                                      text: "${Strings.ALL} ${Strings.DOC}s",
                                      textStyle: bluetext1,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Color(0xFF007CE2), size: 15)
                                  ]),
                            ),
                          ]),
                      verticalGap(context: context, screenSize: 0.02),
                      Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.PROFILE_CARD_COLOR),
                      child: Column(
                        children: [
                          MyRecentDoc(
                              doctorName: "Dr. Rama Desuza",
                              appintmentTime:
                                  "MBBS, Movements Specialist \nMonipal Hospital, Indra Nagar",
                              onPressed: () {}),
                         
                           Divider(color: Colors.grey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 18.0,
                                  right: 18,
                                ),
                                child: Text(Strings.HISTORY, style: bluetext1),
                              ),
                              verticalDevider(),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Strings.CALL, style: bluetext1),
                              ),
                              verticalDevider(),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(Strings.MESSAGE, style: bluetext1),
                              ),
                            ],
                          ),
                        ],
                      )),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: "Recent Activities",
                        textStyle: infoStyle.copyWith(fontSize: 22),
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Container(
                        padding: Margins.basePadding,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: Raddi.k12px,
                          color: AppColors.PROFILE_CARD_COLOR
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,

                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: recentactivityvalue.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Card(
                                  color: AppColors.PROFILE_CARD_COLOR,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Row(
                                          children: [
                                            getImageAssets(
                                              imagePath:
                                                  recentactivityvalue[index]
                                                      .image,
                                            ),
                                            horizontalGap(
                                                context: context,
                                                screenSize: 0.05),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getText(
                                                  text:
                                                      recentactivityvalue[index]
                                                          .name,
                                                  textStyle:
                                                      profilefieldtextStyle,
                                                ),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text:
                                                      recentactivityvalue[index]
                                                          .desc,
                                                  textStyle: info1style,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey),
                                      ),
                                     index!=4 ? Divider(
                                          color: Colors.grey, thickness: 0.4):Container(),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: "Other Docs",
                        textStyle: headertext.copyWith(fontWeight: FontWeight.bold),
                      ),
                     verticalGap(context: context, screenSize: 0.015),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                            itemCount: doctorvalcarddetail.length,
                            shrinkWrap: false,
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 0.0),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.14,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.PROFILE_CARD_COLOR
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                              height: MediaQuery.of(context).size.height*0.14,
                                              width: MediaQuery.of(context).size.width*0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                ),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: getAssetImage(
                                                      imagePath:
                                                          doctorvalcarddetail[
                                                                  index]
                                                              .image,
                                                    )),
                                              )),
                                        ),
                                        horizontalGap(
                                            context: context, screenSize: 0.05),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getText(
                                                  text:
                                                      doctorvalcarddetail[index]
                                                          .doctorname,
                                                  textStyle:
                                                      profilefieldtextStyle,
                                                ),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.01),
                                                getText(
                                                  text:
                                                      doctorvalcarddetail[index]
                                                          .education,
                                                  textStyle: info1style,
                                                ),
                                                // verticalGap(
                                                //     context: context,
                                                //     screenSize: 0.01),
                                                getText(
                                                  text:
                                                      doctorvalcarddetail[index]
                                                          .hospitalname,
                                                  textStyle: info1style,
                                                ),
                                                verticalGap(
                                                    context: context,
                                                    screenSize: 0.013),
                                                getText(
                                                  text:
                                                      doctorvalcarddetail[index]
                                                          .lastcontanct,
                                                  textStyle: info1style,
                                                )
                                              ]),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0),
                                            child: RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 11,
                                              unratedColor: Colors.grey,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(Icons.star,
                                                      size: 10,
                                                      color: Color(0xffFFBA00)),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ))
                                      ]),
                                ),
                              );
                            }),
                      ),
                      verticalGap(context: context, screenSize: 0.02)
                    ]))));
  }
}
