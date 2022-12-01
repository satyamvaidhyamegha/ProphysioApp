// ignore_for_file: unnecessary_new, prefer_const_constructors


import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';

class SubscriptinSuccessScreen extends StatefulWidget {
  const SubscriptinSuccessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SubscriptinSuccessScreenPageState();
  }
}

class _SubscriptinSuccessScreenPageState
    extends State<SubscriptinSuccessScreen> {
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(ImagePath.SUCCESSFULL_TICK),
                        verticalGap(context: context, screenSize: 0.2),
                        Text(Strings.SUBSCRIPTION_THAN_TEXT,
                            textAlign: TextAlign.center,
                            style: headerStyle.copyWith(letterSpacing: 2)),
                        verticalGap(context: context, screenSize: 0.05),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh \neuismod tincidunt ut laoreet dolore magna",
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
              TextButton(
                  onPressed: () {},
                  child: Text("Continue",
                      style: headerStyle.copyWith(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold))),
              verticalGap(context: context, screenSize: 0.02)
            ],
          ),
        ));
  }
}
