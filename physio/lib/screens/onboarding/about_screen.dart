// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/base_image_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';

//import 'package:physio/screens/Login/mobilelogin/login_screen.dart';
//import 'package:physio/screens/Login/mobilelogin/signup_screen.dart.dart';
//import 'package:physio/screens/Success%20Screen/register_success.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutPagePageState();
  }
}

class _AboutPagePageState extends State<AboutPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int slideIndex = 0;
  late Timer _timer;
  bool isLastPage = false;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(
          color: isCurrentPage
              ? AppColors.pageIndicatorActiveDotColor
              : AppColors.pageIndicatorInactiveDotColor,
          borderRadius: Raddi.k12px),
    );
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });

    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              slideIndex = index;
              isLastPage = index == 3;
            });
          },
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        getAssetImage(imagePath: ImagePath.ABOUT_SCREEN_IMAGE1),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        getText(
                            text: Strings.TAKE_THEIR_HELTH_TO,
                            textStyle: BaseStyles.textStyleForSilderScreen),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getText(
                                text: "health to the",
                                textStyle: BaseStyles.textStyleForSilderScreen),
                            SizedBox(width: 10),
                            getText(
                                text: "${Strings.NEXT} ${Strings.LAVEL}",
                                textStyle:
                                    BaseStyles.textStyleForSilderScreenw500),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ])),
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        getAssetImage(imagePath: ImagePath.ABOUT_SCREEN_IMAGE2),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.08,
                              left: 16),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            getText(
                                text: Strings.ONE_ON_ONE_WITH,
                                textStyle: BaseStyles.textStyleForSilderScreen),
                            getText(
                                text:
                                    "' Expert health professionals \n     + Deep Health Insights'",
                                textStyle:
                                    BaseStyles.textStyleForSilderScreenw500),
                          ],
                        ),
                      ),
                    ])),
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        getAssetImage(imagePath: ImagePath.ABOUT_SCREEN_IMAGE3),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08,
                          left: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        getText(
                            text:
                                "Hyper - Personalised \n       experience for  ",
                            textStyle: BaseStyles.textStyleForSilderScreen),
                        getText(
                            text: Strings.TRUE_WELLNESS,
                            textStyle: BaseStyles.textStyleForSilderScreenw500),
                      ],
                    ),
                  ),
                ])),
            Container(
                alignment: Alignment.topRight,
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        getAssetImage(imagePath: ImagePath.ABOUT_SCREEN_IMAGE4),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08,
                          left: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        getText(
                            text: 'Fast recovery though a',
                            textStyle: BaseStyles.textStyleForSilderScreen),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            getText(
                                text: '360 Approach',
                                textStyle:
                                    BaseStyles.textStyleForSilderScreenw500),
                            SizedBox(width: 10),
                            getText(
                                text: ' to health',
                                textStyle: BaseStyles.textStyleForSilderScreen)
                          ],
                        )
                      ],
                    ),
                  ),
                ])),
          ]),
      Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < 4; i++)
                  i == slideIndex
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),
              ]),
              Container(height: MediaQuery.of(context).size.height * 0.07),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 100,
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: getText(
                              text: Strings.SKIP,
                              textAlign: TextAlign.center,
                              textStyle: BaseStyles.skipTextStyle,
                            )),
                      ),
                    ),
                    isLastPage == false
                        ? GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginPage()));

                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.buttonColor),
                                child: Center(
                                  child: getText(
                                      textAlign: TextAlign.center,
                                      text: Strings.NEXT,
                                      textStyle: buttonTextStyle),
                                )),
                          )
                        : GestureDetector(
                            //    onTap: () {
                            //    Navigator.pushReplacement(
                            //        context,
                            //       MaterialPageRoute(
                            //            builder: (context) => SigninPage()));
                            // },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue),
                                child: Center(
                                  child: getText(
                                      textAlign: TextAlign.center,
                                      text: Strings.GET_STARTED,
                                      textStyle: buttonTextStyle),
                                )),
                          )
                  ]),
            ]),
      ),
    ]));
  }
}
