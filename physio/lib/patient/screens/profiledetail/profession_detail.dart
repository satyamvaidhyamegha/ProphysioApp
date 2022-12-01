// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/patient/model/user_model/user_result.dart';
import 'package:physio/patient/screens/Success%20Screen/awasome_screen.dart';
import 'package:physio/patient/screens/profiledetail/persnalinfo_summery.dart';
import 'package:physio/patient/services/Auth%20Service/Auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';


class EditprofilePage4 extends StatefulWidget {
  const EditprofilePage4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditprofilePage4PageState();
  }
}

class _EditprofilePage4PageState extends State<EditprofilePage4> {
  bool _value = false;

  List<Map<String, dynamic>> text = [
    {
      "name": "Students",
      "isCheck": false,
    },
    {
      "name": "Working Professional",
      "isCheck": false,
    },
    {
      "name": "Business Man",
      "isCheck": false,
    },
    {
      "name": "Retired",
      "isCheck": false,
    },
    {
      "name": "Home Maker",
      "isCheck": false,
    },
    {
      "name": "Other",
      "isCheck": false,
    },

    // 'Students',
    // 'Working Professional',
    // 'Business Man',
    // 'Retired',
    // 'Home Maker',
    // 'Other'
  ];
  int? selectedCard = -1;
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: Custom_Appbar(
            actionButtonText: Strings.SKIP,
            backPressed: () {
              backFromPreviousScreen(context: context);
            },
            skipButtonPressed: () {
              // doNavigate(route: FoodAndLifeStyleWelcome(), context: context);
              doNavigate(route: PersonalinfoSummery(), context: context);
            }),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      //verticalGap(context: context, screenSize: 0.03),
                      Column(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: Raddi.textFieldBorderRadius,
                            child: LinearProgressIndicator(
                              value: 0.60,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.PROGRESS_YELLOW_LINE),
                              backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                            ),
                          ),
                        ),
                      ]),
                      verticalGap(context: context, screenSize: 0.05),
                      getText(
                        text: "What describe \nyou best?",
                        textStyle: BaseStyles.addressScreenHeadingText,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                      getText(
                        text:
                            "The better we know you, the better \nwe can serve you!",
                        textStyle: infoStyle,
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 400,
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: text.length,
                                        itemBuilder: (_, index) => Container(
                                              margin: const EdgeInsets.all(0),
                                              child: Padding(
                                                padding: Margins.basePadding,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      getText(
                                                        text: text[index]
                                                            ["name"],
                                                        textStyle:
                                                            profilefieldtextStyle,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            text[index][
                                                                    "isCheck"] =
                                                                !text[index]
                                                                    ["isCheck"];
                                                          });
                                                          setState(() {
                                                            // ontap of each card, set the defined int to the grid view index
                                                            selectedCard =
                                                                index;
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: text[index]
                                                                    ["isCheck"]
                                                                ? AppColors.CHECKBOX_ACTIVE_COLOR
                                                                : const Color(
                                                                    0xff182021),
                                                            border: Border.all(
                                                                color: text[index]
                                                                        [
                                                                        "isCheck"]
                                                                    ? Colors
                                                                        .transparent
                                                                    : AppColors.textColor,
                                                                width: 2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                          ),
                                                          child: text[index]
                                                                  ["isCheck"]
                                                              ? const Icon(
                                                                  Icons.check,
                                                                  size: 18.0,
                                                                  color: AppColors.textColor,
                                                                )
                                                              : const Icon(
                                                                  null,
                                                                  size: 18.0,
                                                                ),
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                            )))
                              ])),
                    ])),
              ),
            ),
            verticalGap(context: context, screenSize: 0.02),
            CustomButton(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var designation = prefs.setString('userDesignation',
                      text[selectedCard!.toInt()]['name'].toString());
                  await AuthAPI().editProfileDetails(UserResult(
                      role: 1.toInt(),
                      id: prefs.getInt('userId'),
                      email: prefs.getString('signUpEmail'),
                      name: prefs.getString('userName'),
                      gender: prefs.getString('userGender'),
                      age: prefs.getInt('age'),
                      date_of_birth: prefs.getString('userDateOfBirth'),
                      address: prefs.getString('userAddress'),
                      phone: prefs.getString('phone1'),
                      phone2: prefs.getString('phone2'),
                      height: prefs.getString('userHeight'),
                      weight: prefs.getString('userWeight'),
                      blood_group: prefs.getString('userBloodGroup'),
                      updatedAt: DateTime.now().toString(),
                      image: prefs.getString('userImage'),
                      // first_name: prefs.getString('first_name'),
                      // last_name: prefs.getString('last_name'),
                      agree: 1,
                      visiting_hour: "00:00:00",
                      createdAt: DateTime.now().toString(),
                      designation:
                          text[selectedCard!.toInt()]['name'].toString()));

                  doNavigate(
                      route: AwsomeScreen(voidCallback: () {
                        doNavigate(
                            route: const PersonalinfoSummery(),
                            context: context);
                      }),
                      context: context);
                },
                text: Strings.CONTINUE,
                borderRadius: Raddi.buttonCornerRadius,
                buttonColor: AppColors.buttonColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9),
            verticalGap(context: context, screenSize: 0.02),
          ],
        ));
  }
}
