import 'package:flutter/material.dart';

class SelectItem extends StatelessWidget {
  final SelectDataModel selectDataModel;

  const SelectItem({Key? key, required this.selectDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(selectDataModel.AssetImage),
          Text(
            selectDataModel.desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class SelectDataModel {
  final String AssetImage, desc;
  SelectDataModel(this.AssetImage, this.desc);
}
