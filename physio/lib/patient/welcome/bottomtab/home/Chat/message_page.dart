// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:physio/patient/welcome/model/message.dart';
import '../../../../../BaseWidget/base_image_widget.dart';
import '../../../../../BaseWidget/search_widget.dart';
import '../../../../../BaseWidget/text.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/string.dart';
import '../../../../../constants/text_constants.dart';
import '../../../../../utility/gap_between.dart';
import 'chatmessage.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MMessagePageState();
  }
}

class _MMessagePageState extends State<Message> {
  final TextEditingController searchController = TextEditingController();

  bool itSelected = false;
  bool engSelected = false;

  @override
  void initState() {
    setState(() {});

    super.initState();
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
    var editingController;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.allDoctorBackGroundColor,
          title: getText(
            text: Strings.EDIT,
            textStyle: bluetext1,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                image: getAssetImage(
                  imagePath: ImagePath.OTP_SCREEN_IMAGE,
                ),
                color: Color(0xff007CE2),
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.allDoctorBackGroundColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalGap(context: context, screenSize: 0.01),
                      getText(
                        text: Strings.MESSAGE,
                        textStyle: subheadertext1,
                      ),
                      verticalGap(context: context, screenSize: 0.01),
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
                      verticalGap(context: context, screenSize: 0.01),
                      ListView.builder(
                          padding: EdgeInsets.zero,

                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: doctorchatval.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             ChatMessage(name: doctorchatval[index].name.toString(),)));
                              },
                              child: Card(
                                  color: AppColors.allDoctorBackGroundColor,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                  onTap: () {
                                                    itSelected = true;
                                                    engSelected = false;
                                                    setState(() {});
                                                  },
                                                  child: itSelected
                                                      ? const Icon(Icons.circle,
                                                          size: 10,
                                                          color:
                                                              Color(0xff0A84FF))
                                                      : Container(),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Container(
                                                    height: 42,
                                                    width: 42,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image:
                                                                getAssetImage(
                                                              imagePath:
                                                                  doctorchatval[
                                                                          index]
                                                                      .image,
                                                            ),
                                                            fit: BoxFit.fill))),
                                              ),
                                              horizontalGap(
                                                  context: context,
                                                  screenSize: 0.03),
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    getText(
                                                      text: doctorchatval[index]
                                                          .name,
                                                      textStyle:
                                                          profilefieldtextStyle,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    getText(
                                                      text: doctorchatval[index]
                                                          .desc,
                                                      textStyle: info1style,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  getText(
                                                      text: doctorchatval[index]
                                                          .time,
                                                      textStyle: info1style),
                                                  const Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 15,
                                                      color: Colors.grey),
                                                ],
                                              ),
                                            ]),
                                        const Divider(
                                            color: Colors.grey, thickness: 0.4),
                                      ])),
                            );
                          }),
                      SizedBox(
                        height: 10,
                      ),
                    ]))));
  }
}
