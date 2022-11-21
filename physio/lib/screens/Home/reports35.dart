import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class PatientUpdates extends StatefulWidget {
  const PatientUpdates({super.key});

  @override
  State<PatientUpdates> createState() => _PatientUpdatesState();
}

class _PatientUpdatesState extends State<PatientUpdates> {
  @override
  Widget build(BuildContext context) {
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
                      verticalGap(context: context, screenSize: 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          horizontalGap(context: context, screenSize: 0.04),
                          getText(
                              text: 'Patient updates',
                              textStyle: subheadertext1),
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
      body: ListView(
        children: [
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Today', textStyle: share),
              ]),
              verticalGap(context: context, screenSize: 0.04),
              Column(
                children: [
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  verticalGap(context: context, screenSize: 0.02),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    horizontalGap(context: context, screenSize: 0.04),
                    getText(text: '21 march', textStyle: share),
                  ]),
                  verticalGap(context: context, screenSize: 0.04),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                        flex: 1,
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
                              Positioned(
                                  bottom: 0,
                                  right: -4,
                                  top: 30,
                                  child: Icon(
                                    IconlyLight.document,
                                    color: AppColors.routineSubheading,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      horizontalGap(context: context, screenSize: 0.04),
                      Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          getText(
                                              text: "Dr. Rama Desouza",
                                              textStyle: aboutYouText1),
                                        ]),
                                    horizontalGap(
                                        context: context, screenSize: 0.3),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          getText(
                                              text: "9:40 am",
                                              textStyle: navlablecolor2),
                                          horizontalGap(
                                              context: context,
                                              screenSize: 0.01),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                            size: 10.0,
                                          ),
                                        ]),
                                  ],
                                ),
                                verticalGap(context: context, screenSize: 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getText(
                                        text:
                                            'Hope you are feeling better after yesterday’s\nsession. Continue to do…',
                                        textStyle: subtitle2),
                                    horizontalGap(
                                        context: context, screenSize: 0.16)
                                  ],
                                ),
                              ]),
                            ],
                          )),
                      horizontalGap(context: context, screenSize: 0.04)
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 0.25,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
