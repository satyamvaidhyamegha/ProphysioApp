import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/utility/gap_between.dart';

class Home5 extends StatefulWidget {
  const Home5({super.key});

  @override
  State<Home5> createState() => _Home5State();
}

class _Home5State extends State<Home5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: AppColors.routineCardColor1,
          child: Column(children: [
            verticalGap(context: context, screenSize: 0.06),
            Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                    onPressed: () {}),
                horizontalGap(context: context, screenSize: 0.5),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blueColor, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: const Icon(
                      Icons.more_horiz_outlined,
                      size: 16,
                      color: AppColors.blueColor,
                    ),
                  ),
                  onTap: () {},
                ),
                horizontalGap(context: context, screenSize: 0.04),
                IconButton(
                    icon: const Icon(
                      IconlyLight.upload,
                      color: Colors.blue,
                    ),
                    iconSize: 20,
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      CupertinoIcons.link,
                      color: Colors.blue,
                    ),
                    iconSize: 20,
                    onPressed: () {}),
              ],
            ),
            Row(children: [
              Row(
                children: [
                  horizontalGap(context: context, screenSize: 0.04),
                  Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/DoctorImage.png"),
                              fit: BoxFit.cover))),
                ],
              ),
              horizontalGap(context: context, screenSize: 0.02),
              Column(children: [
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(text: 'Dr. Gayatri', textStyle: summarySubtitile)
                  ],
                ),
                verticalGap(context: context, screenSize: 0.01),
                Row(
                  children: [
                    horizontalGap(context: context, screenSize: 0.02),
                    getText(text: 'Ortho Surgeon', textStyle: subtitle2)
                  ],
                ),
              ])
            ])
          ]),
        ),
      ),
      backgroundColor: AppColors.kBGcolor,
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.calenderColor2,
        body: SingleChildScrollView(
            child: Column(children: [
          verticalGap(context: context, screenSize: 0.03),
          Column(children: [
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'Certifications', textStyle: profilefieldtextStyle3)
              ],
            ),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                SizedBox(
                  height: 119,
                  width: 353,
                  child: Card(
                    shadowColor: Colors.black,
                    color: AppColors.calenderColor2,
                    child: Row(
                      children: [
                        horizontalGap(context: context, screenSize: 0.04),
                        Container(
                            height: 87,
                            width: 85,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/certificate.png"),
                                    fit: BoxFit.cover))),
                        Column(
                          children: [
                            verticalGap(context: context, screenSize: 0.03),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.002,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                  right:
                                      MediaQuery.of(context).size.width * 0.15),
                              child: getText(
                                  text: 'Surgeon', textStyle: sessionSubmit),
                            ),
                            verticalGap(context: context, screenSize: 0.008),
                            Row(
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.004),
                                getText(
                                    text: 'London Medical',
                                    textStyle: aboutYouText1)
                              ],
                            ),
                            verticalGap(context: context, screenSize: 0.004),
                            Row(
                              children: [
                                horizontalGap(
                                    context: context, screenSize: 0.07),
                                getText(
                                    text: 'Aug 2006 London, England',
                                    textStyle: summaryTitleText)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Contact info', textStyle: profilefieldtextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Mobile No.', textStyle: labletextStyle2)
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: '+9087635472', textStyle: labletextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Email', textStyle: labletextStyle2)
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Pramod@hotmail.com.', textStyle: labletextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Website.', textStyle: labletextStyle2)
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'Jay.com', textStyle: labletextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.03),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(text: 'About', textStyle: profilefieldtextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.01),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text:
                        'Dr jay is a cardiologist in Bangalore, associated with Rana clinic. \nHe has been practicing for more than 20yr.',
                    textStyle: summaryTitleText)
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                getText(
                    text: 'Work Experience', textStyle: profilefieldtextStyle3)
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Container(
                    height: 87,
                    width: 85,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/certificate.png"),
                            fit: BoxFit.cover))),
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.14),
                        child: getText(
                            text: 'Consulting Doctor',
                            textStyle: sessionSubmit),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.3),
                        child: getText(
                            text: 'Kiara Clinic', textStyle: aboutYouText1),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.15),
                        child: getText(
                            text: 'Feb 2014 - Sep 2018 2 Yrs',
                            textStyle: summaryTitleText),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.2),
                        child: getText(
                            text: 'Hyderabad, Telangana',
                            textStyle: summaryTitleText),
                      )
                    ]),
                  ],
                ),
              ],
            ),
            verticalGap(context: context, screenSize: 0.02),
            Row(
              children: [
                horizontalGap(context: context, screenSize: 0.04),
                Container(
                    height: 87,
                    width: 85,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/certificate.png"),
                            fit: BoxFit.cover))),
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.14),
                        child: getText(
                            text: 'Consulting Doctor',
                            textStyle: sessionSubmit),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.3),
                        child: getText(
                            text: 'Kiara Clinic', textStyle: aboutYouText1),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.15),
                        child: getText(
                            text: 'Feb 2014 - Sep 2018 2 Yrs',
                            textStyle: summaryTitleText),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.2),
                        child: getText(
                            text: 'Hyderabad, Telangana',
                            textStyle: summaryTitleText),
                      )
                    ]),
                  ],
                ),
              ],
            ),
          ])
        ])));
  }
}
