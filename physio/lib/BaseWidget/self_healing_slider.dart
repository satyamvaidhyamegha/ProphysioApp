import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/raddi.dart';
import '../constants/text_constants.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';
import '../utility/gap_between.dart';

class SelfHealing extends StatefulWidget {
  const SelfHealing({Key? key}) : super(key: key);

  @override
  State<SelfHealing> createState() => _SelfHealingState();
}

class _SelfHealingState extends State<SelfHealing> {
  List<ContentModel> selfHealing = [];
  int slideIndex = 0;
  void getSelfAssessmentData() async {
    var selfHealingList = await HomePageApi().getHomePageContentData(50);

    setState(() {
      selfHealing = selfHealingList;
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
    return selfHealing.isNotEmpty
        ? Column(
          children: [
            CarouselSlider.builder(
                itemCount: selfHealing.length,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height*0.4,
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
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(children: <Widget>[
                      ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10.0)),
                          child: Stack(children: <Widget>[
                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    child: Image.network(
                                      selfHealing[index].featured_image.toString(),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 200,
                                    )),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: Margins.basePadding,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        getText(
                                          text: selfHealing[index].title.toString(),
                                          textStyle: subheadertext,
                                        ),
                                        verticalGap(
                                            context: context, screenSize: 0.01),
                                        getText(
                                          text: selfHealing[index]
                                              .description
                                              .toString(),
                                          textStyle: inputfieldtextStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ])),
                      Positioned(
                        top: 90,
                        left: 120,
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent.withOpacity(
                                0.5,
                              )),
                          child: Center(
                              child: getText(
                            text: selfHealing[index].subtitle.toString(),
                            textStyle: subheadertext.copyWith(fontSize: 14),
                          )),
                        ),
                      )
                    ]),
                  );
                }),
                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < selfHealing.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
          ],
        )
        : Container(
            height: MediaQuery.of(context).size.height*0.4,
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
