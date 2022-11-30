import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/screens/Home/reports_38.dart';
import 'package:physio/utility/gap_between.dart';

class MyCare_29 extends StatefulWidget {
  const MyCare_29({Key? key}) : super(key: key);

  @override
  State<MyCare_29> createState() => _MyCare_29State();
}

class _MyCare_29State extends State<MyCare_29> {
  var windowWidth;

  // ignore: prefer_typing_uninitialized_variables
  var windowHeight;
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: initScreen(context),
    );
  }
}

initScreen(BuildContext context) {
  final TextEditingController myCareSearch = TextEditingController();
  ScrollController mycontroller1 = ScrollController();
  ScrollController mycontroller2 = ScrollController();
  return Scaffold(
    backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(170),
      child: Container(
        color: const Color.fromRGBO(34, 34, 34, 1),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.07,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const reports_38()),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "Give Reasons\nFor Cancelling",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    body: ListView(
      scrollDirection: Axis.vertical,
      controller: mycontroller1,
      addAutomaticKeepAlives: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                hintText: 'Ex: Not able to make it due to\nfamily emergency',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 15),
        ),
        verticalGap(context: context, screenSize: 0.2),
        horizontalGap(context: context, screenSize: 0.07),
        Padding(
          padding: Margins.basePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: TextButton(
                style: TextButton.styleFrom(primary: Colors.blue
                    // foreground
                    ),
                onPressed: () {},
                child: getText(text: 'Cancel', textStyle: cancel),
              )),
              verticalGap(context: context, screenSize: 0.02),
              horizontalGap(context: context, screenSize: 0.8),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 145.0, vertical: 18.0),
                    shape: const StadiumBorder(),
                  ),
                  child: buttonText(text: 'Next', textStyle: sessionSubmit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog1(context),
                    );
                  },
                ),
              ),
              verticalGap(context: context, screenSize: 0.02),
              horizontalGap(context: context, screenSize: 0.04)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildPopupDialog1(BuildContext context) {
  return SingleChildScrollView(
      child: BlurryContainer(
          child: Column(children: [
    verticalGap(context: context, screenSize: 0.2),
    BlurryContainer(
      blur: 10,
      child: Column(
        children: [
          Container(
            width: 400,
            height: 380,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
                bottomLeft: Radius.circular(22.0),
                bottomRight: Radius.circular(22.0),
              ),
              color: Color.fromRGBO(28, 28, 30, 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    verticalGap(context: context, screenSize: 0.08),
                    horizontalGap(context: context, screenSize: 0.80),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.textColor, width: 2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: AppColors.textColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: getText(
                          text: ' Session report cancelled', textStyle: popup),
                    ),
                  ],
                ),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.3),
                    Container(
                        height: 84,
                        width: 84,
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/DoctorImage.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.25),
                    getText(
                        text: 'Ashish Mehta (M, 67)', textStyle: sessionSubmit)
                  ],
                ),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.25),
                    getText(
                        text: 'Last session - 12/2/22',
                        textStyle: popupcontent1)
                  ],
                ),
                verticalGap(context: context, screenSize: 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.08),
                    getText(
                        text: 'Reason for declining', textStyle: sessionSubmit)
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.08),
                    getParaText(
                        text:
                            'Not able to make it due to reasons\npertaining to family emergency',
                        textStyle: popupcontent1),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  ])));
}
