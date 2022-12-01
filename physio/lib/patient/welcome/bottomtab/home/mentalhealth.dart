// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:physio/patient/screens/onboarding/model/recentreport.dart';
import 'package:physio/patient/welcome/model/appointment.dart';
import 'package:physio/patient/welcome/model/caredoc.dart';
import 'package:physio/patient/welcome/model/selfheal.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';

class Mentalhealthdetail extends StatefulWidget {
  const Mentalhealthdetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MentalhealthdetailPageState();
  }
}

class _MentalhealthdetailPageState extends State<Mentalhealthdetail>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final bool _obscureText = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  var password = "";
  var email = "";
  bool itSelected = false;
  bool engSelected = false;
  double rating = 3.5;
  int? _currentIndex = 0;

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

  List<Caredoc> Caredocvaldetail = List.generate(
    Caredocval.length,
    (index) => Caredoc(
      subtext: Caredocval[index]["subtext"],
      title: Caredocval[index]["title"],
      image: Caredocval[index]["image"],
    ),
  );
  
  List<Selfheal> selfhealvaldetail = List.generate(
    selfhealval.length,
    (index) => Selfheal(
      image: selfhealval[index]["image"],
      name: selfhealval[index]["name"],
      title: selfhealval[index]["title"],
      desc: selfhealval[index]["desc"],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppColors.kBGcolor,
              title: const Text(
                Strings.MENTAL_HEALTH,
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
            ),
            backgroundColor: AppColors.kBGcolor,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 20, left: 20),
                     child: Text(
                      Strings.TRANSFER_YOUR_PAIN_TO_WISDOM,
                      style: subheadertext2,
                  ),
                   ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: const Image(
                          image: AssetImage(
                            (ImagePath.TARNSFORM_PAIN_IMAGE),
                          ),
                          fit: BoxFit.cover)),
                  const SizedBox(height: 25),
                  Card(
                      color: AppColors.kBGcolor,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            getText(
                              text: "${Strings.CARE} ${Strings.IDEAS}",
                              textStyle: headertext,
                            ),
                            ListView.builder(
                                itemCount: Caredocvaldetail.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height: 88,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15),
                                                    ),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                          Caredocvaldetail[
                                                                  index]
                                                              .image,
                                                        )),
                                                  )),
                                            ),
                                            const SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Caredocvaldetail[index]
                                                          .title,
                                                      style:
                                                          profilefieldtextStyle,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      Caredocvaldetail[index]
                                                          .subtext,
                                                      style: info1style,
                                                    ),
                                                    SizedBox(height: 5),
                                                    getText(
                                                      text:
                                                          "${Strings.READ} ${Strings.MORE}",
                                                      textStyle: bluetext,
                                                    )
                                                  ]),
                                            ),
                                          ]));
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                  height: 41,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xff007CE2))),
                                  child: const Center(
                                    child: Text(
                                      "${Strings.EXPLORE} ${Strings.MORE}",
                                      style: bluetext,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "${Strings.SELF} ${Strings.HEALING}",
                              style: headertext,
                            ),
                            CarouselSlider.builder(
                                itemCount: selfhealvaldetail.length,
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: 350.0,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  pauseAutoPlayOnTouch: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                itemBuilder: (BuildContext context, int index,
                                    int realIdx) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Stack(children: <Widget>[
                                      ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(10.0)),
                                          child: Stack(children: <Widget>[
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15))),
                                                  child: Image.asset(
                                                    selfhealvaldetail[index]
                                                        .image,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: 250,
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            selfhealvaldetail[
                                                                    index]
                                                                .name,
                                                            style:
                                                                subheadertext),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            selfhealvaldetail[
                                                                    index]
                                                                .desc,
                                                            style:
                                                                inputfieldtextStyle),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ])),
                                      Container(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.grey),
                                            child: Center(
                                              child: Text(
                                                  selfhealvaldetail[index]
                                                      .title,
                                                  style: subheadertext),
                                            ),
                                          ))
                                    ]),
                                  );
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                              Strings.SELF_ASSESSMENT,
                              style: headertext,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            height: 88,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                              ),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      ImagePath.ANATOMY_IAMGE)),
                                            )),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              Strings.CHECK_YOU_HEALTH,
                                              style: profilefieldtextStyle,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Your next self assessment \nis scheduled on the end of this \nmonth!",
                                              style: info1style,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "${Strings.READ} ${Strings.MORE}",
                                              style: bluetext,
                                            ),
                                          ])
                                    ]))
                          ])),
                  const SizedBox(
                    height: 10,
                  ),
                  getText(
                    text: Strings.ENVIRINMENT,
                    textStyle: headertext,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: 88,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            ImagePath.ENVIRONMENT_IMAGE)),
                                  )),
                            ),
                            SizedBox(width: 10),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getText(
                                    text: "Setting space for \nexcercise",
                                    textStyle: profilefieldtextStyle,
                                  ),
                                  SizedBox(height: 10),
                                  getText(
                                    text:
                                        "Your next self assessment \nis scheduled on the end of this \nmonth!",
                                    textStyle: info1style,
                                  ),
                                  SizedBox(height: 5),
                                  getText(
                                    text: "${Strings.READ} ${Strings.MORE}",
                                    textStyle: bluetext,
                                  )
                                ])
                          ]))
                ]))));
  }
}
