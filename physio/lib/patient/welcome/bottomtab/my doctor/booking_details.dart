// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:physio/patient/welcome/Self%20Assessment/self_assessment.dart';
import 'package:physio/patient/welcome/bottomtab/my%20doctor/data_model.dart';

import '../../../../BaseWidget/style.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../BaseWidget/vertical_devider.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allDoctorBackGroundColor,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 80,
          backgroundColor: AppColors.allDoctorBackGroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          title: getText(
              text: "Book in Appointment",
              textStyle: BaseStyles.appBarTextStyle),
          actions: [
            IconButton(
                onPressed: () {
                  doNavigate(route: SelfAssessmentScreen(), context: context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.PROFILE_CARD_COLOR),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/Raniya Sultana (Physiotherapist).png")),
                              )),
                          verticalGap(context: context, screenSize: 0.02),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.59,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: Margins.basePadding.copyWith(
                                          top: 10, bottom: 0, left: 20),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getText(
                                            text: "Dr. Roma Des…",
                                            textStyle: profilefieldtextStyle,
                                          ),
                                          verticalGap(
                                              context: context,
                                              screenSize: 0.005),
                                          getText(
                                            text: "MBBS, Movements Specialist",
                                            textStyle: iconlablecolor,
                                          ),
                                          verticalGap(
                                              context: context,
                                              screenSize: 0.005),
                                          getText(
                                            text:
                                                "Manipal Hospital, Indira Nagar",
                                            textStyle: iconlablecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 10,
                                        unratedColor: Colors.grey,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: AppColors.yellowColor),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey[700],
                                  indent: 0,
                                  endIndent: 0,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child:
                                          Text(Strings.CALL, style: bluetext1),
                                    ),
                                    verticalDevider(),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(Strings.MESSAGE,
                                          style: bluetext1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: getText(
                      text: "Available Slots",
                      textStyle: profilefieldtextStyle.copyWith(
                          fontSize: 22,
                          color: Color.fromRGBO(235, 235, 245, 0.6))),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child:
                      getText(text: "Today", textStyle: profilefieldtextStyle),
                ),
                Column(
                  children: DataModel.todayTimeSlot.map((e) {
                    return Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: Center(
                          child: Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.07),
                              Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                              horizontalGap(context: context, screenSize: 0.03),
                              getText(
                                  text: e['time'],
                                  textStyle: profilefieldtextStyle),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Book",
                                    style: TextStyle(fontSize: 16),
                                  )),
                              horizontalGap(context: context, screenSize: 0.04)
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: getText(
                      text: "Tomorrow", textStyle: profilefieldtextStyle),
                ),
                Column(
                  children: DataModel.tomorrowTimeSlot.map((e) {
                    return Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: Center(
                          child:Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.07),
                              Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                               horizontalGap(context: context, screenSize: 0.03),
                              getText(
                                  text: e['time'],
                                  textStyle: profilefieldtextStyle),
                                  Spacer(),
                                  TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Book",
                                    style: TextStyle(fontSize: 16),
                                  )),
                                  horizontalGap(context: context, screenSize: 0.04)
                              
                            ],
                             
                               
                              ),)
                      ),
                    );
                  }).toList(),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Padding(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: getText(
                      text: "3 June, 2022", textStyle: profilefieldtextStyle),
                ),
                Column(
                  children: DataModel.tomorrowTimeSlot.map((e) {
                    return Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: Center(
                          child: Row(
                            children: [
                              horizontalGap(context: context, screenSize: 0.07),
                              Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                               horizontalGap(context: context, screenSize: 0.03),
                              getText(
                                  text: e['time'],
                                  textStyle: profilefieldtextStyle),
                                  Spacer(),
                                  TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Book",
                                    style: TextStyle(fontSize: 16),
                                  )),
                                  horizontalGap(context: context, screenSize: 0.04)
                              
                            ],
                             
                               
                              ),)
                      ),
                    );
                  }).toList(),
                ),
              ]),
              verticalGap(context: context, screenSize: 0.03),
              Container(
                  padding: Margins.PAGE_CONTENT_MARGINS,
                  child: Row(
                    children: [
                      getText(
                          text: "Looking for different slots?",
                          textStyle:
                              profilefieldtextStyle.copyWith(fontSize: 12)),
                      getText(
                          text: "Check Availability",
                          textStyle: profilefieldtextStyle.copyWith(
                              color: Colors.blue, fontSize: 12)),
                    ],
                  )),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "other physics",
                      textStyle: profilefieldtextStyle.copyWith(fontSize: 12)),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.PROFILE_CARD_COLOR,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText(
                                text: "Rate",
                                textStyle: profilefieldtextStyle.copyWith(
                                    fontWeight: FontWeight.bold)),
                            verticalGap(context: context, screenSize: 0.002),
                            getText(
                                text: "Dr. Roma Desouza",
                                textStyle: profilefieldtextStyle.copyWith(
                                    fontSize: 14)),
                          ],
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 12,
                              unratedColor: Colors.grey,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            verticalGap(context: context, screenSize: 0.002),
                            getText(
                                text: "176 Reviews",
                                textStyle: profilefieldtextStyle.copyWith(
                                    fontSize: 11))
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ))
                      ],
                    )),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.PROFILE_CARD_COLOR,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: Margins.PAGE_CONTENT_MARGINS,
                      child: Row(
                        children: [
                          getText(
                              text: "Clinic info",
                              textStyle: profilefieldtextStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          verticalGap(context: context, screenSize: 0.05),
                          Spacer(),
                          getText(
                              text: "3.5 km",
                              textStyle:
                                  profilefieldtextStyle.copyWith(fontSize: 11)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )),
              ),
              verticalGap(context: context, screenSize: 0.05),
            ],
          ),
        ));
  }
}
