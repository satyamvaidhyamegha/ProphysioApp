// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:physio/patient/screens/Login/mobilelogin/forgot_password_otp.dart';
import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/custom_button.dart';
import '../../../../BaseWidget/inputtextfield.dart';
import '../../../../BaseWidget/style.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';
import '../../../services/Auth Service/Auth_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPagePageState();
  }
}

class _ForgotPasswordPagePageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailcontroller = TextEditingController();

  var email = "";
  String userNotFound = "User Not Found";
  String successMsg =
      "Mail has been sent to user, Enter OTP to verify your account";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthAPI _authAPI = AuthAPI();

  
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
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
              image:
                  getAssetImage(imagePath: ImagePath.REGISTER_BACKGROUND_IMAGE),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              verticalGap(context: context, screenSize: 0.1),
              getText(
                  text: Strings.FORGOT_PASSWORD,
                  textStyle: BaseStyles.headingTextStyle),
              verticalGap(context: context, screenSize: 0.3),
              InputField(
                icon: Icons.email,
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
                }, onChanged: (String value) {  },
              ),
              verticalGap(context: context, screenSize: 0.06),
              CustomButton(
                  onTap: () async {
                    EasyLoading.show(status: "Please wait ....");
                    var req = await _authAPI.sendotp(_emailcontroller.text);

                    var apiReq = jsonDecode(req.body);
                    if (apiReq['error'] == userNotFound) {
                      EasyLoading.dismiss();
                      Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: userNotFound,
                          backgroundColor: Colors.red,
                          textColor: AppColors.textColor);
                    } else if (apiReq['message'] == successMsg) {
                      EasyLoading.showSuccess("Done");
                      doNavigate(
                          route: ForgotPasswordOtp(
                            enteredEmail: _emailcontroller.text,
                          ),
                          context: context);
                    } else {
                      EasyLoading.dismiss();
                      Fluttertoast.showToast(
                          fontSize: 18,
                          gravity: ToastGravity.TOP,
                          msg: "Server busy",
                          backgroundColor: Colors.red,
                          textColor: AppColors.textColor);
                    }
                  },
                  text: Strings.SUBMIT,
                  borderRadius: Raddi.buttonCornerRadius,
                  buttonColor: AppColors.buttonColor,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width),
            ]),
          )),
    ));
  }
}
