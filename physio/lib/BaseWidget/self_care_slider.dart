import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/style.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';

class SelfCareSlider extends StatefulWidget {
  const SelfCareSlider({Key? key}) : super(key: key);

  @override
  State<SelfCareSlider> createState() => _SelfCareSliderState();
}

class _SelfCareSliderState extends State<SelfCareSlider> {
  List<ContentModel> selfCare = [];
  int slideIndex = 0;
  void getSelfAssessmentData() async {
    var selfCareList = await HomePageApi().getHomePageContentData(49);

    setState(() {
      selfCare = selfCareList;
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
    return selfCare.isNotEmpty
        ? Column(
          children: [
            CarouselSlider.builder(
                itemCount: selfCare.length,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * 0.27,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                      slideIndex=index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIdx) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              selfCare[index].featured_image.toString(),
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(
                                    text: selfCare[index].title.toString(),
                                    textStyle: BaseStyles.selfCareTextStyle),
                                Text(selfCare[index].subtitle.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    )),
                                Text(selfCare[index].description.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    )),
                              ]),
                        )
                      ],
                    ),
                  );
                }),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < selfCare.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
          ],
        )
        : Container(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Center(
              child: CircularProgressIndicator(),
            ),
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
