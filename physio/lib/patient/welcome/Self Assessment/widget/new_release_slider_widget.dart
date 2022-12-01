// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:physio/patient/model/Food%20and%20Style/Goals/Content%20Folder/content_model.dart';
import 'package:physio/patient/services/home%20page%20services/home_page_api.dart';
import '../../../../BaseWidget/text.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/raddi.dart';
import '../../../../constants/text_constants.dart';
import '../../../../utility/gap_between.dart';

class NewReleaseSliderWidget extends StatefulWidget {
  const NewReleaseSliderWidget({Key? key}) : super(key: key);

  @override
  State<NewReleaseSliderWidget> createState() =>
      _NewReleaseSliderWidgetState();
}

class _NewReleaseSliderWidgetState extends State<NewReleaseSliderWidget> {
  final CarouselController controller = CarouselController();
  final _searchController = TextEditingController();
  int _current = 0;
  int slideIndex = 0;
  List<ContentModel> selfAssessment = [];
  void getSelfAssessmentData() async {
    var selfAssessmentList = await HomePageApi().getHomePageContentData(48);

    setState(() {
      selfAssessment = selfAssessmentList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelfAssessmentData();
  }

  int? _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getText(
              text: "New Release",
              textStyle: profilefieldtextStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.routinHeadingColor)),
                  verticalGap(context: context, screenSize: 0.02),
       selfAssessment.isNotEmpty? CarouselSlider.builder(
            itemCount: selfAssessment.length,
            carouselController: controller,
            options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 0.75,
              height: MediaQuery.of(context).size.height*0.28,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  slideIndex = index;
                });
              },
            ),
            itemBuilder: (BuildContext context, int index, int realIdx) {
              return Card(
                  color: const Color(0xff1C1C1E),
                  elevation: 6.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Stack(children: <Widget>[
                    ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10.0)),
                        child: Image.network(
                          selfAssessment[index].featured_image.toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        )),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: Margins.basePadding.copyWith(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText(
                              text: selfAssessment[index].title.toString(),
                              textStyle: labletextStyle,
                            ),
                             verticalGap(context: context, screenSize: 0.008),
                            Text(
                                "${selfAssessment[index].reading_time.toString()} minutes",
                                style: const TextStyle(
                                  color: Color(0xffebebf599),
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    )
                  ]));
            }):Container(height: MediaQuery.of(context).size.height*0.27,child: Center(child: CircularProgressIndicator()),),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < selfAssessment.length; i++)
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
