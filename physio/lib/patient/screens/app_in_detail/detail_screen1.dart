// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/app_in_detail/detail_screen2.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPagePageState();
  }
}

class _DetailPagePageState extends State<DetailPage> {
  @override
  void initState() {
    setState(() {});

    super.initState();
    userToken();
  }

  void userToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userToken = prefs.getString('userToken');
    var userId = prefs.getInt('userId');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: AppColors.kBGcolor,
          body: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getBackIconButton(context: context),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationEnablePage()));
                                  },
                                  child: getText(
                                    text: Strings.SKIP,
                                    textStyle: BaseStyles.skipTextStyle,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.50,
                            ),
                            child: getText(
                                text:
                                    "${Strings.HELP_UP_TO} \n${Strings.HELP_YOU}!",
                                textStyle: BaseStyles.headingTextStyle)),
                        const SizedBox(height: 20),
                        getText(
                            text: Strings.PERSONALISE_POACTIVE,
                            textStyle: BaseStyles.subHeadingTextStyle),
                        verticalGap(context: context, screenSize: 0.02),
                      ]),
                ),
                CustomButton(
                    onTap: () {
                      doNavigate(
                          route: NotificationEnablePage(), context: context);
                    },
                    text: Strings.LETS_DO_IT,
                    borderRadius: Raddi.buttonCornerRadius,
                    buttonColor: AppColors.buttonColor,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width),
                verticalGap(context: context, screenSize: 0.02)
              ],
            ),
          )),
    );
  }
}
