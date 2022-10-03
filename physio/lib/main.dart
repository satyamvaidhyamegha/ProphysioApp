import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physio/constants/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:physio/screens/onboarding/otp_verification.dart';
import 'package:physio/screens/onboarding/splash_screen2.dart';
import 'package:physio/screens/onboarding/splash_screen.dart';
import 'package:physio/screens/onboarding/profile_selection.dart';
import 'package:physio/screens/onboarding/about_screen.dart';
import 'package:physio/screens/onboarding/auth_screen.dart';
import 'package:physio/screens/onboarding/pro_active';

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
<<<<<<< HEAD
      initialRoute: '/splash',
=======
      initialRoute: '/authPage',
>>>>>>> f7d5c8a25700a04a36978861c75fd5a1020374c5
      builder: EasyLoading.init(),
      routes: {
        '/splash': (BuildContext context) => const SplashPage(),
        '/SplashPage2': (BuildContext context) => const SplashPage2(),
        '/selection': (BuildContext context) => const ProfileSelectionPage(),
        '/about': (BuildContext context) => const AboutPage(),
        '/authPage': (BuildContext context) => const AuthPage(),
        '/otpVerify': (BuildContext context) => const OtpVerificationPage(),
<<<<<<< HEAD
        '/prosactive': (BuildContext context) => const ProActive(),
=======

>>>>>>> f7d5c8a25700a04a36978861c75fd5a1020374c5
        //       '/login': (BuildContext context) => const LoginPage(),
        //     '/detail1': (BuildContext context) => const DetailPage(),
        //     '/welcomeuser': (BuildContext context) => const Welcomeuser(),
        //'/check': (BuildContext context) =>  Routune1(),
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
