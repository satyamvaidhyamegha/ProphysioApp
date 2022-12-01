// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:physio/BaseWidget/text.dart';
import '../constants/colors.dart';
import '../constants/raddi.dart';
import 'base_image_widget.dart';

class WaterIncDec extends StatefulWidget {
  final VoidCallback minus;
  final VoidCallback add;
  final String imagePath;
  final String incDecText;
  final double height;
  final double weight;

  const WaterIncDec(
      {Key? key,
      required this.minus,
      required this.add,
      required this.imagePath,
      required this.incDecText,
      required this.height,
      required this.weight
      })
      : super(key: key);

  @override
  State<WaterIncDec> createState() => _WaterIncDecState();
}

class _WaterIncDecState extends State<WaterIncDec> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: widget.minus,
            child: new Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffFFFFFF), width: 2)),
              child: const Center(
                child: Icon(Icons.remove, color: Colors.white),
              ),
            )),
        new Container(
            margin: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Padding(
                padding: Margins.marginsK18,
                child: Container(
                  width: widget.height,
                  height: widget.weight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: getAssetImage(imagePath: widget.imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Padding(
                  padding: Margins.marginsK18,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    child: getText(
                        text: '${widget.incDecText}',
                        textStyle: const TextStyle()),
                  ),
                ),
              )
            ])),
        GestureDetector(
            onTap: widget.add,
            child: new Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.textColor, width: 2)),
              child: const Center(
                child: Icon(Icons.add, color: Colors.white),
              ),
            ))
      ],
    );
  }
}
