// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/screens/app_in_detail/detail_screen2.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../constants/text_constants.dart';
import '../../../utility/gap_between.dart';
import '../../../utility/navigation.dart';

class TermsConsition extends StatefulWidget {
  const TermsConsition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TermsConsitionPageState();
  }
}

class _TermsConsitionPageState extends State<TermsConsition> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.kBGcolor,
          leading: getBackIconButton(context: context),
        ),
        backgroundColor: AppColors.kBGcolor,
        body: Padding(
          padding: Margins.PAGE_CONTENT_MARGINS,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalGap(context: context, screenSize: 0.05),
              SizedBox(
                width: 300,
                height: 10,
                child: ClipRRect(
                  borderRadius: Raddi.textFieldBorderRadius,
                  child: LinearProgressIndicator(
                    value: 0.70,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xffFFB50D)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.05),
              Text(Strings.TERMS_CONDITION,
                  textAlign: TextAlign.start, style: headerStyle),
              Expanded(
                child: Container(
                  padding: Margins.basePadding,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView(
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.fbsdjvbvbdhsbvhsdbvjhsdbvjhdsbvjdshbvdjshbvdsjhbfjhbfjhwsbfjkwsbfwsbfjkbfjsdbfjdsbfjhsdbfjsdbfjhsdbfjhsdbfgjhsdbfgjhdsb",
                        style: headerStyle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.green,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Text(
                    "Agree",
                    style: headerStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
              CustomButton(
                  onTap: () {
                    if (isChecked == false) {
                      return null;
                    } else {
                      doNavigate(
                          route: NotificationEnablePage(), context: context);
                    }
                  },
                  text: Strings.NEXT,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor:
                      isChecked == false ? AppColors.inactiveButtonColor : AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width),
              verticalGap(context: context, screenSize: 0.02),
            ],
          ),
        ));
  }
}
