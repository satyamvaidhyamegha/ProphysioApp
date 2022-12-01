// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/model/chart_model/chart_model.dart';
import 'package:physio/patient/model/user_model/user_result.dart';
import 'package:physio/patient/screens/profiledetail/food_life_style_welcome.dart';
import 'package:physio/patient/services/Auth%20Service/user_details.dart';
import 'package:charts_flutter/flutter.dart' as charts;


import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/personal_info_summery_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class PersonalinfoSummery extends StatefulWidget {
  const PersonalinfoSummery({Key? key}) : super(key: key);

  @override
  State<PersonalinfoSummery> createState() => _PersonalinfoSummeryState();
}

class _PersonalinfoSummeryState extends State<PersonalinfoSummery> {
  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: 20,
      developers: 175,
    ),
    DeveloperSeries(
      year: 30,
      developers: 154,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
        id: "Developers",
        data: data,
        domainFn: (DeveloperSeries series, _) => series.year.toString(),
        measureFn: (DeveloperSeries series, _) => series.developers,
      )
    ];
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: AppColors.BACKGROUND_COLOR,
        leading: Container(
          padding: EdgeInsets.only(left: 40),
          child: getBackIconButton(context: context),
        ),
        title: getText(
            text: "Summary",
            textAlign: TextAlign.start,
            textStyle: TextStyle(fontSize: 18, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalGap(context: context, screenSize: 0.01),
              FutureBuilder<UserResult>(
                  future: UserDetailsApi().getUserData(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.image != null
                          ? Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data!.image.toString()),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage(ImagePath.PROFILE_ICON),
                                      fit: BoxFit.cover)));
                    } else {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage(ImagePath.PROFILE_ICON),
                                fit: BoxFit.cover)),
                      );
                    }
                  })),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PersonalInforText(
                        titleText: "Name",
                        subtitleText: snapshot.data!.name == null
                            ? ""
                            : snapshot.data!.name.toString(),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width);
                  } else {
                    return Text("Data Loading");
                  }
                },
              ),
              // verticalGap(context: context, screenSize: 0.02),
              // FutureBuilder<UserResult>(
              //   future: UserDetailsApi().getUserData(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return PersonalInforText(
              //           titleText: "Last Name",
              //           subtitleText: snapshot.data!.last_name == null
              //               ? ""
              //               : snapshot.data!.last_name.toString(),
              //           height: MediaQuery.of(context).size.height * 0.07,
              //           width: MediaQuery.of(context).size.width);
              //     } else {
              //       return Text("Data Loading");
              //     }
              //   },
              // ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<UserResult>(
                    future: UserDetailsApi().getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PersonalInforText(
                            widget: Icon(
                              Icons.expand_more,
                              color: AppColors.textColor,
                            ),
                            titleText: "Gender",
                            subtitleText: snapshot.data!.gender == null
                                ? ""
                                : snapshot.data!.gender.toString(),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.35);
                      } else {
                        return Text("Data Loading...");
                      }
                    },
                  ),
                  FutureBuilder<UserResult>(
                    future: UserDetailsApi().getUserData(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return PersonalInforText(
                            widget: Icon(
                              Icons.calendar_month,
                              color: AppColors.textColor,
                            ),
                            titleText: "Date Of Birth",
                            subtitleText: snap.data!.date_of_birth == null
                                ? ""
                                : snap.data!.date_of_birth.toString(),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.45);
                      } else {
                        return Text("Data Loading...");
                      }
                    },
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return PersonalInforText(
                        titleText: "profession",
                        subtitleText: snap.data!.designation == null
                            ? ""
                            : snap.data!.designation.toString(),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width);
                  } else {
                    return Text("Data Loading...");
                  }
                },
              ),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return PersonalInforText(
                        titleText: "Address",
                        subtitleText: snap.data!.address == null
                            ? ""
                            : snap.data!.address.toString(),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width);
                  } else {
                    return Text("Data Loading...");
                  }
                },
              ),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return PersonalInforText(
                        titleText: "Mobile",
                        subtitleText: snap.data!.phone == null
                            ? ""
                            : snap.data!.phone.toString(),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width);
                  } else {
                    return Text("Data Loading...");
                  }
                },
              ),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return PersonalInforText(
                        titleText: "Alternate Mobile No.",
                        subtitleText: snap.data!.phone2 == null
                            ? ""
                            : snap.data!.phone2.toString(),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width);
                  } else {
                    return Text("Data Loading...");
                  }
                },
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<UserResult>(
                    future: UserDetailsApi().getUserData(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return PersonalInforText(
                            titleText: "Height",
                            subtitleText: snap.data!.height == null
                                ? ""
                                : snap.data!.height.toString(),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.4);
                      } else {
                        return Text("Data Loading...");
                      }
                    },
                  ),
                  FutureBuilder<UserResult>(
                    future: UserDetailsApi().getUserData(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return PersonalInforText(
                            titleText: "Weight",
                            subtitleText: snap.data!.weight == null
                                ? ""
                                : snap.data!.weight.toString(),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.4);
                      } else {
                        return Text("Data Loading...");
                      }
                    },
                  ),
                ],
              ),
              verticalGap(context: context, screenSize: 0.02),
              FutureBuilder<UserResult>(
                future: UserDetailsApi().getUserData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return PersonalInforText(
                        widget: Icon(
                          Icons.expand_more,
                          color: Colors.white,
                        ),
                        titleText: "Blood Group",
                        subtitleText: snap.data!.blood_group == null
                            ? ""
                            : snap.data!.blood_group.toString(),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.45);
                  } else {
                    return Text("Data Loading....");
                  }
                },
              ),
              verticalGap(context: context, screenSize: 0.03),
              Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<UserResult>(
                    future: UserDetailsApi().getUserData(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return charts.BarChart(series);
                      } else {
                        return Text("Loadin Chart.....");
                      }
                    },
                  )),
              CustomButton(
                  onTap: () {
                    doNavigate(
                        route: FoodAndLifeStyleWelcome(), context: context);
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width),
              verticalGap(context: context, screenSize: 0.01),
              TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      Strings.LATER,
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              verticalGap(context: context, screenSize: 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
