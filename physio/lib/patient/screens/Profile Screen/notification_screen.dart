import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:physio/patient/services/Push%20Notification/all_notification.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/notification_card.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../utility/gap_between.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final AllNotification allNotification = AllNotification();
  var countNotification = '0';
  List dataList = [];
  void getNotificationList() async {
    var res = await allNotification.getNotificationListDemo();
    var jsonData = jsonDecode(res.body);

    setState(() {
      countNotification = jsonData['count'].toString();
      dataList = jsonData['rows'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        backgroundColor: AppColors.BACKGROUND_COLOR,
        leading: getBackIconButton(context: context),
        title: Row(
          children: [
            getText(
                text: "Notification",
                textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Mulish")),
            horizontalGap(context: context, screenSize: 0.1),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff007CE2)),
              child: Center(
                child: getText(
                    text: "$countNotification NEW",
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000))),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: Margins.PAGE_CONTENT_MARGINS,
        child: Column(
          children: dataList.map((e) {
            final DateTime now = DateTime.now();
            final DateFormat formatter = DateFormat('dd MMM yyyy');
            final DateFormat formatterTime = DateFormat().add_jm();
            final String amPm =
                formatterTime.format(DateTime.parse(e['createdAt']));
            final String formatted =
                formatter.format(DateTime.parse(e['createdAt'].toString()));

            return NotificationCard(
                title: e['title'],
                subtitle: e['body'],
                timeText: "${amPm.toLowerCase()} $formatted");
          }).toList(),
        ),
      )),
    );
  }
}
