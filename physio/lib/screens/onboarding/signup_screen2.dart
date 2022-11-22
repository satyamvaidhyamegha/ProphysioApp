import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:physio/database/model/onboardingDetailsModel.dart';
import 'package:physio/screens/onboarding/professional_profile.dart';
import 'package:physio/screens/onboarding/signup_screen1.dart';

import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/text_constants.dart';
import '../../viewmodel/onboard_view_model.dart';

class SignupScreen2 extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? emailId;

  SignupScreen2(
      {required this.firstName, required this.lastName, required this.emailId});

  @override
  _SignupScreenPageState2 createState() =>
      _SignupScreenPageState2(firstName, lastName, emailId);
}

class _SignupScreenPageState2 extends State<SignupScreen2> {
  final detailsViewModel = Get.put(OnboardViewModel());


  var windowWidth;
  var windowHeight;

  String? firstName;
  String? lastName;
  String? emailId;

  _SignupScreenPageState2(this.firstName, this.lastName, this.emailId);

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
  }


  final TextEditingController passController = TextEditingController();
  final TextEditingController repassController = TextEditingController();

  String pass = "";
  String repass = "";

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
            MaterialPageRoute(builder: (context) => const SignupScreen1()),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.signupBackground,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: LinearPercentIndicator(
                percent: 0.3,
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
                  right: 20, left: 20, bottom: 10, top: 30),
              child: getText(
                  textAlign: TextAlign.center,
                  text: "Create Password",
                  textStyle: signupText2),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: passController,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Enter Password",
                    labelStyle: headertext,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    fillColor: Colors.black),
                onChanged: (String passW) {
                  passW = passController.text;
                  pass = passW;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.blueGrey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: repassController,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Re-Enter Password",
                    labelStyle: headertext,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    fillColor: Colors.black),
                onChanged: (String repassW) {
                  repassW = repassController.text;
                  repass = repassW;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.buttonColor),
              child: GestureDetector(
                onTap: () {
                  if (pass == repass) {

                    detailsViewModel.updateDetails(OnboardDetailsModel(id: detailsViewModel.allOnboardDetails[0].id, firstName: detailsViewModel.allOnboardDetails[0].firstName, lastName: detailsViewModel.allOnboardDetails[0].lastName, mobileNo: detailsViewModel.allOnboardDetails[0].mobileNo, email: detailsViewModel.allOnboardDetails[0].email, password: pass, physioimg: detailsViewModel.allOnboardDetails[0].physioimg, physioId: 0));
                    debugPrint(pass);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfessionalProfile(
                                firstName: firstName,
                                lastName: lastName,
                                emailId: emailId,
                                pass: pass)));
                  }
                },
                child: Center(
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Create Profile",
                      textStyle: buttonTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
