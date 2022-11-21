import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  @override
  int present = 0;
  int perPage = 3;

  final List<String> originalItems = [
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
    'Blikimore',
    'StoneWellFo',
    'Simmson',
    'BrightHulk',
    'Bootecia',
    'Spuffyffet',
    'Rozalthiric',
    'Bookman'
  ];
  var items = <String>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(originalItems.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGcolor,
      bottomNavigationBar: SizedBox(
          height: 90,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 146.0, vertical: 20.0),
                      shape: const StadiumBorder(),
                    ),
                    child: buttonText(text: 'Next', textStyle: buttonTextStyle),
                    onPressed: () {}),
                verticalGap(context: context, screenSize: 0.02)
              ])),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160.0),
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
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                              iconSize: 20,
                              onPressed: () {}),
                        ],
                      ),
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
                              hintText: 'Search Patients',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconlyLight.search,
                                      color: Color(0xff9E9EA5))),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.filter_2,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    horizontalGap(context: context, screenSize: 0.02)
                  ],
                ),
                verticalGap(context: context, screenSize: 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(
                        text: '${originalItems.length} patient found',
                        textStyle: share),
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
              ],
            ),
          )),
      body: ListView.builder(
        itemCount:
            (present <= originalItems.length) ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          return (index == items.length)
              ? Container(
                  height: 60.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 41.0,
                    width: 147.0,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: buttonTextStyle,
                      ),
                      child: const Text(
                        "Load More",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          if ((present + perPage) > originalItems.length) {
                            items.addAll(originalItems.getRange(
                                present, originalItems.length));
                          } else {
                            items.addAll(originalItems.getRange(
                                present, present + perPage));
                          }
                          present = present + perPage;
                        });
                      },
                    ),
                  ),
                )
              : Column(children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Radio(
                          value: false,
                          groupValue: selectedIndex != index,
                          onChanged: (value) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
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
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 8,
                          fit: FlexFit.tight,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: getText(
                                          text: items[index],
                                          textStyle: aboutYouText1),
                                    ),
                                    horizontalGap(
                                        context: context, screenSize: 0.01),
                                    Container(
                                      child: getText(
                                          text: "[M]",
                                          textStyle: aboutYouText1),
                                    ),
                                  ],
                                ),
                                verticalGap(
                                    context: context, screenSize: 0.004),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      child: Icon(
                                        IconlyLight.location,
                                        size: 20,
                                        color: AppColors.routineSubheading,
                                      ),
                                    ),
                                    horizontalGap(
                                        context: context, screenSize: 0.01),
                                    SizedBox(
                                      child: getText(
                                          text: 'Hubli', textStyle: subtitle1),
                                    ),
                                    horizontalGap(
                                        context: context, screenSize: 0.02),
                                    const SizedBox(
                                      child: Icon(
                                        IconlyLight.chat,
                                        size: 20,
                                        color: AppColors.routineSubheading,
                                      ),
                                    ),
                                    horizontalGap(
                                        context: context, screenSize: 0.01),
                                    SizedBox(
                                        child: getText(
                                            text: 'English | Hindi',
                                            textStyle: subtitle1)),
                                  ],
                                ),
                                verticalGap(
                                    context: context, screenSize: 0.001),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        child: getText(
                                            text: 'Last visited:14th Jan',
                                            textStyle: subtitle1)),
                                  ],
                                ),
                              ])),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                  child: Icon(
                                    IconlyLight.video,
                                    color: Colors.blue,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                ]);
        },
      ),
    );
  }
}
