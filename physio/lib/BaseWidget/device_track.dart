// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physio/BaseWidget/base_image_widget.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/raddi.dart';
import '../constants/text_constants.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';
import '../utility/gap_between.dart';

class DeviceDetails extends StatefulWidget {
  const DeviceDetails({Key? key}) : super(key: key);

  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  List<ContentModel> deviceDeyails = [];

  int slideIndex = 0;
  void getSelfAssessmentData() async {
    var deviceDetailsList = await HomePageApi().getHomePageContentData(52);

    setState(() {
      deviceDeyails = deviceDetailsList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelfAssessmentData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.29,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: deviceDeyails.length,
              itemBuilder: (BuildContext context, int index) {
               
                return InkWell(
                  onTap: (){
                     setState(() {
                  slideIndex = index;
                });
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: Raddi.textFieldBorderRadius,
                      ),
                      elevation: 1,
                      color: const Color(0xff1C1C1E),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  deviceDeyails[index].featured_image.toString(),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width*0.15,
                                  height: MediaQuery.of(context).size.height*0.12,
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                Container(
                                  width: 50,
                                  height: 1,
                                  // Thickness
                                  color: Color(0xff707070),
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                  text: deviceDeyails[index].title.toString(),
                                  textStyle: midheadertext,
                                ),
                                verticalGap(context: context, screenSize: 0.02),
                                getText(
                                  text: deviceDeyails[index].subtitle.toString(),
                                  textStyle: iconlablecolor,
                                )
                              ]),
                        ),
                      )),
                );
              }),
        ),
         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < deviceDeyails.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
      ],
    );
  }
   Widget _buildPageIndicator({required bool isCurrentPage, int? index}) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : const Color(0xFF727272),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
