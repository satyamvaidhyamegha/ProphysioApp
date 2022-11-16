// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';

class PasswordField extends StatefulWidget {
  PasswordField({
    required this.labelText,
    required this.onSaved,
    required this.validator,
    required this.onFieldSubmitted,
    required this.controller,
  });
  String labelText;

  final FormFieldSetter<String> onSaved;
  final FormFieldValidator validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.white,
      ),
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: Colors.transparent,
      cursorWidth: 0,
      obscureText: _obscureText,
      // maxLength: 8,
      decoration: new InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.black.withOpacity(0.5),
        labelStyle: inputfieldtextStyle,
        labelText: widget.labelText,
        // ignore: prefer_const_constructors
        enabledBorder: (OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyColors),
          borderRadius: Raddi.textFieldBorderRadius,
        )),
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: new Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.whiteGrey,
          ),
        ),
      ),
    );
  }
}
