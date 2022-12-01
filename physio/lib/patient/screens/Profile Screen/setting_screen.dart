import 'package:flutter/material.dart';
import 'package:physio/patient/model/setting_model/setting_model.dart';
import 'package:physio/patient/services/setting%20service/setting_api.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/setting_card.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool contactSwitch = false;
  bool backgroundApp = false;
  bool mobileData = false;

  void getSettingData() async {
    var result = await SettingApi().getSetingData();
    print(result.createdAt);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSettingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        leading: getBackIconButton(context: context),
        title: getText(text: "Settings", textStyle: BaseStyles.appBarTextStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalGap(context: context, screenSize: 0.02),
            Container(
              height: MediaQuery.of(context).size.height * 0.56,
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
                      FutureBuilder<SettingModel>(
                        future: SettingApi().getSetingData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SettingCard(
                              iconPath: ImagePath.LOCATION_ICON,
                              titleText: "Location",
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getText(
                                      text: snapshot.data!.location != null
                                          ? snapshot.data!.location.toString()
                                          : "When Shared",
                                      textStyle: TextStyle(
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Color.fromRGBO(
                                              152, 152, 152, 1))),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      Divider(
                        color: Colors.grey[900],
                        indent: 20,
                        height: 1,
                        thickness: 2,
                      ),
                      FutureBuilder<SettingModel>(
                        future: SettingApi().getSetingData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SettingCard(
                              iconPath: ImagePath.CONTACT_ICON,
                              titleText: "Contacts",
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey),
                                    child: Switch(
                                        activeColor: AppColors.BACKGROUND_COLOR,
                                        inactiveTrackColor:
                                            AppColors.BACKGROUND_COLOR,
                                        value: contactSwitch,
                                        onChanged: (value) {
                                          setState(() {
                                            contactSwitch = value;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      Divider(
                        color: Colors.grey[900],
                        indent: 20,
                        height: 1,
                        thickness: 2,
                      ),
                      SettingCard(
                        iconPath: ImagePath.SEARCH_ICON,
                        titleText: "Siri & Search",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[900],
                        indent: 20,
                        height: 1,
                        thickness: 2,
                      ),
                      SettingCard(
                        iconPath: ImagePath.SETTING_ICON,
                        titleText: "Notifications",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            getText(
                                text: "Off   ",
                                textStyle: TextStyle(
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(152, 152, 152, 1))),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[900],
                        indent: 20,
                        height: 1,
                        thickness: 2,
                      ),
                      SettingCard(
                        iconPath: ImagePath.ASSISTANCE_SHIELD,
                        titleText: "Background app refresh",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey),
                              child: Switch(
                                  activeColor: AppColors.BACKGROUND_COLOR,
                                  inactiveTrackColor:
                                      AppColors.BACKGROUND_COLOR,
                                  value: backgroundApp,
                                  onChanged: (value) {
                                    setState(() {
                                      backgroundApp = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[900],
                        indent: 20,
                        height: 1,
                        thickness: 2,
                      ),
                      SettingCard(
                        iconPath: ImagePath.MOBILE_DATA_ICON,
                        titleText: "Mobile Data",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey),
                              child: Switch(
                                  activeColor: AppColors.BACKGROUND_COLOR,
                                  inactiveTrackColor:
                                      AppColors.BACKGROUND_COLOR,
                                  value: mobileData,
                                  onChanged: (value) {
                                    setState(() {
                                      mobileData = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
