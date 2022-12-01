// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaymentSuccessPageState();
  }
}

class _PaymentSuccessPageState extends State<PaymentSuccess> {
  @override
  void initState() {
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
                        Text(Strings.PAYMENT_SUCCESS,
                            textAlign: TextAlign.center, style: headerStyle),
                        verticalGap(context: context, screenSize: 0.05),
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
