// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/model/Notification%20Model/notification_model.dart';
import 'package:physio/patient/screens/Success%20Screen/register_success.dart';
import 'package:physio/patient/services/Push%20Notification/all_notification.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class NotificationEnablePage extends StatefulWidget {
  const NotificationEnablePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationEnablePagePageState();
  }
}

class _NotificationEnablePagePageState extends State<NotificationEnablePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBGcolor,
        leading: getBackIconButton(context: context),
      ),
      backgroundColor: AppColors.kBGcolor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  verticalGap(context: context, screenSize: 0.05),
                  // ignore: prefer_const_literals_to_create_immutables
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05),
                      child: SizedBox(
                        width: 300,
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.30,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.PROGRESS_YELLOW_LINE),
                            backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  verticalGap(context: context, screenSize: 0.05),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: getText(
                      text: Strings.WE_WILL_HELP_YOU_STAY_TRACK,
                      textAlign: TextAlign.start,
                      textStyle: headerStyle,
                    ),
                  ),

                  verticalGap(context: context, screenSize: 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: getText(
                      text: Strings.ENABLE_PUSH_NOTIFICATION,
                      textStyle: infoStyle,
                    ),
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
                                      borderRadius: Raddi.textFieldBorderRadius),
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
                  verticalGap(context: context, screenSize: 0.02),
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: CustomButton(
                onTap: () {
                  doNavigate(route: RegisterSuccessPage(), context: context);
                },
                text: Strings.ENABLE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width),
          ),
          GestureDetector(
              onTap: () {},
              child: TextButton(
                  onPressed: () {},
                  child: getText(
                      text: Strings.LATER,
                      textStyle: BaseStyles.laterButtonTextStyle))),
          verticalGap(context: context, screenSize: 0.02),
        ],
      ),
    );
  }
}
