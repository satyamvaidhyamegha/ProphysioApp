// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../app_in_detail/pricedetail.dart';

class EmailSendSuccess extends StatefulWidget {
  const EmailSendSuccess({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EmailSendSuccessPageState();
  }
}

class _EmailSendSuccessPageState extends State<EmailSendSuccess> {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.PAGE_INDICATOR_ACTIVE_DOT_COLOR, AppColors.kBGcolor],
          )),
          child: Padding(
            padding: Margins.PAGE_CONTENT_MARGINS,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              verticalGap(context: context, screenSize: 0.15),
              Image.asset("assets/Group 80810.png"),
              verticalGap(context: context, screenSize: 0.05),
              Text(Strings.SEND_EMAIL,
                  textAlign: TextAlign.center, style: headerStyle),
              verticalGap(context: context, screenSize: 0.03),
              Padding(
                padding: Margins.PAGE_CONTENT_MARGINS,
                child: Text(
                  "Lorem ipsum dolor sit amet,\nconsectetuer adipiscing elit, sed diam\nnonummy nibh euismod tincidunt ut\nlaoreet dolore magna",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.subTextColor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 15),
        color: AppColors.kBGcolor,
        height: MediaQuery.of(context).size.height * 0.1,
        child: GestureDetector(
            onTap: () {
              
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProActive()));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: Raddi.buttonCornerRadius,
                    color: AppColors.buttonColor),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(Strings.CONTINUE,
                      textAlign: TextAlign.center, style: buttonTextStyle),
                ),
              ),
            )),
      ),
    );
  }
}
