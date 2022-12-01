import 'package:flutter/material.dart';
import '../../BaseWidget/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import '../../constants/text_constants.dart';
import '../../utility/gap_between.dart';
import 'model/myreport_date.dart';

class Uploadreportdetail extends StatefulWidget {
  const Uploadreportdetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UploadreportdetailPageState();
  }
}

class _UploadreportdetailPageState extends State<Uploadreportdetail>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

//list of date
  List<DateCard> reportvaldetail = List.generate(
    dateval.length,
    (index) => DateCard(
      image: dateval[index]["image"],
      title: dateval[index]["title"],
      subtext: dateval[index]["subtext"],
      doctorname: dateval[index]["doctorname"],
      date: dateval[index]["date"],
    ),
  );

  //list of doctor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBGcolor,
        body: SingleChildScrollView(
            // shrinkWrap: true,
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        getBackIconButton(context: context),
                        const Text(
                          "${Strings.UPLOAD} ${Strings.REPORTS}",
                          style: profilefieldtextStyle,
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03,
                            right: MediaQuery.of(context).size.width * 0.03,

                            // Padding(
                            //     padding: EdgeInsets.only(
                          ),
                          child: ListView.builder(
                              itemCount: reportvaldetail.length,
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 0.0),
                              itemBuilder: (context, index) {
                                return uploadListPage(index);
                              })),
                    )
                  ])),
          verticalGap(context: context, screenSize: 0.02),
          GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             const Reportdetail()));
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0Xff007CE2)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        color: AppColors.blueColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text("${Strings.UPLOAD} ${Strings.REPORTS}",
                          textAlign: TextAlign.center, style: bluetext1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.02),
          GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             const Reportdetail()));
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0Xff007CE2)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.blueColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(Strings.TAKE_PICTURE,
                          textAlign: TextAlign.center, style: bluetext1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          verticalGap(context: context, screenSize: 0.02),
        ])));
  }

  uploadListPage(int index) {
    return Card(
        color: const Color(0xff1C1C1E),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: IntrinsicHeight(
              child: Row(children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  reportvaldetail[index].image,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportvaldetail[index].title,
                    style: profilefieldtextStyle,
                  ),
                  Text(
                    reportvaldetail[index].subtext,
                    style: iconlablecolor,
                  ),
                  Text(
                    reportvaldetail[index].doctorname,
                    style: bluetext,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reportvaldetail[index].date,
                    style: datefieldtextStyle,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const Uploadreportdetail()));
                          });
                        }),
                  )
                ],
              ),
            ),
          ])),
        ));
  }
}
