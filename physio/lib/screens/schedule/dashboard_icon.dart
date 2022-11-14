import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/screens/Home/home5.dart';
import 'package:physio/screens/Home/my_earning_home3.dart';
import 'package:physio/screens/onboarding/about_screen.dart';
import 'package:physio/constants/string.dart';
import 'package:physio/screens/Home/home2.dart';

class DashboardIcons extends StatefulWidget {
  const DashboardIcons({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardIconsState();
  }
}

class _DashboardIconsState extends State<DashboardIcons> {
  TabController? tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const Home2(),
      const AboutPage(),
      const AboutPage(),
      const AboutPage(),
      const AboutPage(),
    ];

    return NotificationListener<ScrollNotification>(
        child: Scaffold(
            body: children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.kBGcolor,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(height: 2, fontSize: 14),
              unselectedLabelStyle: const TextStyle(fontSize: 14, height: 2),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      IconlyLight.home,
                      size: 30,
                    ),
                    label: Strings.HOME),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconlyLight.calendar,
                      size: 30,
                    ),
                    label: Strings.SCHEDULE),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.profile, size: 30),
                    label: Strings.PEOPLE),
                BottomNavigationBarItem(
                    icon: Icon(IconlyLight.paper, size: 30),
                    label: Strings.REPORTS),
                BottomNavigationBarItem(
                    icon: Icon(Icons.hub_outlined, size: 30),
                    label: Strings.HUB),
              ],
              fixedColor: const Color(0xff0A84FF),
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
