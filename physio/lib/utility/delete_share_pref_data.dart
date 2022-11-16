import 'package:shared_preferences/shared_preferences.dart';

class ControllSharePrefData {
  void deletedExistingEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userEmail");
    prefs.remove("userId");
    prefs.remove("userToken");
  }
}
