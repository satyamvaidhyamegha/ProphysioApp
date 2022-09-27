
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../BaseWidget/base_image_widget.dart';
import '../../BaseWidget/text.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../constants/style.dart';
import '../../constants/text_constants.dart';

class AuthPage extends StatefulWidget{
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
                        image:
                        getAssetImage(imagePath: ImagePath.AUTH_SCREEN),
                        fit: BoxFit.cover,
                      ),
                    ),
          child: Column(
            children: [
             Padding(padding: EdgeInsets.all(45)),

                Align(alignment: Alignment.centerLeft,
                   child: Container(
                     child: Text("Let's verify",
                     style:BaseStyles.textStyleForAuthScreen),
                     padding: EdgeInsets.only(left: 20),
                   ),
                    ),

              Align(alignment: Alignment.centerLeft,
                child: Container(
                  child: Text("your details!",
                      style:BaseStyles.textStyleForAuthScreen),
                  padding: EdgeInsets.only(left: 20,bottom: 50),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left:20,right: 20,bottom: 30,top: 30 ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[300]),
                      hintText: "First Name",
                      fillColor: Colors.black54),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 30,left: 20,right: 20 ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[300]),
                      hintText: "Last Name",
                      fillColor: Colors.black54),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 120,left: 20,right: 20),
                child: TextField(
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
              
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height:
                  MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.buttonColor),
                  child: Center(
                    child: getText(
                        textAlign: TextAlign.center,
                        text: Strings.BTN_OTP,
                        textStyle: buttonTextStyle),
                  )
              ),

              Container(
                  margin: EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 10),
              child:Divider(
                color: Colors.white,
              )
              ),

              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 20),
                child: getText(
                    textAlign: TextAlign.center,
                    text: "Don't have Indian number?",
                    textStyle: numberText),
              ),

              Container(
                margin: EdgeInsets.only(right: 20,left: 20,bottom: 10),
                child: getText(
                    textAlign: TextAlign.center,
                    text: "Click here",
                    textStyle: authtext),
              )
            ],

                ),
              )

          );



  }

}