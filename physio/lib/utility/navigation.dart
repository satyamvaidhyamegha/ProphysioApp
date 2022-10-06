import 'package:flutter/material.dart';

doNavigate({required Widget route, required BuildContext context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

doNavigateWithPushName({required Widget route, required BuildContext context}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => route));
}

backFromPreviousScreen({required BuildContext context}) {
  backFromPreviousScreen({required BuildContext context, required Icon child}) {
    return Navigator.pop(context);
  }
}
