import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/style.dart';

Custom_Appbar({
  String? actionButtonText,
  VoidCallback? backPressed,
  VoidCallback? skipButtonPressed,
}) {
  return AppBar(
    elevation: 0.0,
    toolbarHeight: 80,
    backgroundColor: AppColors.BACKGROUND_COLOR,
    leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: backPressed),
    actions: [
      TextButton(
          onPressed: skipButtonPressed,
          child: getText(
            text: actionButtonText!,
            textStyle: BaseStyles.signInText,
          ))
    ],
  );
}
