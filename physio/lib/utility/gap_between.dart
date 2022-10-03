import 'package:flutter/material.dart';

verticalGap({required BuildContext context, required double screenSize}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * screenSize,
  );
}

horizontalGap({required BuildContext context, required double screenSize}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * screenSize,
  );
}
