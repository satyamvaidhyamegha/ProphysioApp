import 'package:flutter/material.dart';
import '../constants/text_constants.dart';

class EditField extends StatelessWidget {
  final String labelText;
  final String infoText;
  final IconButton suffixicon;
  bool readOnly;
  VoidCallback? onTap;
  String? initialValue;
  final TextEditingController controller;
  final TextInputType keyboardType;
  int? maxDigit;

  // ignore: non_constant_identifier_names

  EditField(
      {Key? key,
      required this.labelText,
      required this.infoText,
      required this.suffixicon,
      required this.readOnly,
      required this.keyboardType,
      required this.controller,
      this.initialValue,
      this.onTap,
      this.maxDigit
      // ignore: non_constant_identifier_names
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(infoText, style: profilefieldtextStyle),
          const Padding(padding: EdgeInsets.all(0)),
          TextFormField(
            showCursor: true,
            cursorHeight: 20,
            maxLength: maxDigit,
            initialValue: initialValue,
            onTap: onTap,
            readOnly: readOnly,
            keyboardType: keyboardType,
            controller: controller,
            enableSuggestions: false,
            autocorrect: false,
            style: inputtexttextStyle.copyWith(fontWeight: FontWeight.normal),
            cursorColor: Colors.white,
            cursorWidth: 1,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff909090))),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff909090)),
                ),
                labelText: labelText,
                suffixIcon: suffixicon,
                labelStyle: iconlablecolor),
          ),
        ]);
  }
}
