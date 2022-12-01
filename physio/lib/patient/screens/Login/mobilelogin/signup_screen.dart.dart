// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/screens/Login/mobilelogin/login_screen.dart';
import 'package:physio/patient/screens/Login/mobilelogin/otp_field.dart';
import 'package:physio/patient/services/Auth%20Service/Auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:physio/constants/style.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/custom_button.dart';
import '../../../../BaseWidget/inputtextfield.dart';
import '../../../../BaseWidget/passwordtextfield.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/delete_share_pref_data.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SigninPagePageState();
  }
}

class _SigninPagePageState extends State<SigninPage> {
  bool _obscureText = true;
  final AuthAPI _authAPI = AuthAPI();

  @override
  void initState() {
    setState(() {});
    ControllSharePrefData().deletedExistingEmail();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController otpcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String userExist = "User already exist";

  var name = "";
  var password = "";
  var email = "";
  var otp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.REGISTER_BACKGROUND_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalGap(context: context, screenSize: 0.15),
                    getText(
                        text: "Let’s \ngets Started!",
                        textStyle: BaseStyles.headingTextStyle),
                    const SizedBox(height: 10),
                    getText(
                        text: Strings.NEW_ACCOUNT,
                        textStyle: BaseStyles.subHeadingTextStyle),
                    verticalGap(context: context, screenSize: 0.07),
                    InputField(
                      icon: Icons.person_outline_rounded,
                      labelText: Strings.NAME,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: namecontroller,
                      onSaved: (val) {
                        name = val!;
                      },
                      validator: (value) {
                        if (value!.length < 4) {
                          return "User Name should at least 4 character";
                        }
                      },
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    InputField(
                      icon: Icons.email_outlined,
                      labelText: Strings.EMAIL_ID,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: emailcontroller,
                      onSaved: (val) {
                        email = val!;
                      },
                      validator: (value) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                      },
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    PasswordField(
                      labelText: Strings.PASSWORD,
                      controller: passwordcontroller,
                      onFieldSubmitted: (String value) {},
                      onSaved: (val) {
                        password = val!;
                      },
                      validator: (value) {
                        if (value!.length < 6) {
                          return "${Strings.PASSWORD} must be six character";
                        }
                      },
                    ),
                    verticalGap(context: context, screenSize: 0.03),
                    CustomButton(
                        onTap: () async {
                          var req = await _authAPI.signup(emailcontroller.text,
                              namecontroller.text, passwordcontroller.text);
                          var apiData = jsonDecode(req.body);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var signUpEmail = prefs.setString(
                              'signUpEmail', emailcontroller.text);
                          prefs.setString("password", passwordcontroller.text);

                          if ((emailcontroller.text.isEmpty) ||
                              (passwordcontroller.text.isEmpty) ||
                              (namecontroller.text.isEmpty)) {
                            Fluttertoast.showToast(
                                fontSize: 18,
                                backgroundColor: AppColors.textColor,
                                timeInSecForIosWeb: 3,
                                gravity: ToastGravity.TOP,
                                textColor: Colors.red,
                                msg: ErrorMsg.SIGN_UP_ERROR);
                          } else if (apiData['error'] == userExist) {
                            Fluttertoast.showToast(
                                fontSize: 18,
                                backgroundColor: AppColors.textColor,
                                timeInSecForIosWeb: 3,
                                gravity: ToastGravity.TOP,
                                textColor: Colors.red,
                                msg: ErrorMsg.USER_EXIST);
                          } else {
                            await _authAPI.sendotp(emailcontroller.text);
                            doNavigate(route: OtpPage(), context: context);
                          }
                        },
                        text: Strings.SIGN_UP,
                        borderRadius: Raddi.buttonCornerRadius,
                        buttonColor: AppColors.buttonColor,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width),
                    verticalGap(context: context, screenSize: 0.02),
                    Row(children: <Widget>[
                      Expanded(
                          child:
                              Divider(color: AppColors.loginDeviderColor, thickness: 1)),
                      SizedBox(width: 5),
                      getText(
                          text: Strings.OR_SIGNIN_WITH,
                          textStyle: BaseStyles.orSignInWithText),
                      SizedBox(width: 5),
                      Expanded(
                          child:
                              Divider(color: AppColors.loginDeviderColor, thickness: 1)),
                    ]),
                    verticalGap(context: context, screenSize: 0.02),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: Margins.basePadding,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.loginPageBorderColorIcons),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child:  Image(
                              image: getAssetImage(
                              imagePath:   CustomLogo.GOOGLE_LOGO,
                              ),
                              height: 25,
                              width: 25,
                              color: null,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.loginPageBorderColorIcons),
                                borderRadius: Raddi.buttonCornerRadius),
                            child: IconButton(
                                icon: const FaIcon(FontAwesomeIcons.facebook,
                                    color: AppColors.buttonColor),
                                onPressed: () {
                                 
                                }),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColors),
                                  borderRadius: Raddi.buttonCornerRadius),
                              child: IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.apple,
                                      color: AppColors.textColor),
                                  onPressed: () {
                                    print("Pressed");
                                  }))
                        ]),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            text: Strings.ALREADY_A_MEMBER,
                            textStyle: inputfieldtextStyle),
                        SizedBox(width: 5),
                        InkWell(
                            onTap: () {
                              doNavigate(route: LoginPage(), context: context);
                            },
                            child: getText(
                                text: Strings.SIGN_IN,
                                textStyle: BaseStyles.signInText)),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     AppVersion.APP_VERSION_NUMBER,
                    //     style: infoStyle.copyWith(
                    //         fontSize: 15, color: Colors.amber),
                    //   ),
                    // )
                  ]),
            ))));
  }
}
