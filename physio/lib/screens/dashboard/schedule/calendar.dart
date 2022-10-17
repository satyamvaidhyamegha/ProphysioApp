import 'dart:async';

import 'package:flutter/material.dart';

import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

import '../../../constants/colors.dart';

class Calenderappointmant extends StatefulWidget {
  const Calenderappointmant({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Calendars();
  }
}

class _Calendars extends State<Calenderappointmant> {
  final _calendarControllerToday = AdvancedCalendarController.today();

  final List<DateTime> events = [
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.calenderColor2,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pushReplacement,
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.calenderColor2,
            child: Column(children: [
              Expanded(
                  flex: 10,
                  child: Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(
                          right: 2, left: 2, bottom: 5, top: 10),
                      child: getText(
                          textAlign: TextAlign.center,
                          text: "Calendar",
                          textStyle: calendar),
                      transformAlignment: Alignment.topRight,
                    ),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 5, left: 5, bottom: 40, top: 1),
                        color: AppColors.calenderColor,
                        child: AdvancedCalendar(
                          controller: _calendarControllerToday,
                          events: events,
                          startWeekDay: 1,
                        ),
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.0,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                  // bottom:
                                  //     MediaQuery.of(context).size.width * 0.03
                                ),
                                child: getText(
                                    text: '10:00',
                                    textStyle: BaseStyles.dateStyle)),
                            Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.0,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                  // right:
                                  //     MediaQuery.of(context).size.width * 0.07,
                                  // bottom:
                                  //     MediaQuery.of(context).size.width * 0.1
                                ),
                                child: getText(
                                    text: 'am',
                                    textStyle: BaseStyles.monthStyle)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.0,
                              bottom: MediaQuery.of(context).size.height * 0.0),
                        ),
                        Card(
                            color: AppColors.schedulebg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.001,
                                ),
                                child: Row(
                                  children: [
                                    getText(
                                        text: 'Kantay Roy, F 46',
                                        textStyle: BaseStyles.name),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.08,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.002),
                                      child: IconButton(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0,
                                            left:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.008,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.002,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        icon:
                                            const Icon(Icons.videocam_outlined),
                                        color: Colors.blue,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]))
                      ]),
                      Row(children: [
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.04,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07,
                                  // bottom:
                                  //     MediaQuery.of(context).size.width * 0.03
                                ),
                                child: getText(
                                    text: '12:00',
                                    textStyle: BaseStyles.dateStyle)),
                            Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.0,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                  right:
                                      MediaQuery.of(context).size.width * 0.0,
                                  // bottom:
                                  //     MediaQuery.of(context).size.width * 0.1
                                ),
                                child: getText(
                                    text: 'pm',
                                    textStyle: BaseStyles.monthStyle)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.0,
                              bottom: MediaQuery.of(context).size.height * 0.0),
                        ),
                        Card(
                            color: AppColors.schedulebg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.001,
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.001,
                                ),
                                child: Row(
                                  children: [
                                    getText(
                                        text: 'Kantay Roy, F 46',
                                        textStyle: BaseStyles.name),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.08,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.002),
                                      child: IconButton(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0,
                                            left:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.008,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.002,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        icon:
                                            const Icon(Icons.videocam_outlined),
                                        color: Colors.blue,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]))
                      ]),
                    ]),
                    Row(children: [
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.04,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.07,
                                // bottom:
                                //     MediaQuery.of(context).size.width * 0.03
                              ),
                              child: getText(
                                  text: '02:00',
                                  textStyle: BaseStyles.dateStyle)),
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.0,
                                left: MediaQuery.of(context).size.width * 0.02,
                                // right:
                                //     MediaQuery.of(context).size.width * 0.07,
                                // bottom:
                                //     MediaQuery.of(context).size.width * 0.1
                              ),
                              child: getText(
                                  text: 'pm',
                                  textStyle: BaseStyles.monthStyle)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.0,
                            bottom: MediaQuery.of(context).size.height * 0.0),
                      ),
                      Card(
                          color: AppColors.schedulebg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                              ),
                              child: Row(
                                children: [
                                  getText(
                                      text: 'Kantay Roy, F 46',
                                      textStyle: BaseStyles.name),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.002),
                                    child: IconButton(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.008,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.002,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      icon: const Icon(Icons.videocam_outlined),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]))
                    ]),
                  ]))
            ])));
  }
}
