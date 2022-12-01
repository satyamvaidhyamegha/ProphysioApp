import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';
import 'base_image_widget.dart';

class RecomndedSlider extends StatefulWidget {
  const RecomndedSlider({Key? key}) : super(key: key);

  @override
  State<RecomndedSlider> createState() => _RecomndedSliderState();
}

class _RecomndedSliderState extends State<RecomndedSlider> {
  List<ContentModel> recomdedForYou = [];
  int slideIndex = 0;
  void getCareIdeaList() async {
    var recomndedList = await HomePageApi().getHomePageContentData(47);

    setState(() {
      recomdedForYou = recomndedList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCareIdeaList();
  }

  int? _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return recomdedForYou.isNotEmpty? Column(
      children: [
        CarouselSlider.builder(
            itemCount: recomdedForYou.length,
            options: CarouselOptions(
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlayCurve: Curves.fastOutSlowIn,
              height:  MediaQuery.of(context).size.height*0.27,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              disableCenter: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: true,
//aspectRatio: 15,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  slideIndex=index;
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
                        child: Stack(children: <Widget>[
                          Image.network(
                            recomdedForYou[index].featured_image.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: const Color(0xff1C1C1E),
                                ),
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        getText(
                                          text: DateFormat.d().format(
                                              DateTime.parse(recomdedForYou[index]
                                                  .createdAt
                                                  .toString())),
                                          textStyle: bluetext,
                                        ),
                                        Text(
                                            DateFormat.MMM().format(DateTime.parse(
                                                recomdedForYou[index]
                                                    .createdAt
                                                    .toString())),
                                            style: const TextStyle(
                                              color: Color(0xffebebf599),
                                              fontFamily: "Mulish",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            )),
                                      ]),
                                )),
                          ),
                        ])),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: Margins.basePadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getText(
                              text: recomdedForYou[index].title.toString(),
                              textStyle: labletextStyle,
                            ),
                            getText(
                              text: recomdedForYou[index].subtitle.toString(),
                              textStyle: iconlablecolor,
                            )
                          ],
                        ),
                      ),
                    )
                  ]));
            }),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < recomdedForYou.length; i++)
            i == slideIndex
                ? _buildPageIndicator(isCurrentPage: true, index: i)
                : _buildPageIndicator(isCurrentPage: false, index: i),
        ]),
      ],
    ):Container(height:  MediaQuery.of(context).size.height*0.27, child: Center(child: CircularProgressIndicator(),),
        
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
