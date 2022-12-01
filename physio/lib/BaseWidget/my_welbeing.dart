import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/base_image_widget.dart';

class MyWelBeingWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final Color textColor;
  final VoidCallback onTap;
  MyWelBeingWidget({required this.imagePath, required this.name, required this.textColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: getAssetImage(imagePath: imagePath),
                    fit: BoxFit.cover),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(name,
                  style: TextStyle(
                    color:textColor,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  )))
        ],
      ),
    );
  }
}
