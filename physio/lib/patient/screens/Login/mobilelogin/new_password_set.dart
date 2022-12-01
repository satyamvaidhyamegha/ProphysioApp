// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:physio/patient/screens/Login/mobilelogin/login_screen.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/custom_button.dart';
import '../../../../BaseWidget/passwordtextfield.dart';
import '../../../../BaseWidget/style.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../../services/Auth Service/Auth_service.dart';

class NewPasswordPage extends StatefulWidget {
  final String forgotPasswordEmail;
  NewPasswordPage({required this.forgotPasswordEmail});

  @override
  State<StatefulWidget> createState() {
    return _NewPasswordPagePageState();
  }
}

class _NewPasswordPagePageState extends State<NewPasswordPage> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final AuthAPI _authAPI = AuthAPI();
  String passwordErrorMsg = "Your password does't match.";
  String sucessfullMsg = "Password changed successfully";
  var password = "";
  var email = "";
  String emilErrorMsg = "Email not registered";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordcontroller.dispose();
    _newPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  PasswordField(
                    labelText: 'New Password',
                    controller: _passwordcontroller,
                    onFieldSubmitted: (value) {},
                    onSaved: (val) {
                      password = val!;
                    },
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Password must be six character";
                      }
                    },
                  ),
                  verticalGap(context: context, screenSize: 0.03),
                  PasswordField(
                    labelText: 'Confirm Password',
                    controller: _newPasswordController,
                    onFieldSubmitted: (value) {},
                    onSaved: (val) {
                      password = val!;
                    },
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Password must be six character";
                      }
                    },
                  ),
                  verticalGap(context: context, screenSize: 0.025),
                ]))),
      ),
      bottomSheet: Container(
        color: AppColors.kBGcolor,
        padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
        child: CustomButton(
            onTap: () async {
              var response = await _authAPI.forgotPassword(
                  email: widget.forgotPasswordEmail,
                  newPassword: _passwordcontroller.text,
                  verifyPassword: _newPasswordController.text);

              var decodeData = jsonDecode(response.body);

              if (decodeData['error'] == passwordErrorMsg) {
              } else if (decodeData['message'] == sucessfullMsg) {
                doNavigate(route: LoginPage(), context: context);
              } else {}
            },
            text: Strings.UPDATE_PASSWORD,
            borderRadius: Raddi.buttonCornerRadius,
            buttonColor: AppColors.buttonColor,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width),
      ),
    );
  }
}
