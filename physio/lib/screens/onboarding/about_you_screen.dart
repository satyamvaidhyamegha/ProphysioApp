import 'package:flutter/material.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physio/screens/onboarding/certification_screen.dart';
import 'package:physio/utility/gap_between.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_constants.dart';

class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutYouScreenPageState();
  }
}

class _AboutYouScreenPageState extends State<AboutYouScreen> {
  var windowWidth;
  var windowHeight;

  final TextEditingController aboutYouController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();

  String aboutYou = "";
  String education = "";
  String speciality = "";
  String dropdownLanguage = 'Language';
  var itemsLanguage = [
    'Language',
    'Engligh',
    'kannada',
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
            MaterialPageRoute(builder: (context) => const AuthPage3()),
          ),
        ),
      ),
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColors.signupBackground,
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: LinearPercentIndicator(
                    percent: 0.5,
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
                      right: 20, left: 20, bottom: 10, top: 25),
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "About you",
                      textStyle: signupText),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.blueGrey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    style: const TextStyle(color: Color(0xCCCCCC)),
                    controller: aboutYouController,
                    decoration: InputDecoration(
                        labelText: "Tell us a little bit about yourself",
                        labelStyle: headertext,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        fillColor: Colors.black),
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String aboutValue) {
                      aboutValue = aboutYouController.text;
                      aboutYou = aboutValue;
                    },
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 5, top: 15),
                  child: getText(
                      textAlign: TextAlign.center,
                      text: "Education/Experience",
                      textStyle: aboutYouText),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border:
                                Border.all(color: Colors.blueGrey, width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: educationController,
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Education",
                              labelStyle: headertext,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              fillColor: Colors.black),
                          onChanged: (String educationValue) {
                            educationValue = educationController.text;
                            education = educationValue;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, top: 20),
                          alignment: Alignment.centerRight,
                          child: Image.asset("assets/plusBtn.png"),
                        ),
                        onTap: () {
                          debugPrint("Add media event");
                        },
                      ),
                    ),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border:
                                Border.all(color: Colors.blueGrey, width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: specialityController,
                          decoration: InputDecoration(
                              labelText: "speciality",
                              labelStyle: headertext,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              fillColor: Colors.black),
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (String specialityValue) {
                            specialityValue = specialityController.text;
                            speciality = specialityValue;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, top: 20),
                          alignment: Alignment.centerRight,
                          child: Image.asset("assets/plusBtn.png"),
                        ),
                        onTap: () {
                          debugPrint("Add media event");
                        },
                      ),
                    ),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.02),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 70),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.blueGrey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    style: const TextStyle(color: Color(0xCCCCCC)),
                    decoration: InputDecoration(
                        labelText: "Years of experience",
                        labelStyle: headertext,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        fillColor: Colors.black),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.02),
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 170,
                      height: MediaQuery.of(context).size.height * 0.07,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownLanguage,
                        underline: const SizedBox(),
                        focusColor: Colors.white,
                        dropdownColor: AppColors.signupBackground,
                        style: BaseStyles.textStyleForSignupScreen,
                        iconEnabledColor: Colors.white,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: itemsLanguage.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownLanguage = newValue!;
                          });
                        },
                      ),
                    )),
                verticalGap(context: context, screenSize: 0.03),
                Container(
                  margin: const EdgeInsets.only(top: 10),
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
                          builder: (context) => CertificationScreen(
                              physioId: '',
                              aboutYou: aboutYou,
                              education: education,
                              speciality: speciality,
                              dropdownLanguage: dropdownLanguage,
                              name: ''),
                        ),
                      );
                    },
                    child: Center(
                      child: getText(
                          textAlign: TextAlign.center,
                          text: "Certificate",
                          textStyle: buttonTextStyle),
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
