// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BaseWidget/basic_app_bar.dart';
import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/editprofilefield.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';
import 'bloodgroup_detail.dart';

class EditprofilePage2 extends StatefulWidget {
  const EditprofilePage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditprofilePage2PageState();
  }
}

class _EditprofilePage2PageState extends State<EditprofilePage2> {
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();
  TextEditingController firstLineAdress = TextEditingController();
  TextEditingController secondLineAdress = TextEditingController();
  TextEditingController thirdLineAdress = TextEditingController();

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController1.dispose();
    phoneController2.dispose();
    firstLineAdress.dispose();
    secondLineAdress.dispose();
    thirdLineAdress.dispose();
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
            doNavigate(route: EditprofilePage3(), context: context);
          }),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.765,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //verticalGap(context: context, screenSize: 0.02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.012,
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
                      verticalGap(context: context, screenSize: 0.03),
                      getText(
                        text: "How can we reach \nto you",
                        textStyle: BaseStyles.addressScreenHeadingText,
                      ),
                      verticalGap(context: context, screenSize: 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                              child: getText(
                            text: "Address",
                            textStyle: profilefieldtextStyle,
                          )),
                          getText(
                            text: "Locate me",
                            textStyle: bluetext,
                          ),
                          Icon(
                            Icons.location_on_rounded,
                            color: AppColors.buttonColor,
                          )
                        ],
                      ),
                      EditField(
                        readOnly: false,
                        labelText: 'So our physios knows where to come',
                        infoText: '',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: firstLineAdress,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      EditField(
                        readOnly: false,
                        labelText: '',
                        infoText: '',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: secondLineAdress,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      EditField(
                        readOnly: false,
                        labelText: '',
                        infoText: '',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: thirdLineAdress,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalGap(context: context, screenSize: 0.03),
                      EditField(
                        maxDigit: 10,
                        readOnly: false,
                        labelText: 'So we can get in touch',
                        infoText: 'Mobile',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: phoneController1,
                        keyboardType: TextInputType.number,
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      EditField(
                        maxDigit: 10,
                        readOnly: false,
                        labelText: 'So we can get in touch',
                        infoText: 'Alternate Mobile No',
                        suffixicon: IconButton(
                          icon: const Icon(null),
                          onPressed: () {},
                        ),
                        controller: phoneController2,
                        keyboardType: TextInputType.number,
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        'userAddress',
                        firstLineAdress.text +
                            "," +
                            " ${secondLineAdress.text}" +
                            "," +
                            " ${thirdLineAdress.text}");

                    prefs.setString('phone1', phoneController1.text);
                    prefs.setString('phone2', phoneController2.text);

                    if ((phoneController1.text.isEmpty) ||
                        (phoneController1.text.length < 10) ||
                        (phoneController1.text.length > 10)) {
                      await Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: "Please Enter mobile number",
                          backgroundColor: Colors.red,
                          textColor: AppColors.textColor);
                    } else if ((phoneController2.text.isEmpty) ||
                        (phoneController2.text.length < 10) ||
                        (phoneController2.text.length > 10)) {
                      Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: "Please Enter mobile number",
                          backgroundColor: Colors.red,
                          textColor: AppColors.textColor);
                    } else {
                      doNavigate(route: EditprofilePage3(), context: context);
                    }
                  },
                  text: Strings.CONTINUE,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9),
            ],
          ),
        ),
      ),
    );
  }
}
