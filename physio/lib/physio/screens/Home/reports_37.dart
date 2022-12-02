import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/dashboard/schedule/mycare_27.dart';
import 'package:physio/physio/screens/schedule/satisfaction.dart';
import 'package:physio/physio/screens/schedule/session_report.dart';
import 'package:physio/utility/gap_between.dart';

// ignore: camel_case_types
class reports_37 extends StatefulWidget {
  const reports_37({super.key});

  @override
  State<reports_37> createState() => _reports_37State();
}

// ignore: camel_case_types
class _reports_37State extends State<reports_37> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 29, 30, 1),
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          horizontalGap(context: context, screenSize: 0.001),
          Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyCare_27()),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.textColor,
              ),
            ),
          ),
          horizontalGap(context: context, screenSize: 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 0,
                child: getText(
                    text: 'Session Report',
                    textStyle: BaseStyles.sessionreport),
              ),
              horizontalGap(context: context, screenSize: 0.45),
              Expanded(
                flex: 0,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                  child: const Icon(
                    IconlyLight.upload,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    var patientFeedback = 0;
    bool isButtonPressed1 = true;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalGap(context: context, screenSize: 0.03),
          Row(
            children: [
              horizontalGap(context: context, screenSize: 0.04),
              getText(
                  text: 'Ashish Mehta, M 67',
                  textStyle: BaseStyles.sessionName),
            ],
          ),
          verticalGap(context: context, screenSize: 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              horizontalGap(context: context, screenSize: 0.03),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      IconlyLight.calendar,
                      color: Colors.blue,
                    ),
                  ),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(
                      text: '25 April, 2021',
                      textStyle: BaseStyles.monthStyletext),
                  horizontalGap(context: context, screenSize: 0.04),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      IconlyLight.video,
                      color: Colors.blue,
                    ),
                  ),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(text: 'Online', textStyle: BaseStyles.monthStyletext),
                ],
              ),
              verticalGap(context: context, screenSize: 0.01),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      IconlyLight.time_circle,
                      color: Colors.blue,
                    ),
                  ),
                  horizontalGap(context: context, screenSize: 0.02),
                  getText(
                      text: '9:00 am - 10:30 am, 1:30 Mins',
                      textStyle: BaseStyles.monthStyletext),
                ],
              ),
              verticalGap(context: context, screenSize: 0.01),
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.047),
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
          const Divider(
            color: Color.fromRGBO(54, 54, 56, 0.65),
            thickness: 1.5,
          ),
          verticalGap(context: context, screenSize: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              horizontalGap(context: context, screenSize: 0.055),
              getText(
                  text: 'Patient Compliance',
                  textStyle: profilefieldtextStyle3),
            ],
          ),
          verticalGap(context: context, screenSize: 0.02),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                side: BorderSide(
                  color: Colors.black87.withOpacity(0.2),
                  width: 2,
                ),
              ),
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
              color: const Color.fromRGBO(28, 28, 30, 1),
              child: Padding(
                padding: Margins.basePadding,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.01),
                      Row(children: [
                        getText(
                          text: "How complaint was the patient?",
                          textStyle: profilefieldtextStyle2,
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SatisfactionWidget(
                                imagePath: ImagePath.GREAT_WEL_ICON,
                                name: Strings.GREAT,
                                textColor: (patientFeedback == 5)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.GOOD_WEL_ICON,
                                name: Strings.GOOD,
                                textColor: (patientFeedback == 4)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.FINE_WEL_ICON,
                                name: Strings.FINE,
                                textColor: (patientFeedback == 3)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.MEH_WEL_ICON,
                                name: Strings.MEH,
                                textColor: (patientFeedback == 2)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.TERRIBLE_WEL_ICON,
                                name: Strings.TERRIBLE,
                                textColor: (patientFeedback == 1)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                horizontalGap(context: context, screenSize: 0.055),
                getText(text: 'Recovery', textStyle: profilefieldtextStyle3),
              ]),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Container(
                  width: 180,
                  height: 45,
                  child: OutlinedButton(
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
                ),
                horizontalGap(context: context, screenSize: 0.04),
                Container(
                  width: 180,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2.0, color: Colors.white),
                    ),
                    child: Row(
                      children: [
                        horizontalGap(context: context, screenSize: 0.08),
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(117, 117, 117, 1),
                          radius: 10,
                          child: IconButton(
                            iconSize: 15,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.close),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        horizontalGap(context: context, screenSize: 0.06),
                        getText(text: 'No', textStyle: yesButtonText),
                        horizontalGap(context: context, screenSize: 0.08),
                        verticalGap(context: context, screenSize: 0.06)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          verticalGap(context: context, screenSize: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              horizontalGap(context: context, screenSize: 0.06),
              getText(
                  text: 'Patient Satisfaction',
                  textStyle: profilefieldtextStyle3),
            ],
          ),
          verticalGap(context: context, screenSize: 0.02),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                side: BorderSide(
                  color: Colors.black87.withOpacity(0.2),
                  width: 2,
                ),
              ),
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
              color: const Color.fromRGBO(28, 28, 30, 1),
              child: Padding(
                padding: Margins.basePadding,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.01),
                      Row(children: [
                        getText(
                          text:
                              "How was the patient satisfaction after the \nsession?",
                          textStyle: profilefieldtextStyle2,
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SatisfactionWidget(
                                imagePath: ImagePath.GREAT_WEL_ICON,
                                name: Strings.GREAT,
                                textColor: (patientFeedback == 5)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.GOOD_WEL_ICON,
                                name: Strings.GOOD,
                                textColor: (patientFeedback == 4)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.FINE_WEL_ICON,
                                name: Strings.FINE,
                                textColor: (patientFeedback == 3)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.MEH_WEL_ICON,
                                name: Strings.MEH,
                                textColor: (patientFeedback == 2)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                            SatisfactionWidget(
                                imagePath: ImagePath.TERRIBLE_WEL_ICON,
                                name: Strings.TERRIBLE,
                                textColor: (patientFeedback == 1)
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              horizontalGap(context: context, screenSize: 0.055),
              getText(text: 'Session Notes', textStyle: profilefieldtextStyle3)
            ],
          ),
          verticalGap(context: context, screenSize: 0.02),
          Row(
            children: [
              horizontalGap(context: context, screenSize: 0.06),
              getText(
                  text:
                      'the patient satisfaction after the session sed do\neiusmod tempor incididunt ut labore et dolore\nmagna aliqua. Ut enim ad minim veniam, quis\nnostrud exercitation',
                  textStyle: profilefieldtextStyle2),
            ],
          ),
          verticalGap(context: context, screenSize: 0.03)
        ]),
      ),
    );
  }
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
                    verticalGap(context: context, screenSize: 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // horizontalGap(context: context, screenSize: 0.03),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: GestureDetector(
                                child: Image.asset(
                              'assets/mssg.png',
                              height: 50,
                              width: 50,
                            ))),
                        // horizontalGap(context: context, screenSize: 0.02),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: GestureDetector(
                                child: Image.asset(
                              'assets/gmail.png',
                              height: 50,
                              width: 50,
                            ))),
                        // horizontalGap(context: context, screenSize: 0.02),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: GestureDetector(
                                child: Image.asset(
                              'assets/WhatsApp.png',
                              height: 50,
                              width: 50,
                            ))),
                        // horizontalGap(context: context, screenSize: 0.02),
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
