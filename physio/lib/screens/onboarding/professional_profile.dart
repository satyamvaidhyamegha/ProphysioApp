import 'package:flutter/material.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physio/screens/onboarding/certification_screen.dart';
import 'package:physio/screens/onboarding/signup_screen2.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/style.dart';
import '../../constants/text_constants.dart';

class ProfessionalProfile extends StatefulWidget {
  const ProfessionalProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfessionalProfilePageState();
  }
}

class _ProfessionalProfilePageState extends State<ProfessionalProfile> {
  var windowWidth;
  var windowHeight;

  String dropdownCurrency = 'Rupees';
  List<String> itemsCurrency = [
    'Rupees',
    'Dollar',
    'Taka',
    'Euros',
    'Pesos',
    'Pound',
    'Dinar',
    'Franc',
    'Yen',
    'Sol',
  ];

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
            MaterialPageRoute(builder: (context) => const SignupScreen2()),
          ),
        ),
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
                      percent: 0.4,
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
                        textAlign: TextAlign.left,
                        text: "Professional\nProfile",
                        textStyle: signupText),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            right: 0, left: 20, bottom: 5, top: 20),
                        child: getText(
                            textAlign: TextAlign.start,
                            text: "Work/Clinic Details",
                            textStyle: professionProfileHeading1),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(
                              top: 20, right: 30, bottom: 5, left: 40),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Enter Contact no.",
                          labelStyle: headertext,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          fillColor: Colors.black),
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            right: 10, left: 20, bottom: 5, top: 20),
                        child: getText(
                            textAlign: TextAlign.center,
                            text: "Payment Details",
                            textStyle: professionProfileHeading1),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(
                              top: 20, right: 30, bottom: 5, left: 40),
                          child: const Divider(
                            thickness: 1,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Email id",
                                labelStyle: headertext,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[300]),
                                fillColor: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 150,
                              height: MediaQuery.of(context).size.height * 0.07,
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButton(
                                // Initial Value
                                value: dropdownCurrency,
                                underline: const SizedBox(),
                                focusColor: Colors.white,
                                dropdownColor: AppColors.signupBackground,
                                style: BaseStyles.textStyleForSignupScreen,
                                iconEnabledColor: Colors.white,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: itemsCurrency.map((String itemsCurr) {
                                  return DropdownMenuItem(
                                    value: itemsCurr,
                                    child: Text(itemsCurr),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownCurrency = newValue!;
                                  });
                                },
                              ),
                            )),
                      ),
                    ],
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
                                builder: (context) =>
                                    const CertificationScreen()));
                      },
                      child: Center(
                        child: getText(
                            textAlign: TextAlign.center,
                            text: "About You",
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