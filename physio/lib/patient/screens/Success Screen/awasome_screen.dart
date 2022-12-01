// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';

class AwsomeScreen extends StatefulWidget {
  VoidCallback voidCallback;
  AwsomeScreen({Key? key, required this.voidCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AwsomeScreenPageState();
  }
}

class _AwsomeScreenPageState extends State<AwsomeScreen> {
  final TextEditingController emailcontroller = TextEditingController();

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                gradient: RadialGradient(
                                  // center: Alignment(1, 1), // near the top right
                                  // radius: 30,
                                  colors: <Color>[
                                    Color.fromARGB(
                                        255, 66, 193, 96), // yellow sun
                                    //Color(0xff00BF2C),
                                    AppColors.kBGcolor // blue sky
                                  ],
                                  //stops: <double>[5, 5],
                                )),
                            child: Image.asset(ImagePath.SUCCESSFULL_TICK)),
                        //verticalGap(context: context, screenSize: 0.2),
                        Text(Strings.AWESOME_TEXT,
                            textAlign: TextAlign.center, style: headerStyle),
                        verticalGap(context: context, screenSize: 0.05),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetuer",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "adipiscing elit, sed diam nonummy nibh",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "euismod tincidunt ut laoreet dolore magna",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              // GestureDetector(
              //     onTap: widget.voidCallback,
              //     child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         height: MediaQuery.of(context).size.height * 0.08,
              //         decoration: BoxDecoration(
              //             borderRadius: Raddi.buttonCornerRadius,
              //             color: Color(0Xff007CE2)),
              //         child: Container(
              //           alignment: Alignment.center,
              //           child: const Text(Strings.CONTINUE,
              //               textAlign: TextAlign.center,
              //               style: buttonTextStyle),
              //         ),
              //       ),
              //     )),
              // verticalGap(context: context, screenSize: 0.02)

              TextButton(
                  onPressed: widget.voidCallback,
                  child: Text(
                    Strings.CONTINUE,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    textScaleFactor: 1.2,
                  )),
              verticalGap(context: context, screenSize: 0.02)
            ],
          ),
        ));
  }
}
