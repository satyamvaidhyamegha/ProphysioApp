// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:physio/patient/services/Auth%20Service/user_details.dart';
import 'package:physio/patient/services/Food%20and%20LifeStyle/food_and_lifestyle.dart';

import '../../../BaseWidget/custom_button.dart';
import '../../../BaseWidget/style.dart';
import '../../../BaseWidget/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/raddi.dart';
import '../../../constants/string.dart';
import '../../../utility/gap_between.dart';
import '../../model/user_model/user_result.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        title: getText(text: "Profile", textStyle: BaseStyles.appBarTextStyle),
        leading: getBackIconButton(context: context),
        actions: [
          Container(
              margin: Margins.basePadding,
              child: ImageIcon(
                AssetImage(
                  ImagePath.EDIT_ICON,
                ),
                color: Colors.blue,
                size: 20,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder<UserResult>(
                        future: UserDetailsApi().getUserData(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.image != null
                                ? Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!.image
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              ImagePath.PROFILE_ICON,
                                            ),
                                            fit: BoxFit.cover)));
                          } else {
                            return Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: AssetImage(ImagePath.PROFILE_ICON),
                                      fit: BoxFit.cover)),
                            );
                          }
                        })),
                    horizontalGap(context: context, screenSize: 0.03),
                    Expanded(
                      child: FutureBuilder<UserResult>(
                        future: UserDetailsApi().getUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                    text: snapshot.data!.name.toString(),
                                    textStyle: TextStyle(
                                        fontSize: 34,
                                        color: Color.fromRGBO(245, 245, 245, 1),
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.normal)),
                                getText(
                                    text: "MBBS, Movements Specialist",
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.PROFILE_SUBTITLE_COLOR,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.normal)),
                                getText(
                                    text: "Manipal Hospital, Indira Nagar",
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.PROFILE_SUBTITLE_COLOR,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.normal)),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.05),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: getText(
                      text: "Contact info",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                FutureBuilder<UserResult>(
                  future: UserDetailsApi().getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.43,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: AppColors.PROFILE_CARD_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                Margins.basePadding.copyWith(top: 20, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                    text: "Mobile No.",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snapshot.data!.phone != null
                                        ? snapshot.data!.phone.toString()
                                        : "------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Alternate No.",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snapshot.data!.phone2 != null
                                        ? snapshot.data!.phone2.toString()
                                        : "-------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Emergency contact",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: "Megeta Kumat - +919126062650",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Email",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snapshot.data!.email != null
                                        ? snapshot.data!.email.toString()
                                        : "-------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Address",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snapshot.data!.address.toString(),
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "DOB",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snapshot.data!.date_of_birth != null
                                        ? DateFormat('dd-MM-yyyy').format(
                                            DateTime.parse(snapshot
                                                .data!.date_of_birth
                                                .toString()))
                                        : "----",
                                    textStyle: BaseStyles.profileSubtitle),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                verticalGap(context: context, screenSize: 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "Health info",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColors.PROFILE_CARD_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: Margins.basePadding.copyWith(top: 20, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                              text: "Health history",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text:
                                  "Heart surgery in 2014\nLow BP patient\nDiabetic",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Complaint",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "Back pain & wrist injury",
                              textStyle: BaseStyles.profileSubtitle),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "General info",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColors.PROFILE_CARD_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: Margins.basePadding.copyWith(top: 20, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                              text: "Profession",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "Business man",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Food preferance",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "Vegetarian",
                              textStyle: BaseStyles.profileSubtitle),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "Vital info",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                FutureBuilder<UserResult>(
                  future: UserDetailsApi().getUserData(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return Container(
                        //height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: AppColors.PROFILE_CARD_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                Margins.basePadding.copyWith(top: 10, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                    text: "Weight",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snap.data!.weight != null
                                        ? snap.data!.weight.toString()
                                        : "---------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Blood Group",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snap.data!.blood_group != null
                                        ? snap.data!.blood_group.toString()
                                        : "---------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                    text: "Height",
                                    textStyle: BaseStyles.profileTitle),
                                getText(
                                    text: snap.data!.height != null
                                        ? "${snap.data!.height} cm"
                                        : "---------",
                                    textStyle: BaseStyles.profileSubtitle),
                                verticalGap(context: context, screenSize: 0.01),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                verticalGap(context: context, screenSize: 0.02),
                Container(
                    //color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(ImagePath.BODY_MASS_IMAGE)),
                verticalGap(context: context, screenSize: 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "Health Goals",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColors.PROFILE_CARD_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: Margins.basePadding.copyWith(top: 20, left: 15),
                      child: Wrap(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Chip(
                                label: getText(
                                    text: "Lose weight",
                                    textStyle: BaseStyles.profileSubtitle
                                        .copyWith(color: Colors.black))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Chip(
                                label: getText(
                                    text: "Reduce stress",
                                    textStyle: BaseStyles.profileSubtitle
                                        .copyWith(color: Colors.black))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Chip(
                                label: getText(
                                    text: "Improve fitness",
                                    textStyle: BaseStyles.profileSubtitle
                                        .copyWith(color: Colors.black))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: getText(
                      text: "Other info",
                      textStyle:
                          BaseStyles.appBarTextStyle.copyWith(fontSize: 22)),
                ),
                verticalGap(context: context, screenSize: 0.01),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: AppColors.PROFILE_CARD_COLOR,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: Margins.basePadding.copyWith(top: 20, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getText(
                              text: "Patient ID",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "PHY 67654",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Member since",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "12th Dec 2019",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Referred by",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "Dr. Sandhya G",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                          getText(
                              text: "Membership Type",
                              textStyle: BaseStyles.profileTitle),
                          getText(
                              text: "Pro Gold Subscriber",
                              textStyle: BaseStyles.profileSubtitle),
                          verticalGap(context: context, screenSize: 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(context: context, screenSize: 0.05),
                CustomButton(
                    onTap: () {},
                    text: "Rest Profile",
                    borderRadius: Raddi.buttonCornerRadius,
                    buttonColor: AppColors.buttonColor,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width),
                // verticalGap(context: context, screenSize: 0.05),
                TextButton(
                    onPressed: () {
                      FoodAndLifeStyle().getFoodAndLifeStyle('23');
                    },
                    child: Text(
                      "check",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
