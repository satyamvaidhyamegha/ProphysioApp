import 'package:flutter/material.dart';
import 'package:physio/API/otp_api_service.dart';
import 'package:physio/screens/onboarding/otp_verification.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../constants/style.dart';
import '../../constants/text_constants.dart';
import 'auth_screen3.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenPageState();
  }
}

class _AuthScreenPageState extends State<AuthPage> {
  var windowWidth;
  var windowHeight;

  @override
  void dispose() {
    super.dispose();
    firstsNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
  }

  final TextEditingController firstsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String userExist = "User already exist";

 String firstName = "";
 String secondName = "";
  String mobileNumber = '';
  bool enableBtn = false;
  bool isAPIcallProcess = false;


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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: getAssetImage(imagePath: ImagePath.AUTH_SCREEN),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(45)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Let's verify",
                          style: BaseStyles.textStyleForAuthScreen),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, bottom: 50),
                      child: Text("your details!",
                          style: BaseStyles.textStyleForAuthScreen),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 30),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          hintText: "First Name",
                          fillColor: Colors.black54),
                      controller: firstsNameController,
                      onChanged: (String name){
                        name = firstsNameController.text;
                        firstName = name;
                        debugPrint("FirstName: $firstName");
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          hintText: "Last Name",
                          fillColor: Colors.black54),
                      controller: lastNameController,
                      onChanged: (String lastName){
                        lastName = lastNameController.text;
                        secondName = lastName;
                        debugPrint("LastName: $secondName");
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 120, left: 20, right: 20),
                    child: TextFormField(
                      maxLength: 10,
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      onChanged: (String value){
                        value = phoneNumberController.text;
                        if (value.length == 10) {
                          mobileNumber = value;
                          enableBtn = true;
                          debugPrint("value: $mobileNumber");
                        }
                      },
                      validator: (value){
                        return null;
                      },

                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          hintText: "Phone Number",
                          fillColor: Colors.black54),
                    ),
                  ),

                  //Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.buttonColor),
                    child: GestureDetector(
                      child:  Center(
                          child: getText(
                              textAlign: TextAlign.center,
                              text: Strings.BTN_OTP,
                              textStyle: buttonTextStyle)

                      ),
                      onTap: () async {
                        if (enableBtn && mobileNumber.length > 8) {
                          setState(() {
                            isAPIcallProcess = true;
                          });

                          OtpApiService.otpSignup(firstName,secondName,"+91"+"$mobileNumber").then((
                              response) async {
                            setState(() {
                              isAPIcallProcess = false;
                            });

                            if (response.data != null) {
                              debugPrint("Hogaya");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpVerificationPage(
                                    otpHash: response.data,
                                    mobileNo: mobileNumber,
                                  ),
                                ),
                                    (route) => false,
                              );
                            }
                          }
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OtpVerificationPage()));
                        }

                      }
    )

    ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 30, right: 20, left: 20, bottom: 10),
                      child: const Divider(
                        color: Colors.white,
                      )),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: "Don't have Indian number?",
                        textStyle: numberText),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                    child: getText(
                        textAlign: TextAlign.center,
                        text: "Click here",
                        textStyle: authtext),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
