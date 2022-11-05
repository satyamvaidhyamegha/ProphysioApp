import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class GiveReason extends StatefulWidget {
  const GiveReason({super.key});

  @override
  State<GiveReason> createState() => _GiveReasonState();
}

var windowWidth;
var windowHeight;

class _GiveReasonState extends State<GiveReason> {
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: AppBar(
        backgroundColor: AppColors.signupBackground,
        title: Row(children: [
          Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.002,
              ),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  iconSize: 20,
                  onPressed: () {})),
          horizontalGap(context: context, screenSize: 0.02),
          getText(text: 'Session Report', textStyle: BaseStyles.sessionreport),
        ]),
      ),
      body: initScreen(context),
      bottomNavigationBar: SizedBox(
          height: 90,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 160.0, vertical: 18.0),
                      shape: const StadiumBorder(),
                    ),
                    child: getText(
                        text: 'Next',
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                    onPressed: () {}),
                verticalGap(context: context, screenSize: 0.02)
              ])),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: Column(
          children: [
            verticalGap(context: context, screenSize: 0.03),
            Row(children: [
              horizontalGap(context: context, screenSize: 0.04),
              getText(
                  text: 'Patient Complaint',
                  textStyle: professionProfileHeading1)
            ]),
            verticalGap(context: context, screenSize: 0.01),
            horizontalGap(context: context, screenSize: 0.04),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    suffixIcon: IconButton(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      icon: const Icon(
                        IconlyLight.voice,
                        color: Colors.white,
                      ),
                      onPressed: () => {},
                    ),
                    hintText:
                        'Ex: Patient has been back pain and low \nback pain',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5),
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(children: [
              horizontalGap(context: context, screenSize: 0.04),
              getText(
                  text: 'Patient Complaint',
                  textStyle: professionProfileHeading1)
            ]),
            verticalGap(context: context, screenSize: 0.01),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    suffixIcon: IconButton(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      icon: const Icon(
                        IconlyLight.voice,
                        color: Colors.white,
                      ),
                      onPressed: () => {},
                    ),
                    hintText:
                        'Add any motion to conduct the session \nwith patient',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5),
            ),
          ],
        ));
  }
}
