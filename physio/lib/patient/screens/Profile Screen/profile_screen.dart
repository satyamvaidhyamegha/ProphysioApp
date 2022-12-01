// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/style.dart';
import 'package:physio/patient/model/user_model/user_result.dart';
import 'package:physio/patient/screens/Login/mobilelogin/login_screen.dart';
import 'package:physio/patient/screens/Profile%20Screen/account_screen.dart';
import 'package:physio/patient/screens/Profile%20Screen/assistance_screen.dart';
import 'package:physio/patient/screens/Profile%20Screen/edit_profile_screen.dart';
import 'package:physio/patient/screens/Profile%20Screen/notification_screen.dart';
import 'package:physio/patient/screens/Profile%20Screen/setting_screen.dart';
import 'package:physio/patient/services/Auth%20Service/user_details.dart';
import 'package:physio/patient/services/Push%20Notification/all_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/profile_card.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AllNotification allNotification = AllNotification();
  var countNotification = '0';
  void getNotificationList() async {
    var res = await allNotification.getNotificationListDemo();
    var jsonData = jsonDecode(res.body);
    print(jsonData['count']);
    setState(() {
      countNotification = jsonData['count'].toString();
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
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(28, 28, 30, 1),
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: getBackIconButton(context: context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(28, 28, 30, 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // /verticalGap(context: context, screenSize: 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: FutureBuilder<UserResult>(
                          future: UserDetailsApi().getUserData(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.image != null
                                  ? Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data!.image
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    )
                                  : Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                ImagePath.PROFILE_ICON,
                                              ),
                                              fit: BoxFit.cover)));
                            } else {
                              return Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(ImagePath.PROFILE_ICON),
                                        fit: BoxFit.cover)),
                              );
                            }
                          })),
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: getText(
                          text: "Dr. Pramod",
                          textStyle: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.normal)),
                    ),
                    verticalGap(context: context, screenSize: 0.01),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: getText(
                          text: "MBBS, Movements Specialist",
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.PROFILE_SUBTITLE_COLOR,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: getText(
                          text: "Manipal Hospital, Indira Nagar",
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.PROFILE_SUBTITLE_COLOR,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.normal)),
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                  ]),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(34, 34, 34, 1),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.PROFILE_CARD_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ProfileCard(
                          onTap: () {
                            doNavigate(
                                route: NotificationScreen(), context: context);
                          },
                          titleText: "Notification($countNotification)",
                          leadingIcon: ImagePath.NOTIFICATION_ICON),
                      Divider(
                        color: Colors.grey[900],
                        indent: 30,
                        height: 1,
                        thickness: 2,
                      ),
                      ProfileCard(
                          onTap: () {
                            doNavigate(
                                route: AccountScreen(), context: context);
                          },
                          titleText: "Account",
                          leadingIcon: ImagePath.ACCOUNT_ICON),
                      Divider(
                        color: Colors.grey[900],
                        indent: 30,
                        height: 1,
                        thickness: 2,
                      ),
                      ProfileCard(
                          onTap: () {
                            doNavigate(
                                route: EditProfileScreen(), context: context);
                          },
                          titleText: "Profile",
                          leadingIcon: ImagePath.PROFILE_ICON),
                      Divider(
                        color: Colors.grey[900],
                        indent: 30,
                        height: 1,
                        thickness: 2,
                      ),
                      ProfileCard(
                          onTap: () {
                            doNavigate(
                                route: SettingScreen(), context: context);
                          },
                          titleText: "Setting",
                          leadingIcon: ImagePath.SETTING_ICON),
                      Divider(
                        color: Colors.grey[900],
                        indent: 30,
                        height: 1,
                        thickness: 2,
                      ),
                      ProfileCard(
                          onTap: () {
                            doNavigate(
                                route: AssistanceScreen(), context: context);
                          },
                          titleText: "Assistance",
                          leadingIcon: ImagePath.ASSISTANCE_SHIELD),
                    ],
                  ),
                ),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.remove('userEmail');

                    doNavigate(route: LoginPage(), context: context);
                  },
                  child: Text(
                    "Log Out",
                    style: BaseStyles.proPhysio,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
