import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

var windowWidth;
var windowHeight;

class _MessagesState extends State<Messages> {
  final List<String> _elements = [
    'Blue Defender',
    'MilkA1Baby',
    'LovesBoost',
    'Edgymnerch',
    'Ortspoon',
    'Oranolio',
    'OneMama',
    'Dravenfact',
    'Reallychel',
    'Reakefit',
    'Popularkiya',
    'Breacche',
    'Blikimore',
    'StoneWellFo',
    'Simmson',
    'BrightHulk',
    'Bootecia',
    'Spuffyffet',
    'Rozalthiric',
    'Bookman'
  ];
  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: Container(
            color: AppColors.kBGcolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalGap(context: context, screenSize: 0.06),
                Container(
                    color: AppColors.routineCardColor1,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                              iconSize: 20,
                              onPressed: () {}),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.more_square),
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.plus),
                                color: Colors.blue,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          getText(text: 'Messages', textStyle: subheadertext1),
                        ],
                      ),
                      verticalGap(context: context, screenSize: 0.02),
                    ])),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              fillColor: AppColors.SearchBarColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconlyLight.search,
                                      color: Color(0xff9E9EA5))),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.voice,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    horizontalGap(context: context, screenSize: 0.04)
                  ],
                ),
              ],
            ),
          )),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: ListView.builder(
            itemCount: _elements.length,
            itemBuilder: (BuildContext context, index) {
              final item = _elements[index];

              return Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * windowWidth,
                      color: AppColors.calenderColor2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          Badge(
                              position: BadgePosition.topStart(),
                              badgeContent: const Text('03'),
                              badgeColor: Colors.orange,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  fit: StackFit.expand,
                                  children: const [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/DoctorImage.png"),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: -4,
                                        top: 30,
                                        child: Icon(
                                          Icons.add_circle_outline_outlined,
                                          color: AppColors.routineSubheading,
                                          size: 25,
                                        )),
                                  ],
                                ),
                              )),
                          Column(
                            children: [
                              verticalGap(context: context, screenSize: 0.02),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            getText(
                                                text: item,
                                                textStyle: aboutYouText1),
                                          ]),
                                          Row(
                                            children: [
                                              getText(
                                                  text: '9:40 am',
                                                  textStyle: navlablecolor3),
                                              const Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  size: 12,
                                                  color: Colors.white),
                                            ],
                                          )
                                        ]),
                                  ),
                                  horizontalGap(
                                      context: context, screenSize: 0.04)
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: const Text(
                                        'Hope you are feeling better after yesterday’s session. Continue to do…',
                                        style: subtitle2,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )),
                                  horizontalGap(
                                      context: context, screenSize: 0.04),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                ],
              );
            }));
  }
}
