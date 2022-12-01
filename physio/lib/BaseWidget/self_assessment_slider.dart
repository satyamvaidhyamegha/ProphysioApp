import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/raddi.dart';
import '../constants/text_constants.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';

class AssesmentSlider extends StatefulWidget {
  const AssesmentSlider({Key? key}) : super(key: key);

  @override
  State<AssesmentSlider> createState() => _AssesmentSliderState();
}

class _AssesmentSliderState extends State<AssesmentSlider> {
   List<ContentModel> selfAssessment = [];
   int slideIndex = 0;
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
    return selfAssessment.isNotEmpty? Column(
      children: [
        CarouselSlider.builder(
            itemCount: selfAssessment.length,
            options: CarouselOptions(
              viewportFraction: 0.75,
              height: MediaQuery.of(context).size.height*0.27,
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
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(10.0)),
                        child: Image.network(selfAssessment[index].featured_image.toString(),fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,)),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: Margins.basePadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText(
                              text: selfAssessment[index].title.toString(),
                              textStyle: labletextStyle,
                            ),
                            Text("${selfAssessment[index].reading_time.toString()} minutes",
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
            }),
             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < selfAssessment.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
      ],
    ):Container(height:  MediaQuery.of(context).size.height*0.27, child: Center(child: CircularProgressIndicator(),),);
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
