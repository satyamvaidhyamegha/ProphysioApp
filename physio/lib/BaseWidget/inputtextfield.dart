
import 'package:flutter/material.dart';
import 'package:physio/constants/colors.dart';
import 'package:physio/constants/raddi.dart';
import 'package:physio/constants/text_constants.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController controller;
  final FormFieldValidator validator;
  FormFieldSetter<String> onSaved;
  ValueChanged<String>? onChanged;

  InputField(
      {Key? key,
        required this.labelText,
        required this.icon,
        required this.onSaved,
        this.inputType,
        this.inputAction,
        required this.controller,
        this.onChanged,
        required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: validator,
      enableSuggestions: false,
      controller: controller,
      autocorrect: false,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          labelText: labelText,
          filled: true,
          fillColor: AppColors.black.withOpacity(0.5),
          labelStyle: inputfieldtextStyle,
          suffixIcon: Icon(
            icon,
            size: 28,
            color: AppColors.whiteGrey,
          ),
          // ignore: prefer_const_constructors
          enabledBorder: (OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColors),
            borderRadius: Raddi.textFieldBorderRadius,
          ))),
    );
  }
}