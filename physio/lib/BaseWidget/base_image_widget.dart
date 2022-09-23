import 'package:flutter/material.dart';

getAssetImage({required String imagePath}) {
  return AssetImage(imagePath);
}

getImageAssets(
    {required String imagePath, BoxFit? fit, double? width, double? height}) {
  return Image.asset(
    imagePath,
    fit: BoxFit.fill,
    width: width,
    height: height,
  );
}
