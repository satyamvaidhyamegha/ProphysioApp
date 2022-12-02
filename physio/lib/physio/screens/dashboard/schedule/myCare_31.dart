import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/physio/screens/dashboard/schedule/mycare_27.dart';
import 'package:physio/utility/gap_between.dart';

class MyCare_31 extends StatefulWidget {
  const MyCare_31({Key? key}) : super(key: key);

  @override
  State<MyCare_31> createState() => _MyCare_31State();
}

class _MyCare_31State extends State<MyCare_31> {
  @override
  int present = 0;
  int perPage = 7;

  final List<String> originalItems = [
    'Prashant. K, M62',
    'Prashant. K, M62',
    'Prashant. K, M62',
    'Prashant. K, M62',
    'Prashant. K, M62',
    'Prashant. K, M62',
    'Prashant. K, M62',
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
      backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(255),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(34, 34, 34, 1),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyCare_27()),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    verticalGap(context: context, screenSize: 0.02),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "Search Patient",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        hintText: 'Search ',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.search,
                              color: Color(0xff9E9EA5)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.filter_2,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalGap(context: context, screenSize: 0.04)
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
            verticalGap(context: context, screenSize: 0.02),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount:
            (present <= originalItems.length) ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          return (index == items.length)
              ? Container(
                  height: 170.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: Margins.basePadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalGap(context: context, screenSize: 0.01),
                        Center(
                            child: TextButton(
                          style: TextButton.styleFrom(
                            primary: AppColors.onlineButtonColor,
                            // foreground
                          ),
                          onPressed: () {},
                          child: getText(text: 'Load More', textStyle: cancel),
                        )),
                        verticalGap(context: context, screenSize: 0.02),
                        horizontalGap(context: context, screenSize: 0.8),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.onlineButtonColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 145.0, vertical: 18.0),
                                shape: const StadiumBorder(),
                              ),
                              child: buttonText(
                                  text: 'Next', textStyle: sessionSubmit),
                              onPressed: () {}),
                        ),
                        verticalGap(context: context, screenSize: 0.02),
                        horizontalGap(context: context, screenSize: 0.04)
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Container(
                    height: 90,
                    child: Column(
                      children: [
                        horizontalGap(context: context, screenSize: 0.04),
                        Container(
                          color: const Color.fromRGBO(31, 34, 30, 1),
                          child: Row(
                            children: [
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
                                        backgroundImage: AssetImage(
                                            "assets/DoctorImage.png"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              horizontalGap(
                                  context: context, screenSize: 0.0001),
                              Flexible(
                                flex: 6,
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        verticalGap(
                                            context: context, screenSize: 0.02),
                                        Expanded(
                                          flex: 6,
                                          child: getText(
                                              text: items[index],
                                              textStyle: aboutYouText1),
                                        ),
                                        horizontalGap(
                                            context: context, screenSize: 0.04),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: const Icon(
                                              IconlyLight.video,
                                              color:
                                                  AppColors.onlineButtonColor,
                                              size: 27,
                                            ),
                                          ),
                                        ),
                                        horizontalGap(
                                            context: context, screenSize: 0.01),
                                      ],
                                    ),
                                    verticalGap(
                                        context: context, screenSize: 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              text: 'Hubli',
                                              textStyle: subtitle1),
                                        ),
                                        horizontalGap(
                                            context: context, screenSize: 0.1),
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
                                                text: 'Hindi , English',
                                                textStyle: subtitle1)),
                                      ],
                                    ),
                                    verticalGap(
                                        context: context, screenSize: 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            child: getText(
                                                text:
                                                    'Last visited - 14th Jan 2022',
                                                textStyle: subtitle1)),
                                      ],
                                    ),
                                    verticalGap(
                                        context: context, screenSize: 0.01),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
