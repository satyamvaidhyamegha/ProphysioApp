import 'package:flutter/material.dart';

doNavigate({required Widget route, required BuildContext context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

doNavigateWithPushName({required Widget route, required BuildContext context}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => route));
}

backFromPreviousScreen({required BuildContext context}) {
  return Navigator.pop(context);
}
