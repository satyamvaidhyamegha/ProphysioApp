// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;
  final _picker = ImagePicker();
  Future getImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Navigator.pop(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return getImageFromCamera();
  }
}
