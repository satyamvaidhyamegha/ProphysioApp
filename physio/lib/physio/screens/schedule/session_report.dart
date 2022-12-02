import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/schedule/satisfaction.dart';
import 'package:physio/utility/gap_between.dart';

class SessionReport extends StatefulWidget {
  const SessionReport({super.key});

  @override
  State<SessionReport> createState() => _SessionReportState();
}

class _SessionReportState extends State<SessionReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        title: Row(children: [
          horizontalGap(context: context, screenSize: 0.001),
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SessionReport()),
            ),
          ),
          horizontalGap(context: context, screenSize: 0.04),
          getText(text: 'Session Report', textStyle: BaseStyles.sessionreport),
          horizontalGap(context: context, screenSize: 0.29),
          IconButton(
            icon: const Icon(CupertinoIcons.share_up),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
        ]),
      ),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    var painRecoveryRating = 0;
    bool isButtonPressed1 = true;

    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalGap(context: context, screenSize: 0.03),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'Ashish Mehta, M 67',
                    textStyle: BaseStyles.sessionName),
              ],
            ),
            Column(
              children: [
                horizontalGap(context: context, screenSize: 0.03),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.calendar_month_outlined),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    getText(
                        text: '25 April, 2021',
                        textStyle: BaseStyles.monthStyletext),
                    horizontalGap(context: context, screenSize: 0.04),
                    IconButton(
                      icon: const Icon(Icons.videocam_outlined),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    getText(
                        text: 'Online', textStyle: BaseStyles.monthStyletext),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.access_time_outlined),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    getText(
                        text: '9:00 am - 10:30 am, 1:30 Mins',
                        textStyle: BaseStyles.monthStyletext),
                  ],
                ),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10,
                      child: IconButton(
                        iconSize: 15,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.currency_rupee_rounded),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                    horizontalGap(context: context, screenSize: 0.03),
                    getText(text: '500', textStyle: BaseStyles.monthStyletext),
                  ],
                )
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            horizontalGap(context: context, screenSize: 0.02),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                side: BorderSide(
                  color: Colors.black87.withOpacity(0.2),
                  width: 2,
                ),
              ),
              shadowColor: Colors.black87,
              color: AppColors.kBGcolor,
              child: Padding(
                padding: Margins.basePadding,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.02),
                      getText(
                        text: "Patient Satisfaction",
                        textStyle: profilefieldtextStyle3,
                      ),
                      verticalGap(context: context, screenSize: 0.04),
                      horizontalGap(context: context, screenSize: 0.2),
                      getText(
                        text:
                            "   How was the patient satisfaction after \n   the session??",
                        textStyle: profilefieldtextStyle2,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SatisfactionWidget(
                                imagePath: ImagePath.GREAT_WEL_ICON,
                                name: Strings.GREAT,
                                textColor: (painRecoveryRating == 5)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.GOOD_WEL_ICON,
                                name: Strings.GOOD,
                                textColor: (painRecoveryRating == 4)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.FINE_WEL_ICON,
                                name: Strings.FINE,
                                textColor: (painRecoveryRating == 3)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.MEH_WEL_ICON,
                                name: Strings.MEH,
                                textColor: (painRecoveryRating == 2)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.TERRIBLE_WEL_ICON,
                                name: Strings.TERRIBLE,
                                textColor: (painRecoveryRating == 1)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Recovery', textStyle: profilefieldtextStyle3),
              ],
            ),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.06),
                verticalGap(context: context, screenSize: 0.05),
                getText(
                    text: 'Is patient on a path to recovery?',
                    textStyle: profilefieldtextStyle2),
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.08),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.blue),
                  ),
                  // ignore: sort_child_properties_last

                  child: Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.06),
                      const Icon(Icons.check_circle, color: Colors.blue),
                      verticalGap(context: context, screenSize: 0.06),
                      horizontalGap(context: context, screenSize: 0.06),
                      getText(text: 'Yes', textStyle: yesButtonText),
                      horizontalGap(context: context, screenSize: 0.08),
                    ],
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.08),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: IconButton(
                          iconSize: 15,
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close),
                          color: Colors.black,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog2(context),
                            );
                          },
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.06),
                      getText(text: 'No', textStyle: yesButtonText),
                      horizontalGap(context: context, screenSize: 0.08),
                      verticalGap(context: context, screenSize: 0.06)
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                verticalGap(context: context, screenSize: 0.08),
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'Session Notes', textStyle: profilefieldtextStyle3),
              ],
            ),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.06),
                getText(
                    text:
                        'What are the key observations that \nneed attention or followup?',
                    textStyle: profilefieldtextStyle2),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                autofocus: false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(50),
                    labelStyle: headertext,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    fillColor: Colors.black),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            horizontalGap(context: context, screenSize: 0.08),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                side: BorderSide(
                  color: Colors.black87.withOpacity(0.2),
                  width: 1,
                ),
              ),
              shadowColor: Colors.black87,
              color: AppColors.kBGcolor,
              child: Padding(
                  padding: Margins.basePadding,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: TextButton(
                          style: TextButton.styleFrom(primary: Colors.blue
                              // foreground
                              ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog3(context),
                            );
                          },
                          child: getText(text: 'Cancel', textStyle: cancel),
                        )),
                        verticalGap(context: context, screenSize: 0.02),
                        horizontalGap(context: context, screenSize: 0.8),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 145.0, vertical: 18.0),
                              shape: const StadiumBorder(),
                            ),
                            child: buttonText(
                                text: 'Submit', textStyle: sessionSubmit),
                            onPressed: () async {
                              setState(() {
                                isButtonPressed1 = !isButtonPressed1;

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog1(context),
                                );
                              });
                            },
                          ),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        horizontalGap(context: context, screenSize: 0.04)
                      ])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7),
          ),
          BlurryContainer(
            blur: 100,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    ),
                    color: AppColors.kBGcolor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          verticalGap(context: context, screenSize: 0.07),
                          horizontalGap(context: context, screenSize: 0.06),
                          getText(text: 'Upload Form', textStyle: share),
                          horizontalGap(context: context, screenSize: 0.48),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.textColor, width: 2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0)),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.03),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: GestureDetector(
                                  child: Image.asset(
                                'assets/mssg.png',
                                height: 50,
                                width: 50,
                              ))),
                          horizontalGap(context: context, screenSize: 0.02),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: GestureDetector(
                                  child: Image.asset(
                                'assets/gmail.png',
                                height: 50,
                                width: 50,
                              ))),
                          horizontalGap(context: context, screenSize: 0.02),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: GestureDetector(
                                  child: Image.asset(
                                'assets/WhatsApp.png',
                                height: 50,
                                width: 50,
                              ))),
                          horizontalGap(context: context, screenSize: 0.02),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: GestureDetector(
                                  child: Image.asset(
                                'assets/Tele.png',
                                height: 50,
                                width: 50,
                              ))),
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog1(BuildContext context) {
    return SingleChildScrollView(
        child: BlurryContainer(
            child: Column(children: [
      verticalGap(context: context, screenSize: 0.2),
      BlurryContainer(
        blur: 100,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0),
                  bottomRight: Radius.circular(22.0),
                ),
                color: AppColors.kBGcolor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      verticalGap(context: context, screenSize: 0.08),
                      horizontalGap(context: context, screenSize: 0.80),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.textColor, width: 2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.textColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  verticalGap(context: context, screenSize: 0.01),
                  Row(
                    children: [
                      Center(
                        child: getText(
                            text:
                                '         Session report shared and \n        a notification has been sent \n                         to patient',
                            textStyle: popup),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.3),
                      Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/DoctorImage.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.25),
                      getText(
                          text: 'Ashish Mehta (M, 67)',
                          textStyle: sessionSubmit)
                    ],
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.25),
                      getText(
                          text: 'Last session - 12/2/22',
                          textStyle: popupcontent1)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }

  Widget _buildPopupDialog2(BuildContext context) {
    return SingleChildScrollView(
        child: BlurryContainer(
            child: Column(children: [
      verticalGap(context: context, screenSize: 0.2),
      BlurryContainer(
        blur: 100,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0),
                  bottomRight: Radius.circular(22.0),
                ),
                color: AppColors.kBGcolor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      verticalGap(context: context, screenSize: 0.08),
                      horizontalGap(context: context, screenSize: 0.80),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.textColor, width: 2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.textColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  verticalGap(context: context, screenSize: 0.04),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.3),
                      Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/DoctorImage.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          )),
                    ],
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.20),
                      getText(
                          text: 'Prashant. K [M]', textStyle: subheadertext1)
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.25),
                          IconButton(
                            icon: const Icon(Icons.call_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                            iconSize: 25,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.00),
                          getText(
                              text: '+91 99498769', textStyle: popupcontent1)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.25),
                      getText(text: 'Has been notified', textStyle: popup)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }

  Widget _buildPopupDialog3(BuildContext context) {
    return SingleChildScrollView(
        child: BlurryContainer(
            child: Column(children: [
      verticalGap(context: context, screenSize: 0.2),
      BlurryContainer(
        blur: 70,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 320,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                  bottomLeft: Radius.circular(22.0),
                  bottomRight: Radius.circular(22.0),
                ),
                color: AppColors.kBGcolor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      verticalGap(context: context, screenSize: 0.05),
                      horizontalGap(context: context, screenSize: 0.80),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.textColor, width: 2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: AppColors.textColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        horizontalGap(context: context, screenSize: 0.40),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 30,
                          child: IconButton(
                            iconSize: 30,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.done),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalGap(context: context, screenSize: 0.02),
                  verticalGap(context: context, screenSize: 0.02),
                  Row(children: [
                    horizontalGap(context: context, screenSize: 0.33),
                    getText(
                        text: 'Apt Accepted', textStyle: profilefieldtextStyle4)
                  ]),
                  verticalGap(context: context, screenSize: 0.01),
                  Container(
                    height: 0.10,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  verticalGap(context: context, screenSize: 0.01),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.36),
                      getText(
                          text: '2',
                          textStyle: BaseStyles.appointmentDateStyle),
                      horizontalGap(context: context, screenSize: 0.02),
                      getText(text: 'Jun\nTue', textStyle: subtitle2),
                      horizontalGap(context: context, screenSize: 0.02),
                      verticalGap(context: context, screenSize: 0.002),
                      const Icon(
                        Icons.videocam_outlined,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                    ],
                  ),
                  getText(text: '10:00am - 11:00pm', textStyle: subtitle2),
                  verticalGap(context: context, screenSize: 0.01),
                  Container(
                    height: 0.05,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.25),
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
                          verticalGap(context: context, screenSize: 0.008),
                          Row(
                            children: [
                              getParaText(
                                  text: 'Prashant K [M]',
                                  textStyle: professionProfileHeading1)
                            ],
                          ),
                          verticalGap(context: context, screenSize: 0.01),
                          Row(
                            children: [
                              const Icon(
                                Icons.call_outlined,
                                color: Colors.blue,
                                size: 20.0,
                              ),
                              getParaText(
                                  text: '+91 99498769', textStyle: subtitle2)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}
