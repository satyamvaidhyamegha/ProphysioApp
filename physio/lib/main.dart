import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:physio/constants/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:physio/screens/Reports/placeholder_screen.dart';
import 'package:physio/screens/dashboard/schedule/calendar.dart';
import 'package:physio/screens/onboarding/auth_screen3.dart';
import 'package:physio/screens/onboarding/otp_verification.dart';
import 'package:physio/screens/onboarding/signup_screen1.dart';
import 'package:physio/screens/onboarding/signup_screen2.dart';
import 'package:physio/screens/onboarding/splash_screen2.dart';
import 'package:physio/screens/onboarding/splash_screen.dart';
import 'package:physio/screens/onboarding/profile_selection.dart';
import 'package:physio/screens/onboarding/about_screen.dart';
import 'package:physio/screens/onboarding/auth_screen.dart';
import 'package:physio/screens/dashboard/schedule/calendar.dart';

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
      initialRoute: '/calenderappointmant',
      builder: EasyLoading.init(),
      routes: {
        '/splash': (BuildContext context) => const SplashPage(),
        '/SplashPage2': (BuildContext context) => const SplashPage2(),
        '/selection': (BuildContext context) => const ProfileSelectionPage(),
        '/about': (BuildContext context) => const AboutPage(),
        '/subs': (BuildContext context) => const OtpVerificationPage(),
        '/authPage': (BuildContext context) => const AuthPage(),
        '/authPage3': (BuildContext context) => const AuthPage3(),
        '/signupScreen1': (BuildContext context) => const SignupScreen1(),
        '/signupScreen2': (BuildContext context) => const SignupScreen2(),
        '/calenderappointmant': (BuildContext context) =>
            const Calenderappointmant(),
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
