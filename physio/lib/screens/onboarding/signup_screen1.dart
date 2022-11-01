import 'package:flutter/material.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physio/screens/onboarding/signup_screen2.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/style.dart';
import '../../constants/text_constants.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenPageState1();
  }
}

class _SignupScreenPageState1 extends State<SignupScreen1> {
  var windowWidth;
  var windowHeight;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    emailIdController.dispose();
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();

  String dropdownvalue = 'Doctor';
  var items = [
    'Doctor',
    'Mr.',
    'Mrs.',
  ];

  String firstName = "";
  String lastName = "";
  String emailId = "";

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
      ),
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColors.signupBackground,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                    child: LinearPercentIndicator(
                      percent: 0.2,
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
                        text: "Sign-up",
                        textStyle: signupText),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 5, top: 20),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: "Welcome",
                        textStyle: doctorNameText),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: Strings.DOCTOR_NAME,
                        textStyle: doctorNameText),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 150,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border:
                                Border.all(color: Colors.blueGrey, width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                          underline: const SizedBox(),
                          focusColor: Colors.white,
                          dropdownColor: AppColors.signupBackground,
                          style: BaseStyles.textStyleForSignupScreen,
                          iconEnabledColor: Colors.white,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: firstNameController,
                      decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      onChanged: (String fname) {
                        fname = firstNameController.text;
                        firstName = fname;
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
                      controller: secondNameController,
                      decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      onChanged: (String lname) {
                        lname = secondNameController.text;
                        lastName = lname;
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
                      controller: emailIdController,
                      decoration: InputDecoration(
                          labelText: "Email id",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      onChanged: (String email) {
                        email = emailIdController.text;
                        emailId = email;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
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
                                builder: (context) => SignupScreen2(
                                    firstName: firstName,
                                    lastName: lastName,
                                    emailId: emailId)));
                      },
                      child: Center(
                        child: getText(
                            textAlign: TextAlign.center,
                            text: "Next",
                            textStyle: buttonTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
