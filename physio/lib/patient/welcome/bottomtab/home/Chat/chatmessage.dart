// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/welcome/bottomtab/home/Chat/widget/sendText.dart';
import 'package:physio/patient/welcome/model/message.dart';

import '../../../../../BaseWidget/base_image_widget.dart';
import '../../../../../BaseWidget/custom_button.dart';
import '../../../../../BaseWidget/search_widget.dart';
import '../../../../../BaseWidget/text.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/raddi.dart';
import '../../../../../constants/string.dart';
import '../../../../../constants/text_constants.dart';
import '../../../../../utility/gap_between.dart';
import '../../../model/chat.dart';

class ChatMessage extends StatefulWidget {
  final String name;
  ChatMessage({required this.name});

  @override
  State<StatefulWidget> createState() {
    return _ChatMessagePageState();
  }
}

class _ChatMessagePageState extends State<ChatMessage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController smsSend = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  List<Chat> doctorchatval = List.generate(
    doctorchat.length,
    (index) => Chat(
      image: doctorchat[index]["image"],
      name: doctorchat[index]["name"],
      desc: doctorchat[index]["desc"],
      time: doctorchat[index]["time"],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.allDoctorBackGroundColor,
        leading: getBackIconButton(context: context),
        title: getText(
          text: widget.name.isNotEmpty? widget.name.toString(): "Profile Name",
          textStyle: profilefieldtextStyle,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(
            FontAwesomeIcons.video,
            color: Colors.blue,
            size: 15,
          ),
          SizedBox(width: 30),
          Icon(
            FontAwesomeIcons.phone,
            color: Colors.blue,
            size: 15,
          ),
          horizontalGap(context: context, screenSize: 0.05)
        ],
      ),
      backgroundColor: AppColors.allDoctorBackGroundColor,
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                children: [
                  SearchWidget(
                      suffixIcon: Icon(
                        Icons.mic,
                        color: AppColors.profileDividerClr,
                      ),
                      prefixIcon: ImageIcon(
                        getAssetImage(imagePath: ImagePath.SEARCH_ICON),
                        color: AppColors.profileDividerClr,
                      ),
                      controller: searchController,
                      hintText: "Search",
                      inputAction: TextInputAction.search),
                  SizedBox(height: 10),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: getText(
                              text: "NOVEMBER 28, 2019",
                              textStyle: subtitle1,
                            )),
                        verticalGap(context: context, screenSize: 0.02),
                        ListView.builder(
                          itemCount: messages.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                messages[index].messageType == Strings.SENDER
                                    ? 50.0
                                    : 0.0,
                                6,
                                messages[index].messageType == Strings.RECIVER
                                    ? 40.0
                                    : 5.0,
                                6,
                              ),
                              child: Align(
                                alignment: (messages[index].messageType ==
                                        Strings.RECIVER
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: (messages[index].messageType ==
                                            Strings.RECIVER
                                        ? Color(0xff2E2E2E)
                                        : Color(0xff093F40)),
                                  ),
                                  padding: Margins.basePadding,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getText(
                                        text: messages[index].messageContent,
                                        textStyle: labletextStyle,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            getText(
                                              text: messages[index].time,
                                              textStyle: datefieldtextStyle,
                                            ),
                                            Icon(
                                              messages[index].IconData,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        verticalGap(context: context, screenSize: 0.08)
                      ]),
                ],
              ))),
      bottomSheet: Container(
        color: AppColors.allDoctorBackGroundColor,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SendSmsTextField(
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children:  [
                    Icon(
                      Icons.attach_file_rounded,
                      size: 20,
                      color: Color(0xffC4C4C4),
                    ),
                    horizontalGap(context: context, screenSize: 0.05),
                    Icon(
                      Icons.camera_alt_rounded,
                      size: 20,
                      color: Color(0xffC4C4C4),
                    ),
                    horizontalGap(context: context, screenSize: 0.05)
                  ],
                ),
                prefixIcon: Icon(
                  Icons.gif_rounded,
                  size: 25,
                  color: Color(0xffC4C4C4),
                ),
                controller: smsSend,
                hintText: "",
                inputAction: TextInputAction.send),
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 21,
                backgroundColor: AppColors.allDoctorBackGroundColor,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
