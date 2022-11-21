import 'package:flutter/material.dart';

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

import 'package:iconly/iconly.dart';

import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var windowWidth;
var windowHeight;

bool isButtonPressed = true;
bool isButtonPressed1 = false;
bool isButtonPressed2 = false;

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
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
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(270.0),
          child: Container(
            color: AppColors.kBGcolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalGap(context: context, screenSize: 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(text: 'People', textStyle: subheadertext1),
                    horizontalGap(context: context, screenSize: 0.3),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(IconlyLight.chat),
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(IconlyLight.plus),
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(IconlyLight.more_square),
                      color: Colors.blue,
                    ),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: double.infinity,
                  color: AppColors.schedulecard1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.08),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed = !isButtonPressed;

                                if (isButtonPressed = true) {
                                  isButtonPressed1 = false;
                                  isButtonPressed2 = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 5.0),
                              side: isButtonPressed
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'All',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.08),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed1 = !isButtonPressed1;

                                if (isButtonPressed1 = true) {
                                  isButtonPressed = false;
                                  isButtonPressed2 = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              side: isButtonPressed1
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'Patients',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          horizontalGap(context: context, screenSize: 0.08),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonPressed2 = !isButtonPressed2;

                                if (isButtonPressed2 = true) {
                                  isButtonPressed1 = false;
                                  isButtonPressed = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.schedulecard1,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5.0),
                              side: isButtonPressed2
                                  ? const BorderSide(
                                      color: Colors.blue, width: 1)
                                  : const BorderSide(
                                      color: AppColors.schedulecard1, width: 1),
                            ),
                            child: buttonText(
                                text: 'Others',
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                ),
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
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
            child: AlphabetScrollView(
                list: _elements.map((e) => AlphaModel(e)).toList(),
                // isAlphabetsFiltered: false,
                alignment: LetterAlignment.right,
                itemExtent: 100,
                unselectedTextStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue),
                selectedTextStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                overlayWidget: (value) => Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 50,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Theme.of(context).primaryColor,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            value.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                itemBuilder: (_, __, id) {
                  return SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        Column(children: [
                          Row(children: [
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/DoctorImage.png"),
                                          fit: BoxFit.cover))),
                            ),
                            Flexible(
                              flex: 7,
                              fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  child: getText(
                                                      text: id,
                                                      textStyle:
                                                          aboutYouText1)),
                                            ]),
                                        getText(
                                            text:
                                                'Has finished the self assessment mode \n(Shared on 3rd jul)',
                                            textStyle: subtitle2),
                                      ]),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: getText(
                                            text: 'Yesterday',
                                            textStyle: navlablecolor2),
                                      ),
                                      const SizedBox(
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white,
                                          size: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            horizontalGap(context: context, screenSize: 0.08)
                          ]),
                          const Divider(
                            height: 20,
                            thickness: 0.25,
                            color: Colors.grey,
                          ),
                        ]),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
