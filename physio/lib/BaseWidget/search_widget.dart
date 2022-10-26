import 'package:flutter/material.dart';
import 'package:physio/constants/text_constants.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
// ignore: depend_on_referenced_packages

import '../constants/colors.dart';
import '../constants/raddi.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final Widget? prefixIcon;

  final TextInputAction inputAction;

  final Widget? suffixIcon;

  SearchWidget({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.inputAction,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 3,
      child: Center(
        child: TextField(
          textInputAction: TextInputAction.search,
          style: inputfieldtextStyle,
          onChanged: (value) {},
          controller: controller,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: AppColors.SearchBarColor,
            contentPadding: Margins.basePadding,
            hintText: hintText,
            hintStyle: inputfieldtextStyle,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.SearchBarColor),
              borderRadius: Raddi.textFieldBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.SearchBarColor),
              borderRadius: Raddi.textFieldBorderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
