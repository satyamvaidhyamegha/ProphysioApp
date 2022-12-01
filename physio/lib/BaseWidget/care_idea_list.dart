import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';
import '../patient/model/Food and Style/Goals/Content Folder/content_model.dart';
import '../patient/services/home page services/home_page_api.dart';

class AllCareIdeas extends StatefulWidget {
  const AllCareIdeas({Key? key}) : super(key: key);

  @override
  State<AllCareIdeas> createState() => _AllCareIdeasState();
}

class _AllCareIdeasState extends State<AllCareIdeas> {
  List<ContentModel> careIdeasList = [];

  void getCareIdeaList() async {
    var careIdea = await HomePageApi().getHomePageContentData(46);

    setState(() {
      careIdeasList = careIdea;
    });
  }

  @override
  void initState() {
    getCareIdeaList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return careIdeasList.isNotEmpty
        ? Container(
        
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: careIdeasList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return careIdeasList[index].featured_image!.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: Raddi.k12px,
                            color: AppColors.PROFILE_CARD_COLOR
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 90,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              careIdeasList[index]
                                                  .featured_image
                                                  .toString())),
                                    )),
                                SizedBox(width: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        getText(
                                          text: careIdeasList[index]
                                              .title
                                              .toString(),
                                          textStyle: profilefieldtextStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          careIdeasList[index]
                                              .subtitle
                                              .toString(),
                                          style: iconlablecolor,
                                          overflow: TextOverflow.clip,
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        getText(
                                          text:
                                              "${careIdeasList[index].reading_time} min read",
                                          textStyle: iconlablecolor,
                                        )
                                      ]),
                                )
                              ]),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
              },
            ),
          )
        : Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
