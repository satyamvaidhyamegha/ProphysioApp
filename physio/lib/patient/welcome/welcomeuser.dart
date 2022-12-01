// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio/patient/welcome/bottomtab/home/home_page.dart';
import '../../constants/colors.dart';
import '../../constants/string.dart';
import 'bottomtab/home/Appointment/appointmentdetail.dart';
import 'bottomtab/home/mentalhealth.dart';
import 'bottomtab/mycare_page.dart';
import 'bottomtab/my doctor/mydoc_page.dart';

class Welcomeuser extends StatefulWidget {
  const Welcomeuser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WelcomeuserPageState();
  }
}

class _WelcomeuserPageState extends State<Welcomeuser>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int _currentIndex = 0;

  
  final List<Widget> _children = [
    HomePage(),
    MycarePage(),
    Mydoc(),
    Appointmentdetail(),
    Mentalhealthdetail(),
  ];

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        child: Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.kBGcolor,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(height: 2, fontSize: 12),
              unselectedLabelStyle: TextStyle(fontSize: 12, height: 2),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                    label: Strings.HOME),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.child,
                      size: 20,
                    ),
                    label: "${Strings.MY} ${Strings.CARE}"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.userDoctor, size: 20),
                    label: "${Strings.MY} ${Strings.DOC}"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail_rounded, size: 20),
                    label: Strings.MESSAGE),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_rounded, size: 20),
                    label: Strings.EXPLORE),
              ],
              fixedColor: Color(0xff0A84FF),
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
