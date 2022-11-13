import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physio/constants/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:physio/screens/onboarding/about_you_screen.dart';
import 'package:physio/screens/onboarding/helpus_helpyou.dart';
import 'package:physio/screens/schedule/report_screen8.dart';
import 'package:physio/screens/schedule/session_report.dart';
import 'package:physio/screens/schedule/addAppointment/appointmentTypeScreen.dart';

import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:physio/screens/onboarding/signup_screen1.dart';
import 'package:physio/screens/onboarding/signup_screen2.dart';
import 'package:physio/screens/onboarding/splash_screen2.dart';
import 'package:physio/screens/onboarding/splash_screen.dart';
import 'package:physio/screens/onboarding/profile_selection.dart';
import 'package:physio/screens/onboarding/about_screen.dart';
import 'package:physio/screens/onboarding/auth_screen.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
          unselectedWidgetColor: AppColors.baseTextColor,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.white)),
      title: 'Pro Physio',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      builder: EasyLoading.init(),
      routes: {
        '/schedule': (BuildContext context) => const SessionReport(),
        '/splash': (BuildContext context) => const SplashPage(),
        '/SplashPage2': (BuildContext context) => const SplashPage2(),
        '/selection': (BuildContext context) => const ProfileSelectionPage(),
        '/about': (BuildContext context) => const AboutPage(),
        '/test': (BuildContext context) => const appointmentTypeScreen(),
        '/authPage': (BuildContext context) => const AuthPage(),
        '/authPage3': (BuildContext context) => const AuthPage3(),
        '/signupScreen1': (BuildContext context) => const SignupScreen1(),
        '/reportScreen8': (BuildContext context) => const ReportScreen8(),
        '/helpUsScreen': (BuildContext context) => const HelpUsScreen(),

      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
