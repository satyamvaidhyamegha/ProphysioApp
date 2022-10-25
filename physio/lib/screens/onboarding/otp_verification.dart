import 'package:flutter/material.dart';
import 'package:physio/API/otp_api_service.dart';
import 'package:physio/API/otp_config.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/string.dart';
import '../../constants/style.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../constants/text_constants.dart';

class OtpVerificationPage extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;

  const OtpVerificationPage({this.mobileNo, this.otpHash});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String _otpCode = "";
  bool _enableButton = false;
  bool enableResendBtn = false;
  final int _otpCodeLength = 4;
  bool isAPICallProcess = false;
  late FocusNode myFocusNode;

  var windowWidth;
  var windowHeight;

  @override
  void initSate() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: initScreen(context));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: getAssetImage(imagePath: ImagePath.OTP_SCREEN),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(45)),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text("Verify Code",
                      style: BaseStyles.textStyleForAuthScreen),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: const Text(
                      "We have sent the code verification \n to your mobile number",
                      style: BaseStyles.otpTextStyle),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 15, top: 70),
                    child: const Text(
                      "+91 7098910064",
                      style: BaseStyles.otpTextStyleTwo,
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 70),
                      child: Image.asset("assets/editicon.png")),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 0, right: 300, left: 15, bottom: 10),
                  child: const Divider(
                    color: Colors.white,
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, bottom: 10, top: 40),
                child:
                    const Text("Enter the OTP", style: BaseStyles.otpTextStyle),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: OtpTextField(
                  numberOfFields: 4,
                  enabledBorderColor: Color(0xFF3C3C3C),
                  filled: true,
                  fillColor: AppColors.buttonVerifyBG,
                  showFieldAsBox: true,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onCodeChanged: (code) {
                    print(code);
                    if (code!.length == _otpCodeLength) {
                      _otpCode = code;
                      _enableButton = true;
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Resend in 00:30s",
                      style: BaseStyles.otpTextStyleThree,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Resend OTP",
                      style: BaseStyles.otpTextStyleFive,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.buttonVerifyBG,
        child: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, bottom: 15),
          child: Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.buttonColor),
            child: GestureDetector(
              onTap: () {
                if (_enableButton) {
                  setState(() {
                    isAPICallProcess = true;
                  });

                  OtpApiService.verifyOtp(
                          widget.mobileNo!, widget.otpHash!, _otpCode)
                      .then((response) {
                    setState(() {
                      isAPICallProcess = false;
                    });

                    if (response.data != null) {
                      //REDIRECT TO HOME SCREEN
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        response.message,
                        "OK",
                        () {
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        response.message,
                        "OK",
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  });
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthPage3()));
              },
              child: Center(
                child: getText(
                    textAlign: TextAlign.center,
                    text: Strings.VERIFY_OTP_TEXT,
                    textStyle: buttonTextStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
}

class CodeAutoFillTestPage extends StatefulWidget {
  @override
  _CodeAutoFillTestPageState createState() => _CodeAutoFillTestPageState();
}

class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
    with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
