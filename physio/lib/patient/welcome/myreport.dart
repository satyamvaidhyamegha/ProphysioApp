// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:physio/patient/welcome/model/myreport_doctor.dart';

import '../../BaseWidget/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/text_constants.dart';
import '../../utility/gap_between.dart';
import '../../utility/navigation.dart';
import 'model/myreport_date.dart';
import 'uploadedreport.dart';

class Reportdetail extends StatefulWidget {
  const Reportdetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReportdetailPageState();
  }
}

class _ReportdetailPageState extends State<Reportdetail>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  bool _value = false;
  List<String> list = [
    "Fully Personalised",
    "Real Time Tracking",
    "Deep Health Insights",
    "360 Degree Approach"
  ];
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

  List<DoctorCard> doctorvaldetail = List.generate(
    doctorCardval.length,
    (index) => DoctorCard(
      name: doctorCardval[index]["name"],
      image: doctorCardval[index]["image"],
      title: doctorCardval[index]["title"],
      subtext: doctorCardval[index]["subtext"],
      doctorname: doctorCardval[index]["doctorname"],
      date: doctorCardval[index]["date"],
    ),
  );

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  doNavigate(route: const Uploadreportdetail(), context: context);
                },
                child: Text(
                  "Upload Reports",
                  style: profilefieldtextStyle.copyWith(
                      color: AppColors.blueColor, fontSize: 18),
                )),
            const Icon(
              Icons.file_upload_outlined,
              color: AppColors.blueColor,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: AppColors.kBGcolor,
          leading: getBackIconButton(context: context),
          title: const Text(
            "My Reports",
            style: profilefieldtextStyle,
          ),
        ),
        backgroundColor: AppColors.kBGcolor,
        body: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                border: Border.all(color: Color(0xff007CE2)),
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: 'Date',
                ),
                Tab(
                  text: 'Doctor',
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.79,
            child: TabBarView(controller: _tabController, children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: ListView.builder(
                      itemCount: reportvaldetail.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      itemBuilder: (context, index) {
                        return dateTabPAge(index);
                      })), // for doctor

              ListView.builder(
                  itemCount: doctorvaldetail.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  itemBuilder: (context, index) {
                    return doctorTabPage(index);
                  }),
            ]),
          )
        ]));
  }

  doctorTabPage(int index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(context: context, screenSize: 0.02),
          Card(
              color: const Color(0xff1C1C1E),
              elevation: 3,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IntrinsicHeight(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              doctorvaldetail[index].image,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorvaldetail[index].title,
                                style: profilefieldtextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                doctorvaldetail[index].subtext,
                                style: iconlablecolor,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                reportvaldetail[index].doctorname,
                                style: bluetext,
                              ),
                            ],
                          ),
                        ),
                        Column(children: [
                          Expanded(
                            flex: 2,
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
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
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
                        ])
                      ]))))
        ]);
  }

  dateTabPAge(int index) {
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
