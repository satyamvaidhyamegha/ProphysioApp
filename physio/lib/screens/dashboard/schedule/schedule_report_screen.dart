import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';

class ScheduleReport extends StatefulWidget {
  const ScheduleReport({super.key});

  @override
  State<ScheduleReport> createState() => _ScheduleReportState();
}

class _ScheduleReportState extends State<ScheduleReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: PreferredSize(
        //wrap with PreferredSize
        preferredSize: const Size.fromHeight(100),
        //height of appbar
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.02,
                    top: MediaQuery.of(context).size.height * 0.12,
                    bottom: MediaQuery.of(context).size.height * 0.0),
                child: getText(
                    text: 'Schedule',
                    textStyle: BaseStyles.scheduleHeaddingStyle),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.30,
                      top: MediaQuery.of(context).size.height * 0.12,
                      bottom: MediaQuery.of(context).size.width * 0.0,
                      right: MediaQuery.of(context).size.width * 0.02),
                  child: Row(children: [
                    IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_box_outlined),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ]))
            ],
          )
        ]),
      ),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.01,
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: getText(
                        text: 'Pending Requests',
                        textStyle: BaseStyles.pendingRequestStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.08),
                    child: getText(
                        text: '(22)',
                        textStyle: BaseStyles.pendingRequestStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.06,
                        right: MediaQuery.of(context).size.width * 0.04),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '25', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'May', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.02,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.24,
                                      right: MediaQuery.of(context).size.width *
                                          0.002),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.27,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          )
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '26', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'May', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.02,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.24,
                                      right: MediaQuery.of(context).size.width *
                                          0.002),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.27,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          )
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '27', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'May', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.02,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.24,
                                      right: MediaQuery.of(context).size.width *
                                          0.002),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.27,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          )
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.01,
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: getText(
                        text: '25 May, Today’s Sessions',
                        textStyle: BaseStyles.pendingRequestStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: getText(
                        text: '(22)',
                        textStyle: BaseStyles.pendingRequestStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.02,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '7:00', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.02,
                              right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'am', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.18,
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.28,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.02,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '8:00', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.02,
                              right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'am', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.18,
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.28,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.001,
                            left: MediaQuery.of(context).size.width * 0.02,
                            right: MediaQuery.of(context).size.width * 0.04,
                          ),
                          child: getText(
                              text: '9:00', textStyle: BaseStyles.dateStyle)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.001,
                              left: MediaQuery.of(context).size.width * 0.02,
                              right: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.1),
                          child: getText(
                              text: 'am', textStyle: BaseStyles.monthStyle)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.13)),
                  Card(
                      color: AppColors.schedulecard,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.001,
                                right:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: Row(
                              children: [
                                getText(
                                    text: 'Suraj Deshmukh, M 46',
                                    textStyle: BaseStyles.nameStyle),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.001,
                                      left: MediaQuery.of(context).size.width *
                                          0.18,
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: IconButton(
                                    icon: const Icon(Icons.videocam_outlined),
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: getText(
                                text: 'Wed, 12:00 pm - 1:00 pm',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.002,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.28,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.002),
                            child: getText(
                                text: 'Condition: Back and shoulder pain',
                                textStyle: BaseStyles.carddetailsStyle),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
