// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/editprofilefield.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'profession_detail.dart';

class EditprofilePage3 extends StatefulWidget {
  const EditprofilePage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditprofilePage3PageState();
  }
}

class _EditprofilePage3PageState extends State<EditprofilePage3> {
  late int selectedCard;
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  List bloodgroup = ["0-", "0+", "B-", "B+", "A-", "A+", "AB-", "AB+"];

  @override
  void initState() {
    selectedCard = -1;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    weightcontroller.dispose();
    heightcontroller.dispose();
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
            doNavigate(route: EditprofilePage4(), context: context);
          }),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.60,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.PROGRESS_YELLOW_LINE),
                            backgroundColor: AppColors.PROGRESS_YELLOWLINE_BG_COLOR,
                          ),
                        ),
                      ),
                      verticalGap(context: context, screenSize: 0.05),
                      getText(
                        text: "Tell us a bit about \nyour Body",
                        textStyle: headingTextStyle,
                      ),
                      verticalGap(context: context, screenSize: 0.05),
                      EditField(
                        readOnly: false,
                        labelText: 'So that we can know how tall you are',
                        infoText: 'Height(cm)',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: heightcontroller,
                        keyboardType: TextInputType.name,
                      ),
                      verticalGap(context: context, screenSize: 0.04),
                      EditField(
                        readOnly: false,
                        labelText: 'So we understand your body',
                        infoText: 'Weight(kg)',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: weightcontroller,
                        keyboardType: TextInputType.name,
                      ),
                      verticalGap(context: context, screenSize: 0.04),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText(
                              text: 'Blood Group',
                              textStyle: profilefieldtextStyle,
                            ),
                            getText(
                              text: 'So we can know what you made off',
                              textStyle: iconlablecolor,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: GridView.builder(
                                  padding: EdgeInsets.all(10),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: bloodgroup.length,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 0.5,
                                    crossAxisSpacing: 14.0,
                                    crossAxisCount: 4,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.5),
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // ontap of each card, set the defined int to the grid view index
                                            selectedCard = index;
                                          });
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,

                                              // check if the index is equal to the selected Card integer
                                              color: selectedCard == index
                                                  ? AppColors.CHECKBOX_ACTIVE_COLOR
                                                  : AppColors.profileDividerClr,
                                            ),
                                            child: Center(
                                              child: getText(
                                                  text: bloodgroup[index],
                                                  textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: selectedCard == index
                                                        ? AppColors.textColor
                                                        : const Color(
                                                            0xff000000),
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            )));
                                  }),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              CustomButton(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('userHeight', heightcontroller.text);
                    prefs.setString('userWeight', weightcontroller.text);
                    prefs.setString(
                        'userBloodGroup', bloodgroup[selectedCard.toInt()]);
                    print(bloodgroup[selectedCard.toInt()]);

                    if (heightcontroller.text.isEmpty ||
                        weightcontroller.text.isEmpty) {
                      await Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: "Please Ente all details",
                          backgroundColor: Colors.red,
                          textColor: AppColors.textColor);
                    } else {
                      print(prefs.getString('userBloodGroup'));
                      doNavigate(route: EditprofilePage4(), context: context);
                    }
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9),
              verticalGap(context: context, screenSize: 0.02)
            ],
          ),
        ),
      ),
    );
  }
}
