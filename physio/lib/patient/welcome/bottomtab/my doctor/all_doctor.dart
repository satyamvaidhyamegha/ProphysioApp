import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:physio/patient/welcome/bottomtab/my%20doctor/booking_details.dart';
import 'package:physio/patient/welcome/model/doctordetail.dart';

import '../../../../BaseWidget/base_image_widget.dart';
import '../../../../BaseWidget/style.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/string.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';
import '../../../../utility/navigation.dart';

class AllDoctorListScreen extends StatefulWidget {
  const AllDoctorListScreen({Key? key}) : super(key: key);

  @override
  State<AllDoctorListScreen> createState() => _AllDoctorListScreenState();
}

class _AllDoctorListScreenState extends State<AllDoctorListScreen> {
   List<DoctordetailCard> doctorvalcarddetail = List.generate(
    doctordetailCardval.length,
    (index) => DoctordetailCard(
      education: doctordetailCardval[index]["education"],
      hospitalname: doctordetailCardval[index]["hospitalname"],
      image: doctordetailCardval[index]["image"],
      lastcontanct: doctordetailCardval[index]["lastcontanct"],
      doctorname: doctordetailCardval[index]["doctorname"],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allDoctorBackGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        backgroundColor: AppColors.allDoctorBackGroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {
                 Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        title:
            getText(text: "All Doctors", textStyle: BaseStyles.appBarTextStyle),
        actions: [
           IconButton(
              onPressed: () {
                doNavigate(route: BookingDetails(), context: context);
              },
              icon: ImageIcon(
                getAssetImage(
                  imagePath: ImagePath.CAMERA_ICON,
                ),
                color: Colors.blue,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                getAssetImage(
                  imagePath: ImagePath.UPLOAD_ICON,
                ),
                color: Colors.blue,
                size: 25,
              )),
          
        ],
      ),
      body:   Padding(
        padding: Margins.PAGE_CONTENT_MARGINS.copyWith(top: 20),
        child: ListView.builder(
            itemCount: doctorvalcarddetail.length,
            shrinkWrap: false,
           
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.PROFILE_CARD_COLOR
                    ),
                    child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: MediaQuery.of(context).size.height*0.14,
                                width: MediaQuery.of(context).size.width*0.24,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: getAssetImage(
                                        imagePath:
                                            doctorvalcarddetail[
                                                    index]
                                                .image,
                                      )),
                                )),
                          ),
                          horizontalGap(
                              context: context, screenSize: 0.025),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  getText(
                                    text:
                                        doctorvalcarddetail[index]
                                            .doctorname,
                                    textStyle:
                                        profilefieldtextStyle,
                                  ),
                                  verticalGap(
                                      context: context,
                                      screenSize: 0.01),
                                  getText(
                                    text:
                                        doctorvalcarddetail[index]
                                            .education,
                                    textStyle: info1style,
                                  ),
                                  // verticalGap(
                                  //     context: context,
                                  //     screenSize: 0.01),
                                  getText(
                                    text:
                                        doctorvalcarddetail[index]
                                            .hospitalname,
                                    textStyle: info1style,
                                  ),
                                  verticalGap(
                                      context: context,
                                      screenSize: 0.015),
                                  getText(
                                    text:
                                        doctorvalcarddetail[index]
                                            .lastcontanct,
                                    textStyle: info1style,
                                  )
                                ]),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0,),
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 11,
                                unratedColor: Colors.grey,
                                itemPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                itemBuilder: (context, _) =>
                                    const Icon(Icons.star,
                                        size: 10,
                                        color: Color(0xffFFBA00)),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ))
                        ]),
                  ));
            }),
      ),
    );
  }
}
