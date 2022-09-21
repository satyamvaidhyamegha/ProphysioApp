import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:physio/BaseWidget/base_image_widget.dart';
import 'package:physio/constants/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage2 extends StatefulWidget {
  const SplashPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPage2PageState();
  }
}

class _SplashPage2PageState extends State<SplashPage2> {
  var windowWidth;
  var windowHeight;

  _startNextScreen() {
    Navigator.pushNamedAndRemoveUntil(context, "/about", (r) => false);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, checkUserLoggedIn);
  }

  void checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("userEmail");
    var userId = prefs.getInt('userId');
    debugPrint(email);
    print(userId);
    if (email != null) {
      Navigator.pushNamedAndRemoveUntil(context, "/welcomeuser", (r) => true);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/about", (r) => true);
    }
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
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.30,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image(
                        image: getAssetImage(
                      imagePath: ImagePath.SPLASH_SCREEN2,
                    )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10,
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: const SpinKitFadingCircle(
                          size: 60.0, color: Color(0xff007CE2)),
                    )),
              ]),
        ));
  }
}
