import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class DecliningReason extends StatefulWidget {
  const DecliningReason({super.key});

  @override
  State<DecliningReason> createState() => _DecliningReasonState();
}

var windowWidth;
var windowHeight;

class _DecliningReasonState extends State<DecliningReason> {
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
            verticalGap(context: context, screenSize: 0.15),
            SizedBox(
              child: Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.calenderColor2,
                  ),
                  child: SizedBox(
                    child: Column(
                      children: [
                        verticalGap(context: context, screenSize: 0.02),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          getText(
                              text: 'Give reason for declining \nrequest:',
                              textStyle: subheadertext2)
                        ]),
                        verticalGap(context: context, screenSize: 0.04),
                        Row(children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/DoctorImage.png"),
                                      fit: BoxFit.cover))),
                          horizontalGap(context: context, screenSize: 0.04),
                          Column(children: [
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
                                  CupertinoIcons.phone,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                getParaText(
                                    text: '+91 99498769', textStyle: subtitle2)
                              ],
                            ),
                          ])
                        ]),
                        verticalGap(context: context, screenSize: 0.02),
                        Row(
                          children: [
                            horizontalGap(context: context, screenSize: 0.04),
                            getText(
                                text: '2',
                                textStyle: BaseStyles.appointmentDateStyle),
                            horizontalGap(context: context, screenSize: 0.02),
                            getText(text: 'Jun\nTue', textStyle: subtitle2),
                            horizontalGap(context: context, screenSize: 0.04),
                            verticalGap(context: context, screenSize: 0.01),
                            const Icon(
                              CupertinoIcons.videocam,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                            getText(
                                text: '10:00am - 11:00pm',
                                textStyle: subtitle2),
                          ],
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 5, left: 8, right: 8),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.2,
                                    left: MediaQuery.of(context).size.width *
                                        0.04,
                                    right: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  icon: const Icon(
                                    CupertinoIcons.mic,
                                  ),
                                  onPressed: () => {},
                                ),
                                hintText:
                                    'Ex: Not able to mark it due to family \nemergency',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 10),
                        ),
                        verticalGap(context: context, screenSize: 0.15),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 145.0, vertical: 18.0),
                              shape: const StadiumBorder(),
                            ),
                            child: buttonText(
                                text: 'Submit',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
