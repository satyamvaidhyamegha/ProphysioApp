import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/screens/onboarding/policy_terms/privacy_policy.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:physio/screens/onboarding/about_you_screen.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/raddi.dart';
import '../../constants/string.dart';
import '../../constants/text_constants.dart';
import '../../model/Notification Model/notification_model.dart';
import '../../services/Push Notification/all_notification.dart';
import '../../utility/gap_between.dart';
import 'auth_screen3.dart';
import 'helpus_helpyou.dart';

class PushNotifications extends StatefulWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PushNotificationsPageState();
  }
}

class _PushNotificationsPageState extends State<PushNotifications> {
  List<Map> list = [];
  List<NotificationModel> data = [];
  AllNotification _allNotification = AllNotification();

  @override
  void initState() {
    setState(() {});
    super.initState();
    getNotificationList();
  }

  void getNotificationList() async {
    var req = await _allNotification.getAllNotification();

    setState(() {
      data = req;
    });
  }

  var windowWidth;
  var windowHeight;

  DateTime date = DateTime.now();

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
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HelpUsScreen()),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.signupBackground,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: LinearPercentIndicator(
                      percent: 0.6,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 10,
                      progressColor: Colors.amber,
                      barRadius: const Radius.circular(16),
                      backgroundColor: const Color(0xff707070),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 5, top: 30),
                    child: getText(
                        textAlign: TextAlign.left,
                        text: "We'll help you\nstay on track",
                        textStyle: pushNoti1),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 5, top: 20),
                    child: getText(
                        textAlign: TextAlign.left,
                        text: "Enable push notifications for",
                        textStyle: pushNoti2),
                  ),
                  verticalGap(context: context, screenSize: 0.03),
                  data.isNotEmpty
                      ? Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: data.map((element) {
                            return Container(
                              height: 37,
                              width: MediaQuery.of(context).size.width,
                              child: CheckboxListTile(
                                  // tristate: true,
                                  activeColor: AppColors.CHECKBOX_ACTIVE_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          Raddi.textFieldBorderRadius),
                                  value: element.enabled,
                                  title: getText(
                                      text: element.name.toString(),
                                      textStyle: infoStyle.copyWith(
                                          color: AppColors.textColor)),
                                  onChanged: (newValue) {
                                    setState(() {
                                      element.enabled = newValue;

                                      _allNotification.createNotification(
                                          element.id!.toInt(), element.enabled);
                                    });
                                  }),
                            );
                          }).toList(),
                        )
                      : Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: AppColors.buttonNextCertificate,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13, right: 13, bottom: 15),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.buttonColor),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyPolicy()));
                              },
                              child: Center(
                                child: getText(
                                    textAlign: TextAlign.center,
                                    text: "Enable",
                                    textStyle: buttonTextStyle),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicy()));
                          },
                          child: Center(
                            child: getText(
                                textAlign: TextAlign.center,
                                text: "Maybe later",
                                textStyle: textButtonTextStyle),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
