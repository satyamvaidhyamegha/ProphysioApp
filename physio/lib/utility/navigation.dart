import 'package:flutter/material.dart';

doNavigate({required Widget route, required BuildContext context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

doNavigateWithPushName({required Widget route, required BuildContext context}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => route));
}

<<<<<<< HEAD
backFromPreviousScreen({required BuildContext context}) {
=======
backFromPreviousScreen({required BuildContext context, required Icon child}) {
>>>>>>> f7d5c8a25700a04a36978861c75fd5a1020374c5
  return Navigator.pop(context);
}
