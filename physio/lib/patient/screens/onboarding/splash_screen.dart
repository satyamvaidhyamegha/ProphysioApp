// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';

import '../../../BaseWidget/base_image_widget.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPagePageState();
  }
}

class _SplashPagePageState extends State<SplashPage> {

  var windowWidth;
  var windowHeight;

_startNextScreen() {
    Navigator.pushNamedAndRemoveUntil(context, "/SplashPage2", (r) => false);
  }
 

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, _startNextScreen);
  }

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
        body: Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            AppColors.buttonColor,
            Color(0xFF005CB9),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30,
                    ),
                    child:  Image(
                      image: getAssetImage(imagePath: ImagePath.SPLASH_SCREEN1,)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                       getText(text:  Strings.PRO_PHYSIO,
                          textStyle: BaseStyles.proPhysio, ),
                       getText(text:  Strings.BELIEVE_YOU_CAN,
                          textStyle: BaseStyles.beliveYou,)
                      ],
                    ),
                  )
                ]),
          ))),
    ));
  }
}
