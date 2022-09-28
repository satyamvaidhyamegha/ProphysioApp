// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

getText(
    {required String text,
    required TextStyle textStyle,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: textStyle,
    overflow: TextOverflow.clip,
    softWrap: true,
    maxLines: 3,
  );
}

buttonText(
    {required String text,
    required TextStyle textStyle,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: textStyle,
    overflow: TextOverflow.clip,
    softWrap: true,
    maxLines: 3,
  );
}
