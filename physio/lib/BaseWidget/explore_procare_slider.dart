import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';

class ExploreProcareSlider extends StatefulWidget {
  const ExploreProcareSlider({Key? key}) : super(key: key);

  @override
  State<ExploreProcareSlider> createState() => _ExploreProcareSliderState();
}

class _ExploreProcareSliderState extends State<ExploreProcareSlider> {
  // List<ContentModel> exploreProCare = [];
  List exploreProCare = [];
   int slideIndex = 0;
  void getSelfAssessmentData() async {
    var exploreProCareList = await HomePageApi().getHomePageContentData(51);

    setState(() {
      exploreProCare = exploreProCareList;
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
    return exploreProCare.isNotEmpty? Column(
      children: [
        CarouselSlider.builder(
            itemCount: exploreProCare.length,
            options: CarouselOptions(
              viewportFraction: 0.8,
              height: MediaQuery.of(context).size.height*0.27,
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
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                 exploreProCare[index].featured_image.toString(),
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8))));
            }),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < exploreProCare.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
      ],
    ):Container(
            height: MediaQuery.of(context).size.height*0.27,
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
