import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class AptRequested extends StatefulWidget {
  const AptRequested({super.key});

  @override
  State<AptRequested> createState() => _AptRequestedState();
}

var windowWidth;
var windowHeight;

class _AptRequestedState extends State<AptRequested> {
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08,
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: getText(
                        text: 'Apt Requested', textStyle: aboutYouText1)),
              ],
            ),
            verticalGap(context: context, screenSize: 0.04),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Row(
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        horizontalGap(context: context, screenSize: 0.02),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/DoctorImage.png"),
                                    fit: BoxFit.cover))),
                        horizontalGap(context: context, screenSize: 0.04),
                        Column(
                          children: [
                            verticalGap(context: context, screenSize: 0.04),
                            Row(
                              children: [
                                getParaText(
                                    text: 'Appointment',
                                    textStyle: professionProfileHeading1)
                              ],
                            ),
                            verticalGap(context: context, screenSize: 0.01),
                            Row(
                              children: [
                                getParaText(
                                    text: '3:00am - 4:00am',
                                    textStyle: subtitle2)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.004),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.04),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: '2',
                                textStyle: BaseStyles.appointmentDateStyle),
                            horizontalGap(context: context, screenSize: 0.01),
                            getText(text: 'Jun\nTue', textStyle: subtitle2),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.004),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.02),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.1),
                          IconButton(
                            icon: const Icon(CupertinoIcons.videocam),
                            color: Colors.blue,
                            onPressed: () {},
                            iconSize: 30,
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04),
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(children: [
              horizontalGap(context: context, screenSize: 0.04),
              getText(text: 'Patient', textStyle: infoStyle2),
            ]),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Row(children: [
                      Row(
                        children: [
                          verticalGap(context: context, screenSize: 0.01),
                          horizontalGap(context: context, screenSize: 0.02),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                        ],
                      ),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    color: AppColors.calenderColor2,
                    child: Row(children: [
                      Column(children: [
                        verticalGap(context: context, screenSize: 0.03),
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.002),
                                  child: getText(
                                      text: 'Prashant K [4-6,M]',
                                      textStyle: profilefieldtextStyle2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalGap(context: context, screenSize: 0.004),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.001,
                              ),
                              child: const Icon(
                                CupertinoIcons.phone,
                                color: Colors.blue,
                                size: 18.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.001,
                                left: MediaQuery.of(context).size.width * 0.001,
                                right: MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: getText(
                                  text: '+91 99498769', textStyle: subtitle2),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: 'Last Apt: 23rd April 2021',
                                textStyle: subtitle2),
                          ],
                        ),
                      ]),
                    ]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(children: [
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.038),
                          const Icon(
                            CupertinoIcons.videocam,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04),
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(children: [
              horizontalGap(context: context, screenSize: 0.04),
              getText(text: 'Complaint', textStyle: infoStyle2),
            ]),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 90,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(children: [
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.038),
                          getText(
                              text:
                                  'Ex: Not able to mark it due to family emergency',
                              textStyle: labletextStyle1)
                        ],
                      ),
                    ]),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04),
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(children: [
                      verticalGap(context: context, screenSize: 0.004),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.038),
                          IconButton(
                            icon: const Icon(Icons.swap_horiz_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                            iconSize: 30,
                          ),
                          getText(text: 'Shift', textStyle: numberText1),
                        ],
                      ),
                    ]),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.01),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 60,
                    color: AppColors.calenderColor2,
                    child: Column(children: [
                      verticalGap(context: context, screenSize: 0.025),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.blueColor, width: 2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0)),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: AppColors.blueColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Row(children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(text: 'Cancel', textStyle: numberText1),
                          ])
                        ],
                      ),
                    ]),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.01),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      color: AppColors.calenderColor2,
                    ),
                    child: Column(children: [
                      verticalGap(context: context, screenSize: 0.004),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.038),
                          IconButton(
                            icon: const Icon(CupertinoIcons.videocam),
                            color: Colors.blue,
                            onPressed: () {},
                            iconSize: 30,
                          ),
                          getText(text: 'Join', textStyle: numberText1)
                        ],
                      ),
                    ]),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04),
              ],
            ),
            verticalGap(context: context, screenSize: 0.07),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 145.0, vertical: 18.0),
                  shape: const StadiumBorder(),
                ),
                child: buttonText(
                    text: 'Submit',
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 18)),
                onPressed: () {}),
            verticalGap(context: context, screenSize: 0.02),
            ElevatedButton(
              onPressed: () {
                debugPrint('ElevatedButton Clicked');
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: AppColors.kBGcolor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 145.0, vertical: 18.0),
                side: const BorderSide(color: Colors.blue, width: 2),
              ),
              child: buttonText(
                  text: 'Decline',
                  textStyle: const TextStyle(color: Colors.blue, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
