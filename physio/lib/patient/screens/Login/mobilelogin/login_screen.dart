// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/screens/Login/mobilelogin/signup_screen.dart.dart';
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
import '../../../../utility/delete_share_pref_data.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../../services/Auth Service/Auth_service.dart';
import '../../../welcome/welcomeuser.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPagePageState();
  }
}

class _LoginPagePageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  var password = "";
  var email = "";
  String passwordErrorMsg = "Incorrect Password";
  String emilErrorMsg = "Email not registered";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () {
          EasyLoading.dismiss();
        },
        child: Scaffold(
            // backgroundColor: ColorConstants.kBGcolor,
            body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getAssetImage(
                      imagePath: ImagePath.REGISTER_BACKGROUND_IMAGE),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    verticalGap(context: context, screenSize: 0.1),
                    getText(
                        text: Strings.WELCOME,
                        textStyle: BaseStyles.headingTextStyle),
                    const SizedBox(height: 10),
                    getText(
                        text: Strings.SIGNIN_CONTINUE,
                        textStyle: BaseStyles.subHeadingTextStyle),
                    verticalGap(context: context, screenSize: 0.18),
                    InputField(
                      icon: Icons.person_outline_rounded,
                      labelText: Strings.USER_EMAIL,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: _emailcontroller,
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
                      controller: _passwordcontroller,
                      onFieldSubmitted: (value) {},
                      onSaved: (val) {
                        password = val!;
                      },
                      validator: (value) {
                        if (value!.length < 6) {
                          return "${Strings.PASSWORD} must be six character";
                        }
                      },
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                        onPressed: () {
                          doNavigate(
                              route: ForgotPasswordPage(), context: context);
                        },
                        child: getText(
                            text: Strings.FORGOT_PASSWORD,
                            textStyle: BaseStyles.forgotPasswordTextStyle),
                      )
                    ]),
                    verticalGap(context: context, screenSize: 0.03),
                    CustomButton(
                        onTap: () async {
                          var loginReq = await _authAPI.login(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text);

                          var resReq = json.decode(loginReq.body);
                          if (resReq['error'] == passwordErrorMsg &&
                              loginReq.statusCode == 200) {
                            Fluttertoast.showToast(
                                fontSize: 18,
                                gravity: ToastGravity.TOP,
                                msg: "$passwordErrorMsg",
                                backgroundColor: Colors.red,
                                textColor: AppColors.textColor);
                          } else if (resReq['error'] == emilErrorMsg) {
                            Fluttertoast.showToast(
                                fontSize: 18,
                                gravity: ToastGravity.TOP,
                                msg: ErrorMsg.EMAIL_INCORRECT,
                                backgroundColor: ErrorColor.errorColorRed,
                                textColor: AppColors.textColor);
                          } else if (_emailcontroller.text == '' &&
                              _passwordcontroller.text == '') {
                            Fluttertoast.showToast(
                                fontSize: 18,
                                gravity: ToastGravity.TOP,
                                msg: ErrorMsg.PLEASE_ENTER_CORRECT_DETAILS,
                                backgroundColor: ErrorColor.errorColorRed,
                                textColor: AppColors.textColor);
                          } else {
                            //doNavigate(route: ProActive(), context: context);
                            doNavigate(route: Welcomeuser(), context: context);

                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setString('userToken', resReq['token']);
                            prefs.setInt("userId", resReq['result']['id']);
                            prefs.setString(
                                "userEmail", resReq['result']['email']);
                          }
                          // final SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // print(prefs.getString('userEmail'));
                        },
                        text: Strings.SIGN_IN,
                        borderRadius: Raddi.buttonCornerRadius,
                        buttonColor: AppColors.buttonColor,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width),
                    verticalGap(context: context, screenSize: 0.025),
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
                    verticalGap(context: context, screenSize: 0.025),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding:Margins.basePadding,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyColors),
                                borderRadius: Raddi.buttonCornerRadius),
                            child: Center(
                              child:  Image(
                                image: AssetImage(
                                  CustomLogo.GOOGLE_LOGO,
                                ),
                                height: 25,
                                width: 25,
                                color: null,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          horizontalGap(context: context, screenSize: 0.06),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.loginPageBorderColorIcons),
                                borderRadius: Raddi.buttonCornerRadius),
                            child: IconButton(
                                icon: const FaIcon(FontAwesomeIcons.facebook,
                                    color: AppColors.buttonColor),
                                onPressed: () {}),
                          ),
                          horizontalGap(context: context, screenSize: 0.06),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.loginPageBorderColorIcons),
                                  borderRadius: Raddi.buttonCornerRadius),
                              child: IconButton(
                                  icon: const FaIcon(FontAwesomeIcons.apple,
                                      color: AppColors.textColor),
                                  onPressed: () {}))
                        ]),
                    verticalGap(context: context, screenSize: 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            text: Strings.NOT_REGISTER_YET,
                            textStyle: BaseStyles.signInText
                                .copyWith(color: AppColors.baseTextColor)),
                        horizontalGap(context: context, screenSize: 0.015),
                        TextButton(
                            onPressed: () {
                              doNavigate(route: SigninPage(), context: context);
                            },
                            child: getText(
                                text: Strings.CREATE_ACCOUNT,
                                textStyle: BaseStyles.signInText))
                      ],
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                  ]))),
        )),
      ),
    );
  }
}
