// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/raddi.dart';
import '../../../../../../constants/text_constants.dart';

class SendSmsTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final TextInputAction inputAction;
  final Widget? suffixIcon;
  SendSmsTextField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.inputAction,
    this.suffixIcon,
  });

  @override
  State<SendSmsTextField> createState() => _SendSmsTextFieldState();
}

class _SendSmsTextFieldState extends State<SendSmsTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: TextField(
          textInputAction: TextInputAction.search,
          style: inputfieldtextStyle,
          onChanged: (value) {},
          controller: widget.controller,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: AppColors.PROFILE_CARD_COLOR,
            contentPadding: Margins.basePadding,
            hintText: widget.hintText,
            hintStyle: inputfieldtextStyle,
            filled: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.whiteGrey),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.whiteGrey),
              borderRadius:  BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
