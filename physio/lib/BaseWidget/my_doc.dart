import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import '../constants/text_constants.dart';

class MyRecentDoc extends StatelessWidget {
  final String doctorName;
  final String appintmentTime;
  final VoidCallback onPressed;

  const MyRecentDoc(
      {Key? key,
      required this.doctorName,
      required this.appintmentTime,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: MediaQuery.of(context).size.height * 0.0,
          width: MediaQuery.of(context).size.width * 0.12,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
            ),
            image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    AssetImage("assets/Raniya Sultana (Physiotherapist).png")),
          )),
      title: getText(
        text: "$doctorName",
        textStyle: profilefieldtextStyle,
      ),
      subtitle: getText(
        text: "$appintmentTime",
        textStyle: iconlablecolor,
      ),
      trailing: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 10,
        unratedColor: Colors.grey,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: AppColors.yellowColor),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
