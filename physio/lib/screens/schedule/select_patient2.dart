import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/search_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class SelectP extends StatefulWidget {
  const SelectP({super.key});

  @override
  State<SelectP> createState() => _SelectPState();
}

var windowWidth;
var windowHeight;

class _SelectPState extends State<SelectP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        title: Row(children: [
          Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {})),
          horizontalGap(context: context, screenSize: 0.02),
          getText(text: 'Session Report', textStyle: BaseStyles.sessionreport),
        ]),
      ),
      body: initScreen(context),
      bottomNavigationBar: SizedBox(
          height: 90,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 146.0, vertical: 20.0),
                      shape: const StadiumBorder(),
                    ),
                    child: buttonText(text: 'Next', textStyle: buttonTextStyle),
                    onPressed: () {}),
                verticalGap(context: context, screenSize: 0.02)
              ])),
    );
  }

  initScreen(BuildContext context) {
    final TextEditingController myCareSearch = TextEditingController();
    ScrollController mycontroller1 = ScrollController();
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: ListView(
            scrollDirection: Axis.vertical,
            controller: mycontroller1,
            addAutomaticKeepAlives: true,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.02),
                      SearchWidget(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          iconSize: 28,
                          icon: const Icon(
                            IconlyLight.filter_2,
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(IconlyLight.search,
                                color: Color(0xff9E9EA5))),
                        //controller: myCareSearch,
                        hintText: 'Search Patient',
                        inputAction: TextInputAction.search,
                        controller: myCareSearch,
                      ),
                      verticalGap(context: context, screenSize: 0.03),
                      Row(children: [
                        getText(text: 'Available Slots', textStyle: infoStyle3),
                        horizontalGap(context: context, screenSize: 0.28),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.filter,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.calendar,
                            color: Colors.white,
                          ),
                        )
                      ]),
                      verticalGap(context: context, screenSize: 0.01),
                      getText(text: 'Today', textStyle: profilefieldtextStyle),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                          text: '2 June, 2020',
                          textStyle: profilefieldtextStyle),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                          text: '3 June, 2020',
                          textStyle: profilefieldtextStyle),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                          text: '4 June, 2020',
                          textStyle: profilefieldtextStyle),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                      verticalGap(context: context, screenSize: 0.03),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.kBGcolor),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 28,
                                icon: const Icon(
                                  IconlyLight.video,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.002,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: "10:00-11:00 am",
                                  textStyle: profilefieldtextStyle),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: getText(
                                  textAlign: TextAlign.left,
                                  text: 'Book',
                                  textStyle: pushNot),
                            ),
                          ])),
                    ]),
              ),
            ]));
  }
}
