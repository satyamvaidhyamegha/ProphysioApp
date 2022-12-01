import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/custom_button.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/utility/gap_between.dart';

class FoodLifeStyleCard extends StatelessWidget {
  String firstText;
  String secondText;
  Color colors;
  String imagePath;

  FoodLifeStyleCard(
      {required this.firstText,
      required this.secondText,
      required this.imagePath,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: Margins.PAGE_CONTENT_MARGINS,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  verticalGap(context: context, screenSize: 0.02),
                  Text(
                    firstText,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Text(
                    secondText,
                    style: TextStyle(color: Color(0xffCCCCCC), fontSize: 14),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width / 0.3,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              
            ]),
          )),
    );
  }
}
